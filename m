From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Sat, 17 Jun 2017 17:45:55 +0530
Subject: [Buildroot] [PATCH 1/3] Board: Add Bananapi M64 support
Message-ID: <1497701756-1404-1-git-send-email-jteki@openedev.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jagan Teki <jagan@amarulasolutions.com>

Add initial support for bananapi M64 board with below features:
- U-Boot 2017.07-rc1
- Linux 4.11.5
- Default packages from buildroot

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 DEVELOPERS                               |  2 ++
 board/bananapi/bananapi-m64/boot.cmd     |  6 +++++
 board/bananapi/bananapi-m64/genimage.cfg | 38 +++++++++++++++++++++++++++
 board/bananapi/bananapi-m64/readme.txt   | 34 ++++++++++++++++++++++++
 board/bananapi/post-build.sh             | 10 +++++++
 configs/bananapi_m64_defconfig           | 45 ++++++++++++++++++++++++++++++++
 6 files changed, 135 insertions(+)
 create mode 100644 board/bananapi/bananapi-m64/boot.cmd
 create mode 100644 board/bananapi/bananapi-m64/genimage.cfg
 create mode 100644 board/bananapi/bananapi-m64/readme.txt
 create mode 100755 board/bananapi/post-build.sh
 create mode 100644 configs/bananapi_m64_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index b4ffb6f..341933f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -828,7 +828,9 @@ N:	Ilias Apalodimas <apalos@gmail.com>
 F:	package/keepalived/
 
 N:	Jagan Teki <jagan@amarulasolutions.com>
+F:	board/bananapi/
 F:	board/engicam/
+F:	configs/bananapi_m64_defconfig
 F:	configs/engicam_imx6qdl_icore_mmc_defconfig
 F:	configs/engicam_imx6qdl_icore_rqs_mmc_defconfig
 F:	configs/engicam_imx6ul_geam_mmc_defconfig
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
index 0000000..389ffbe
--- /dev/null
+++ b/board/bananapi/bananapi-m64/readme.txt
@@ -0,0 +1,34 @@
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
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX bs=1M
+  $ sudo sync
+
+Insert the micro SDcard in your Bananapi M64 and power it up. The console
+is on the serial line, 115200 8N1.
diff --git a/board/bananapi/post-build.sh b/board/bananapi/post-build.sh
new file mode 100755
index 0000000..d22bc3d
--- /dev/null
+++ b/board/bananapi/post-build.sh
@@ -0,0 +1,10 @@
+#!/bin/sh
+# args from BR2_ROOTFS_POST_SCRIPT_ARGS
+# $4 path of boot.cmd
+
+MKIMAGE=${HOST_DIR}/usr/bin/mkimage
+BOOT_CMD="${4}"
+BOOT_CMD_H="${BINARIES_DIR}/boot.scr"
+
+# U-Boot script
+"${MKIMAGE}" -C none -A arm -T script -d "${BOOT_CMD}" "${BOOT_CMD_H}"
diff --git a/configs/bananapi_m64_defconfig b/configs/bananapi_m64_defconfig
new file mode 100644
index 0000000..c1e876e
--- /dev/null
+++ b/configs/bananapi_m64_defconfig
@@ -0,0 +1,45 @@
+BR2_aarch64=y
+BR2_cortex_a53=y
+BR2_ARM_FPU_VFPV4=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+
+# Firmware
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/apritzel/arm-trusted-firmware.git"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50iw1p1"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="allwinner"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="bl31"
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07-rc1"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="bananapi_m64"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.5"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-a64-bananapi-m64"
+
+# Filesystem
+BR2_TARGET_GENERIC_ISSUE="Welcome to Bananapi M64"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/bananapi/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/bananapi/bananapi-m64/genimage.cfg board/bananapi/bananapi-m64/boot.cmd"
-- 
2.7.4
