From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Dec 2016 19:43:49 +0100
Subject: [Buildroot] [git commit] mx6sx: Add support for mx6sx udoo neo
	boards
Message-ID: <20161213184951.581B48186B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c5255422538103afa1acba50c54f81bcf07d7a0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for mx6sx udoo neo boards. For more information about these
boards, please check:
http://www.udoo.org/udoo-neo

The U-Boot and kernel dts patches will be removed when we bump U-Boot
to 2017.01 and kernel to 4.10 version as they have already been sent
upstream.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/udoo/neo/boot.scr.txt                        |   7 +
 board/udoo/neo/genimage.cfg                        |  31 +
 .../neo/patches/linux/0001-udoo_neo_support.patch  | 560 +++++++++++++++++
 board/udoo/neo/patches/uboot/0001-udoo.patch       | 691 +++++++++++++++++++++
 board/udoo/neo/post-build.sh                       |   8 +
 board/udoo/neo/post-image.sh                       |  15 +
 board/udoo/neo/readme.txt                          |  16 +
 configs/mx6sx_udoo_neo_defconfig                   |  29 +
 8 files changed, 1357 insertions(+)

diff --git a/board/udoo/neo/boot.scr.txt b/board/udoo/neo/boot.scr.txt
new file mode 100644
index 0000000..f647db3
--- /dev/null
+++ b/board/udoo/neo/boot.scr.txt
@@ -0,0 +1,7 @@
+setenv finduuid "part uuid mmc 0:1 uuid"
+run finduuid
+run findfdt
+setenv bootargs "console=ttymxc0,115200 root=PARTUUID=${uuid} rootwait rootfstype=ext4"
+load mmc 0:1 ${fdt_addr} boot/${fdt_file}
+load mmc 0:1 ${loadaddr} boot/zImage
+bootz ${loadaddr} - ${fdt_addr}
diff --git a/board/udoo/neo/genimage.cfg b/board/udoo/neo/genimage.cfg
new file mode 100644
index 0000000..1f7edf4
--- /dev/null
+++ b/board/udoo/neo/genimage.cfg
@@ -0,0 +1,31 @@
+# Minimal SD card image for the MX6SX Udoo Neo board
+#
+# The SD card must have at least 1 MB free at the beginning.
+# U-Boot and its environment are dumped as is.
+# A single root filesystem partition is required (Ext4 in this case).
+#
+# For details about the layout, see:
+# http://wiki.wandboard.org/index.php/Boot-process
+
+image sdcard.img {
+  hdimage {
+  }
+
+  partition spl {
+    in-partition-table = "no"
+    image = "SPL"
+    offset = 1K
+  }
+
+  partition u-boot {
+    in-partition-table = "no"
+    image = "u-boot.img"
+    offset = 69K
+  }
+
+  partition rootfs {
+    partition-type = 0x83
+    image = "rootfs.ext4"
+    size = 512M
+  }
+}
diff --git a/board/udoo/neo/patches/linux/0001-udoo_neo_support.patch b/board/udoo/neo/patches/linux/0001-udoo_neo_support.patch
new file mode 100644
index 0000000..2e8cea5
--- /dev/null
+++ b/board/udoo/neo/patches/linux/0001-udoo_neo_support.patch
@@ -0,0 +1,560 @@
+From 76e691fc7653b85d390e58710e5c7db73ca49367 Mon Sep 17 00:00:00 2001
+From: Andreas F??rber <afaerber@suse.de>
+Date: Sun, 16 Oct 2016 16:44:23 +0200
+Subject: ARM: dts: imx6sx: Add UDOO Neo support
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Add initial device trees for UDOO Neo Basic, Extended and Full boards:
+* Serial console is enabled, other serial ports are prepared.
+* I2C based PMIC is enabled.
+* Ethernet is enabled for Basic and Full.
+* SDHC is enabled, with the SDIO_PWR GPIO modeled as a regulator.
+* Both user LEDs are enabled, with the orange one reserved for the M4
+  and with the SD card as default trigger for the red LED.
+
+The decision on a board compatible string is deferred to later.
+
+Cc: Ettore Chimenti <ettore.chimenti@udoo.org>
+Signed-off-by: Andreas F??rber <afaerber@suse.de>
+Signed-off-by: Shawn Guo <shawnguo@kernel.org>
+---
+ arch/arm/boot/dts/Makefile                     |   5 +-
+ arch/arm/boot/dts/imx6sx-udoo-neo-basic.dts    |  69 ++++++
+ arch/arm/boot/dts/imx6sx-udoo-neo-extended.dts |  54 +++++
+ arch/arm/boot/dts/imx6sx-udoo-neo-full.dts     |  69 ++++++
+ arch/arm/boot/dts/imx6sx-udoo-neo.dtsi         | 293 +++++++++++++++++++++++++
+ 5 files changed, 489 insertions(+), 1 deletion(-)
+ create mode 100644 arch/arm/boot/dts/imx6sx-udoo-neo-basic.dts
+ create mode 100644 arch/arm/boot/dts/imx6sx-udoo-neo-extended.dts
+ create mode 100644 arch/arm/boot/dts/imx6sx-udoo-neo-full.dts
+ create mode 100644 arch/arm/boot/dts/imx6sx-udoo-neo.dtsi
+
+diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
+index 019976b..da0197d 100644
+--- a/arch/arm/boot/dts/Makefile
++++ b/arch/arm/boot/dts/Makefile
+@@ -417,7 +417,10 @@ dtb-$(CONFIG_SOC_IMX6SX) += \
+ 	imx6sx-sabreauto.dtb \
+ 	imx6sx-sdb-reva.dtb \
+ 	imx6sx-sdb-sai.dtb \
+-	imx6sx-sdb.dtb
++	imx6sx-sdb.dtb \
++	imx6sx-udoo-neo-basic.dtb \
++	imx6sx-udoo-neo-extended.dtb \
++	imx6sx-udoo-neo-full.dtb
+ dtb-$(CONFIG_SOC_IMX6UL) += \
+ 	imx6ul-14x14-evk.dtb \
+ 	imx6ul-geam-kit.dtb \
+diff --git a/arch/arm/boot/dts/imx6sx-udoo-neo-basic.dts b/arch/arm/boot/dts/imx6sx-udoo-neo-basic.dts
+new file mode 100644
+index 0000000..0b88878
+--- /dev/null
++++ b/arch/arm/boot/dts/imx6sx-udoo-neo-basic.dts
+@@ -0,0 +1,69 @@
++/*
++ * Copyright (c) 2016 Andreas F??rber
++ *
++ * This file is dual-licensed: you can use it either under the terms
++ * of the GPL or the X11 license, at your option. Note that this dual
++ * licensing only applies to this file, and not this project as a
++ * whole.
++ *
++ *  a) This library is free software; you can redistribute it and/or
++ *     modify it under the terms of the GNU General Public License as
++ *     published by the Free Software Foundation; either version 2 of the
++ *     License, or (at your option) any later version.
++ *
++ *     This library is distributed in the hope that it will be useful,
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
++#include "imx6sx-udoo-neo.dtsi"
++
++/ {
++	model = "UDOO Neo Basic";
++	compatible = "fsl,imx6sx";
++
++	memory {
++		reg = <0x80000000 0x20000000>;
++	};
++};
++
++&fec1 {
++	phy-handle = <&ethphy1>;
++	status = "okay";
++
++	mdio {
++		#address-cells = <1>;
++		#size-cells = <0>;
++
++		ethphy1: ethernet-phy at 0 {
++			compatible = "ethernet-phy-ieee802.3-c22";
++			reg = <0>;
++		};
++	};
++};
+diff --git a/arch/arm/boot/dts/imx6sx-udoo-neo-extended.dts b/arch/arm/boot/dts/imx6sx-udoo-neo-extended.dts
+new file mode 100644
+index 0000000..d6fdd17
+--- /dev/null
++++ b/arch/arm/boot/dts/imx6sx-udoo-neo-extended.dts
+@@ -0,0 +1,54 @@
++/*
++ * Copyright (c) 2016 Andreas F??rber
++ *
++ * This file is dual-licensed: you can use it either under the terms
++ * of the GPL or the X11 license, at your option. Note that this dual
++ * licensing only applies to this file, and not this project as a
++ * whole.
++ *
++ *  a) This library is free software; you can redistribute it and/or
++ *     modify it under the terms of the GNU General Public License as
++ *     published by the Free Software Foundation; either version 2 of the
++ *     License, or (at your option) any later version.
++ *
++ *     This library is distributed in the hope that it will be useful,
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
++#include "imx6sx-udoo-neo.dtsi"
++
++/ {
++	model = "UDOO Neo Extended";
++	compatible = "fsl,imx6sx";
++
++	memory {
++		reg = <0x80000000 0x40000000>;
++	};
++};
+diff --git a/arch/arm/boot/dts/imx6sx-udoo-neo-full.dts b/arch/arm/boot/dts/imx6sx-udoo-neo-full.dts
+new file mode 100644
+index 0000000..d8c3577
+--- /dev/null
++++ b/arch/arm/boot/dts/imx6sx-udoo-neo-full.dts
+@@ -0,0 +1,69 @@
++/*
++ * Copyright (c) 2016 Andreas F??rber
++ *
++ * This file is dual-licensed: you can use it either under the terms
++ * of the GPL or the X11 license, at your option. Note that this dual
++ * licensing only applies to this file, and not this project as a
++ * whole.
++ *
++ *  a) This library is free software; you can redistribute it and/or
++ *     modify it under the terms of the GNU General Public License as
++ *     published by the Free Software Foundation; either version 2 of the
++ *     License, or (at your option) any later version.
++ *
++ *     This library is distributed in the hope that it will be useful,
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
++#include "imx6sx-udoo-neo.dtsi"
++
++/ {
++	model = "UDOO Neo Full";
++	compatible = "fsl,imx6sx";
++
++	memory {
++		reg = <0x80000000 0x40000000>;
++	};
++};
++
++&fec1 {
++	phy-handle = <&ethphy1>;
++	status = "okay";
++
++	mdio {
++		#address-cells = <1>;
++		#size-cells = <0>;
++
++		ethphy1: ethernet-phy at 0 {
++			compatible = "ethernet-phy-ieee802.3-c22";
++			reg = <0>;
++		};
++	};
++};
+diff --git a/arch/arm/boot/dts/imx6sx-udoo-neo.dtsi b/arch/arm/boot/dts/imx6sx-udoo-neo.dtsi
+new file mode 100644
+index 0000000..2b65d26
+--- /dev/null
++++ b/arch/arm/boot/dts/imx6sx-udoo-neo.dtsi
+@@ -0,0 +1,293 @@
++/*
++ * Copyright (c) 2016 Andreas F??rber
++ *
++ * This file is dual-licensed: you can use it either under the terms
++ * of the GPL or the X11 license, at your option. Note that this dual
++ * licensing only applies to this file, and not this project as a
++ * whole.
++ *
++ *  a) This library is free software; you can redistribute it and/or
++ *     modify it under the terms of the GNU General Public License as
++ *     published by the Free Software Foundation; either version 2 of the
++ *     License, or (at your option) any later version.
++ *
++ *     This library is distributed in the hope that it will be useful,
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
++#include "imx6sx.dtsi"
++
++/ {
++	compatible = "fsl,imx6sx";
++
++	chosen {
++		stdout-path = "serial0:115200n8";
++	};
++
++	leds {
++		compatible = "gpio-leds";
++
++		red {
++			label = "udoo-neo:red:mmc";
++			gpios = <&gpio6 0 GPIO_ACTIVE_HIGH>;
++			default-state = "off";
++			linux,default-trigger = "mmc0";
++		};
++
++		orange {
++			label = "udoo-neo:orange:user";
++			gpios = <&gpio4 6 GPIO_ACTIVE_HIGH>;
++			default-state = "keep";
++		};
++	};
++
++	reg_sdio_pwr: regulator-sdio-pwr {
++		compatible = "regulator-fixed";
++		gpio = <&gpio6 1 GPIO_ACTIVE_HIGH>;
++		enable-active-high;
++		regulator-name = "SDIO_PWR";
++		regulator-min-microvolt = <3300000>;
++		regulator-max-microvolt = <3300000>;
++		regulator-boot-on;
++	};
++};
++
++&cpu0 {
++	arm-supply = <&sw1a_reg>;
++	soc-supply = <&sw1c_reg>;
++};
++
++&fec1 {
++	pinctrl-names = "default";
++	pinctrl-0 = <&pinctrl_enet1>;
++	phy-mode = "rmii";
++	phy-reset-gpios = <&gpio2 1 GPIO_ACTIVE_LOW>;
++};
++
++&i2c1 {
++	pinctrl-names = "default";
++	pinctrl-0 = <&pinctrl_i2c1>;
++	clock-frequency = <100000>;
++	status = "okay";
++
++	pmic: pmic at 08 {
++		compatible = "fsl,pfuze3000";
++		reg = <0x08>;
++
++		regulators {
++			sw1a_reg: sw1a {
++				regulator-min-microvolt = <700000>;
++				regulator-max-microvolt = <1475000>;
++				regulator-boot-on;
++				regulator-always-on;
++				regulator-ramp-delay = <6250>;
++			};
++
++			sw1c_reg: sw1b {
++				regulator-min-microvolt = <700000>;
++				regulator-max-microvolt = <1475000>;
++				regulator-boot-on;
++				regulator-always-on;
++				regulator-ramp-delay = <6250>;
++			};
++
++			sw2_reg: sw2 {
++				regulator-min-microvolt = <1500000>;
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
++&iomuxc {
++	pinctrl_enet1: enet1grp {
++		fsl,pins =
++			<MX6SX_PAD_ENET1_CRS__GPIO2_IO_1	0xa0b1>,
++			<MX6SX_PAD_ENET1_MDC__ENET1_MDC		0xa0b1>,
++			<MX6SX_PAD_ENET1_MDIO__ENET1_MDIO	0xa0b1>,
++			<MX6SX_PAD_RGMII1_TD0__ENET1_TX_DATA_0	0xa0b1>,
++			<MX6SX_PAD_RGMII1_TD1__ENET1_TX_DATA_1	0xa0b1>,
++			<MX6SX_PAD_RGMII1_TX_CTL__ENET1_TX_EN	0xa0b1>,
++
++			<MX6SX_PAD_ENET1_TX_CLK__ENET1_REF_CLK1	0x3081>,
++			<MX6SX_PAD_ENET2_TX_CLK__GPIO2_IO_9	0x3081>,
++			<MX6SX_PAD_RGMII1_RD0__ENET1_RX_DATA_0	0x3081>,
++			<MX6SX_PAD_RGMII1_RD1__ENET1_RX_DATA_1	0x3081>,
++			<MX6SX_PAD_RGMII1_RX_CTL__ENET1_RX_EN	0x3081>,
++			<MX6SX_PAD_RGMII1_RXC__ENET1_RX_ER	0x3081>,
++
++			<MX6SX_PAD_ENET2_RX_CLK__ENET2_REF_CLK_25M	0x91>;
++	};
++
++	pinctrl_i2c1: i2c1grp {
++		fsl,pins =
++			<MX6SX_PAD_GPIO1_IO00__I2C1_SCL		0x4001b8b1>,
++			<MX6SX_PAD_GPIO1_IO01__I2C1_SDA		0x4001b8b1>;
++	};
++
++	pinctrl_uart1: uart1grp {
++		fsl,pins =
++			<MX6SX_PAD_GPIO1_IO04__UART1_TX		0x1b0b1>,
++			<MX6SX_PAD_GPIO1_IO05__UART1_RX		0x1b0b1>;
++	};
++
++	pinctrl_uart2: uart2grp {
++		fsl,pins =
++			<MX6SX_PAD_GPIO1_IO06__UART2_TX		0x1b0b1>,
++			<MX6SX_PAD_GPIO1_IO07__UART2_RX		0x1b0b1>;
++	};
++
++	pinctrl_uart5: uart5grp {
++		fsl,pins =
++			<MX6SX_PAD_SD4_DATA4__UART5_RX		0x1b0b1>,
++			<MX6SX_PAD_SD4_DATA5__UART5_TX		0x1b0b1>;
++	};
++
++	pinctrl_uart6: uart6grp {
++		fsl,pins =
++			<MX6SX_PAD_CSI_DATA00__UART6_RI_B	0x1b0b1>,
++			<MX6SX_PAD_CSI_DATA01__UART6_DSR_B	0x1b0b1>,
++			<MX6SX_PAD_CSI_DATA02__UART6_DTR_B	0x1b0b1>,
++			<MX6SX_PAD_CSI_DATA03__UART6_DCD_B	0x1b0b1>,
++			<MX6SX_PAD_CSI_DATA04__UART6_RX		0x1b0b1>,
++			<MX6SX_PAD_CSI_DATA05__UART6_TX		0x1b0b1>,
++			<MX6SX_PAD_CSI_DATA06__UART6_RTS_B	0x1b0b1>,
++			<MX6SX_PAD_CSI_DATA07__UART6_CTS_B	0x1b0b1>;
++	};
++
++	pinctrl_usdhc2: usdhc2grp {
++		fsl,pins =
++			<MX6SX_PAD_SD2_CMD__USDHC2_CMD		0x17059>,
++			<MX6SX_PAD_SD2_CLK__USDHC2_CLK		0x10059>,
++			<MX6SX_PAD_SD2_DATA0__USDHC2_DATA0	0x17059>,
++			<MX6SX_PAD_SD2_DATA1__USDHC2_DATA1	0x17059>,
++			<MX6SX_PAD_SD2_DATA2__USDHC2_DATA2	0x17059>,
++			<MX6SX_PAD_SD2_DATA3__USDHC2_DATA3	0x17059>,
++			<MX6SX_PAD_SD1_DATA0__GPIO6_IO_2	0x17059>; /* CD */
++	};
++};
++
++&uart1 {
++	pinctrl-names = "default";
++	pinctrl-0 = <&pinctrl_uart1>;
++	status = "okay";
++};
++
++/* Cortex-M4 serial */
++&uart2 {
++	pinctrl-names = "default";
++	pinctrl-0 = <&pinctrl_uart2>;
++	status = "disabled";
++};
++
++/* Arduino serial */
++&uart5 {
++	pinctrl-names = "default";
++	pinctrl-0 = <&pinctrl_uart5>;
++	status = "disabled";
++};
++
++&uart6 {
++	pinctrl-names = "default";
++	pinctrl-0 = <&pinctrl_uart6>;
++	uart-has-rtscts;
++	status = "disabled";
++};
++
++&usdhc2 {
++	pinctrl-names = "default";
++	pinctrl-0 = <&pinctrl_usdhc2>;
++	vmmc-supply = <&reg_sdio_pwr>;
++	bus-width = <4>;
++	cd-gpios = <&gpio6 2 GPIO_ACTIVE_LOW>;
++	no-1-8-v;
++	keep-power-in-suspend;
++	wakeup-source;
++	status = "okay";
++};
+-- 
+cgit v0.12
diff --git a/board/udoo/neo/patches/uboot/0001-udoo.patch b/board/udoo/neo/patches/uboot/0001-udoo.patch
new file mode 100644
index 0000000..ec1e00d
--- /dev/null
+++ b/board/udoo/neo/patches/uboot/0001-udoo.patch
@@ -0,0 +1,691 @@
+From 792f186846672140deca7dfbf2f20aece26b5348 Mon Sep 17 00:00:00 2001
+From: Breno Lima <breno.lima@nxp.com>
+Date: Fri, 25 Nov 2016 16:56:57 -0200
+Subject: [PATCH] mx6sx: Add initial support for UDOO Neo Board
+
+UDOO Neo Board is a development board from Seco that has three models:
+ - UDOO Neo Basic
+ - UDOO Neo Basic Kick Starter
+ - UDOO Neo Extended
+ - UDOO Neo Full
+
+All versions are based on the i.MX6 SoloX processor.
+
+For more details about the UDOO Neo board, please refer to:
+http://www.udoo.org/udoo-neo/
+
+This work is based on a previous commit of Francesco Montefoschi
+<francesco.monte@gmail.com>:
+https://github.com/fmntf/u-boot/commit/877b71184a5105e708024f232d36aed574961844
+
+Only tested on the UDOO Neo Full board.
+
+Signed-off-by: Breno Lima <breno.lima@nxp.com>
+Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
+---
+ arch/arm/cpu/armv7/mx6/Kconfig |    5 +
+ board/udoo/neo/Kconfig         |   12 ++
+ board/udoo/neo/MAINTAINERS     |    7 +
+ board/udoo/neo/Makefile        |    6 +
+ board/udoo/neo/neo.c           |  441 ++++++++++++++++++++++++++++++++++++++++
+ configs/udoo_neo_defconfig     |   30 +++
+ include/configs/udoo_neo.h     |   94 +++++++++
+ 7 files changed, 595 insertions(+)
+ create mode 100644 board/udoo/neo/Kconfig
+ create mode 100644 board/udoo/neo/MAINTAINERS
+ create mode 100644 board/udoo/neo/Makefile
+ create mode 100644 board/udoo/neo/neo.c
+ create mode 100644 configs/udoo_neo_defconfig
+ create mode 100644 include/configs/udoo_neo.h
+
+diff --git a/arch/arm/cpu/armv7/mx6/Kconfig b/arch/arm/cpu/armv7/mx6/Kconfig
+index 8b2217e..a81d944 100644
+--- a/arch/arm/cpu/armv7/mx6/Kconfig
++++ b/arch/arm/cpu/armv7/mx6/Kconfig
+@@ -200,6 +200,10 @@ config TARGET_UDOO
+ 	bool "udoo"
+ 	select SUPPORT_SPL
+ 
++config TARGET_UDOO_NEO
++	bool "UDOO Neo"
++	select SUPPORT_SPL
++
+ config TARGET_WANDBOARD
+ 	bool "wandboard"
+ 	select SUPPORT_SPL
+@@ -261,6 +265,7 @@ source "board/technexion/pico-imx6ul/Kconfig"
+ source "board/tbs/tbs2910/Kconfig"
+ source "board/tqc/tqma6/Kconfig"
+ source "board/udoo/Kconfig"
++source "board/udoo/neo/Kconfig"
+ source "board/wandboard/Kconfig"
+ source "board/warp/Kconfig"
+ 
+diff --git a/board/udoo/neo/Kconfig b/board/udoo/neo/Kconfig
+new file mode 100644
+index 0000000..8f474df
+--- /dev/null
++++ b/board/udoo/neo/Kconfig
+@@ -0,0 +1,12 @@
++if TARGET_UDOO_NEO
++
++config SYS_VENDOR
++	default "udoo"
++
++config SYS_BOARD
++	default "neo"
++
++config SYS_CONFIG_NAME
++	default "udoo_neo"
++
++endif
+diff --git a/board/udoo/neo/MAINTAINERS b/board/udoo/neo/MAINTAINERS
+new file mode 100644
+index 0000000..743fe33
+--- /dev/null
++++ b/board/udoo/neo/MAINTAINERS
+@@ -0,0 +1,7 @@
++UDOO NEO BOARD
++M:	Breno Lima <breno.lima@nxp.com>
++M:	Francesco Montefoschi <francesco.montefoschi@udoo.org>
++S:	Maintained
++F:	board/udoo/neo/
++F:	include/configs/udoo_neo.h
++F:	configs/udoo_neo_defconfig
+diff --git a/board/udoo/neo/Makefile b/board/udoo/neo/Makefile
+new file mode 100644
+index 0000000..150cbc1
+--- /dev/null
++++ b/board/udoo/neo/Makefile
+@@ -0,0 +1,6 @@
++# (C) Copyright 2015 UDOO Team
++#
++# SPDX-License-Identifier:	GPL-2.0+
++#
++
++obj-y  := neo.o
+diff --git a/board/udoo/neo/neo.c b/board/udoo/neo/neo.c
+new file mode 100644
+index 0000000..7f17469
+--- /dev/null
++++ b/board/udoo/neo/neo.c
+@@ -0,0 +1,441 @@
++/*
++ * Copyright (C) 2014-2015 Freescale Semiconductor, Inc.
++ * Copyright (C) Jasbir Matharu
++ * Copyright (C) UDOO Team
++ *
++ * Author: Breno Lima <breno.lima@nxp.com>
++ * Author: Francesco Montefoschi <francesco.monte@gmail.com>
++ *
++ * SPDX-License-Identifier:	GPL-2.0+
++ */
++
++#include <asm/arch/clock.h>
++#include <asm/arch/imx-regs.h>
++#include <asm/arch/iomux.h>
++#include <asm/arch/mx6-pins.h>
++#include <asm/gpio.h>
++#include <asm/imx-common/iomux-v3.h>
++#include <mmc.h>
++#include <fsl_esdhc.h>
++#include <asm/arch/crm_regs.h>
++#include <asm/io.h>
++#include <asm/arch/sys_proto.h>
++#include <spl.h>
++#include <linux/sizes.h>
++#include <common.h>
++
++DECLARE_GLOBAL_DATA_PTR;
++
++enum {
++	UDOO_NEO_TYPE_BASIC,
++	UDOO_NEO_TYPE_BASIC_KS,
++	UDOO_NEO_TYPE_FULL,
++	UDOO_NEO_TYPE_EXTENDED,
++};
++
++#define UART_PAD_CTRL  (PAD_CTL_PKE | PAD_CTL_PUE |		\
++	PAD_CTL_PUS_100K_UP | PAD_CTL_SPEED_MED |		\
++	PAD_CTL_DSE_40ohm   | PAD_CTL_SRE_FAST  | PAD_CTL_HYS)
++
++#define USDHC_PAD_CTRL (PAD_CTL_PKE | PAD_CTL_PUE |		\
++	PAD_CTL_PUS_22K_UP  | PAD_CTL_SPEED_LOW |		\
++	PAD_CTL_DSE_80ohm   | PAD_CTL_SRE_FAST  | PAD_CTL_HYS)
++
++#define WDOG_PAD_CTRL (PAD_CTL_PUE | PAD_CTL_PKE | PAD_CTL_SPEED_MED |	\
++	PAD_CTL_DSE_40ohm)
++
++#define BOARD_DETECT_PAD_CTRL (PAD_CTL_PKE | PAD_CTL_PUE |		\
++	PAD_CTL_PUS_100K_UP | PAD_CTL_SPEED_MED |		\
++	PAD_CTL_DSE_34ohm | PAD_CTL_HYS | PAD_CTL_SRE_FAST)
++#define BOARD_DETECT_PAD_CFG (MUX_PAD_CTRL(BOARD_DETECT_PAD_CTRL) |	\
++	MUX_MODE_SION)
++
++int dram_init(void)
++{
++	gd->ram_size = imx_ddr_size();
++	return 0;
++}
++
++static iomux_v3_cfg_t const uart1_pads[] = {
++	MX6_PAD_GPIO1_IO04__UART1_TX | MUX_PAD_CTRL(UART_PAD_CTRL),
++	MX6_PAD_GPIO1_IO05__UART1_RX | MUX_PAD_CTRL(UART_PAD_CTRL),
++};
++
++static iomux_v3_cfg_t const usdhc2_pads[] = {
++	MX6_PAD_SD2_CLK__USDHC2_CLK | MUX_PAD_CTRL(USDHC_PAD_CTRL),
++	MX6_PAD_SD2_CMD__USDHC2_CMD | MUX_PAD_CTRL(USDHC_PAD_CTRL),
++	MX6_PAD_SD2_DATA0__USDHC2_DATA0 | MUX_PAD_CTRL(USDHC_PAD_CTRL),
++	MX6_PAD_SD2_DATA1__USDHC2_DATA1 | MUX_PAD_CTRL(USDHC_PAD_CTRL),
++	MX6_PAD_SD2_DATA2__USDHC2_DATA2 | MUX_PAD_CTRL(USDHC_PAD_CTRL),
++	MX6_PAD_SD2_DATA3__USDHC2_DATA3 | MUX_PAD_CTRL(USDHC_PAD_CTRL),
++	/* CD pin */
++	MX6_PAD_SD1_DATA0__GPIO6_IO_2 | MUX_PAD_CTRL(NO_PAD_CTRL),
++	/* Power */
++	MX6_PAD_SD1_CMD__GPIO6_IO_1 | MUX_PAD_CTRL(NO_PAD_CTRL),
++};
++
++static iomux_v3_cfg_t const board_recognition_pads[] = {
++	/*Connected to R184*/
++	MX6_PAD_NAND_READY_B__GPIO4_IO_13 | BOARD_DETECT_PAD_CFG,
++	/*Connected to R185*/
++	MX6_PAD_NAND_ALE__GPIO4_IO_0 | BOARD_DETECT_PAD_CFG,
++};
++
++static iomux_v3_cfg_t const usdhc3_pads[] = {
++    /* Configured for WLAN */
++	MX6_PAD_SD3_CLK__USDHC3_CLK | MUX_PAD_CTRL(USDHC_PAD_CTRL),
++	MX6_PAD_SD3_CMD__USDHC3_CMD | MUX_PAD_CTRL(USDHC_PAD_CTRL),
++	MX6_PAD_SD3_DATA0__USDHC3_DATA0 | MUX_PAD_CTRL(USDHC_PAD_CTRL),
++	MX6_PAD_SD3_DATA1__USDHC3_DATA1 | MUX_PAD_CTRL(USDHC_PAD_CTRL),
++	MX6_PAD_SD3_DATA2__USDHC3_DATA2 | MUX_PAD_CTRL(USDHC_PAD_CTRL),
++	MX6_PAD_SD3_DATA3__USDHC3_DATA3 | MUX_PAD_CTRL(USDHC_PAD_CTRL),
++};
++
++static iomux_v3_cfg_t const wdog_b_pad = {
++	MX6_PAD_GPIO1_IO13__GPIO1_IO_13 | MUX_PAD_CTRL(WDOG_PAD_CTRL),
++};
++
++static iomux_v3_cfg_t const peri_3v3_pads[] = {
++	MX6_PAD_QSPI1A_DATA0__GPIO4_IO_16 | MUX_PAD_CTRL(NO_PAD_CTRL),
++};
++
++static void setup_iomux_uart(void)
++{
++	imx_iomux_v3_setup_multiple_pads(uart1_pads, ARRAY_SIZE(uart1_pads));
++}
++
++int board_init(void)
++{
++	/* Address of boot parameters */
++	gd->bd->bi_boot_params = PHYS_SDRAM + 0x100;
++
++	/*
++	 * Because kernel set WDOG_B mux before pad with the commone pinctrl
++	 * framwork now and wdog reset will be triggered once set WDOG_B mux
++	 * with default pad setting, we set pad setting here to workaround this.
++	 * Since imx_iomux_v3_setup_pad also set mux before pad setting, we set
++	 * as GPIO mux firstly here to workaround it.
++	 */
++	imx_iomux_v3_setup_pad(wdog_b_pad);
++
++	/* Enable PERI_3V3, which is used by SD2, ENET, LVDS, BT */
++	imx_iomux_v3_setup_multiple_pads(peri_3v3_pads,
++					 ARRAY_SIZE(peri_3v3_pads));
++
++	/* Active high for ncp692 */
++	gpio_direction_output(IMX_GPIO_NR(4, 16) , 1);
++
++	return 0;
++}
++
++static int get_board_value(void)
++{
++	int r184, r185;
++
++	imx_iomux_v3_setup_multiple_pads(board_recognition_pads,
++					 ARRAY_SIZE(board_recognition_pads));
++
++	gpio_direction_input(IMX_GPIO_NR(4, 13));
++	gpio_direction_input(IMX_GPIO_NR(4, 0));
++
++	r184 = gpio_get_value(IMX_GPIO_NR(4, 13));
++	r185 = gpio_get_value(IMX_GPIO_NR(4, 0));
++
++	/*
++	 * Machine selection -
++	 * Machine          r184,    r185
++	 * ---------------------------------
++	 * Basic              0        0
++	 * Basic Ks           0        1
++	 * Full               1        0
++	 * Extended           1        1
++	 */
++
++	return (r184 << 1) + r185;
++}
++
++int board_early_init_f(void)
++{
++	setup_iomux_uart();
++
++	return 0;
++}
++
++static struct fsl_esdhc_cfg usdhc_cfg[2] = {
++	{USDHC2_BASE_ADDR, 0, 4},
++	{USDHC3_BASE_ADDR, 0, 4},
++};
++
++#define USDHC2_PWR_GPIO IMX_GPIO_NR(6, 1)
++#define USDHC2_CD_GPIO	IMX_GPIO_NR(6, 2)
++
++int board_mmc_getcd(struct mmc *mmc)
++{
++	struct fsl_esdhc_cfg *cfg = (struct fsl_esdhc_cfg *)mmc->priv;
++	int ret = 0;
++
++	switch (cfg->esdhc_base) {
++	case USDHC2_BASE_ADDR:
++		ret = !gpio_get_value(USDHC2_CD_GPIO);
++		break;
++	}
++
++	return ret;
++}
++
++int board_mmc_init(bd_t *bis)
++{
++#ifndef CONFIG_SPL_BUILD
++	int i, ret;
++
++	/*
++	 * According to the board_mmc_init() the following map is done:
++	 * (U-boot device node)    (Physical Port)
++	 * mmc0                    USDHC2
++	 */
++	for (i = 0; i < CONFIG_SYS_FSL_USDHC_NUM; i++) {
++		switch (i) {
++		case 0:
++			imx_iomux_v3_setup_multiple_pads(
++				usdhc2_pads, ARRAY_SIZE(usdhc2_pads));
++			usdhc_cfg[0].sdhc_clk = mxc_get_clock(MXC_ESDHC2_CLK);
++			gpio_direction_input(USDHC2_CD_GPIO);
++			gpio_direction_output(USDHC2_PWR_GPIO, 1);
++			break;
++		case 1:
++			imx_iomux_v3_setup_multiple_pads(
++				usdhc3_pads, ARRAY_SIZE(usdhc3_pads));
++			usdhc_cfg[1].sdhc_clk = mxc_get_clock(MXC_ESDHC3_CLK);
++			break;
++		default:
++			printf("Warning: you configured more USDHC controllers\
++				(%d) than supported by the board\n", i + 1);
++			return -EINVAL;
++			}
++
++			ret = fsl_esdhc_initialize(bis, &usdhc_cfg[i]);
++			if (ret) {
++				printf("Warning:\
++					failed to initialize mmc dev %d\n", i);
++				return ret;
++			}
++	}
++
++	return 0;
++#else
++	struct src *src_regs = (struct src *)SRC_BASE_ADDR;
++	u32 val;
++	u32 port;
++
++	val = readl(&src_regs->sbmr1);
++
++	if ((val & 0xc0) != 0x40) {
++		printf("Not boot from USDHC!\n");
++		return -EINVAL;
++	}
++
++	port = (val >> 11) & 0x3;
++	printf("port %d\n", port);
++	switch (port) {
++	case 1:
++		imx_iomux_v3_setup_multiple_pads(
++			usdhc2_pads, ARRAY_SIZE(usdhc2_pads));
++		usdhc_cfg[0].sdhc_clk = mxc_get_clock(MXC_ESDHC2_CLK);
++		usdhc_cfg[0].esdhc_base = USDHC2_BASE_ADDR;
++		gpio_direction_input(USDHC2_CD_GPIO);
++		gpio_direction_output(USDHC2_PWR_GPIO, 1);
++		break;
++	case 2:
++		imx_iomux_v3_setup_multiple_pads(
++			usdhc3_pads, ARRAY_SIZE(usdhc3_pads));
++		usdhc_cfg[1].sdhc_clk = mxc_get_clock(MXC_ESDHC3_CLK);
++		usdhc_cfg[1].esdhc_base = USDHC3_BASE_ADDR;
++		break;
++	}
++
++	gd->arch.sdhc_clk = usdhc_cfg[0].sdhc_clk;
++	return fsl_esdhc_initialize(bis, &usdhc_cfg[0]);
++#endif
++}
++
++char *board_string(void)
++{
++	switch (get_board_value()) {
++	case UDOO_NEO_TYPE_BASIC:
++		return "BASIC";
++	case UDOO_NEO_TYPE_BASIC_KS:
++		return "BASICKS";
++	case UDOO_NEO_TYPE_FULL:
++		return "FULL";
++	case UDOO_NEO_TYPE_EXTENDED:
++		return "EXTENDED";
++	}
++	return "UNDEFINED";
++}
++
++int checkboard(void)
++{
++	printf("Board: UDOO Neo %s\n", board_string());
++	return 0;
++}
++
++int board_late_init(void)
++{
++#ifdef CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG
++	setenv("board_name", board_string());
++#endif
++
++	return 0;
++}
++
++#ifdef CONFIG_SPL_BUILD
++
++#include <libfdt.h>
++#include <asm/arch/mx6-ddr.h>
++
++static const struct mx6sx_iomux_ddr_regs mx6_ddr_ioregs = {
++	.dram_dqm0 = 0x00000028,
++	.dram_dqm1 = 0x00000028,
++	.dram_dqm2 = 0x00000028,
++	.dram_dqm3 = 0x00000028,
++	.dram_ras = 0x00000020,
++	.dram_cas = 0x00000020,
++	.dram_odt0 = 0x00000020,
++	.dram_odt1 = 0x00000020,
++	.dram_sdba2 = 0x00000000,
++	.dram_sdcke0 = 0x00003000,
++	.dram_sdcke1 = 0x00003000,
++	.dram_sdclk_0 = 0x00000030,
++	.dram_sdqs0 = 0x00000028,
++	.dram_sdqs1 = 0x00000028,
++	.dram_sdqs2 = 0x00000028,
++	.dram_sdqs3 = 0x00000028,
++	.dram_reset = 0x00000020,
++};
++
++static const struct mx6sx_iomux_grp_regs mx6_grp_ioregs = {
++	.grp_addds = 0x00000020,
++	.grp_ddrmode_ctl = 0x00020000,
++	.grp_ddrpke = 0x00000000,
++	.grp_ddrmode = 0x00020000,
++	.grp_b0ds = 0x00000028,
++	.grp_b1ds = 0x00000028,
++	.grp_ctlds = 0x00000020,
++	.grp_ddr_type = 0x000c0000,
++	.grp_b2ds = 0x00000028,
++	.grp_b3ds = 0x00000028,
++};
++
++static const struct mx6_mmdc_calibration neo_mmcd_calib = {
++	.p0_mpwldectrl0 = 0x000E000B,
++	.p0_mpwldectrl1 = 0x000E0010,
++	.p0_mpdgctrl0 = 0x41600158,
++	.p0_mpdgctrl1 = 0x01500140,
++	.p0_mprddlctl = 0x3A383E3E,
++	.p0_mpwrdlctl = 0x3A383C38,
++};
++
++static const struct mx6_mmdc_calibration neo_basic_mmcd_calib = {
++	.p0_mpwldectrl0 = 0x001E0022,
++	.p0_mpwldectrl1 = 0x001C0019,
++	.p0_mpdgctrl0 = 0x41540150,
++	.p0_mpdgctrl1 = 0x01440138,
++	.p0_mprddlctl = 0x403E4644,
++	.p0_mpwrdlctl = 0x3C3A4038,
++};
++
++/* MT41K256M16 */
++static struct mx6_ddr3_cfg neo_mem_ddr = {
++	.mem_speed = 1600,
++	.density = 4,
++	.width = 16,
++	.banks = 8,
++	.rowaddr = 15,
++	.coladdr = 10,
++	.pagesz = 2,
++	.trcd = 1375,
++	.trcmin = 4875,
++	.trasmin = 3500,
++};
++
++/* MT41K128M16 */
++static struct mx6_ddr3_cfg neo_basic_mem_ddr = {
++	.mem_speed = 1600,
++	.density = 2,
++	.width = 16,
++	.banks = 8,
++	.rowaddr = 14,
++	.coladdr = 10,
++	.pagesz = 2,
++	.trcd = 1375,
++	.trcmin = 4875,
++	.trasmin = 3500,
++};
++
++static void ccgr_init(void)
++{
++	struct mxc_ccm_reg *ccm = (struct mxc_ccm_reg *)CCM_BASE_ADDR;
++
++	writel(0xFFFFFFFF, &ccm->CCGR0);
++	writel(0xFFFFFFFF, &ccm->CCGR1);
++	writel(0xFFFFFFFF, &ccm->CCGR2);
++	writel(0xFFFFFFFF, &ccm->CCGR3);
++	writel(0xFFFFFFFF, &ccm->CCGR4);
++	writel(0xFFFFFFFF, &ccm->CCGR5);
++	writel(0xFFFFFFFF, &ccm->CCGR6);
++	writel(0xFFFFFFFF, &ccm->CCGR7);
++}
++
++static void spl_dram_init(void)
++{
++	int board = get_board_value();
++
++	struct mx6_ddr_sysinfo sysinfo = {
++		.dsize = 1, /* width of data bus: 1 = 32 bits */
++		.cs_density = 24,
++		.ncs = 1,
++		.cs1_mirror = 0,
++		.rtt_wr = 2,
++		.rtt_nom = 2,		/* RTT_Nom = RZQ/2 */
++		.walat = 1,		/* Write additional latency */
++		.ralat = 5,		/* Read additional latency */
++		.mif3_mode = 3,		/* Command prediction working mode */
++		.bi_on = 1,		/* Bank interleaving enabled */
++		.sde_to_rst = 0x10,	/* 14 cycles, 200us (JEDEC default) */
++		.rst_to_cke = 0x23,	/* 33 cycles, 500us (JEDEC default) */
++	};
++
++	mx6sx_dram_iocfg(32, &mx6_ddr_ioregs, &mx6_grp_ioregs);
++	if (board == UDOO_NEO_TYPE_BASIC || board == UDOO_NEO_TYPE_BASIC_KS)
++		mx6_dram_cfg(&sysinfo, &neo_basic_mmcd_calib,
++			     &neo_basic_mem_ddr);
++	else
++		mx6_dram_cfg(&sysinfo, &neo_mmcd_calib, &neo_mem_ddr);
++}
++
++void board_init_f(ulong dummy)
++{
++	ccgr_init();
++
++	/* setup AIPS and disable watchdog */
++	arch_cpu_init();
++
++	board_early_init_f();
++
++	/* setup GP timer */
++	timer_init();
++
++	/* UART clocks enabled and gd valid - init serial console */
++	preloader_console_init();
++
++	/* DDR initialization */
++	spl_dram_init();
++
++	/* Clear the BSS. */
++	memset(__bss_start, 0, __bss_end - __bss_start);
++
++	/* load/boot image from boot device */
++	board_init_r(NULL, 0);
++}
++
++#endif
+diff --git a/configs/udoo_neo_defconfig b/configs/udoo_neo_defconfig
+new file mode 100644
+index 0000000..3304afb
+--- /dev/null
++++ b/configs/udoo_neo_defconfig
+@@ -0,0 +1,30 @@
++CONFIG_ARM=y
++CONFIG_ARCH_MX6=y
++CONFIG_SPL_GPIO_SUPPORT=y
++CONFIG_SPL_LIBCOMMON_SUPPORT=y
++CONFIG_SPL_LIBGENERIC_SUPPORT=y
++CONFIG_TARGET_UDOO_NEO=y
++CONFIG_SPL_EXT_SUPPORT=y
++CONFIG_SPL_LIBDISK_SUPPORT=y
++CONFIG_SPL_MMC_SUPPORT=y
++CONFIG_SPL_SERIAL_SUPPORT=y
++CONFIG_SPL_ENV_SUPPORT=y
++CONFIG_SPL_WATCHDOG_SUPPORT=y
++CONFIG_SPL=y
++CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=arch/arm/imx-common/spl_sd.cfg,MX6SX"
++CONFIG_HUSH_PARSER=y
++CONFIG_CMD_BOOTZ=y
++# CONFIG_CMD_IMLS is not set
++# CONFIG_CMD_FLASH is not set
++CONFIG_CMD_MMC=y
++CONFIG_CMD_GPIO=y
++# CONFIG_CMD_SETEXPR is not set
++# CONFIG_CMD_DHCP=y
++CONFIG_CMD_CACHE=y
++CONFIG_CMD_TIME=y
++CONFIG_CMD_EXT2=y
++CONFIG_CMD_EXT4=y
++CONFIG_CMD_EXT4_WRITE=y
++CONFIG_CMD_FAT=y
++CONFIG_CMD_FS_GENERIC=y
++CONFIG_OF_LIBFDT=y
+diff --git a/include/configs/udoo_neo.h b/include/configs/udoo_neo.h
+new file mode 100644
+index 0000000..81e0481
+--- /dev/null
++++ b/include/configs/udoo_neo.h
+@@ -0,0 +1,94 @@
++/*
++ * Copyright 2014-2015 Freescale Semiconductor, Inc.
++ * Copyright Jasbir Matharu
++ * Copyright 2015 UDOO Team
++ *
++ * Configuration settings for the UDOO NEO board.
++ *
++ * SPDX-License-Identifier:	GPL-2.0+
++ */
++
++#ifndef __CONFIG_H
++#define __CONFIG_H
++
++#include <config_distro_defaults.h>
++#include "mx6_common.h"
++
++#include "imx6_spl.h"
++
++/* Size of malloc() pool */
++#define CONFIG_SYS_MALLOC_LEN		(3 * SZ_1M)
++#define CONFIG_BOARD_EARLY_INIT_F
++#define CONFIG_BOARD_LATE_INIT
++#define CONFIG_MXC_UART
++
++/* MMC Configuration */
++#define CONFIG_SYS_FSL_ESDHC_ADDR	USDHC2_BASE_ADDR
++
++/* Command definition */
++#define CONFIG_MXC_UART_BASE		UART1_BASE
++#define CONFIG_SYS_FSL_USDHC_NUM	2
++#define CONFIG_SYS_MMC_ENV_DEV		0  /*USDHC2*/
++
++/* Linux only */
++#define CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG
++#define CONFIG_EXTRA_ENV_SETTINGS \
++	"console=ttymxc0,115200\0" \
++	"fdt_high=0xffffffff\0" \
++	"initrd_high=0xffffffff\0" \
++	"fdt_file=undefined\0" \
++	"fdt_addr=0x83000000\0" \
++	"ip_dyn=yes\0" \
++	"mmcdev=0\0" \
++	"mmcrootfstype=ext4\0" \
++	"mmcautodetect=no\0" \
++	"findfdt="\
++		"if test $board_name = BASIC; then " \
++			"setenv fdt_file imx6sx-udoo-neo-basic.dtb; fi; " \
++		"if test $board_name = BASICKS; then " \
++			"setenv fdt_file imx6sx-udoo-neo-basic.dtb; fi; " \
++		"if test $board_name = FULL; then " \
++			"setenv fdt_file imx6sx-udoo-neo-full.dtb; fi; " \
++		"if test $board_name = EXTENDED; then " \
++			"setenv fdt_file imx6sx-udoo-neo-extended.dtb; fi; " \
++		"if test $fdt_file = UNDEFINED; then " \
++			"echo WARNING: Could not determine dtb to use; fi; \0" \
++	"kernel_addr_r=" __stringify(CONFIG_LOADADDR) "\0" \
++	"pxefile_addr_r=" __stringify(CONFIG_LOADADDR) "\0" \
++	"ramdisk_addr_r=0x83000000\0" \
++	"ramdiskaddr=0x83000000\0" \
++	"scriptaddr=" __stringify(CONFIG_LOADADDR) "\0" \
++	BOOTENV
++
++#define BOOT_TARGET_DEVICES(func) \
++	func(MMC, mmc, 0)
++
++#define CONFIG_BOOTCOMMAND \
++	"run findfdt; " \
++	"run distro_bootcmd"
++
++#include <config_distro_bootcmd.h>
++
++/* Miscellaneous configurable options */
++#define CONFIG_SYS_MEMTEST_START	0x80000000
++#define CONFIG_SYS_MEMTEST_END		(CONFIG_SYS_MEMTEST_START + 0x10000)
++#define CONFIG_STACKSIZE		SZ_128K
++
++/* Physical Memory Map */
++#define CONFIG_NR_DRAM_BANKS		1
++#define PHYS_SDRAM			MMDC0_ARB_BASE_ADDR
++#define CONFIG_SYS_SDRAM_BASE		PHYS_SDRAM
++#define CONFIG_SYS_INIT_RAM_ADDR	IRAM_BASE_ADDR
++#define CONFIG_SYS_INIT_RAM_SIZE	IRAM_SIZE
++
++#define CONFIG_SYS_INIT_SP_OFFSET \
++	(CONFIG_SYS_INIT_RAM_SIZE - GENERATED_GBL_DATA_SIZE)
++#define CONFIG_SYS_INIT_SP_ADDR \
++	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
++
++/* Environment organization */
++#define CONFIG_ENV_OFFSET		(8 * SZ_64K)
++#define CONFIG_ENV_SIZE			SZ_8K
++#define CONFIG_ENV_IS_IN_MMC
++
++#endif				/* __CONFIG_H */
+-- 
+1.7.10.4
diff --git a/board/udoo/neo/post-build.sh b/board/udoo/neo/post-build.sh
new file mode 100755
index 0000000..07c480e
--- /dev/null
+++ b/board/udoo/neo/post-build.sh
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+
+$HOST_DIR/usr/bin/mkimage -A arm -O linux -T script -C none  \
+-n "boot script" -d $BOARD_DIR/boot.scr.txt $BOARD_DIR/boot.scr
+
+install -m 0644 -D $BOARD_DIR/boot.scr $TARGET_DIR/boot/boot.scr
diff --git a/board/udoo/neo/post-image.sh b/board/udoo/neo/post-image.sh
new file mode 100755
index 0000000..18e76aa
--- /dev/null
+++ b/board/udoo/neo/post-image.sh
@@ -0,0 +1,15 @@
+#!/usr/bin/env bash
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
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
diff --git a/board/udoo/neo/readme.txt b/board/udoo/neo/readme.txt
new file mode 100644
index 0000000..f037ad4
--- /dev/null
+++ b/board/udoo/neo/readme.txt
@@ -0,0 +1,16 @@
+MX6X Udoo Neo board
+
+http://www.udoo.org/udoo-neo/
+
+To build a minimal support for these boards:
+
+    $ make mx6sx_udoo_neo_defconfig
+    $ make
+
+Buildroot prepares a bootable "sdcard.img" image in the output/images/
+directory, ready to be dumped on an SD card:
+
+dd if=output/images/sdcard.img of=/dev/<your-microsd-device>
+
+For details about the medium image layout, see the definition in
+board/udoo/neo/genimage.cfg.
diff --git a/configs/mx6sx_udoo_neo_defconfig b/configs/mx6sx_udoo_neo_defconfig
new file mode 100644
index 0000000..cbea577
--- /dev/null
+++ b/configs/mx6sx_udoo_neo_defconfig
@@ -0,0 +1,29 @@
+BR2_arm=y
+BR2_cortex_a9=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/udoo/neo/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/udoo/neo/post-image.sh"
+BR2_GLOBAL_PATCH_DIR="board/udoo/neo/patches"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="udoo_neo"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.11"
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="SPL"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sx-udoo-neo-basic imx6sx-udoo-neo-full imx6sx-udoo-neo-extended"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+# required tools to create the SD card image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
