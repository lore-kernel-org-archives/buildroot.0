From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Wed, 13 Apr 2016 17:03:30 -0300
Subject: [Buildroot] [PATCH 05/15] board/firefly: Leverage the new genimage
	infra
In-Reply-To: <1460577820-32164-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1460577820-32164-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <1460577820-32164-6-git-send-email-ezequiel@vanguardiasur.com.ar>
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
 board/firefly/firefly-rk3288/post-build.sh |  4 ++++
 board/firefly/firefly-rk3288/post-image.sh | 20 --------------------
 configs/firefly_rk3288_defconfig           |  4 ++--
 configs/firefly_rk3288_demo_defconfig      |  4 ++--
 4 files changed, 8 insertions(+), 24 deletions(-)
 delete mode 100755 board/firefly/firefly-rk3288/post-image.sh

diff --git a/board/firefly/firefly-rk3288/post-build.sh b/board/firefly/firefly-rk3288/post-build.sh
index 94e89ce6a4a2..57b2c4604392 100755
--- a/board/firefly/firefly-rk3288/post-build.sh
+++ b/board/firefly/firefly-rk3288/post-build.sh
@@ -1,3 +1,7 @@
 BOARD_DIR="$(dirname $0)"
 
 install -m 0644 -D $BOARD_DIR/extlinux.conf $TARGET_DIR/boot/extlinux/extlinux.conf
+
+$HOST_DIR/usr/bin/mkimage -n rk3288 -T rksd	\
+	-d $BINARIES_DIR/u-boot-spl-dtb.bin	\
+	$BINARIES_DIR/u-boot-spl-dtb.img
diff --git a/board/firefly/firefly-rk3288/post-image.sh b/board/firefly/firefly-rk3288/post-image.sh
deleted file mode 100755
index 1dd30a6e7e8e..000000000000
--- a/board/firefly/firefly-rk3288/post-image.sh
+++ /dev/null
@@ -1,20 +0,0 @@
-#!/bin/sh
-
-MKIMAGE=$HOST_DIR/usr/bin/mkimage
-
-BOARD_DIR="$(dirname $0)"
-GENIMAGE_CFG="${BOARD_DIR}/sd-image.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-$MKIMAGE -n rk3288 -T rksd -d $BINARIES_DIR/u-boot-spl-dtb.bin $BINARIES_DIR/u-boot-spl-dtb.img
-
-rm -rf "${GENIMAGE_TMP}"
-
-genimage							\
-	--rootpath "${TARGET_DIR}"		\
-	--tmppath "${GENIMAGE_TMP}"		\
-	--inputpath "${BINARIES_DIR}"	\
-	--outputpath "${BINARIES_DIR}"	\
-	--config "${GENIMAGE_CFG}"
-
-exit $?
diff --git a/configs/firefly_rk3288_defconfig b/configs/firefly_rk3288_defconfig
index 017a7ee6d748..5f33cceb0255 100644
--- a/configs/firefly_rk3288_defconfig
+++ b/configs/firefly_rk3288_defconfig
@@ -5,7 +5,6 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 BR2_TARGET_GENERIC_HOSTNAME="firefly-rk3288"
 BR2_TARGET_GENERIC_ISSUE="Welcome to FIREFLY RK3288!"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/firefly/firefly-rk3288/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/firefly/firefly-rk3288/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/mmind/linux-rockchip.git"
@@ -18,6 +17,8 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="rk3288-firefly"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_GENIMAGE=y
+BR2_TARGET_ROOTFS_GENIMAGE_CFG="board/firefly/firefly-rk3288/sd-image.cfg"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
@@ -28,5 +29,4 @@ BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin"
-BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
diff --git a/configs/firefly_rk3288_demo_defconfig b/configs/firefly_rk3288_demo_defconfig
index 7dadc6bc9aeb..692455d5378c 100644
--- a/configs/firefly_rk3288_demo_defconfig
+++ b/configs/firefly_rk3288_demo_defconfig
@@ -7,7 +7,6 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_TARGET_GENERIC_HOSTNAME="firefly-rk3288"
 BR2_TARGET_GENERIC_ISSUE="Welcome to FIREFLY RK3288!"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/firefly/firefly-rk3288/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/firefly/firefly-rk3288/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/mmind/linux-rockchip.git"
@@ -26,6 +25,8 @@ BR2_PACKAGE_QT5BASE_EGLFS=y
 BR2_PACKAGE_MALI_T76X=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_GENIMAGE=y
+BR2_TARGET_ROOTFS_GENIMAGE_CFG="board/firefly/firefly-rk3288/sd-image.cfg"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
@@ -36,5 +37,4 @@ BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin"
-BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.7.0
