From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jul 2016 18:13:43 +0200
Subject: [Buildroot] [git commit] zynq_microzed: bump U-Boot to
	xilinx-v2016.2
Message-ID: <20160730161615.9639581D7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6b669b61a84f6f249491de571582eb73f4b52441
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is the latest release tag in the Xilinx repository, based on
U-Boot v2016.01 in the mainline.  To sync with the Zedboard updates,
switch over to the Xilinx GitHub repository.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/avnet/microzed/readme.txt                    | 53 ++++------------------
 ...eate-microzed-specific-U-Boot-environment.patch | 41 -----------------
 configs/zynq_microzed_defconfig                    | 10 ++--
 3 files changed, 14 insertions(+), 90 deletions(-)

diff --git a/board/avnet/microzed/readme.txt b/board/avnet/microzed/readme.txt
index d0fc5ee..927e97a 100644
--- a/board/avnet/microzed/readme.txt
+++ b/board/avnet/microzed/readme.txt
@@ -9,56 +9,21 @@ Steps to create a working system for Microzed:
 
 1) make zynq_microzed_defconfig
 2) make
-3) copy files BOOT.BIN, u-boot-dtb.img, rootfs.cpio.uboot,
-	uImage, zynq-zed.dtb into your SD card
+2) make
+3) All needed files will be available in the output/images directory.
+   Create a FAT32 partition at the beginning of your SD Card and copy files:
+     - boot.bin
+     - u-boot.img
+     - uImage
+     - uramdisk.image.gz (should be renamed from rootfs.cpio.uboot)
+     - devicetree.dtb (should be renamed from zynq-zed.dtb)
+   into your SD card
 4) boot your Microzed
 
-The expected output:
-
- U-Boot SPL 2015.07 (Sep 15 2015 - 16:10:56)
- mmc boot
- reading system.dtb
- spl_load_image_fat_os: error reading image system.dtb, err - -1
- reading u-boot-dtb.img
- reading u-boot-dtb.img
-
-
- U-Boot 2015.07 (Sep 15 2015 - 16:10:56 +0200)
-
- Model: Zynq MicroZED Board
- I2C:   ready
- DRAM:  ECC disabled 1 GiB
- MMC:   zynq_sdhci: 0
- Using default environment
- ...
-
-When using an older U-Boot then 2015.07, a working ps7_init.c
-file is required to be installed into the U-Boot directory
-structure. From 2015.07, the major Zynq-based boards are
-supported without any manual intervention.
-
-Resulting system
-----------------
-A FAT32 partition should be created at the beginning of the SD Card
-and the following files should be installed:
-	/BOOT.BIN
-	/zynq-zed.dtb
-	/uImage
-	/rootfs-cpio.uboot
-	/u-boot-dtb.img
-
-All needed files can be taken from output/images/
-
-BOOT.BIN, uImage and u-boot-dtb.img are direct copies of the same files
-available on output/images/.
-
 Note th at the DTB (zynq-zed.dtb) is the same as the one used for the
 Zedboard, and that this is the recommended solution, see
 https://forums.xilinx.com/t5/Embedded-Linux/Microzed-default-device-tree-dts/td-p/432856.
 
-There is a patch attached that redefines the U-Boot's environment
-to work with Buildroot out-of-the-box.
-
 You can alter the booting procedure by creating a file uEnv.txt
 in the root of the SD card. It is a plain text file in format
 <key>=<value> one per line:
diff --git a/board/avnet/microzed/uboot/0001-zynq-Create-microzed-specific-U-Boot-environment.patch b/board/avnet/microzed/uboot/0001-zynq-Create-microzed-specific-U-Boot-environment.patch
deleted file mode 100644
index b9d0c38..0000000
--- a/board/avnet/microzed/uboot/0001-zynq-Create-microzed-specific-U-Boot-environment.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From a4c0058967a551385da5e16d2787d9f704cab225 Mon Sep 17 00:00:00 2001
-From: Jan Viktorin <viktorin@rehivetech.com>
-Date: Thu, 18 Jun 2015 16:26:02 +0200
-Subject: [PATCH] zynq: Create microzed-specific U-Boot environment
-
-This is a copy of the patch supplied for Zedboard.
-
-Signed-off-by: Davide Viti <d.viti@infosolution.it>
-
---- a/include/configs/zynq_microzed.h	2015-07-14 19:32:21.000000000 +0200
-+++ b/include/configs/zynq_microzed.h	2015-09-02 12:19:35.728503472 +0200
-@@ -22,4 +22,29 @@
- 
- #include <configs/zynq-common.h>
- 
-+#undef CONFIG_EXTRA_ENV_SETTINGS
-+#define CONFIG_EXTRA_ENV_SETTINGS \
-+	"envload=mmc info && if fatload mmc 0 0x1000 uEnv.txt;"\
-+	" then echo Importing uEnv.txt; env import -t 0x1000"  \
-+	" $filesize; fi;\0"                                    \
-+	"bootcmd=run $modeboot\0"                              \
-+	"modeboot=sdboot\0"                                    \
-+	"baudrate=115200\0"                                    \
-+	"bootenv=uEnv.txt\0"                                   \
-+	"devicetree_image=zynq-zed.dtb\0"                      \
-+	"kernel_image=uImage\0"                                \
-+	"ramdisk_image=rootfs.cpio.uboot\0"                    \
-+	"fpga_image=system.bit\0"                              \
-+	"sdboot=echo Booting from SD...;"                      \
-+	" run envload; run fpgaboot;"                          \
-+	" fatload mmc 0 0x1000000 ${kernel_image}"             \
-+	" && fatload mmc 0 0x3000000 ${ramdisk_image}"         \
-+	" && fatload mmc 0 0x2000000 ${devicetree_image}"      \
-+	" && bootm 0x1000000 0x3000000 0x2000000\0"            \
-+	"fpgaboot=if fatload mmc 0 0x1000000 ${fpga_image};"   \
-+	" then echo Booting FPGA from ${fpga_image};"          \
-+	" fpga info 0 && fpga loadb 0 0x1000000 $filesize;"    \
-+	" else echo FPGA image ${fpga_image} was not found,"   \
-+	" skipping...; fi;\0"
-+
- #endif /* __CONFIG_ZYNQ_MICROZED_H */
diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index 7b44af6..fa25857 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -17,10 +17,10 @@ BR2_TARGET_ROOTFS_CPIO_GZIP=y
 BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="zynq_microzed"
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.07"
-BR2_TARGET_UBOOT_PATCH="$(TOPDIR)/board/avnet/microzed/uboot"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Xilinx/u-boot-xlnx.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2016.2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
+BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_ZYNQ_IMAGE=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
