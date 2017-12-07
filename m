From: Jan Kraval <jan.kraval@gmail.com>
Date: Thu,  7 Dec 2017 18:59:26 +0100
Subject: [Buildroot] [PATCH 1/1] board/orangepi: add support for
 orangepi-lite board
Message-ID: <20171207175926.8533-1-jan.kraval@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

    This board is quite similar to orangepi-one board. Instead of ethernet, it
    has RTL8189FTV SDIO WiFi chip.

    Board support package includes the following components:
     - mainline u-boot 2017.09
     - mainline kernel 4.13.11

Signed-off-by: Jan Kraval <jan.kraval@gmail.com>
---
 DEVELOPERS                                       |  4 +++
 board/orangepi/orangepi-lite/boot.cmd            |  8 ++++++
 board/orangepi/orangepi-lite/genimage.cfg        | 36 ++++++++++++++++++++++++
 board/orangepi/orangepi-lite/linux-extras.config |  8 ++++++
 board/orangepi/orangepi-lite/post-build.sh       |  1 +
 board/orangepi/orangepi-lite/post-image.sh       |  1 +
 board/orangepi/orangepi-lite/readme.txt          | 29 +++++++++++++++++++
 configs/orangepi_lite_defconfig                  | 34 ++++++++++++++++++++++
 8 files changed, 121 insertions(+)
 create mode 100644 board/orangepi/orangepi-lite/boot.cmd
 create mode 100644 board/orangepi/orangepi-lite/genimage.cfg
 create mode 100644 board/orangepi/orangepi-lite/linux-extras.config
 create mode 120000 board/orangepi/orangepi-lite/post-build.sh
 create mode 120000 board/orangepi/orangepi-lite/post-image.sh
 create mode 100644 board/orangepi/orangepi-lite/readme.txt
 create mode 100644 configs/orangepi_lite_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 0bbee2c369..afa32ae5eb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -783,6 +783,10 @@ F:	package/pangomm/
 F:	package/rpm/
 F:	package/yad/
 
+N:	Jan Kraval <jan.kraval@gmail.com>
+F:	board/orangepi/orangepi-lite
+F:	configs/orangepi_lite_defconfig
+
 N:	Jan Pedersen <jp@jp-embedded.com>
 F:	package/zip/
 
diff --git a/board/orangepi/orangepi-lite/boot.cmd b/board/orangepi/orangepi-lite/boot.cmd
new file mode 100644
index 0000000000..5c29dabfe8
--- /dev/null
+++ b/board/orangepi/orangepi-lite/boot.cmd
@@ -0,0 +1,8 @@
+setenv fdt_high ffffffff
+
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+
+fatload mmc 0 $kernel_addr_r zImage
+fatload mmc 0 $fdt_addr_r sun8i-h3-orangepi-lite.dtb
+
+bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/orangepi/orangepi-lite/genimage.cfg b/board/orangepi/orangepi-lite/genimage.cfg
new file mode 100644
index 0000000000..cd81f986b2
--- /dev/null
+++ b/board/orangepi/orangepi-lite/genimage.cfg
@@ -0,0 +1,36 @@
+# Minimal SD card image for the OrangePi Lite
+#
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"sun8i-h3-orangepi-lite.dtb",
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
diff --git a/board/orangepi/orangepi-lite/linux-extras.config b/board/orangepi/orangepi-lite/linux-extras.config
new file mode 100644
index 0000000000..5e3af2b831
--- /dev/null
+++ b/board/orangepi/orangepi-lite/linux-extras.config
@@ -0,0 +1,8 @@
+# wireless core
+CONFIG_WIRELESS=y
+CONFIG_CFG80211=y
+CONFIG_MAC80211=y
+CONFIG_CFG80211_WEXT=y
+
+# wireless drivers
+CONFIG_WLAN=y
diff --git a/board/orangepi/orangepi-lite/post-build.sh b/board/orangepi/orangepi-lite/post-build.sh
new file mode 120000
index 0000000000..cd7f11645b
--- /dev/null
+++ b/board/orangepi/orangepi-lite/post-build.sh
@@ -0,0 +1 @@
+../post-build.sh
\ No newline at end of file
diff --git a/board/orangepi/orangepi-lite/post-image.sh b/board/orangepi/orangepi-lite/post-image.sh
new file mode 120000
index 0000000000..ae6294fa38
--- /dev/null
+++ b/board/orangepi/orangepi-lite/post-image.sh
@@ -0,0 +1 @@
+../post-image.sh
\ No newline at end of file
diff --git a/board/orangepi/orangepi-lite/readme.txt b/board/orangepi/orangepi-lite/readme.txt
new file mode 100644
index 0000000000..5f402bf207
--- /dev/null
+++ b/board/orangepi/orangepi-lite/readme.txt
@@ -0,0 +1,29 @@
+OrangePi Lite
+
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the OrangePi Lite. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+How to build it
+===============
+
+Configure Buildroot:
+
+    $ make orangepi_lite_defconfig
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
diff --git a/configs/orangepi_lite_defconfig b/configs/orangepi_lite_defconfig
new file mode 100644
index 0000000000..3222275201
--- /dev/null
+++ b/configs/orangepi_lite_defconfig
@@ -0,0 +1,34 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_VFPV4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
+BR2_TARGET_GENERIC_HOSTNAME="OrangePi_Lite"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi Lite"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/orangepi-lite/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/orangepi/orangepi-lite/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.11"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-lite/linux-extras.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-lite"
+BR2_PACKAGE_RTL8189FS=y
+BR2_PACKAGE_WIRELESS_TOOLS=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.09"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_lite"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.11.0
