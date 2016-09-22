From: Lothar Felten <lothar.felten@gmail.com>
Date: Fri, 23 Sep 2016 00:20:49 +0200
Subject: [Buildroot] [PATCH 2/2] configs: new defconfig for beaglebone_qt5
In-Reply-To: <1474582849-10730-1-git-send-email-lothar.felten@gmail.com>
References: <1474582849-10730-1-git-send-email-lothar.felten@gmail.com>
Message-ID: <1474582849-10730-2-git-send-email-lothar.felten@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a target configuration for the beaglebone that supports the SGX530
graphics acceleration and builds the qt5 demos with the eglfs backend.
The imagination technologies demos and fbv are also included.
The linux kernel is based on the omap2plus defconfig, a config fragment
adds the required settings for SGX accelerator support.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
 board/beaglebone/linux-4.1-sgx.fragment | 12 ++++++++++
 board/beaglebone/readme.txt             |  2 +-
 configs/beaglebone_qt5_defconfig        | 39 +++++++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 board/beaglebone/linux-4.1-sgx.fragment
 create mode 100644 configs/beaglebone_qt5_defconfig

diff --git a/board/beaglebone/linux-4.1-sgx.fragment b/board/beaglebone/linux-4.1-sgx.fragment
new file mode 100644
index 0000000..c0d2e7b
--- /dev/null
+++ b/board/beaglebone/linux-4.1-sgx.fragment
@@ -0,0 +1,12 @@
+CONFIG_PREEMPT=y
+CONFIG_PREEMPT_COUNT=y
+CONFIG_OMAP2_DSS_INIT=y
+CONFIG_OMAP_DSS_BASE=y
+CONFIG_OMAP2_DSS=y
+CONFIG_OMAP2_DSS_DPI=y
+CONFIG_DRM_OMAP=y
+CONFIG_DRM_OMAP_NUM_CRTCS=2
+CONFIG_DRM_OMAP_WB_M2M=y
+CONFIG_DRM_TILCDC=y
+CONFIG_DRM_I2C_NXP_TDA998X=y
+CONFIG_DRM=y
diff --git a/board/beaglebone/readme.txt b/board/beaglebone/readme.txt
index d8ff91e..d50c2bb 100644
--- a/board/beaglebone/readme.txt
+++ b/board/beaglebone/readme.txt
@@ -8,7 +8,7 @@ This configuration will build a complete image for the beaglebone and the
 TI AM335x-EVM, the board type is identified by the on-board EEPROM.
 The configuration is based on the ti-processor-sdk-02.00.00.00.
 Device tree blobs for beaglebone variants and the evm-sk are built too.
-
+For Qt5 support support use the beaglebone_qt5_defconfig
 
 How to build it
 ===============
diff --git a/configs/beaglebone_qt5_defconfig b/configs/beaglebone_qt5_defconfig
new file mode 100644
index 0000000..f554bb0
--- /dev/null
+++ b/configs/beaglebone_qt5_defconfig
@@ -0,0 +1,39 @@
+BR2_arm=y
+BR2_cortex_a8=y
+BR2_GLOBAL_PATCH_DIR="board/beaglebone/patches"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beaglebone/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.ti.com/processor-sdk/processor-sdk-linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="52c4aa7cdb93d61f8008f380135beaf7b8fa6593"
+BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/beaglebone/linux-4.1-sgx.fragment"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-evmsk"
+BR2_PACKAGE_FBV=y
+BR2_PACKAGE_QT5=y
+BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
+BR2_PACKAGE_QT5BASE_EXAMPLES=y
+BR2_PACKAGE_QT5BASE_EGLFS=y
+BR2_PACKAGE_QT5QUICKCONTROLS=y
+BR2_PACKAGE_TI_SGX_DEMOS=y
+BR2_PACKAGE_TI_SGX_KM=y
+BR2_PACKAGE_TI_SGX_UM=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="spl/u-boot-spl.bin"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="MLO"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
1.9.1
