From: Eelco Chaudron <echaudron@xiot.nl>
Date: Thu, 24 Dec 2015 14:08:04 +0100
Subject: [Buildroot] [PATCH 1/1] OrangePi PC addition to build root
Message-ID: <1450962484-90787-1-git-send-email-echaudron@xiot.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the patch as Thomas requested for the OrangePi PC.
It should have all changes requested, let me know if I missed something.

Signed-off-by: Eelco Chaudron <echaudron@xiot.nl>
---
 board/orangepi/orangepipc/boot.cmd      |  8 ++++++++
 board/orangepi/orangepipc/genimage.cfg  | 35 +++++++++++++++++++++++++++++++++
 board/orangepi/orangepipc/post-build.sh | 11 +++++++++++
 board/orangepi/orangepipc/post-image.sh | 16 +++++++++++++++
 configs/orangepipc_defconfig            | 30 ++++++++++++++++++++++++++++
 5 files changed, 100 insertions(+)
 create mode 100644 board/orangepi/orangepipc/boot.cmd
 create mode 100644 board/orangepi/orangepipc/genimage.cfg
 create mode 100755 board/orangepi/orangepipc/post-build.sh
 create mode 100755 board/orangepi/orangepipc/post-image.sh
 create mode 100644 configs/orangepipc_defconfig

diff --git a/board/orangepi/orangepipc/boot.cmd b/board/orangepi/orangepipc/boot.cmd
new file mode 100644
index 0000000..9da625c
--- /dev/null
+++ b/board/orangepi/orangepipc/boot.cmd
@@ -0,0 +1,8 @@
+setenv fdt_high ffffffff
+
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+
+fatload mmc 0 $kernel_addr_r zImage
+fatload mmc 0 $fdt_addr_r sun8i-h3-orangepi-pc.dtb
+
+bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/orangepi/orangepipc/genimage.cfg b/board/orangepi/orangepipc/genimage.cfg
new file mode 100644
index 0000000..1200d3b
--- /dev/null
+++ b/board/orangepi/orangepipc/genimage.cfg
@@ -0,0 +1,35 @@
+# Minimal SD card image for the OrangePi PC
+#
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"sun8i-h3-orangepi-pc.dtb",
+			"boot.scr"
+		}
+	}
+	size = 10M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8192
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 512M
+	}
+}
diff --git a/board/orangepi/orangepipc/post-build.sh b/board/orangepi/orangepipc/post-build.sh
new file mode 100755
index 0000000..ca7a99f
--- /dev/null
+++ b/board/orangepi/orangepipc/post-build.sh
@@ -0,0 +1,11 @@
+#!/bin/sh
+# post-build.sh for OrangePi PC taken from CubieBoard's post-build.sh
+# 2013, Carlo Caione <carlo.caione@gmail.com>
+
+BOARD_DIR="$(dirname $0)"
+MKIMAGE=$HOST_DIR/usr/bin/mkimage
+BOOT_CMD=$BOARD_DIR/boot.cmd
+BOOT_CMD_H=$BINARIES_DIR/boot.scr
+
+# U-Boot script
+$MKIMAGE -C none -A arm -T script -d $BOOT_CMD $BOOT_CMD_H
diff --git a/board/orangepi/orangepipc/post-image.sh b/board/orangepi/orangepipc/post-image.sh
new file mode 100755
index 0000000..9cca1b1
--- /dev/null
+++ b/board/orangepi/orangepipc/post-image.sh
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage                           \
+	--rootpath "${TARGET_DIR}"     \
+	--tmppath "${GENIMAGE_TMP}"    \
+	--inputpath "${BINARIES_DIR}"  \
+	--outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG}"
+
+exit $?
diff --git a/configs/orangepipc_defconfig b/configs/orangepipc_defconfig
new file mode 100644
index 0000000..f430392
--- /dev/null
+++ b/configs/orangepipc_defconfig
@@ -0,0 +1,30 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_VFPV4=y
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="4.3.3"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
+BR2_TARGET_GENERIC_HOSTNAME="OrangePi_PC"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi PC"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/orangepipc/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/orangepi/orangepipc/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/jwrdegoede/linux-sunxi.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="a516ac6dda21e6f5edceecd08b475b16e360656b"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-pc"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="orangepi_pc"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="http://git.denx.de/u-boot.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="4832e17787acb29734d895751bc7a594908aecc6"
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.5.0
