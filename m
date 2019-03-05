From: Michel Stempin <michel.stempin@wanadoo.fr>
Date: Tue,  5 Mar 2019 23:37:06 +0100
Subject: [Buildroot] [PATCH v2 1/1] Add LicheePi Zero support
In-Reply-To: <866e1f31-97ad-0df3-42e7-521a4a2ad60e@wanadoo.fr>
References: <866e1f31-97ad-0df3-42e7-521a4a2ad60e@wanadoo.fr>
Message-ID: <1551825426-8743-1-git-send-email-michel.stempin@wanadoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michel Stempin <michel.stempin@wanadoo.fr>
---
Changes v1 -> v2: (suggested by Thomas)
 - use git send-email
 - use BR2_TARGET_UBOOT_BOOT_SCRIPT
 - remove fstab tweaking
 - use support/scripts/genimage.sh
 - use the internal toolchain in the defconfig
 - use a commit for building the kernel and u-boot
 - remove package resize2fs in defconfig
 - remove DTC host package use BR2_TARGET_UBOOT_NEEDS_DTC
 - remove BR2_PACKAGE_HOST_UBOOT_TOOLS

 board/licheepi/boot.cmd         |  4 +++
 board/licheepi/genimage.cfg     | 35 +++++++++++++++++++
 board/licheepi/readme.txt       | 66 ++++++++++++++++++++++++++++++++++++
 configs/licheepi_zero_defconfig | 74 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 179 insertions(+)
 create mode 100644 board/licheepi/boot.cmd
 create mode 100644 board/licheepi/genimage.cfg
 create mode 100644 board/licheepi/readme.txt
 create mode 100644 configs/licheepi_zero_defconfig

diff --git a/board/licheepi/boot.cmd b/board/licheepi/boot.cmd
new file mode 100644
index 0000000..383b347
--- /dev/null
+++ b/board/licheepi/boot.cmd
@@ -0,0 +1,4 @@
+setenv bootargs console=ttyS0,115200 panic=5 console=tty0 rootwait root=/dev/mmcblk0p2 earlyprintk rw
+load mmc 0:1 0x41000000 zImage
+load mmc 0:1 0x41800000 sun8i-v3s-licheepi-zero-dock.dtb
+bootz 0x41000000 - 0x41800000
diff --git a/board/licheepi/genimage.cfg b/board/licheepi/genimage.cfg
new file mode 100644
index 0000000..0d8540f
--- /dev/null
+++ b/board/licheepi/genimage.cfg
@@ -0,0 +1,35 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"sun8i-v3s-licheepi-zero-dock.dtb",
+			"sun8i-v3s-licheepi-zero.dtb",
+			"boot.scr"
+		}
+	}
+	size = 8M
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
+		size = 516096 # 512KB - 8192
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
+		size = 0
+	}
+}
diff --git a/board/licheepi/readme.txt b/board/licheepi/readme.txt
new file mode 100644
index 0000000..3f39bd0
--- /dev/null
+++ b/board/licheepi/readme.txt
@@ -0,0 +1,66 @@
+# LicheePi Zero
+
+Intro
+=====
+
+This directory contains a buildroot configuration for building a
+LicheePi Zero.
+
+How to build it
+===============
+
+Configure Buildroot
+-------------------
+
+There is only one LicheePi Zero defconfig files in Buildroot:
+
+  $ make licheepi_zero_defconfig
+
+Build the rootfs
+----------------
+
+Note: you will need to have access to the network, since Buildroot
+will download the packages' sources.
+
+You may now build your rootfs with:
+
+  $ make
+
+(This may take a while, consider getting yourself a coffee ;-) )
+
+Result of the build
+-------------------
+
+After building, you should obtain this tree:
+
+    output/images/
+    +-- boot.scr
+    +-- boot.vfat
+    +-- rootfs.ext2
+    +-- rootfs.ext4 -> rootfs.ext2
+    +-- rootfs.tar
+    +-- sdcard.img
+    +-- sun8i-v3s-licheepi-zero-dock.dtb
+    +-- sun8i-v3s-licheepi-zero.dtb
+    +-- u-boot.bin
+    +-- u-boot-sunxi-with-spl.bin
+    `-- zImage
+
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image called
+"sdcard.img" in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+
+Alternatively, you can use the Etcher graphical tool to burn the image
+to the SD card safely and on any platform:
+
+https://etcher.io/
+
+Once the SD card is burned, insert it into your LicheePi Zero board,
+and power it up. Your new system should come up now and start a
+console on the UART0 serial port.
diff --git a/configs/licheepi_zero_defconfig b/configs/licheepi_zero_defconfig
new file mode 100644
index 0000000..6b1dc5a
--- /dev/null
+++ b/configs/licheepi_zero_defconfig
@@ -0,0 +1,74 @@
+# Target options
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_VFPV4=y
+
+# Toolchain
+# Use 4.14.x headers and C++ support
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
+# System configuration
+BR2_TARGET_GENERIC_HOSTNAME="licheepi-zero"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the LicheePi Zero"
+BR2_TARGET_GENERIC_ROOT_PASSWD="licheepi"
+# Run a getty (login prompt) after boot on ttyS0 @ 115200 bps
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
+# Run Custom genimage script after creating filesystem images
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/licheepi/genimage.cfg"
+
+# Kernel
+# Custom 4.14.14 kernel based on stable linux.4.14.y from Lichee-Pi Github repository
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Lichee-Pi/linux"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="cda44c146b9b87290bc7c636ffa7d88cbfb03ace"
+# In-tree kernel configuration
+BR2_LINUX_KERNEL_DEFCONFIG="licheepi_zero"
+# AllWinner V3s-based DTS
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-v3s-licheepi-zero sun8i-v3s-licheepi-zero-dock"
+
+# Target packages
+
+#?Hardware handling
+# Firmare
+# Linux-firmware
+BR2_PACKAGE_LINUX_FIRMWARE=y
+# Wifi firmware
+# Realtek 87xx for rtl8723bs support
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX=y
+
+# Dhcpcd package DHCP client for Wi-Fi
+BR2_PACKAGE_DHCPCD=y
+
+# WPA_supplicant package for Wi-Fi Authentication
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN=y
+
+# Filesystem images
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+
+# Bootloaders
+# Custom U-Boot from Lichee-Pi Github repository
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Lichee-Pi/u-boot"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="32ab1804cd7c5858be8009e35ca07502dc8765c7"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="LicheePi_Zero"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+# Generate a U-Boot boot script
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/licheepi/boot.cmd"
+
+# Host utilities
+# Required host utilities for building an SDCard image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.7.4
