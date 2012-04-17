From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Apr 2012 16:45:34 +0200
Subject: [Buildroot] [PATCH 22/22] xtensa: remove support for this
	architecture
In-Reply-To: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
References: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
Message-ID: <7fac2ee376eb5542ebd39c2eb063f773f99834a0.1334673910.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The support for Xtensa has been added in July 2009, and no updates
have ever been done to it, and it requires some special handling, in
gcc/gdb, has some special Perl scripts, etc.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                                   |    3 -
 linux/Config.in                            |    2 +-
 package/ltrace/Config.in                   |    2 +-
 target/Config.in.arch                      |   40 ---
 target/device/xtensa/device_table.txt      |  189 -----------
 target/xtensa/.gitignore                   |    1 -
 target/xtensa/Makefile.in                  |    1 -
 target/xtensa/defconfig                    |  129 --------
 target/xtensa/patch.in                     |   33 --
 target/xtensa/setup-config                 |   57 ----
 target/xtensa/uClibc-0.9.30.config         |  245 --------------
 target/xtensa/uClibc.config                |  190 -----------
 target/xtensa/xt-buildroot-overlay-install |  488 ----------------------------
 toolchain/gcc/gcc-uclibc-4.x.mk            |    5 -
 toolchain/gdb/gdb.mk                       |    5 -
 toolchain/toolchain-common.in              |    2 +-
 16 files changed, 3 insertions(+), 1389 deletions(-)
 delete mode 100644 target/device/xtensa/device_table.txt
 delete mode 100644 target/xtensa/.gitignore
 delete mode 100644 target/xtensa/Makefile.in
 delete mode 100644 target/xtensa/defconfig
 delete mode 100644 target/xtensa/patch.in
 delete mode 100644 target/xtensa/setup-config
 delete mode 100644 target/xtensa/uClibc-0.9.30.config
 delete mode 100644 target/xtensa/uClibc.config
 delete mode 100644 target/xtensa/xt-buildroot-overlay-install

diff --git a/Makefile b/Makefile
index 0ed323e..424d1ad 100644
--- a/Makefile
+++ b/Makefile
@@ -217,9 +217,6 @@ QUIET:=$(if $(findstring s,$(MAKEFLAGS)),-q)
 
 # Strip off the annoying quoting
 ARCH:=$(call qstrip,$(BR2_ARCH))
-ifeq ($(ARCH),xtensa)
-ARCH:=$(ARCH)_$(call qstrip,$(BR2_xtensa_core_name))
-endif
 
 KERNEL_ARCH:=$(shell echo "$(ARCH)" | sed -e "s/-.*//" \
 	-e s/i.86/i386/ -e s/sun4u/sparc64/ \
diff --git a/linux/Config.in b/linux/Config.in
index 5a2d287..c84db57 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -145,7 +145,7 @@ config BR2_LINUX_KERNEL_BZIMAGE
 
 config BR2_LINUX_KERNEL_ZIMAGE
 	bool "zImage"
-	depends on BR2_arm || BR2_armeb || BR2_powerpc || BR2_sparc || BR2_sh || BR2_sh64 || BR2_xtensa
+	depends on BR2_arm || BR2_armeb || BR2_powerpc || BR2_sparc || BR2_sh || BR2_sh64
 
 config BR2_LINUX_KERNEL_VMLINUX_BIN
 	bool "vmlinux.bin"
diff --git a/package/ltrace/Config.in b/package/ltrace/Config.in
index 9e71d82..a65ca48 100644
--- a/package/ltrace/Config.in
+++ b/package/ltrace/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LTRACE
 	bool "ltrace"
-	depends on !(BR2_avr32 || BR2_mips || BR2_mipsel || BR2_sh || BR2_sh64 || BR2_xtensa)
+	depends on !(BR2_avr32 || BR2_mips || BR2_mipsel || BR2_sh || BR2_sh64)
 	select BR2_PACKAGE_LIBELF
 	help
 	  Debugging program which runs a specified command until it exits.
diff --git a/target/Config.in.arch b/target/Config.in.arch
index f8ab84e..e949764 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -122,12 +122,6 @@ config BR2_x86_64
 	  architecture compatible microprocessor).
 	  http://en.wikipedia.org/wiki/X86_64
 
-config BR2_xtensa
-	bool "Xtensa"
-	help
-	  Xtensa is a Tensilica processor IP architecture.
-	  http://en.wikipedia.org/wiki/Xtensa
-	  http://www.tensilica.com/
 endchoice
 
 config BR2_microblaze
@@ -461,38 +455,6 @@ config BR2_SPARC_TYPE
 
 choice
 	prompt "Target Architecture Variant"
-	depends on BR2_xtensa
-	default BR2_xtensa_dc232b
-	help
-	  Specific CPU variant to use
-
-config BR2_xtensa_custom
-	bool "Custom Xtensa processor configuration"
-config BR2_xtensa_dc232a
-	bool "dc232a - Diamond 232L Standard Core Rev.A (LE)"
-config BR2_xtensa_dc232b
-	bool "dc232b - Diamond 232L Standard Core Rev.B (LE)"
-#config BR2_xtensa_s5000
-#	bool "s5000 - Stretch S5000"
-endchoice
-
-config BR2_xtensa_custom_name
-	string "Custom Xtensa processor configuration name"
-	depends on BR2_xtensa_custom
-	default ""
-	help
-	  Name given to a custom Xtensa processor configuration.
-	  This is used to select the correct overlay.
-
-config BR2_xtensa_core_name
-	string
-	default BR2_xtensa_custom_name	if BR2_xtensa_custom
-	default "dc232a"		if BR2_xtensa_dc232a
-	default "dc232b"		if BR2_xtensa_dc232b
-#	default "s5000"			if BR2_xtensa_s5000
-
-choice
-	prompt "Target Architecture Variant"
 	depends on BR2_powerpc
 	default BR2_generic_powerpc
 	help
@@ -632,8 +594,6 @@ config BR2_ARCH
 	default "x86_64"	if BR2_x86_64_opteron
 	default "x86_64"	if BR2_x86_64_opteron_sse3
 	default "x86_64"	if BR2_x86_64_barcelona
-	default "xtensa"	if BR2_xtensa
-
 
 config BR2_ENDIAN
 	string
diff --git a/target/device/xtensa/device_table.txt b/target/device/xtensa/device_table.txt
deleted file mode 100644
index d0c7467..0000000
--- a/target/device/xtensa/device_table.txt
+++ /dev/null
@@ -1,189 +0,0 @@
-# When building a target filesystem, it is desirable to not have to
-# become root and then run 'mknod' a thousand times.  Using a device 
-# table you can create device nodes and directories "on the fly".
-#
-# This is a sample device table file for use with genext2fs.  You can
-# do all sorts of interesting things with a device table file.  For
-# example, if you want to adjust the permissions on a particular file
-# you can just add an entry like:
-#   /sbin/foobar        f       2755    0       0       -       -       -       -       -
-# and (assuming the file /sbin/foobar exists) it will be made setuid
-# root (regardless of what its permissions are on the host filesystem.
-# Furthermore, you can use a single table entry to create a many device
-# minors.  For example, if I wanted to create /dev/hda and /dev/hda[0-15]
-# I could just use the following two table entries:
-#   /dev/hda    b       640     0       0       3       0       0       0       -
-#   /dev/hda    b       640     0       0       3       1       1       1       15
-# 
-# Device table entries take the form of:
-# <name>    <type>      <mode>  <uid>   <gid>   <major> <minor> <start> <inc>   <count>
-# where name is the file name,  type can be one of: 
-#       f       A regular file
-#       d       Directory
-#       c       Character special device file
-#       b       Block special device file
-#       p       Fifo (named pipe)
-# uid is the user id for the target file, gid is the group id for the
-# target file.  The rest of the entries (major, minor, etc) apply only 
-# to device special files.
-
-# Have fun
-# -Erik Andersen <andersen@codepoet.org>
-#
-
-#<name>		<type>	<mode>	<uid>	<gid>	<major>	<minor>	<start>	<inc>	<count>
-/dev		d	755	0	0	-	-	-	-	-
-/dev/pts	d	755	0	0	-	-	-	-	-
-/dev/shm	d	755	0	0	-	-	-	-	-
-/tmp		d	1777	0	0	-	-	-	-	-
-/etc		d	755	0	0	-	-	-	-	-
-/home/default	d	2755	1000	1000	-	-	-	-	-
-#<name>					<type>	<mode>	<uid>	<gid>	<major>	<minor>	<start>	<inc>	<count>
-/bin/busybox				f	4755	0	0	-	-	-	-	-
-/etc/shadow				f	600	0	0	-	-	-	-	-
-/etc/passwd				f	644	0	0	-	-	-	-	-
-/etc/network/if-up.d			d	755	0	0	-	-	-	-	-
-/etc/network/if-pre-up.d		d	755	0	0	-	-	-	-	-
-/etc/network/if-down.d			d	755	0	0	-	-	-	-	-
-/etc/network/if-post-down.d		d	755	0	0	-	-	-	-	-
-/usr/share/udhcpc/default.script	f	755	0	0	-	-	-	-	-
-# uncomment this to allow starting x as non-root
-#/usr/X11R6/bin/Xfbdev		f	4755	0	0	-	-	-	-	-
-# Normal system devices
-/dev/mem	c	640	0	0	1	1	0	0	-
-/dev/kmem	c	640	0	0	1	2	0	0	-
-/dev/null	c	666	0	0	1	3	0	0	-
-/dev/zero	c	666	0	0	1	5	0	0	-
-/dev/random	c	666	0	0	1	8	0	0	-
-/dev/urandom	c	666	0	0	1	9	0	0	-
-/dev/ram	b	640	0	0	1	1	0	0	-
-/dev/ram	b	640	0	0	1	0	0	1	4
-/dev/loop	b	640	0	0	7	0	0	1	2
-/dev/rtc	c	640	0	0	10	135	-	-	-
-/dev/console	c	666	0	0	5	1	-	-	-
-/dev/tty	c	666	0	0	5	0	-	-	-
-/dev/tty	c	666	0	0	4	0	0	1	8
-/dev/ttyp	c	666	0	0	3	0	0	1	10
-/dev/ptyp	c       666     0       0       2       0       0       1       10
-/dev/ptmx	c	666	0	0	5	2	-	-	-
-/dev/ttyP	c	666	0	0	57	0	0	1	4
-/dev/ttyS	c	666	0	0	4	64	0	1	4
-/dev/fb		c	640	0	5	29	0	0	1	4
-#/dev/ttySA	c	666	0	0	204	5	0	1	3
-/dev/psaux	c	666	0	0	10	1	0	0	-
-#/dev/ppp	c	666	0	0	108	0	-	-	-
-/dev/ttyCPM	c	666	0	0	204	46	0	1	4
-/dev/ttyAMA	c	666	0	0	204	64	0	1	4
-/dev/ttySAC	c	666	0	0	204	64	0	1	4
-/dev/ttyPSC	c	666	0	0	204	148	0	1	4
-/dev/ttyUL	c	666	0	0	204	187	0	1	4
-/dev/ttymxc	c	666	0	0	207	16	0	1	3
-
-# Input stuff
-/dev/input		d	755	0	0	-	-	-	-	-
-/dev/input/mice		c	640	0	0	13	63	0	0	-
-/dev/input/mouse	c	660	0	0	13	32	0	1	4
-/dev/input/event	c	660	0	0	13	64	0	1	4
-#/dev/input/js		c	660	0	0	13	0	0	1	4
-
-
-# MTD stuff
-/dev/mtd	c	640	0	0	90	0	0	2	4
-/dev/mtdblock	b	640	0	0	31	0	0	1	4
-
-#Tun/tap driver
-/dev/net	d	755	0	0	-	-	-	-	-
-/dev/net/tun	c	660	0	0	10	200	-	-	-
-
-# Audio stuff
-#/dev/audio	c	666	0	29	14	4	-	-	-
-#/dev/audio1	c	666	0	29	14	20	-	-	-
-#/dev/dsp	c	666	0	29	14	3	-	-	-
-#/dev/dsp1	c	666	0	29	14	19	-	-	-
-#/dev/sndstat	c	666	0	29	14	6	-	-	-
-
-# User-mode Linux stuff
-#/dev/ubda	b	640	0	0	98	0	0	0	-
-#/dev/ubda	b	640	0	0	98	1	1	1	15
-
-# IDE Devices
-/dev/hda	b	640	0	0	3	0	0	0	-
-/dev/hda	b	640	0	0	3	1	1	1	15
-/dev/hdb	b	640	0	0	3	64	0	0	-
-/dev/hdb	b	640	0	0	3	65	1	1	15
-#/dev/hdc	b	640	0	0	22	0	0	0	-
-#/dev/hdc	b	640	0	0	22	1	1	1	15
-#/dev/hdd	b	640	0	0	22	64	0	0	-
-#/dev/hdd	b	640	0	0	22	65	1	1	15
-#/dev/hde	b	640	0	0	33	0	0	0	-
-#/dev/hde	b	640	0	0	33	1	1	1	15
-#/dev/hdf	b	640	0	0	33	64	0	0	-
-#/dev/hdf	b	640	0	0	33	65	1	1	15
-#/dev/hdg	b	640	0	0	34	0	0	0	-
-#/dev/hdg	b	640	0	0	34	1	1	1	15
-#/dev/hdh	b	640	0	0	34	64	0	0	-
-#/dev/hdh	b	640	0	0	34	65	1	1	15
-
-# SCSI Devices
-/dev/sda	b	640	0	0	8	0	0	0	-
-/dev/sda	b	640	0	0	8	1	1	1	15
-/dev/sdb	b	640	0	0	8	16	0	0	-
-/dev/sdb	b	640	0	0	8	17	1	1	15
-#/dev/sdc	b	640	0	0	8	32	0	0	-
-#/dev/sdc	b	640	0	0	8	33	1	1	15
-#/dev/sdd	b	640	0	0	8	48	0	0	-
-#/dev/sdd	b	640	0	0	8	49	1	1	15
-#/dev/sde	b	640	0	0	8	64	0	0	-
-#/dev/sde	b	640	0	0	8	65	1	1	15
-#/dev/sdf	b	640	0	0	8	80	0	0	-
-#/dev/sdf	b	640	0	0	8	81	1	1	15
-#/dev/sdg	b	640	0	0	8	96	0	0	-
-#/dev/sdg	b	640	0	0	8	97	1	1	15
-#/dev/sdh	b	640	0	0	8	112	0	0	-
-#/dev/sdh	b	640	0	0	8	113	1	1	15
-#/dev/sg	c	640	0	0	21	0	0	1	15
-#/dev/scd	b	640	0	0	11	0	0	1	15
-#/dev/st	c	640	0	0	9	0	0	1	8
-#/dev/nst	c	640	0	0	9	128	0	1	8
-#/dev/st	c	640	0	0	9	32	1	1	4
-#/dev/st	c	640	0	0	9	64	1	1	4
-#/dev/st	c	640	0	0	9	96	1	1	4
-
-# USB block devices (ub driver)
-/dev/uba	b	640	0	0	180	0	0	0	-
-/dev/uba	b	640	0	0	180	1	1	1	6
-/dev/ubb	b	640	0	0	180	8	0	0	-
-/dev/ubb	b	640	0	0	180	65	1	1	6
-
-# Floppy disk devices
-#/dev/fd	b	640	0	0	2	0	0	1	2
-#/dev/fd0d360	b	640	0	0	2	4	0	0	-
-#/dev/fd1d360	b	640	0	0	2	5	0	0	-
-#/dev/fd0h1200	b	640	0	0	2	8	0	0	-
-#/dev/fd1h1200	b	640	0	0	2	9	0	0	-
-#/dev/fd0u1440	b	640	0	0	2	28	0	0	-
-#/dev/fd1u1440	b	640	0	0	2	29	0	0	-
-#/dev/fd0u2880	b	640	0	0	2	32	0	0	-
-#/dev/fd1u2880	b	640	0	0	2	33	0	0	-
-
-# All the proprietary cdrom devices in the world
-#/dev/aztcd	b	640	0	0	29	0	0	0	-
-#/dev/bpcd	b	640	0	0	41	0	0	0	-
-#/dev/capi20	c	640	0	0	68	0	0	1	2
-#/dev/cdu31a	b	640	0	0	15	0	0	0	-
-#/dev/cdu535	b	640	0	0	24	0	0	0	-
-#/dev/cm206cd	b	640	0	0	32	0	0	0	-
-#/dev/sjcd	b	640	0	0	18	0	0	0	-
-#/dev/sonycd	b	640	0	0	15	0	0	0	-
-#/dev/gscd	b	640	0	0	16	0	0	0	-
-#/dev/sbpcd	b	640	0	0	25	0	0	0	-
-#/dev/sbpcd	b	640	0	0	25	0	0	1	4
-#/dev/mcd	b	640	0	0	23	0	0	0	-
-#/dev/optcd	b	640	0	0	17	0	0	0	-
-
-# I2C device nodes
-/dev/i2c-	c	666	0	0	89	0	0	1	4
-
-# Xtensa special devices
-/dev/simdisk0        b      640      0       0       240     0       0       0
-/dev/simdisk1        b      640      0       0       240     1       0       0
diff --git a/target/xtensa/.gitignore b/target/xtensa/.gitignore
deleted file mode 100644
index cff61bf..0000000
--- a/target/xtensa/.gitignore
+++ /dev/null
@@ -1 +0,0 @@
-/busybox-config
diff --git a/target/xtensa/Makefile.in b/target/xtensa/Makefile.in
deleted file mode 100644
index 8a654b9..0000000
--- a/target/xtensa/Makefile.in
+++ /dev/null
@@ -1 +0,0 @@
--include target/xtensa/*/*.mk
diff --git a/target/xtensa/defconfig b/target/xtensa/defconfig
deleted file mode 100644
index 0eee5c0..0000000
--- a/target/xtensa/defconfig
+++ /dev/null
@@ -1,129 +0,0 @@
-# Default buildroot configuration for running Linux on an Xtensa processor
-# on an LX60 board.
-
-#
-# Project Options
-#
-BR2_BANNER="Welcome to your custom Xtensa processor based uClibc environment."
-BR2_HAVE_DOT_CONFIG=y
-BR2_xtensa=y
-BR2_xtensa_dc232b=y
-BR2_xtensa_core_name="dc232b"
-BR2_ARCH="xtensa"
-
-#
-# Build options
-#
-BR2_WGET="wget --passive-ftp"
-# BR2_STRIP_strip is not set
-# BR2_STRIP_none=y
-
-## Added by Maxim
-
-#
-# Kernel Header Options
-#
-BR2_KERNEL_none=y
-BR2_KERNEL_HEADERS_2_6_22_1=y
-BR2_DEFAULT_KERNEL_HEADERS="2.6.22.1"
-
-#
-# uClibc Options
-#
-BR2_UCLIBC_VERSION_0_9_30=y
-# BR2_UCLIBC_VERSION_SNAPSHOT is not set
-BR2_UCLIBC_CONFIG="target/xtensa/uClibc-0.9.30.config"
-BR2_PTHREADS_OLD=y
-# BR2_PTHREADS_NATIVE is not set
-BR2_PTHREAD_DEBUG=y
-
-#
-# Binutils Options
-#
-BR2_BINUTILS_VERSION_2_19=y
-BR2_BINUTILS_VERSION="2.19"
-BR2_EXTRA_BINUTILS_CONFIG_OPTIONS=""
-
-#
-# Gcc Options
-#
-BR2_GCC_VERSION_4_3_2=y
-# BR2_GCC_IS_SNAP is not set
-BR2_GCC_VERSION="4.3.2"
-BR2_TOOLCHAIN_SYSROOT=y
-BR2_EXTRA_GCC_CONFIG_OPTIONS=""
-BR2_GCC_CROSS_CXX=y
-BR2_INSTALL_LIBSTDCPP=y
-BR2_GCC_SHARED_LIBGCC=y
-
-#
-# Gdb Options
-#
-BR2_PACKAGE_GDB=y
-BR2_PACKAGE_GDB_SERVER=y
-BR2_PACKAGE_GDB_HOST=y
-# BR2_GDB_VERSION_6_2_1 is not set
-# BR2_GDB_VERSION_6_3 is not set
-# BR2_GDB_VERSION_6_4 is not set
-# BR2_GDB_VERSION_6_5 is not set
-# BR2_GDB_VERSION_6_6 is not set
-# BR2_GDB_VERSION_6_7_1 is not set
-BR2_GDB_VERSION_6_8=y
-# BR2_GDB_VERSION_SNAPSHOT is not set
-BR2_GDB_VERSION="6.8"
-
-#
-# Common Toolchain Options
-#
-# BR2_PACKAGE_SSTRIP_TARGET is not set
-# BR2_PACKAGE_SSTRIP_HOST is not set
-BR2_LARGEFILE=y
-BR2_INET_RPC=y
-BR2_TARGET_OPTIMIZATION="-Os -pipe"
-
-
-## Added by Maxim
-BR2_TOOLCHAIN_BUILDROOT=y
-
-
-# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
-
-#
-# Other development stuff
-#
-# BR2_PACKAGE_LIBINTL is not set
-#  For NFS mount:
-BR2_PACKAGE_PORTMAP=y
-
-#
-# Other stuff
-#
-
-#
-# filesystem for target device
-#
-BR2_ROOTFS_DEVICE_TABLE="target/device/xtensa/device_table.txt"
-BR2_TARGET_ROOTFS_CPIO=y
-BR2_TARGET_ROOTFS_CPIO_GZIP=y
-BR2_TARGET_ROOTFS_INITRAMFS=y
-
-#
-# Linux Options
-#
-# BR2_PACKAGE_LINUX is not set
-
-#
-# Board Support Options
-#
-BR2_TARGET_XTENSA=y
-
-#
-# Tensilica Xtensa/Diamond based Device Support
-#
-BR2_TARGET_XTENSA_XTAV60=y
-
-#
-# Compressors / decompressors
-#
-
-BR2_PACKAGE_ZLIB=y
diff --git a/target/xtensa/patch.in b/target/xtensa/patch.in
deleted file mode 100644
index 3fe5cc8..0000000
--- a/target/xtensa/patch.in
+++ /dev/null
@@ -1,33 +0,0 @@
-ifneq ($(filter xtensa%,$(ARCH)),)
-#############################################################
-#
-#  Xtensa processor architecture (including Diamond Standard cores)
-#
-#############################################################
-
-#  The following defines a function to be used like this:
-#	$(call XTENSA_PATCH, <module>, <patchdir>, <relative dir list...>)
-#  which returns the first overlay patch file for <module> found
-#  in the list of directories <relative dir list...> which are
-#  relative to <patchdir> (itself either absolute or relative to the
-#  current directory).  The returned filename is relative to <patchdir>.
-#  For example:
-#	$(call XTENSA_PATCH, binutils, some/dir/path, . ..)
-#  (no commas between directory paths in the list).
-#
-#  A selected overlay patch must exist ("fsf" means no specific
-#  overlay is selected).  So the function emits a Makefile error
-#  if a selected patch file is not found.
-
-XTENSA_CORENAME:=$(call qstrip,$(BR2_xtensa_core_name))
-ifeq ($(XTENSA_CORENAME),fsf)
-XTENSA_PATCH =
-else
-XTENSA_PATCH_SUFFIX = $(1)-xtensa_$(XTENSA_CORENAME).tgz
-XTENSA_PATCH_FILE = $(firstword $(wildcard $(patsubst %,$(2)/%/*$(XTENSA_PATCH_SUFFIX),$(3))))
-# FULLPATH = $(if $(filter /%,$(1)),$(1),$(PWD)/$(1))
-XTENSA_PATCH = $(if $(XTENSA_PATCH_FILE),$(patsubst $(2)/%,%,$(XTENSA_PATCH_FILE)),\
-	$(error Missing $(1) patch for Xtensa $(XTENSA_CORENAME) processor (*$(XTENSA_PATCH_SUFFIX) in $(addprefix $(2)/,$(3)))))
-endif
-
-endif
diff --git a/target/xtensa/setup-config b/target/xtensa/setup-config
deleted file mode 100644
index 7ef8fe8..0000000
--- a/target/xtensa/setup-config
+++ /dev/null
@@ -1,57 +0,0 @@
-#!/bin/sh
-
-#  Convenience script for setting up a default buildroot config
-#  for Xtensa processor targets..
-
-usage() {
-    echo "Usage (invoke from top of buildroot tree):"
-    echo "    ./target/xtensa/setup-config <corename>"
-   #echo "    ./target/xtensa/setup-config <corename> [<overlaypath>]"
-    echo "where:"
-    echo "    <corename> is the Xtensa core overlay name, as specified in the -c option"
-    echo "    of the ./target/xtensa/xt-buildroot-overlay-install script."
-    echo ""
-    echo "For example:"
-    echo "   ./target/xtensa/setup-config dc232b"
-    echo ""
-    echo "Currently installed (available) core overlay names are:"
-    echo "   " `ls toolchain/binutils/binutils-xtensa_*.tgz | sed -e 's,toolchain\/binutils\/binutils-xtensa_\(.*\)\.tgz,\1,g'`
-    exit 1
-}
-
-if [ $# -ne 1 ]; then
-    usage
-fi
-
-core=$1 ; shift
-
-if [ ! -f toolchain/binutils/binutils-xtensa_${core}.tgz \
-  -o ! -f toolchain/gcc/gcc-xtensa_${core}.tgz \
-  -o ! -f toolchain/gdb/gdb-xtensa_${core}.tgz ]; then
-    echo "ERROR: Did not find an installed Xtensa core overlay named '${core}'."
-    echo "ERROR: Please install it first with ./target/xtensa/xt-buildroot-overlay-install"
-    echo ""
-    usage
-fi
-
-#  Use preset buildroot config:
-cp target/xtensa/defconfig .defconfig-xtensa
-#  Set core name:
-sed -i -e 's,^BR2_xtensa_\(.*\)=y,BR2_xtensa_custom=y\nBR2_xtensa_custom_name="'${core}'",' .defconfig-xtensa
-##  sed -i -e 's,^.*BR2_xtensa_core_name.*,BR_xtensa_core_name="'${core}'",'  .defconfig-xtensa
-#  Create full .config with defaults:
-make clean defconfig CONFIG_DEFCONFIG=.defconfig-xtensa || exit 1
-
-#  Busybox adjustments:  turn off 'ar' (can't create archives yet overrides real one)
-#  and turn on NFS mounting (Xtensa defconfig turns on RPC so this can work):
-#
-bborig=`grep '^BR2_PACKAGE_BUSYBOX_CONFIG=' .config | sed -e 's,.*"\(.*\)".*,\1,'`
-bbconf=target/xtensa/busybox-config
-cp $bborig $bbconf
-sed -i -e 's,^CONFIG_AR=y,# CONFIG_AR is not set,' $bbconf
-sed -i -e 's,^.*CONFIG_FEATURE_MOUNT_NFS.*,CONFIG_FEATURE_MOUNT_NFS=y,' $bbconf
-#  Make use of above busybox adjustments:
-sed -i -e 's,.*\(BR2_PACKAGE_BUSYBOX_CONFIG\).*,\1="'$bbconf'",' .config
-
-echo "Done."
-
diff --git a/target/xtensa/uClibc-0.9.30.config b/target/xtensa/uClibc-0.9.30.config
deleted file mode 100644
index 5701fe4..0000000
--- a/target/xtensa/uClibc-0.9.30.config
+++ /dev/null
@@ -1,245 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Thu Jan 23 14:50:00 2009
-#
-# TARGET_alpha is not set
-# TARGET_arm is not set
-# TARGET_avr32 is not set
-# TARGET_bfin is not set
-# TARGET_cris is not set
-# TARGET_e1 is not set
-# TARGET_frv is not set
-# TARGET_h8300 is not set
-# TARGET_hppa is not set
-# TARGET_i386 is not set
-# TARGET_i960 is not set
-# TARGET_ia64 is not set
-# TARGET_m68k is not set
-# TARGET_microblaze is not set
-# TARGET_mips is not set
-# TARGET_nios is not set
-# TARGET_nios2 is not set
-# TARGET_powerpc is not set
-# TARGET_sh is not set
-# TARGET_sh64 is not set
-# TARGET_sparc is not set
-# TARGET_v850 is not set
-# TARGET_vax is not set
-# TARGET_x86_64 is not set
-TARGET_xtensa=y
-
-#
-# Target Architecture Features and Options
-#
-TARGET_ARCH="xtensa"
-FORCE_OPTIONS_FOR_ARCH=y
-# ARCH_LITTLE_ENDIAN is not set
-# ARCH_BIG_ENDIAN is not set
-# ARCH_WANTS_LITTLE_ENDIAN is not set
-# ARCH_WANTS_BIG_ENDIAN is not set
-
-#
-# Using ELF file format
-#
-ARCH_HAS_MMU=y
-ARCH_USE_MMU=y
-UCLIBC_HAS_FLOATS=y
-UCLIBC_HAS_FPU=y
-DO_C99_MATH=y
-# UCLIBC_HAS_FENV is not set
-UCLIBC_HAS_LONG_DOUBLE_MATH=y
-KERNEL_HEADERS="/usr/src/linux/include"
-HAVE_DOT_CONFIG=y
-
-#
-# General Library Settings
-#
-# HAVE_NO_PIC is not set
-DOPIC=y
-# ARCH_HAS_NO_SHARED is not set
-# ARCH_HAS_NO_LDSO is not set
-HAVE_SHARED=y
-# FORCE_SHAREABLE_TEXT_SEGMENTS is not set
-LDSO_LDD_SUPPORT=y
-LDSO_CACHE_SUPPORT=y
-# LDSO_PRELOAD_FILE_SUPPORT is not set
-LDSO_BASE_FILENAME="ld.so"
-# UCLIBC_STATIC_LDCONFIG is not set
-# LDSO_RUNPATH is not set
-UCLIBC_CTOR_DTOR=y
-# LDSO_GNU_HASH_SUPPORT is not set
-# HAS_NO_THREADS is not set
-UCLIBC_HAS_THREADS=y
-PTHREADS_DEBUG_SUPPORT=y
-LINUXTHREADS_OLD=y
-UCLIBC_HAS_SYSLOG=y
-UCLIBC_HAS_LFS=y
-# MALLOC is not set
-# MALLOC_SIMPLE is not set
-MALLOC_STANDARD=y
-MALLOC_GLIBC_COMPAT=y
-UCLIBC_DYNAMIC_ATEXIT=y
-# COMPAT_ATEXIT is not set
-UCLIBC_SUSV3_LEGACY=y
-UCLIBC_SUSV3_LEGACY_MACROS=y
-# UCLIBC_HAS_STUBS is not set
-UCLIBC_HAS_SHADOW=y
-UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y
-UCLIBC_HAS___PROGNAME=y
-UCLIBC_HAS_PTY=y
-UNIX98PTY_ONLY=y
-# UCLIBC_HAS_GETPT is not set
-ASSUME_DEVPTS=y
-UCLIBC_HAS_TM_EXTENSIONS=y
-UCLIBC_HAS_TZ_CACHING=y
-UCLIBC_HAS_TZ_FILE=y
-UCLIBC_HAS_TZ_FILE_READ_MANY=y
-UCLIBC_TZ_FILE_PATH="/etc/TZ"
-
-#
-# Advanced Library Settings
-#
-UCLIBC_PWD_BUFFER_SIZE=256
-UCLIBC_GRP_BUFFER_SIZE=256
-UCLIBC_HAS_NONREENTRANT=y
-
-#
-# Networking Support
-#
-
-UCLIBC_LINUX_MODULE_24=y
-UCLIBC_LINUX_SPECIFIC=y
-UCLIBC_HAS_GNU_ERROR=y
-UCLIBC_BSD_SPECIFIC=y
-UCLIBC_HAS_BSD_ERR=y
-UCLIBC_HAS_OBSOLETE_BSD_SIGNAL=y
-UCLIBC_HAS_OBSOLETE_SYSV_SIGNAL=y
-# UCLIBC_NTP_LEGACY is not set
-# UCLIBC_SV4_DEPRECATED is not set
-UCLIBC_HAS_REALTIME=y
-UCLIBC_HAS_ADVANCED_REALTIME=y
-UCLIBC_HAS_EPOLL=y
-UCLIBC_HAS_XATTR=y
-UCLIBC_HAS_PROFILING=y
-UCLIBC_HAS_CRYPT_IMPL=y
-UCLIBC_HAS_CRYPT=y
-UCLIBC_HAS_NETWORK_SUPPORT=y
-UCLIBC_HAS_SOCKET=y
-UCLIBC_HAS_IPV4=y
-UCLIBC_HAS_IPV6=y
-UCLIBC_HAS_RPC=y
-UCLIBC_HAS_FULL_RPC=y
-UCLIBC_HAS_REENTRANT_RPC=y
-UCLIBC_USE_NETLINK=y
-# UCLIBC_SUPPORT_AI_ADDRCONFIG is not set
-# UCLIBC_HAS_BSD_RES_CLOSE is not set
-
-
-#
-# String and Stdio Support
-#
-# UCLIBC_HAS_STRING_GENERIC_OPT is not set
-# UCLIBC_HAS_STRING_ARCH_OPT is not set
-UCLIBC_HAS_CTYPE_TABLES=y
-UCLIBC_HAS_CTYPE_SIGNED=y
-# UCLIBC_HAS_CTYPE_UNSAFE is not set
-# UCLIBC_HAS_CTYPE_CHECKED is not set
-# UCLIBC_HAS_CTYPE_ENFORCED is not set
-# UCLIBC_HAS_WCHAR is not set
-# UCLIBC_HAS_LOCALE is not set
-UCLIBC_HAS_HEXADECIMAL_FLOATS=y
-UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
-# USE_OLD_VFPRINTF is not set
-UCLIBC_PRINTF_SCANF_POSITIONAL_ARGS=9
-UCLIBC_HAS_SCANF_GLIBC_A_FLAG=y
-# UCLIBC_HAS_STDIO_BUFSIZ_NONE is not set
-# UCLIBC_HAS_STDIO_BUFSIZ_256 is not set
-# UCLIBC_HAS_STDIO_BUFSIZ_512 is not set
-# UCLIBC_HAS_STDIO_BUFSIZ_1024 is not set
-# UCLIBC_HAS_STDIO_BUFSIZ_2048 is not set
-UCLIBC_HAS_STDIO_BUFSIZ_4096=y
-# UCLIBC_HAS_STDIO_BUFSIZ_8192 is not set
-UCLIBC_HAS_STDIO_BUILTIN_BUFFER_NONE=y
-# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_4 is not set
-# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_8 is not set
-# UCLIBC_HAS_STDIO_SHUTDOWN_ON_ABORT is not set
-# UCLIBC_HAS_STDIO_GETC_MACRO is not set
-# UCLIBC_HAS_STDIO_PUTC_MACRO is not set
-UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
-# UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set
-UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
-UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
-UCLIBC_HAS_PRINTF_M_SPEC=y
-UCLIBC_HAS_ERRNO_MESSAGES=y
-# UCLIBC_HAS_SYS_ERRLIST is not set
-UCLIBC_HAS_SIGNUM_MESSAGES=y
-# UCLIBC_HAS_SYS_SIGLIST is not set
-UCLIBC_HAS_GNU_GETOPT=y
-# UCLIBC_HAS_GNU_GETSUBOPT is not set
-
-#
-# Big and Tall
-#
-UCLIBC_HAS_REGEX=y
-# UCLIBC_HAS_REGEX_OLD is not set
-UCLIBC_HAS_FNMATCH=y
-# UCLIBC_HAS_FNMATCH_OLD is not set
-# UCLIBC_HAS_WORDEXP is not set
-UCLIBC_HAS_FTW=y
-UCLIBC_HAS_GLOB=y
-UCLIBC_HAS_GNU_GLOB=y
-
-#
-# Library Installation Options
-#
-SHARED_LIB_LOADER_PREFIX="/lib"
-RUNTIME_PREFIX="/"
-DEVEL_PREFIX="/usr/"
-
-#
-# Security options
-#
-# UCLIBC_BUILD_PIE is not set
-UCLIBC_HAS_ARC4RANDOM=y
-# HAVE_NO_SSP is not set
-# UCLIBC_HAS_SSP is not set
-UCLIBC_BUILD_RELRO=y
-UCLIBC_BUILD_NOW=y
-# UCLIBC_BUILD_NOEXECSTACK is not set
-
-#
-# uClibc development/debugging options
-#
-CROSS_COMPILER_PREFIX=""
-UCLIBC_EXTRA_CFLAGS=""
-# DODEBUG is not set
-# DODEBUG_PT is not set
-DOSTRIP=y
-# DOASSERTS is not set
-# SUPPORT_LD_DEBUG is not set
-# SUPPORT_LD_DEBUG_EARLY is not set
-# UCLIBC_MALLOC_DEBUGGING is not set
-WARNINGS="-Wall"
-# EXTRA_WARNINGS is not set
-# DOMULTI is not set
-# UCLIBC_MJN3_ONLY is not set
-
-# USE_BX is not set
-# CONFIG_GENERIC_ARM is not set
-# CONFIG_ARM610 is not set
-# CONFIG_ARM710 is not set
-# CONFIG_ARM7TDMI is not set
-# CONFIG_ARM720T is not set
-# CONFIG_ARM920T is not set
-# CONFIG_ARM922T is not set
-# CONFIG_ARM926T is not set
-# CONFIG_ARM10T is not set
-# CONFIG_ARM1136JF_S is not set
-# CONFIG_ARM1176JZ_S is not set
-# CONFIG_ARM1176JZF_S is not set
-# CONFIG_ARM_CORTEX_M3 is not set
-# CONFIG_ARM_CORTEX_M1 is not set
-# CONFIG_ARM_SA110 is not set
-# CONFIG_ARM_SA1100 is not set
-# CONFIG_ARM_XSCALE is not set
-# CONFIG_ARM_IWMMXT is not set
diff --git a/target/xtensa/uClibc.config b/target/xtensa/uClibc.config
deleted file mode 100644
index cd82fab..0000000
--- a/target/xtensa/uClibc.config
+++ /dev/null
@@ -1,190 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Thu Jan 10 00:46:51 2008
-#
-# TARGET_alpha is not set
-# TARGET_arm is not set
-# TARGET_avr32 is not set
-# TARGET_bfin is not set
-# TARGET_cris is not set
-# TARGET_e1 is not set
-# TARGET_frv is not set
-# TARGET_h8300 is not set
-# TARGET_hppa is not set
-# TARGET_i386 is not set
-# TARGET_i960 is not set
-# TARGET_ia64 is not set
-# TARGET_m68k is not set
-# TARGET_microblaze is not set
-# TARGET_mips is not set
-# TARGET_nios is not set
-# TARGET_nios2 is not set
-# TARGET_powerpc is not set
-# TARGET_sh is not set
-# TARGET_sh64 is not set
-# TARGET_sparc is not set
-# TARGET_v850 is not set
-# TARGET_vax is not set
-# TARGET_x86_64 is not set
-TARGET_xtensa=y
-
-#
-# Target Architecture Features and Options
-#
-TARGET_ARCH="xtensa"
-TARGET_SUBARCH=""
-
-#
-# Using ELF file format
-#
-ARCH_HAS_MMU=y
-ARCH_USE_MMU=y
-UCLIBC_HAS_FLOATS=y
-UCLIBC_HAS_FPU=y
-DO_C99_MATH=y
-KERNEL_HEADERS="/usr/src/linux/include"
-HAVE_DOT_CONFIG=y
-
-#
-# General Library Settings
-#
-# HAVE_NO_PIC is not set
-DOPIC=y
-# HAVE_NO_SHARED is not set
-# ARCH_HAS_NO_LDSO is not set
-HAVE_SHARED=y
-# FORCE_SHAREABLE_TEXT_SEGMENTS is not set
-LDSO_LDD_SUPPORT=y
-LDSO_CACHE_SUPPORT=y
-# LDSO_PRELOAD_FILE_SUPPORT is not set
-LDSO_BASE_FILENAME="ld.so"
-# UCLIBC_STATIC_LDCONFIG is not set
-# LDSO_RUNPATH is not set
-UCLIBC_CTOR_DTOR=y
-# HAS_NO_THREADS is not set
-UCLIBC_HAS_THREADS=y
-PTHREADS_DEBUG_SUPPORT=y
-LINUXTHREADS_OLD=y
-UCLIBC_HAS_LFS=y
-# MALLOC is not set
-# MALLOC_SIMPLE is not set
-MALLOC_STANDARD=y
-MALLOC_GLIBC_COMPAT=y
-UCLIBC_DYNAMIC_ATEXIT=y
-# COMPAT_ATEXIT is not set
-# UCLIBC_SUSV3_LEGACY is not set
-UCLIBC_SUSV3_LEGACY_MACROS=y
-UCLIBC_HAS_SHADOW=y
-UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y
-UCLIBC_HAS___PROGNAME=y
-# UNIX98PTY_ONLY is not set
-ASSUME_DEVPTS=y
-UCLIBC_HAS_TM_EXTENSIONS=y
-UCLIBC_HAS_TZ_CACHING=y
-UCLIBC_HAS_TZ_FILE=y
-UCLIBC_HAS_TZ_FILE_READ_MANY=y
-UCLIBC_TZ_FILE_PATH="/etc/TZ"
-
-#
-# Advanced Library Settings
-#
-UCLIBC_PWD_BUFFER_SIZE=256
-UCLIBC_GRP_BUFFER_SIZE=256
-
-#
-# Networking Support
-#
-UCLIBC_HAS_IPV6=y
-UCLIBC_HAS_RPC=y
-UCLIBC_HAS_FULL_RPC=y
-UCLIBC_HAS_REENTRANT_RPC=y
-# UCLIBC_USE_NETLINK is not set
-# UCLIBC_HAS_BSD_RES_CLOSE is not set
-
-#
-# String and Stdio Support
-#
-UCLIBC_HAS_STRING_GENERIC_OPT=y
-UCLIBC_HAS_STRING_ARCH_OPT=y
-UCLIBC_HAS_CTYPE_TABLES=y
-UCLIBC_HAS_CTYPE_SIGNED=y
-# UCLIBC_HAS_CTYPE_UNSAFE is not set
-UCLIBC_HAS_CTYPE_CHECKED=y
-# UCLIBC_HAS_CTYPE_ENFORCED is not set
-# UCLIBC_HAS_WCHAR is not set
-# UCLIBC_HAS_LOCALE is not set
-UCLIBC_HAS_HEXADECIMAL_FLOATS=y
-UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
-# USE_OLD_VFPRINTF is not set
-UCLIBC_PRINTF_SCANF_POSITIONAL_ARGS=9
-UCLIBC_HAS_SCANF_GLIBC_A_FLAG=y
-# UCLIBC_HAS_STDIO_BUFSIZ_NONE is not set
-# UCLIBC_HAS_STDIO_BUFSIZ_256 is not set
-# UCLIBC_HAS_STDIO_BUFSIZ_512 is not set
-# UCLIBC_HAS_STDIO_BUFSIZ_1024 is not set
-# UCLIBC_HAS_STDIO_BUFSIZ_2048 is not set
-UCLIBC_HAS_STDIO_BUFSIZ_4096=y
-# UCLIBC_HAS_STDIO_BUFSIZ_8192 is not set
-UCLIBC_HAS_STDIO_BUILTIN_BUFFER_NONE=y
-# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_4 is not set
-# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_8 is not set
-# UCLIBC_HAS_STDIO_SHUTDOWN_ON_ABORT is not set
-UCLIBC_HAS_STDIO_GETC_MACRO=y
-UCLIBC_HAS_STDIO_PUTC_MACRO=y
-UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
-# UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set
-UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
-UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
-UCLIBC_HAS_PRINTF_M_SPEC=y
-UCLIBC_HAS_ERRNO_MESSAGES=y
-# UCLIBC_HAS_SYS_ERRLIST is not set
-UCLIBC_HAS_SIGNUM_MESSAGES=y
-# UCLIBC_HAS_SYS_SIGLIST is not set
-UCLIBC_HAS_GNU_GETOPT=y
-UCLIBC_HAS_GNU_GETSUBOPT=y
-
-#
-# Big and Tall
-#
-UCLIBC_HAS_REGEX=y
-UCLIBC_HAS_REGEX_OLD=y
-UCLIBC_HAS_FNMATCH=y
-UCLIBC_HAS_FNMATCH_OLD=y
-# UCLIBC_HAS_WORDEXP is not set
-UCLIBC_HAS_FTW=y
-UCLIBC_HAS_GLOB=y
-UCLIBC_HAS_GNU_GLOB=y
-
-#
-# Library Installation Options
-#
-SHARED_LIB_LOADER_PREFIX="/lib"
-RUNTIME_PREFIX="/"
-DEVEL_PREFIX="/usr/"
-
-#
-# Security options
-#
-# UCLIBC_HAS_ARC4RANDOM is not set
-# HAVE_NO_SSP is not set
-# UCLIBC_HAS_SSP is not set
-UCLIBC_BUILD_RELRO=y
-UCLIBC_BUILD_NOW=y
-# UCLIBC_BUILD_NOEXECSTACK is not set
-
-#
-# uClibc development/debugging options
-#
-CROSS_COMPILER_PREFIX=""
-UCLIBC_EXTRA_CFLAGS=""
-# DODEBUG is not set
-# DOSTRIP is not set
-# DODEBUG_PT is not set
-# DOASSERTS is not set
-SUPPORT_LD_DEBUG=y
-# SUPPORT_LD_DEBUG_EARLY is not set
-# UCLIBC_MALLOC_DEBUGGING is not set
-WARNINGS="-Wall"
-EXTRA_WARNINGS=y
-# DOMULTI is not set
-# UCLIBC_MJN3_ONLY is not set
diff --git a/target/xtensa/xt-buildroot-overlay-install b/target/xtensa/xt-buildroot-overlay-install
deleted file mode 100644
index d2afce1..0000000
--- a/target/xtensa/xt-buildroot-overlay-install
+++ /dev/null
@@ -1,488 +0,0 @@
-#!/bin/sh
-#  Not every host installs perl at the same location, handle many locations:
-PATH=/usr/bin:/usr/local/bin:$PATH
-exec perl -x -S $0 ${1+"$@"}
-exit $?
-#!perl -w
-#line 8
-
-#  xt-buildroot-overlay-install [-t overlay_tarball] [-b buildroot_dir] \
-#				[-k kernel_dir] \
-#				[-c config_name] [-l long_name] [-f] [--help]
-#
-#  Creates individual overlay tarballs for gcc, binutils, gdb, and
-#  the Linux kernel, out of the Xtensa Configuration Overlay tarball from
-#  a Tensilica Core Package.  And installs these individual tarballs
-#  at the appropriate locations within a buildroot source tree.
-#
-#  The Xtensa configuration overlay tarball is located in:
-#	<xtensa_root>/src/xtensa-config-overlay.tar.gz
-#  where <xtensa_root> is the path to the Tensilica Core Package.
-#
-# Copyright (c) 2003-2009 by Tensilica Inc.
-#  History:
-#  2007-NOV-08	1.0	meg	Initial version
-#  2007-NOV-21	1.1	meg	Add -k parameter
-#  2007-DEC-06	1.2	meg	Make -k and -b optional, check overlay sw vers.
-#  2008-FEB-27	1.3	meg	Accept Xtensa Tools RB-2008.3 overlays
-
-$progvers = "1.3";
-$progname = $0;
-$progname =~ s|.*[/\\:]||;
-
-
-######################################################################
-#
-#  Parse cmdline
-#
-
-my $overlay_tarball = undef;
-my $buildroot_dir = undef;
-my $kernel_dir = undef;
-my $config_name = undef;
-my $config_long_name = undef;
-my $force_clobber = 0;
-my $prompt = 1;		# undocumented option
-
-sub usage {
-    print "$progname version $progvers\n"
-    	 ."Usage:  $progname <parameters> [<options>]\n"
-	 ."Where <parameters> are:\n"
-	 ."  -t file.tgz     Specify path to the Xtensa Linux overlay tarball, typically\n"
-	 ."                  <xtensa_root>/src/xtensa-config-overlay.tar.gz\n"
-	 ."  -b dir          Path to the base of the buildroot source tree, in which\n"
-	 ."                  package specific overlay tarballs get installed.\n"
-	 ."  -k dir          Path to the base of the Linux kernel source tree, in which\n"
-	 ."                  the Linux kernel specific overlay gets installed.\n"
-	 ."  -c config_name  Name for the Xtensa processor configuration as it will be\n"
-	 ."                  known to the open source community.  Must be a lowercase\n"
-	 ."                  identifier, starting with a letter, consisting of letters\n"
-	 ."                  and numbers and underscores, not ending with underscore\n"
-	 ."                  and not containing consecutive underscores.  For examples:\n"
-	 ."                     dc232b , dc232b_be , mmubasele , fsf , s5000 .\n"
-	 ."  -l long_name    Long name for the Xtensa processor configuration, human-\n"
-	 ."                  readable with spaces etc allowed (must be quoted).\n"
-	 ."                  For example:  'Diamond 232L Standard Core Rev.B (LE)'\n"
-	 ."                  Try to keep it within approximately 40 characters.\n"
-	 ."And <options> are:\n"
-	 ."  -f              If package specific overlay tarballs already exist in\n"
-	 ."                  the destination source tree, overwrite them without asking.\n"
-	 ."  --help          Show this usage message.\n";
-}
-
-#  Get arguments:
-if (!@ARGV) {
-    usage();
-    exit 0;
-}
-while( defined($_ = shift) ) {
-    if( /^-[tbclk]$/ ) {		# option taking an argument
-	my $arg = shift;
-	if( !defined($arg) ) {
-	    print STDERR "$progname: ERROR: missing parameter after '$_' option\n\n";
-	    usage();
-	    exit 1;
-	}
-	$overlay_tarball = $arg if $_ eq "-t";
-	$buildroot_dir = $arg if $_ eq "-b";
-	$kernel_dir = $arg if $_ eq "-k";
-	$config_name = $arg if $_ eq "-c";
-	$config_long_name = $arg if $_ eq "-l";
-	next;
-    }
-    if( /^-f$/ ) {
-	$force_clobber = 1;
-	next;
-    }
-    if( /^--[m-t]{8}$/ && /[new]([wow])([pup])[fur]\1[maze]\2[tuff]/ ) {
-	$prompt = 0;
-	next;
-    }
-    if( /^-(h|help|\-h|\-help|\?)$/i ) {
-	usage();
-	exit 0;
-    }
-    print STDERR "$progname: ERROR: unrecognized option or argument '$_'\n\n";
-    usage();
-    exit 1;
-}
-
-
-######################################################################
-#
-#  Validate cmdline arguments
-#
-
-ErrorU("missing -c argument (core name)")
-	unless defined($config_name);
-#  Try to enforce reasonable names:
-ErrorU("-c: malformed core name '$config_name' (must be lowercase, letter followed by letters/digits, may contain underscore separators)")
-	unless $config_name =~ /^[a-z][a-z0-9]*(_[a-z0-9]+)*$/;
-ErrorU("-c: core name too short '$config_name'")
-	unless length($config_name) >= 2;
-ErrorU("-c: core name too long '$config_name'")
-	unless length($config_name) <= 16;
-
-
-ErrorU("missing -l argument (core long name)")
-	unless defined($config_long_name);
-$config_long_name =~ s/^\s+//;	# trim extra whitespace...
-$config_long_name =~ s/\s+$//;
-$config_long_name =~ s/\s+/ /g;
-#  Try to enforce reasonable names:
-ErrorU("-l: invalid (non-ASCII-printable) characters in core long name '$config_long_name'")
-	unless $config_long_name =~ /^[\x20-\x7E]+$/;
-ErrorU("-l: disallowed characters (\"\'\\) in core long name '$config_long_name'")
-	if $config_long_name =~ /[\'\"\\]/;
-ErrorU("-l: core long name too short '$config_long_name'")
-	unless length($config_long_name) >= 5;
-ErrorU("-l: core long name too long '$config_long_name'")
-	unless length($config_long_name) <= 60;
-
-
-#ErrorU("missing -b argument (buildroot source tree directory)")
-#	unless defined($buildroot_dir);
-if (defined($buildroot_dir)) {
-    ErrorU("-b: not a directory: $buildroot_dir")
-	    unless -d $buildroot_dir;
-    foreach my $p ("toolchain/gcc", "toolchain/binutils", "toolchain/gdb", "target/xtensa") {
-	ErrorU("-b: not a buildroot directory: missing $buildroot_dir/$p")
-	    unless -d $buildroot_dir . "/" . $p;
-    }
-}
-
-
-#ErrorU("missing -k argument (Linux kernel source tree directory)")
-#	unless defined($kernel_dir);
-if (defined($kernel_dir)) {
-    ErrorU("-k: not a directory: $kernel_dir")
-	    unless -d $kernel_dir;
-    foreach my $p ("kernel", "arch/xtensa/kernel", "include/asm-xtensa") {
-	ErrorU("-k: not a Linux kernel directory: missing $kernel_dir/$p")
-	    unless -d $kernel_dir . "/" . $p;
-    }
-}
-
-
-if (!defined($buildroot_dir) and !defined($kernel_dir)) {
-    print STDERR "$progname: WARNING:\n";
-    print STDERR "$progname: WARNING: Test run only, NOTHING WILL BE INSTALLED\n";
-    print STDERR "$progname: WARNING: (use -b and -k to specify install destination)\n";
-    print STDERR "$progname: WARNING:\n";
-}
-
-
-my @ovpaths = ( "/src/xtensa-config-overlay.tar.gz",
-		"/xtensa-elf/src/linux/misc/linux-overlay.tar.gz" );
-if (!defined($overlay_tarball)) {
-    #  Try to locate the overlay tarball based on XTENSA_SYSTEM and XTENSA_CORE
-    #  settings:
-    my $xtensa_root = `xt-xcc --show-config=config 2>/dev/null`;
-    $xtensa_root = "" unless defined($xtensa_root);
-    chomp($xtensa_root);
-    if ($xtensa_root ne "") {
-	($overlay_tarball) = grep(-f $xtensa_root.$_, @ovpaths);
-	if (!defined($overlay_tarball)) {
-	    ErrorU("Xtensa configuration overlay tarball not found: ".$xtensa_root.$ovpaths[0])
-	}
-    } else {
-	ErrorU("missing -t argument (Xtensa configuration overlay tarball filename)\n"
-	     ."and no default Xtensa Core Package defined in the environment");
-    }
-} else {
-    foreach my $p ("", @ovpaths) {
-	if (-f $overlay_tarball.$p) {
-	    $overlay_tarball .= $p;
-	    last;
-	}
-    }
-    ErrorU("-t: file not found: $overlay_tarball") unless -f $overlay_tarball;
-}
-
-
-######################################################################
-#
-#  Misc
-#
-
-my $overlay_unpacked = 0;
-my $ovdir;
-
-sub cleanup {
-    if ($overlay_unpacked) {
-	system("rm -rf '$ovdir' 2>/dev/null");
-    }
-}
-
-sub ErrorEmit {
-    my ($msg,$usage) = @_;
-    $msg =~ s|\n|"\n${progname}: ERROR: "|ge;
-    print STDERR "$progname: ERROR: $msg\n";
-    if ($usage) {
-	print "\n";
-	usage();
-    }
-    cleanup();
-    exit 1;
-}
-sub ErrorU { ErrorEmit(shift,1); }
-sub Error  { ErrorEmit(shift); }
-
-
-#  Read specified file (as binary), returning contents.
-#
-sub readfile {
-    my ($filename) = @_;
-    #  Read the file:
-    open(INFILE,"<$filename") or Error("error reading from '$filename': $!");
-    my $savesep = $/;
-    undef $/;
-    my $file = <INFILE>;
-    $/ = $savesep;
-    close(INFILE);
-    $file;
-}                                                                                                       
-
-#  Write specified file (as binary) with first argument (string).
-#
-sub writefile {
-    my ($filename, $file) = @_;
-    #  Read the file:
-    open(INFILE,">$filename") or Error("error writing to '$filename': $!");
-    print INFILE $file;
-    close(INFILE) or Error("error closing file '$filename': $!");
-}                                                                                                       
-
-
-######################################################################
-#
-#  Determine a temporary directory.
-#
-
-my $tmpdir = "/tmp";
-if (defined($ENV{"TMP"}) and -d $ENV{"TMP"}) {
-    $tmpdir = $ENV{"TMP"};
-} elsif (defined($ENV{"TEMP"}) and -d $ENV{"TEMP"}) {
-    $tmpdir = $ENV{"TEMP"};
-}
-
-
-######################################################################
-#
-#  Unpack the general overlay tarball
-#
-
-my $user = defined($ENV{"USER"}) ? $ENV{"USER"} : "xtensa";
-$ovdir = $tmpdir."/tmp-overlay-${user}-$$";
-mkdir $ovdir or Error("cannot create directory $ovdir");
-$overlay_unpacked = 1;
-system("tar xfz '$overlay_tarball' -C '$ovdir'")
-	and Error("tar failed...");
-
-
-######################################################################
-#
-#  Define and sanity check contents of overlay
-#
-
-my $oldpack = -f $ovdir."/xtensa-elf/src/linux/misc/core.h";
-my $pf1 = ($oldpack ? "src/" : "");
-my $pf2 = ($oldpack ? "xtensa-elf/src/linux/misc/" : "config/");
-
-my @packages = (
-	["binutils", "toolchain/binutils",
-		["${pf1}/binutils/xtensa-modules.c",	"bfd/"],
-		["${pf1}/binutils/xtensa-config.h",	"include/"],
-		#["${pf1}/binutils/xtensa-config.sh",	"ld/emulparams/"],
-		],
-	["gcc", "toolchain/gcc",
-		["${pf1}/gcc/xtensa-config.h",	"include/"],
-		],
-	["gdb", "toolchain/gdb",
-		["${pf1}/gdb/xtensa-modules.c",	"bfd/"],
-		["${pf1}/gdb/xtensa-config.h",	"include/"],
-		["${pf1}/gdb/xtensa-config.c",	"gdb/"],
-		["${pf1}/gdb/xtensa-regmap.c",	"gdb/gdbserver/"],
-		["${pf1}/gdb/xtensa-regmap.c",	"gdb/gdbserver/xtensa-xtregs.c"],	# for GDB 6.8
-		["${pf1}/gdb/xtensa-regmap.c",	"gdb/xtensa-xtregs.c"],			# for GDB 6.8
-		["${pf1}/gdb/reg-xtensa.dat",	"gdb/regformats/"],
-		],
-	["kernel", "target/xtensa",		# ???
-		["${pf2}core.h",	"include/asm-xtensa/variant-${config_name}/"],
-		["${pf2}tie.h",		"include/asm-xtensa/variant-${config_name}/"],
-		["${pf2}tie-asm.h",	"include/asm-xtensa/variant-${config_name}/"],
-		],
-);
-
-#  Check that all files are present ...
-foreach my $pack (@packages) {
-    my ($pname, $buildroot_subdir, @files) = @$pack;
-    print "Checking files for $pname ...\n";
-    foreach my $f (@files) {
-	my ($src, $dst) = @$f;
-	-f $ovdir."/".$src or Error("missing '$src' in overlay tarball");
-    }
-}
-
-
-######################################################################
-#
-#  Extract some useful information
-#
-
-#  Extract core name as specified in the build.
-my $coreh = readfile($ovdir."/".$pf2."core.h");
-
-$coreh =~ /^\s*\#\s*define\s+XCHAL_SW_VERSION\s+(\w+)/m;
-my $swversion = $1;
-defined($swversion) or Error("missing XCHAL_SW_VERSION in overlay core.h file;\n"
-	."overlay is too old, need RB-2008.3 (SW version 7.1.1) or later");
-
-$coreh =~ /^\s*\#\s*define\s+XCHAL_CORE_ID\s+"([^"]+)"/m;
-my $coreid = $1;
-defined($coreid) or Error("missing XCHAL_CORE_ID in overlay core.h file");
-
-$coreh =~ /^\s*\#\s*define\s+XCHAL_HW_VERSION_NAME\s+"([^"]+)"/m;
-my $hwversion = $1;
-defined($hwversion) or Error("missing XCHAL_HW_VERSION_NAME in overlay core.h file");
-
-
-$swvers_human = sprintf("%u.%u.%u",
-	$swversion/100000, (($swversion/1000) % 100), ($swversion % 1000));
-my $release = "software version $swvers_human";
-if (-f $ovdir."/release") {
-    $release = readfile($ovdir."/release");
-    chomp($release);
-}
-
-
-######################################################################
-#
-#  Prompt user to be sure this is what he wants to do
-#
-
-#  Catch Ctrl-C so we can do a proper cleanup:
-sub catch_term {
-    my $signame = shift;
-    #print STDERR "whoa!\n";
-    cleanup();
-    print STDERR "\n$progname: Cleaned up.\n";
-    exit 3;
-}
-$SIG{TERM} = \&catch_term;
-$SIG{HUP} = \&catch_term;
-$SIG{INT} = \&catch_term;
-
-$| = 1;
-print	"\n",
-	"About to generate package-specific overlay tarballs for the following:\n",
-	"\n",
-	"   Xtensa processor short name:   $config_name\n";
-print	"      This short name overrides the name specified in the XPG:  $coreid\n" if $coreid ne $config_name;
-#print	"      Please ensure that's the name you want.  If submitted to the open source\n",
-#	"      community, it can be a hassle to change later on.\n";
-print	"   Xtensa processor description:  $config_long_name\n",
-	"   Targeting Xtensa HW version:   $hwversion\n",
-	"   Xtensa configuration overlay:  $overlay_tarball\n",
-	"           (release of overlay):  $release\n",
-	"   Destination buildroot dir:     ".(defined($buildroot_dir)?$buildroot_dir:"(none, not installed)")."\n",
-	"   Destination Linux kernel dir:  ".(defined($kernel_dir)?$kernel_dir:"(none, not installed)")."\n",
-	"\n",
-	"Are you sure? (y/n) ";
-if ($prompt) {
-    my $line = <STDIN>;
-    chomp($line);
-    if ($line !~ /^y(es)?$/i) {
-	print "\nInstallation aborted.\n";
-	cleanup();
-	exit 2;
-    }
-} else {
-    print "YES [no prompt]\n";
-}
-print "\n";
-
-
-######################################################################
-#
-#  Now generate the tarballs
-#
-
-#  Now generate each tarball ...
-foreach my $pack (@packages) {
-    my ($pname, $buildroot_subdir, @files) = @$pack;
-    my $tarname = "${pname}-xtensa_${config_name}.tgz";
-    my $fulltarname;
-    if (defined($buildroot_dir)) {
-	my $tarsubname = $buildroot_subdir . "/" . $tarname;
-	print "Generating and installing $tarsubname ...\n";
-	$fulltarname = $buildroot_dir . "/" . $tarsubname;
-    } else {
-	print "Generating $tarname ...\n";
-	$fulltarname = $ovdir . "/" . $tarname;
-    }
-    if (-e $fulltarname) {
-	if ($force_clobber or !defined($buildroot_dir)) {
-	    unlink($fulltarname) or Error("could not delete '$fulltarname': $!");
-	} else {
-	    Error("destination tarball already exists: '$fulltarname'");
-	}
-    }
-    my $pdir = $ovdir."/tmp-".$pname;
-    system("rm -fr '${pdir}' 2>/dev/null");
-    mkdir $pdir or Error("cannot create directory $pdir");
-    foreach my $f (@files) {
-	my ($src, $dst) = @$f;
-	#  If $dst ends in / , take filename from $src :
-	if ($dst =~ m|/$|) {
-	    my $fname = $src;
-	    $fname =~ s|^.*/||;
-	    $dst .= $fname;
-	}
-	#  Ensure destination directory exists:
-	my $dstdir = $pdir;
-	while ($dst =~ s|^([^/]+)/+||) {
-	    $dstdir .= "/" . $1;
-	    mkdir($dstdir);
-	}
-	#  Read file:
-	my $content = readfile($ovdir."/".$src);
-
-	#  Adjust contents of file.
-	#  Fix-up typo:
-	$content =~ s/XCHAL_SA_(NCP|CP\d+)_/XCHAL_$1_SA_/g;
-	#  Update core name info:
-	my $iscore = ($content =~ s/^(\s*\#\s*define\s+XCHAL_CORE_ID\s+)"[^"]+"/$1"$config_name"/mg);
-	$iscore or $content =~ s{^(\s*\#\s*define\s+XCHAL_INST_FETCH_WIDTH\s+\S+\s*(/\*[^\*]*\*/)?\s*$)}
-				{$1\n\#undef XCHAL_CORE_ID\n\#define XCHAL_CORE_ID\t\t\t"$config_name"\n}smg;
-	#  Update core description info:
-	$content =~ s/^(\s*\#\s*define\s+XCHAL_CORE_DESCRIPTION\s+)"[^"]+"/$1"$config_long_name"/mg
-	  or $content =~ s{^(\s*\#\s*define\s+XCHAL_CORE_ID\s+\S+\s*(/\*[^\*]*\*/)?\s*$)}
-			  {"$1\n" . ($iscore ? "" : "\n\#undef XCHAL_CORE_DESCRIPTION\n")
-			   . "\#define XCHAL_CORE_DESCRIPTION\t\t\"${config_long_name}\""}smge;
-
-	#  Write (possibly modified) file:
-	writefile($dstdir."/".$dst, $content);
-    }
-    my $tarcmd = "tar cfz '${fulltarname}' -C '${pdir}' .";
-    system($tarcmd) and Error("failed executing: $tarcmd");
-
-    #  Install Linux kernel overlay:
-    if ($pname eq "kernel" and defined($kernel_dir)) {
-	print "Installing Linux kernel overlay from $tarname ...\n";
-	my $untarcmd = "tar xfz '${fulltarname}' -C '${kernel_dir}' .";
-	system($untarcmd) and Error("failed executing: $tarcmd");
-    }
-    #  Possible TODO:  update arch/xtensa/{Kconfig,Makefile} to add this config?
-}
-
-
-######################################################################
-#
-# The End
-#
-
-cleanup();
-print "Done.\n";
-exit 0;
-
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index a4faf4f..06e4f67 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -33,11 +33,6 @@ else
  GCC_SITE:=$(BR2_GNU_MIRROR)/gcc/gcc-$(GCC_VERSION)
 endif
 
-ifneq ($(filter xtensa%,$(ARCH)),)
-include target/xtensa/patch.in
-GCC_PATCH_EXTRA:=$(call XTENSA_PATCH,gcc,$(GCC_PATCH_DIR),. ..)
-endif
-
 GCC_SOURCE:=gcc-$(GCC_VERSION).tar.bz2
 GCC_PATCH_DIR:=toolchain/gcc/$(GCC_VERSION)
 GCC_DIR:=$(TOOLCHAIN_DIR)/gcc-$(GCC_VERSION)
diff --git a/toolchain/gdb/gdb.mk b/toolchain/gdb/gdb.mk
index b5c085b..b8f49e5 100644
--- a/toolchain/gdb/gdb.mk
+++ b/toolchain/gdb/gdb.mk
@@ -16,11 +16,6 @@ else
  GDB_PATCH_DIR:=toolchain/gdb/$(GDB_VERSION)
 endif
 
-ifneq ($(filter xtensa%,$(ARCH)),)
-include target/xtensa/patch.in
-GDB_PATCH_EXTRA:=$(call XTENSA_PATCH,gdb,$(GDB_PATCH_DIR),. ..)
-endif
-
 GDB_DIR:=$(TOOLCHAIN_DIR)/gdb-$(GDB_VERSION)
 
 $(DL_DIR)/$(GDB_SOURCE):
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index fb87a88..3c3fd0d 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -75,7 +75,7 @@ config BR2_NEEDS_GETTEXT_IF_LOCALE
 	default y if (BR2_NEEDS_GETTEXT && BR2_ENABLE_LOCALE)
 
 config BR2_USE_MMU
-	bool "Enable MMU support" if BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_sh || BR2_xtensa
+	bool "Enable MMU support" if BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_sh
 	default y if !BR2_bfin
 	help
 	  If your target has a MMU, you should say Y here.  If you
-- 
1.7.4.1
