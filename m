From: Sebastien Van Cauwenberghe <svancau@gmail.com>
Date: Thu, 7 Jul 2016 19:51:15 +0200
Subject: [Buildroot] [PATCH] configs: add defconfig for Digilent Zybo
Message-ID: <992d1ccf-eccd-422f-8d61-820d38cc4a18@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Sebastien Van Cauwenberghe <svancau@gmail.com>
---
 board/digilent/zybo/genimage-zybo.cfg | 29 ++++++++++++
 board/digilent/zybo/post-image.sh     | 26 +++++++++++
 board/digilent/zybo/readme.txt        | 83 +++++++++++++++++++++++++++++++++++
 board/digilent/zybo/system.bit        |  0
 board/digilent/zybo/uEnv.txt          |  6 +++
 configs/zynq_zybo_defconfig           | 28 ++++++++++++
 6 files changed, 172 insertions(+)
 create mode 100644 board/digilent/zybo/genimage-zybo.cfg
 create mode 100755 board/digilent/zybo/post-image.sh
 create mode 100644 board/digilent/zybo/readme.txt
 create mode 100644 board/digilent/zybo/system.bit
 create mode 100644 board/digilent/zybo/uEnv.txt
 create mode 100644 configs/zynq_zybo_defconfig

diff --git a/board/digilent/zybo/genimage-zybo.cfg b/board/digilent/zybo/genimage-zybo.cfg
new file mode 100644
index 0000000..f39186d
--- /dev/null
+++ b/board/digilent/zybo/genimage-zybo.cfg
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
index 0000000..bba0f5a
--- /dev/null
+++ b/board/digilent/zybo/post-image.sh
@@ -0,0 +1,26 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+BOARD_NAME="$(basename ${BOARD_DIR})"
+GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOARD_NAME}.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+OUTPUT_DIR="output/images"
+
+# Mark the kernel as DT-enabled
+#mkdir -p "${BINARIES_DIR}/kernel-marked"
+#${HOST_DIR}/usr/bin/mkknlimg "${BINARIES_DIR}/zImage" \
+#	"${BINARIES_DIR}/kernel-marked/zImage"
+
+rm -rf "${GENIMAGE_TMP}"
+
+cp board/digilent/zybo/uEnv.txt ${OUTPUT_DIR}
+cp board/digilent/zybo/system.bit ${OUTPUT_DIR}
+
+genimage                           \
+	--rootpath "${TARGET_DIR}"     \
+	--tmppath "${GENIMAGE_TMP}"    \
+	--inputpath "${BINARIES_DIR}"  \
+	--outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG}"
+
+exit $?
diff --git a/board/digilent/zybo/readme.txt b/board/digilent/zybo/readme.txt
new file mode 100644
index 0000000..88697af
--- /dev/null
+++ b/board/digilent/zybo/readme.txt
@@ -0,0 +1,83 @@
+This is the buildroot board support for the Digilent Zybo. The Zybo is
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
+3) write your SD Card with the sdcard.img file using dd
+4) insert the SD Card and power up your Zybo
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
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+
+Insert the SDcard into your Zybo, and power it up. Your new system
+should come up now and starts one console on the second serial port
+exposed by the Zybo board (115200 bauds).
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
+
diff --git a/board/digilent/zybo/system.bit b/board/digilent/zybo/system.bit
new file mode 100644
index 0000000..e69de29
diff --git a/board/digilent/zybo/uEnv.txt b/board/digilent/zybo/uEnv.txt
new file mode 100644
index 0000000..63ca423
--- /dev/null
+++ b/board/digilent/zybo/uEnv.txt
@@ -0,0 +1,6 @@
+bootargs=root=/dev/mmcblk0p2 rootwait rw rootfstype=ext4
+fpga_image=system.bit
+fpgaboot=if fatload mmc 0 0x1000000 ${fpga_image}; then echo Booting FPGA from ${fpga_image}; fpga info 0 && fpga loadb 0 0x1000000 $filesize; else echo FPGA image ${fpga_image} was not found, skipping...; fi;
+kernel_image=uImage
+sdboot=echo Booting from SD...; run fpgaboot; fatload mmc 0 0x1000000 ${kernel_image} && fatload mmc 0 0x2000000 zynq-zybo.dtb && bootm 0x1000000 - 0x2000000
+
diff --git a/configs/zynq_zybo_defconfig b/configs/zynq_zybo_defconfig
new file mode 100644
index 0000000..34137c6
--- /dev/null
+++ b/configs/zynq_zybo_defconfig
@@ -0,0 +1,28 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+# BR2_COMPILER_PARANOID_UNSAFE_PATH is not set
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/digilent/zybo/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.3"
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
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.5.5
