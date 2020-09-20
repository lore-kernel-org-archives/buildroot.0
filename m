From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Sep 2020 15:49:24 +0200
Subject: [Buildroot] [git commit] configs/imx8mqevk_defconfig: new defconfig
Message-ID: <20200920134010.D775D88094@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d72ccb94790bf400dd59f2423fce77c44fc8afc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for imx8mqevk_defconfig that allows booting a mainline
kernel.

This defconfig still relies on NXP ATF and U-Boot, but in the long term
the plan is to switch to mainline ATF and U-Boot as well.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                           |  1 +
 board/freescale/imx8mqevk/readme.txt |  6 ++++++
 configs/imx8mqevk_defconfig          | 40 ++++++++++++++++++++++++++++++++++++
 3 files changed, 47 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 42bbdc7e78..057592b8e5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -823,6 +823,7 @@ F:	configs/imx6ullevk_defconfig
 F:	configs/imx6ulpico_defconfig
 F:	configs/imx7d-sdb_defconfig
 F:	configs/imx7dpico_defconfig
+F:	configs/imx8mqevk_defconfig
 F:	configs/mx25pdk_defconfig
 F:	configs/mx51evk_defconfig
 F:	configs/mx53loco_defconfig
diff --git a/board/freescale/imx8mqevk/readme.txt b/board/freescale/imx8mqevk/readme.txt
index e60eba4cb6..61fb2bc80b 100644
--- a/board/freescale/imx8mqevk/readme.txt
+++ b/board/freescale/imx8mqevk/readme.txt
@@ -10,8 +10,14 @@ Build
 
 First, configure Buildroot for the i.MX8MQ EVK board:
 
+If you want to use the NXP kernel:
+
   make freescale_imx8mqevk_defconfig
 
+Or if you want to use a mainline kernel:
+
+  make imx8mqevk_defconfig
+
 Build all components:
 
   make
diff --git a/configs/imx8mqevk_defconfig b/configs/imx8mqevk_defconfig
new file mode 100644
index 0000000000..1981fa06c8
--- /dev/null
+++ b/configs/imx8mqevk_defconfig
@@ -0,0 +1,40 @@
+BR2_aarch64=y
+BR2_ARM_FPU_VFPV3=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/imx8mq-evk.dtb"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.7"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mq-evk"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/imx-atf"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="rel_imx_5.4.24_2.1.0"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mq"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_5.4.24_2.1.0"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mq_evk"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
+BR2_TARGET_UBOOT_SPL=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_IMX_MKIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
