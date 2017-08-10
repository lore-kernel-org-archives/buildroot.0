From: Julien Grossholtz <julien.grossholtz@gmail.com>
Date: Thu, 10 Aug 2017 10:49:51 -0400
Subject: [Buildroot] [PATCH 1/1] configs: add defconfig for TS-7680
Message-ID: <20170810144951.20841-1-julien.grossholtz@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The TS-7680 is an i.MX286 ARM ARM926EJ-S board with 10/100 Ethernet,
USB port, eMMC and CAN ports.

The TS-7680 uses a 3.14.28 Linux kernel provided by Technologic Systems:
https://github.com/embeddedarm/linux-3.14.28-imx28

U-Boot is not provided as the manufacturer recommends not to update the
built-in bootloader.

For more informations please see:
https://wiki.embeddedarm.com/wiki/TS-7680

Signed-off-by: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>
---
 board/technologic/ts7680/genimage.cfg  | 14 ++++++++++
 board/technologic/ts7680/post-image.sh | 17 ++++++++++++
 board/technologic/ts7680/readme.txt    | 51 ++++++++++++++++++++++++++++++++++
 configs/ts7680_defconfig               | 20 +++++++++++++
 4 files changed, 102 insertions(+)
 create mode 100644 board/technologic/ts7680/genimage.cfg
 create mode 100755 board/technologic/ts7680/post-image.sh
 create mode 100644 board/technologic/ts7680/readme.txt
 create mode 100644 configs/ts7680_defconfig

diff --git a/board/technologic/ts7680/genimage.cfg b/board/technologic/ts7680/genimage.cfg
new file mode 100644
index 0000000..b559982
--- /dev/null
+++ b/board/technologic/ts7680/genimage.cfg
@@ -0,0 +1,14 @@
+image sdcard.img {
+	hdimage {
+	}
+
+	partition unused {
+		size =  512B
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 256M
+	}
+}
diff --git a/board/technologic/ts7680/post-image.sh b/board/technologic/ts7680/post-image.sh
new file mode 100755
index 0000000..c3f5a4a
--- /dev/null
+++ b/board/technologic/ts7680/post-image.sh
@@ -0,0 +1,17 @@
+#!/bin/bash
+#
+# Copyright (C) 2017 Savoir-faire Linux, Inc.
+# Post image generation script.
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP=${BUILD_DIR}/.genimage_tmp
+
+rm -rf ${GENIMAGE_TMP}
+
+${HOST_DIR}/usr/bin/genimage \
+        --config ${GENIMAGE_CFG} \
+        --rootpath ${TARGET_DIR} \
+        --tmppath ${GENIMAGE_TMP} \
+        --inputpath $BINARIES_DIR \
+        --outputpath $BINARIES_DIR
diff --git a/board/technologic/ts7680/readme.txt b/board/technologic/ts7680/readme.txt
new file mode 100644
index 0000000..416e892
--- /dev/null
+++ b/board/technologic/ts7680/readme.txt
@@ -0,0 +1,51 @@
+Technologic Systems TS-7680 SBC
+===============================
+
+This document explains how to set up a basic Buildroot system for
+the Technologic Systems TS-7680 Single Board Computer.
+
+The TS-7680 SBC is based on the Freescale i.MX286 ARM ARM926EJ-S
+running at 454MHz. The TS-7680 features are 10/100 Ethernet ports,
+Wi-Fi, microSD card, eMMC, NOR Flash, USB host port, CAN ports,
+relays and ADC/DAC. More details on the board here:
+https://wiki.embeddedarm.com/wiki/TS-7680
+
+The TS-7680 uses a 3.14.28 Linux kernel provided by
+Technologic Systems.
+
+To build the default configuration you only have to run:
+
+  $ make ts7680_defconfig
+  $ make
+
+The output looks like:
+output/images
+??? imx28-ts7680.dtb
+??? rootfs.ext2
+??? rootfs.ext4 -> rootfs.ext2
+??? rootfs.tar
+??? sdcard.img
+??? uImage
+
+The provided post-image script generates an image file containing
+two partitions. The first one is unused, but mandatory as the
+TS-7680 built-in bootloader loads the Linux uImage from the /boot
+directory in the second partition. The second partition contains the
+rootfs with the Linux uImage into the /boot directory.
+
+  $ fdisk output/images/sdcard.img
+  output/images/sdcard.img1          1      1       1  512B  0 Empty
+  output/images/sdcard.img2          2 524289  524288  256M 83 Linux
+
+This image can be directly written to an SD card.
+
+    $ sudo dd if=output/images/sdcard.img of=/dev/mmcblk0
+
+To boot with Buildroot, insert this SD card on the board, make sure
+the SD jumper is present and the U-Boot jumper is not.
+
+The bootloader comes pre-flashed on the board on an SPI flash. Since
+updating the bootloader is risky and not trivial, it is not included
+in the Buildroot defconfig. Refer to
+https://wiki.embeddedarm.com/wiki/TS-7680#U-Boot for details on
+which U-Boot config to use and how to flash it.
diff --git a/configs/ts7680_defconfig b/configs/ts7680_defconfig
new file mode 100644
index 0000000..0153685
--- /dev/null
+++ b/configs/ts7680_defconfig
@@ -0,0 +1,20 @@
+BR2_arm=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.14.28"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
+BR2_GCC_VERSION_4_9_X=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/technologic/ts7680/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/embeddedarm/linux-3.14.28-imx28.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="93872644d70b5c6420cb16f8b05b156faef94a5b"
+BR2_LINUX_KERNEL_DEFCONFIG="ts76xx"
+BR2_LINUX_KERNEL_UIMAGE=y
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x40008000"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx28-ts7680"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.9.4
