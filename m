From: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
Date: Mon, 18 Jul 2016 14:41:36 -0400
Subject: [Buildroot] [PATCH v8] configs: add defconfig for TS-4800
Message-ID: <1468867296-9995-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The TS-4800 is supported by mainline Linux as of 4.5 and by U-boot
as of v2016-07.

The package requires the custom ts4800-mbrboot routine.

A post-image script is provided to generate an image that can be
directly written to an SD card.

More details on the board here:
  http://wiki.embeddedarm.com/wiki/TS-4800

Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>
Signed-off-by: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
---
Changes v7->v8:
	- cleaned up defconfig and post-image script
	- added a readme file
Changes v6->v7:
	- moved package to boot/
Changes v5->v6:
	- removed custom U-boot v2016.07 which is now the default version in
	  BR
Changes v4->v5:
with Linaro toolchain
	- delete all the unnecessary defconfig options

 board/technologic/ts4800/genimage.cfg   | 37 ++++++++++++++++++++++++
 board/technologic/ts4800/linux.fragment |  3 ++
 board/technologic/ts4800/post-image.sh  | 19 +++++++++++++
 board/technologic/ts4800/readme.txt     | 50 +++++++++++++++++++++++++++++++++
 configs/ts4800_defconfig                | 22 +++++++++++++++
 5 files changed, 131 insertions(+)
 create mode 100644 board/technologic/ts4800/genimage.cfg
 create mode 100644 board/technologic/ts4800/linux.fragment
 create mode 100755 board/technologic/ts4800/post-image.sh
 create mode 100644 board/technologic/ts4800/readme.txt
 create mode 100644 configs/ts4800_defconfig

diff --git a/board/technologic/ts4800/genimage.cfg b/board/technologic/ts4800/genimage.cfg
new file mode 100644
index 0000000..2070cc5
--- /dev/null
+++ b/board/technologic/ts4800/genimage.cfg
@@ -0,0 +1,37 @@
+image boot.vfat {
+        vfat {
+                files = {
+                        "zImage",
+                        "imx51-ts4800.dtb"
+                }
+        }
+        size = 8M
+}
+
+image sdcard.img {
+        hdimage {
+        }
+
+        partition mbrboot {
+                in-partition-table = "no"
+                image = "mbrboot.bin"
+                offset = 0
+        }
+
+        partition uboot {
+                partition-type = 0xda
+                image = "u-boot.bin"
+                size = 256k
+        }
+
+        partition kernel {
+                partition-type = 0xC
+                image = "boot.vfat"
+        }
+
+        partition rootfs {
+                partition-type = 0x83
+                image = "rootfs.ext4"
+                size = 256M
+        }
+}
diff --git a/board/technologic/ts4800/linux.fragment b/board/technologic/ts4800/linux.fragment
new file mode 100644
index 0000000..0451c86
--- /dev/null
+++ b/board/technologic/ts4800/linux.fragment
@@ -0,0 +1,3 @@
+CONFIG_TOUCHSCREEN_TS4800=y
+CONFIG_TS4800_WATCHDOG=y
+CONFIG_TS4800_IRQ=y
diff --git a/board/technologic/ts4800/post-image.sh b/board/technologic/ts4800/post-image.sh
new file mode 100755
index 0000000..167dea8
--- /dev/null
+++ b/board/technologic/ts4800/post-image.sh
@@ -0,0 +1,19 @@
+#!/bin/bash
+#
+# Copyright (C) 2015 Savoir-faire Linux
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
+
+exit $?
diff --git a/board/technologic/ts4800/readme.txt b/board/technologic/ts4800/readme.txt
new file mode 100644
index 0000000..20b50e9
--- /dev/null
+++ b/board/technologic/ts4800/readme.txt
@@ -0,0 +1,50 @@
+Technologic Systems TS-4800
+===========================
+
+This document explains how to set up a basic Buildroot system for the
+Technologic Systems TS-4800 System on Module.
+
+The TS-4800 is a TS-SOCKET macrocontroller board based on the Freescale
+i.MX515 ARM Cortex-A8 CPU running at 800MHz. The TS-4800 features 10/100
+Ethernet, high speed USB host and device (OTG), microSD card, and 256MB
+XNAND drive.  More details on the board here:
+	http://wiki.embeddedarm.com/wiki/TS-4800
+
+The TS-4800 is supported by mainline Linux as of 4.5 and by U-boot as of
+v2016-07. The defconfig includes a custom 1st level bootloader located
+in boot/ts4800-mbrboot. This one scans the SD card's partition table to
+find partition having the 0xDA type, corresponding to U-boot.
+
+To build the default configuration you only have to:
+
+	$ make ts4800_defconfig
+	$ make
+
+The ouput looks like:
+	output/images/
+	??? boot.vfat
+	??? imx51-ts4800.dtb
+	??? mbrboot.bin
+	??? rootfs.ext2
+	??? rootfs.ext4 -> rootfs.ext2
+	??? rootfs.tar
+	??? sdcard.img
+	??? u-boot.bin
+	??? zImage
+
+The provided post-image script generates an image file containing 3
+partitions for U-boot, Linux kernel + device tree and rootfs
+respectively:
+	$ fdisk output/images/sdcard.img
+	                   Device Boot Start    End Blocks Id  System
+	output/images/sdcard.img1          1    512    256 da  Non-FS data
+	output/images/sdcard.img2        513  16896   8192  c  W95 FAT32 (LBA)
+	output/images/sdcard.img3      16897 541184 262144 83  Linux
+
+This image can be directly written to an SD card.
+
+	$ sudo dd if=output/images/sdcard.img of=/dev/mmcblk0
+
+In order to test the image on TS-4800 board, a TS baseboard, such as
+TS-8xxx the serie, is needed to provide power, console header, RJ45
+connector etc.
diff --git a/configs/ts4800_defconfig b/configs/ts4800_defconfig
new file mode 100644
index 0000000..0999ebc
--- /dev/null
+++ b/configs/ts4800_defconfig
@@ -0,0 +1,22 @@
+BR2_arm=y
+BR2_cortex_a8=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/technologic/ts4800/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.3"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/technologic/ts4800/linux.fragment"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx51-ts4800"
+BR2_PACKAGE_BUSYBOX_WATCHDOG=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_TS4800_MBRBOOT=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="ts4800"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.07"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
1.9.1
