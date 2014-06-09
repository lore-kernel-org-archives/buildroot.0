From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 12:09:20 +0200
Subject: [Buildroot] [git commit] configs: bump zedboard to 2014.1
Message-ID: <20140609100928.1D2039CF7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=51bc99a485730e563fee7571ec82f96eeb7b2139
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump zedboard defconfig to version 2014.1.  This makes it possible to use
uboot-spl instead of the xilinx specific fsbl.  However, the result is kinda
hacky due to the licensing state of ps7_init.{c,h} needed for building uboot
spl.  Directions for building a proper boot.bin using the new methodolgy is
included in the readme.txt.

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/avnet/zedboard/readme.txt |   26 ++++++++++++++------------
 configs/zedboard_defconfig      |   17 +++++------------
 2 files changed, 19 insertions(+), 24 deletions(-)

diff --git a/board/avnet/zedboard/readme.txt b/board/avnet/zedboard/readme.txt
index 6b6df36..efd076f 100644
--- a/board/avnet/zedboard/readme.txt
+++ b/board/avnet/zedboard/readme.txt
@@ -10,19 +10,21 @@ to the sdcard:
 	zynq-zed.dtb -> devicetree.dtb
 	rootfs.cpio.gz.uboot -> uramdisk.image.gz
 	uImage -> uImage
+	boot.bin -> boot.bin
 
-Uboot Support
+U-Boot SPL Support
 -------------
 
-Uboot is installed in a wrapper file called BOOT.BIN located on the root of
-the SD card.  To create the BOOT.BIN file do the following.
+Due to licensing issues, the files ps7_init.c/h are not able to be
+distributed with the U-Boot source code.  These files are required to make a
+boot.bin file.
+
+If you already have the Xilinx tools installed, the follwing sequence will
+unpack, patch and build the rfs, kernel, uboot, and uboot-spl.
+
+make zedboard_defconfig
+make uboot-patch
+cp ${XILINX}/ISE_DS/EDK/sw/lib/hwplatform_templates/zed_hw_platform/ps7_init.{c,h} \
+output/build/uboot-xilinx-v2014.1/boards/xilinx/zynq/
+make
 
-source <path/to/xilinx/settings.sh>
-cat <<EOF > boot.bif
-{
-   [bootloader]<path/to/fsbl.elf>
-   <path/to/system.bit>
-   <path/to/uboot.elf>
-}
-EOF
-bootgen -image boot.bif -o i BOOT.BIN
diff --git a/configs/zedboard_defconfig b/configs/zedboard_defconfig
index 071ff65..e0e7760 100644
--- a/configs/zedboard_defconfig
+++ b/configs/zedboard_defconfig
@@ -1,33 +1,26 @@
 BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
-
-# Lock to 3.8 headers as the kernel is based off 3.8
 BR2_KERNEL_HEADERS_VERSION=y
 BR2_DEFAULT_KERNEL_VERSION="3.8"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_8=y
-
 BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
-
-# Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/Xilinx/linux-xlnx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v14.5"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2014.1"
 BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-zed"
-
-# Root filesystem
 BR2_TARGET_ROOTFS_CPIO=y
 BR2_TARGET_ROOTFS_CPIO_GZIP=y
 BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
-
-# Bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="zynq_zed"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/Xilinx/u-boot-xlnx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v14.5"
-BR2_TARGET_UBOOT_FORMAT_ELF=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2014.1"
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="boot.bin"
