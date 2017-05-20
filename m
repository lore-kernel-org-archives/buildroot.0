From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sat, 20 May 2017 16:31:53 +0300
Subject: [Buildroot] [PATCH] orangepi: add basic support for orangepi-zero
	board
Message-ID: <20170520133153.2673-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Board support package includes the following components:

- mainline kernel v4.11
- mainline u-boot v2017.03
- extra kernel config options and dts patches to enable SPI NOR and spidev

More details about this board are available here:
- http://linux-sunxi.org/Orange_Pi_Zero

Note that at the moment networking is not supported right out of the box.
Ethernet submission to mainline kernel is a work in progress, see the
latest dwmac-sun8i branches at https://github.com/montjoie/linux

On-board SDIO WiFi chip XR819 is supported by off-the-tree wireless
driver available at https://github.com/fifteenhex/xradio

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 board/orangepi/orangepi-zero/boot.cmd              |  8 +++++
 board/orangepi/orangepi-zero/genimage.cfg          | 36 +++++++++++++++++++
 board/orangepi/orangepi-zero/linux-extras.config   | 17 +++++++++
 ...orange-pi-zero-interrupt-triggering-xr819.patch | 32 +++++++++++++++++
 ...002-ARM-dts-orange-pi-zero-enable-spi-nor.patch | 42 ++++++++++++++++++++++
 ...0003-ARM-dts-orange-pi-zero-enable-spidev.patch | 42 ++++++++++++++++++++++
 board/orangepi/orangepi-zero/post-build.sh         |  1 +
 board/orangepi/orangepi-zero/post-image.sh         |  1 +
 board/orangepi/orangepi-zero/readme.txt            | 29 +++++++++++++++
 configs/orangepi_zero_defconfig                    | 42 ++++++++++++++++++++++
 10 files changed, 250 insertions(+)
 create mode 100644 board/orangepi/orangepi-zero/boot.cmd
 create mode 100644 board/orangepi/orangepi-zero/genimage.cfg
 create mode 100644 board/orangepi/orangepi-zero/linux-extras.config
 create mode 100644 board/orangepi/orangepi-zero/patches/linux/0001-ARM-dts-orange-pi-zero-interrupt-triggering-xr819.patch
 create mode 100644 board/orangepi/orangepi-zero/patches/linux/0002-ARM-dts-orange-pi-zero-enable-spi-nor.patch
 create mode 100644 board/orangepi/orangepi-zero/patches/linux/0003-ARM-dts-orange-pi-zero-enable-spidev.patch
 create mode 120000 board/orangepi/orangepi-zero/post-build.sh
 create mode 120000 board/orangepi/orangepi-zero/post-image.sh
 create mode 100644 board/orangepi/orangepi-zero/readme.txt
 create mode 100644 configs/orangepi_zero_defconfig

diff --git a/board/orangepi/orangepi-zero/boot.cmd b/board/orangepi/orangepi-zero/boot.cmd
new file mode 100644
index 000000000..44f0885ff
--- /dev/null
+++ b/board/orangepi/orangepi-zero/boot.cmd
@@ -0,0 +1,8 @@
+setenv fdt_high ffffffff
+
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+
+fatload mmc 0 $kernel_addr_r zImage
+fatload mmc 0 $fdt_addr_r sun8i-h2-plus-orangepi-zero.dtb
+
+bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/orangepi/orangepi-zero/genimage.cfg b/board/orangepi/orangepi-zero/genimage.cfg
new file mode 100644
index 000000000..bc8601cbb
--- /dev/null
+++ b/board/orangepi/orangepi-zero/genimage.cfg
@@ -0,0 +1,36 @@
+# Minimal SD card image for the OrangePi PC
+#
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"sun8i-h2-plus-orangepi-zero.dtb",
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
diff --git a/board/orangepi/orangepi-zero/linux-extras.config b/board/orangepi/orangepi-zero/linux-extras.config
new file mode 100644
index 000000000..fe00af5ef
--- /dev/null
+++ b/board/orangepi/orangepi-zero/linux-extras.config
@@ -0,0 +1,17 @@
+# spidev
+CONFIG_SPI_SPIDEV=y
+
+# spi nor
+CONFIG_MTD=y
+CONFIG_MTD_OF_PARTS=y
+CONFIG_MTD_SPI_NOR=y
+CONFIG_MTD_M25P80=y
+
+# wireless core
+CONFIG_WIRELESS=y
+CONFIG_CFG80211=y
+CONFIG_MAC80211=y
+CONFIG_CFG80211_WEXT=y
+
+# wireless drivers
+CONFIG_WLAN=y
diff --git a/board/orangepi/orangepi-zero/patches/linux/0001-ARM-dts-orange-pi-zero-interrupt-triggering-xr819.patch b/board/orangepi/orangepi-zero/patches/linux/0001-ARM-dts-orange-pi-zero-interrupt-triggering-xr819.patch
new file mode 100644
index 000000000..0101e137e
--- /dev/null
+++ b/board/orangepi/orangepi-zero/patches/linux/0001-ARM-dts-orange-pi-zero-interrupt-triggering-xr819.patch
@@ -0,0 +1,32 @@
+From d06068f474e029bbde7348108c509cc63d6aa196 Mon Sep 17 00:00:00 2001
+From: Sergey Matyukevich <geomatsi@gmail.com>
+Date: Fri, 19 May 2017 23:39:48 +0300
+Subject: [PATCH 1/2] ARM: dts: orange-pi-zero: interrupt triggering for XR819
+ WiFi chip
+
+Specify interrupt triggering for XR819 SDIO WiFi chip
+on orange-pi-zero board.
+
+For more details see: http://linux-sunxi.org/Wifi#Allwinner
+
+Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
+---
+ arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
+index b7ca916d871d..6510d22deed3 100644
+--- a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
++++ b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
+@@ -125,6 +125,8 @@
+ 	 */
+ 	xr819: sdio_wifi at 1 {
+ 		reg = <1>;
++		interrupt-parent = <&pio>;
++		interrupts = <6 10 IRQ_TYPE_EDGE_RISING>;
+ 	};
+ };
+ 
+-- 
+2.11.0
+
diff --git a/board/orangepi/orangepi-zero/patches/linux/0002-ARM-dts-orange-pi-zero-enable-spi-nor.patch b/board/orangepi/orangepi-zero/patches/linux/0002-ARM-dts-orange-pi-zero-enable-spi-nor.patch
new file mode 100644
index 000000000..0fb9f4bc8
--- /dev/null
+++ b/board/orangepi/orangepi-zero/patches/linux/0002-ARM-dts-orange-pi-zero-enable-spi-nor.patch
@@ -0,0 +1,42 @@
+From f6ea4149cb1093a32a574a12496cbdbf3adbff93 Mon Sep 17 00:00:00 2001
+From: Sergey Matyukevich <geomatsi@gmail.com>
+Date: Sat, 20 May 2017 11:24:26 +0300
+Subject: [PATCH 2/2] ARM: dts: orange-pi-zero: enable SPI NOR
+
+Enable SPI NOR on orange-pi-zero board.
+
+For more information see:
+- http://linux-sunxi.org/Orange_Pi_Zero#SPI_NOR_flash
+
+Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
+---
+ arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
+index 6510d22deed3..119f529e6d22 100644
+--- a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
++++ b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
+@@ -160,3 +160,19 @@
+ 	/* USB VBUS is always on */
+ 	status = "okay";
+ };
++
++&spi0 {
++	status = "okay";
++
++	flash at 0 {
++		#address-cells = <1>;
++		#size-cells = <1>;
++		compatible = "mxicy,mx25l1606e", "winbond,w25q128";
++		reg = <0>;
++		spi-max-frequency = <40000000>;
++
++		partition at 00000000 {
++			reg = <0x00000000 0x200000>;	/* 2Mb */
++		};
++	};
++};
+-- 
+2.11.0
+
diff --git a/board/orangepi/orangepi-zero/patches/linux/0003-ARM-dts-orange-pi-zero-enable-spidev.patch b/board/orangepi/orangepi-zero/patches/linux/0003-ARM-dts-orange-pi-zero-enable-spidev.patch
new file mode 100644
index 000000000..d29c406b6
--- /dev/null
+++ b/board/orangepi/orangepi-zero/patches/linux/0003-ARM-dts-orange-pi-zero-enable-spidev.patch
@@ -0,0 +1,42 @@
+From 5487218257a40c24aa0960f323ccfbd3793ab560 Mon Sep 17 00:00:00 2001
+From: Sergey Matyukevich <geomatsi@gmail.com>
+Date: Sat, 20 May 2017 15:36:51 +0300
+Subject: [PATCH 3/3] ARM: dts: orange-pi-zero: enable spidev
+
+On orange-pi-zero board SPI1 pins are accessible via GPIO expansion port.
+This patch enables spidev driver for SPI1.
+
+Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
+---
+ arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
+index 119f529e6d22..da83d92201df 100644
+--- a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
++++ b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
+@@ -59,6 +59,7 @@
+ 		serial0 = &uart0;
+ 		/* ethernet0 is the H3 emac, defined in sun8i-h3.dtsi */
+ 		ethernet1 = &xr819;
++		spi1 = &spi1;
+ 	};
+ 
+ 	chosen {
+@@ -176,3 +177,13 @@
+ 		};
+ 	};
+ };
++
++&spi1 {
++	status = "okay";
++
++	spidev at 0 {
++		compatible = "rohm,dh2228fv";
++		reg = <0>;
++		spi-max-frequency = <10000000>;
++	};
++};
+-- 
+2.11.0
+
diff --git a/board/orangepi/orangepi-zero/post-build.sh b/board/orangepi/orangepi-zero/post-build.sh
new file mode 120000
index 000000000..cd7f11645
--- /dev/null
+++ b/board/orangepi/orangepi-zero/post-build.sh
@@ -0,0 +1 @@
+../post-build.sh
\ No newline at end of file
diff --git a/board/orangepi/orangepi-zero/post-image.sh b/board/orangepi/orangepi-zero/post-image.sh
new file mode 120000
index 000000000..ae6294fa3
--- /dev/null
+++ b/board/orangepi/orangepi-zero/post-image.sh
@@ -0,0 +1 @@
+../post-image.sh
\ No newline at end of file
diff --git a/board/orangepi/orangepi-zero/readme.txt b/board/orangepi/orangepi-zero/readme.txt
new file mode 100644
index 000000000..1afdbb784
--- /dev/null
+++ b/board/orangepi/orangepi-zero/readme.txt
@@ -0,0 +1,29 @@
+OrangePi Zero
+
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the OrangePi Zero. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+How to build it
+===============
+
+Configure Buildroot:
+
+    $ make orangepi_zero_defconfig
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
diff --git a/configs/orangepi_zero_defconfig b/configs/orangepi_zero_defconfig
new file mode 100644
index 000000000..e023af448
--- /dev/null
+++ b/configs/orangepi_zero_defconfig
@@ -0,0 +1,42 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_VFPV4=y
+BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero/patches"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+BR2_TARGET_GENERIC_HOSTNAME="OrangePi_Zero"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi Zero"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/orangepi-zero/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/orangepi/orangepi-zero/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h2-plus-orangepi-zero"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-zero/linux-extras.config"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.03"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+
+# wireless support
+BR2_PACKAGE_IW=y
+BR2_PACKAGE_WIRELESS_TOOLS=y
+BR2_PACKAGE_WIRELESS_TOOLS_LIB=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_WPA_SUPPLICANT_NL80211=y
+BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
+
+# spi flash support
+BR2_PACKAGE_MTD=y
-- 
2.11.0
