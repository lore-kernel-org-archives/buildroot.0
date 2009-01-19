From: Andreas Kuehn <kuehn@gin.de>
Date: Mon, 19 Jan 2009 16:03:26 +0100
Subject: [Buildroot] strace buggy or not?
Message-ID: <gl24nv$38r$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi out there!

I had some trouble using strace as debugging tool. On my system it
creates quite odd information. Running the following testprogram creates
this summary report.

# strace -c fcopy
What file do you want to copy? dcc.c
What file name do you want for the copy? x
% time     seconds  usecs/call     calls    errors syscall
------ ----------- ----------- --------- --------- ----------------
   nan    0.000000           0         4           read
   nan    0.000000           0         3           write
   nan    0.000000           0         2           open
   nan    0.000000           0         2           close
   nan    0.000000           0         1           execve
   nan    0.000000           0         4           brk
   nan    0.000000           0         4         2 ioctl
------ ----------- ----------- --------- --------- ----------------
100.00    0.000000                    20         2 total
#


And here is the "mysterious" code:

/* Copy a file */
#include <stdio.h>

void main()
{
   int ch; /* input character */
   char inputfile[80], outputfile[80];
   FILE *fpin, *fpout; /* input & output struct pointers */

   /* get the filenames from the user */
   printf("What file do you want to copy? ");
   scanf("%s", inputfile);
   printf("What file name do you want for the copy? ");
   scanf("%s", outputfile);

   /* open the files */
   fpin = fopen(inputfile, "r");
   fpout = fopen(outputfile, "w");

   /* copy the file char by char */
   while( (ch = fgetc(fpin)) != EOF)
   {
      fputc(ch, fpout);
   }

   /* close the files */
   fclose(fpin);
   fclose(fpout);
}

I did this because I thought there is some problem with the fopen or
ioctl call but all testet applications are running fine. Actually, I
felt like hunting an artefact. Other applications result with many more
error entries in the summary report.

My system is buildroot (svn:24878) on an at91sam9263 custom board.


-- 
 aKuehn

--------------> Never trust a computer you can't lift. -- Stan Masor
