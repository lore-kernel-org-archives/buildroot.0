From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Wed, 20 Dec 2017 10:53:39 +0100
Subject: [Buildroot] [PATCH v6 10/10] board: Add Orangepi PC2 support
In-Reply-To: <1513763619-15725-1-git-send-email-jagan@amarulasolutions.com>
References: <1513763619-15725-1-git-send-email-jagan@amarulasolutions.com>
Message-ID: <1513763619-15725-11-git-send-email-jagan@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add initial support for Orangepi PC2
board with below features:
- U-Boot 2017.11
- Linux 4.14
- Default packages from buildroot

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 .gitlab-ci.yml                           |  1 +
 DEVELOPERS                               |  2 ++
 board/orangepi/orangepi-pc2/boot.cmd     |  6 ++++
 board/orangepi/orangepi-pc2/genimage.cfg | 39 ++++++++++++++++++++++++++
 board/orangepi/orangepi-pc2/readme.txt   | 37 +++++++++++++++++++++++++
 configs/orangepi_pc2_defconfig           | 47 ++++++++++++++++++++++++++++++++
 6 files changed, 132 insertions(+)
 create mode 100644 board/orangepi/orangepi-pc2/boot.cmd
 create mode 100644 board/orangepi/orangepi-pc2/genimage.cfg
 create mode 100644 board/orangepi/orangepi-pc2/readme.txt
 create mode 100644 configs/orangepi_pc2_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d442c0c..c816979 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -166,6 +166,7 @@ olimex_imx233_olinuxino_defconfig: *defconfig
 openblocks_a6_defconfig: *defconfig
 orangepi_lite_defconfig: *defconfig
 orangepi_one_defconfig: *defconfig
+orangepi_pc2_defconfig: *defconfig
 orangepi_pc_defconfig: *defconfig
 orangepi_pc_plus_defconfig: *defconfig
 orangepi_plus_defconfig: *defconfig
diff --git a/DEVELOPERS b/DEVELOPERS
index 936f797..35cc7b0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -775,6 +775,7 @@ F:	board/engicam/
 F:	board/friendlyarm/nanopi-a64/
 F:	board/friendlyarm/nanopi-neo2/
 F:	board/olimex/a64-olinuxino/
+F:	board/orangepi/orangepi-pc2/
 F:	board/orangepi/orangepi-prime/
 F:	board/orangepi/orangepi-win/
 F:	board/orangepi/orangepi-zero-plus2/
@@ -784,6 +785,7 @@ F:	configs/bananapi_m64_defconfig
 F:	configs/friendlyarm_nanopi_a64_defconfig
 F:	configs/friendlyarm_nanopi_neo2_defconfig
 F:	configs/olimex_a64_olinuxino_defconfig
+F:	configs/orangepi_pc2_defconfig
 F:	configs/orangepi_prime_defconfig
 F:	configs/orangepi_win_defconfig
 F:	configs/orangepi_zero_plus2_defconfig
diff --git a/board/orangepi/orangepi-pc2/boot.cmd b/board/orangepi/orangepi-pc2/boot.cmd
new file mode 100644
index 0000000..4d4fc7b
--- /dev/null
+++ b/board/orangepi/orangepi-pc2/boot.cmd
@@ -0,0 +1,6 @@
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+
+fatload mmc 0 $kernel_addr_r Image
+fatload mmc 0 $fdt_addr_r sun50i-h5-orangepi-pc2.dtb
+
+booti $kernel_addr_r - $fdt_addr_r
diff --git a/board/orangepi/orangepi-pc2/genimage.cfg b/board/orangepi/orangepi-pc2/genimage.cfg
new file mode 100644
index 0000000..e10c67f
--- /dev/null
+++ b/board/orangepi/orangepi-pc2/genimage.cfg
@@ -0,0 +1,39 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"Image",
+			"sun50i-h5-orangepi-pc2.dtb",
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
+		size = 1M # 1MB - 40K
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
diff --git a/board/orangepi/orangepi-pc2/readme.txt b/board/orangepi/orangepi-pc2/readme.txt
new file mode 100644
index 0000000..1200481
--- /dev/null
+++ b/board/orangepi/orangepi-pc2/readme.txt
@@ -0,0 +1,37 @@
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the Orangepi PC2. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+Orangepi PC2 link:
+http://www.orangepi.org/orangepipc2/
+
+Wiki link:
+https://openedev.amarulasolutions.com/display/ODWIKI/Orangepi+PC2
+
+This configuration uses U-Boot mainline and kernel mainline.
+
+How to build
+============
+
+    $ make orangepi_pc2_defconfig
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
+Insert the micro SDcard in your Orangepi PC2 and power it up. The console
+is on the serial line, 115200 8N1.
diff --git a/configs/orangepi_pc2_defconfig b/configs/orangepi_pc2_defconfig
new file mode 100644
index 0000000..83be936
--- /dev/null
+++ b/configs/orangepi_pc2_defconfig
@@ -0,0 +1,47 @@
+BR2_aarch64=y
+BR2_cortex_a53=y
+BR2_ARM_FPU_VFPV4=y
+
+# Linux headers same as kernel, a 4.14 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
+
+# Firmware
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/apritzel/arm-trusted-firmware.git"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50iw1p1"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="aa75c8da415158a94b82a430b2b40000778e851f"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_pc2"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-pc2/boot.cmd"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-orangepi-pc2"
+
+# Filesystem
+BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi PC2"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-pc2/genimage.cfg"
-- 
1.9.1
