From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Thu, 26 Oct 2017 20:11:46 +0200
Subject: [Buildroot] [PATCH v4 06/11] board: Add FriendlyARM Nanopi A64
	support
In-Reply-To: <1509041511-30956-1-git-send-email-jagan@amarulasolutions.com>
References: <1509041511-30956-1-git-send-email-jagan@amarulasolutions.com>
Message-ID: <1509041511-30956-7-git-send-email-jagan@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add initial support for FriendlyARM Nanopi A64 board with below features:
- U-Boot 2017.09
- Linux 4.13.7
- Default packages from buildroot

Cc: Yuefei <yftan@friendlyarm.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 .gitlab-ci.yml                                     |   1 +
 DEVELOPERS                                         |   2 +
 board/friendlyarm/nanopi-a64/boot.cmd              |   6 +
 board/friendlyarm/nanopi-a64/genimage.cfg          |  38 +++
 board/friendlyarm/nanopi-a64/linux_axp.fragment    |   3 +
 ...nner-a64-add-NMI-R_INTC-controller-on-A64.patch |  41 ++++
 ...lwinner-a64-add-DTSI-file-for-AXP803-PMIC.patch | 176 ++++++++++++++
 ...winner-a64-Add-initial-NanoPi-A64-support.patch | 254 +++++++++++++++++++++
 board/friendlyarm/nanopi-a64/readme.txt            |  37 +++
 configs/friendlyarm_nanopi_a64_defconfig           |  51 +++++
 10 files changed, 609 insertions(+)
 create mode 100644 board/friendlyarm/nanopi-a64/boot.cmd
 create mode 100644 board/friendlyarm/nanopi-a64/genimage.cfg
 create mode 100644 board/friendlyarm/nanopi-a64/linux_axp.fragment
 create mode 100644 board/friendlyarm/nanopi-a64/patches/linux/linux-0001-arm64-allwinner-a64-add-NMI-R_INTC-controller-on-A64.patch
 create mode 100644 board/friendlyarm/nanopi-a64/patches/linux/linux-0002-arm64-allwinner-a64-add-DTSI-file-for-AXP803-PMIC.patch
 create mode 100644 board/friendlyarm/nanopi-a64/patches/linux/linux-0003-arm64-allwinner-a64-Add-initial-NanoPi-A64-support.patch
 create mode 100644 board/friendlyarm/nanopi-a64/readme.txt
 create mode 100644 configs/friendlyarm_nanopi_a64_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a690b17..9e566de 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -119,6 +119,7 @@ freescale_imx6ulevk_defconfig: *defconfig
 freescale_imx7dsabresd_defconfig: *defconfig
 freescale_mpc8315erdb_defconfig: *defconfig
 freescale_p1010rdb_pa_defconfig: *defconfig
+friendlyarm_nanopi_a64_defconfig: *defconfig
 galileo_defconfig: *defconfig
 gdb_bfin_bf512_defconfig: *defconfig
 grinn_chiliboard_defconfig: *defconfig
diff --git a/DEVELOPERS b/DEVELOPERS
index 106d793..cae3730 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -728,9 +728,11 @@ F:	package/keepalived/
 N:	Jagan Teki <jagan@amarulasolutions.com>
 F:	board/bananapi/
 F:	board/engicam/
+F:	board/friendlyarm/nanopi-a64/
 F:	board/pine64/
 F:	configs/bananapi_m1_defconfig
 F:	configs/bananapi_m64_defconfig
+F:	configs/friendlyarm_nanopi_a64_defconfig
 F:	configs/pine64_defconfig
 F:	configs/pine64_sopine_defconfig
 F:	configs/engicam_imx6qdl_icore_defconfig
diff --git a/board/friendlyarm/nanopi-a64/boot.cmd b/board/friendlyarm/nanopi-a64/boot.cmd
new file mode 100644
index 0000000..446bd85
--- /dev/null
+++ b/board/friendlyarm/nanopi-a64/boot.cmd
@@ -0,0 +1,6 @@
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+
+fatload mmc 0 $kernel_addr_r Image
+fatload mmc 0 $fdt_addr_r sun50i-a64-nanopi-a64.dtb
+
+booti $kernel_addr_r - $fdt_addr_r
diff --git a/board/friendlyarm/nanopi-a64/genimage.cfg b/board/friendlyarm/nanopi-a64/genimage.cfg
new file mode 100644
index 0000000..edfb52d
--- /dev/null
+++ b/board/friendlyarm/nanopi-a64/genimage.cfg
@@ -0,0 +1,38 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"Image",
+			"sun50i-a64-nanopi-a64.dtb",
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
diff --git a/board/friendlyarm/nanopi-a64/linux_axp.fragment b/board/friendlyarm/nanopi-a64/linux_axp.fragment
new file mode 100644
index 0000000..b19bc65
--- /dev/null
+++ b/board/friendlyarm/nanopi-a64/linux_axp.fragment
@@ -0,0 +1,3 @@
+CONFIG_SUNXI_RSB=y
+CONFIG_MFD_AXP20X_RSB=y
+CONFIG_REGULATOR_AXP20X=y
diff --git a/board/friendlyarm/nanopi-a64/patches/linux/linux-0001-arm64-allwinner-a64-add-NMI-R_INTC-controller-on-A64.patch b/board/friendlyarm/nanopi-a64/patches/linux/linux-0001-arm64-allwinner-a64-add-NMI-R_INTC-controller-on-A64.patch
new file mode 100644
index 0000000..ccbaec5
--- /dev/null
+++ b/board/friendlyarm/nanopi-a64/patches/linux/linux-0001-arm64-allwinner-a64-add-NMI-R_INTC-controller-on-A64.patch
@@ -0,0 +1,41 @@
+From 535ca50858e2d8bf1618ace056cd96f0b3d01133 Mon Sep 17 00:00:00 2001
+From: Icenowy Zheng <icenowy@aosc.io>
+Date: Tue, 6 Jun 2017 13:59:32 +0800
+Subject: [PATCH] arm64: allwinner: a64: add NMI (R_INTC) controller on A64
+
+Allwinner A64 SoC features a R_INTC controller, which controls the NMI
+line, and this interrupt line is usually connected to the AXP PMIC.
+
+Add support for it.
+
+Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
+[wens at csie.org: Add fallback sun6i-a31-r-intc compatible]
+Signed-off-by: Chen-Yu Tsai <wens@csie.org>
+Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>
+---
+ arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+index 9d00622..78c7c9d 100644
+--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
++++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+@@ -487,6 +487,15 @@
+ 				     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
+ 		};
+ 
++		r_intc: interrupt-controller at 1f00c00 {
++			compatible = "allwinner,sun50i-a64-r-intc",
++				     "allwinner,sun6i-a31-r-intc";
++			interrupt-controller;
++			#interrupt-cells = <2>;
++			reg = <0x01f00c00 0x400>;
++			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
++		};
++
+ 		r_ccu: clock at 1f01400 {
+ 			compatible = "allwinner,sun50i-a64-r-ccu";
+ 			reg = <0x01f01400 0x100>;
+-- 
+2.7.4
+
diff --git a/board/friendlyarm/nanopi-a64/patches/linux/linux-0002-arm64-allwinner-a64-add-DTSI-file-for-AXP803-PMIC.patch b/board/friendlyarm/nanopi-a64/patches/linux/linux-0002-arm64-allwinner-a64-add-DTSI-file-for-AXP803-PMIC.patch
new file mode 100644
index 0000000..3a6a9ef
--- /dev/null
+++ b/board/friendlyarm/nanopi-a64/patches/linux/linux-0002-arm64-allwinner-a64-add-DTSI-file-for-AXP803-PMIC.patch
@@ -0,0 +1,176 @@
+From 4c0a84757b5a0365a5dde82e732972eda80a32b1 Mon Sep 17 00:00:00 2001
+From: Icenowy Zheng <icenowy@aosc.io>
+Date: Thu, 18 May 2017 15:16:51 +0800
+Subject: [PATCH] arm64: allwinner: a64: add DTSI file for AXP803 PMIC
+
+As nearly all A64 boards are using AXP803 PMIC, add a DTSI file for it,
+like the old DTSI files for AXP20x/22x, for the common parts of the
+PMIC.
+
+Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
+Acked-by: Mark Brown <broonie@kernel.org>
+Signed-off-by: Chen-Yu Tsai <wens@csie.org>
+---
+ arch/arm64/boot/dts/allwinner/axp803.dtsi | 150 ++++++++++++++++++++++++++++++
+ 1 file changed, 150 insertions(+)
+ create mode 100644 arch/arm64/boot/dts/allwinner/axp803.dtsi
+
+diff --git a/arch/arm64/boot/dts/allwinner/axp803.dtsi b/arch/arm64/boot/dts/allwinner/axp803.dtsi
+new file mode 100644
+index 0000000..ff8af52
+--- /dev/null
++++ b/arch/arm64/boot/dts/allwinner/axp803.dtsi
+@@ -0,0 +1,150 @@
++/*
++ * Copyright 2017 Icenowy Zheng <icenowy@aosc.xyz>
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
++/*
++ * AXP803 Integrated Power Management Chip
++ * http://files.pine64.org/doc/datasheet/pine64/AXP803_Datasheet_V1.0.pdf
++ */
++
++&axp803 {
++	interrupt-controller;
++	#interrupt-cells = <1>;
++
++	regulators {
++		/* Default work frequency for buck regulators */
++		x-powers,dcdc-freq = <3000>;
++
++		reg_aldo1: aldo1 {
++			regulator-name = "aldo1";
++		};
++
++		reg_aldo2: aldo2 {
++			regulator-name = "aldo2";
++		};
++
++		reg_aldo3: aldo3 {
++			regulator-name = "aldo3";
++		};
++
++		reg_dc1sw: dc1sw {
++			regulator-name = "dc1sw";
++		};
++
++		reg_dcdc1: dcdc1 {
++			regulator-name = "dcdc1";
++		};
++
++		reg_dcdc2: dcdc2 {
++			regulator-name = "dcdc2";
++		};
++
++		reg_dcdc3: dcdc3 {
++			regulator-name = "dcdc3";
++		};
++
++		reg_dcdc4: dcdc4 {
++			regulator-name = "dcdc4";
++		};
++
++		reg_dcdc5: dcdc5 {
++			regulator-name = "dcdc5";
++		};
++
++		reg_dcdc6: dcdc6 {
++			regulator-name = "dcdc6";
++		};
++
++		reg_dldo1: dldo1 {
++			regulator-name = "dldo1";
++		};
++
++		reg_dldo2: dldo2 {
++			regulator-name = "dldo2";
++		};
++
++		reg_dldo3: dldo3 {
++			regulator-name = "dldo3";
++		};
++
++		reg_dldo4: dldo4 {
++			regulator-name = "dldo4";
++		};
++
++		reg_eldo1: eldo1 {
++			regulator-name = "eldo1";
++		};
++
++		reg_eldo2: eldo2 {
++			regulator-name = "eldo2";
++		};
++
++		reg_eldo3: eldo3 {
++			regulator-name = "eldo3";
++		};
++
++		reg_fldo1: fldo1 {
++			regulator-name = "fldo1";
++		};
++
++		reg_fldo2: fldo2 {
++			regulator-name = "fldo2";
++		};
++
++		reg_ldo_io0: ldo-io0 {
++			regulator-name = "ldo-io0";
++			status = "disabled";
++		};
++
++		reg_ldo_io1: ldo-io1 {
++			regulator-name = "ldo-io1";
++			status = "disabled";
++		};
++
++		reg_rtc_ldo: rtc-ldo {
++			/* RTC_LDO is a fixed, always-on regulator */
++			regulator-always-on;
++			regulator-min-microvolt = <3000000>;
++			regulator-max-microvolt = <3000000>;
++			regulator-name = "rtc-ldo";
++		};
++	};
++};
+-- 
+2.7.4
+
diff --git a/board/friendlyarm/nanopi-a64/patches/linux/linux-0003-arm64-allwinner-a64-Add-initial-NanoPi-A64-support.patch b/board/friendlyarm/nanopi-a64/patches/linux/linux-0003-arm64-allwinner-a64-Add-initial-NanoPi-A64-support.patch
new file mode 100644
index 0000000..c7eb4bf
--- /dev/null
+++ b/board/friendlyarm/nanopi-a64/patches/linux/linux-0003-arm64-allwinner-a64-Add-initial-NanoPi-A64-support.patch
@@ -0,0 +1,254 @@
+From bf397214530ee5c873dac7b12126b250afd3831f Mon Sep 17 00:00:00 2001
+From: Jagan Teki <jagan@amarulasolutions.com>
+Date: Mon, 14 Aug 2017 16:06:53 +0530
+Subject: [PATCH] arm64: allwinner: a64: Add initial NanoPi A64 support
+
+NanoPi A64 is a new board of high performance with low cost
+designed by FriendlyElec., using the Allwinner A64 SOC.
+
+Nanopi A64 features
+- Allwinner A64, 64-bit Quad-core Cortex-A53 at 648MHz to 1.152GHz, DVFS
+- 1GB DDR3 RAM
+- MicroSD
+- Gigabit Ethernet (RTL8211E)
+- Wi-Fi 802.11b/g/n
+- IR receiver
+- Audio In/Out
+- Video In/Out
+- Serial Debug Port
+- microUSB 5V 2A DC power-supply
+
+Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
+Signed-off-by: Chen-Yu Tsai <wens@csie.org>
+---
+ arch/arm64/boot/dts/allwinner/Makefile             |   1 +
+ .../boot/dts/allwinner/sun50i-a64-nanopi-a64.dts   | 207 +++++++++++++++++++++
+ 2 files changed, 208 insertions(+)
+ create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts
+
+diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
+index 108f12c..c997b5c 100644
+--- a/arch/arm64/boot/dts/allwinner/Makefile
++++ b/arch/arm64/boot/dts/allwinner/Makefile
+@@ -1,4 +1,5 @@
+ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-bananapi-m64.dtb
++dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-nanopi-a64.dtb
+ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-orangepi-win.dtb
+ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pine64-plus.dtb sun50i-a64-pine64.dtb
+ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-sopine-baseboard.dtb
+diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts
+new file mode 100644
+index 0000000..2beef9e
+--- /dev/null
++++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts
+@@ -0,0 +1,207 @@
++/*
++ * Copyright (C) 2017 Jagan Teki <jteki@openedev.com>
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
++#include "sun50i-a64.dtsi"
++
++#include <dt-bindings/gpio/gpio.h>
++
++/ {
++	model = "FriendlyARM NanoPi A64";
++	compatible = "friendlyarm,nanopi-a64", "allwinner,sun50i-a64";
++
++	aliases {
++		serial0 = &uart0;
++	};
++
++	chosen {
++		stdout-path = "serial0:115200n8";
++	};
++};
++
++&ehci0 {
++	status = "okay";
++};
++
++&ehci1 {
++	status = "okay";
++};
++
++/* i2c1 connected with gpio headers like pine64, bananapi */
++&i2c1 {
++	pinctrl-names = "default";
++	pinctrl-0 = <&i2c1_pins>;
++	status = "disabled";
++};
++
++&i2c1_pins {
++	bias-pull-up;
++};
++
++&mmc0 {
++	pinctrl-names = "default";
++	pinctrl-0 = <&mmc0_pins>;
++	vmmc-supply = <&reg_dcdc1>;
++	cd-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>;
++	cd-inverted;
++	disable-wp;
++	bus-width = <4>;
++	status = "okay";
++};
++
++&ohci0 {
++	status = "okay";
++};
++
++&ohci1 {
++	status = "okay";
++};
++
++&r_rsb {
++	status = "okay";
++
++	axp803: pmic at 3a3 {
++		compatible = "x-powers,axp803";
++		reg = <0x3a3>;
++		interrupt-parent = <&r_intc>;
++		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
++	};
++};
++
++#include "axp803.dtsi"
++
++&reg_aldo2 {
++	regulator-always-on;
++	regulator-min-microvolt = <1800000>;
++	regulator-max-microvolt = <3300000>;
++	regulator-name = "vcc-pl";
++};
++
++&reg_aldo3 {
++	regulator-always-on;
++	regulator-min-microvolt = <3000000>;
++	regulator-max-microvolt = <3000000>;
++	regulator-name = "vcc-pll-avcc";
++};
++
++&reg_dcdc1 {
++	regulator-always-on;
++	regulator-min-microvolt = <3000000>;
++	regulator-max-microvolt = <3000000>;
++	regulator-name = "vcc-3v";
++};
++
++&reg_dcdc2 {
++	regulator-always-on;
++	regulator-min-microvolt = <1040000>;
++	regulator-max-microvolt = <1300000>;
++	regulator-name = "vdd-cpux";
++};
++
++/* DCDC3 is polyphased with DCDC2 */
++
++&reg_dcdc5 {
++	regulator-always-on;
++	regulator-min-microvolt = <1500000>;
++	regulator-max-microvolt = <1500000>;
++	regulator-name = "vcc-dram";
++};
++
++&reg_dcdc6 {
++	regulator-always-on;
++	regulator-min-microvolt = <1100000>;
++	regulator-max-microvolt = <1100000>;
++	regulator-name = "vdd-sys";
++};
++
++&reg_dldo1 {
++	regulator-always-on;
++	regulator-min-microvolt = <3300000>;
++	regulator-max-microvolt = <3300000>;
++	regulator-name = "vcc-hdmi-dsi";
++};
++
++&reg_dldo4 {
++	regulator-always-on;
++	regulator-min-microvolt = <3000000>;
++	regulator-max-microvolt = <3000000>;
++	regulator-name = "vcc-pg-wifi-io";
++};
++
++&reg_eldo1 {
++	regulator-min-microvolt = <1800000>;
++	regulator-max-microvolt = <1800000>;
++	regulator-name = "cpvdd";
++};
++
++&reg_fldo1 {
++	regulator-min-microvolt = <1200000>;
++	regulator-max-microvolt = <1200000>;
++	regulator-name = "vcc-1v2-hsic";
++};
++
++/*
++ * The A64 chip cannot work without this regulator off, although
++ * it seems to be only driving the AR100 core.
++ * Maybe we don't still know well about CPUs domain.
++ */
++&reg_fldo2 {
++	regulator-always-on;
++	regulator-min-microvolt = <1100000>;
++	regulator-max-microvolt = <1100000>;
++	regulator-name = "vdd-cpus";
++};
++
++&reg_rtc_ldo {
++	regulator-name = "vcc-rtc";
++};
++
++&uart0 {
++	pinctrl-names = "default";
++	pinctrl-0 = <&uart0_pins_a>;
++	status = "okay";
++};
++
++&usbphy {
++	status = "okay";
++};
+-- 
+2.7.4
+
diff --git a/board/friendlyarm/nanopi-a64/readme.txt b/board/friendlyarm/nanopi-a64/readme.txt
new file mode 100644
index 0000000..77a5167
--- /dev/null
+++ b/board/friendlyarm/nanopi-a64/readme.txt
@@ -0,0 +1,37 @@
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the Nanopi A64. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+Nanopi A64 link:
+http://nanopi.io/nanopi-a64.html
+
+Wiki link:
+https://confluence.amarulasolutions.com/display/ODWIKI/FriendlyARM+Nanopi+A64
+
+This configuration uses U-Boot mainline and kernel mainline.
+
+How to build
+============
+
+    $ make friendlyarm_nanopi_a64_defconfig
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
+Insert the micro SDcard in your Nanopi A64 and power it up. The console
+is on the serial line, 115200 8N1.
diff --git a/configs/friendlyarm_nanopi_a64_defconfig b/configs/friendlyarm_nanopi_a64_defconfig
new file mode 100644
index 0000000..59d381a
--- /dev/null
+++ b/configs/friendlyarm_nanopi_a64_defconfig
@@ -0,0 +1,51 @@
+BR2_aarch64=y
+BR2_cortex_a53=y
+BR2_ARM_FPU_VFPV4=y
+
+# Linux headers same as kernel, a 4.13 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
+
+# Patch dir
+BR2_GLOBAL_PATCH_DIR="board/friendlyarm/nanopi-a64/patches"
+
+# Firmware
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/apritzel/arm-trusted-firmware.git"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50iw1p1"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="aa75c8da415158a94b82a430b2b40000778e851f"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="bl31"
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.09"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_a64"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_ATF=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/friendlyarm/nanopi-a64/boot.cmd"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.7"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-a64-nanopi-a64"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/friendlyarm/nanopi-a64/linux_axp.fragment"
+
+# Filesystem
+BR2_TARGET_GENERIC_ISSUE="Welcome to FriendlyARM Nanopi A64"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-a64/genimage.cfg"
-- 
1.9.1
