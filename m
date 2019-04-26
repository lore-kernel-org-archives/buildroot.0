From: Shyam Saini <shyam.saini@amarulasolutions.com>
Date: Fri, 26 Apr 2019 15:07:37 +0530
Subject: [Buildroot] [PATCH] board/olimex: Add support for Olimex A33
 Olinuxino board
Message-ID: <20190426093737.910-1-shyam.saini@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This initial support includes:
	u-boot v2019.04
	Linux v5.0
	Buildroot default packages

Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
---
 .gitlab-ci.yml                           |  1 +
 DEVELOPERS                               |  2 ++
 board/olimex/a33_olinuxino/boot.cmd      |  5 ++++
 board/olimex/a33_olinuxino/genimage.cfg  | 17 +++++++++++
 board/olimex/a33_olinuxino/post-build.sh |  9 ++++++
 board/olimex/a33_olinuxino/readme.txt    | 50 ++++++++++++++++++++++++++++++++
 configs/olimex_a33_olinuxino_defconfig   | 46 +++++++++++++++++++++++++++++
 7 files changed, 130 insertions(+)
 create mode 100644 board/olimex/a33_olinuxino/boot.cmd
 create mode 100644 board/olimex/a33_olinuxino/genimage.cfg
 create mode 100755 board/olimex/a33_olinuxino/post-build.sh
 create mode 100644 board/olimex/a33_olinuxino/readme.txt
 create mode 100644 configs/olimex_a33_olinuxino_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 01f2809eb8..5b842762f1 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -192,6 +192,7 @@ olimex_a13_olinuxino_defconfig: { extends: .defconfig }
 olimex_a20_olinuxino_lime2_defconfig: { extends: .defconfig }
 olimex_a20_olinuxino_lime_defconfig: { extends: .defconfig }
 olimex_a20_olinuxino_micro_defconfig: { extends: .defconfig }
+olimex_a33_olinuxino_defconfig: { extends: .defconfig }
 olimex_a64_olinuxino_defconfig: { extends: .defconfig }
 olimex_imx233_olinuxino_defconfig: { extends: .defconfig }
 openblocks_a6_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index 9ffe4639f1..e4a089e6f5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2046,6 +2046,8 @@ F:     board/friendlyarm/nanopi-m4/
 F:     configs/nanopi_m4_defconfig
 F:     board/orangepi/orangepi-rk3399/
 F:     configs/orangepi_rk3399_defconfig
+F:	board/olimex/a33_olinuxino/
+F:	configs/olimex_a33_olinuxino_defconfig
 
 N:	Simon Dawson <spdawson@gmail.com>
 F:	boot/at91bootstrap3/
diff --git a/board/olimex/a33_olinuxino/boot.cmd b/board/olimex/a33_olinuxino/boot.cmd
new file mode 100644
index 0000000000..44d9239a94
--- /dev/null
+++ b/board/olimex/a33_olinuxino/boot.cmd
@@ -0,0 +1,5 @@
+setenv bootargs console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 ${extra}
+ext4load mmc 0 0x49000000 /boot/${fdtfile}
+ext4load mmc 0 0x46000000 /boot/zImage
+env set fdt_high ffffffff
+bootz 0x46000000 - 0x49000000
diff --git a/board/olimex/a33_olinuxino/genimage.cfg b/board/olimex/a33_olinuxino/genimage.cfg
new file mode 100644
index 0000000000..fc2f7f8d76
--- /dev/null
+++ b/board/olimex/a33_olinuxino/genimage.cfg
@@ -0,0 +1,17 @@
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
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 512M
+	}
+}
diff --git a/board/olimex/a33_olinuxino/post-build.sh b/board/olimex/a33_olinuxino/post-build.sh
new file mode 100755
index 0000000000..6fc7da4898
--- /dev/null
+++ b/board/olimex/a33_olinuxino/post-build.sh
@@ -0,0 +1,9 @@
+#!/bin/sh
+
+MKIMAGE=$HOST_DIR/bin/mkimage
+
+$MKIMAGE -A arm -O linux -T script -C none \
+	 -d board/olimex/a33_olinuxino/boot.cmd \
+	 ${BINARIES_DIR}/boot.scr
+
+cp $BINARIES_DIR/boot.scr $TARGET_DIR/boot/boot.scr
diff --git a/board/olimex/a33_olinuxino/readme.txt b/board/olimex/a33_olinuxino/readme.txt
new file mode 100644
index 0000000000..30ad1dd75a
--- /dev/null
+++ b/board/olimex/a33_olinuxino/readme.txt
@@ -0,0 +1,50 @@
+A33-OLinuXino
+
+Intro
+=====
+
+This board is based on Allwinner A33 SoC.
+
+Home Page: https://www.olimex.com/Products/OLinuXino/A33/A33-OLinuXino/open-source-hardware
+Wiki: 	   https://wiki.amarulasolutions.com/bsp/sunxi/a33/Olimex-A33-Olinuxino.html
+
+How to build it
+===============
+
+Configure Buildroot:
+
+    $ make olimex_a33_olinuxino_defconfig
+
+Build everything by running:
+
+    $ make
+
+Result of the build
+-------------------
+
+After building, you should get a tree like this:
+
+output/images/
+??? boot.scr
+??? rootfs.ext2
+??? rootfs.ext4 -> rootfs.ext2
+??? rootfs.tar
+??? sdcard.img
+??? sun8i-a33-olinuxino.dtb
+??? u-boot.bin
+??? u-boot-sunxi-with-spl.bin
+??? zImage
+
+
+How to write the SD card
+========================
+
+The sdcard.img file is a complete bootable image ready to be written
+on the boot medium. To install it, simply copy the image to a uSD
+card:
+
+    # dd if=output/images/sdcard.img of=/dev/sdX
+
+Where 'sdX' is the device node of the uSD.
+
+Eject the SD card, insert it in the A33-OLinuXino board, and power it up.
diff --git a/configs/olimex_a33_olinuxino_defconfig b/configs/olimex_a33_olinuxino_defconfig
new file mode 100644
index 0000000000..1012550309
--- /dev/null
+++ b/configs/olimex_a33_olinuxino_defconfig
@@ -0,0 +1,46 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a7=y
+
+# Linux headers same as kernel, a 5.0 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
+
+# System configuration
+BR2_TARGET_GENERIC_HOSTNAME="A33-olinuxino"
+BR2_TARGET_GENERIC_ISSUE="Welcome to A33 OLinuXino!"
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# Bootloaders
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.04"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A33-OLinuXino"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_BIN=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
+BR2_LINUX_KERNEL_USE_DEFCONFIG=y
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-a33-olinuxino"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a33_olinuxino/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a33_olinuxino/genimage.cfg"
+
+# Additional tools
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.11.0
