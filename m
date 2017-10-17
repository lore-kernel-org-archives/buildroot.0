From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Tue, 17 Oct 2017 23:12:07 +0200
Subject: [Buildroot] [PATCH v2] board: Add Bananapi M1 support
Message-ID: <1508274727-3807-1-git-send-email-jagan@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add initial support for bananapi M1 board with below features:
- U-Boot 2017.09
- Linux 4.13
- Default packages from buildroot

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- Used latest Linux and U-boot

 .gitlab-ci.yml                          |  1 +
 DEVELOPERS                              |  2 ++
 board/bananapi/bananapi-m1/boot.cmd     |  7 +++++++
 board/bananapi/bananapi-m1/genimage.cfg | 33 +++++++++++++++++++++++++++++
 board/bananapi/bananapi-m1/readme.txt   | 34 ++++++++++++++++++++++++++++++
 configs/bananapi_m1_defconfig           | 37 +++++++++++++++++++++++++++++++++
 6 files changed, 114 insertions(+)
 create mode 100644 board/bananapi/bananapi-m1/boot.cmd
 create mode 100644 board/bananapi/bananapi-m1/genimage.cfg
 create mode 100644 board/bananapi/bananapi-m1/readme.txt
 create mode 100644 configs/bananapi_m1_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 0e69288..ebaac7a 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -88,6 +88,7 @@ atmel_sama5d4_xplained_defconfig: *defconfig
 atmel_sama5d4_xplained_dev_defconfig: *defconfig
 atmel_sama5d4_xplained_mmc_defconfig: *defconfig
 atmel_sama5d4_xplained_mmc_dev_defconfig: *defconfig
+bananapi_m1_defconfig: *defconfig
 bananapi_m2_plus_defconfig: *defconfig
 bananapro_defconfig: *defconfig
 beagleboardx15_defconfig: *defconfig
diff --git a/DEVELOPERS b/DEVELOPERS
index dd19a0a..51283f1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -726,7 +726,9 @@ N:	Ilias Apalodimas <apalos@gmail.com>
 F:	package/keepalived/
 
 N:	Jagan Teki <jagan@amarulasolutions.com>
+F:	board/bananapi/
 F:	board/engicam/
+F:	configs/bananapi_m1_defconfig
 F:	configs/engicam_imx6qdl_icore_defconfig
 F:	configs/engicam_imx6qdl_icore_qt5_defconfig
 F:	configs/engicam_imx6qdl_icore_rqs_defconfig
diff --git a/board/bananapi/bananapi-m1/boot.cmd b/board/bananapi/bananapi-m1/boot.cmd
new file mode 100644
index 0000000..fb7de1d
--- /dev/null
+++ b/board/bananapi/bananapi-m1/boot.cmd
@@ -0,0 +1,7 @@
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+
+mmc dev 0
+fatload mmc 0 $kernel_addr_r zImage
+fatload mmc 0 $fdt_addr_r sun7i-a20-bananapi.dts
+
+bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/bananapi/bananapi-m1/genimage.cfg b/board/bananapi/bananapi-m1/genimage.cfg
new file mode 100644
index 0000000..e2e1311
--- /dev/null
+++ b/board/bananapi/bananapi-m1/genimage.cfg
@@ -0,0 +1,33 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"sun7i-a20-bananapi.dtb",
+			"boot.scr"
+		}
+	}
+	size = 64M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8192
+		size = 1040384 # 1MB - 8192
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/bananapi/bananapi-m1/readme.txt b/board/bananapi/bananapi-m1/readme.txt
new file mode 100644
index 0000000..d266dfb
--- /dev/null
+++ b/board/bananapi/bananapi-m1/readme.txt
@@ -0,0 +1,34 @@
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the Bananapi M1. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+Bananapi M1 link:
+http://www.banana-pi.org/m1.html
+
+This configuration uses U-Boot mainline and kernel mainline.
+
+How to build
+============
+
+    $ make bananapi_m1_defconfig
+    $ make
+
+Note: you will need access to the internet to download the required
+sources.
+
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX bs=1M
+  $ sudo sync
+
+Insert the micro SDcard in your Bananapi M1 and power it up. The console
+is on the serial line, 115200 8N1.
diff --git a/configs/bananapi_m1_defconfig b/configs/bananapi_m1_defconfig
new file mode 100644
index 0000000..b571a73
--- /dev/null
+++ b/configs/bananapi_m1_defconfig
@@ -0,0 +1,37 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_EABIHF=y
+
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.09"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Bananapi"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_BIN=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/bananapi/bananapi-m1/boot.cmd"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.7"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-bananapi"
+
+# Filesystem
+BR2_TARGET_GENERIC_ISSUE="Welcome to Bananapi M1"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/bananapi/bananapi-m1/genimage.cfg"
-- 
1.9.1
