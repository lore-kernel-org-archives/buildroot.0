From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Tue, 13 Dec 2016 15:50:17 -0200
Subject: [Buildroot] [PATCH] configs/imx6ulpico: Bump to kernel 4.9
Message-ID: <1481651417-31409-1-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to kernel 4.9 and remove the wifi dts patch as it is already
part of 4.9.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 .../imx6ulpico/patches/linux/0001-picowifi.patch   | 66 ----------------------
 configs/imx6ulpico_defconfig                       |  9 +--
 2 files changed, 3 insertions(+), 72 deletions(-)
 delete mode 100644 board/technexion/imx6ulpico/patches/linux/0001-picowifi.patch

diff --git a/board/technexion/imx6ulpico/patches/linux/0001-picowifi.patch b/board/technexion/imx6ulpico/patches/linux/0001-picowifi.patch
deleted file mode 100644
index c657491..0000000
--- a/board/technexion/imx6ulpico/patches/linux/0001-picowifi.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 5a9a0986ab0041b53f55e2f4eaedabecb2ea1760 Mon Sep 17 00:00:00 2001
-From: Vanessa Maegima <vanessa.maegima@nxp.com>
-Date: Mon, 1 Aug 2016 09:33:00 -0300
-Subject: [PATCH v2] ARM: dts: imx6ul-pico-hobbit: Add Wifi support
-
-imx6ul-pico-hobbit has a bcm4339 wifi chip connected to usdhc2 port.
-
-Add support for the WL_REG_ON regulator, so that Wifi can be
-functional on this board.
-
-Signed-off-by: Vanessa Maegima <vanessa.maegima@nxp.com>
-Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
----
-Changes since v1:
-- Improve commit log
-- Remove WL_HOST_WAKE
-
- arch/arm/boot/dts/imx6ul-pico-hobbit.dts | 20 ++++++++++++++++++++
- 1 file changed, 20 insertions(+)
-
-diff --git a/arch/arm/boot/dts/imx6ul-pico-hobbit.dts b/arch/arm/boot/dts/imx6ul-pico-hobbit.dts
-index 8ce1fec..af2e06b 100644
---- a/arch/arm/boot/dts/imx6ul-pico-hobbit.dts
-+++ b/arch/arm/boot/dts/imx6ul-pico-hobbit.dts
-@@ -100,6 +100,18 @@
-		gpio = <&gpio1 6 0>;
-	};
-
-+	reg_brcm: brcm-reg {
-+		compatible = "regulator-fixed";
-+		enable-active-high;
-+		gpio = <&gpio4 8 GPIO_ACTIVE_HIGH>;
-+		pinctrl-names = "default";
-+		pinctrl-0 = <&pinctrl_brcm_reg>;
-+		regulator-name = "brcm_reg";
-+		regulator-min-microvolt = <3300000>;
-+		regulator-max-microvolt = <3300000>;
-+		startup-delay-us = <200000>;
-+	};
-+
-	sound {
-		compatible = "fsl,imx-audio-sgtl5000";
-		model = "imx6ul-sgtl5000";
-@@ -325,12 +337,20 @@
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_usdhc2>;
-	no-1-8-v;
-+	non-removable;
-	keep-power-in-suspend;
-	wakeup-source;
-+	vmmc-supply = <&reg_brcm>;
-	status = "okay";
- };
-
- &iomuxc {
-+	pinctrl_brcm_reg: brcmreggrp {
-+		fsl,pins = <
-+			MX6UL_PAD_NAND_DATA06__GPIO4_IO08	0x10b0	/* WL_REG_ON */
-+		>;
-+	};
-+
-	pinctrl_enet2: enet2grp {
-		fsl,pins = <
-			MX6UL_PAD_ENET1_TX_DATA1__ENET2_MDIO	0x1b0b0
---
-1.9.1
diff --git a/configs/imx6ulpico_defconfig b/configs/imx6ulpico_defconfig
index 7b99654..662b9ab 100644
--- a/configs/imx6ulpico_defconfig
+++ b/configs/imx6ulpico_defconfig
@@ -2,8 +2,8 @@
 BR2_arm=y
 BR2_cortex_a7=y
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc5"
@@ -11,13 +11,10 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc5"
 # rootfs overlay
 BR2_ROOTFS_OVERLAY="board/technexion/imx6ulpico/rootfs_overlay"
 
-# patches
-BR2_GLOBAL_PATCH_DIR="board/technexion/imx6ulpico/patches"
-
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.11"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/technexion/imx6ulpico/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.7.4
