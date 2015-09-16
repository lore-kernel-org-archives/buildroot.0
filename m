From: Davide Viti <zinosat@tiscali.it>
Date: Wed, 16 Sep 2015 09:35:11 +0200
Subject: [Buildroot] [PATCH v2] microzed: add Avnet Microzed support
Message-ID: <1442388911-3719-1-git-send-email-d.viti@infosolution.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes are based on Zedboard: Xilinx does not provide a specific DTS
for Microzed in the kernel tree. It is suggested [1] to use the
zynq-zed.dts and change the RAM size

[1] https://forums.xilinx.com/t5/Embedded-Linux/Microzed-default-device-tree-dts/td-p/432856

Signed-off-by: Davide Viti <d.viti@infosolution.it>
---
Changes v1 -> v2:
  - Mention reason for using Zedboard DTS (Jan Viktorin)
  - remove unnecessary spaces from board/avnet/microzed/readme.txt
    
 board/avnet/microzed/readme.txt                    | 65 ++++++++++++++++++++++
 ...eate-microzed-specific-U-Boot-environment.patch | 34 +++++++++++
 configs/microzed_defconfig                         | 26 +++++++++
 3 files changed, 125 insertions(+)
 create mode 100644 board/avnet/microzed/readme.txt
 create mode 100644 board/avnet/microzed/uboot/0001-zynq-Create-microzed-specific-U-Boot-environment.patch
 create mode 100644 configs/microzed_defconfig

diff --git a/board/avnet/microzed/readme.txt b/board/avnet/microzed/readme.txt
new file mode 100644
index 0000000..f729545
--- /dev/null
+++ b/board/avnet/microzed/readme.txt
@@ -0,0 +1,65 @@
+This is the buildroot board support for the Avnet Microzed. The Microzed is
+a development board based on the Xilinx Zynq-7000 based All-Programmable
+System-On-Chip.
+
+Microzed information including schematics, reference designs, and manuals are
+available from http://www.zedboard.org .
+
+Steps to create a working system for Microzed:
+
+1) make microzed_defconfig
+2) make
+3) copy files BOOT.BIN, u-boot-dtb.img, rootfs.cpio.uboot,
+	uImage, zynq-zed.dtb into your SD card
+4) boot your Microzed
+
+The expected output:
+
+ U-Boot SPL 2015.07 (Sep 15 2015 - 16:10:56)
+ mmc boot
+ reading system.dtb
+ spl_load_image_fat_os: error reading image system.dtb, err - -1
+ reading u-boot-dtb.img
+ reading u-boot-dtb.img
+
+
+ U-Boot 2015.07 (Sep 15 2015 - 16:10:56 +0200)
+
+ Model: Zynq MicroZED Board
+ I2C:   ready
+ DRAM:  ECC disabled 1 GiB
+ MMC:   zynq_sdhci: 0
+ Using default environment
+ ...
+
+When using an older U-Boot then 2015.07, a working ps7_init.c
+file is required to be installed into the U-Boot directory
+structure. From 2015.07, the major Zynq-based boards are
+supported without any manual intervention.
+
+Resulting system
+----------------
+A FAT32 partition should be created at the beginning of the SD Card
+and the following files should be installed:
+	/BOOT.BIN
+	/zynq-zed.dtb
+	/uImage
+	/rootfs-cpio.uboot
+	/u-boot-dtb.img
+
+
+All needed files can be taken from output/images/
+
+BOOT.BIN, uImage and u-boot-dtb.img are direct copies of the same files
+available on output/images/
+
+There is a patch attached that redefines the U-Boot's environment
+to work with Buildroot out-of-the-box.
+
+You can alter the booting procedure by creating a file uEnv.txt
+in the root of the SD card. It is a plain text file in format
+<key>=<value> one per line:
+
+kernel_image=myimage
+modeboot=myboot
+myboot=...
diff --git a/board/avnet/microzed/uboot/0001-zynq-Create-microzed-specific-U-Boot-environment.patch b/board/avnet/microzed/uboot/0001-zynq-Create-microzed-specific-U-Boot-environment.patch
new file mode 100644
index 0000000..55c1585
--- /dev/null
+++ b/board/avnet/microzed/uboot/0001-zynq-Create-microzed-specific-U-Boot-environment.patch
@@ -0,0 +1,34 @@
+This is a copy of the patch supplied for Zedboard
+
+--- a/include/configs/zynq_microzed.h	2015-07-14 19:32:21.000000000 +0200
++++ b/include/configs/zynq_microzed.h	2015-09-02 12:19:35.728503472 +0200
+@@ -22,4 +22,29 @@
+ 
+ #include <configs/zynq-common.h>
+ 
++#undef CONFIG_EXTRA_ENV_SETTINGS
++#define CONFIG_EXTRA_ENV_SETTINGS \
++	"envload=mmc info && if fatload mmc 0 0x1000 uEnv.txt;"\
++	" then echo Importing uEnv.txt; env import -t 0x1000"  \
++	" $filesize; fi;\0"                                    \
++	"bootcmd=run $modeboot\0"                              \
++	"modeboot=sdboot\0"                                    \
++	"baudrate=115200\0"                                    \
++	"bootenv=uEnv.txt\0"                                   \
++	"devicetree_image=zynq-zed.dtb\0"                      \
++	"kernel_image=uImage\0"                                \
++	"ramdisk_image=rootfs.cpio.uboot\0"                    \
++	"fpga_image=system.bit\0"                              \
++	"sdboot=echo Booting from SD...;"                      \
++	" run envload; run fpgaboot;"                          \
++	" fatload mmc 0 0x1000000 ${kernel_image}"             \
++	" && fatload mmc 0 0x2000000 ${ramdisk_image}"         \
++	" && fatload mmc 0 0x3000000 ${devicetree_image}"      \
++	" && bootm 0x1000000 0x2000000 0x3000000\0"            \
++	"fpgaboot=if fatload mmc 0 0x1000000 ${fpga_image};"   \
++	" then echo Booting FPGA from ${fpga_image};"          \
++	" fpga info 0 && fpga loadb 0 0x1000000 $filesize;"    \
++	" else echo FPGA image ${fpga_image} was not found,"   \
++	" skipping...; fi;\0"
++
+ #endif /* __CONFIG_ZYNQ_MICROZED_H */
diff --git a/configs/microzed_defconfig b/configs/microzed_defconfig
new file mode 100644
index 0000000..5a94275
--- /dev/null
+++ b/configs/microzed_defconfig
@@ -0,0 +1,26 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.8"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_8=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/Xilinx/linux-xlnx.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2015.1"
+BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-zed"
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ROOTFS_CPIO_GZIP=y
+BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="zynq_microzed"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.07"
+BR2_TARGET_UBOOT_PATCH="$(TOPDIR)/board/avnet/microzed/uboot"
+BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_ZYNQ_IMAGE=y
-- 
2.1.4
