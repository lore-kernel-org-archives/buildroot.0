From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Date: Sun, 27 Oct 2019 20:21:29 +0100
Subject: [Buildroot] [PATCH v2 1/3] board: add Beelink GS1 support
Message-ID: <20191027192131.6813-1-peron.clem@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Cl?ment P?ron <peron.clem@gmail.com>
---

Changes since v1:
 - Add myself to DEVELOPPERS file
 - Add U-boot and Linux version

ATF patch is merged in v2.2 but tag is not pushed on github
U-Boot patch is accepted upstream will be available in 2020.01

 DEVELOPERS                                    |   4 +
 board/beelink/gs1/extlinux.conf               |   4 +
 board/beelink/gs1/genimage.cfg                |  33 +++
 ...er-common-use-r_wdog-instead-of-wdog.patch |  39 +++
 ...01-arm-dts-sync-dts-for-Allwinner-H6.patch | 279 ++++++++++++++++++
 board/beelink/gs1/post-build.sh               |   4 +
 configs/beelink_gs1_defconfig                 |  39 +++
 7 files changed, 402 insertions(+)
 create mode 100644 board/beelink/gs1/extlinux.conf
 create mode 100644 board/beelink/gs1/genimage.cfg
 create mode 100644 board/beelink/gs1/patches/arm-trusted-firmware/0001-plat-allwinner-common-use-r_wdog-instead-of-wdog.patch
 create mode 100644 board/beelink/gs1/patches/uboot/0001-arm-dts-sync-dts-for-Allwinner-H6.patch
 create mode 100755 board/beelink/gs1/post-build.sh
 create mode 100644 configs/beelink_gs1_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index ec4f50a79e..cfa952400b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -591,6 +591,10 @@ F:	package/libsemanage/
 F:	package/libsepol/
 F:	package/policycoreutils/
 
+N:	Cl?ment P?ron <peron.clem@gmail.com>
+F:	board/beelink/gs1/
+F:	configs/beelink_gs1_defconfig
+
 N:	Corentin Guillevic <corentin.guillevic@smile.fr>
 F:	package/libloki/
 
diff --git a/board/beelink/gs1/extlinux.conf b/board/beelink/gs1/extlinux.conf
new file mode 100644
index 0000000000..046681f71d
--- /dev/null
+++ b/board/beelink/gs1/extlinux.conf
@@ -0,0 +1,4 @@
+label linux
+  kernel /Image
+  devicetree /sun50i-h6-beelink-gs1.dtb
+  append console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
diff --git a/board/beelink/gs1/genimage.cfg b/board/beelink/gs1/genimage.cfg
new file mode 100644
index 0000000000..88bbd26594
--- /dev/null
+++ b/board/beelink/gs1/genimage.cfg
@@ -0,0 +1,33 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"Image",
+			"sun50i-h6-beelink-gs1.dtb",
+			"extlinux"
+		}
+	}
+	size = 64M
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
diff --git a/board/beelink/gs1/patches/arm-trusted-firmware/0001-plat-allwinner-common-use-r_wdog-instead-of-wdog.patch b/board/beelink/gs1/patches/arm-trusted-firmware/0001-plat-allwinner-common-use-r_wdog-instead-of-wdog.patch
new file mode 100644
index 0000000000..9443fdd568
--- /dev/null
+++ b/board/beelink/gs1/patches/arm-trusted-firmware/0001-plat-allwinner-common-use-r_wdog-instead-of-wdog.patch
@@ -0,0 +1,39 @@
+From 523ab5be1a84e9aa15fb62c3a15a6338b01d3961 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
+Date: Tue, 9 Apr 2019 00:15:06 +0200
+Subject: [PATCH] plat: allwinner: common: use r_wdog instead of wdog
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Some Allwinner H6 has a broken watchdog that doesn't
+make the soc reboot.
+
+Use the R_WATCHDOG instead.
+
+Signed-off-by: Cl?ment P?ron <peron.clem@gmail.com>
+Change-Id: Ie95cc30a80ed517b60b30d6bc2e655a1b53f18ba
+---
+ plat/allwinner/common/sunxi_pm.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/plat/allwinner/common/sunxi_pm.c b/plat/allwinner/common/sunxi_pm.c
+index 1d2dc938..13e13532 100644
+--- a/plat/allwinner/common/sunxi_pm.c
++++ b/plat/allwinner/common/sunxi_pm.c
+@@ -20,9 +20,9 @@
+ #include <sunxi_mmap.h>
+ #include <sunxi_private.h>
+ 
+-#define SUNXI_WDOG0_CTRL_REG		(SUNXI_WDOG_BASE + 0x0010)
+-#define SUNXI_WDOG0_CFG_REG		(SUNXI_WDOG_BASE + 0x0014)
+-#define SUNXI_WDOG0_MODE_REG		(SUNXI_WDOG_BASE + 0x0018)
++#define SUNXI_WDOG0_CTRL_REG		(SUNXI_R_WDOG_BASE + 0x0010)
++#define SUNXI_WDOG0_CFG_REG		(SUNXI_R_WDOG_BASE + 0x0014)
++#define SUNXI_WDOG0_MODE_REG		(SUNXI_R_WDOG_BASE + 0x0018)
+ 
+ #define mpidr_is_valid(mpidr) ( \
+ 	MPIDR_AFFLVL3_VAL(mpidr) == 0 && \
+-- 
+2.20.1
+
diff --git a/board/beelink/gs1/patches/uboot/0001-arm-dts-sync-dts-for-Allwinner-H6.patch b/board/beelink/gs1/patches/uboot/0001-arm-dts-sync-dts-for-Allwinner-H6.patch
new file mode 100644
index 0000000000..8e695f6416
--- /dev/null
+++ b/board/beelink/gs1/patches/uboot/0001-arm-dts-sync-dts-for-Allwinner-H6.patch
@@ -0,0 +1,279 @@
+From 99cade8743158889b3e8db93c003b3318ebd4bda Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
+Date: Sun, 11 Aug 2019 22:38:57 +0200
+Subject: [PATCH] arm: dts: sync dts for Allwinner H6
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Sync Kernel DTS for Allwinner H6 boards.
+
+Drop /omit-if-no-ref/ keyword as it's not supported by U-boot.
+
+commit <d45331b00ddb> Linux 5.3-rc4
+
+Signed-off-by: Cl?ment P?ron <peron.clem@gmail.com>
+---
+ arch/arm/dts/sun50i-h6-beelink-gs1.dts | 76 ++++++++++++++++++++++++++
+ arch/arm/dts/sun50i-h6-pine-h64.dts    | 12 ++++
+ arch/arm/dts/sun50i-h6.dtsi            | 46 +++++++++++++++-
+ 3 files changed, 131 insertions(+), 3 deletions(-)
+
+diff --git a/arch/arm/dts/sun50i-h6-beelink-gs1.dts b/arch/arm/dts/sun50i-h6-beelink-gs1.dts
+index 54b0882bed..0dc33c90dd 100644
+--- a/arch/arm/dts/sun50i-h6-beelink-gs1.dts
++++ b/arch/arm/dts/sun50i-h6-beelink-gs1.dts
+@@ -14,6 +14,7 @@
+ 	compatible = "azw,beelink-gs1", "allwinner,sun50i-h6";
+ 
+ 	aliases {
++		ethernet0 = &emac;
+ 		serial0 = &uart0;
+ 	};
+ 
+@@ -21,6 +22,17 @@
+ 		stdout-path = "serial0:115200n8";
+ 	};
+ 
++	connector {
++		compatible = "hdmi-connector";
++		type = "a";
++
++		port {
++			hdmi_con_in: endpoint {
++				remote-endpoint = <&hdmi_out_con>;
++			};
++		};
++	};
++
+ 	leds {
+ 		compatible = "gpio-leds";
+ 
+@@ -41,6 +53,40 @@
+ 	};
+ };
+ 
++&de {
++	status = "okay";
++};
++
++&ehci0 {
++	status = "okay";
++};
++
++&emac {
++	pinctrl-names = "default";
++	pinctrl-0 = <&ext_rgmii_pins>;
++	phy-mode = "rgmii";
++	phy-handle = <&ext_rgmii_phy>;
++	phy-supply = <&reg_aldo2>;
++	status = "okay";
++};
++
++&hdmi {
++	status = "okay";
++};
++
++&hdmi_out {
++	hdmi_out_con: endpoint {
++		remote-endpoint = <&hdmi_con_in>;
++	};
++};
++
++&mdio {
++	ext_rgmii_phy: ethernet-phy at 1 {
++		compatible = "ethernet-phy-ieee802.3-c22";
++		reg = <1>;
++	};
++};
++
+ &mmc0 {
+ 	vmmc-supply = <&reg_cldo1>;
+ 	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;
+@@ -57,6 +103,15 @@
+ 	status = "okay";
+ };
+ 
++&ohci0 {
++	status = "okay";
++};
++
++&pio {
++	vcc-pd-supply = <&reg_cldo1>;
++	vcc-pg-supply = <&reg_aldo1>;
++};
++
+ &r_i2c {
+ 	status = "okay";
+ 
+@@ -177,8 +232,29 @@
+ 	};
+ };
+ 
++&r_pio {
++	/*
++	 * PL0 and PL1 are used for PMIC I2C
++	 * don't enable the pl-supply else
++	 * it will fail at boot
++	 *
++	 * vcc-pl-supply = <&reg_aldo1>;
++	 */
++	vcc-pm-supply = <&reg_aldo1>;
++};
++
+ &uart0 {
+ 	pinctrl-names = "default";
+ 	pinctrl-0 = <&uart0_ph_pins>;
+ 	status = "okay";
+ };
++
++&usb2otg {
++	dr_mode = "host";
++	status = "okay";
++};
++
++&usb2phy {
++	usb0_vbus-supply = <&reg_vcc5v>;
++	status = "okay";
++};
+diff --git a/arch/arm/dts/sun50i-h6-pine-h64.dts b/arch/arm/dts/sun50i-h6-pine-h64.dts
+index 4802902e12..1898345183 100644
+--- a/arch/arm/dts/sun50i-h6-pine-h64.dts
++++ b/arch/arm/dts/sun50i-h6-pine-h64.dts
+@@ -127,6 +127,12 @@
+ 	status = "okay";
+ };
+ 
++&pio {
++	vcc-pc-supply = <&reg_bldo2>;
++	vcc-pd-supply = <&reg_cldo1>;
++	vcc-pg-supply = <&reg_aldo1>;
++};
++
+ &r_i2c {
+ 	status = "okay";
+ 
+@@ -243,10 +249,16 @@
+ 	pcf8563: rtc at 51 {
+ 		compatible = "nxp,pcf8563";
+ 		reg = <0x51>;
++		interrupt-parent = <&r_intc>;
++		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+ 		#clock-cells = <0>;
+ 	};
+ };
+ 
++&r_pio {
++	vcc-pm-supply = <&reg_aldo1>;
++};
++
+ &uart0 {
+ 	pinctrl-names = "default";
+ 	pinctrl-0 = <&uart0_ph_pins>;
+diff --git a/arch/arm/dts/sun50i-h6.dtsi b/arch/arm/dts/sun50i-h6.dtsi
+index e0dc4a05c1..a117f479ae 100644
+--- a/arch/arm/dts/sun50i-h6.dtsi
++++ b/arch/arm/dts/sun50i-h6.dtsi
+@@ -101,7 +101,7 @@
+ 		#size-cells = <1>;
+ 		ranges;
+ 
+-		display-engine at 1000000 {
++		bus at 1000000 {
+ 			compatible = "allwinner,sun50i-h6-de3",
+ 				     "allwinner,sun50i-a64-de2";
+ 			reg = <0x1000000 0x400000>;
+@@ -203,11 +203,32 @@
+ 			#reset-cells = <1>;
+ 		};
+ 
++		dma: dma-controller at 3002000 {
++			compatible = "allwinner,sun50i-h6-dma";
++			reg = <0x03002000 0x1000>;
++			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
++			clocks = <&ccu CLK_BUS_DMA>, <&ccu CLK_MBUS_DMA>;
++			clock-names = "bus", "mbus";
++			dma-channels = <16>;
++			dma-requests = <46>;
++			resets = <&ccu RST_BUS_DMA>;
++			#dma-cells = <1>;
++		};
++
+ 		sid: sid at 3006000 {
+ 			compatible = "allwinner,sun50i-h6-sid";
+ 			reg = <0x03006000 0x400>;
+ 		};
+ 
++		watchdog: watchdog at 30090a0 {
++			compatible = "allwinner,sun50i-h6-wdt",
++				     "allwinner,sun6i-a31-wdt";
++			reg = <0x030090a0 0x20>;
++			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
++			/* Broken on some H6 boards */
++			status = "disabled";
++		};
++
+ 		pio: pinctrl at 300b000 {
+ 			compatible = "allwinner,sun50i-h6-pinctrl";
+ 			reg = <0x0300b000 0x400>;
+@@ -243,6 +264,18 @@
+ 				bias-pull-up;
+ 			};
+ 
++			/*
++			 * /omit-if-no-ref/ isn't supported by U-boot
++			 * keep this comment to avoid bad sync with Linux
++			 */
++			mmc1_pins: mmc1-pins {
++				pins = "PG0", "PG1", "PG2", "PG3",
++				       "PG4", "PG5";
++				function = "mmc1";
++				drive-strength = <30>;
++				bias-pull-up;
++			};
++
+ 			mmc2_pins: mmc2-pins {
+ 				pins = "PC1", "PC4", "PC5", "PC6",
+ 				       "PC7", "PC8", "PC9", "PC10",
+@@ -294,6 +327,8 @@
+ 			resets = <&ccu RST_BUS_MMC1>;
+ 			reset-names = "ahb";
+ 			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
++			pinctrl-names = "default";
++			pinctrl-0 = <&mmc1_pins>;
+ 			status = "disabled";
+ 			#address-cells = <1>;
+ 			#size-cells = <0>;
+@@ -445,7 +480,6 @@
+ 			resets = <&ccu RST_BUS_OHCI3>,
+ 				 <&ccu RST_BUS_EHCI3>;
+ 			phys = <&usb2phy 3>;
+-			phy-names = "usb";
+ 			status = "disabled";
+ 		};
+ 
+@@ -457,7 +491,6 @@
+ 				 <&ccu CLK_USB_OHCI3>;
+ 			resets = <&ccu RST_BUS_OHCI3>;
+ 			phys = <&usb2phy 3>;
+-			phy-names = "usb";
+ 			status = "disabled";
+ 		};
+ 
+@@ -613,6 +646,13 @@
+ 			#reset-cells = <1>;
+ 		};
+ 
++		r_watchdog: watchdog at 7020400 {
++			compatible = "allwinner,sun50i-h6-wdt",
++				     "allwinner,sun6i-a31-wdt";
++			reg = <0x07020400 0x20>;
++			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
++		};
++
+ 		r_intc: interrupt-controller at 7021000 {
+ 			compatible = "allwinner,sun50i-h6-r-intc",
+ 				     "allwinner,sun6i-a31-r-intc";
+-- 
+2.20.1
+
diff --git a/board/beelink/gs1/post-build.sh b/board/beelink/gs1/post-build.sh
new file mode 100755
index 0000000000..ec20fca7d9
--- /dev/null
+++ b/board/beelink/gs1/post-build.sh
@@ -0,0 +1,4 @@
+#!/bin/sh
+BOARD_DIR="$(dirname $0)"
+
+install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux/extlinux.conf
diff --git a/configs/beelink_gs1_defconfig b/configs/beelink_gs1_defconfig
new file mode 100644
index 0000000000..b3004ffe7a
--- /dev/null
+++ b/configs/beelink_gs1_defconfig
@@ -0,0 +1,39 @@
+# Architecture
+BR2_aarch64=y
+BR2_ARM_FPU_VFPV4=y
+BR2_TARGET_GENERIC_ISSUE="Welcome to Beelink GS1"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/beelink/gs1/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beelink/gs1/genimage.cfg"
+BR2_GLOBAL_PATCH_DIR="board/beelink/gs1/patches/"
+
+# Kernel Linux headers same as kernel, a 5.3 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h6-beelink-gs1"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+
+# Firmware
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.1"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_h6"
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.10"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="beelink_gs1"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.20.1
