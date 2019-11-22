From: Viktar Palstsiuk <viktar.palstsiuk@promwad.com>
Date: Fri, 22 Nov 2019 21:16:04 +0300
Subject: [Buildroot] [PATCH] configs/nanopi_neo: update kernel to 5.3
Message-ID: <20191122181604.30828-1-viktar.palstsiuk@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Viktar Palstsiuk <viktar.palstsiuk@promwad.com>
---
 board/friendlyarm/nanopi-neo/genimage.cfg  |  2 +-
 board/friendlyarm/nanopi-neo/post-build.sh | 12 -------
 board/friendlyarm/nanopi-neo/post-image.sh | 15 --------
 configs/nanopi_neo_defconfig               | 42 ++++++++++++----------
 4 files changed, 24 insertions(+), 47 deletions(-)
 delete mode 100755 board/friendlyarm/nanopi-neo/post-build.sh
 delete mode 100755 board/friendlyarm/nanopi-neo/post-image.sh

diff --git a/board/friendlyarm/nanopi-neo/genimage.cfg b/board/friendlyarm/nanopi-neo/genimage.cfg
index ad43d31049..cd1892b699 100644
--- a/board/friendlyarm/nanopi-neo/genimage.cfg
+++ b/board/friendlyarm/nanopi-neo/genimage.cfg
@@ -29,6 +29,6 @@ image sdcard.img {
 	partition rootfs {
 		partition-type = 0x83
 		image = "rootfs.ext4"
-		size = 32M
+		size = 64M
 	}
 }
diff --git a/board/friendlyarm/nanopi-neo/post-build.sh b/board/friendlyarm/nanopi-neo/post-build.sh
deleted file mode 100755
index 9759efb568..0000000000
--- a/board/friendlyarm/nanopi-neo/post-build.sh
+++ /dev/null
@@ -1,12 +0,0 @@
-#!/bin/sh
-# post-build.sh for Nanopi NEO, based on the Orange Pi PC
-# 2013, Carlo Caione <carlo.caione@gmail.com>
-# 2016, "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-BOARD_DIR="$( dirname "${0}" )"
-MKIMAGE="${HOST_DIR}/bin/mkimage"
-BOOT_CMD="${BOARD_DIR}/boot.cmd"
-BOOT_CMD_H="${BINARIES_DIR}/boot.scr"
-
-# U-Boot script
-"${MKIMAGE}" -C none -A arm -T script -d "${BOOT_CMD}" "${BOOT_CMD_H}"
diff --git a/board/friendlyarm/nanopi-neo/post-image.sh b/board/friendlyarm/nanopi-neo/post-image.sh
deleted file mode 100755
index 740386ef82..0000000000
--- a/board/friendlyarm/nanopi-neo/post-image.sh
+++ /dev/null
@@ -1,15 +0,0 @@
-#!/bin/sh
-# post-image.sh for Nanopi NEO, based on the Orange Pi PC
-
-BOARD_DIR="$( dirname "${0}" )"
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-rm -rf "${GENIMAGE_TMP}"
-
-genimage                               \
-	--rootpath "${TARGET_DIR}"     \
-	--tmppath "${GENIMAGE_TMP}"    \
-	--inputpath "${BINARIES_DIR}"  \
-	--outputpath "${BINARIES_DIR}" \
-	--config "${GENIMAGE_CFG}"
diff --git a/configs/nanopi_neo_defconfig b/configs/nanopi_neo_defconfig
index aa464917b5..3512f7e94e 100644
--- a/configs/nanopi_neo_defconfig
+++ b/configs/nanopi_neo_defconfig
@@ -1,40 +1,44 @@
+# Architecture
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
 
+# Linux headers same as kernel, a 5.3 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3=y
+
+# System configuration
 BR2_TARGET_GENERIC_HOSTNAME="nanopi-neo"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the NanoPi NEO"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/friendlyarm/nanopi-neo/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/friendlyarm/nanopi-neo/post-image.sh"
-
-# Linux headers same as kernel, a 4.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_10=y
-
-# Use a -rc kernel to get the DTS
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.10.1"
-BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-nanopi-neo"
 
-# Use an -rc tag because the defconfig is very recent
+# Bootloaders
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_neo"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
 
-# Build an sdcard image
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.3"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-nanopi-neo"
+
+# Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
-BR2_TARGET_ROOTFS_EXT2_INODES=8192
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/friendlyarm/nanopi-neo/boot.cmd"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-neo/genimage.cfg"
 # BR2_TARGET_ROOTFS_TAR is not set
+
+# Additional tools
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.17.1
