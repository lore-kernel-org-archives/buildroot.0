From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Date: Sat,  8 May 2021 19:12:32 +0200
Subject: [Buildroot] [PATCH] configs/uevm5432: new defconfig
Message-ID: <20210508171232.26650-1-vincent.stehle@laposte.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The OMAP5432 uEVM[1] is a development board from Texas Instruments.

It is similar to the OMAP4 Panda boards, from which this configuration is
inspired.

[1]: https://svtronics.com/5432

Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
---
 DEVELOPERS                  |  1 +
 board/uevm5432/genimage.cfg | 26 +++++++++++++++++++++
 board/uevm5432/readme.txt   | 40 ++++++++++++++++++++++++++++++++
 configs/uevm5432_defconfig  | 46 +++++++++++++++++++++++++++++++++++++
 4 files changed, 113 insertions(+)
 create mode 100644 board/uevm5432/genimage.cfg
 create mode 100644 board/uevm5432/readme.txt
 create mode 100644 configs/uevm5432_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index bbbb0ecfa8..fb345e0254 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2709,6 +2709,7 @@ F:	package/utp_com/
 N:	Vincent Stehl? <vincent.stehle@laposte.net>
 F:	board/bananapi/bananapi-m2-zero/
 F:	configs/bananapi_m2_zero_defconfig
+F:	configs/uevm5432_defconfig
 F:	package/i7z/
 F:	package/msr-tools/
 F:	package/pixz/
diff --git a/board/uevm5432/genimage.cfg b/board/uevm5432/genimage.cfg
new file mode 100644
index 0000000000..f30033f023
--- /dev/null
+++ b/board/uevm5432/genimage.cfg
@@ -0,0 +1,26 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"MLO",
+			"u-boot.img"
+		}
+	}
+	size = 8M
+}
+
+image sdcard.img {
+	hdimage {
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
diff --git a/board/uevm5432/readme.txt b/board/uevm5432/readme.txt
new file mode 100644
index 0000000000..4569fbd84e
--- /dev/null
+++ b/board/uevm5432/readme.txt
@@ -0,0 +1,40 @@
+OMAP5432 uEVM
+=============
+
+This file documents the Buildroot support for the OMAP5432 uEVM[1], a
+single-board computer development platform based on the Texas Instruments
+OMAP5432 system on a chip (SoC).
+
+How to build
+============
+
+  $ make uevm5432_defconfig
+  $ make
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
+  $ sync
+
+Where /dev/sdX is the device node of your SD card (may be /dev/mmcblkX instead
+depending on setup).
+
+To boot from SD card, set the SYSBOOT switches S1 of your OMAP5432 uEVM to the
+following position:
+
+  ON   x   x
+     x   x
+     1 2 3 4
+
+Insert the micro SDcard in your OMAP5432 uEVM, and power it up with the POWER
+ON push button switch S3. The console is on the micro USB Debug UART, with
+serial settings 115200 8N1. Refer also to the quick start guide[2].
+
+[1]: https://svtronics.com/5432
+[2]: https://www.ti.com/lit/ug/swcu131/swcu131.pdf
diff --git a/configs/uevm5432_defconfig b/configs/uevm5432_defconfig
new file mode 100644
index 0000000000..7b9a4309c6
--- /dev/null
+++ b/configs/uevm5432_defconfig
@@ -0,0 +1,46 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a15=y
+BR2_ARM_FPU_NEON_VFPV4=y
+
+# Linux headers same as kernel, a 5.12 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
+
+# System
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS2"
+BR2_SYSTEM_DHCP="eth0"
+
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/uevm5432/genimage.cfg"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.12.2"
+BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="omap5-uevm"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="omap5_uevm"
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="MLO"
+
+# Required tools to create the SD card image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.30.2
