//quick and dirty cell counting using Process Find Maxima

/* 
***  IMPORTANT  ***
if using a legend, open a picture -> Process -> Find Maxima -> use 21, and check "preview"
manually count the points found in the legend and SUBTRACT this number from all subsequent numbers
*/


//input directory, and files to be called etc...
input = getDirectory("Choose a Directory to Analyze");
filename = File.nameWithoutExtension;
list = getFileList(input);
//results .csv file name
name = "Maxima_Count"

//cell counting function using find Maxima process.
//saves each image as *_Maxima.jpg....for some reason filename returns extensions
function countMaxima(input, filename) {
	open(input + filename);
	run("Find Maxima...", "prominence=21 exclude output=[Maxima Within Tolerance]");
	saveAs("jpg", input + filename + "_Maxima");
	close();
	run("Find Maxima...", "prominence=21 exclude output=Count");
	close();
}
//imageJ is dumb and cant count properly, tell it to straighten up with batchmode
setBatchMode(true);

//open all files in directory and call count maxima function
for (i = 0; i < list.length; i++) {
	countMaxima(input, list[i]);	
}

//save results in order as they appeared in a single csv file in the input directory
saveAs("results", input + name + ".csv");

//remind imageJ that its okay to be dumb again
setBatchMode(false);


