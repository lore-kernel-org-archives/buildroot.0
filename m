From: Xavier Roumegue <xroumegue@gmail.com>
Date: Wed, 25 Nov 2020 19:30:17 +0100
Subject: [Buildroot] [PATCH v4 8/8] configs/imx8mmevk: new defconfig
In-Reply-To: <20201109142309.1135596-2-xroumegue@gmail.com>
References: <20201109142309.1135596-2-xroumegue@gmail.com>
Message-ID: <20201125183017.15585-9-xroumegue@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Introduce NXP imx8mm evk board configuration that uses mainline atf,
uboot and kernel.

Mainline uboot mkimage tool generates the boot image.

Signed-off-by: Xavier Roumegue <xroumegue@gmail.com>
Tested-by: Julien Olivain <ju.o@free.fr>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
---
 DEVELOPERS                           |  3 +++
 board/freescale/imx8mmevk/readme.txt | 29 ++++++++++++++++++--
 configs/imx8mmevk_defconfig          | 40 ++++++++++++++++++++++++++++
 3 files changed, 70 insertions(+), 2 deletions(-)
 create mode 100644 configs/imx8mmevk_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 9ab1e125f4..a1efd0dc98 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2684,6 +2684,9 @@ F:	package/fwup/
 N:	Yair Ben Avraham <yairba@protonmail.com>
 F:	package/gloox/
 
+N:	Xavier Roumegue <xroumegue@gmail.com>
+F:	configs/imx8mmevk_defconfig
+
 N:	Yann E. MORIN <yann.morin.1998@free.fr>
 F:	board/friendlyarm/nanopi-neo/
 F:	configs/nanopi_neo_defconfig
diff --git a/board/freescale/imx8mmevk/readme.txt b/board/freescale/imx8mmevk/readme.txt
index 7b69405d30..be3b54e40d 100644
--- a/board/freescale/imx8mmevk/readme.txt
+++ b/board/freescale/imx8mmevk/readme.txt
@@ -5,8 +5,8 @@ Freescale i.MX8MM EVK board
 This file documents the Buildroot support for the Freescale i.MX8MM
 EVK board.
 
-Build
-=====
+Building with NXP ATF, U-Boot and kernel
+========================================
 
 First, configure Buildroot for the i.MX8MM EVK board:
 
@@ -32,6 +32,31 @@ You will find in output/images/ the following files:
   - u-boot-nodtb.bin
   - u-boot-spl-ddr.bin
 
+Building with mainline ATF, U-Boot and kernel
+=============================================
+First, configure Buildroot for the i.MX8MM EVK board:
+
+  make imx8mmevk_defconfig
+
+Build all components:
+
+  make
+
+You will find in output/images/ the following files:
+    - bl31.bin
+    - boot.vfat
+    - ddr_fw.bin
+    - flash.bin
+    - Image
+    - imx8mm-evk.dtb
+    - [lp]ddr4_*.bin
+    - rootfs.ext2
+    - rootfs.ext4
+    - rootfs.tar
+    - sdcard.img
+    - u-boot-spl
+    - u-boot-spl.bin
+
 Create a bootable SD card
 =========================
 
diff --git a/configs/imx8mmevk_defconfig b/configs/imx8mmevk_defconfig
new file mode 100644
index 0000000000..089acd506c
--- /dev/null
+++ b/configs/imx8mmevk_defconfig
@@ -0,0 +1,40 @@
+BR2_aarch64=y
+BR2_ARM_FPU_VFPV3=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.18"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mm-evk"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.3"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mm"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.10"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mm_evk"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_FW_FILES="lpddr4*.bin"
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_ELF=y
+BR2_TARGET_UBOOT_FORMAT_IMX_FIT=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.bin spl/u-boot-spl"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="ATF_LOAD_ADDR=0x920000"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
-- 
2.29.2
