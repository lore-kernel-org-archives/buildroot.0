From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 27 Sep 2008 03:15:59 -0700
Subject: [Buildroot] [buildroot 0004384]: GCC 4.3.1 fails with cannot
	compute suffix of object files
Message-ID: <a4bdd924ca07aed27f4c7f9adb2ace3b@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4384 
====================================================================== 
Reported By:                kreuters
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4384
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-31-2008 04:57 PDT
Last Modified:              09-27-2008 03:15 PDT
====================================================================== 
Summary:                    GCC 4.3.1 fails with cannot compute suffix of object
files
Description: 
from buildroot-20080731.tar.bz, only things selected are gcc 4.3.1 and
EABI.


checking for arm-linux-uclibcgnueabi-gcc... 
/home/dikkie/Documents/dns323/uclibc/buildroot/toolchain_build_arm/gcc-4.3.1-initial/./gcc/xgcc
-B/home/dikkie/Documents/dns323/uclibc/buildroot/toolchain_build_arm/gcc-4.3.1-initial/./gcc/
-B/home/dikkie/Documents/dns323/uclibc/buildroot/build_arm/staging_dir/usr/arm-linux-uclibcgnueabi/bin/
-B/home/dikkie/Documents/dns323/uclibc/buildroot/build_arm/staging_dir/usr/arm-linux-uclibcgnueabi/lib/
-isystem
/home/dikkie/Documents/dns323/uclibc/buildroot/build_arm/staging_dir/usr/arm-linux-uclibcgnueabi/include
-isystem
/home/dikkie/Documents/dns323/uclibc/buildroot/build_arm/staging_dir/usr/arm-linux-uclibcgnueabi/sys-include

checking for suffix of object files... configure: error: cannot compute
suffix of object files: cannot compile

====================================================================== 

---------------------------------------------------------------------- 
 antezedens - 09-10-08 00:30  
---------------------------------------------------------------------- 
For those eager to get gcc-4.3.1 running. I've found out that gcc does not
find the shared objects of two libs. The attached patch points gcc to the
right directories. It is just a quick fix but it should do until there is
an official bugfix. This is what to do:

make   <= will stop with the above error

cd buildroot/toolchain_build_ARCH

patch -p2 < gcc-4.3.1-compile.patch
rm -Rf gcc-4.3.1-initial

make   <= should compile 

---------------------------------------------------------------------- 
 haizaar - 09-10-08 04:27  
---------------------------------------------------------------------- 
Issuing 'export
LD_LIBRARY_PATH=$PWD/toolchain_build_arm/mpfr/lib:$LD_LIBRARY_PATH' from
the top of your buildroot tree makes build happy. 

---------------------------------------------------------------------- 
 jcurl - 09-27-08 03:15  
---------------------------------------------------------------------- 
Using buildroot from SVN 23530. Working towards architecture i586 with
uClibC snapshot as of today. The patch didn't work (no change in
behaviour) after modifying the file by hand.

The export LD_LIBRARY_PATH also needed to include "gmp" in the path. This
makes it go further, but still doesn't work all the way.
export
LD_LIBRARY_PATH=$PWD/toolchain_build_i586/mpfr/lib:$PWD/toolchain_build_i586/gmp/lib:$LD_LIBRARY_PATH.

You need to at least run make from "gcc-4.3.1-initial", as running from
the root it detects LD_LIBRARY_PATH is based on the current path and says
that won't work.

The compilation dies when compiling mudflap at the same stage:
checking for i586-linux-uclibc-gcc... (xgcc here)
checking for C compiler default output filename... configure: error: C
compiler cannot create executables

Looking@the mudflap config.log, we see:
$ less i586-linux-uclibc/libmudflap/config.log
configure:2468: checking for C compiler default output file name
configure:2471:
/home/jcurl/buildroot/toolchain_build_i586/gcc-4.3.1-initial/./gcc/xgcc
-B/home/jcurl/buildroot/toolchain_build_i586/gcc-4.3.1-initial/./gcc/
-B/opt/gcc431-uclibc/usr/i586-linux-uclibc/bin/
-B/opt/gcc431-uclibc/usr/i586-linux-uclibc/lib/ -isystem
/opt/gcc431-uclibc/usr/i586-linux-uclibc/include -isystem
/opt/gcc431-uclibc/usr/i586-linux-uclibc/sys-include -g -Os   conftest.c 
>&5
/opt/gcc431-uclibc/usr/bin/i586-linux-uclibc-ld: crt1.o: No such file: No
such file or directory
collect2: ld returned 1 exit status
configure:2474: $? = 1
configure: failed program was:
| /* confdefs.h.  */
| 
| #define PACKAGE_NAME "libmudflap"
| #define PACKAGE_TARNAME "libmudflap"
| #define PACKAGE_VERSION "1.0"
| #define PACKAGE_STRING "libmudflap 1.0"
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "libmudflap"
| #define VERSION "1.0"
| /* end confdefs.h.  */
| 
| int
| main ()
| {
| 
|   ;
|   return 0;
| }
configure:2513: error: C compiler cannot create executables
See `config.log' for more details. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-31-08 04:57  kreuters       New Issue                                    
07-31-08 04:57  kreuters       Status                   new => assigned     
07-31-08 04:57  kreuters       Assigned To               => buildroot       
09-03-08 09:05  haizaar        Issue Monitored: haizaar                     
09-10-08 00:29  antezedens     File Added: gcc-4.3.1-compile.patch              
     
09-10-08 00:30  antezedens     Note Added: 0011294                          
09-10-08 04:27  haizaar        Note Added: 0011304                          
09-27-08 03:06  jcurl          Issue Monitored: jcurl                       
09-27-08 03:15  jcurl          Note Added: 0012274                          
======================================================================
