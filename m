From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 18:44:02 +0200
Subject: [Buildroot] [git commit] configs: add defconfig for Digilent Zybo
Message-ID: <20161015164431.97C3881E86@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f8433ab04a13a052b4431f54cef98326d23bf71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This configuration allows out-of-the box Digilent Zybo
support. It uses mainline U-boot and Linux kernel.
This configuration generates a SD card image named sdcard.img.

[Peter: rename genimage.cfg, cleanup post-image script, enable VFP support,
 	use 4.6 kernel headers and add tools needed by genimage]
Signed-off-by: Sebastien Van Cauwenberghe <svancau@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/digilent/zybo/genimage.cfg  | 29 +++++++++++++++
 board/digilent/zybo/post-image.sh | 18 ++++++++++
 board/digilent/zybo/readme.txt    | 76 +++++++++++++++++++++++++++++++++++++++
 board/digilent/zybo/system.bit    |  0
 board/digilent/zybo/uEnv.txt      |  5 +++
 configs/zynq_zybo_defconfig       | 29 +++++++++++++++
 6 files changed, 157 insertions(+)

diff --git a/board/digilent/zybo/genimage.cfg b/board/digilent/zybo/genimage.cfg
new file mode 100644
index 0000000..f39186d
--- /dev/null
+++ b/board/digilent/zybo/genimage.cfg
@@ -0,0 +1,29 @@
+image boot.vfat {
+  vfat {
+    files = {
+      "BOOT.BIN",
+      "uEnv.txt",
+      "system.bit",
+      "zynq-zybo.dtb",
+      "u-boot-dtb.img",
+      "uImage"
+    }
+  }
+  size = 32M
+}
+
+image sdcard.img {
+  hdimage {
+  }
+
+  partition boot {
+    partition-type = 0xC
+    bootable = "true"
+    image = "boot.vfat"
+  }
+
+  partition rootfs {
+    partition-type = 0x83
+    image = "rootfs.ext4"
+  }
+}
diff --git a/board/digilent/zybo/post-image.sh b/board/digilent/zybo/post-image.sh
new file mode 100755
index 0000000..619cb90
--- /dev/null
+++ b/board/digilent/zybo/post-image.sh
@@ -0,0 +1,18 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+OUTPUT_DIR="${O}/images"
+
+rm -rf "${GENIMAGE_TMP}"
+
+cp board/digilent/zybo/uEnv.txt ${BINARIES_DIR}
+cp board/digilent/zybo/system.bit ${BINARIES_DIR}
+
+genimage                               \
+	--rootpath "${TARGET_DIR}"     \
+	--tmppath "${GENIMAGE_TMP}"    \
+	--inputpath "${BINARIES_DIR}"  \
+	--outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG}"
diff --git a/board/digilent/zybo/readme.txt b/board/digilent/zybo/readme.txt
new file mode 100644
index 0000000..2a60a7cc
--- /dev/null
+++ b/board/digilent/zybo/readme.txt
@@ -0,0 +1,76 @@
+Digilent Zybo
+=============
+
+This is the Buildroot board support for the Digilent Zybo. The Zybo is
+a development board based on the Xilinx Zynq-7000 based All-Programmable
+System-On-Chip.
+
+Zybo information including schematics, reference designs, and manuals are
+available from http://store.digilentinc.com/zybo-zynq-7000-arm-fpga-soc-trainer-board/ .
+
+If you want a custom FPGA bitstream to be loaded by U-Boot, copy it as
+system.bit in board/digilent/zybo/.
+
+Steps to create a working system for Zybo:
+
+1) make zynq_zybo_defconfig
+2) make
+3) write your SD Card with the sdcard.img file using dd by doing
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+4) insert the SD Card and power up your Zybo
+5) Expect serial console on the second USB serial port exposed by the board
+
+The expected output:
+
+ U-Boot SPL 2016.05 (May 20 2016 - 16:16:24)
+ mmc boot
+ Trying to boot from MMC1
+ reading system.dtb
+ spl_load_image_fat_os: error reading image system.dtb, err - -1
+ reading u-boot-dtb.img
+ reading u-boot-dtb.img
+
+
+ U-Boot 2016.05 (May 20 2016 - 16:16:24 +0200)
+
+ Model: Zynq ZYBO Development Board
+ Board: Xilinx Zynq
+ I2C:   ready
+ DRAM:  ECC disabled 512 MiB
+ MMC:   sdhci at e0100000: 0
+ SF: Detected S25FL128S_64K with page size 256 Bytes, erase size 64 KiB, total 16 MiB
+ In:    serial at e0001000
+ Out:   serial at e0001000
+ Err:   serial at e0001000
+ Model: Zynq ZYBO Development Board
+ Board: Xilinx Zynq
+ Net:   ZYNQ GEM: e000b000, phyaddr 0, interface rgmii-id
+ I2C EEPROM MAC address read failed
+
+ Warning: ethernet at e000b000 (eth0) using random MAC address - 56:64:dd:a7:6d:94
+ eth0: ethernet at e000b000
+ ...
+
+Resulting system
+----------------
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+The first partition is a FAT32 partition created at the beginning of the SD Card
+that contains the following files :
+	/BOOT.BIN
+	/zynq-zybo.dtb
+    /uEnv.txt
+    /system.bit
+	/uImage
+	/u-boot-dtb.img
+
+The second partition is an ext4 partition that contains the root filesystem.
+
+You can alter the booting procedure by modifying the uEnv.txt file
+in first partition of the SD card. It is a plain text file in format
+<key>=<value> one per line:
+
+kernel_image=myimage
+modeboot=myboot
+myboot=...
diff --git a/board/digilent/zybo/system.bit b/board/digilent/zybo/system.bit
new file mode 100644
index 0000000..e69de29
diff --git a/board/digilent/zybo/uEnv.txt b/board/digilent/zybo/uEnv.txt
new file mode 100644
index 0000000..1042538
--- /dev/null
+++ b/board/digilent/zybo/uEnv.txt
@@ -0,0 +1,5 @@
+bootargs=root=/dev/mmcblk0p2 rootwait rw rootfstype=ext4
+fpga_image=system.bit
+fpgaboot=if fatload mmc 0 0x1000000 ${fpga_image}; then echo Booting FPGA from ${fpga_image}; fpga info 0 && fpga loadb 0 0x1000000 $filesize; else echo FPGA image ${fpga_image} was not found, skipping...; fi;
+kernel_image=uImage
+sdboot=echo Booting from SD...; run fpgaboot; fatload mmc 0 0x1000000 ${kernel_image} && fatload mmc 0 0x2000000 zynq-zybo.dtb && bootm 0x1000000 - 0x2000000
diff --git a/configs/zynq_zybo_defconfig b/configs/zynq_zybo_defconfig
new file mode 100644
index 0000000..aef1ac2
--- /dev/null
+++ b/configs/zynq_zybo_defconfig
@@ -0,0 +1,29 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/digilent/zybo/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.4"
+BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
+BR2_LINUX_KERNEL_UIMAGE=y
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-zybo"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.05"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="zynq_zybo"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_ZYNQ_IMAGE=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
