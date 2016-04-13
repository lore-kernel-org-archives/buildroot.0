From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Wed, 13 Apr 2016 17:03:38 -0300
Subject: [Buildroot] [PATCH 13/15] board/orangepipc: Leverage the new
	genimage infra
In-Reply-To: <1460577820-32164-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1460577820-32164-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <1460577820-32164-14-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Let's rework the board and config files to use the
recently added genimage infra, which generates the
SD card image directly.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 board/orangepi/orangepipc/post-build.sh |  5 +++++
 board/orangepi/orangepipc/post-image.sh | 22 ----------------------
 configs/orangepipc_defconfig            |  4 ++--
 3 files changed, 7 insertions(+), 24 deletions(-)
 delete mode 100755 board/orangepi/orangepipc/post-image.sh

diff --git a/board/orangepi/orangepipc/post-build.sh b/board/orangepi/orangepipc/post-build.sh
index ca7a99f220cc..3482d5796e5a 100755
--- a/board/orangepi/orangepipc/post-build.sh
+++ b/board/orangepi/orangepipc/post-build.sh
@@ -9,3 +9,8 @@ BOOT_CMD_H=$BINARIES_DIR/boot.scr
 
 # U-Boot script
 $MKIMAGE -C none -A arm -T script -d $BOOT_CMD $BOOT_CMD_H
+
+# As we now use the Linux v4.5-RC1 kernel no orangepi-pc dtb exists yet.
+# However the orangepi-plus dtb has not much content, only mmc0 and uart
+# which are equal to the pc version of the board, so we use it here.
+mv ${BINARIES_DIR}/sun8i-h3-orangepi-plus.dtb ${BINARIES_DIR}/sun8i-h3-orangepi-pc.dtb
diff --git a/board/orangepi/orangepipc/post-image.sh b/board/orangepi/orangepipc/post-image.sh
deleted file mode 100755
index dbe1516696bd..000000000000
--- a/board/orangepi/orangepipc/post-image.sh
+++ /dev/null
@@ -1,22 +0,0 @@
-#!/bin/sh
-
-BOARD_DIR="$(dirname $0)"
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-rm -rf "${GENIMAGE_TMP}"
-
-# As we now use the Linux v4.5-RC1 kernel no orangepi-pc dtb exists yet.
-# However the orangepi-plus dtb has not much content, only mmc0 and uart
-# which are equal to the pc version of the board, so we use it here.
-mv ${BINARIES_DIR}/sun8i-h3-orangepi-plus.dtb ${BINARIES_DIR}/sun8i-h3-orangepi-pc.dtb
-
-
-genimage                               \
-	--rootpath "${TARGET_DIR}"     \
-	--tmppath "${GENIMAGE_TMP}"    \
-	--inputpath "${BINARIES_DIR}"  \
-	--outputpath "${BINARIES_DIR}" \
-	--config "${GENIMAGE_CFG}"
-
-exit $?
diff --git a/configs/orangepipc_defconfig b/configs/orangepipc_defconfig
index cb04d744892c..42485c6431ec 100644
--- a/configs/orangepipc_defconfig
+++ b/configs/orangepipc_defconfig
@@ -5,7 +5,6 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_PC"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi PC"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/orangepipc/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/orangepi/orangepipc/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
@@ -14,6 +13,8 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-plus"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_GENIMAGE=y
+BR2_TARGET_ROOTFS_GENIMAGE_CFG="board/orangepi/orangepipc/genimage.cfg"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
@@ -24,6 +25,5 @@ BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.7.0
