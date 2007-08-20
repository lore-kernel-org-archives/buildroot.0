From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 20 Aug 2007 16:12:34 -0700
Subject: [Buildroot] [buildroot 0001446]: Buildroot compilation is broken
	for SH4 architecture
Message-ID: <e21ad043ce38563e1648b06b73776764@bugs.busybox.net>
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
Last Modified:              08-20-2007 16:12 PDT
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
 gururaj - 07-26-07 17:26  
---------------------------------------------------------------------- 
This is not just with GCC4.2.1. I am using latest Buildroot snapshot of
250707 & building arm926 toolchain with uClibc 0.9.29 with GCC-4.2.0 & i
am facing the same issue. This started for me since Buildroot Snapshot
240707. At present Buildroot snapshot of 230707 works fine

 

---------------------------------------------------------------------- 
 bernhardf - 07-27-07 09:18  
---------------------------------------------------------------------- 
This should be fixed as of r19285. Please confirm. 

---------------------------------------------------------------------- 
 fgretief - 08-01-07 14:34  
---------------------------------------------------------------------- 
I can confirm that the dependency fix works.  The build get much further
but there is still a number of breakages:

 (1) The uClibc configuration waits for user input at the 'Target
Processor Type' question (see below).  It continues as soon as you press
enter. 

*
* Target Architecture Features and Options
*
Target Processor Type
  1. SH2A (CONFIG_SH2A) (NEW)
  2. SH2 (CONFIG_SH2) (NEW)
  3. SH3 (CONFIG_SH3) (NEW)
> 4. SH4 (CONFIG_SH4) (NEW)
choice[1-4?]:                   




 (2) uClibc gets configured to build a big endian library, even though I
selected little endian. See errors below. 
The problem lies in the 'toolchain/uClibc/uclibc.mk' file were the SH is
missing two lines. The patch below fixes the
problem for me.

Index: toolchain/uClibc/uclibc.mk
===================================================================
--- toolchain/uClibc/uclibc.mk  (revision 19393)
+++ toolchain/uClibc/uclibc.mk  (working copy)
@@ -70,6 +72,8 @@
 UCLIBC_TARGET_ENDIAN:=$(shell $(SHELL) -c "echo $(ARCH) | sed \
                -e 's/armeb/BIG/' \
                -e 's/arm/LITTLE/' \
+               -e 's/sh[234]eb/BIG/' \
+               -e 's/sh[234]/LITTLE/' \
                -e 's/mipsel/LITTLE/' \
                -e 's/mips/BIG/' \
 ")

-------- ERRORS ---------------
  LD libuClibc-0.9.29.so
/home/fgretief/src/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-ld:
/home/fgretief/src/buildroot/build_sh4/staging_dir/usr/lib/gcc/sh4-linux-uclibc/4.2.1/libgcc.a(_movmem_i4.o):
compiled for a little endian system and target is big endian
/home/fgretief/src/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-ld:
/home/fgretief/src/buildroot/build_sh4/staging_dir/usr/lib/gcc/sh4-linux-uclibc/4.2.1/libgcc.a(_movmem_i4.o):
uses instructions which are incompatible with instructions used in previous
modules
/home/fgretief/src/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-ld:
failed to merge target specific data of file
/home/fgretief/src/buildroot/build_sh4/staging_dir/usr/lib/gcc/sh4-linux-uclibc/4.2.1/libgcc.a(_movmem_i4.o)
/home/fgretief/src/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-ld:
/home/fgretief/src/buildroot/build_sh4/staging_dir/usr/lib/gcc/sh4-linux-uclibc/4.2.1/libgcc.a(_div_table.o):
compiled for a little endian system and target is big endian
/home/fgretief/src/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-ld:
/home/fgretief/src/buildroot/build_sh4/staging_dir/usr/lib/gcc/sh4-linux-uclibc/4.2.1/libgcc.a(_div_table.o):
uses instructions which are incompatible with instructions used in previous
modules
/home/fgretief/src/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-ld:
failed to merge target specific data of file
/home/fgretief/src/buildroot/build_sh4/staging_dir/usr/lib/gcc/sh4-linux-uclibc/4.2.1/libgcc.a(_div_table.o)
/home/fgretief/src/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-ld:
/home/fgretief/src/buildroot/build_sh4/staging_dir/usr/lib/gcc/sh4-linux-uclibc/4.2.1/libgcc.a(_divdi3.o):
compiled for a little endian system and target is big endian
/home/fgretief/src/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-ld:
/home/fgretief/src/buildroot/build_sh4/staging_dir/usr/lib/gcc/sh4-linux-uclibc/4.2.1/libgcc.a(_divdi3.o):
uses instructions which are incompatible with instructions used in previous
modules
/home/fgretief/src/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-ld:
failed to merge target specific data of file
/home/fgretief/src/buildroot/build_sh4/staging_dir/usr/lib/gcc/sh4-linux-uclibc/4.2.1/libgcc.a(_divdi3.o)
/home/fgretief/src/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-ld:
/home/fgretief/src/buildroot/build_sh4/staging_dir/usr/lib/gcc/sh4-linux-uclibc/4.2.1/libgcc.a(_moddi3.o):
compiled for a little endian system and target is big endian
/home/fgretief/src/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-ld:
/home/fgretief/src/buildroot/build_sh4/staging_dir/usr/lib/gcc/sh4-linux-uclibc/4.2.1/libgcc.a(_moddi3.o):
uses instructions which are incompatible with instructions used in previous
modules
/home/fgretief/src/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-ld:
failed to merge target specific data of file
/home/fgretief/src/buildroot/build_sh4/staging_dir/usr/lib/gcc/sh4-linux-uclibc/4.2.1/libgcc.a(_moddi3.o)
/home/fgretief/src/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-ld:
/home/fgretief/src/buildroot/build_sh4/staging_dir/usr/lib/gcc/sh4-linux-uclibc/4.2.1/libgcc.a(_udiv_qrnnd_16.o):
compiled for a little endian system and target is big endian
/home/fgretief/src/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-ld:
/home/fgretief/src/buildroot/build_sh4/staging_dir/usr/lib/gcc/sh4-linux-uclibc/4.2.1/libgcc.a(_udiv_qrnnd_16.o):
uses instructions which are incompatible with instructions used in previous
modules
/home/fgretief/src/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-ld:
failed to merge target specific data of file
/home/fgretief/src/buildroot/build_sh4/staging_dir/usr/lib/gcc/sh4-linux-uclibc/4.2.1/libgcc.a(_udiv_qrnnd_16.o)
/home/fgretief/src/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-ld:
/home/fgretief/src/buildroot/build_sh4/staging_dir/usr/lib/gcc/sh4-linux-uclibc/4.2.1/libgcc.a(_clz.o):
compiled for a little endian system and target is big endian
/home/fgretief/src/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-ld:
/home/fgretief/src/buildroot/build_sh4/staging_dir/usr/lib/gcc/sh4-linux-uclibc/4.2.1/libgcc.a(_clz.o):
uses instructions which are incompatible with instructions used in previous
modules
/home/fgretief/src/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-ld:
failed to merge target specific data of file
/home/fgretief/src/buildroot/build_sh4/staging_dir/usr/lib/gcc/sh4-linux-uclibc/4.2.1/libgcc.a(_clz.o)
/home/fgretief/src/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-ld:
BFD 2.17 assertion fail
/home/fgretief/src/buildroot/toolchain_build_sh4/binutils-2.17/bfd/elf32-sh.c:5070
/home/fgretief/src/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-ld:
BFD 2.17 assertion fail
/home/fgretief/src/buildroot/toolchain_build_sh4/binutils-2.17/bfd/elf32-sh.c:5070
make[2]: *** [lib/libc.so] Error 1
make[1]: *** [lib/libc.so.0] Error 2
make[1]: Leaving directory
`/home/fgretief/src/buildroot/toolchain_build_sh4/uClibc-0.9.29'
make: ***
[/home/fgretief/src/buildroot/toolchain_build_sh4/uClibc-0.9.29/lib/libc.a]
Error 2






 (3) Patch 'uClibc-0.9.29-001-fix-mmap.patch' is a problem.  It uses a
type '__ulong_t' that is not defined and causes a compile error. See error
below. If I replace the type with 'unsigned long' or even '__u_long' then
it works.

  CC libc/sysdeps/linux/common/mmap64.os
In file included from ./libpthread/linuxthreads.old/sysdeps/sh/tls.h:23,
                 from ./include/bits/uClibc_errno.h:14,
                 from ./include/errno.h:62,
                 from libc/sysdeps/linux/common/mmap64.c:12:
./libpthread/linuxthreads.old/sysdeps/sh/pt-machine.h:36: warning: C99
inline functions are not supported; using GNU89
./libpthread/linuxthreads.old/sysdeps/sh/pt-machine.h:36: warning: to
disable this warning use -fgnu89-inline or the gnu_inline function
attribute
libc/sysdeps/linux/common/mmap64.c: In function 'mmap64':
libc/sysdeps/linux/common/mmap64.c:66: error: '__ulong_t' undeclared
(first use in this function)
libc/sysdeps/linux/common/mmap64.c:66: error: (Each undeclared identifier
is reported only once
libc/sysdeps/linux/common/mmap64.c:66: error: for each function it appears
in.)
libc/sysdeps/linux/common/mmap64.c:66: error: expected ')' before
'offset'
make[2]: *** [libc/sysdeps/linux/common/mmap64.os] Error 1
make[1]: *** [lib/libc.so.0] Error 2
make[1]: Leaving directory
`/home/fgretief/src/buildroot/toolchain_build_sh4/uClibc-0.9.29'
make: ***
[/home/fgretief/src/buildroot/toolchain_build_sh4/uClibc-0.9.29/lib/libc.a]
Error 2




 (4) While linking BusyBox, the linker is unable to find the
sched_getaffinity and sched_setaffinity functions.  There is a patch
'uClibc-0.9.29-conditional-sched_affinity.patch' that comment out a piece
of the relevant source file. Don't know if it is related to this error.  I
modified the busybox config file (see diff below) to unset the
CONFIG_TASKSET function.  This removes the functionality from BusyBox and
allow the build to continue. Not ideal if you need that functionality.
Propper fix is required.

  LINK    busybox_unstripped
miscutils/lib.a(taskset.o): In function `taskset_main':
taskset.c:(.text.taskset_main+0x1b4): undefined reference to
`sched_getaffinity'
taskset.c:(.text.taskset_main+0x1c8): undefined reference to
`sched_setaffinity'
collect2: ld returned 1 exit status


Index: package/busybox/busybox-1.6.0.config
===================================================================
--- package/busybox/busybox-1.6.0.config	(revision 19285)
+++ package/busybox/busybox-1.6.0.config	(working copy)
@@ -495,7 +495,7 @@
 # CONFIG_RX is not set
 CONFIG_STRINGS=y
 CONFIG_SETSID=y
-CONFIG_TASKSET=y
+# CONFIG_TASKSET is not set
 CONFIG_FEATURE_TASKSET_FANCY=y
 CONFIG_TIME=y
 CONFIG_WATCHDOG=y 

---------------------------------------------------------------------- 
 zx80user - 08-20-07 16:12  
---------------------------------------------------------------------- 
The patch (2) in 00002648 above does fix the endianess problem. But then I
get this...

#
# Now for the ugly 3.3.x soft float hack...
#
#
# Ok... that's enough of that.
#
touch
/home/adrian/buildroot/toolchain_build_sh4/gcc-3.4.6-final/.installed
# These are in /lib, so...
rm -rf
/home/adrian/buildroot/project_build_sh4/uclibc/root/usr/lib/libgcc_s*.so*
cp -dpf
/home/adrian/buildroot/build_sh4/staging_dir/usr/sh4-linux-uclibc/lib/libgcc_s*
/home/adrian/buildroot/project_build_sh4/uclibc/root/lib/
/home/adrian/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-strip
--remove-section=.comment --remove-section=.note --strip-unneeded
/home/adrian/buildroot/project_build_sh4/uclibc/root/lib/libgcc_s*
/home/adrian/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-strip:
/home/adrian/buildroot/project_build_sh4/uclibc/root/lib/libgcc_s.so: File
format not recognized
make: ***
[/home/adrian/buildroot/toolchain_build_sh4/gcc-3.4.6-final/.libs_installed]
Error 1 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-26-07 13:57  fgretief       New Issue                                    
07-26-07 13:57  fgretief       Status                   new => assigned     
07-26-07 13:57  fgretief       Assigned To               => buildroot       
07-26-07 17:22  gururaj        Note Added: 0002641                          
07-26-07 17:26  gururaj        Note Edited: 0002641                         
07-27-07 09:18  bernhardf      Note Added: 0002643                          
08-01-07 14:34  fgretief       Note Added: 0002648                          
08-20-07 15:35  zx80user       Issue Monitored: zx80user                    
08-20-07 16:12  zx80user       Note Added: 0002672                          
======================================================================
