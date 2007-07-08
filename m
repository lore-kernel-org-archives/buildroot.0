From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 8 Jul 2007 04:40:24 -0700
Subject: [Buildroot] [buildroot 0001043]: ada support for buildroot
Message-ID: <eeaa2c36fb077abdede3efa80d622676@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1043 
====================================================================== 
Reported By:                belandor
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1043
Category:                   New Features
Reproducibility:            N/A
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-21-2006 06:37 PDT
Last Modified:              07-08-2007 04:40 PDT
====================================================================== 
Summary:                    ada support for buildroot
Description: 
I have included the option to add --enable-languages=ada when compiling
gcc.

The problem is though, that gcc-4.1.1 needs a patch to compile - namely
the files
s-wchcon.adb and s-wchcon.ads need to be replaced with the SVN versions.
gcc-SVN should compile fine though.
I haven't tried compiling Ada support for older gcc versions.

I got this to compile targetting arm-linux-uclibcgnueabi. However,
building the target compiler supporting ada did not work (Configure chokes
over the wrong gmp.h version).

Any comments?

====================================================================== 

---------------------------------------------------------------------- 
 belandor - 09-26-06 18:26  
---------------------------------------------------------------------- 
the issue with the failing target compiler is due to a bug in gcc-4.1.1:
when running, the cross-compiler emits a warning like this:

<built-in>:0: warning: 'const' attribute directive ignored
<built-in>:0: warning: 'nothrow' attribute directive ignored

When configure for gcc-4.1.1-target tests for ada capabilities (line
2145), it checks for creation of conftest.o and makes sure, that the call
did not issue any output. - Well, as output is issued the test fails, even
though the compiler is actually functional.

The gmp.h warning is misleading - it's actually the last error message
produced in config.log, but unrelated to ada language support...

This is fixed in the gcc-4.1.2 release branch. - So full Ada support
should probably wait for that release. 

---------------------------------------------------------------------- 
 bernhardf - 09-30-06 14:02  
---------------------------------------------------------------------- 
I'm thinking about adding fortran support, so i'll need gmp and mpfr too,
fwiw.
Stubs for the latter two are already in place but not yet activated since
they are incomplete at the moment. Does ada too require gmp? 

---------------------------------------------------------------------- 
 belandor - 10-01-06 04:49  
---------------------------------------------------------------------- 
Ada doesn't need gmp, no. As I said, cross-compiler can be built and works
(more or less) 

---------------------------------------------------------------------- 
 bernhardf - 07-08-07 04:40  
---------------------------------------------------------------------- 
Several months ago fortran support was added. Can you try adding ada for
4.2.0 (and perhaps 4.1.2/4.1.3) both natively and as a cross-compiler and
check if both do work properly? Run "make -k check" on the target and
attach all .sum files here, please. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-21-06 06:37  belandor       New Issue                                    
09-21-06 06:37  belandor       Status                   new => assigned     
09-21-06 06:37  belandor       Assigned To               => uClibc          
09-21-06 22:05  belandor       Issue Monitored: belandor                    
09-26-06 18:26  belandor       Note Added: 0001646                          
09-30-06 14:02  bernhardf      Note Added: 0001671                          
10-01-06 04:49  belandor       Note Added: 0001680                          
02-12-07 05:34  vapier         Assigned To              uClibc => buildroot 
07-08-07 04:40  bernhardf      Note Added: 0002576                          
======================================================================
