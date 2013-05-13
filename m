From: Carlo Caione <carlo.caione@gmail.com>
Date: Mon, 13 May 2013 07:52:28 +0200
Subject: [Buildroot] [PATCH 3/3] cubieboard: add support
In-Reply-To: <1368424348-9853-1-git-send-email-carlo.caione@gmail.com>
References: <1368424348-9853-1-git-send-email-carlo.caione@gmail.com>
Message-ID: <1368424348-9853-3-git-send-email-carlo.caione@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Carlo Caione <carlo.caione@gmail.com>
---
Changelog:
	- New readme.txt
	- Small fixes in scripts
	- New board name
---
 board/cubietech/cubieboard/boot.cmd       |   4 +
 board/cubietech/cubieboard/mkcubiecard.sh | 119 ++++++++++++++++++++++++++++++
 board/cubietech/cubieboard/post-build.sh  |  15 ++++
 board/cubietech/cubieboard/readme.txt     |  59 +++++++++++++++
 configs/cubieboard_defconfig              |  39 ++++++++++
 5 files changed, 236 insertions(+)
 create mode 100644 board/cubietech/cubieboard/boot.cmd
 create mode 100755 board/cubietech/cubieboard/mkcubiecard.sh
 create mode 100755 board/cubietech/cubieboard/post-build.sh
 create mode 100644 board/cubietech/cubieboard/readme.txt
 create mode 100644 configs/cubieboard_defconfig

diff --git a/board/cubietech/cubieboard/boot.cmd b/board/cubietech/cubieboard/boot.cmd
new file mode 100644
index 0000000..849ed00
--- /dev/null
+++ b/board/cubietech/cubieboard/boot.cmd
@@ -0,0 +1,4 @@
+setenv bootargs console=ttyS0,115200 root=/dev/mmcblk0p2 rootwait panic=10 ${extra}
+fatload mmc 0 0x43000000 script.bin
+fatload mmc 0 0x48000000 uImage
+bootm 0x48000000
diff --git a/board/cubietech/cubieboard/mkcubiecard.sh b/board/cubietech/cubieboard/mkcubiecard.sh
new file mode 100755
index 0000000..4ffb223
--- /dev/null
+++ b/board/cubietech/cubieboard/mkcubiecard.sh
@@ -0,0 +1,119 @@
+#! /bin/sh
+# mkCubieCard.sh v0.1:
+# 2013, Carlo Caione <carlo.caione@gmail.com>
+# heavely based on :
+# mkA10card.sh v0.1
+# 2012, Jason Plum <jplum@archlinuxarm.org>
+# loosely based on :
+# mkcard.sh v0.5
+# (c) Copyright 2009 Graeme Gregory <dp@xora.org.uk>
+# Licensed under terms of GPLv2
+#
+# Parts of the procudure base on the work of Denys Dmytriyenko
+# http://wiki.omap.com/index.php/MMC_Boot_Format
+
+IMAGES_DIR=$1
+SPL_IMG=$IMAGES_DIR/sunxi-spl.bin
+UBOOT_IMG=$IMAGES_DIR/u-boot.bin
+UIMAGE=$IMAGES_DIR/uImage
+BIN_BOARD_FILE=$IMAGES_DIR/script.bin
+ROOTFS=$IMAGES_DIR/rootfs.tar
+BOOT_CMD_H=$IMAGES_DIR/boot.scr
+
+export LC_ALL=C
+
+if [ $# -ne 2 ]; then
+	echo "Usage: $0 <images_dir> <drive>"
+	exit 1;
+fi
+
+if [ $EUID -ne 0 ]; then
+	echo "This script must be run as root" 1>&2
+	exit 1
+fi
+
+if [ ! -f $SPL_IMG ] ||
+   [ ! -f $UBOOT_IMG ] ||
+   [ ! -f $UIMAGE ] ||
+   [ ! -f $BIN_BOARD_FILE ] ||
+   [ ! -f $ROOTFS ] ||
+   [ ! -f $BOOT_CMD_H ]; then
+	echo "File(s) missing."
+	exit 1
+fi
+
+DRIVE=$2
+P1=`mktemp -d`
+P2=`mktemp -d`
+
+dd if=/dev/zero of=$DRIVE bs=1M count=3
+
+SIZE=`fdisk -l $DRIVE | grep Disk | grep bytes | awk '{print $5}'`
+
+echo DISK SIZE - $SIZE bytes
+
+
+# ~2048, 16MB, FAT, bootable
+# ~rest of drive, Ext4
+{
+echo 32,512,0x0C,*
+echo 544,,,-
+} | sfdisk -D $DRIVE
+
+sleep 1
+
+if [ -b ${DRIVE}1 ]; then
+	D1=${DRIVE}1
+	umount ${DRIVE}1
+	mkfs.vfat -n "boot" ${DRIVE}1
+else
+	if [ -b ${DRIVE}p1 ]; then
+		D1=${DRIVE}p1
+		umount ${DRIVE}p1
+		mkfs.vfat -n "boot" ${DRIVE}p1
+	else
+		echo "Cant find boot partition in /dev"
+		exit 1
+	fi
+fi
+
+
+if [ -b ${DRIVE}2 ]; then
+	D2=${DRIVE}2
+	umount ${DRIVE}2
+	mkfs.ext4 -L "Cubie" ${DRIVE}2
+else
+	if [ -b ${DRIVE}p2 ]; then
+		D2=${DRIVE}p2
+		umount ${DRIVE}p2
+		mkfs.ext4 -L "Cubie" ${DRIVE}p2
+	else
+		echo "Cant find rootfs partition in /dev"
+		exit 1
+	fi
+fi
+
+mount $D1 $P1
+mount $D2 $P2
+
+# write uImage
+cp $UIMAGE $P1
+# write board file
+cp $BIN_BOARD_FILE $P1
+# write u-boot script
+cp $BOOT_CMD_H $P1
+# write rootfs
+tar -C $P2 -xvf $ROOTFS
+
+sync
+
+umount $D1
+umount $D2
+
+rm -fr $P1
+rm -fr $P2
+
+# write SPL
+dd if=$SPL_IMG of=$DRIVE bs=1024 seek=8
+# write mele u-boot
+dd if=$UBOOT_IMG of=$DRIVE bs=1024 seek=32
diff --git a/board/cubietech/cubieboard/post-build.sh b/board/cubietech/cubieboard/post-build.sh
new file mode 100755
index 0000000..cd6675b
--- /dev/null
+++ b/board/cubietech/cubieboard/post-build.sh
@@ -0,0 +1,15 @@
+#!/bin/sh
+# post-build.sh for CubieBoard
+# 2013, Carlo Caione <carlo.caione@gmail.com>
+
+BOARD_DIR="$(dirname $0)"
+MKIMAGE=$HOST_DIR/usr/bin/mkimage
+BOOT_CMD=$BOARD_DIR/boot.cmd
+BOOT_CMD_H=$BINARIES_DIR/boot.scr
+
+# U-Boot script
+if [ -e $MKIMAGE -a -e $BOOT_CMD ];
+then
+	$MKIMAGE -C none -A arm -T script -d $BOOT_CMD $BOOT_CMD_H
+fi
+
diff --git a/board/cubietech/cubieboard/readme.txt b/board/cubietech/cubieboard/readme.txt
new file mode 100644
index 0000000..1c47117
--- /dev/null
+++ b/board/cubietech/cubieboard/readme.txt
@@ -0,0 +1,59 @@
+cubieboard
+
+-----
+Intro
+-----
+
+To be able to use your cubieboard board with the images generated by
+Buildroot you have to correctly setup the SD card.
+
+For more information, please see http://linux-sunxi.org/FirstSteps
+
+---------------
+How to build it
+---------------
+
+You need to use the cubieboard_defconfig, to do so:
+ * make cubieboard_defconfig
+
+And to compile:
+ * make
+
+-----------------
+What is generated
+-----------------
+
+After building, you should obtain this tree:
+
+    output/images/
+    +-- rootfs.tar
+    +-- boot.scr
+    +-- script.bin
+    +-- sunxi-spl.bin
+    +-- u-boot.bin
+    `-- uImage
+
+--------------------------
+How setting up the SD card
+--------------------------
+
+Depending on the rootfs size, you might want to use a 2GB or larger SD-card.
+The script mkcubiecard.sh will take care of partitioning and formatting
+the SD-card.
+
+BEWARE! This process will erase your SD card.
+
+Use dmesg to find out where the SD card is attached in the /dev tree
+(<device>) and then:
+
+# sudo ./mkcubiecard.sh <images_dir> <device>
+
+where:
+ - <images_dir> is the directory containing the generated files (usually
+   output/images)
+ - <device> is the device file of the SD card (usually /dev/sdX)
+
+
+
+--
+Carlo Caione <carlo.caione@gmail.com>
diff --git a/configs/cubieboard_defconfig b/configs/cubieboard_defconfig
new file mode 100644
index 0000000..77806f6
--- /dev/null
+++ b/configs/cubieboard_defconfig
@@ -0,0 +1,39 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a8=y
+
+# System configuration
+BR2_TARGET_GENERIC_HOSTNAME="Cubieboard"
+BR2_TARGET_GENERIC_ISSUE="Welcome to use Cubieboard!"
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/cubietech/cubieboard/post-build.sh"
+
+# Additional tools
+BR2_PACKAGE_HOST_SUNXI_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_SUNXI_TOOLS=y
+BR2_PACKAGE_SUNXI_BOARDS=y
+BR2_PACKAGE_SUNXI_BOARDS_BOARD_NAME="cubieboard"
+
+# Kernel headers
+BR2_KERNEL_HEADERS_3_4=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="https://github.com/linux-sunxi/linux-sunxi.git"
+BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="274a66a7bfcbaabb88d63e4eba161965383cc416"
+BR2_LINUX_KERNEL_VERSION="sunxi-3.4"
+BR2_LINUX_KERNEL_DEFCONFIG="sun4i"
+
+# Bootloaders
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="cubieboard"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_VERSION="sunxi"
+BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="https://github.com/linux-sunxi/u-boot-sunxi.git"
+BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="1a8ac55429f7f8cc9f100c1cf2dc0195cf81e76f"
+BR2_TARGET_UBOOT_FORMAT_BIN=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
-- 
1.8.2.3
