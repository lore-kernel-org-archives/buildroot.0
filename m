From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 18 May 2016 16:54:24 -0300
Subject: [Buildroot] [PATCH] configs: new configuration for i.MX6UL Pico
	board
Message-ID: <1463601264-16293-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for Technexion's i.MX6UL Pico board.

For information about this board, please visit:
http://www.wandboard.org/images/hobbit/hobbitboard-imx6ul-reva1.pdf

Currently two patches are needed, but in the future they can be removed
when we switch to kernel 4.7 and U-boot 2016.07 versions.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 board/technexion/imx6ulpico/genimage.cfg           |  41 ++
 .../patches/linux/0001-pico_initial_dts.patch      | 558 +++++++++++++++++++++
 .../patches/uboot/0001-pico_add_hush.patch         |  37 ++
 board/technexion/imx6ulpico/post-image.sh          |  15 +
 configs/imx6ulpico_defconfig                       |  37 ++
 5 files changed, 688 insertions(+)
 create mode 100644 board/technexion/imx6ulpico/genimage.cfg
 create mode 100644 board/technexion/imx6ulpico/patches/linux/0001-pico_initial_dts.patch
 create mode 100644 board/technexion/imx6ulpico/patches/uboot/0001-pico_add_hush.patch
 create mode 100755 board/technexion/imx6ulpico/post-image.sh
 create mode 100644 configs/imx6ulpico_defconfig

diff --git a/board/technexion/imx6ulpico/genimage.cfg b/board/technexion/imx6ulpico/genimage.cfg
new file mode 100644
index 0000000..9e67105
--- /dev/null
+++ b/board/technexion/imx6ulpico/genimage.cfg
@@ -0,0 +1,41 @@
+# Minimal eMMC card image for the Technexion's i.MX6UL Pico board
+#
+# We mimic the .sdcard Freescale's image format for i.MX6UL:
+# * the eMMC must have 1 kB free space at the beginning,
+# * U-Boot is dumped as is,
+# * a FAT partition at offset 8 MB is containing zImage and dtbs,
+# * a single root filesystem partition is required (Ext4 in this case).
+#
+
+image boot.vfat {
+  vfat {
+    files = {
+      "imx6ul-pico-hobbit.dtb",
+      "zImage"
+    }
+  }
+  size = 16M
+}
+
+image sdcard.img {
+  hdimage {
+  }
+
+  partition u-boot {
+    in-partition-table = "no"
+    image = "u-boot.imx"
+    offset = 1024
+  }
+
+  partition boot {
+    partition-type = 0xC
+    bootable = "true"
+    image = "boot.vfat"
+    offset = 8M
+  }
+
+  partition rootfs {
+    partition-type = 0x83
+    image = "rootfs.ext4"
+  }
+}
diff --git a/board/technexion/imx6ulpico/patches/linux/0001-pico_initial_dts.patch b/board/technexion/imx6ulpico/patches/linux/0001-pico_initial_dts.patch
new file mode 100644
index 0000000..83d7f81
--- /dev/null
+++ b/board/technexion/imx6ulpico/patches/linux/0001-pico_initial_dts.patch
@@ -0,0 +1,558 @@
+From 029684d45ba4b0bf3e3393d38dda22f9720f889c Mon Sep 17 00:00:00 2001
+From: Fabio Estevam <fabio.estevam@nxp.com>
+Date: Wed, 18 May 2016 15:17:09 -0300
+Subject: [PATCH] ARM: dts: imx6ul-pico-hobbit: Add initial support
+
+Add initial support for imx6ul pico hobbit board.
+
+For information about this board, please visit:
+http://www.wandboard.org/images/hobbit/hobbitboard-imx6ul-reva1.pdf
+
+Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
+Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
+Signed-off-by: Shawn Guo <shawnguo@kernel.org>
+---
+ arch/arm/boot/dts/Makefile               |   3 +-
+ arch/arm/boot/dts/imx6ul-pico-hobbit.dts | 516 +++++++++++++++++++++++++++++++
+ 2 files changed, 518 insertions(+), 1 deletion(-)
+ create mode 100644 arch/arm/boot/dts/imx6ul-pico-hobbit.dts
+
+diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
+index 95c1923..97ec302 100644
+--- a/arch/arm/boot/dts/Makefile
++++ b/arch/arm/boot/dts/Makefile
+@@ -374,7 +374,8 @@ dtb-$(CONFIG_SOC_IMX6SX) += \
+ 	imx6sx-sdb-reva.dtb \
+ 	imx6sx-sdb.dtb
+ dtb-$(CONFIG_SOC_IMX6UL) += \
+-	imx6ul-14x14-evk.dtb
++	imx6ul-14x14-evk.dtb \
++	imx6ul-pico-hobbit.dtb
+ dtb-$(CONFIG_SOC_IMX7D) += \
+ 	imx7d-cl-som-imx7.dtb \
+ 	imx7d-sbc-imx7.dtb \
+diff --git a/arch/arm/boot/dts/imx6ul-pico-hobbit.dts b/arch/arm/boot/dts/imx6ul-pico-hobbit.dts
+new file mode 100644
+index 0000000..8ce1fec
+--- /dev/null
++++ b/arch/arm/boot/dts/imx6ul-pico-hobbit.dts
+@@ -0,0 +1,516 @@
++/*
++ * Copyright 2015 Technexion Ltd.
++ *
++ * Author: Wig Cheng  <wig.cheng@technexion.com>
++ *	   Richard Hu <richard.hu@technexion.com>
++ *	   Tapani Utriainen <tapani@technexion.com>
++ *
++ * This file is dual-licensed: you can use it either under the terms
++ * of the GPL or the X11 license, at your option. Note that this dual
++ * licensing only applies to this file, and not this project as a
++ * whole.
++ *
++ *  a) This file is free software; you can redistribute it and/or
++ *     modify it under the terms of the GNU General Public License
++ *     version 2 as published by the Free Software Foundation.
++ *
++ *     This file is distributed in the hope that it will be useful
++ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
++ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ *     GNU General Public License for more details.
++ *
++ * Or, alternatively
++ *
++ *  b) Permission is hereby granted, free of charge, to any person
++ *     obtaining a copy of this software and associated documentation
++ *     files (the "Software"), to deal in the Software without
++ *     restriction, including without limitation the rights to use
++ *     copy, modify, merge, publish, distribute, sublicense, and/or
++ *     sell copies of the Software, and to permit persons to whom the
++ *     Software is furnished to do so, subject to the following
++ *     conditions:
++ *
++ *     The above copyright notice and this permission notice shall be
++ *     included in all copies or substantial portions of the Software.
++ *
++ *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
++ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
++ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
++ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
++ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
++ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
++ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
++ *     OTHER DEALINGS IN THE SOFTWARE.
++ */
++
++/dts-v1/;
++
++#include "imx6ul.dtsi"
++
++/ {
++	model = "Technexion Pico i.MX6UL Board";
++	compatible = "technexion,imx6ul-pico-hobbit", "fsl,imx6ul";
++
++	memory {
++		reg = <0x80000000 0x10000000>;
++	};
++
++	chosen {
++		stdout-path = &uart6;
++	};
++
++	backlight {
++		compatible = "pwm-backlight";
++		pwms = <&pwm3 0 5000000>;
++		brightness-levels = <0 4 8 16 32 64 128 255>;
++		default-brightness-level = <6>;
++		status = "okay";
++	};
++
++	reg_2p5v: regulator-2p5v {
++		compatible = "regulator-fixed";
++		regulator-name = "2P5V";
++		regulator-min-microvolt = <2500000>;
++		regulator-max-microvolt = <2500000>;
++	};
++
++	reg_3p3v: regulator-3p3v {
++		compatible = "regulator-fixed";
++		regulator-name = "3P3V";
++		regulator-min-microvolt = <3300000>;
++		regulator-max-microvolt = <3300000>;
++	};
++
++	reg_sd1_vmmc: regulator-sd1-vmmc {
++		compatible = "regulator-fixed";
++		regulator-name = "VSD_3V3";
++		regulator-min-microvolt = <3300000>;
++		regulator-max-microvolt = <3300000>;
++		gpio = <&gpio1 9 GPIO_ACTIVE_HIGH>;
++		enable-active-high;
++	};
++
++	reg_usb_otg_vbus: regulator-usb-otg-vbus {
++		compatible = "regulator-fixed";
++		pinctrl-names = "default";
++		pinctrl-0 = <&pinctrl_usb_otg1>;
++		regulator-name = "usb_otg_vbus";
++		regulator-min-microvolt = <5000000>;
++		regulator-max-microvolt = <5000000>;
++		gpio = <&gpio1 6 0>;
++	};
++
++	sound {
++		compatible = "fsl,imx-audio-sgtl5000";
++		model = "imx6ul-sgtl5000";
++		audio-cpu = <&sai1>;
++		audio-codec = <&codec>;
++		audio-routing =
++			"LINE_IN", "Line In Jack",
++			"MIC_IN", "Mic Jack",
++			"Mic Jack", "Mic Bias",
++			"Headphone Jack", "HP_OUT";
++	};
++
++	sys_mclk: clock-sys-mclk {
++		compatible = "fixed-clock";
++		#clock-cells = <0>;
++		clock-frequency = <24576000>;
++	};
++
++	leds {
++		compatible = "gpio-leds";
++
++		hobbitled {
++			label = "hobbitled";
++			gpios = <&gpio1 29 GPIO_ACTIVE_LOW>;
++		};
++	};
++};
++
++&can1 {
++	pinctrl-names = "default";
++	pinctrl-0 = <&pinctrl_flexcan1>;
++	status = "okay";
++};
++
++&can2 {
++	pinctrl-names = "default";
++	pinctrl-0 = <&pinctrl_flexcan2>;
++	status = "okay";
++};
++
++&clks {
++	assigned-clocks = <&clks IMX6UL_CLK_PLL4_AUDIO_DIV>;
++	assigned-clock-rates = <786432000>;
++};
++
++&fec2 {
++	pinctrl-names = "default";
++	pinctrl-0 = <&pinctrl_enet2>;
++	phy-mode = "rmii";
++	phy-handle = <&ethphy1>;
++	status = "okay";
++	phy-reset-gpios = <&gpio2 15 GPIO_ACTIVE_LOW>;
++	phy-reset-duration = <11>;
++
++	mdio {
++		#address-cells = <1>;
++		#size-cells = <0>;
++
++		ethphy1: ethernet-phy at 1 {
++			compatible = "ethernet-phy-ieee802.3-c22";
++			reg = <1>;
++			max-speed = <100>;
++			interrupt-parent = <&gpio5>;
++			interrupts = <6 IRQ_TYPE_LEVEL_LOW 0>;
++		};
++	};
++};
++
++&i2c1 {
++	clock-frequency = <100000>;
++	pinctrl-names = "default";
++	pinctrl-0 = <&pinctrl_i2c1>;
++	status = "okay";
++
++	pmic: pfuze3000 at 08 {
++		compatible = "fsl,pfuze3000";
++		reg = <0x08>;
++
++		regulators {
++			/* VDD_ARM_SOC_IN*/
++			sw1b_reg: sw1b {
++				regulator-min-microvolt = <700000>;
++				regulator-max-microvolt = <1475000>;
++				regulator-boot-on;
++				regulator-always-on;
++				regulator-ramp-delay = <6250>;
++			};
++
++			/* DRAM */
++			sw3a_reg: sw3 {
++				regulator-min-microvolt = <900000>;
++				regulator-max-microvolt = <1650000>;
++				regulator-boot-on;
++				regulator-always-on;
++			};
++
++			/* DRAM */
++			vref_reg: vrefddr {
++				regulator-boot-on;
++				regulator-always-on;
++			};
++		};
++	};
++};
++
++&i2c2 {
++	clock_frequency = <100000>;
++	pinctrl-names = "default";
++	pinctrl-0 = <&pinctrl_i2c2>;
++	status = "okay";
++
++	codec: sgtl5000 at 0a {
++		reg = <0x0a>;
++		compatible = "fsl,sgtl5000";
++		clocks = <&sys_mclk>;
++		VDDA-supply = <&reg_2p5v>;
++		VDDIO-supply = <&reg_3p3v>;
++	};
++};
++
++&i2c3 {
++	clock_frequency = <100000>;
++	pinctrl-names = "default";
++	pinctrl-0 = <&pinctrl_i2c3>;
++	status = "okay";
++};
++
++&lcdif {
++	pinctrl-names = "default";
++	pinctrl-0 = <&pinctrl_lcdif_dat &pinctrl_lcdif_ctrl>;
++	display = <&display0>;
++	status = "okay";
++
++	display0: display0 {
++		bits-per-pixel = <32>;
++		bus-width = <24>;
++
++		display-timings {
++			native-mode = <&timing0>;
++
++			timing0: timing0 {
++				clock-frequency = <33200000>;
++				hactive = <800>;
++				vactive = <480>;
++				hfront-porch = <210>;
++				hback-porch = <46>;
++				hsync-len = <1>;
++				vback-porch = <22>;
++				vfront-porch = <23>;
++				vsync-len = <1>;
++				hsync-active = <0>;
++				vsync-active = <0>;
++				de-active = <1>;
++				pixelclk-active = <0>;
++			};
++		};
++	};
++};
++
++&pwm3 {
++	pinctrl-names = "default";
++	pinctrl-0 = <&pinctrl_pwm3>;
++	status = "okay";
++};
++
++&pwm7 {
++	pinctrl-names = "default";
++	pinctrl-0 = <&pinctrl_pwm7>;
++	status = "okay";
++};
++
++&pwm8 {
++	pinctrl-names = "default";
++	pinctrl-0 = <&pinctrl_pwm8>;
++	status = "okay";
++};
++
++&sai1 {
++	pinctrl-names = "default";
++	pinctrl-0 = <&pinctrl_sai1>;
++	status = "okay";
++};
++
++&uart3 {
++	pinctrl-names = "default";
++	pinctrl-0 = <&pinctrl_uart3>;
++	fsl,uart-has-rtscts;
++	status = "okay";
++};
++
++&uart6 {
++	pinctrl-names = "default";
++	pinctrl-0 = <&pinctrl_uart6>;
++	status = "okay";
++};
++
++&usbotg1 {
++	vbus-supply = <&reg_usb_otg_vbus>;
++	pinctrl-names = "default";
++	pinctrl-0 = <&pinctrl_usb_otg1_id>;
++	dr_mode = "otg";
++	disable-over-current;
++	status = "okay";
++};
++
++&usbotg2 {
++	dr_mode = "host";
++	disable-over-current;
++	status = "okay";
++};
++
++&usdhc1 {
++	pinctrl-names = "default";
++	pinctrl-0 = <&pinctrl_usdhc1>;
++	bus-width = <8>;
++	no-1-8-v;
++	non-removable;
++	keep-power-in-suspend;
++	status = "okay";
++};
++
++&usdhc2 {  /* Wifi SDIO */
++	pinctrl-names = "default";
++	pinctrl-0 = <&pinctrl_usdhc2>;
++	no-1-8-v;
++	keep-power-in-suspend;
++	wakeup-source;
++	status = "okay";
++};
++
++&iomuxc {
++	pinctrl_enet2: enet2grp {
++		fsl,pins = <
++			MX6UL_PAD_ENET1_TX_DATA1__ENET2_MDIO	0x1b0b0
++			MX6UL_PAD_ENET1_TX_EN__ENET2_MDC	0x1b0b0
++			MX6UL_PAD_ENET2_RX_EN__ENET2_RX_EN	0x1b0b0
++			MX6UL_PAD_ENET2_RX_ER__ENET2_RX_ER	0x1b0b0
++			MX6UL_PAD_ENET2_RX_DATA0__ENET2_RDATA00	0x1b0b0
++			MX6UL_PAD_ENET2_RX_DATA1__ENET2_RDATA01	0x1b0b0
++			MX6UL_PAD_ENET2_TX_EN__ENET2_TX_EN	0x1b0b0
++			MX6UL_PAD_ENET2_TX_DATA0__ENET2_TDATA00	0x1b0b0
++			MX6UL_PAD_ENET2_TX_DATA1__ENET2_TDATA01	0x1b0b0
++			MX6UL_PAD_ENET2_TX_CLK__ENET2_REF_CLK2	0x4001b031
++			MX6UL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x800
++			MX6UL_PAD_UART4_TX_DATA__GPIO1_IO28	0x79
++		>;
++	};
++
++	pinctrl_flexcan1: flexcan1grp {
++		fsl,pins = <
++			MX6UL_PAD_ENET1_RX_DATA0__FLEXCAN1_TX	0x1b020
++			MX6UL_PAD_ENET1_RX_DATA1__FLEXCAN1_RX	0x1b020
++		>;
++	};
++
++	pinctrl_flexcan2: flexcan2grp {
++		fsl,pins = <
++			MX6UL_PAD_ENET1_TX_DATA0__FLEXCAN2_RX	0x1b020
++			MX6UL_PAD_ENET1_RX_EN__FLEXCAN2_TX	0x1b020
++		>;
++	};
++
++	pinctrl_i2c1: i2c1grp {
++		fsl,pins = <
++			MX6UL_PAD_GPIO1_IO02__I2C1_SCL		0x4001b8b0
++			MX6UL_PAD_GPIO1_IO03__I2C1_SDA		0x4001b8b0
++		>;
++	};
++
++	pinctrl_i2c2: i2c2grp {
++		fsl,pins = <
++			MX6UL_PAD_UART5_TX_DATA__I2C2_SCL	0x4001b8b0
++			MX6UL_PAD_UART5_RX_DATA__I2C2_SDA	0x4001b8b0
++		>;
++	};
++
++	pinctrl_i2c3: i2c3grp {
++		fsl,pins = <
++			MX6UL_PAD_UART1_TX_DATA__I2C3_SCL	0x4001b8b0
++			MX6UL_PAD_UART1_RX_DATA__I2C3_SDA	0x4001b8b0
++			>;
++	};
++
++	pinctrl_lcdif_dat: lcdifdatgrp {
++		fsl,pins = <
++			MX6UL_PAD_LCD_DATA00__LCDIF_DATA00	0x79
++			MX6UL_PAD_LCD_DATA01__LCDIF_DATA01	0x79
++			MX6UL_PAD_LCD_DATA02__LCDIF_DATA02	0x79
++			MX6UL_PAD_LCD_DATA03__LCDIF_DATA03	0x79
++			MX6UL_PAD_LCD_DATA04__LCDIF_DATA04	0x79
++			MX6UL_PAD_LCD_DATA05__LCDIF_DATA05	0x79
++			MX6UL_PAD_LCD_DATA06__LCDIF_DATA06	0x79
++			MX6UL_PAD_LCD_DATA07__LCDIF_DATA07	0x79
++			MX6UL_PAD_LCD_DATA08__LCDIF_DATA08	0x79
++			MX6UL_PAD_LCD_DATA09__LCDIF_DATA09	0x79
++			MX6UL_PAD_LCD_DATA10__LCDIF_DATA10	0x79
++			MX6UL_PAD_LCD_DATA11__LCDIF_DATA11	0x79
++			MX6UL_PAD_LCD_DATA12__LCDIF_DATA12	0x79
++			MX6UL_PAD_LCD_DATA13__LCDIF_DATA13	0x79
++			MX6UL_PAD_LCD_DATA14__LCDIF_DATA14	0x79
++			MX6UL_PAD_LCD_DATA15__LCDIF_DATA15	0x79
++			MX6UL_PAD_LCD_DATA16__LCDIF_DATA16	0x79
++			MX6UL_PAD_LCD_DATA17__LCDIF_DATA17	0x79
++			MX6UL_PAD_LCD_DATA18__LCDIF_DATA18	0x79
++			MX6UL_PAD_LCD_DATA19__LCDIF_DATA19	0x79
++			MX6UL_PAD_LCD_DATA20__LCDIF_DATA20	0x79
++			MX6UL_PAD_LCD_DATA21__LCDIF_DATA21	0x79
++			MX6UL_PAD_LCD_DATA22__LCDIF_DATA22	0x79
++			MX6UL_PAD_LCD_DATA23__LCDIF_DATA23	0x79
++		>;
++	};
++
++	pinctrl_lcdif_ctrl: lcdifctrlgrp {
++		fsl,pins = <
++			MX6UL_PAD_LCD_CLK__LCDIF_CLK		0x79
++			MX6UL_PAD_LCD_ENABLE__LCDIF_ENABLE	0x79
++			MX6UL_PAD_LCD_HSYNC__LCDIF_HSYNC	0x79
++			MX6UL_PAD_LCD_VSYNC__LCDIF_VSYNC	0x79
++			/* LCD reset */
++			MX6UL_PAD_SNVS_TAMPER9__GPIO5_IO09	0x79
++		>;
++	};
++
++	pinctrl_pwm3: pwm3grp {
++		fsl,pins = <
++			MX6UL_PAD_NAND_ALE__PWM3_OUT		0x110b0
++		>;
++	};
++
++	pinctrl_pwm7: pwm7grp {
++		fsl,pins = <
++			MX6UL_PAD_ENET1_TX_CLK__PWM7_OUT	0x110b0
++		>;
++	};
++
++	pinctrl_pwm8: pwm8grp {
++		fsl,pins = <
++			MX6UL_PAD_ENET1_RX_ER__PWM8_OUT		0x110b0
++		>;
++	};
++
++	pinctrl_sai1: sai1grp {
++		fsl,pins = <
++			MX6UL_PAD_CSI_DATA04__SAI1_TX_SYNC	0x1b0b0
++			MX6UL_PAD_CSI_DATA05__SAI1_TX_BCLK	0x1b0b0
++			MX6UL_PAD_CSI_DATA06__SAI1_RX_DATA	0x110b0
++			MX6UL_PAD_CSI_DATA07__SAI1_TX_DATA	0x1f0b8
++		>;
++	};
++
++	pinctrl_uart3: uart3grp {
++		fsl,pins = <
++			MX6UL_PAD_UART3_TX_DATA__UART3_DCE_TX	0x1b0b0
++			MX6UL_PAD_UART3_RX_DATA__UART3_DCE_RX	0x1b0b0
++			MX6UL_PAD_UART3_RTS_B__UART3_DCE_RTS	0x1b0b0
++			MX6UL_PAD_UART3_CTS_B__UART3_DCE_CTS	0x1b0b0
++		>;
++	};
++
++	pinctrl_uart5: uart5grp {
++		fsl,pins = <
++			MX6UL_PAD_GPIO1_IO04__UART5_DCE_TX	0x1b0b1
++			MX6UL_PAD_GPIO1_IO05__UART5_DCE_RX	0x1b0b1
++			MX6UL_PAD_GPIO1_IO08__UART5_DCE_RTS	0x1b0b1
++			MX6UL_PAD_GPIO1_IO09__UART5_DCE_CTS	0x1b0b1
++		>;
++	};
++
++	pinctrl_uart6: uart6grp {
++		fsl,pins = <
++			MX6UL_PAD_CSI_MCLK__UART6_DCE_TX	0x1b0b1
++			MX6UL_PAD_CSI_PIXCLK__UART6_DCE_RX	0x1b0b1
++		>;
++	};
++
++	pinctrl_usb_otg1: usbotg1grp {
++		fsl,pins = <
++			MX6UL_PAD_GPIO1_IO06__GPIO1_IO06	0x10b0
++			>;
++	};
++
++	pinctrl_usb_otg1_id: usbotg1idgrp {
++		fsl,pins = <
++			MX6UL_PAD_GPIO1_IO00__ANATOP_OTG1_ID	0x17059
++		>;
++	};
++
++	pinctrl_usdhc1: usdhc1grp {
++		fsl,pins = <
++			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x17059
++			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x10071
++			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x17059
++			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x17059
++			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x17059
++			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x17059
++			MX6UL_PAD_UART1_RTS_B__USDHC1_CD_B	0x03029
++			MX6UL_PAD_NAND_READY_B__USDHC1_DATA4	0x17059
++			MX6UL_PAD_NAND_CE0_B__USDHC1_DATA5	0x17059
++			MX6UL_PAD_NAND_CE1_B__USDHC1_DATA6	0x17059
++			MX6UL_PAD_NAND_CLE__USDHC1_DATA7	0x17059
++		>;
++	};
++
++	pinctrl_usdhc2: usdhc2grp {
++		fsl,pins = <
++			MX6UL_PAD_NAND_WE_B__USDHC2_CMD		0x17059
++			MX6UL_PAD_NAND_RE_B__USDHC2_CLK		0x10059
++			MX6UL_PAD_NAND_DATA00__USDHC2_DATA0	0x17059
++			MX6UL_PAD_NAND_DATA01__USDHC2_DATA1	0x17059
++			MX6UL_PAD_NAND_DATA02__USDHC2_DATA2	0x17059
++			MX6UL_PAD_NAND_DATA03__USDHC2_DATA3	0x17059
++		>;
++	};
++};
+-- 
+1.9.1
+
diff --git a/board/technexion/imx6ulpico/patches/uboot/0001-pico_add_hush.patch b/board/technexion/imx6ulpico/patches/uboot/0001-pico_add_hush.patch
new file mode 100644
index 0000000..d3798f9
--- /dev/null
+++ b/board/technexion/imx6ulpico/patches/uboot/0001-pico_add_hush.patch
@@ -0,0 +1,37 @@
+From 451222db5a05c14cc5f0ba8919af69e57106b676 Mon Sep 17 00:00:00 2001
+From: Fabio Estevam <fabio.estevam@nxp.com>
+Date: Tue, 17 May 2016 10:33:39 -0300
+Subject: [PATCH v2] pico-imx6ul: Select CONFIG_HUSH_PARSER option
+
+Select CONFIG_HUSH_PARSER option in order to fix the following
+problem:
+
+Unknown command 'if' - try 'help'
+Unknown command 'then' - try 'help'
+Unknown command 'else' - try 'help'
+Unknown command 'fi' - try 'help'
+
+Reported-by: Daiane Angolini <daiane.angolini@nxp.com>
+Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
+---
+Changes since v1:
+- Remove extra whitespaces in the error messages (Daiane)
+
+ configs/pico-imx6ul_defconfig | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configs/pico-imx6ul_defconfig b/configs/pico-imx6ul_defconfig
+index cc49dc9..d46cd3b 100644
+--- a/configs/pico-imx6ul_defconfig
++++ b/configs/pico-imx6ul_defconfig
+@@ -2,6 +2,7 @@ CONFIG_ARM=y
+ CONFIG_ARCH_MX6=y
+ CONFIG_TARGET_PICO_IMX6UL=y
+ CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/technexion/pico-imx6ul/imximage.cfg"
++CONFIG_HUSH_PARSER=y
+ CONFIG_CMD_BOOTZ=y
+ # CONFIG_CMD_IMLS is not set
+ CONFIG_CMD_MEMTEST=y
+-- 
+1.9.1
+
diff --git a/board/technexion/imx6ulpico/post-image.sh b/board/technexion/imx6ulpico/post-image.sh
new file mode 100755
index 0000000..b0917fc
--- /dev/null
+++ b/board/technexion/imx6ulpico/post-image.sh
@@ -0,0 +1,15 @@
+#!/usr/bin/env bash
+
+GENIMAGE_CFG="board/technexion/imx6ulpico/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage \
+  --rootpath "${TARGET_DIR}" \
+  --tmppath "${GENIMAGE_TMP}" \
+  --inputpath "${BINARIES_DIR}" \
+  --outputpath "${BINARIES_DIR}" \
+  --config "${GENIMAGE_CFG}"
+
+exit $?
diff --git a/configs/imx6ulpico_defconfig b/configs/imx6ulpico_defconfig
new file mode 100644
index 0000000..8ca25e5
--- /dev/null
+++ b/configs/imx6ulpico_defconfig
@@ -0,0 +1,37 @@
+# architecture
+BR2_arm=y
+BR2_cortex_a7=y
+
+# patches
+BR2_GLOBAL_PATCH_DIR="board/technexion/imx6ulpico/patches/"
+
+# Linux headers same as kernel, a 4.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
+
+# system
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc5"
+
+# kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ul-pico-hobbit"
+
+# bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="pico-imx6ul"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.05"
+BR2_TARGET_UBOOT_FORMAT_IMX=y
+
+# required tools to create the eMMC image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
+# filesystem / image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/technexion/imx6ulpico/post-image.sh"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
-- 
1.9.1
