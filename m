From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Wed, 13 Apr 2016 17:03:35 -0300
Subject: [Buildroot] [PATCH 10/15] board/pandaboard: Leverage the new
	genimage infra
In-Reply-To: <1460577820-32164-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1460577820-32164-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <1460577820-32164-11-git-send-email-ezequiel@vanguardiasur.com.ar>
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
 board/pandaboard/post-image.sh | 16 ----------------
 configs/pandaboard_defconfig   |  4 ++--
 2 files changed, 2 insertions(+), 18 deletions(-)
 delete mode 100755 board/pandaboard/post-image.sh

diff --git a/board/pandaboard/post-image.sh b/board/pandaboard/post-image.sh
deleted file mode 100755
index 9cca1b1789ec..000000000000
--- a/board/pandaboard/post-image.sh
+++ /dev/null
@@ -1,16 +0,0 @@
-#!/bin/sh
-
-BOARD_DIR="$(dirname $0)"
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-rm -rf "${GENIMAGE_TMP}"
-
-genimage                           \
-	--rootpath "${TARGET_DIR}"     \
-	--tmppath "${GENIMAGE_TMP}"    \
-	--inputpath "${BINARIES_DIR}"  \
-	--outputpath "${BINARIES_DIR}" \
-	--config "${GENIMAGE_CFG}"
-
-exit $?
diff --git a/configs/pandaboard_defconfig b/configs/pandaboard_defconfig
index 49747e070f71..50496d7da320 100644
--- a/configs/pandaboard_defconfig
+++ b/configs/pandaboard_defconfig
@@ -6,7 +6,6 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyO2"
 BR2_SYSTEM_DHCP="eth0"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pandaboard/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
@@ -16,6 +15,8 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="omap4-panda-es omap4-panda omap4-panda-a4"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_GENIMAGE=y
+BR2_TARGET_ROOTFS_GENIMAGE_CFG="board/pandaboard/genimage.cfg"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
@@ -26,5 +27,4 @@ BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="MLO"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.7.0
