From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Apr 2010 22:33:09 +0200
Subject: [Buildroot] [git commit master] Remove all TARGET_DEVICE_TABLE
	definitions
Message-ID: <20100418203519.E332F309B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=32241116c8211b1d4fe03a570523ecf8a4c71509
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We have a special case for Xtensa, which was patching the generic
device_table.txt. Instead of doing this, we just keep a copy of the
device table, specific to Xtensa, with Xtensa specifities. The fact
that the patch wasn't applying anymore on the generic device table is
a sign that the existing approach wasn't working anyway.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/device/Atmel/Makefile.in               |    1 -
 target/device/Atmel/atngw100-base/Makefile.in |    1 -
 target/device/Atmel/atngw100/Makefile.in      |    1 -
 target/device/Atmel/atstk1005/Makefile.in     |    1 -
 target/device/Atmel/atstk100x/Makefile.in     |    1 -
 target/device/KwikByte/kb9202/Makefile.in     |    1 -
 target/device/valka/Makefile.in               |    2 -
 target/device/xtensa/Makefile.in              |    8 -
 target/device/xtensa/device_table.diff        |   10 --
 target/device/xtensa/device_table.txt         |  189 +++++++++++++++++++++++++
 target/generic/Makefile.in                    |    2 -
 11 files changed, 189 insertions(+), 28 deletions(-)
 delete mode 100644 target/device/xtensa/device_table.diff
 create mode 100644 target/device/xtensa/device_table.txt

diff --git a/target/device/Atmel/Makefile.in b/target/device/Atmel/Makefile.in
index bf7a2d1..c5dfffd 100644
--- a/target/device/Atmel/Makefile.in
+++ b/target/device/Atmel/Makefile.in
@@ -8,7 +8,6 @@ BOARD_PATH:=$(call qstrip,$(BR2_BOARD_PATH))
 
 ATMEL_TARGET:=$(ATMEL_PATH)/root
 TARGET_SKELETON:=$(ATMEL_TARGET)/target_skeleton
-TARGET_DEVICE_TABLE:=$(ATMEL_TARGET)/device_table.txt
 TARGET_SKELETON_LINKS:=$(ATMEL_TARGET)/skel.tar.gz
 
 ifeq ($(BR2_avr32),y)
diff --git a/target/device/Atmel/atngw100-base/Makefile.in b/target/device/Atmel/atngw100-base/Makefile.in
index 467951f..c2f2969 100644
--- a/target/device/Atmel/atngw100-base/Makefile.in
+++ b/target/device/Atmel/atngw100-base/Makefile.in
@@ -1,5 +1,4 @@
 ifeq ($(BR2_TARGET_AVR32_ATNGW100_BASE),y)
 UBOOT_BOARD_NAME:=atngw100
 TARGET_SKELETON=$(BOARD_PATH)/target_skeleton
-TARGET_DEVICE_TABLE=$(BOARD_PATH)/device_table.txt
 endif
diff --git a/target/device/Atmel/atngw100/Makefile.in b/target/device/Atmel/atngw100/Makefile.in
index 3c34d8d..7e02d8e 100644
--- a/target/device/Atmel/atngw100/Makefile.in
+++ b/target/device/Atmel/atngw100/Makefile.in
@@ -1,5 +1,4 @@
 ifeq ($(BR2_TARGET_AVR32_ATNGW100),y)
 UBOOT_BOARD_NAME:=atngw100
 TARGET_SKELETON=$(BOARD_PATH)/target_skeleton
-TARGET_DEVICE_TABLE=$(BOARD_PATH)/device_table.txt
 endif
diff --git a/target/device/Atmel/atstk1005/Makefile.in b/target/device/Atmel/atstk1005/Makefile.in
index 4c3aadf..84b3107 100644
--- a/target/device/Atmel/atstk1005/Makefile.in
+++ b/target/device/Atmel/atstk1005/Makefile.in
@@ -1,4 +1,3 @@
 ifeq ($(strip $(BR2_TARGET_AVR32_ATSTK1005)),y)
 TARGET_SKELETON=$(BOARD_PATH)/target_skeleton
-TARGET_DEVICE_TABLE=$(BOARD_PATH)/device_table.txt
 endif
diff --git a/target/device/Atmel/atstk100x/Makefile.in b/target/device/Atmel/atstk100x/Makefile.in
index e9dd4dc..395c74a 100644
--- a/target/device/Atmel/atstk100x/Makefile.in
+++ b/target/device/Atmel/atstk100x/Makefile.in
@@ -1,5 +1,4 @@
 ifeq ($(strip $(BR2_TARGET_AVR32_ATSTK1002)),y)
 UBOOT_BOARD_NAME:=atstk1002
 TARGET_SKELETON=$(BOARD_PATH)/target_skeleton
-TARGET_DEVICE_TABLE=$(BOARD_PATH)/device_table.txt
 endif
diff --git a/target/device/KwikByte/kb9202/Makefile.in b/target/device/KwikByte/kb9202/Makefile.in
index 5d743ce..0048dcc 100644
--- a/target/device/KwikByte/kb9202/Makefile.in
+++ b/target/device/KwikByte/kb9202/Makefile.in
@@ -1,4 +1,3 @@
 BOARD_PATH=target/device/KwikByte/kb9202
 
 TARGET_SKELETON=$(BOARD_PATH)/target_skeleton
-TARGET_DEVICE_TABLE=$(BOARD_PATH)/device_table.txt
diff --git a/target/device/valka/Makefile.in b/target/device/valka/Makefile.in
index 0142246..fec4d88 100644
--- a/target/device/valka/Makefile.in
+++ b/target/device/valka/Makefile.in
@@ -2,7 +2,6 @@ ifeq ($(BR2_TARGET_VALKA),y)
 VALKA_PATH= target/device/valka
 
 TARGET_SKELETON=$(VALKA_PATH)/target_skeleton
-TARGET_DEVICE_TABLE=$(VALKA_PATH)/device_table.txt
 KERNEL_HEADERS_PATCH_DIR=target/device/Atmel/arch-avr32/kernel-headers-2.6.28.2
 
 valka_status:
@@ -10,7 +9,6 @@ valka_status:
 	@echo VALKA_PATH = $(VALKA_PATH)
 	@echo BOARD_NAME = $(BR_BOARD_NAME)
 	@echo TARGET_SKELETON = $(TARGET_SKELETON)
-	@echo TARGET_DEVICE_TABLE = $(TARGET_DEVICE_TABLE)
 	@echo BR2_PACKAGE_BUSYBOX_CONFIG = $(BR2_PACKAGE_BUSYBOX_CONFIG)
 	@echo BR2_PACKAGE_LINUX_KCONFIG = $(BR2_PACKAGE_LINUX_KCONFIG)
 	@echo "*****************************************************************"
diff --git a/target/device/xtensa/Makefile.in b/target/device/xtensa/Makefile.in
index 7c95c23..f878a82 100644
--- a/target/device/xtensa/Makefile.in
+++ b/target/device/xtensa/Makefile.in
@@ -6,12 +6,4 @@ ifeq ($(strip $(BR2_TARGET_XTENSA_XTAV60)),y)
 TARGET_SKELETON_PATCH:=target/device/xtensa
 endif
 
-#  Custom device table patch used when targeting ISS:
-OLD_TARGET_DEVICE_TABLE := $(TARGET_DEVICE_TABLE)
-TARGET_DEVICE_TABLE := target/device/xtensa/device_table.txt
-makedevs:
-	@echo "Applying patch to $(TARGET_DEVICE_TABLE)"
-	cp -f $(OLD_TARGET_DEVICE_TABLE) $(TARGET_DEVICE_TABLE)
-	patch -p1 -g 0 < target/device/xtensa/device_table.diff
-
 endif
diff --git a/target/device/xtensa/device_table.diff b/target/device/xtensa/device_table.diff
deleted file mode 100644
index 12f6825..0000000
--- a/target/device/xtensa/device_table.diff
+++ /dev/null
@@ -1,10 +0,0 @@
-diff --git a/target/generic/device_table.txt b/target/generic/device_table.txt
-index f4b16ba..b87bf69 100644
---- a/target/device/xtensa/device_table.txt
-+++ b/target/device/xtensa/device_table.txt
-@@ -169,3 +169,5 @@
- #/dev/mcd      b       640     0       0       23      0       0       0       
- #/dev/optcd    b       640     0       0       17      0       0       0       
- 
-+/dev/simdisk0        b      640      0       0       240     0       0       0
-+/dev/simdisk1        b      640      0       0       240     1       0       0
diff --git a/target/device/xtensa/device_table.txt b/target/device/xtensa/device_table.txt
new file mode 100644
index 0000000..d0c7467
--- /dev/null
+++ b/target/device/xtensa/device_table.txt
@@ -0,0 +1,189 @@
+# When building a target filesystem, it is desirable to not have to
+# become root and then run 'mknod' a thousand times.  Using a device 
+# table you can create device nodes and directories "on the fly".
+#
+# This is a sample device table file for use with genext2fs.  You can
+# do all sorts of interesting things with a device table file.  For
+# example, if you want to adjust the permissions on a particular file
+# you can just add an entry like:
+#   /sbin/foobar        f       2755    0       0       -       -       -       -       -
+# and (assuming the file /sbin/foobar exists) it will be made setuid
+# root (regardless of what its permissions are on the host filesystem.
+# Furthermore, you can use a single table entry to create a many device
+# minors.  For example, if I wanted to create /dev/hda and /dev/hda[0-15]
+# I could just use the following two table entries:
+#   /dev/hda    b       640     0       0       3       0       0       0       -
+#   /dev/hda    b       640     0       0       3       1       1       1       15
+# 
+# Device table entries take the form of:
+# <name>    <type>      <mode>  <uid>   <gid>   <major> <minor> <start> <inc>   <count>
+# where name is the file name,  type can be one of: 
+#       f       A regular file
+#       d       Directory
+#       c       Character special device file
+#       b       Block special device file
+#       p       Fifo (named pipe)
+# uid is the user id for the target file, gid is the group id for the
+# target file.  The rest of the entries (major, minor, etc) apply only 
+# to device special files.
+
+# Have fun
+# -Erik Andersen <andersen@codepoet.org>
+#
+
+#<name>		<type>	<mode>	<uid>	<gid>	<major>	<minor>	<start>	<inc>	<count>
+/dev		d	755	0	0	-	-	-	-	-
+/dev/pts	d	755	0	0	-	-	-	-	-
+/dev/shm	d	755	0	0	-	-	-	-	-
+/tmp		d	1777	0	0	-	-	-	-	-
+/etc		d	755	0	0	-	-	-	-	-
+/home/default	d	2755	1000	1000	-	-	-	-	-
+#<name>					<type>	<mode>	<uid>	<gid>	<major>	<minor>	<start>	<inc>	<count>
+/bin/busybox				f	4755	0	0	-	-	-	-	-
+/etc/shadow				f	600	0	0	-	-	-	-	-
+/etc/passwd				f	644	0	0	-	-	-	-	-
+/etc/network/if-up.d			d	755	0	0	-	-	-	-	-
+/etc/network/if-pre-up.d		d	755	0	0	-	-	-	-	-
+/etc/network/if-down.d			d	755	0	0	-	-	-	-	-
+/etc/network/if-post-down.d		d	755	0	0	-	-	-	-	-
+/usr/share/udhcpc/default.script	f	755	0	0	-	-	-	-	-
+# uncomment this to allow starting x as non-root
+#/usr/X11R6/bin/Xfbdev		f	4755	0	0	-	-	-	-	-
+# Normal system devices
+/dev/mem	c	640	0	0	1	1	0	0	-
+/dev/kmem	c	640	0	0	1	2	0	0	-
+/dev/null	c	666	0	0	1	3	0	0	-
+/dev/zero	c	666	0	0	1	5	0	0	-
+/dev/random	c	666	0	0	1	8	0	0	-
+/dev/urandom	c	666	0	0	1	9	0	0	-
+/dev/ram	b	640	0	0	1	1	0	0	-
+/dev/ram	b	640	0	0	1	0	0	1	4
+/dev/loop	b	640	0	0	7	0	0	1	2
+/dev/rtc	c	640	0	0	10	135	-	-	-
+/dev/console	c	666	0	0	5	1	-	-	-
+/dev/tty	c	666	0	0	5	0	-	-	-
+/dev/tty	c	666	0	0	4	0	0	1	8
+/dev/ttyp	c	666	0	0	3	0	0	1	10
+/dev/ptyp	c       666     0       0       2       0       0       1       10
+/dev/ptmx	c	666	0	0	5	2	-	-	-
+/dev/ttyP	c	666	0	0	57	0	0	1	4
+/dev/ttyS	c	666	0	0	4	64	0	1	4
+/dev/fb		c	640	0	5	29	0	0	1	4
+#/dev/ttySA	c	666	0	0	204	5	0	1	3
+/dev/psaux	c	666	0	0	10	1	0	0	-
+#/dev/ppp	c	666	0	0	108	0	-	-	-
+/dev/ttyCPM	c	666	0	0	204	46	0	1	4
+/dev/ttyAMA	c	666	0	0	204	64	0	1	4
+/dev/ttySAC	c	666	0	0	204	64	0	1	4
+/dev/ttyPSC	c	666	0	0	204	148	0	1	4
+/dev/ttyUL	c	666	0	0	204	187	0	1	4
+/dev/ttymxc	c	666	0	0	207	16	0	1	3
+
+# Input stuff
+/dev/input		d	755	0	0	-	-	-	-	-
+/dev/input/mice		c	640	0	0	13	63	0	0	-
+/dev/input/mouse	c	660	0	0	13	32	0	1	4
+/dev/input/event	c	660	0	0	13	64	0	1	4
+#/dev/input/js		c	660	0	0	13	0	0	1	4
+
+
+# MTD stuff
+/dev/mtd	c	640	0	0	90	0	0	2	4
+/dev/mtdblock	b	640	0	0	31	0	0	1	4
+
+#Tun/tap driver
+/dev/net	d	755	0	0	-	-	-	-	-
+/dev/net/tun	c	660	0	0	10	200	-	-	-
+
+# Audio stuff
+#/dev/audio	c	666	0	29	14	4	-	-	-
+#/dev/audio1	c	666	0	29	14	20	-	-	-
+#/dev/dsp	c	666	0	29	14	3	-	-	-
+#/dev/dsp1	c	666	0	29	14	19	-	-	-
+#/dev/sndstat	c	666	0	29	14	6	-	-	-
+
+# User-mode Linux stuff
+#/dev/ubda	b	640	0	0	98	0	0	0	-
+#/dev/ubda	b	640	0	0	98	1	1	1	15
+
+# IDE Devices
+/dev/hda	b	640	0	0	3	0	0	0	-
+/dev/hda	b	640	0	0	3	1	1	1	15
+/dev/hdb	b	640	0	0	3	64	0	0	-
+/dev/hdb	b	640	0	0	3	65	1	1	15
+#/dev/hdc	b	640	0	0	22	0	0	0	-
+#/dev/hdc	b	640	0	0	22	1	1	1	15
+#/dev/hdd	b	640	0	0	22	64	0	0	-
+#/dev/hdd	b	640	0	0	22	65	1	1	15
+#/dev/hde	b	640	0	0	33	0	0	0	-
+#/dev/hde	b	640	0	0	33	1	1	1	15
+#/dev/hdf	b	640	0	0	33	64	0	0	-
+#/dev/hdf	b	640	0	0	33	65	1	1	15
+#/dev/hdg	b	640	0	0	34	0	0	0	-
+#/dev/hdg	b	640	0	0	34	1	1	1	15
+#/dev/hdh	b	640	0	0	34	64	0	0	-
+#/dev/hdh	b	640	0	0	34	65	1	1	15
+
+# SCSI Devices
+/dev/sda	b	640	0	0	8	0	0	0	-
+/dev/sda	b	640	0	0	8	1	1	1	15
+/dev/sdb	b	640	0	0	8	16	0	0	-
+/dev/sdb	b	640	0	0	8	17	1	1	15
+#/dev/sdc	b	640	0	0	8	32	0	0	-
+#/dev/sdc	b	640	0	0	8	33	1	1	15
+#/dev/sdd	b	640	0	0	8	48	0	0	-
+#/dev/sdd	b	640	0	0	8	49	1	1	15
+#/dev/sde	b	640	0	0	8	64	0	0	-
+#/dev/sde	b	640	0	0	8	65	1	1	15
+#/dev/sdf	b	640	0	0	8	80	0	0	-
+#/dev/sdf	b	640	0	0	8	81	1	1	15
+#/dev/sdg	b	640	0	0	8	96	0	0	-
+#/dev/sdg	b	640	0	0	8	97	1	1	15
+#/dev/sdh	b	640	0	0	8	112	0	0	-
+#/dev/sdh	b	640	0	0	8	113	1	1	15
+#/dev/sg	c	640	0	0	21	0	0	1	15
+#/dev/scd	b	640	0	0	11	0	0	1	15
+#/dev/st	c	640	0	0	9	0	0	1	8
+#/dev/nst	c	640	0	0	9	128	0	1	8
+#/dev/st	c	640	0	0	9	32	1	1	4
+#/dev/st	c	640	0	0	9	64	1	1	4
+#/dev/st	c	640	0	0	9	96	1	1	4
+
+# USB block devices (ub driver)
+/dev/uba	b	640	0	0	180	0	0	0	-
+/dev/uba	b	640	0	0	180	1	1	1	6
+/dev/ubb	b	640	0	0	180	8	0	0	-
+/dev/ubb	b	640	0	0	180	65	1	1	6
+
+# Floppy disk devices
+#/dev/fd	b	640	0	0	2	0	0	1	2
+#/dev/fd0d360	b	640	0	0	2	4	0	0	-
+#/dev/fd1d360	b	640	0	0	2	5	0	0	-
+#/dev/fd0h1200	b	640	0	0	2	8	0	0	-
+#/dev/fd1h1200	b	640	0	0	2	9	0	0	-
+#/dev/fd0u1440	b	640	0	0	2	28	0	0	-
+#/dev/fd1u1440	b	640	0	0	2	29	0	0	-
+#/dev/fd0u2880	b	640	0	0	2	32	0	0	-
+#/dev/fd1u2880	b	640	0	0	2	33	0	0	-
+
+# All the proprietary cdrom devices in the world
+#/dev/aztcd	b	640	0	0	29	0	0	0	-
+#/dev/bpcd	b	640	0	0	41	0	0	0	-
+#/dev/capi20	c	640	0	0	68	0	0	1	2
+#/dev/cdu31a	b	640	0	0	15	0	0	0	-
+#/dev/cdu535	b	640	0	0	24	0	0	0	-
+#/dev/cm206cd	b	640	0	0	32	0	0	0	-
+#/dev/sjcd	b	640	0	0	18	0	0	0	-
+#/dev/sonycd	b	640	0	0	15	0	0	0	-
+#/dev/gscd	b	640	0	0	16	0	0	0	-
+#/dev/sbpcd	b	640	0	0	25	0	0	0	-
+#/dev/sbpcd	b	640	0	0	25	0	0	1	4
+#/dev/mcd	b	640	0	0	23	0	0	0	-
+#/dev/optcd	b	640	0	0	17	0	0	0	-
+
+# I2C device nodes
+/dev/i2c-	c	666	0	0	89	0	0	1	4
+
+# Xtensa special devices
+/dev/simdisk0        b      640      0       0       240     0       0       0
+/dev/simdisk1        b      640      0       0       240     1       0       0
diff --git a/target/generic/Makefile.in b/target/generic/Makefile.in
index f77f969..9a56f76 100644
--- a/target/generic/Makefile.in
+++ b/target/generic/Makefile.in
@@ -1,10 +1,8 @@
 # Default target skeleton stuff, may be overridden
 TARGET_SKELETON=target/generic/target_skeleton
-TARGET_DEVICE_TABLE=target/generic/device_table.txt
 
 ifeq ($(BR2_PACKAGE_BUSYBOX_SKELETON),y)
 TARGET_SKELETON=target/generic/target_busybox_skeleton
-TARGET_DEVICE_TABLE=target/generic/mini_device_table.txt
 endif
 
 TARGET_GENERIC_HOSTNAME:=$(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
-- 
1.6.3.3
