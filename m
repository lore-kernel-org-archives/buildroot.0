From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Thu, 29 Oct 2020 20:53:31 +0100
Subject: [Buildroot] [PATCH v2] board: add Orangepi Zero Plus support
Message-ID: <20201029195331.3894-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add initial support for Orangepi Zero Plus board:
- U-Boot 2020.10
- Linux 5.7.19
- Default packages from buildroot

This patch is based on Orangepi Zero Plus2 board support, so genimage
configuration and description is copy pasted. One difference is that
newer Linux and U-Boot are selected. Another difference is Ethernet
support (Plus) instead of WiFi (Plus2).

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
changes v1 -> v2:
 * rebase on Buildroot master
 * bump U-Boot from 2020.04 to 2020.10
 * bump Linux from 5.6.6 to 5.7.19

 DEVELOPERS                                    |  2 +
 board/orangepi/orangepi-zero-plus/boot.cmd    |  6 +++
 .../orangepi/orangepi-zero-plus/genimage.cfg  | 39 ++++++++++++++
 board/orangepi/orangepi-zero-plus/readme.txt  | 34 +++++++++++++
 configs/orangepi_zero_plus_defconfig          | 51 +++++++++++++++++++
 5 files changed, 132 insertions(+)
 create mode 100644 board/orangepi/orangepi-zero-plus/boot.cmd
 create mode 100644 board/orangepi/orangepi-zero-plus/genimage.cfg
 create mode 100644 board/orangepi/orangepi-zero-plus/readme.txt
 create mode 100644 configs/orangepi_zero_plus_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index ceb9cc9160..306ca507cb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1580,7 +1580,9 @@ F:	package/ecryptfs-utils/
 
 N:	Marcin Niestroj <m.niestroj@grinn-global.com>
 F:	board/grinn/
+F:	board/orangepi/orangepi-zero-plus/
 F:	configs/grinn_*
+F:	configs/orangepi_zero_plus_defconfig
 F:	package/argparse/
 F:	package/dt-utils/
 F:	package/easydbus/
diff --git a/board/orangepi/orangepi-zero-plus/boot.cmd b/board/orangepi/orangepi-zero-plus/boot.cmd
new file mode 100644
index 0000000000..18c4d521af
--- /dev/null
+++ b/board/orangepi/orangepi-zero-plus/boot.cmd
@@ -0,0 +1,6 @@
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+
+fatload mmc 0 $kernel_addr_r Image
+fatload mmc 0 $fdt_addr_r sun50i-h5-orangepi-zero-plus.dtb
+
+booti $kernel_addr_r - $fdt_addr_r
diff --git a/board/orangepi/orangepi-zero-plus/genimage.cfg b/board/orangepi/orangepi-zero-plus/genimage.cfg
new file mode 100644
index 0000000000..ec15898ddd
--- /dev/null
+++ b/board/orangepi/orangepi-zero-plus/genimage.cfg
@@ -0,0 +1,39 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"Image",
+			"sun50i-h5-orangepi-zero-plus.dtb",
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
diff --git a/board/orangepi/orangepi-zero-plus/readme.txt b/board/orangepi/orangepi-zero-plus/readme.txt
new file mode 100644
index 0000000000..5556eae890
--- /dev/null
+++ b/board/orangepi/orangepi-zero-plus/readme.txt
@@ -0,0 +1,34 @@
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the Orangepi Zero Plus. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+Orangepi Zero Plus link:
+http://www.orangepi.org/OrangePiZeroPlus/
+
+This configuration uses U-Boot mainline and kernel mainline.
+
+How to build
+============
+
+    $ make orangepi_zero_plus_defconfig
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
+Insert the micro SDcard in your Orangepi Zero Plus and power it up. The console
+is on the serial line, 115200 8N1.
diff --git a/configs/orangepi_zero_plus_defconfig b/configs/orangepi_zero_plus_defconfig
new file mode 100644
index 0000000000..cff2788f04
--- /dev/null
+++ b/configs/orangepi_zero_plus_defconfig
@@ -0,0 +1,51 @@
+BR2_aarch64=y
+BR2_cortex_a53=y
+BR2_ARM_FPU_VFPV4=y
+
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_7=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_SYSTEM_DHCP="eth0"
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
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.10"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero_plus"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-zero-plus/boot.cmd"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.7.19"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-orangepi-zero-plus"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# Filesystem
+BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi Zero Plus"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-zero-plus/genimage.cfg"
-- 
2.29.1
