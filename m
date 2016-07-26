From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 26 Jul 2016 16:01:34 -0300
Subject: [Buildroot] [PATCH] configs: warpboard: Move to kernel version
	4.4.15
Message-ID: <1469559694-17562-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <fabio.estevam@nxp.com>

Currently warpboard uses a 4.0.5 kernel version from github.

Move to version 4.4.15, which is a long term supported kernel version.

With 4.4.15 we no longer need the extra two kernel patches as they have
already been upstreamed.

Use a linux fragment file, so that wireless can be functional by default.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
This one applies against
[PATCH v3] configs/warpboard: Generate an sdcard image

 board/freescale/warpboard/linux.fragment           |   2 +
 .../warpboard/patches/linux/0001-hciuart-h4.patch  |  34 -------
 .../linux/0002-replace-uart2-by-uart5.patch        | 103 ---------------------
 configs/warpboard_defconfig                        |   9 +-
 4 files changed, 7 insertions(+), 141 deletions(-)
 create mode 100644 board/freescale/warpboard/linux.fragment
 delete mode 100644 board/freescale/warpboard/patches/linux/0001-hciuart-h4.patch
 delete mode 100644 board/freescale/warpboard/patches/linux/0002-replace-uart2-by-uart5.patch

diff --git a/board/freescale/warpboard/linux.fragment b/board/freescale/warpboard/linux.fragment
new file mode 100644
index 0000000..736b9cd
--- /dev/null
+++ b/board/freescale/warpboard/linux.fragment
@@ -0,0 +1,2 @@
+CONFIG_CFG80211_WEXT=y
+CONFIG_BRCMFMAC=y
diff --git a/board/freescale/warpboard/patches/linux/0001-hciuart-h4.patch b/board/freescale/warpboard/patches/linux/0001-hciuart-h4.patch
deleted file mode 100644
index f47541b..0000000
--- a/board/freescale/warpboard/patches/linux/0001-hciuart-h4.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From f6878a437a5ba157fd087ef5e1874bdce5eca199 Mon Sep 17 00:00:00 2001
-From: Fabio Estevam <fabio.estevam@freescale.com>
-Date: Mon, 22 Jun 2015 16:37:34 -0300
-Subject: [PATCH] ARM: imx_v6_v7_defconfig: Select HCIUART_H4
-
-The old warp board revision had hardware issues that prevented
-the RTS/CTS lines to work with the Bluetooth module.
-
-Tha latest rev1.12 fixes this problem, so now we should better use
-CONFIG_BT_HCIUART_H4 instead, as it provides a better throughput than
-the CONFIG_BT_HCIUART_3WIRE option.
-
-Suggested-by: Arthur Lambert <arthur@dreem.com>
-Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
----
- arch/arm/configs/imx_v6_v7_defconfig | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
-index f6989fb..c864295 100644
---- a/arch/arm/configs/imx_v6_v7_defconfig
-+++ b/arch/arm/configs/imx_v6_v7_defconfig
-@@ -73,7 +73,7 @@ CONFIG_CAN=y
- CONFIG_CAN_FLEXCAN=y
- CONFIG_BT=y
- CONFIG_BT_HCIUART=y
--CONFIG_BT_HCIUART_3WIRE=y
-+CONFIG_BT_HCIUART_H4=y
- CONFIG_CFG80211=y
- CONFIG_CFG80211_WEXT=y
- CONFIG_MAC80211=y
--- 
-1.9.1
-
diff --git a/board/freescale/warpboard/patches/linux/0002-replace-uart2-by-uart5.patch b/board/freescale/warpboard/patches/linux/0002-replace-uart2-by-uart5.patch
deleted file mode 100644
index d742c24..0000000
--- a/board/freescale/warpboard/patches/linux/0002-replace-uart2-by-uart5.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From: Fabio Estevam <fabio.estevam@freescale.com>
-Date: Fri, 29 May 2015 16:19:39 -0300
-Subject: [PATCH] ARM: dts: imx6sl-warp: Add changes for rev1.12
-
-Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
----
- arch/arm/boot/dts/imx6sl-warp.dts | 32 +++++++++++++++++++-------------
- 1 file changed, 19 insertions(+), 13 deletions(-)
-
-diff --git a/arch/arm/boot/dts/imx6sl-warp.dts b/arch/arm/boot/dts/imx6sl-warp.dts
-index 0da906b..bdfa82b 100644
---- a/arch/arm/boot/dts/imx6sl-warp.dts
-+++ b/arch/arm/boot/dts/imx6sl-warp.dts
-@@ -61,7 +61,9 @@
- 	usdhc3_pwrseq: usdhc3_pwrseq {
- 		compatible = "mmc-pwrseq-simple";
- 		reset-gpios = <&gpio4 5 GPIO_ACTIVE_LOW>, 	/* WL_REG_ON */
-+			      <&gpio4 7 GPIO_ACTIVE_LOW>, 	/* WL_HOSTWAKE */
- 			      <&gpio3 25 GPIO_ACTIVE_LOW>, 	/* BT_REG_ON */
-+			      <&gpio3 27 GPIO_ACTIVE_LOW>,	/* BT_HOSTWAKE */
- 			      <&gpio4 4 GPIO_ACTIVE_LOW>, 	/* BT_WAKE */
- 			      <&gpio4 6 GPIO_ACTIVE_LOW>; 	/* BT_RST_N */
- 	};
-@@ -73,16 +75,16 @@
- 	status = "okay";
- };
- 
--&uart2 {
-+&uart3 {
- 	pinctrl-names = "default";
--	pinctrl-0 = <&pinctrl_uart2>;
--	fsl,uart-has-rtscts;
-+	pinctrl-0 = <&pinctrl_uart3>;
- 	status = "okay";
- };
- 
--&uart3 {
-+&uart5 {
- 	pinctrl-names = "default";
--	pinctrl-0 = <&pinctrl_uart3>;
-+	pinctrl-0 = <&pinctrl_uart5>;
-+	fsl,uart-has-rtscts;
- 	status = "okay";
- };
- 
-@@ -130,14 +132,6 @@
- 			>;
- 		};
- 
--		pinctrl_uart2: uart2grp {
--			fsl,pins = <
--				MX6SL_PAD_EPDC_D12__UART2_RX_DATA	0x41b0b1
--				MX6SL_PAD_EPDC_D13__UART2_TX_DATA	0x41b0b1
--				MX6SL_PAD_EPDC_D14__UART2_RTS_B		0x4130B1
--				MX6SL_PAD_EPDC_D15__UART2_CTS_B		0x4130B1
--			>;
--		};
- 
- 		pinctrl_uart3: uart3grp {
- 			fsl,pins = <
-@@ -146,6 +140,15 @@
- 			>;
- 		};
- 
-+		pinctrl_uart5: uart5grp {
-+			fsl,pins = <
-+				MX6SL_PAD_ECSPI1_SCLK__UART5_RX_DATA	0x41b0b1
-+				MX6SL_PAD_ECSPI1_MOSI__UART5_TX_DATA	0x41b0b1
-+				MX6SL_PAD_ECSPI1_MISO__UART5_RTS_B	0x4130b1
-+				MX6SL_PAD_ECSPI1_SS0__UART5_CTS_B	0x4130b1
-+			>;
-+		};
-+
- 		pinctrl_usdhc2: usdhc2grp {
- 			fsl,pins = <
- 				MX6SL_PAD_SD2_CMD__SD2_CMD		0x417059
-@@ -158,6 +161,7 @@
- 				MX6SL_PAD_SD2_DAT5__SD2_DATA5		0x417059
- 				MX6SL_PAD_SD2_DAT6__SD2_DATA6		0x417059
- 				MX6SL_PAD_SD2_DAT7__SD2_DATA7		0x417059
-+				MX6SL_PAD_SD2_RST__SD2_RESET		0x417059
- 			>;
- 		};
- 
-@@ -173,6 +177,7 @@
- 				MX6SL_PAD_SD2_DAT5__SD2_DATA5		0x4170b9
- 				MX6SL_PAD_SD2_DAT6__SD2_DATA6		0x4170b9
- 				MX6SL_PAD_SD2_DAT7__SD2_DATA7		0x4170b9
-+				MX6SL_PAD_SD2_RST__SD2_RESET		0x4170b9
- 			>;
- 		};
- 
-@@ -188,6 +193,7 @@
- 				MX6SL_PAD_SD2_DAT5__SD2_DATA5		0x4170f9
- 				MX6SL_PAD_SD2_DAT6__SD2_DATA6		0x4170f9
- 				MX6SL_PAD_SD2_DAT7__SD2_DATA7		0x4170f9
-+				MX6SL_PAD_SD2_RST__SD2_RESET		0x4170f9
- 			>;
- 		};
- 
--- 
-1.9.1
-
diff --git a/configs/warpboard_defconfig b/configs/warpboard_defconfig
index 562dc33..ee6c6cc 100644
--- a/configs/warpboard_defconfig
+++ b/configs/warpboard_defconfig
@@ -5,8 +5,8 @@ BR2_cortex_a9=y
 # patches
 BR2_GLOBAL_PATCH_DIR="board/freescale/warpboard/patches"
 
-# Linux headers same as kernel, a 4.0 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_0=y
+# Linux headers same as kernel, a 4.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 
 # system
 BR2_TARGET_GENERIC_HOSTNAME="warpboard"
@@ -17,9 +17,10 @@ BR2_ROOTFS_OVERLAY="board/freescale/warpboard/rootfs_overlay"
 
 # kernel
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="http://github.com/Freescale/linux-fslc/tarball/38ec11d/linux-fslc-38ec11d.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.15"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/freescale/warpboard/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sl-warp"
 
-- 
1.9.1
