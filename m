From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 19 Sep 2007 07:08:34 -0700
Subject: [Buildroot] [buildroot 0001446]: Buildroot compilation is broken
	for SH4 architecture
Message-ID: <872e7939eb93dbefa64f0663bb03e46c@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
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
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             07-26-2007 13:57 PDT
Last Modified:              09-19-2007 07:08 PDT
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

---------------------------------------------------------------------- 
 mastag - 08-23-07 06:56  
---------------------------------------------------------------------- 
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


This can be fixed by editing: buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
--------------------
	#
	# Ok... that's enough of that.
	#
	-mkdir -p $(TARGET_DIR)/usr/lib $(TARGET_DIR)/usr/sbin
	touch $@

$(GCC_BUILD_DIR2)/.libs_installed: $(GCC_BUILD_DIR2)/.installed
ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
	# These are in /lib, so...
	rm -rf $(TARGET_DIR)/usr/lib/libgcc_s*.so*
	-cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libgcc_s*
$(TARGET_DIR)/lib/
	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libgcc_s*
--------------------

You need to add a "-" to the following line:
$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libgcc_s*
making it look like:
--------------------
	#
	# Ok... that's enough of that.
	#
	-mkdir -p $(TARGET_DIR)/usr/lib $(TARGET_DIR)/usr/sbin
	touch $@

$(GCC_BUILD_DIR2)/.libs_installed: $(GCC_BUILD_DIR2)/.installed
ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
	# These are in /lib, so...
	rm -rf $(TARGET_DIR)/usr/lib/libgcc_s*.so*
	-cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libgcc_s*
$(TARGET_DIR)/lib/
	-$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libgcc_s*
--------------------

Then it will build a working toolchain :) 

---------------------------------------------------------------------- 
 fgretief - 08-25-07 13:06  
---------------------------------------------------------------------- 
Thank to mastag's suggestion, I am now able to compile buildroot for the SH
architecture. Below is a patch against r19690 that compiles with gcc 4.2.1
and gcc 3.4.6 for the following targets: sh4, sh4eb, sh3, sh3eb and sh2.
Currently only Linux and Busybox were compiled.


Index: toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- toolchain/gcc/gcc-uclibc-3.x.mk	(revision 19690)
+++ toolchain/gcc/gcc-uclibc-3.x.mk	(working copy)
@@ -317,7 +317,7 @@
 	# These are in /lib, so...
 	rm -rf $(TARGET_DIR)/usr/lib/libgcc_s*.so*
 	-cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libgcc_s*
$(TARGET_DIR)/lib/
-	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libgcc_s*
+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libgcc_s*
 endif
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 	-cp -dpf $(STAGING_DIR)/lib/libstdc++.so* $(TARGET_DIR)/usr/lib/
Index: toolchain/gcc/Makefile.in
===================================================================
--- toolchain/gcc/Makefile.in	(revision 19690)
+++ toolchain/gcc/Makefile.in	(working copy)
@@ -16,6 +16,11 @@
 EXTRA_GCC_CONFIG_OPTIONS+=--disable-libmudflap
 endif
 
+# SH4 GCC configuration
+ifeq ($(strip $(subst ",, $(BR2_sh4))),y)
+EXTRA_GCC_CONFIG_OPTIONS+=--with-multilib-list=m4,m4-nofpu
+endif
+
 ifeq ($(strip $(subst ",, $(BR2_GCC_IS_SNAP))),y)
 #"))
 GCC_SNAP_DATE:=$(strip $(subst ",, $(BR2_GCC_SNAP_DATE)))
Index: toolchain/uClibc/uClibc-0.9.29-001-fix-mmap.patch
===================================================================
--- toolchain/uClibc/uClibc-0.9.29-001-fix-mmap.patch	(revision 19690)
+++ toolchain/uClibc/uClibc-0.9.29-001-fix-mmap.patch	(working copy)
@@ -84,7 +84,7 @@
 +                         fd,((__u_quad_t)offset >> MMAP2_PAGE_SHIFT));
 +#else
 +   return __syscall_mmap2(addr, len, prot, flags,
-+                          fd,((__ulong_t)offset >> MMAP2_PAGE_SHIFT));
++                          fd,((__u_long)offset >> MMAP2_PAGE_SHIFT));
 +#endif
  }
  
Index: package/busybox/busybox-1.6.0.config
===================================================================
--- package/busybox/busybox-1.6.0.config	(revision 19690)
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
Index: toolchain/uClibc/uclibc.mk
===================================================================
--- toolchain/uClibc/uclibc.mk	(revision 19690)
+++ toolchain/uClibc/uclibc.mk	(working copy)
@@ -73,7 +73,7 @@
 		-e 's/arm/LITTLE/' \
 		-e 's/mipsel/LITTLE/' \
 		-e 's/mips/BIG/' \
-		-e 's/sh[234]eb/BIG/' \
+		-e 's/sh[234].*eb/BIG/' \
 		-e 's/sh[234]/LITTLE/' \
 ")
 
@@ -146,6 +146,38 @@
 	/bin/echo "# CONFIG_ARM_EABI is not set" >> $(UCLIBC_DIR)/.oldconfig
 endif
 endif
+ifeq ("$(UCLIBC_TARGET_ARCH)","sh")
+	/bin/echo "# CONFIG_SH2A is not set" >> $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# CONFIG_SH2 is not set" >> $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# CONFIG_SH3 is not set" >> $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# CONFIG_SH4 is not set" >> $(UCLIBC_DIR)/.oldconfig
+ifeq ($(BR2_sh2a_nofpueb),y)
+	$(SED) 's,# CONFIG_SH2A is not set,CONFIG_SH2A=y,g'
$(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# UCLIBC_FORMAT_FDPIC_ELF is not set" >>
$(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# UCLIBC_FORMAT_FLAT is not set" >> $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# UCLIBC_FORMAT_FLAT_SEP_DATA is not set" >>
$(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# UCLIBC_FORMAT_SHARED_FLAT is not set" >>
$(UCLIBC_DIR)/.oldconfig
+endif
+ifeq ($(BR2_sh2eb),y)
+	$(SED) 's,# CONFIG_SH2 is not set,CONFIG_SH2=y,g'
$(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# UCLIBC_FORMAT_FDPIC_ELF is not set" >>
$(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# UCLIBC_FORMAT_FLAT is not set" >> $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# UCLIBC_FORMAT_FLAT_SEP_DATA is not set" >>
$(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# UCLIBC_FORMAT_SHARED_FLAT is not set" >>
$(UCLIBC_DIR)/.oldconfig
+endif
+ifeq ($(BR2_sh3eb),y)
+	$(SED) 's,# CONFIG_SH3 is not set,CONFIG_SH3=y,g'
$(UCLIBC_DIR)/.oldconfig
+endif
+ifeq ($(BR2_sh3),y)
+	$(SED) 's,# CONFIG_SH3 is not set,CONFIG_SH3=y,g'
$(UCLIBC_DIR)/.oldconfig
+endif
+ifeq ($(BR2_sh4eb),y)
+	$(SED) 's,# CONFIG_SH4 is not set,CONFIG_SH4=y,g'
$(UCLIBC_DIR)/.oldconfig
+endif
+ifeq ($(BR2_sh4),y)
+	$(SED) 's,# CONFIG_SH4 is not set,CONFIG_SH4=y,g'
$(UCLIBC_DIR)/.oldconfig
+endif
+endif
 ifneq ($(UCLIBC_TARGET_ENDIAN),)
 	# The above doesn't work for me, so redo
 	$(SED) 's/.*\(ARCH_$(UCLIBC_NOT_TARGET_ENDIAN)_ENDIAN\).*/# \1 is not
set/g' \ 

---------------------------------------------------------------------- 
 Masta-G - 08-26-07 11:57  
---------------------------------------------------------------------- 
Yeah! :)
Tested the full patch against latest svn and it's working fine.
Running uClinux and busybox on the Sega Dreamcast.

Now it would be nice if it got applied to the trunk so it works out of the
box. 

---------------------------------------------------------------------- 
 bernhardf - 08-26-07 13:31  
---------------------------------------------------------------------- 
If you want to attach a file for me to apply (in whole or in part) then
please attach a file that i can save away and look at. Pasted stuff is
usually whitespace damaged and thus pretty useless..

TIA 

---------------------------------------------------------------------- 
 bernhardf - 08-26-07 13:41  
---------------------------------------------------------------------- 
A few notes:

1) I will not turn off taskset since i need it. See docs/README

2)
The hunk against gcc-uclibc-3.x.mk can only be wrong. If we want to build
a shared libgcc then libgcc_s *has* to exist. The correct thing to do is
to:
Index: toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- toolchain/gcc/gcc-uclibc-4.x.mk	(revision 19700)
+++ toolchain/gcc/gcc-uclibc-4.x.mk	(working copy)
@@ -340,18 +340,18 @@ $(GCC_BUILD_DIR2)/.libs_installed: $(GCC
 ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
 	# These are in /lib, so...
 	rm -rf $(TARGET_DIR)/usr/lib/libgcc_s*.so*
-	-cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libgcc_s*
$(TARGET_DIR)/lib/
+	cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libgcc_s*
$(TARGET_DIR)/lib/
 endif
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
-	-cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libstdc++.so*
$(TARGET_DIR)/usr/lib/
+	cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib/libstdc++.so*
$(TARGET_DIR)/usr/lib/
 endif
 ifeq ($(BR2_INSTALL_LIBGCJ),y)
-	-cp -dpf $(STAGING_DIR)/lib/libgcj.so* $(TARGET_DIR)/lib/
-	-cp -dpf $(STAGING_DIR)/lib/lib-org-w3c-dom.so* $(TARGET_DIR)/lib/
-	-cp -dpf $(STAGING_DIR)/lib/lib-org-xml-sax.so* $(TARGET_DIR)/lib/
+	cp -dpf $(STAGING_DIR)/lib/libgcj.so* $(TARGET_DIR)/lib/
+	cp -dpf $(STAGING_DIR)/lib/lib-org-w3c-dom.so* $(TARGET_DIR)/lib/
+	cp -dpf $(STAGING_DIR)/lib/lib-org-xml-sax.so* $(TARGET_DIR)/lib/
 	mkdir -p $(TARGET_DIR)/usr/lib/security
-	-cp -dpf $(STAGING_DIR)/usr/lib/security/libgcj.security
$(TARGET_DIR)/usr/lib/security/
-	-cp -dpf $(STAGING_DIR)/usr/lib/security/classpath.security
$(TARGET_DIR)/usr/lib/security/
+	cp -dpf $(STAGING_DIR)/usr/lib/security/libgcj.security
$(TARGET_DIR)/usr/lib/security/
+	cp -dpf $(STAGING_DIR)/usr/lib/security/classpath.security
$(TARGET_DIR)/usr/lib/security/
 endif
 	touch $@ 

---------------------------------------------------------------------- 
 bernhardf - 08-26-07 14:02  
---------------------------------------------------------------------- 
I've now applied all hunks but that against toolchain/gcc/Makefile.in

Please explain what this hunk does and what part of gcc you are trying to
affect. 

---------------------------------------------------------------------- 
 bernhardf - 09-19-07 07:08  
---------------------------------------------------------------------- 
No feedback within a reasonable amount of time, so i take it that this
works now.
Please reopen this bug if you still encounter errors on SuperH

Thanks, all! 

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
08-23-07 06:56  mastag         Note Added: 0002677                          
08-25-07 13:06  fgretief       Note Added: 0002688                          
08-26-07 11:57  Masta-G        Note Added: 0002690                          
08-26-07 13:31  bernhardf      Note Added: 0002691                          
08-26-07 13:41  bernhardf      Note Added: 0002693                          
08-26-07 14:02  bernhardf      Note Added: 0002695                          
09-19-07 07:08  bernhardf      Status                   assigned => closed  
09-19-07 07:08  bernhardf      Note Added: 0002756                          
======================================================================
