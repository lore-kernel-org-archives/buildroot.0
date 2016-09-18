From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Sep 2016 17:09:59 +0200
Subject: [Buildroot] [git commit] configs: add defconfig for TS-4900
Message-ID: <20160918151040.9142481F7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3138ab3fee7b0251e3cb3fba9a373bd3cf9d6424
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The TS-4900 uses a custom Linux 4.X from Technologic Systems:
https://github.com/embeddedarm/linux-3.10.17-imx6/tree/imx_4.1.15_1.0.0_ga
Indeed, it is not supported by mainline Linux but this work is ongoing.

This patch is inspired by a previous work for the TS-4800.
A post image script is provided to generate an image that can be
directly written to an SD card. It also adds an fpga wifi module.

Signed-off-by: Mathieu Audat <mathieu.audat@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/technologic/ts4900/genimage.cfg  | 10 +++++++
 board/technologic/ts4900/post-image.sh | 17 +++++++++++
 board/technologic/ts4900/readme.txt    | 52 ++++++++++++++++++++++++++++++++++
 configs/ts4900_defconfig               | 17 +++++++++++
 4 files changed, 96 insertions(+)

diff --git a/board/technologic/ts4900/genimage.cfg b/board/technologic/ts4900/genimage.cfg
new file mode 100644
index 0000000..7e580eb
--- /dev/null
+++ b/board/technologic/ts4900/genimage.cfg
@@ -0,0 +1,10 @@
+image sdcard.img {
+	hdimage {
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+		size = 256M
+	}
+}
diff --git a/board/technologic/ts4900/post-image.sh b/board/technologic/ts4900/post-image.sh
new file mode 100755
index 0000000..1e90cde
--- /dev/null
+++ b/board/technologic/ts4900/post-image.sh
@@ -0,0 +1,17 @@
+#!/bin/bash
+#
+# Copyright (C) 2015-2016 Savoir-Faire Linux
+# Post image generation script.
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG=$BOARD_DIR/genimage.cfg
+GENIMAGE_TMP=$BUILD_DIR/.genimage_tmp
+
+rm -rf $GENIMAGE_TMP
+
+${HOST_DIR}/usr/bin/genimage \
+        --config ${GENIMAGE_CFG} \
+        --rootpath $TARGET_DIR \
+        --tmppath $GENIMAGE_TMP \
+        --inputpath $BINARIES_DIR \
+        --outputpath $BINARIES_DIR
diff --git a/board/technologic/ts4900/readme.txt b/board/technologic/ts4900/readme.txt
new file mode 100644
index 0000000..679454f
--- /dev/null
+++ b/board/technologic/ts4900/readme.txt
@@ -0,0 +1,52 @@
+Technologic Systems TS-4900
+===========================
+
+This document explains how to set up a basic Buildroot system for the
+Technologic Systems TS-4900 System on Module.
+
+The TS-4900 is a TS-SOCKET macrocontroller board based on the
+Freescale i.MX6 Single or Quad Core ARM Cortex-A9 CPU clocked at
+1GHz. The TS-4900 features Gigabit Ethernet, SATA II Port, PCI Express
+Bus, high speed USB host and device (OTG), and microSD card.
+More details on the board here:
+   http://wiki.embeddedarm.com/wiki/TS-4900
+
+The TS-4900 is not currently supported by mainline Linux, so a
+Technologic Systems Linux is used based on Linux 4.1.
+The default U-boot configuration flashed scans the SD card to find the
+0x83 partition type, corresponding to the rootfs. Then it will load
+both uImage and dts from the /boot directory.
+To build the default configuration you only have to:
+
+   $ make ts4900_defconfig
+   $ make
+
+The output looks like:
+output/images/
+????????? imx6q-ts4900.dtb
+????????? rootfs.ext2
+????????? rootfs.tar
+????????? sdcard.img
+????????? uImage
+
+Since both the uImage and the dts are contained in the /boot
+directory, the provided post-image script generates an image file
+containing only one partition for the rootfs:
+
+   $ fdisk output/images/sdcard.img
+                      Device Boot Start    End Blocks Id  System
+output/images/sdcard.img1               1      524288      262144   83  Linux
+
+This image can be directly written to an SD card.
+
+   $ sudo dd if=output/images/sdcard.img of=/dev/mmcblk0
+
+In order to test the image on TS-4900 board, a TS baseboard, such as
+the TS-9xxx series, is needed to provide power, console header, RJ45
+connector etc.
+
+The bootloader comes pre-flashed on the board on an SPI flash. Since
+updating the bootloader is risky and not trivial, it is not included
+in the Buildroot defconfig. Refer to
+http://wiki.embeddedarm.com/wiki/TS-4900#U-Boot for details on which
+U-Boot config to use and how to flash it.
diff --git a/configs/ts4900_defconfig b/configs/ts4900_defconfig
new file mode 100644
index 0000000..7d5d02b
--- /dev/null
+++ b/configs/ts4900_defconfig
@@ -0,0 +1,17 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/technologic/ts4900/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/embeddedarm/linux-3.10.17-imx6.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="70d1e85a22879e27cc9e36384438d5a9793e44b0"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
+BR2_LINUX_KERNEL_UIMAGE=y
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-ts4900"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_PACKAGE_TS4900_FPGA=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_PACKAGE_HOST_GENIMAGE=y
