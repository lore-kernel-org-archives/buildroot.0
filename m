From: Carlo Caione <carlo.caione@gmail.com>
Date: Sat,  9 Mar 2013 12:36:44 +0100
Subject: [Buildroot] [PATCH 2/2] cubieboard: scripts
In-Reply-To: <1362829004-16217-1-git-send-email-carlo.caione@gmail.com>
References: <1362829004-16217-1-git-send-email-carlo.caione@gmail.com>
Message-ID: <1362829004-16217-2-git-send-email-carlo.caione@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch add:
- boot.cmd: U-Boot script
- post-build.sh: post-build script to generate some needed files
- mkCubieCard.sh: script to correctly format the SD card and make it
  bootable by cubieboard

Signed-off-by: Carlo Caione <carlo.caione@gmail.com>
---
 board/cubieboard/boot.cmd       |   4 ++
 board/cubieboard/mkCubieCard.sh | 110 ++++++++++++++++++++++++++++++++++++++++
 board/cubieboard/post-build.sh  |  37 ++++++++++++++
 3 files changed, 151 insertions(+)
 create mode 100644 board/cubieboard/boot.cmd
 create mode 100755 board/cubieboard/mkCubieCard.sh
 create mode 100755 board/cubieboard/post-build.sh

diff --git a/board/cubieboard/boot.cmd b/board/cubieboard/boot.cmd
new file mode 100644
index 0000000..849ed00
--- /dev/null
+++ b/board/cubieboard/boot.cmd
@@ -0,0 +1,4 @@
+setenv bootargs console=ttyS0,115200 root=/dev/mmcblk0p2 rootwait panic=10 ${extra}
+fatload mmc 0 0x43000000 script.bin
+fatload mmc 0 0x48000000 uImage
+bootm 0x48000000
diff --git a/board/cubieboard/mkCubieCard.sh b/board/cubieboard/mkCubieCard.sh
new file mode 100755
index 0000000..7a5a16f
--- /dev/null
+++ b/board/cubieboard/mkCubieCard.sh
@@ -0,0 +1,110 @@
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
+IMAGES_DIR=../../output/images
+SPL_IMG=$IMAGES_DIR/sunxi-spl.bin
+UBOOT_IMG=$IMAGES_DIR/u-boot.bin
+UIMAGE=$IMAGES_DIR/uImage
+BIN_BOARD_FILE=$IMAGES_DIR/script.bin
+ROOTFS=$IMAGES_DIR/rootfs.tar
+
+export LC_ALL=C
+
+if [ $# -ne 1 ]; then
+	echo "Usage: $0 <drive>"
+	exit 1;
+fi
+
+if [ ! -f $SPL_IMG ] ||
+   [ ! -f $UBOOT_IMG ] ||
+   [ ! -f $UIMAGE ] ||
+   [ ! -f $BIN_BOARD_FILE ] ||
+   [ ! -f $ROOTFS ]; then
+	echo "File(s) missing."
+	exit 1
+fi
+
+DRIVE=$1
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
diff --git a/board/cubieboard/post-build.sh b/board/cubieboard/post-build.sh
new file mode 100755
index 0000000..36cf6dc
--- /dev/null
+++ b/board/cubieboard/post-build.sh
@@ -0,0 +1,37 @@
+#!/bin/sh
+# post-build.sh for CubieBoard
+# 2013, Carlo Caione <carlo.caione@gmail.com>
+
+TARGET_DIR=$1
+IMAGES_DIR=$1/../images
+BOARD_DIR="$(dirname $0)"
+HOST_DIR=$1/../host/usr/bin
+TMP_DIR=`mktemp -d`
+
+FEX2BIN=$HOST_DIR/fex2bin
+FEX_BOARD_FILE=$TMP_DIR/sys_config/a10/cubieboard.fex
+BIN_BOARD_FILE=$IMAGES_DIR/script.bin
+
+MKIMAGE=$HOST_DIR/mkimage
+BOOT_CMD=$BOARD_DIR/boot.cmd
+BOOT_CMD_H=$IMAGES_DIR/boot.scr
+
+SD_IMAGE=$IMAGES_DIR/sd.img
+
+GIT_SUNXI_BOARD=git://github.com/linux-sunxi/sunxi-boards.git
+
+# Building script.bin
+if [ -e $FEX2BIN ];
+then
+	git clone $GIT_SUNXI_BOARD $TMP_DIR
+	$FEX2BIN $FEX_BOARD_FILE $BIN_BOARD_FILE
+fi
+
+# U-Boot script
+if [ -e $MKIMAGE -a -e $BOOT_CMD ];
+then
+	$MKIMAGE -C none -A arm -T script -d $BOOT_CMD $BOOT_CMD_H
+fi
+
+# Clean-up
+rm -fr $TMP_DIR
-- 
1.8.1.5
