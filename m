From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 26 Jul 2007 17:22:24 -0700
Subject: [Buildroot] [buildroot 0001446]: Buildroot compilation is broken
	for SH4 architecture
Message-ID: <1a495f4b01c956470e1b2c99486cd404@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1446 
====================================================================== 
Reported By:                fgretief
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1446
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-26-2007 13:57 PDT
Last Modified:              07-26-2007 17:22 PDT
====================================================================== 
Summary:                    Buildroot compilation is broken for SH4 architecture
Description: 
I am unable to do a build for the SH4 architecture.

Steps to reproduce:
  - do a clean checkout/update (rev 19264)
      svn://uclibc.org/trunk/buildroot
  - rm .config*             (just to make sure)
  - make menuconfig
      Select superh and SH4 architecture
      Select uClibc 0.9.29  (instead of the snapshot)
      Select cramfs as the root fs
  - make

...
/bin/sh
/home/fgretief/src/buildroot/toolchain_build_sh4/gcc-4.2.1/gcc/../move-if-change
tmp-macro_list macro_list
echo timestamp > s-macro_list
The directory that should contain system headers does not exist:
 
/home/fgretief/src/buildroot/toolchain_build_sh4/uClibc_dev//usr/include
make[2]: *** [stmp-fixinc] Error 1
make[2]: Leaving directory
`/home/fgretief/src/buildroot/toolchain_build_sh4/gcc-4.2.1-initial/gcc'
make[1]: *** [all-gcc] Error 2
make[1]: Leaving directory
`/home/fgretief/src/buildroot/toolchain_build_sh4/gcc-4.2.1-initial'
make: ***
[/home/fgretief/src/buildroot/toolchain_build_sh4/gcc-4.2.1-initial/.compiled]
Error 2


Note: 
  The binutils were never build. It started immediately with GCC-4.2.1

Directory listing after build:
-------------------------------------------------------------
~/src/buildroot$ ls -l
total 72
-rw-rw-r--   1 fgretief fgretief 19191 Jul 24 21:30 Config.in
-rw-rw-r--   1 fgretief fgretief 12072 Jul 26 22:07 Makefile
drwxrwxr-x   3 fgretief fgretief  4096 Jul 26 22:13 binaries
drwxrwxr-x   3 fgretief fgretief  4096 Jul 26 22:13 build_sh4
drwxrwxr-x   2 fgretief fgretief  4096 Jul 25 22:50 dl
drwxrwxr-x   4 fgretief fgretief  4096 Jul 22 13:08 docs
drwxrwxr-x 212 fgretief fgretief  4096 Jul 24 21:30 package
drwxrwxr-x   4 fgretief fgretief  4096 Jul 22 13:07 project
drwxrwxr-x   3 fgretief fgretief  4096 Jul 26 22:13 project_build_sh4
drwxrwxr-x  20 fgretief fgretief  4096 Jul 22 13:07 target
drwxrwxr-x  14 fgretief fgretief  4096 Jul 22 13:07 toolchain
drwxrwxr-x   4 fgretief fgretief  4096 Jul 26 22:14 toolchain_build_sh4

~/src/buildroot$ ls -l build_sh4/
total 4
drwxrwxr-x 5 fgretief fgretief 4096 Jul 26 22:13 staging_dir

~/src/buildroot$ ls -l project_build_sh4/
total 4
drwxrwxr-x 3 fgretief fgretief 4096 Jul 26 22:13 uclibc

~/src/buildroot$ ls -l toolchain_build_sh4/
total 8
drwxrwxr-x 25 fgretief fgretief 4096 Jul 26 22:14 gcc-4.2.1
drwxrwxr-x  9 fgretief fgretief 4096 Jul 26 22:15 gcc-4.2.1-initial

-------------------------------------------------------------

It looks like the error indicates to the fact that the kernel headers
where
never compiled/copied to their correct place.  Seems like a dependency is
missing for kernel-headers and binutils.

====================================================================== 

---------------------------------------------------------------------- 
 gururaj - 07-26-07 17:22  
---------------------------------------------------------------------- 
This is not just with GCC4.2.1. I am using latest Buildroot snapshot of
250707 & building arm926 toolchain with uClibc 0.9.29 & i am facing the
same issue. This started for me since Buildroot Snapshot 240707. At
present Buildroot snapshot of 230707 works fine 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-26-07 13:57  fgretief       New Issue                                    
07-26-07 13:57  fgretief       Status                   new => assigned     
07-26-07 13:57  fgretief       Assigned To               => buildroot       
07-26-07 17:22  gururaj        Note Added: 0002641                          
======================================================================
