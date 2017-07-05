From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 18:15:54 +0200
Subject: [Buildroot] [git commit] board: Add nanopi-m1 Support
Message-ID: <20170705161244.6632280797@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7de984bdbc071508b4f888e03f73f89987be0930
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add initial support for nanopi-m1 board
with below features
- U-Boot 2017.07-rc1
- Linux 4.11.5
- Default packages from buildroot

Signed-off-by: Chakra Divi <chakra@openedev.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .gitlab-ci.yml                           |  1 +
 DEVELOPERS                               |  2 ++
 board/friendlyarm/nanopi-m1/boot.cmd     |  8 ++++++
 board/friendlyarm/nanopi-m1/genimage.cfg | 36 ++++++++++++++++++++++++++
 board/friendlyarm/nanopi-m1/readme.txt   | 29 +++++++++++++++++++++
 configs/nanopi_m1_defconfig              | 43 ++++++++++++++++++++++++++++++++
 6 files changed, 119 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 583e2f7..4e494ff 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -127,6 +127,7 @@ mx53loco_defconfig: *defconfig
 mx6cubox_defconfig: *defconfig
 mx6sx_udoo_neo_defconfig: *defconfig
 mx6udoo_defconfig: *defconfig
+nanopi_m1_defconfig: *defconfig
 nanopi_neo_defconfig: *defconfig
 nexbox_a95x_defconfig: *defconfig
 nitrogen6sx_defconfig: *defconfig
diff --git a/DEVELOPERS b/DEVELOPERS
index 4faa1a8..575f960 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -344,8 +344,10 @@ F:	package/libsvg/
 F:	package/libsvg-cairo/
 
 N:	Chakra Divi <chakra@openedev.com>
+F:	board/friendlyarm/nanopi-m1
 F:	board/olimex/a13_olinuxino
 F:	board/orangepi/orangepi-plus
+F:	configs/nanopi_m1_defconfig
 F:	configs/olimex_a13_olinuxino_defconfig
 F:	configs/orangepi_plus_defconfig
 
diff --git a/board/friendlyarm/nanopi-m1/boot.cmd b/board/friendlyarm/nanopi-m1/boot.cmd
new file mode 100644
index 0000000..b4d612e
--- /dev/null
+++ b/board/friendlyarm/nanopi-m1/boot.cmd
@@ -0,0 +1,8 @@
+setenv fdt_high ffffffff
+
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+
+fatload mmc 0 $kernel_addr_r zImage
+fatload mmc 0 $fdt_addr_r sun8i-h3-nanopi-m1.dtb
+
+bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/friendlyarm/nanopi-m1/genimage.cfg b/board/friendlyarm/nanopi-m1/genimage.cfg
new file mode 100644
index 0000000..23c9c7d
--- /dev/null
+++ b/board/friendlyarm/nanopi-m1/genimage.cfg
@@ -0,0 +1,36 @@
+# Minimal SD card image for the NanoPi M1
+#
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"sun8i-h3-nanopi-m1.dtb",
+			"boot.scr"
+		}
+	}
+	size = 10M
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
+		size = 512M
+	}
+}
diff --git a/board/friendlyarm/nanopi-m1/readme.txt b/board/friendlyarm/nanopi-m1/readme.txt
new file mode 100644
index 0000000..8b10e4b
--- /dev/null
+++ b/board/friendlyarm/nanopi-m1/readme.txt
@@ -0,0 +1,29 @@
+NanoPi M1
+
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the NanoPi M1. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+How to build it
+===============
+
+Configure Buildroot:
+
+    $ make nanopi_m1_defconfig
+
+Compile everything and build the SD card image:
+
+    $ make
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
diff --git a/configs/nanopi_m1_defconfig b/configs/nanopi_m1_defconfig
new file mode 100644
index 0000000..d00a9b8
--- /dev/null
+++ b/configs/nanopi_m1_defconfig
@@ -0,0 +1,43 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_VFPV4=y
+
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+
+# System configuration
+BR2_TARGET_GENERIC_HOSTNAME="nanopi-m1"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the NanoPi M1"
+
+# Bootloaders
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07-rc1"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_m1"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.5"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-nanopi-m1"
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/friendlyarm/nanopi-m1/boot.cmd"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-m1/genimage.cfg"
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Additional tools
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
