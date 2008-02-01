From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 1 Feb 2008 06:55:16 -0800
Subject: [Buildroot] [buildroot 0001588]: undefined reference to fmsub when
	using ppc405 + soft-float + c++
Message-ID: <8887a536eacdcd373da3982051083546@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1588 
====================================================================== 
Reported By:                glikely
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1588
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   crash
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-12-2007 20:36 PST
Last Modified:              02-01-2008 06:55 PST
====================================================================== 
Summary:                    undefined reference to fmsub when using ppc405 +
soft-float + c++
Description: 
C++ seems to be brpken on ppc405 toolchains using softfloat and uClibc. 
Issue seen on current buildroot top-of-tree.

I see the error on the iperf configure script.  Here's the relevant error
message:

configure:1936: checking for C++ compiler default output file name
configure:1939:
/home/grant/hacking/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-g++
-Os -pipe 
-I/home/grant/hacking/buildroot/build_powerpc/staging_dir/usr/include
-I/home/grant/hacking/buildroot/build_powerpc/staging_dir/include
--sysroot=/home/grant/hacking/buildroot/build_powerpc/staging_dir/
-isysroot /home/grant/hacking/buildroot/build_powerpc/staging_dir
-mtune=405 -msoft-float    conftest.cc  >&5
/home/grant/hacking/buildroot/build_powerpc/staging_dir/usr/bin-ccache/../lib/gcc/powerpc-linux-uclibc/4.2.1/../../../../powerpc-linux-uclibc/lib/libgcc_s.so:
undefined reference to `fmsub'
collect2: ld returned 1 exit status
configure:1942: $? = 1
configure: failed program was:
| /* confdefs.h.  */
|
| #define PACKAGE_NAME "Iperf"
| #define PACKAGE_TARNAME "iperf"
| #define PACKAGE_VERSION "2.0.2"
| #define PACKAGE_STRING "Iperf 2.0.2"
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "iperf"
| #define VERSION "2.0.2"
| /* end confdefs.h.  */
|
| int
| main ()
| {
|
|   ;
|   return 0;
| }
configure:1981: error: C++ compiler cannot create executables
See `config.log' for more details.

I've attached my .config file
====================================================================== 

---------------------------------------------------------------------- 
 vanokuten - 11-16-07 02:53  
---------------------------------------------------------------------- 
Do you have a fix for it? 

---------------------------------------------------------------------- 
 b5331 - 01-31-08 05:48  
---------------------------------------------------------------------- 
I just want to confirm this problem. I have tested C++ gcc-4.2.1 compiler
with both uClibc-0.9.29 and uClibc-0.9.28.3, they both have the same
problem: undefined reference to `fmsub'. It seams that uClibc is not
compatible with the latest versions of the C++ compiler.
I am quite surprised to the fact that this issue has the normal level of
priority, when such a basic tool as the compiler can not be used.

 

---------------------------------------------------------------------- 
 b5331 - 02-01-08 06:55  
---------------------------------------------------------------------- 
Hi guys, it seams that I have a solution for this problem. I am not sure
that it is hundred percents correct , but at least it works for me.
I am using Freescale  MPC8540 microchip.
The gcc/config/rs6000/darwin-ldouble.c file contents the fmsub function.
This file was not included in  previous versions of gcc in the project for
this type of processors, because it mainly encloses functions not relevant
for 32-bit processors. Having difficulty to exclude this file from the
project, I have disabled it by moving the conditional compiling directive.
After that I was able to build application with no error message from the
linker.

During runtime the application requests the libgcc_s_nof.so.1 library. So
far I could not understand why it happens and where the libgcc_s_nof.so.1
tag is located. As an intermediate solution I have added the link:
libgcc_s_nof.so.1 -> libgcc_s.so.1 in the target directory.

The proposed '920-soft-float.patch' patch is attached. Any comments are
welcome 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-12-07 20:36  glikely        New Issue                                    
11-12-07 20:36  glikely        Status                   new => assigned     
11-12-07 20:36  glikely        Assigned To               => buildroot       
11-12-07 20:36  glikely        File Added: .config                          
11-16-07 02:53  vanokuten      Note Added: 0002933                          
01-30-08 06:17  b5331          Issue Monitored: b5331                       
01-30-08 06:36  b5331          Note Added: 0003604                          
01-30-08 06:36  b5331          Note Added: 0003609                          
01-30-08 06:37  b5331          Note Deleted: 0003609                        
01-31-08 05:48  b5331          Note Edited: 0003604                         
02-01-08 06:55  b5331          File Added: 920-soft-float.patch                 
  
02-01-08 06:55  b5331          Note Added: 0003634                          
======================================================================
