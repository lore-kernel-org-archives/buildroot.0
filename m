From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Dec 2017 18:52:28 +0100
Subject: [Buildroot] [git commit] board: Add Olimex A64-OLinuXino support
Message-ID: <20171220175918.7298A835B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d644b145ef1a1c758a54af6546e83e3d57574708
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add initial support for Olimex A64-OLinuXino
board with below features:
- U-Boot 2017.11
- Linux 4.14
- Default packages from buildroot

Cc: Tsvetan Usunov <usunov@olimex.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .gitlab-ci.yml                          |  1 +
 DEVELOPERS                              |  2 ++
 board/olimex/a64-olinuxino/boot.cmd     |  6 +++++
 board/olimex/a64-olinuxino/genimage.cfg | 39 +++++++++++++++++++++++++++
 board/olimex/a64-olinuxino/readme.txt   | 37 ++++++++++++++++++++++++++
 configs/olimex_a64_olinuxino_defconfig  | 47 +++++++++++++++++++++++++++++++++
 6 files changed, 132 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 5c9653b..4e82a19 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -161,6 +161,7 @@ olimex_a20_olinuxino_lime2_defconfig: *defconfig
 olimex_a20_olinuxino_lime_defconfig: *defconfig
 olimex_a20_olinuxino_lime_mali_defconfig: *defconfig
 olimex_a20_olinuxino_micro_defconfig: *defconfig
+olimex_a64_olinuxino_defconfig: *defconfig
 olimex_imx233_olinuxino_defconfig: *defconfig
 openblocks_a6_defconfig: *defconfig
 orangepi_lite_defconfig: *defconfig
diff --git a/DEVELOPERS b/DEVELOPERS
index b332976..54cb3aa 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -774,11 +774,13 @@ F:	board/bananapi/
 F:	board/engicam/
 F:	board/friendlyarm/nanopi-a64/
 F:	board/friendlyarm/nanopi-neo2/
+F:	board/olimex/a64-olinuxino/
 F:	board/pine64/
 F:	configs/bananapi_m1_defconfig
 F:	configs/bananapi_m64_defconfig
 F:	configs/friendlyarm_nanopi_a64_defconfig
 F:	configs/friendlyarm_nanopi_neo2_defconfig
+F:	configs/olimex_a64_olinuxino_defconfig
 F:	configs/pine64_defconfig
 F:	configs/pine64_sopine_defconfig
 F:	configs/engicam_imx6qdl_icore_defconfig
diff --git a/board/olimex/a64-olinuxino/boot.cmd b/board/olimex/a64-olinuxino/boot.cmd
new file mode 100644
index 0000000..28ed6d9
--- /dev/null
+++ b/board/olimex/a64-olinuxino/boot.cmd
@@ -0,0 +1,6 @@
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+
+fatload mmc 0 $kernel_addr_r Image
+fatload mmc 0 $fdt_addr_r sun50i-a64-olinuxino.dtb
+
+booti $kernel_addr_r - $fdt_addr_r
diff --git a/board/olimex/a64-olinuxino/genimage.cfg b/board/olimex/a64-olinuxino/genimage.cfg
new file mode 100644
index 0000000..328b68b
--- /dev/null
+++ b/board/olimex/a64-olinuxino/genimage.cfg
@@ -0,0 +1,39 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"Image",
+			"sun50i-a64-olinuxino.dtb",
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
diff --git a/board/olimex/a64-olinuxino/readme.txt b/board/olimex/a64-olinuxino/readme.txt
new file mode 100644
index 0000000..342bdc7
--- /dev/null
+++ b/board/olimex/a64-olinuxino/readme.txt
@@ -0,0 +1,37 @@
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the A64-OLinuXino. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+A64-OLinuXino link:
+https://www.olimex.com/Products/OLinuXino/A64/
+
+Wiki link:
+https://openedev.amarulasolutions.com/display/ODWIKI/Olimex+A64-Olinuxino
+
+This configuration uses U-Boot mainline and kernel mainline.
+
+How to build
+============
+
+    $ make olimex_a64_olinuxino_defconfig
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
+Insert the micro SDcard in your A64-OLinuXino and power it up. The console
+is on the serial line, 115200 8N1.
diff --git a/configs/olimex_a64_olinuxino_defconfig b/configs/olimex_a64_olinuxino_defconfig
new file mode 100644
index 0000000..b12229f
--- /dev/null
+++ b/configs/olimex_a64_olinuxino_defconfig
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
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="a64-olinuxino"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/olimex/a64-olinuxino/boot.cmd"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-a64-olinuxino"
+
+# Filesystem
+BR2_TARGET_GENERIC_ISSUE="Welcome to Olimex A64-OLinuXino"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a64-olinuxino/genimage.cfg"
