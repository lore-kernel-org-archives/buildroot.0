From: Arthur LAMBERT <lambertarthur22@gmail.com>
Date: Fri, 26 Jun 2015 15:13:25 +0200
Subject: [Buildroot] [PATCH v3 1/1] board: add support for WarPboard
Message-ID: <1435324405-26828-1-git-send-email-lambertarthur22@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a set of patch to add support for warpboard (Freescale board based on imx6sl)

The patch contains :
  - defconfig for warpboard
  - linux patches from Fabio Estevam to fix device tree due to last change on warpboard schematics (rev 1.12)
  and to fix kernel imx_v6_v7 defconfig which use incorrect hci protocol
  - specific firmware file for warpboard bluetooth (nvram : brcmfmac4330-sdio.txt)

Origin of nvram config file for wifi :
https://github.com/Freescale/meta-fsl-arm-extra/blob/master/recipes-bsp/broadcom-nvram-config/files/imx6sl-warp/brcmfmac4330-sdio.txt

Signed-off-by: Arthur LAMBERT <arthur@dreem.com>
---
Changes v2 -> v3:
  - Use imx_v6_v7_defconfig instead of custom config.
  - Add patch to enable good hci protocol for bluetooth in kernel config
  - Use internal sdma firmware instead of external since the 1.12 integrate good firmware.
  - Fix some typo
  - Add some extra info in README and remove useless section
  - Fix patch naming convention
  - Use GLOBAL_PATH_DIR for all patches
  - Move some section in defconfig to keep .config ordering
  - Upgrade uboot to 2015.07-rc2 to fix bug on dfu process :
  http://git.denx.de/?p=u-boot.git;a=commitdiff;h=825adb991ab081a50a92e50cc54a1f42b7277c94
Changes v1 -> v2:
  - add specific kernel headers
  - use wget download rather than git download for kernel
  - fix version symbol for uboot
  - add imx_usb_loader host utility
  - remove bin firmware file and enable linux-firmware package instead
  - fix command to enable bluetooth and fix protocol for hci in custom kernel config

Signed-off-by: Arthur LAMBERT <lambertarthur22@gmail.com>
---
 board/freescale/warpboard/README                   |  49 ++++++++++
 .../warpboard/patches/linux/0001-hciuart-h4.patch  |  34 +++++++
 .../linux/0002-replace-uart2-by-uart5.patch        | 103 +++++++++++++++++++++
 .../lib/firmware/brcm/brcmfmac4330-sdio.txt        |  40 ++++++++
 configs/warpboard_defconfig                        |  41 ++++++++
 5 files changed, 267 insertions(+)
 create mode 100644 board/freescale/warpboard/README
 create mode 100644 board/freescale/warpboard/patches/linux/0001-hciuart-h4.patch
 create mode 100644 board/freescale/warpboard/patches/linux/0002-replace-uart2-by-uart5.patch
 create mode 100644 board/freescale/warpboard/rootfs_overlay/lib/firmware/brcm/brcmfmac4330-sdio.txt
 create mode 100644 configs/warpboard_defconfig

diff --git a/board/freescale/warpboard/README b/board/freescale/warpboard/README
new file mode 100644
index 0000000..860dc63
--- /dev/null
+++ b/board/freescale/warpboard/README
@@ -0,0 +1,49 @@
+Build
+=====
+
+First, configure Buildroot for your WarpBoard.
+  make warpboard_defconfig
+
+Build all components:
+  make
+
+You will find in ./output/images/ the following files:
+  - imx6sl-warp.dtb
+  - rootfs.ext2
+  - rootfs.tar
+  - u-boot.imx
+  - zImage
+
+Update uboot
+============
+
+- Put warpboard in USB download mode
+  closing the jumper j2  on daugther board
+- Load u-boot.imx in warpboard by using imx usb loader from host utility
+  $ ./imx_usb output/images/u-boot.imx
+- Uboot will appear in minicom
+- Use the default environment variables:
+ => env default -f -a
+ => saveenv
+- run the DFU command in uboot prompt:
+ => dfu 0 mmc 0
+- transfer uboot into flash by running this command in host side:
+ $ sudo dfu-util -D output/images/u-boot.imx -a boot
+- remove power and put warpboard into normal boot mode by opening the jumper.
+
+Update linux & rootfs
+=====================
+
+Use ums command from uboot prompt to mount emmc as mass storage and update zImage, device tree and rootfs file
+=> ums 0 mmc 0
+
+Put zimage and dtb file in warp-vfat and rootfs in warp-rootfs partition.
+
+Enable bluetooth (need to enable bluez-util)
+================
+hciattach /dev/ttymxc4 any
+hciconfig hci0 up
+
+Enable Wifi
+==========
+ifconfig wlan0 up
diff --git a/board/freescale/warpboard/patches/linux/0001-hciuart-h4.patch b/board/freescale/warpboard/patches/linux/0001-hciuart-h4.patch
new file mode 100644
index 0000000..f47541b
--- /dev/null
+++ b/board/freescale/warpboard/patches/linux/0001-hciuart-h4.patch
@@ -0,0 +1,34 @@
+From f6878a437a5ba157fd087ef5e1874bdce5eca199 Mon Sep 17 00:00:00 2001
+From: Fabio Estevam <fabio.estevam@freescale.com>
+Date: Mon, 22 Jun 2015 16:37:34 -0300
+Subject: [PATCH] ARM: imx_v6_v7_defconfig: Select HCIUART_H4
+
+The old warp board revision had hardware issues that prevented
+the RTS/CTS lines to work with the Bluetooth module.
+
+Tha latest rev1.12 fixes this problem, so now we should better use
+CONFIG_BT_HCIUART_H4 instead, as it provides a better throughput than
+the CONFIG_BT_HCIUART_3WIRE option.
+
+Suggested-by: Arthur Lambert <arthur@dreem.com>
+Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
+---
+ arch/arm/configs/imx_v6_v7_defconfig | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
+index f6989fb..c864295 100644
+--- a/arch/arm/configs/imx_v6_v7_defconfig
++++ b/arch/arm/configs/imx_v6_v7_defconfig
+@@ -73,7 +73,7 @@ CONFIG_CAN=y
+ CONFIG_CAN_FLEXCAN=y
+ CONFIG_BT=y
+ CONFIG_BT_HCIUART=y
+-CONFIG_BT_HCIUART_3WIRE=y
++CONFIG_BT_HCIUART_H4=y
+ CONFIG_CFG80211=y
+ CONFIG_CFG80211_WEXT=y
+ CONFIG_MAC80211=y
+-- 
+1.9.1
+
diff --git a/board/freescale/warpboard/patches/linux/0002-replace-uart2-by-uart5.patch b/board/freescale/warpboard/patches/linux/0002-replace-uart2-by-uart5.patch
new file mode 100644
index 0000000..d742c24
--- /dev/null
+++ b/board/freescale/warpboard/patches/linux/0002-replace-uart2-by-uart5.patch
@@ -0,0 +1,103 @@
+From: Fabio Estevam <fabio.estevam@freescale.com>
+Date: Fri, 29 May 2015 16:19:39 -0300
+Subject: [PATCH] ARM: dts: imx6sl-warp: Add changes for rev1.12
+
+Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
+---
+ arch/arm/boot/dts/imx6sl-warp.dts | 32 +++++++++++++++++++-------------
+ 1 file changed, 19 insertions(+), 13 deletions(-)
+
+diff --git a/arch/arm/boot/dts/imx6sl-warp.dts b/arch/arm/boot/dts/imx6sl-warp.dts
+index 0da906b..bdfa82b 100644
+--- a/arch/arm/boot/dts/imx6sl-warp.dts
++++ b/arch/arm/boot/dts/imx6sl-warp.dts
+@@ -61,7 +61,9 @@
+ 	usdhc3_pwrseq: usdhc3_pwrseq {
+ 		compatible = "mmc-pwrseq-simple";
+ 		reset-gpios = <&gpio4 5 GPIO_ACTIVE_LOW>, 	/* WL_REG_ON */
++			      <&gpio4 7 GPIO_ACTIVE_LOW>, 	/* WL_HOSTWAKE */
+ 			      <&gpio3 25 GPIO_ACTIVE_LOW>, 	/* BT_REG_ON */
++			      <&gpio3 27 GPIO_ACTIVE_LOW>,	/* BT_HOSTWAKE */
+ 			      <&gpio4 4 GPIO_ACTIVE_LOW>, 	/* BT_WAKE */
+ 			      <&gpio4 6 GPIO_ACTIVE_LOW>; 	/* BT_RST_N */
+ 	};
+@@ -73,16 +75,16 @@
+ 	status = "okay";
+ };
+ 
+-&uart2 {
++&uart3 {
+ 	pinctrl-names = "default";
+-	pinctrl-0 = <&pinctrl_uart2>;
+-	fsl,uart-has-rtscts;
++	pinctrl-0 = <&pinctrl_uart3>;
+ 	status = "okay";
+ };
+ 
+-&uart3 {
++&uart5 {
+ 	pinctrl-names = "default";
+-	pinctrl-0 = <&pinctrl_uart3>;
++	pinctrl-0 = <&pinctrl_uart5>;
++	fsl,uart-has-rtscts;
+ 	status = "okay";
+ };
+ 
+@@ -130,14 +132,6 @@
+ 			>;
+ 		};
+ 
+-		pinctrl_uart2: uart2grp {
+-			fsl,pins = <
+-				MX6SL_PAD_EPDC_D12__UART2_RX_DATA	0x41b0b1
+-				MX6SL_PAD_EPDC_D13__UART2_TX_DATA	0x41b0b1
+-				MX6SL_PAD_EPDC_D14__UART2_RTS_B		0x4130B1
+-				MX6SL_PAD_EPDC_D15__UART2_CTS_B		0x4130B1
+-			>;
+-		};
+ 
+ 		pinctrl_uart3: uart3grp {
+ 			fsl,pins = <
+@@ -146,6 +140,15 @@
+ 			>;
+ 		};
+ 
++		pinctrl_uart5: uart5grp {
++			fsl,pins = <
++				MX6SL_PAD_ECSPI1_SCLK__UART5_RX_DATA	0x41b0b1
++				MX6SL_PAD_ECSPI1_MOSI__UART5_TX_DATA	0x41b0b1
++				MX6SL_PAD_ECSPI1_MISO__UART5_RTS_B	0x4130b1
++				MX6SL_PAD_ECSPI1_SS0__UART5_CTS_B	0x4130b1
++			>;
++		};
++
+ 		pinctrl_usdhc2: usdhc2grp {
+ 			fsl,pins = <
+ 				MX6SL_PAD_SD2_CMD__SD2_CMD		0x417059
+@@ -158,6 +161,7 @@
+ 				MX6SL_PAD_SD2_DAT5__SD2_DATA5		0x417059
+ 				MX6SL_PAD_SD2_DAT6__SD2_DATA6		0x417059
+ 				MX6SL_PAD_SD2_DAT7__SD2_DATA7		0x417059
++				MX6SL_PAD_SD2_RST__SD2_RESET		0x417059
+ 			>;
+ 		};
+ 
+@@ -173,6 +177,7 @@
+ 				MX6SL_PAD_SD2_DAT5__SD2_DATA5		0x4170b9
+ 				MX6SL_PAD_SD2_DAT6__SD2_DATA6		0x4170b9
+ 				MX6SL_PAD_SD2_DAT7__SD2_DATA7		0x4170b9
++				MX6SL_PAD_SD2_RST__SD2_RESET		0x4170b9
+ 			>;
+ 		};
+ 
+@@ -188,6 +193,7 @@
+ 				MX6SL_PAD_SD2_DAT5__SD2_DATA5		0x4170f9
+ 				MX6SL_PAD_SD2_DAT6__SD2_DATA6		0x4170f9
+ 				MX6SL_PAD_SD2_DAT7__SD2_DATA7		0x4170f9
++				MX6SL_PAD_SD2_RST__SD2_RESET		0x4170f9
+ 			>;
+ 		};
+ 
+-- 
+1.9.1
+
diff --git a/board/freescale/warpboard/rootfs_overlay/lib/firmware/brcm/brcmfmac4330-sdio.txt b/board/freescale/warpboard/rootfs_overlay/lib/firmware/brcm/brcmfmac4330-sdio.txt
new file mode 100644
index 0000000..9546246
--- /dev/null
+++ b/board/freescale/warpboard/rootfs_overlay/lib/firmware/brcm/brcmfmac4330-sdio.txt
@@ -0,0 +1,40 @@
+# bcm94330wlsdgb.txt
+manfid=0x2d0
+prodid=0x0552
+vendid=0x14e4
+devid=0x4360
+boardtype=0x0552
+boardrev=0x11
+# this design has 2.4GHz SP3T switch
+boardflags=0x00080200
+nocrc=1
+xtalfreq=37400
+boardnum=22
+macaddr=00:90:4c:c5:12:38
+ag0=255
+aa2g=1
+ccode=CN
+pa0b0=0x14d0
+pa0b1=0xfd98
+pa0b2=0xff78
+rssismf2g=0xa
+rssismc2g=0x3
+rssisav2g=0x7
+maxp2ga0=0x50
+sromrev=3
+il0macaddr=00:90:4c:c5:12:38
+wl0id=0x431b
+cckPwrOffset=5
+ofdm2gpo=0x66666666
+mcs2gpo0=0x6666
+mcs2gpo1=0x6666
+swctrlmap_2g=0x04040404,0x02020202,0x02020404,0x10202,0x1ff
+swctrlmap_5g=0x00100010,0x00280020,0x00200010,0x14202,0x2f8
+rfreg033=0x19
+rfreg033_cck=0x1f
+dacrate2g=160
+txalpfbyp2g=1
+bphyscale=17
+cckPwrIdxCorr=-15
+pacalidx2g=45
+txgaintbl=1
diff --git a/configs/warpboard_defconfig b/configs/warpboard_defconfig
new file mode 100644
index 0000000..062c4e4
--- /dev/null
+++ b/configs/warpboard_defconfig
@@ -0,0 +1,41 @@
+# architecture
+BR2_arm=y
+BR2_cortex_a9=y
+
+# patches
+BR2_GLOBAL_PATCH_DIR="board/freescale/warpboard/patches/"
+
+# lock to 4.0 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="4.0"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_0=y
+
+# system
+BR2_TARGET_GENERIC_HOSTNAME="warpboard"
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+
+# rootfs overlay
+BR2_ROOTFS_OVERLAY="board/freescale/warpboard/rootfs_overlay"
+
+# kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="http://github.com/Freescale/linux-fslc/tarball/38ec11d/linux-fslc-38ec11d.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sl-warp"
+
+# wifi firmware for brcm4330
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX=y
+
+# uboot
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="warp"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.07-rc2"
+BR2_TARGET_UBOOT_FORMAT_IMX=y
+
+# host utility
+BR2_PACKAGE_HOST_IMX_USB_LOADER=y
-- 
1.9.1
