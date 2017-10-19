From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Thu, 19 Oct 2017 11:45:25 +0200
Subject: [Buildroot] [PATCH v3 03/11] board: Add Bananapi M64 support
In-Reply-To: <1508406333-27138-1-git-send-email-jagan@amarulasolutions.com>
References: <1508406333-27138-1-git-send-email-jagan@amarulasolutions.com>
Message-ID: <1508406333-27138-4-git-send-email-jagan@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add initial support for bananapi M64 board with below features:
- U-Boot 2017.09
- Linux 4.13.7
- Default packages from buildroot

Cc: Jason <manager@sinovoip.com.cn>
Cc: hailymei at banana-pi.com <hailymei@banana-pi.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 .gitlab-ci.yml                           |  1 +
 DEVELOPERS                               |  1 +
 board/bananapi/bananapi-m64/boot.cmd     |  6 ++++
 board/bananapi/bananapi-m64/genimage.cfg | 38 ++++++++++++++++++++++++++
 board/bananapi/bananapi-m64/readme.txt   | 37 +++++++++++++++++++++++++
 configs/bananapi_m64_defconfig           | 47 ++++++++++++++++++++++++++++++++
 6 files changed, 130 insertions(+)
 create mode 100644 board/bananapi/bananapi-m64/boot.cmd
 create mode 100644 board/bananapi/bananapi-m64/genimage.cfg
 create mode 100644 board/bananapi/bananapi-m64/readme.txt
 create mode 100644 configs/bananapi_m64_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ebaac7a..3dd4f48 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -90,6 +90,7 @@ atmel_sama5d4_xplained_mmc_defconfig: *defconfig
 atmel_sama5d4_xplained_mmc_dev_defconfig: *defconfig
 bananapi_m1_defconfig: *defconfig
 bananapi_m2_plus_defconfig: *defconfig
+bananapi_m64_defconfig: *defconfig
 bananapro_defconfig: *defconfig
 beagleboardx15_defconfig: *defconfig
 beaglebone_defconfig: *defconfig
diff --git a/DEVELOPERS b/DEVELOPERS
index 51283f1..6521aad 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -729,6 +729,7 @@ N:	Jagan Teki <jagan@amarulasolutions.com>
 F:	board/bananapi/
 F:	board/engicam/
 F:	configs/bananapi_m1_defconfig
+F:	configs/bananapi_m64_defconfig
 F:	configs/engicam_imx6qdl_icore_defconfig
 F:	configs/engicam_imx6qdl_icore_qt5_defconfig
 F:	configs/engicam_imx6qdl_icore_rqs_defconfig
diff --git a/board/bananapi/bananapi-m64/boot.cmd b/board/bananapi/bananapi-m64/boot.cmd
new file mode 100644
index 0000000..d35c9b0
--- /dev/null
+++ b/board/bananapi/bananapi-m64/boot.cmd
@@ -0,0 +1,6 @@
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+
+fatload mmc 0 $kernel_addr_r Image
+fatload mmc 0 $fdt_addr_r sun50i-a64-bananapi-m64.dtb
+
+booti $kernel_addr_r - $fdt_addr_r
diff --git a/board/bananapi/bananapi-m64/genimage.cfg b/board/bananapi/bananapi-m64/genimage.cfg
new file mode 100644
index 0000000..891217c
--- /dev/null
+++ b/board/bananapi/bananapi-m64/genimage.cfg
@@ -0,0 +1,38 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"Image",
+			"sun50i-a64-bananapi-m64.dtb",
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
+	partition spl {
+		in-partition-table = "no"
+		image = "sunxi-spl.bin"
+		offset = 8192
+	}
+
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot.itb"
+		offset = 40K
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
diff --git a/board/bananapi/bananapi-m64/readme.txt b/board/bananapi/bananapi-m64/readme.txt
new file mode 100644
index 0000000..0dec3e5
--- /dev/null
+++ b/board/bananapi/bananapi-m64/readme.txt
@@ -0,0 +1,37 @@
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the Bananapi M64. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+Bananapi M64 link:
+http://www.banana-pi.org/m64.html
+
+Wiki link:
+https://openedev.amarulasolutions.com/display/ODWIKI/Bananapi+M64
+
+This configuration uses U-Boot mainline and kernel mainline.
+
+How to build
+============
+
+    $ make bananapi_m64_defconfig
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
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+  $ sudo sync
+
+Insert the micro SDcard in your Bananapi M64 and power it up. The console
+is on the serial line, 115200 8N1.
diff --git a/configs/bananapi_m64_defconfig b/configs/bananapi_m64_defconfig
new file mode 100644
index 0000000..68651b5
--- /dev/null
+++ b/configs/bananapi_m64_defconfig
@@ -0,0 +1,47 @@
+BR2_aarch64=y
+BR2_cortex_a53=y
+BR2_ARM_FPU_VFPV4=y
+
+# Linux headers same as kernel, a 4.13 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
+
+# Firmware
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/apritzel/arm-trusted-firmware.git"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50iw1p1"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="aa75c8da415158a94b82a430b2b40000778e851f"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="bl31"
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.09"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="bananapi_m64"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/bananapi/bananapi-m64/boot.cmd"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.7"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-a64-bananapi-m64"
+
+# Filesystem
+BR2_TARGET_GENERIC_ISSUE="Welcome to Bananapi M64"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/bananapi/bananapi-m64/genimage.cfg"
+BR2_ROOTFS_POST_BUILD_SCRIPT="support/scripts/sunxi64-post-build.sh"
-- 
1.9.1
