From: Chakra Divi <2chakrass@gmail.com>
Date: Thu,  6 Jul 2017 23:34:58 +0530
Subject: [Buildroot] [PATCH] board: add support for nanopi-m1-plus
Message-ID: <1499364298-8433-1-git-send-email-chakra@openedev.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add initial support for nanopi-m1-plus board
with below features
- U-Boot 2017.07-rc3
- Linux 4.11.5
- linux patches to add nanopi-m1-plus dts
- Default packages from buildroot

Signed-off-by: Chakra Divi <chakra@openedev.com>
---
 .gitlab-ci.yml                                     |   29 +-----
 DEVELOPERS                                         |    2 +
 board/friendlyarm/nanopi-m1-plus/boot.cmd          |    8 ++
 board/friendlyarm/nanopi-m1-plus/genimage.cfg      |   35 +++++++
 ...ts-nanopi-m1-plus-add-dts-to-linux-4.11.5.patch |  101 ++++++++++++++++++++
 board/friendlyarm/nanopi-m1-plus/readme.txt        |   29 ++++++
 configs/nanopi_m1_plus_defconfig                   |   44 +++++++++
 7 files changed, 220 insertions(+), 28 deletions(-)
 create mode 100644 board/friendlyarm/nanopi-m1-plus/boot.cmd
 create mode 100644 board/friendlyarm/nanopi-m1-plus/genimage.cfg
 create mode 100644 board/friendlyarm/nanopi-m1-plus/patches/linux-0001-ARM-dts-nanopi-m1-plus-add-dts-to-linux-4.11.5.patch
 create mode 100644 board/friendlyarm/nanopi-m1-plus/readme.txt
 create mode 100644 configs/nanopi_m1_plus_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 4e494ff..451b317 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -128,6 +128,7 @@ mx6cubox_defconfig: *defconfig
 mx6sx_udoo_neo_defconfig: *defconfig
 mx6udoo_defconfig: *defconfig
 nanopi_m1_defconfig: *defconfig
+nanopi_m1_plus_defconfig: *defconfig
 nanopi_neo_defconfig: *defconfig
 nexbox_a95x_defconfig: *defconfig
 nitrogen6sx_defconfig: *defconfig
diff --git a/DEVELOPERS b/DEVELOPERS
index c409f28..160024f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -348,9 +348,11 @@ F:	package/libsvg-cairo/
 
 N:	Chakra Divi <chakra@openedev.com>
 F:	board/friendlyarm/nanopi-m1
+F:	board/friendlyarm/nanopi-m1-plus
 F:	board/olimex/a13_olinuxino
 F:	board/orangepi/orangepi-plus
 F:	configs/nanopi_m1_defconfig
+F:	configs/nanopi_m1_plus_defconfig
 F:	configs/olimex_a13_olinuxino_defconfig
 F:	configs/orangepi_plus_defconfig
 
diff --git a/board/friendlyarm/nanopi-m1-plus/boot.cmd b/board/friendlyarm/nanopi-m1-plus/boot.cmd
new file mode 100644
index 0000000..35a1d65
--- /dev/null
+++ b/board/friendlyarm/nanopi-m1-plus/boot.cmd
@@ -0,0 +1,8 @@
+setenv fdt_high ffffffff
+
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+
+fatload mmc 0 $kernel_addr_r zImage
+fatload mmc 0 $fdt_addr_r sun8i-h3-nanopi-m1-plus.dtb
+
+bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/friendlyarm/nanopi-m1-plus/genimage.cfg b/board/friendlyarm/nanopi-m1-plus/genimage.cfg
new file mode 100644
index 0000000..7c407ed
--- /dev/null
+++ b/board/friendlyarm/nanopi-m1-plus/genimage.cfg
@@ -0,0 +1,35 @@
+# Minimal SD card image for the NanoPi M1
+#
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"sun8i-h3-nanopi-m1-plus.dtb",
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
diff --git a/board/friendlyarm/nanopi-m1-plus/patches/linux-0001-ARM-dts-nanopi-m1-plus-add-dts-to-linux-4.11.5.patch b/board/friendlyarm/nanopi-m1-plus/patches/linux-0001-ARM-dts-nanopi-m1-plus-add-dts-to-linux-4.11.5.patch
new file mode 100644
index 0000000..e41c549
--- /dev/null
+++ b/board/friendlyarm/nanopi-m1-plus/patches/linux-0001-ARM-dts-nanopi-m1-plus-add-dts-to-linux-4.11.5.patch
@@ -0,0 +1,101 @@
+From a2906d34dccec1c097aa3ef8d3082c0bf394ecc0 Mon Sep 17 00:00:00 2001
+From: Chakra Divi <chakra@openedev.com>
+Date: Thu, 6 Jul 2017 18:22:35 +0530
+Subject: [PATCH] ARM: dts: nanopi-m1-plus : add dts to linux 4.11.5
+
+This patch is used to add nanopi-m1-plus dts
+file in linux source code helps to add nanopi-m1-plus
+board support in buildroot
+
+Signed-off-by: Chakra Divi <chakra@openedev.com>
+---
+ arch/arm/boot/dts/Makefile                    |    1 +
+ arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts |   64 +++++++++++++++++++++++++
+ 2 files changed, 65 insertions(+)
+ create mode 100644 arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts
+
+diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
+index 0118084..928e5d3 100644
+--- a/arch/arm/boot/dts/Makefile
++++ b/arch/arm/boot/dts/Makefile
+@@ -867,6 +867,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
+ 	sun8i-h3-bananapi-m2-plus.dtb \
+ 	sun8i-h3-beelink-x2.dtb \
+ 	sun8i-h3-nanopi-m1.dtb	\
++	sun8i-h3-nanopi-m1-plus.dtb \
+ 	sun8i-h3-nanopi-neo.dtb \
+ 	sun8i-h3-orangepi-2.dtb \
+ 	sun8i-h3-orangepi-lite.dtb \
+diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts b/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts
+new file mode 100644
+index 0000000..8ddd1b2
+--- /dev/null
++++ b/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts
+@@ -0,0 +1,64 @@
++/*
++ * Copyright (C) 2017 Jagan Teki <jteki@openedev.com>
++ *
++ * This file is dual-licensed: you can use it either under the terms
++ * of the GPL or the X11 license, at your option. Note that this dual
++ * licensing only applies to this file, and not this project as a
++ * whole.
++ *
++ *  a) This file is free software; you can redistribute it and/or
++ *     modify it under the terms of the GNU General Public License as
++ *     published by the Free Software Foundation; either version 2 of the
++ *     License, or (at your option) any later version.
++ *
++ *     This file is distributed in the hope that it will be useful,
++ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
++ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ *     GNU General Public License for more details.
++ *
++ * Or, alternatively,
++ *
++ *  b) Permission is hereby granted, free of charge, to any person
++ *     obtaining a copy of this software and associated documentation
++ *     files (the "Software"), to deal in the Software without
++ *     restriction, including without limitation the rights to use,
++ *     copy, modify, merge, publish, distribute, sublicense, and/or
++ *     sell copies of the Software, and to permit persons to whom the
++ *     Software is furnished to do so, subject to the following
++ *     conditions:
++ *
++ *     The above copyright notice and this permission notice shall be
++ *     included in all copies or substantial portions of the Software.
++ *
++ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
++ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
++ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
++ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
++ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
++ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
++ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
++ *     OTHER DEALINGS IN THE SOFTWARE.
++ */
++
++#include "sun8i-h3-nanopi.dtsi"
++
++/ {
++	model = "FriendlyArm NanoPi M1 Plus";
++	compatible = "friendlyarm,nanopi-m1-plus", "allwinner,sun8i-h3";
++};
++
++&ehci1 {
++	status = "okay";
++};
++
++&ehci2 {
++	status = "okay";
++};
++
++&ohci1 {
++	status = "okay";
++};
++
++&ohci2 {
++	status = "okay";
++};
+-- 
+1.7.9.5
+
diff --git a/board/friendlyarm/nanopi-m1-plus/readme.txt b/board/friendlyarm/nanopi-m1-plus/readme.txt
new file mode 100644
index 0000000..3e16c8a
--- /dev/null
+++ b/board/friendlyarm/nanopi-m1-plus/readme.txt
@@ -0,0 +1,29 @@
+NanoPi M1 Plus
+
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the NanoPi M1 Plus. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+How to build it
+===============
+
+Configure Buildroot:
+
+    $ make nanopi_m1_plus_defconfig
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
diff --git a/configs/nanopi_m1_plus_defconfig b/configs/nanopi_m1_plus_defconfig
new file mode 100644
index 0000000..5c05eaa
--- /dev/null
+++ b/configs/nanopi_m1_plus_defconfig
@@ -0,0 +1,44 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_VFPV4=y
+
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+
+# System configuration
+BR2_TARGET_GENERIC_HOSTNAME="nanopi-m1-plus"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the NanoPi M1 Plus"
+
+# Bootloaders
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07-rc3"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_m1_plus"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.5"
+BR2_LINUX_KERNEL_PATCH="board/friendlyarm/nanopi-m1-plus/patches/linux-*.patch"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-nanopi-m1-plus"
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/friendlyarm/nanopi-m1-plus/boot.cmd"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-m1-plus/genimage.cfg"
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Additional tools
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
1.7.9.5
