From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Mar 2019 18:05:45 +0100
Subject: [Buildroot] [git commit] configs/licheepi_zero: new defconfig
Message-ID: <20190328170246.B9C31889A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4dcb76b0139c0dacaf526825cab76dcc9607df30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Michel Stempin <michel.stempin@wanadoo.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                      |  4 +++
 board/licheepi/boot.cmd         |  4 +++
 board/licheepi/genimage.cfg     | 35 +++++++++++++++++++++++
 board/licheepi/readme.txt       | 62 +++++++++++++++++++++++++++++++++++++++++
 configs/licheepi_zero_defconfig | 53 +++++++++++++++++++++++++++++++++++
 5 files changed, 158 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3dfdf894d7..07f908f8ef 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1594,6 +1594,10 @@ F:	board/pine64/rock64
 F:	configs/rock64_defconfig
 F:	configs/socrates_cyclone5_defconfig
 
+N:	Michel Stempin <michel.stempin@wanadoo.fr>
+F:	board/licheepi/
+F:	configs/licheepi_zero_defconfig
+
 N:	Mike Harmony <mike.harmony@snapav.com>
 F:	board/sinovoip/m2-plus/
 F:	configs/bananapi_m2_plus_defconfig
diff --git a/board/licheepi/boot.cmd b/board/licheepi/boot.cmd
new file mode 100644
index 0000000000..383b3473ed
--- /dev/null
+++ b/board/licheepi/boot.cmd
@@ -0,0 +1,4 @@
+setenv bootargs console=ttyS0,115200 panic=5 console=tty0 rootwait root=/dev/mmcblk0p2 earlyprintk rw
+load mmc 0:1 0x41000000 zImage
+load mmc 0:1 0x41800000 sun8i-v3s-licheepi-zero-dock.dtb
+bootz 0x41000000 - 0x41800000
diff --git a/board/licheepi/genimage.cfg b/board/licheepi/genimage.cfg
new file mode 100644
index 0000000000..0d8540f2a0
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
index 0000000000..6b8bf94b45
--- /dev/null
+++ b/board/licheepi/readme.txt
@@ -0,0 +1,62 @@
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
index 0000000000..826e98c5b7
--- /dev/null
+++ b/configs/licheepi_zero_defconfig
@@ -0,0 +1,53 @@
+# Target options
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_VFPV4=y
+
+# Toolchain
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
+
+# System configuration
+BR2_TARGET_GENERIC_HOSTNAME="licheepi-zero"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the LicheePi Zero"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/licheepi/genimage.cfg"
+
+# Kernel
+# Custom 4.14.14 kernel based on stable linux.4.14.y from Lichee-Pi Github repository
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Lichee-Pi/linux"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="cda44c146b9b87290bc7c636ffa7d88cbfb03ace"
+BR2_LINUX_KERNEL_DEFCONFIG="licheepi_zero"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-v3s-licheepi-zero sun8i-v3s-licheepi-zero-dock"
+
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX=y
+
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN=y
+
+# Filesystem images
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+
+# Bootloaders
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Lichee-Pi/u-boot"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="32ab1804cd7c5858be8009e35ca07502dc8765c7"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="LicheePi_Zero"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/licheepi/boot.cmd"
+
+# Required host utilities for building an SDCard image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
