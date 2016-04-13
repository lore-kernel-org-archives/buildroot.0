From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Wed, 13 Apr 2016 17:03:28 -0300
Subject: [Buildroot] [PATCH 03/15] board/olimex_a20_olinuxino: Leverage the
	new genimage infra
In-Reply-To: <1460577820-32164-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1460577820-32164-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <1460577820-32164-4-git-send-email-ezequiel@vanguardiasur.com.ar>
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
 board/olimex/a20_olinuxino/post-image.sh         | 16 ----------------
 configs/olimex_a20_olinuxino_lime2_defconfig     |  2 --
 configs/olimex_a20_olinuxino_lime_defconfig      |  4 ++--
 configs/olimex_a20_olinuxino_lime_mali_defconfig |  4 ++--
 configs/olimex_a20_olinuxino_micro_defconfig     |  4 ++--
 5 files changed, 6 insertions(+), 24 deletions(-)
 delete mode 100755 board/olimex/a20_olinuxino/post-image.sh

diff --git a/board/olimex/a20_olinuxino/post-image.sh b/board/olimex/a20_olinuxino/post-image.sh
deleted file mode 100755
index 9cca1b1789ec..000000000000
--- a/board/olimex/a20_olinuxino/post-image.sh
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
diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index 57dda72f295f..dfb41c9aa60e 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -7,7 +7,6 @@ BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
 BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a20_olinuxino/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/olimex/a20_olinuxino/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="board/olimex/a20_olinuxino/boot.cmd $(TARGET_DIR)/boot"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
@@ -28,5 +27,4 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.01"
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index bfa95c4e605e..8bb8c2c04bf3 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -12,7 +12,6 @@ BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a20_olinuxino/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/olimex/a20_olinuxino/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="board/olimex/a20_olinuxino/boot.cmd $(TARGET_DIR)/boot"
 
 # Kernel
@@ -28,6 +27,8 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_GENIMAGE=y
+BR2_TARGET_ROOTFS_GENIMAGE_CFG="board/olimex/a20_olinuxino/genimage.cfg"
 # BR2_TARGET_ROOTFS_TAR is not set
 
 # Bootloaders
@@ -41,5 +42,4 @@ BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 
 # Additional tools
-BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
diff --git a/configs/olimex_a20_olinuxino_lime_mali_defconfig b/configs/olimex_a20_olinuxino_lime_mali_defconfig
index 42c8a7c39daa..50d87ea583c2 100644
--- a/configs/olimex_a20_olinuxino_lime_mali_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_mali_defconfig
@@ -12,7 +12,6 @@ BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a20_olinuxino/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/olimex/a20_olinuxino/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="board/olimex/a20_olinuxino/boot-mali.cmd $(TARGET_DIR)/boot"
 
 # Kernel
@@ -33,6 +32,8 @@ BR2_PACKAGE_SUNXI_MALI_DBG=y
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_GENIMAGE=y
+BR2_TARGET_ROOTFS_GENIMAGE_CFG="board/olimex/a20_olinuxino/genimage.cfg"
 # BR2_TARGET_ROOTFS_TAR is not set
 
 # Bootloaders
@@ -45,5 +46,4 @@ BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 
 # Additional tools
-BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
diff --git a/configs/olimex_a20_olinuxino_micro_defconfig b/configs/olimex_a20_olinuxino_micro_defconfig
index 17fe6cf38816..9074ecc03020 100644
--- a/configs/olimex_a20_olinuxino_micro_defconfig
+++ b/configs/olimex_a20_olinuxino_micro_defconfig
@@ -12,7 +12,6 @@ BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a20_olinuxino/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/olimex/a20_olinuxino/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="board/olimex/a20_olinuxino/boot.cmd $(TARGET_DIR)/boot"
 
 # Kernel
@@ -27,6 +26,8 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_GENIMAGE=y
+BR2_TARGET_ROOTFS_GENIMAGE_CFG="board/olimex/a20_olinuxino/genimage.cfg"
 # BR2_TARGET_ROOTFS_TAR is not set
 
 # Bootloaders
@@ -39,5 +40,4 @@ BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 
 # Additional tools
-BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.7.0
