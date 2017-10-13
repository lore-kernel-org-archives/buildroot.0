From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 13 Oct 2017 19:01:16 -0300
Subject: [Buildroot] [PATCH] configs/mx6udoo: Bump kernel and U-Boot versions
Message-ID: <1507932076-19487-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump the kernel to version 4.13.5 and U-Boot to 2017.09.

While at it, remove the custom scripts for generating the SD card image
and use the standard scripts instead.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 board/udoo/mx6qdl/genimage.cfg  | 48 -----------------------------------------
 board/udoo/mx6qdl/post-image.sh | 14 ------------
 configs/mx6udoo_defconfig       | 10 ++++-----
 3 files changed, 5 insertions(+), 67 deletions(-)
 delete mode 100644 board/udoo/mx6qdl/genimage.cfg
 delete mode 100755 board/udoo/mx6qdl/post-image.sh

diff --git a/board/udoo/mx6qdl/genimage.cfg b/board/udoo/mx6qdl/genimage.cfg
deleted file mode 100644
index 4361d54..0000000
--- a/board/udoo/mx6qdl/genimage.cfg
+++ /dev/null
@@ -1,48 +0,0 @@
-# Minimal microSD card image for Udoo MX6Q/DL boards
-#
-# We mimic the .sdcard Freescale's image format for i.MX6:
-# * the microSD card must have 1 kB free space at the beginning,
-# * U-Boot is dumped as is,
-# * a FAT partition at offset 16 MB is containing zImage and dtbs,
-# * a single root filesystem partition is required (Ext4 in this case).
-#
-
-image boot.vfat {
-	vfat {
-		files = {
-			"imx6q-udoo.dtb",
-			"imx6dl-udoo.dtb",
-			"zImage"
-		}
-	}
-	size = 16M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition SPL {
-		in-partition-table = "no"
-		image = "SPL"
-		offset = 1K
-	}
-
-	partition u-boot {
-		in-partition-table = "no"
-		image = "u-boot.img"
-		offset = 69K
-	}
-
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-		offset = 16M
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-	}
-}
diff --git a/board/udoo/mx6qdl/post-image.sh b/board/udoo/mx6qdl/post-image.sh
deleted file mode 100755
index b4ac460..0000000
--- a/board/udoo/mx6qdl/post-image.sh
+++ /dev/null
@@ -1,14 +0,0 @@
-#!/usr/bin/env bash
-
-BOARD_DIR="$(dirname $0)"
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-rm -rf "${GENIMAGE_TMP}"
-
-genimage \
-  --rootpath "${TARGET_DIR}" \
-  --tmppath "${GENIMAGE_TMP}" \
-  --inputpath "${BINARIES_DIR}" \
-  --outputpath "${BINARIES_DIR}" \
-  --config "${GENIMAGE_CFG}"
diff --git a/configs/mx6udoo_defconfig b/configs/mx6udoo_defconfig
index bf2a596..ad88129 100644
--- a/configs/mx6udoo_defconfig
+++ b/configs/mx6udoo_defconfig
@@ -3,22 +3,22 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.13 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/udoo/mx6qdl/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="udoo"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.09"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.11"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.5"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/udoo/mx6qdl/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.7.4
