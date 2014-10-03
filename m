From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri,  3 Oct 2014 14:43:32 +0200
Subject: [Buildroot] [PATCH 11/11] qmx6_defconfig: update
In-Reply-To: <1412340212-3089-1-git-send-email-jezz@sysmic.org>
References: <1412340212-3089-1-git-send-email-jezz@sysmic.org>
Message-ID: <1412340212-3089-12-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Update kernel
- Add u-boot configuration
- Add support for graphical drivers
- Enable Qt5 (eglfs) since most of user will it with this configuration
- 6q_bootscript.txt is no more needed by new version of u-boot

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 board/congatec/qmx6/6q_bootscript.txt |  2 --
 board/congatec/qmx6/post-build.sh     |  7 -----
 configs/qmx6_defconfig                | 49 +++++++++++++++++++++++++++++++----
 3 files changed, 44 insertions(+), 14 deletions(-)
 delete mode 100644 board/congatec/qmx6/6q_bootscript.txt
 delete mode 100755 board/congatec/qmx6/post-build.sh

diff --git a/board/congatec/qmx6/6q_bootscript.txt b/board/congatec/qmx6/6q_bootscript.txt
deleted file mode 100644
index 1382220..0000000
--- a/board/congatec/qmx6/6q_bootscript.txt
+++ /dev/null
@@ -1,2 +0,0 @@
-set bootargs console=ttymxc1,115200 root=/dev/mmcblk0p1 rootwait consoleblank=0
-${fs}load mmc ${disk}:1 10800000 /boot/uImage && bootm 10800000 ; echo "Error loading kernel image"
diff --git a/board/congatec/qmx6/post-build.sh b/board/congatec/qmx6/post-build.sh
deleted file mode 100755
index 92251a5..0000000
--- a/board/congatec/qmx6/post-build.sh
+++ /dev/null
@@ -1,7 +0,0 @@
-#!/bin/sh
-
-TARGET_DIR=$1
-BOARD_DIR="$(dirname $0)"
-
-mkimage -A arm -O linux -T script -C none -a 0 -e 0 -n "boot script" \
-    -d $BOARD_DIR/6q_bootscript.txt $TARGET_DIR/6q_bootscript
diff --git a/configs/qmx6_defconfig b/configs/qmx6_defconfig
index 143e058..8753f94 100644
--- a/configs/qmx6_defconfig
+++ b/configs/qmx6_defconfig
@@ -1,16 +1,55 @@
+# architecture
 BR2_arm=y
 BR2_cortex_a9=y
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.0.101"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_0=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y
+
+# system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/congatec/qmx6/post-build.sh"
+
+# kernel
+# Notice you need a recent version of u-boot (with DT support) to be able
+# to boot this kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://git.congatec.com/arm/qmx6_kernel.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.0.35_4.1.0_QMX6_R1.1.2"
+# Last version of branch cgt_imx_3.10.17_1.0.0
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="9bafbcba67f7bb2a48a5e05998cecb1165aa444f"
 BR2_LINUX_KERNEL_DEFCONFIG="qmx6"
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-qmx6"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# Graphics drivers
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q=y
+BR2_PACKAGE_GPU_VIV_BIN_MX6Q=y
+BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_FB=y
+
+# Enable Qt5
+BR2_PACKAGE_QT5=y
+BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
+BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
+BR2_PACKAGE_QT5BASE_EGLFS=y
+BR2_PACKAGE_QT5BASE_DEFAULT_QPA="eglfs"
+BR2_PACKAGE_QT5BASE_PNG=y
+
+# u-boot
+# Change boardname depending of your product number
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="cgt_qmx6_pn016103"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://git.congatec.com/arm/qmx6_uboot.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="6388c474189b42c07bb865dd604c74483da099f3"
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.pn016103.imx"
+
+# Images
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_3=y
+
+# Usefull host packages
+BR2_PACKAGE_HOST_IMX_USB_LOADER=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+
-- 
2.1.0
