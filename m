From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Aug 2017 22:59:26 +0200
Subject: [Buildroot] [git commit branch/next] configs: Add support for
	imx7dpico board
Message-ID: <20170814205334.4893981D8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=384ba857771af619f1d3b007c31af29a64ae6a34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add support for imx7d-pico, which is a board based on NXP
i.MX7D processor.

For more information about this board, please visit:
http://www.technexion.org/products/pico/pico-som/pico-imx7-emmc

Signed-off-by: Vanessa Maegima <vanessa.maegima@nxp.com>
[Thomas:
 - add upstream references for the Linux kernel patches
 - fix typoes in readme.txt
 - remove audio-related packages in defconfig
 - regenerate .gitlab-ci.yml]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .gitlab-ci.yml                                     |   1 +
 ...01-ARM-dts-imx7d-pico-Add-initial-support.patch | 430 +++++++++++++++++++++
 ...2-ARM-dts-imx7d-pico-Add-watchdog-support.patch |  49 +++
 ...7d-pico-Pass-no-1-8-v-property-to-the-eMM.patch |  34 ++
 ...RM-dts-imx7-Fix-typo-in-watchdog-pin-name.patch |  90 +++++
 board/technexion/imx7dpico/readme.txt              |  59 +++
 configs/imx7dpico_defconfig                        |  36 ++
 7 files changed, 699 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 0ecff99..5adb4f9 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -121,6 +121,7 @@ imx23evk_defconfig: *defconfig
 imx6q-sabresd_defconfig: *defconfig
 imx6q-sabresd_qt5_defconfig: *defconfig
 imx6ulpico_defconfig: *defconfig
+imx7dpico_defconfig: *defconfig
 lego_ev3_defconfig: *defconfig
 linksprite_pcduino_defconfig: *defconfig
 minnowboard_max-graphical_defconfig: *defconfig
diff --git a/board/technexion/imx7dpico/patches/linux/0001-ARM-dts-imx7d-pico-Add-initial-support.patch b/board/technexion/imx7dpico/patches/linux/0001-ARM-dts-imx7d-pico-Add-initial-support.patch
new file mode 100644
index 0000000..f2f3561
--- /dev/null
+++ b/board/technexion/imx7dpico/patches/linux/0001-ARM-dts-imx7d-pico-Add-initial-support.patch
@@ -0,0 +1,430 @@
+From 23c787a99ff7b42f594722d60ea064534fe54a71 Mon Sep 17 00:00:00 2001
+From: Vanessa Maegima <vanessa.maegima@nxp.com>
+Date: Wed, 17 May 2017 14:06:36 -0300
+Subject: [PATCH] ARM: dts: imx7d-pico: Add initial support
+
+Add the initial support for imx7d-pico board.
+
+Add support for eMMC, USB host, USB device, PMIC, Ethernet and audio.
+
+For more information about this board, please visit:
+http://www.technexion.org/products/pico/pico-som/pico-imx7-emmc
+
+Signed-off-by: Vanessa Maegima <vanessa.maegima@nxp.com>
+Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
+Signed-off-by: Shawn Guo <shawnguo@kernel.org>
+Upstream: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=23c787a99ff7b42f594722d60ea064534fe54a71
+---
+ arch/arm/boot/dts/Makefile       |   1 +
+ arch/arm/boot/dts/imx7d-pico.dts | 387 +++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 388 insertions(+)
+ create mode 100644 arch/arm/boot/dts/imx7d-pico.dts
+
+diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
+index 7881aae..cc12670 100644
+--- a/arch/arm/boot/dts/Makefile
++++ b/arch/arm/boot/dts/Makefile
+@@ -478,6 +478,7 @@ dtb-$(CONFIG_SOC_IMX7D) += \
+ 	imx7d-cl-som-imx7.dtb \
+ 	imx7d-colibri-eval-v3.dtb \
+ 	imx7d-nitrogen7.dtb \
++	imx7d-pico.dtb \
+ 	imx7d-sbc-imx7.dtb \
+ 	imx7d-sdb.dtb \
+ 	imx7d-sdb-sht11.dtb \
+diff --git a/arch/arm/boot/dts/imx7d-pico.dts b/arch/arm/boot/dts/imx7d-pico.dts
+new file mode 100644
+index 0000000..ebda3df
+--- /dev/null
++++ b/arch/arm/boot/dts/imx7d-pico.dts
+@@ -0,0 +1,387 @@
++/*
++ * Copyright 2017 NXP
++ *
++ * This file is dual-licensed: you can use it either under the terms
++ * of the GPL or the X11 license, at your option. Note that this dual
++ * licensing only applies to this file, and not this project as a
++ * whole.
++ *
++ *  a) This file is free software; you can redistribute it and/or
++ *     modify it under the terms of the GNU General Public License as
++ *     published by the Free Software Foundation; either version 2 of the
++ *     License, or (at your option) any later version.
++ *
++ *     This file is distributed in the hope that it will be useful,
++ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
++ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ *     GNU General Public License for more details.
++ *
++ * Or, alternatively,
++ *
++ *  b) Permission is hereby granted, free of charge, to any person
++ *     obtaining a copy of this software and associated documentation
++ *     files (the "Software"), to deal in the Software without
++ *     restriction, including without limitation the rights to use,
++ *     copy, modify, merge, publish, distribute, sublicense, and/or
++ *     sell copies of the Software, and to permit persons to whom the
++ *     Software is furnished to do so, subject to the following
++ *     conditions:
++ *
++ *     The above copyright notice and this permission notice shall be
++ *     included in all copies or substantial portions of the Software.
++ *
++ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
++ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
++ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
++ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
++ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
++ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
++ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
++ *     OTHER DEALINGS IN THE SOFTWARE.
++ */
++
++/dts-v1/;
++
++#include "imx7d.dtsi"
++
++/ {
++	model = "Technexion Pico i.MX7D Board";
++	compatible = "technexion,imx7d-pico", "fsl,imx7d";
++
++	memory {
++		reg = <0x80000000 0x80000000>;
++	};
++
++	reg_2p5v: regulator-2p5v {
++		compatible = "regulator-fixed";
++		regulator-name = "2P5V";
++		regulator-min-microvolt = <2500000>;
++		regulator-max-microvolt = <2500000>;
++		regulator-always-on;
++	};
++
++	reg_3p3v: regulator-3p3v {
++		compatible = "regulator-fixed";
++		regulator-name = "3P3V";
++		regulator-min-microvolt = <3300000>;
++		regulator-max-microvolt = <3300000>;
++		regulator-always-on;
++	};
++
++	reg_usb_otg1_vbus: regulator-usb-otg1-vbus {
++		compatible = "regulator-fixed";
++		regulator-name = "usb_otg1_vbus";
++		regulator-min-microvolt = <5000000>;
++		regulator-max-microvolt = <5000000>;
++		gpio = <&gpio4 5 GPIO_ACTIVE_LOW>;
++	};
++
++	reg_usb_otg2_vbus: regulator-usb-otg2-vbus {
++		compatible = "regulator-fixed";
++		regulator-name = "usb_otg2_vbus";
++		regulator-min-microvolt = <5000000>;
++		regulator-max-microvolt = <5000000>;
++	};
++
++	reg_vref_1v8: regulator-vref-1v8 {
++		compatible = "regulator-fixed";
++		regulator-name = "vref-1v8";
++		regulator-min-microvolt = <1800000>;
++		regulator-max-microvolt = <1800000>;
++	};
++
++	sound {
++		compatible = "simple-audio-card";
++		simple-audio-card,name = "imx7-sgtl5000";
++		simple-audio-card,format = "i2s";
++		simple-audio-card,bitclock-master = <&dailink_master>;
++		simple-audio-card,frame-master = <&dailink_master>;
++		simple-audio-card,cpu {
++			sound-dai = <&sai1>;
++		};
++
++		dailink_master: simple-audio-card,codec {
++			sound-dai = <&codec>;
++			clocks = <&clks IMX7D_AUDIO_MCLK_ROOT_CLK>;
++		};
++	};
++};
++
++&fec1 {
++	pinctrl-names = "default";
++	pinctrl-0 = <&pinctrl_enet1>;
++	assigned-clocks = <&clks IMX7D_ENET1_TIME_ROOT_SRC>,
++			  <&clks IMX7D_ENET1_TIME_ROOT_CLK>;
++	assigned-clock-parents = <&clks IMX7D_PLL_ENET_MAIN_100M_CLK>;
++	assigned-clock-rates = <0>, <100000000>;
++	phy-mode = "rgmii";
++	phy-handle = <&ethphy0>;
++	fsl,magic-packet;
++	status = "okay";
++
++	mdio {
++		#address-cells = <1>;
++		#size-cells = <0>;
++
++		ethphy0: ethernet-phy at 1 {
++			compatible = "ethernet-phy-ieee802.3-c22";
++			reg = <1>;
++			status = "okay";
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
++	codec: sgtl5000 at 0a {
++		#sound-dai-cells = <0>;
++		reg = <0x0a>;
++		compatible = "fsl,sgtl5000";
++		clocks = <&clks IMX7D_AUDIO_MCLK_ROOT_CLK>;
++		VDDA-supply = <&reg_2p5v>;
++		VDDIO-supply = <&reg_vref_1v8>;
++	};
++};
++
++&i2c4 {
++	pinctrl-names = "default";
++	pinctrl-0 = <&pinctrl_i2c4>;
++	status = "okay";
++
++	pmic: pfuze3000 at 08 {
++		compatible = "fsl,pfuze3000";
++		reg = <0x08>;
++
++		regulators {
++			sw1a_reg: sw1a {
++				regulator-min-microvolt = <700000>;
++				regulator-max-microvolt = <3300000>;
++				regulator-boot-on;
++				regulator-always-on;
++				regulator-ramp-delay = <6250>;
++			};
++			/* use sw1c_reg to align with pfuze100/pfuze200 */
++			sw1c_reg: sw1b {
++				regulator-min-microvolt = <700000>;
++				regulator-max-microvolt = <1475000>;
++				regulator-boot-on;
++				regulator-always-on;
++				regulator-ramp-delay = <6250>;
++			};
++
++			sw2_reg: sw2 {
++				regulator-min-microvolt = <1800000>;
++				regulator-max-microvolt = <1850000>;
++				regulator-boot-on;
++				regulator-always-on;
++			};
++
++			sw3a_reg: sw3 {
++				regulator-min-microvolt = <900000>;
++				regulator-max-microvolt = <1650000>;
++				regulator-boot-on;
++				regulator-always-on;
++			};
++
++			swbst_reg: swbst {
++				regulator-min-microvolt = <5000000>;
++				regulator-max-microvolt = <5150000>;
++			};
++
++			snvs_reg: vsnvs {
++				regulator-min-microvolt = <1000000>;
++				regulator-max-microvolt = <3000000>;
++				regulator-boot-on;
++				regulator-always-on;
++			};
++
++			vref_reg: vrefddr {
++				regulator-boot-on;
++				regulator-always-on;
++			};
++
++			vgen1_reg: vldo1 {
++				regulator-min-microvolt = <1800000>;
++				regulator-max-microvolt = <3300000>;
++				regulator-always-on;
++			};
++
++			vgen2_reg: vldo2 {
++				regulator-min-microvolt = <800000>;
++				regulator-max-microvolt = <1550000>;
++			};
++
++			vgen3_reg: vccsd {
++				regulator-min-microvolt = <2850000>;
++				regulator-max-microvolt = <3300000>;
++				regulator-always-on;
++			};
++
++			vgen4_reg: v33 {
++				regulator-min-microvolt = <2850000>;
++				regulator-max-microvolt = <3300000>;
++				regulator-always-on;
++			};
++
++			vgen5_reg: vldo3 {
++				regulator-min-microvolt = <1800000>;
++				regulator-max-microvolt = <3300000>;
++				regulator-always-on;
++			};
++
++			vgen6_reg: vldo4 {
++				regulator-min-microvolt = <1800000>;
++				regulator-max-microvolt = <3300000>;
++				regulator-always-on;
++			};
++		};
++	};
++};
++
++&sai1 {
++	pinctrl-names = "default";
++	pinctrl-0 = <&pinctrl_sai1>;
++	assigned-clocks = <&clks IMX7D_SAI1_ROOT_SRC>,
++			  <&clks IMX7D_SAI1_ROOT_CLK>;
++	assigned-clock-parents = <&clks IMX7D_PLL_AUDIO_POST_DIV>;
++	assigned-clock-rates = <0>, <24576000>;
++	status = "okay";
++};
++
++&uart5 {
++	pinctrl-names = "default";
++	pinctrl-0 = <&pinctrl_uart5>;
++	assigned-clocks = <&clks IMX7D_UART5_ROOT_SRC>;
++	assigned-clock-parents = <&clks IMX7D_PLL_SYS_MAIN_240M_CLK>;
++	status = "okay";
++};
++
++&usbotg1 {
++	vbus-supply = <&reg_usb_otg1_vbus>;
++	status = "okay";
++};
++
++&usbotg2 {
++	vbus-supply = <&reg_usb_otg2_vbus>;
++	dr_mode = "host";
++	status = "okay";
++};
++
++&usdhc3 {
++	pinctrl-names = "default", "state_100mhz", "state_200mhz";
++	pinctrl-0 = <&pinctrl_usdhc3>;
++	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
++	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
++	assigned-clocks = <&clks IMX7D_USDHC3_ROOT_CLK>;
++	assigned-clock-rates = <400000000>;
++	bus-width = <8>;
++	fsl,tuning-step = <2>;
++	non-removable;
++	status = "okay";
++};
++
++&iomuxc {
++	pinctrl_enet1: enet1grp {
++		fsl,pins = <
++			MX7D_PAD_SD2_CD_B__ENET1_MDIO			0x3
++			MX7D_PAD_SD2_WP__ENET1_MDC			0x3
++			MX7D_PAD_ENET1_RGMII_TXC__ENET1_RGMII_TXC	0x1
++			MX7D_PAD_ENET1_RGMII_TD0__ENET1_RGMII_TD0	0x1
++			MX7D_PAD_ENET1_RGMII_TD1__ENET1_RGMII_TD1	0x1
++			MX7D_PAD_ENET1_RGMII_TD2__ENET1_RGMII_TD2	0x1
++			MX7D_PAD_ENET1_RGMII_TD3__ENET1_RGMII_TD3	0x1
++			MX7D_PAD_ENET1_RGMII_TX_CTL__ENET1_RGMII_TX_CTL	0x1
++			MX7D_PAD_ENET1_RGMII_RXC__ENET1_RGMII_RXC	0x1
++			MX7D_PAD_ENET1_RGMII_RD0__ENET1_RGMII_RD0	0x1
++			MX7D_PAD_ENET1_RGMII_RD1__ENET1_RGMII_RD1	0x1
++			MX7D_PAD_ENET1_RGMII_RD2__ENET1_RGMII_RD2	0x1
++			MX7D_PAD_ENET1_RGMII_RD3__ENET1_RGMII_RD3	0x1
++			MX7D_PAD_ENET1_RGMII_RX_CTL__ENET1_RGMII_RX_CTL	0x1
++		>;
++	};
++
++	pinctrl_i2c1: i2c1grp {
++		fsl,pins = <
++			MX7D_PAD_UART1_TX_DATA__I2C1_SDA	0x4000007f
++			MX7D_PAD_UART1_RX_DATA__I2C1_SCL	0x4000007f
++		>;
++	};
++
++	pinctrl_i2c4: i2c4grp {
++		fsl,pins = <
++			MX7D_PAD_SAI1_RX_BCLK__I2C4_SDA		0x4000007f
++			MX7D_PAD_SAI1_RX_SYNC__I2C4_SCL		0x4000007f
++		>;
++	};
++
++	pinctrl_sai1: sai1grp {
++		fsl,pins = <
++			MX7D_PAD_ENET1_RX_CLK__SAI1_TX_BCLK	0x1f
++			MX7D_PAD_ENET1_CRS__SAI1_TX_SYNC	0x1f
++			MX7D_PAD_ENET1_COL__SAI1_TX_DATA0	0x30
++			MX7D_PAD_ENET1_TX_CLK__SAI1_RX_DATA0	0x1f
++		>;
++	};
++
++	pinctrl_uart5: uart5grp {
++		fsl,pins = <
++			MX7D_PAD_I2C4_SDA__UART5_DCE_TX		0x79
++			MX7D_PAD_I2C4_SCL__UART5_DCE_RX		0x79
++		>;
++	};
++
++	pinctrl_usbotg1_pwr: usbotg_pwr {
++		fsl,pins = <
++			MX7D_PAD_UART3_TX_DATA__GPIO4_IO5	0x14
++		>;
++	};
++
++	pinctrl_usdhc3: usdhc3grp {
++		fsl,pins = <
++			MX7D_PAD_SD3_CMD__SD3_CMD		0x59
++			MX7D_PAD_SD3_CLK__SD3_CLK		0x19
++			MX7D_PAD_SD3_DATA0__SD3_DATA0		0x59
++			MX7D_PAD_SD3_DATA1__SD3_DATA1		0x59
++			MX7D_PAD_SD3_DATA2__SD3_DATA2		0x59
++			MX7D_PAD_SD3_DATA3__SD3_DATA3		0x59
++			MX7D_PAD_SD3_DATA4__SD3_DATA4		0x59
++			MX7D_PAD_SD3_DATA5__SD3_DATA5		0x59
++			MX7D_PAD_SD3_DATA6__SD3_DATA6		0x59
++			MX7D_PAD_SD3_DATA7__SD3_DATA7		0x59
++		>;
++	};
++
++	pinctrl_usdhc3_100mhz: usdhc3grp_100mhz {
++		fsl,pins = <
++			MX7D_PAD_SD3_CMD__SD3_CMD		0x5a
++			MX7D_PAD_SD3_CLK__SD3_CLK		0x1a
++			MX7D_PAD_SD3_DATA0__SD3_DATA0		0x5a
++			MX7D_PAD_SD3_DATA1__SD3_DATA1		0x5a
++			MX7D_PAD_SD3_DATA2__SD3_DATA2		0x5a
++			MX7D_PAD_SD3_DATA3__SD3_DATA3		0x5a
++			MX7D_PAD_SD3_DATA4__SD3_DATA4		0x5a
++			MX7D_PAD_SD3_DATA5__SD3_DATA5		0x5a
++			MX7D_PAD_SD3_DATA6__SD3_DATA6		0x5a
++			MX7D_PAD_SD3_DATA7__SD3_DATA7		0x5a
++		>;
++	};
++
++	pinctrl_usdhc3_200mhz: usdhc3grp_200mhz {
++		fsl,pins = <
++			MX7D_PAD_SD3_CMD__SD3_CMD		0x5b
++			MX7D_PAD_SD3_CLK__SD3_CLK		0x1b
++			MX7D_PAD_SD3_DATA0__SD3_DATA0		0x5b
++			MX7D_PAD_SD3_DATA1__SD3_DATA1		0x5b
++			MX7D_PAD_SD3_DATA2__SD3_DATA2		0x5b
++			MX7D_PAD_SD3_DATA3__SD3_DATA3		0x5b
++			MX7D_PAD_SD3_DATA4__SD3_DATA4		0x5b
++			MX7D_PAD_SD3_DATA5__SD3_DATA5		0x5b
++			MX7D_PAD_SD3_DATA6__SD3_DATA6		0x5b
++			MX7D_PAD_SD3_DATA7__SD3_DATA7		0x5b
++		>;
++	};
++};
+-- 
+2.7.4
+
diff --git a/board/technexion/imx7dpico/patches/linux/0002-ARM-dts-imx7d-pico-Add-watchdog-support.patch b/board/technexion/imx7dpico/patches/linux/0002-ARM-dts-imx7d-pico-Add-watchdog-support.patch
new file mode 100644
index 0000000..84128f5
--- /dev/null
+++ b/board/technexion/imx7dpico/patches/linux/0002-ARM-dts-imx7d-pico-Add-watchdog-support.patch
@@ -0,0 +1,49 @@
+From d1ceec2a8f6ab1b35c296c3339127adca1ace30b Mon Sep 17 00:00:00 2001
+From: Fabio Estevam <fabio.estevam@nxp.com>
+Date: Tue, 23 May 2017 12:16:08 -0300
+Subject: [PATCH] ARM: dts: imx7d-pico: Add watchdog support
+
+imx7d-pico has the WDOG1_B pin connected to the PMIC, so add the
+wdog1 node and use the 'fsl,ext-reset-output' property to
+properly describe it.
+
+Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
+Signed-off-by: Shawn Guo <shawnguo@kernel.org>
+Upstream: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d1ceec2a8f6ab1b35c296c3339127adca1ace30b
+---
+ arch/arm/boot/dts/imx7d-pico.dts | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/arch/arm/boot/dts/imx7d-pico.dts b/arch/arm/boot/dts/imx7d-pico.dts
+index ebda3df..f874352 100644
+--- a/arch/arm/boot/dts/imx7d-pico.dts
++++ b/arch/arm/boot/dts/imx7d-pico.dts
+@@ -284,6 +284,13 @@
+ 	status = "okay";
+ };
+ 
++&wdog1 {
++	pinctrl-names = "default";
++	pinctrl-0 = <&pinctrl_wdog>;
++	fsl,ext-reset-output;
++	status = "okay";
++};
++
+ &iomuxc {
+ 	pinctrl_enet1: enet1grp {
+ 		fsl,pins = <
+@@ -385,3 +392,11 @@
+ 		>;
+ 	};
+ };
++
++&iomuxc_lpsr {
++	pinctrl_wdog: wdoggrp {
++		fsl,pins = <
++			MX7D_PAD_LPSR_GPIO1_IO00__WDOD1_WDOG_B	0x74
++		>;
++	};
++};
+-- 
+2.7.4
+
diff --git a/board/technexion/imx7dpico/patches/linux/0003-ARM-dts-imx7d-pico-Pass-no-1-8-v-property-to-the-eMM.patch b/board/technexion/imx7dpico/patches/linux/0003-ARM-dts-imx7d-pico-Pass-no-1-8-v-property-to-the-eMM.patch
new file mode 100644
index 0000000..a23fbc1
--- /dev/null
+++ b/board/technexion/imx7dpico/patches/linux/0003-ARM-dts-imx7d-pico-Pass-no-1-8-v-property-to-the-eMM.patch
@@ -0,0 +1,34 @@
+From bdc111bd50cc1378e113647dc251689636986d84 Mon Sep 17 00:00:00 2001
+From: Fabio Estevam <fabio.estevam@nxp.com>
+Date: Tue, 23 May 2017 12:16:09 -0300
+Subject: [PATCH] ARM: dts: imx7d-pico: Pass 'no-1-8-v' property to the eMMC
+
+Currently the following eMMC error is seen:
+
+mmc1: mmc_select_hs200 failed, error -74
+
+On imx7d-pico the eMMC VCCQ is fixed at 3.15V, so pass the 'no-1-8-v'
+property to properly describe that 1.8V operation is not possible.
+
+Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
+Signed-off-by: Shawn Guo <shawnguo@kernel.org>
+Upstream: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bdc111bd50cc1378e113647dc251689636986d84
+---
+ arch/arm/boot/dts/imx7d-pico.dts | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/arch/arm/boot/dts/imx7d-pico.dts b/arch/arm/boot/dts/imx7d-pico.dts
+index f874352..79b5d83 100644
+--- a/arch/arm/boot/dts/imx7d-pico.dts
++++ b/arch/arm/boot/dts/imx7d-pico.dts
+@@ -279,6 +279,7 @@
+ 	assigned-clocks = <&clks IMX7D_USDHC3_ROOT_CLK>;
+ 	assigned-clock-rates = <400000000>;
+ 	bus-width = <8>;
++	no-1-8-v;
+ 	fsl,tuning-step = <2>;
+ 	non-removable;
+ 	status = "okay";
+-- 
+2.7.4
+
diff --git a/board/technexion/imx7dpico/patches/linux/0004-ARM-dts-imx7-Fix-typo-in-watchdog-pin-name.patch b/board/technexion/imx7dpico/patches/linux/0004-ARM-dts-imx7-Fix-typo-in-watchdog-pin-name.patch
new file mode 100644
index 0000000..8a2524a
--- /dev/null
+++ b/board/technexion/imx7dpico/patches/linux/0004-ARM-dts-imx7-Fix-typo-in-watchdog-pin-name.patch
@@ -0,0 +1,90 @@
+From 37de44f238d37c96ab1fec8c88b6d207f5b85635 Mon Sep 17 00:00:00 2001
+From: Fabio Estevam <fabio.estevam@nxp.com>
+Date: Sat, 27 May 2017 10:17:52 -0300
+Subject: [PATCH] ARM: dts: imx7: Fix typo in watchdog pin name
+
+Change "WDOD1" to "WDOG1" in watchdog pin names.
+
+Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
+Signed-off-by: Shawn Guo <shawnguo@kernel.org>
+Upstream: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=37de44f238d37c96ab1fec8c88b6d207f5b85635
+---
+ arch/arm/boot/dts/imx7d-nitrogen7.dts | 2 +-
+ arch/arm/boot/dts/imx7d-pico.dts      | 2 +-
+ arch/arm/boot/dts/imx7d-pinfunc.h     | 6 +++---
+ arch/arm/boot/dts/imx7d-sdb.dts       | 2 +-
+ arch/arm/boot/dts/imx7s-warp.dts      | 2 +-
+ 5 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/arch/arm/boot/dts/imx7d-nitrogen7.dts b/arch/arm/boot/dts/imx7d-nitrogen7.dts
+index dd40e49..e799830 100644
+--- a/arch/arm/boot/dts/imx7d-nitrogen7.dts
++++ b/arch/arm/boot/dts/imx7d-nitrogen7.dts
+@@ -738,7 +738,7 @@
+ 
+ 	pinctrl_wdog1: wdog1grp {
+ 		fsl,pins = <
+-			MX7D_PAD_LPSR_GPIO1_IO00__WDOD1_WDOG_B	0x75
++			MX7D_PAD_LPSR_GPIO1_IO00__WDOG1_WDOG_B	0x75
+ 		>;
+ 	};
+ };
+diff --git a/arch/arm/boot/dts/imx7d-pico.dts b/arch/arm/boot/dts/imx7d-pico.dts
+index 79b5d83..e78c2c9 100644
+--- a/arch/arm/boot/dts/imx7d-pico.dts
++++ b/arch/arm/boot/dts/imx7d-pico.dts
+@@ -397,7 +397,7 @@
+ &iomuxc_lpsr {
+ 	pinctrl_wdog: wdoggrp {
+ 		fsl,pins = <
+-			MX7D_PAD_LPSR_GPIO1_IO00__WDOD1_WDOG_B	0x74
++			MX7D_PAD_LPSR_GPIO1_IO00__WDOG1_WDOG_B	0x74
+ 		>;
+ 	};
+ };
+diff --git a/arch/arm/boot/dts/imx7d-pinfunc.h b/arch/arm/boot/dts/imx7d-pinfunc.h
+index f6f7e78..f2493bc 100644
+--- a/arch/arm/boot/dts/imx7d-pinfunc.h
++++ b/arch/arm/boot/dts/imx7d-pinfunc.h
+@@ -17,9 +17,9 @@
+ 
+ #define MX7D_PAD_LPSR_GPIO1_IO00__GPIO1_IO0                       0x0000 0x0030 0x0000 0x0 0x0
+ #define MX7D_PAD_LPSR_GPIO1_IO00__PWM4_OUT                        0x0000 0x0030 0x0000 0x1 0x0
+-#define MX7D_PAD_LPSR_GPIO1_IO00__WDOD1_WDOG_ANY                  0x0000 0x0030 0x0000 0x2 0x0
+-#define MX7D_PAD_LPSR_GPIO1_IO00__WDOD1_WDOG_B                    0x0000 0x0030 0x0000 0x3 0x0
+-#define MX7D_PAD_LPSR_GPIO1_IO00__WDOD1_WDOG__RST_B_DEB           0x0000 0x0030 0x0000 0x4 0x0
++#define MX7D_PAD_LPSR_GPIO1_IO00__WDOG1_WDOG_ANY                  0x0000 0x0030 0x0000 0x2 0x0
++#define MX7D_PAD_LPSR_GPIO1_IO00__WDOG1_WDOG_B                    0x0000 0x0030 0x0000 0x3 0x0
++#define MX7D_PAD_LPSR_GPIO1_IO00__WDOG1_WDOG__RST_B_DEB           0x0000 0x0030 0x0000 0x4 0x0
+ #define MX7D_PAD_LPSR_GPIO1_IO01__GPIO1_IO1                       0x0004 0x0034 0x0000 0x0 0x0
+ #define MX7D_PAD_LPSR_GPIO1_IO01__PWM1_OUT                        0x0004 0x0034 0x0000 0x1 0x0
+ #define MX7D_PAD_LPSR_GPIO1_IO01__CCM_ENET_REF_CLK3               0x0004 0x0034 0x0000 0x2 0x0
+diff --git a/arch/arm/boot/dts/imx7d-sdb.dts b/arch/arm/boot/dts/imx7d-sdb.dts
+index 77c400f..4a4b522 100644
+--- a/arch/arm/boot/dts/imx7d-sdb.dts
++++ b/arch/arm/boot/dts/imx7d-sdb.dts
+@@ -660,7 +660,7 @@
+ &iomuxc_lpsr {
+ 	pinctrl_wdog: wdoggrp {
+ 		fsl,pins = <
+-			MX7D_PAD_LPSR_GPIO1_IO00__WDOD1_WDOG_B		0x74
++			MX7D_PAD_LPSR_GPIO1_IO00__WDOG1_WDOG_B		0x74
+ 		>;
+ 	};
+ 
+diff --git a/arch/arm/boot/dts/imx7s-warp.dts b/arch/arm/boot/dts/imx7s-warp.dts
+index 8dfed85..07b63f8 100644
+--- a/arch/arm/boot/dts/imx7s-warp.dts
++++ b/arch/arm/boot/dts/imx7s-warp.dts
+@@ -443,7 +443,7 @@
+ &iomuxc_lpsr {
+ 	pinctrl_wdog: wdoggrp {
+ 		fsl,pins = <
+-			MX7D_PAD_LPSR_GPIO1_IO00__WDOD1_WDOG_B	0x74
++			MX7D_PAD_LPSR_GPIO1_IO00__WDOG1_WDOG_B	0x74
+ 		>;
+ 	};
+ };
+-- 
+2.7.4
+
diff --git a/board/technexion/imx7dpico/readme.txt b/board/technexion/imx7dpico/readme.txt
new file mode 100644
index 0000000..cda3f28
--- /dev/null
+++ b/board/technexion/imx7dpico/readme.txt
@@ -0,0 +1,59 @@
+****************************
+Technexion i.MX7D Pico board
+****************************
+
+This file documents the Buildroot support for the Technexion i.MX7D Pico board.
+
+Build
+=====
+
+First, configure Buildroot for the i.MX7D Pico board:
+
+  make imx7dpico_defconfig
+
+Build all components:
+
+  make
+
+You will find in output/images/ the following files:
+  - imx7d-pico.dtb
+  - rootfs.ext4
+  - rootfs.tar
+  - sdcard.img
+  - u-boot.imx
+  - zImage
+
+Flash the eMMC
+==============
+
+In the U-Boot prompt lauch:
+
+=> ums 0 mmc 0
+
+This will mount the eMMC content in the host PC as a mass storage device.
+
+To determine the device associated to the eMMC card have a look in the
+/proc/partitions file:
+
+  cat /proc/partitions
+
+Buildroot prepares a bootable "sdcard.img" image in the output/images/
+directory, ready to be dumped on the eMMC card. Launch the following
+command as root:
+
+  dd if=output/images/sdcard.img of=/dev/<your-sd-device>
+
+*** WARNING! This will destroy all the eMMC content. Use with care! ***
+
+For details about the medium image layout, see the definition in
+board/freescale/common/imx/genimage.cfg.template.
+
+Boot the i.MX7D Pico board
+==========================
+
+To boot your newly created system:
+- put a micro USB cable into the Debug USB Port and connect using a terminal
+  emulator at 115200 bps, 8n1;
+- power on the board.
+
+Enjoy!
diff --git a/configs/imx7dpico_defconfig b/configs/imx7dpico_defconfig
new file mode 100644
index 0000000..72abfdf
--- /dev/null
+++ b/configs/imx7dpico_defconfig
@@ -0,0 +1,36 @@
+# architecture
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
+
+# Linux headers same as kernel, a 4.12 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_12=y
+
+# system
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc4"
+
+# kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.12"
+BR2_LINUX_KERNEL_PATCH="board/technexion/imx7dpico/patches/linux"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7d-pico"
+
+# bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="pico-imx7d"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07"
+BR2_TARGET_UBOOT_FORMAT_IMX=y
+
+# required tools to create the eMMC image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
+# filesystem / image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
