From: Sebastien Van Cauwenberghe <svancau@gmail.com>
Date: Sun, 22 May 2016 17:43:16 +0200
Subject: [Buildroot] [PATCH] Add support for Digilent Zybo (Xilinx Zynq-7000)
Message-ID: <0cc2bfc5-9c58-902c-df87-1c3f1ceab456@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[PATCH] Add support for Digilent Zybo (Xilinx Zynq-7000)

Signed-off-by: Sebastien Van Cauwenberghe <svancau@gmail.com>
---
 board/digilent/zybo/readme.txt                     | 75 ++++++++++++++++++++++
 .../0001-Modify-U-boot-env-for-Zybo-boot.patch     | 45 +++++++++++++
 configs/zynq_zybo_defconfig                        | 25 ++++++++
 3 files changed, 145 insertions(+)
 create mode 100644 board/digilent/zybo/readme.txt
 create mode 100644 board/digilent/zybo/uboot/0001-Modify-U-boot-env-for-Zybo-boot.patch
 create mode 100644 configs/zynq_zybo_defconfig

diff --git a/board/digilent/zybo/readme.txt b/board/digilent/zybo/readme.txt
new file mode 100644
index 0000000..f9ff939
--- /dev/null
+++ b/board/digilent/zybo/readme.txt
@@ -0,0 +1,75 @@
+This is the buildroot board support for the Digilent Zybo. The Zybo is
+a development board based on the Xilinx Zynq-7000 based All-Programmable
+System-On-Chip.
+
+Zybo information including schematics, reference designs, and manuals are
+available from http://store.digilentinc.com/zybo-zynq-7000-arm-fpga-soc-trainer-board/ .
+
+Steps to create a working system for Zybo:
+
+1) make zynq_zybo_defconfig
+2) make
+3) copy files BOOT.BIN, u-boot-dtb.img, rootfs.cpio.uboot,
+	uImage, zynq-zybo.dtb into your SD card
+4) boot your Zybo
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
+A FAT32 partition should be created at the beginning of the SD Card
+and the following files should be installed:
+	/BOOT.BIN
+	/zynq-zybo.dtb
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
+
+The serial console is accessible on the host on /dev/ttyUSB1 at 115200 bauds.
+
diff --git a/board/digilent/zybo/uboot/0001-Modify-U-boot-env-for-Zybo-boot.patch b/board/digilent/zybo/uboot/0001-Modify-U-boot-env-for-Zybo-boot.patch
new file mode 100644
index 0000000..74f44cb
--- /dev/null
+++ b/board/digilent/zybo/uboot/0001-Modify-U-boot-env-for-Zybo-boot.patch
@@ -0,0 +1,45 @@
+From e5df2c908d69c51a1a6cf02225fee10920c9ca01 Mon Sep 17 00:00:00 2001
+From: Sebastien Van Cauwenberghe <svancau@gmail.com>
+Date: Sun, 22 May 2016 15:25:24 +0200
+Subject: [PATCH] Modify U-boot env for Zybo boot
+
+---
+ include/configs/zynq_zybo.h | 24 ++++++++++++++++++++++++
+ 1 file changed, 24 insertions(+)
+
+diff --git a/include/configs/zynq_zybo.h b/include/configs/zynq_zybo.h
+index 637b1c5..d488a69 100644
+--- a/include/configs/zynq_zybo.h
++++ b/include/configs/zynq_zybo.h
+@@ -28,4 +28,28 @@
+
+ #include <configs/zynq-common.h>
+
++#undef CONFIG_EXTRA_ENV_SETTINGS
++#define CONFIG_EXTRA_ENV_SETTINGS \
++   "envload=mmc info && if fatload mmc 0 0x1000 uEnv.txt;"\
++   " then echo Importing uEnv.txt; env import -t 0x1000"  \
++   " $filesize; fi;\0"                                    \
++   "bootcmd=run envload; run $modeboot\0"                 \
++   "modeboot=sdboot\0"                                    \
++   "baudrate=115200\0"                                    \
++   "bootenv=uEnv.txt\0"                                   \
++   "devicetree_image=zynq-zybo.dtb\0"                     \
++   "kernel_image=uImage\0"                                \
++   "ramdisk_image=rootfs.cpio.uboot\0"                    \
++   "fpga_image=system.bit\0"                              \
++   "sdboot=echo Booting from SD...; run fpgaboot;"        \
++   " fatload mmc 0 0x1000000 ${kernel_image}"             \
++   " && fatload mmc 0 0x2000000 ${ramdisk_image}"         \
++   " && fatload mmc 0 0x3000000 ${devicetree_image}"      \
++   " && bootm 0x1000000 0x2000000 0x3000000\0"            \
++   "fpgaboot=if fatload mmc 0 0x1000000 ${fpga_image};"   \
++   " then echo Booting FPGA from ${fpga_image};"          \
++   " fpga info 0 && fpga loadb 0 0x1000000 $filesize;"    \
++   " else echo FPGA image ${fpga_image} was not found,"   \
++   " skipping...; fi;\0"
++
+ #endif /* __CONFIG_ZYNQ_ZYBO_H */
+--
+2.5.5
+
diff --git a/configs/zynq_zybo_defconfig b/configs/zynq_zybo_defconfig
new file mode 100644
index 0000000..e2c8841
--- /dev/null
+++ b/configs/zynq_zybo_defconfig
@@ -0,0 +1,25 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+# BR2_COMPILER_PARANOID_UNSAFE_PATH is not set
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
+BR2_BINUTILS_VERSION_2_26_X=y
+BR2_GCC_VERSION_5_X=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
+BR2_LINUX_KERNEL_UIMAGE=y
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-zybo"
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ROOTFS_CPIO_GZIP=y
+BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_PATCH="$(TOPDIR)/board/digilent/zybo/uboot"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="zynq_zybo"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_ZYNQ_IMAGE=y
-- 
2.5.5
