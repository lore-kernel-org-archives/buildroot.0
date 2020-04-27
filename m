From: Xavier Roumegue <xroumegue@gmail.com>
Date: Mon, 27 Apr 2020 23:34:02 +0200
Subject: [Buildroot] [PATCH 3/3] configs/imx8mqevk: new defconfig
In-Reply-To: <20200427213402.6148-1-xroumegue@gmail.com>
References: <20200427213402.6148-1-xroumegue@gmail.com>
Message-ID: <20200427213402.6148-3-xroumegue@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Introduce NXP imx8mq evk board configuration that uses mainline atf,
uboot and kernel.

Mainline uboot mkimage tool generates the boot image.

Signed-off-by: Xavier Roumegue <xroumegue@gmail.com>
Tested-by: Xavier Roumegue <xroumegue@gmail.com>
---
 .gitlab-ci.yml                       |  1 +
 DEVELOPERS                           |  1 +
 board/freescale/imx8mqevk/readme.txt | 35 ++++++++++++++++++++++--
 configs/imx8mqevk_defconfig          | 40 ++++++++++++++++++++++++++++
 4 files changed, 75 insertions(+), 2 deletions(-)
 create mode 100644 configs/imx8mqevk_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 0a348d35ac..32ec5d0de1 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -213,6 +213,7 @@ imx7dpico_defconfig: { extends: .defconfig }
 imx8mmevk_defconfig: { extends: .defconfig }
 imx8mmpico_defconfig: { extends: .defconfig }
 imx8mpico_defconfig: { extends: .defconfig }
+imx8mqevk_defconfig: { extends: .defconfig }
 lafrite_defconfig: { extends: .defconfig }
 lego_ev3_defconfig: { extends: .defconfig }
 licheepi_zero_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index aa9504d25f..fe11f43624 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2639,6 +2639,7 @@ F:	package/fwup/
 
 N:	Xavier Roumegue <xroumegue@gmail.com>
 F:	configs/imx8mmevk_defconfig
+F:	configs/imx8mqevk_defconfig
 
 N:	Yann E. MORIN <yann.morin.1998@free.fr>
 F:	board/friendlyarm/nanopi-neo/
diff --git a/board/freescale/imx8mqevk/readme.txt b/board/freescale/imx8mqevk/readme.txt
index e60eba4cb6..43573868e0 100644
--- a/board/freescale/imx8mqevk/readme.txt
+++ b/board/freescale/imx8mqevk/readme.txt
@@ -5,8 +5,8 @@ Freescale i.MX8MQ EVK board
 This file documents the Buildroot support for the Freescale i.MX8MQ
 EVK board.
 
-Build
-=====
+Building with NXP ATF, U-Boot and kernel
+========================================
 
 First, configure Buildroot for the i.MX8MQ EVK board:
 
@@ -33,6 +33,37 @@ You will find in output/images/ the following files:
   - u-boot-nodtb.bin
   - u-boot-spl-ddr.bin
 
+Building with mainline ATF, U-Boot and kernel
+=============================================
+First, configure Buildroot for the i.MX8MQ EVK board:
+
+  make imx8mqevk_defconfig
+
+Build all components:
+
+  make
+
+You will find in output/images/ the following files:
+    - bl31.bin
+    - bootimage.cfg
+    - boot.vfat
+    - Image
+    - imx8-boot-sd.bin
+    - imx8mq-evk.dtb
+    - lpddr4_pmu_train_fw.bin
+    - rootfs.ext2
+    - rootfs.ext4
+    - rootfs.tar
+    - sdcard.img
+    - signed_hdmi_imx8m.bin
+    - u-boot
+    - u-boot.bin
+    - u-boot.itb
+    - u-boot-nodtb.bin
+    - u-boot-spl
+    - u-boot-spl.bin
+    - u-boot-spl-ddr.bin
+
 Create a bootable SD card
 =========================
 
diff --git a/configs/imx8mqevk_defconfig b/configs/imx8mqevk_defconfig
new file mode 100644
index 0000000000..365efdd668
--- /dev/null
+++ b/configs/imx8mqevk_defconfig
@@ -0,0 +1,40 @@
+BR2_aarch64=y
+BR2_ARM_FPU_VFPV3=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-generate-fw-image.sh board/freescale/common/imx/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.6.7"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mq-evk"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.3"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mq"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.04"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mq_evk"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_FORMAT_ITB=y
+BR2_TARGET_UBOOT_FORMAT_ELF=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.bin spl/u-boot-spl"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="ATF_LOAD_ADDR=0x910000"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
-- 
2.25.1
