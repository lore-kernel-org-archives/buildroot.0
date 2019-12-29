From: Avi Shukron <avraham.shukron@gmail.com>
Date: Sun, 29 Dec 2019 23:48:20 +0200
Subject: [Buildroot] [PATCH] New board: pine64+
Message-ID: <20191229214821.15301-1-avraham.shukron@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The pine64+ is a variant of the original pine64 with 1/2 GB RAM and
GbE phy.

The pine64+ has a distinct dts file in both mainline kernel and uboot,
thus it cannot be supported with the existing pine64_defconfig.

The board is added with mainline ATF, Uboot and kernel support, all at
the latest (or almost) version.

The new defconfig for the board was tested and booted successfully with
serial console access + console output to HDMI. Network interface eth0
is working properly and configured with DHCP at boot time.

Signed-off-by: Avi Shukron <avraham.shukron@gmail.com>
---
 board/pine64/pine64-plus/boot.cmd     |  6 +++
 board/pine64/pine64-plus/genimage.cfg | 39 +++++++++++++++++++
 board/pine64/pine64-plus/readme.txt   | 55 +++++++++++++++++++++++++++
 configs/pine64_plus_defconfig         | 35 +++++++++++++++++
 4 files changed, 135 insertions(+)
 create mode 100644 board/pine64/pine64-plus/boot.cmd
 create mode 100644 board/pine64/pine64-plus/genimage.cfg
 create mode 100644 board/pine64/pine64-plus/readme.txt
 create mode 100644 configs/pine64_plus_defconfig

diff --git a/board/pine64/pine64-plus/boot.cmd b/board/pine64/pine64-plus/boot.cmd
new file mode 100644
index 0000000000..511111e2ee
--- /dev/null
+++ b/board/pine64/pine64-plus/boot.cmd
@@ -0,0 +1,6 @@
+setenv bootargs console=tty0 console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+
+fatload mmc 0 $kernel_addr_r Image
+fatload mmc 0 $fdt_addr_r sun50i-a64-pine64-plus.dtb
+
+booti $kernel_addr_r - $fdt_addr_r
diff --git a/board/pine64/pine64-plus/genimage.cfg b/board/pine64/pine64-plus/genimage.cfg
new file mode 100644
index 0000000000..60dac9d882
--- /dev/null
+++ b/board/pine64/pine64-plus/genimage.cfg
@@ -0,0 +1,39 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"Image",
+			"sun50i-a64-pine64-plus.dtb",
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
diff --git a/board/pine64/pine64-plus/readme.txt b/board/pine64/pine64-plus/readme.txt
new file mode 100644
index 0000000000..40d56755b8
--- /dev/null
+++ b/board/pine64/pine64-plus/readme.txt
@@ -0,0 +1,55 @@
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the Pine64+. With the current configuration
+it will bring-up the board, and allow access through the UART0 serial console.
+The console will also output to the HDMI port, but login is provided only
+through the serial port. The pine64 wiki (link below) will provide details
+about the pin locations for UART0.
+
+If you wish to use the login console over the HDMI port you'll need:
+1. A USB keyboard.
+2. Edit the `bootargs` entry in `boot.cmd` and swap the order of the `console`
+arguments so that `console=tty0` will be the last console.
+Please notice that you have to rebuild uboot and then re-create the SD image
+for the change to take effect.
+
+If you want to be able to use the keyboard in u-boot, make sure you connect
+it to the *bottom* USB port of the board (the upper one is OTG in Device mode
+during u-boot)
+
+You'll have a eth0 network interface available and configured using DHCP, but
+ssh access is not enabled in the default configuration.
+
+Pine64 link:
+https://www.pine64.org/devices/single-board-computers/pine-a64/
+
+Wiki link:
+http://linux-sunxi.org/Pine64
+
+This configuration uses U-Boot mainline and kernel mainline.
+
+How to build
+============
+
+    $ make pine64_plus_defconfig
+
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
+Insert the micro SDcard in your Pine64 and power it up. The console
+is on UART0, 115200 8N1, or using HDMI screen + USB keyboard.
diff --git a/configs/pine64_plus_defconfig b/configs/pine64_plus_defconfig
new file mode 100644
index 0000000000..d1b267b64e
--- /dev/null
+++ b/configs/pine64_plus_defconfig
@@ -0,0 +1,35 @@
+BR2_aarch64=y
+BR2_ARM_FPU_VFPV4=y
+BR2_CCACHE=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TARGET_GENERIC_ISSUE="Welcome to PINE64+"
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pine64/pine64-plus/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-a64-pine64-plus"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="100M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.2"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pine64_plus"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/pine64/pine64-plus/boot.cmd"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.20.1
