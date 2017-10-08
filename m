From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Oct 2017 15:54:43 +0200
Subject: [Buildroot] [git commit] configs/imx6-sabreauto: Add a new defconfig
Message-ID: <20171008134737.1464680432@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd20bbdaaf2c5a9450479a94a9bd70ca1b20ef41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Introduce imx6-sabreauto_defconfig that uses mainline U-Boot and
mainline kernel.

As mainline U-Boot supports SPL, it is possible to boot the same
sdcard.img in the three mx6sabreauto variants: imx6q, imx6dl and imx6qp.

Also update the readme.txt file to explain how to build an image for
mx6sabreauto boards using mainline U-Boot and kernel.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
[Thomas: regenerate gitlab-ci.yml file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .gitlab-ci.yml                       |  1 +
 board/freescale/imx6sabre/readme.txt | 25 ++++++++++++++++++++++--
 configs/imx6-sabreauto_defconfig     | 38 ++++++++++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e11edbe..0e69288 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -122,6 +122,7 @@ gdb_bfin_bf512_defconfig: *defconfig
 grinn_chiliboard_defconfig: *defconfig
 grinn_liteboard_defconfig: *defconfig
 imx23evk_defconfig: *defconfig
+imx6-sabreauto_defconfig: *defconfig
 imx6-sabresd_defconfig: *defconfig
 imx6-sabresd_qt5_defconfig: *defconfig
 imx6ulpico_defconfig: *defconfig
diff --git a/board/freescale/imx6sabre/readme.txt b/board/freescale/imx6sabre/readme.txt
index a1bd82f..4b8db52 100644
--- a/board/freescale/imx6sabre/readme.txt
+++ b/board/freescale/imx6sabre/readme.txt
@@ -18,8 +18,8 @@ Read the SABRE for Automotive Infotainment Quick Start Guide for an
 introduction to the board:
 http://cache.freescale.com/files/32bit/doc/user_guide/IMX6SABREINFOQSG.pdf
 
-Build
-=====
+Building with NXP kernel and NXP U-Boot
+=======================================
 
 First, configure Buildroot for your SABRE board.
 For i.MX6Q SABRE SD board:
@@ -54,6 +54,27 @@ You will find in ./output/images/ the following files:
   - u-boot.imx
   - uImage, or zImage for i.MX6 SoloX
 
+Building with mainline kernel and mainline U-Boot
+=================================================
+
+Mainline U-Boot uses SPL and can support the three
+variants of mx6sabreauto boards: mx6q, mx6dl and mx6qp.
+
+First, configure Buildroot for your mx6sabreauto board
+
+  make imx6-sabreauto_defconfig
+
+Build all components:
+
+  make
+
+You will find in output/images/ the following files:
+  - imx6dl-sabresd.dtb, imx6q-sabresd.dtb, imx6q-sabresd.dtb
+  - rootfs.ext2
+  - SPL and u-boot.img
+  - u-boot.imx
+  - zImage
+
 Create a bootable SD card
 =========================
 
diff --git a/configs/imx6-sabreauto_defconfig b/configs/imx6-sabreauto_defconfig
new file mode 100644
index 0000000..f81964c
--- /dev/null
+++ b/configs/imx6-sabreauto_defconfig
@@ -0,0 +1,38 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_VFPV3=y
+
+# Linux headers same as kernel, a 4.13 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
+
+# System
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
+
+# required tools to create the SD card image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
+# Filesystem
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx6sabreauto"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.09"
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="SPL"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.3"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabreauto imx6dl-sabreauto imx6qp-sabreauto"
