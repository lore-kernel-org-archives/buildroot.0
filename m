From: Viktar Palstsiuk <viktar.palstsiuk@promwad.com>
Date: Wed, 27 Nov 2019 09:36:46 +0300
Subject: [Buildroot] [PATCH] configs/nanopi_neo: removing
 post-build/post-image script
Message-ID: <20191127063646.4188-1-viktar.palstsiuk@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Viktar Palstsiuk <viktar.palstsiuk@promwad.com>
---
 board/friendlyarm/nanopi-neo/post-build.sh | 12 ------------
 board/friendlyarm/nanopi-neo/post-image.sh | 15 ---------------
 configs/nanopi_neo_defconfig               |  9 ++++++---
 3 files changed, 6 insertions(+), 30 deletions(-)
 delete mode 100755 board/friendlyarm/nanopi-neo/post-build.sh
 delete mode 100755 board/friendlyarm/nanopi-neo/post-image.sh

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
index 838f4edad5..4696b445da 100644
--- a/configs/nanopi_neo_defconfig
+++ b/configs/nanopi_neo_defconfig
@@ -4,8 +4,6 @@ BR2_ARM_FPU_VFPV4=y
 
 BR2_TARGET_GENERIC_HOSTNAME="nanopi-neo"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the NanoPi NEO"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/friendlyarm/nanopi-neo/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/friendlyarm/nanopi-neo/post-image.sh"
 
 # Linux headers same as kernel, a 4.10 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_10=y
@@ -31,8 +29,13 @@ BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
 # Build an sdcard image
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
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
