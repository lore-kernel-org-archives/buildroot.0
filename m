From: Chakra Divi <2chakrass@gmail.com>
Date: Sat,  1 Jul 2017 06:47:20 +0530
Subject: [Buildroot] [PATCH v2] board: add orangepi-plus support
Message-ID: <1498871840-2244-1-git-send-email-chakra@openedev.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add initial support for orangepi-plus board
with below features
- U-Boot 2017.05
- Linux 4.11.5
- Default packages from buildroot

Signed-off-by: Chakra Divi <chakra@openedev.com>
---
Changes for v2:
- Modified defconfig to use BR2_TARGET_UBOOT_BOOT_SCRIPT
- Deleted post-build.sh

 .gitlab-ci.yml                            |    1 +
 DEVELOPERS                                |    2 ++
 board/orangepi/orangepi-plus/boot.cmd     |    8 ++++++
 board/orangepi/orangepi-plus/genimage.cfg |   35 +++++++++++++++++++++++
 board/orangepi/orangepi-plus/readme.txt   |   29 +++++++++++++++++++
 configs/orangepi_plus_defconfig           |   43 +++++++++++++++++++++++++++++
 6 files changed, 118 insertions(+)
 create mode 100644 board/orangepi/orangepi-plus/boot.cmd
 create mode 100644 board/orangepi/orangepi-plus/genimage.cfg
 create mode 100644 board/orangepi/orangepi-plus/readme.txt
 create mode 100644 configs/orangepi_plus_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 1f2410e..9307035 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -139,6 +139,7 @@ olimex_imx233_olinuxino_defconfig: *defconfig
 openblocks_a6_defconfig: *defconfig
 orangepi_one_defconfig: *defconfig
 orangepi_pc_defconfig: *defconfig
+orangepi_plus_defconfig: *defconfig
 orangepi_zero_defconfig: *defconfig
 pandaboard_defconfig: *defconfig
 pc_x86_64_bios_defconfig: *defconfig
diff --git a/DEVELOPERS b/DEVELOPERS
index 9e421f4..a03903e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -340,7 +340,9 @@ F:	package/libsvg-cairo/
 
 N:	Chakra Divi <chakra@openedev.com>
 F:	board/olimex/a13_olinuxino
+F:	board/orangepi/orangepi-plus
 F:	configs/olimex_a13_olinuxino_defconfig
+F:	configs/orangepi_plus_defconfig
 
 N:	Chris Packham <judge.packham@gmail.com>
 F:	package/eventlog/
diff --git a/board/orangepi/orangepi-plus/boot.cmd b/board/orangepi/orangepi-plus/boot.cmd
new file mode 100644
index 0000000..1a378cb
--- /dev/null
+++ b/board/orangepi/orangepi-plus/boot.cmd
@@ -0,0 +1,8 @@
+setenv fdt_high ffffffff
+
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+
+fatload mmc 0 $kernel_addr_r zImage
+fatload mmc 0 $fdt_addr_r sun8i-h3-orangepi-plus.dtb
+
+bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/orangepi/orangepi-plus/genimage.cfg b/board/orangepi/orangepi-plus/genimage.cfg
new file mode 100644
index 0000000..391678b
--- /dev/null
+++ b/board/orangepi/orangepi-plus/genimage.cfg
@@ -0,0 +1,35 @@
+# Minimal SD card image for the OrangePi Plus\Plus2
+#
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"sun8i-h3-orangepi-plus.dtb",
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
+	}
+}
diff --git a/board/orangepi/orangepi-plus/readme.txt b/board/orangepi/orangepi-plus/readme.txt
new file mode 100644
index 0000000..fc3f293
--- /dev/null
+++ b/board/orangepi/orangepi-plus/readme.txt
@@ -0,0 +1,29 @@
+OrangePi Plus/Plus2
+
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the OrangePi Plus/Plus2. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+How to build it
+===============
+
+Configure Buildroot:
+
+    $ make orangepi_plus_defconfig 
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
diff --git a/configs/orangepi_plus_defconfig b/configs/orangepi_plus_defconfig
new file mode 100644
index 0000000..44db1cc
--- /dev/null
+++ b/configs/orangepi_plus_defconfig
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
+BR2_TARGET_GENERIC_HOSTNAME="OrangePi_Plus"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi Plus"
+
+# Bootloaders
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.05"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_plus"
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
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-plus"
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-plus/boot.cmd"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-plus/genimage.cfg"
+
+# Additional tools
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
1.7.9.5
