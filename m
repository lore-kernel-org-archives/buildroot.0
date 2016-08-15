From: Lothar Felten <lothar.felten@gmail.com>
Date: Mon, 15 Aug 2016 20:13:20 +0200
Subject: [Buildroot] [PATCH 1/1] configs: new defconfig for TI
	am335x-evm_sgx-qt5
Message-ID: <1471284800-17046-1-git-send-email-lothar.felten@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a target configuration for the ti am335x-evm that supports the SGX530
graphics acceleration and builds the qt5 demos with the eglfs backend.
The imagination technologies demos and fbv are also included.
The linux kernel is based on the omap2plus defconfig, a config fragment
adds the required settings for SGX accelerator support.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
 board/ti/am335x-evm/linux-4.1-sgx.fragment | 12 ++++++++++
 configs/am335x-evm_sgx-qt5_defconfig       | 38 ++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 board/ti/am335x-evm/linux-4.1-sgx.fragment
 create mode 100644 configs/am335x-evm_sgx-qt5_defconfig

diff --git a/board/ti/am335x-evm/linux-4.1-sgx.fragment b/board/ti/am335x-evm/linux-4.1-sgx.fragment
new file mode 100644
index 0000000..c0d2e7b
--- /dev/null
+++ b/board/ti/am335x-evm/linux-4.1-sgx.fragment
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
diff --git a/configs/am335x-evm_sgx-qt5_defconfig b/configs/am335x-evm_sgx-qt5_defconfig
new file mode 100644
index 0000000..2c76ab0
--- /dev/null
+++ b/configs/am335x-evm_sgx-qt5_defconfig
@@ -0,0 +1,38 @@
+BR2_arm=y
+BR2_cortex_a8=y
+BR2_GLOBAL_PATCH_DIR="board/ti/am335x-evm/patches"
+BR2_KERNEL_HEADERS_4_1=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/ti/am335x-evm/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.ti.com/processor-sdk/processor-sdk-linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="52c4aa7cdb93d61f8008f380135beaf7b8fa6593"
+BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/ti/am335x-evm/linux-4.1-sgx.fragment"
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
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.05"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="MLO"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
1.9.1
