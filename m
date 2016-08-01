From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Aug 2016 22:11:05 +0200
Subject: [Buildroot] [git commit] configs: imx6ulpico: Add Wifi support
Message-ID: <20160801201112.49E5980741@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02bb84cb600fbaa81a1a951206dfb6e167afc6f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

imx6ulpico has a BCM4339 Wifi chip. Add Wifi support by default
to allow a better customer experience.

The dts patch has already been sent to the linux-arm-kernel list
and we can remove it once it reaches a mainline kernel (in
version 4.9 probably).

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/technexion/imx6ulpico/linux.fragment         |   1 +
 .../imx6ulpico/patches/linux/0001-picowifi.patch   |  66 +++++++++++++
 board/technexion/imx6ulpico/readme.txt             |  11 +++
 .../lib/firmware/brcm/brcmfmac4339-sdio.txt        | 102 +++++++++++++++++++++
 configs/imx6ulpico_defconfig                       |  16 ++++
 5 files changed, 196 insertions(+)

diff --git a/board/technexion/imx6ulpico/linux.fragment b/board/technexion/imx6ulpico/linux.fragment
new file mode 100644
index 0000000..892d0cb
--- /dev/null
+++ b/board/technexion/imx6ulpico/linux.fragment
@@ -0,0 +1 @@
+CONFIG_CFG80211_WEXT=y
diff --git a/board/technexion/imx6ulpico/patches/linux/0001-picowifi.patch b/board/technexion/imx6ulpico/patches/linux/0001-picowifi.patch
new file mode 100644
index 0000000..c657491
--- /dev/null
+++ b/board/technexion/imx6ulpico/patches/linux/0001-picowifi.patch
@@ -0,0 +1,66 @@
+From 5a9a0986ab0041b53f55e2f4eaedabecb2ea1760 Mon Sep 17 00:00:00 2001
+From: Vanessa Maegima <vanessa.maegima@nxp.com>
+Date: Mon, 1 Aug 2016 09:33:00 -0300
+Subject: [PATCH v2] ARM: dts: imx6ul-pico-hobbit: Add Wifi support
+
+imx6ul-pico-hobbit has a bcm4339 wifi chip connected to usdhc2 port.
+
+Add support for the WL_REG_ON regulator, so that Wifi can be
+functional on this board.
+
+Signed-off-by: Vanessa Maegima <vanessa.maegima@nxp.com>
+Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
+---
+Changes since v1:
+- Improve commit log
+- Remove WL_HOST_WAKE
+
+ arch/arm/boot/dts/imx6ul-pico-hobbit.dts | 20 ++++++++++++++++++++
+ 1 file changed, 20 insertions(+)
+
+diff --git a/arch/arm/boot/dts/imx6ul-pico-hobbit.dts b/arch/arm/boot/dts/imx6ul-pico-hobbit.dts
+index 8ce1fec..af2e06b 100644
+--- a/arch/arm/boot/dts/imx6ul-pico-hobbit.dts
++++ b/arch/arm/boot/dts/imx6ul-pico-hobbit.dts
+@@ -100,6 +100,18 @@
+		gpio = <&gpio1 6 0>;
+	};
+
++	reg_brcm: brcm-reg {
++		compatible = "regulator-fixed";
++		enable-active-high;
++		gpio = <&gpio4 8 GPIO_ACTIVE_HIGH>;
++		pinctrl-names = "default";
++		pinctrl-0 = <&pinctrl_brcm_reg>;
++		regulator-name = "brcm_reg";
++		regulator-min-microvolt = <3300000>;
++		regulator-max-microvolt = <3300000>;
++		startup-delay-us = <200000>;
++	};
++
+	sound {
+		compatible = "fsl,imx-audio-sgtl5000";
+		model = "imx6ul-sgtl5000";
+@@ -325,12 +337,20 @@
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc2>;
+	no-1-8-v;
++	non-removable;
+	keep-power-in-suspend;
+	wakeup-source;
++	vmmc-supply = <&reg_brcm>;
+	status = "okay";
+ };
+
+ &iomuxc {
++	pinctrl_brcm_reg: brcmreggrp {
++		fsl,pins = <
++			MX6UL_PAD_NAND_DATA06__GPIO4_IO08	0x10b0	/* WL_REG_ON */
++		>;
++	};
++
+	pinctrl_enet2: enet2grp {
+		fsl,pins = <
+			MX6UL_PAD_ENET1_TX_DATA1__ENET2_MDIO	0x1b0b0
+--
+1.9.1
diff --git a/board/technexion/imx6ulpico/readme.txt b/board/technexion/imx6ulpico/readme.txt
index 8046bdb..ff78412 100644
--- a/board/technexion/imx6ulpico/readme.txt
+++ b/board/technexion/imx6ulpico/readme.txt
@@ -56,4 +56,15 @@ To boot your newly created system:
   emulator@115200 bps, 8n1;
 - power on the board.
 
+Using Wifi
+==========
+
+# modprobe brcmfmac
+# iwconfig wlan0 essid ACCESSPOINTNAME
+# wpa_passphrase ACCESSPOINTNAME > /etc/wpa.conf
+(enter the wifi password and press enter)
+# wpa_supplicant -Dwext -iwlan0 -c /etc/wpa.conf &
+# udhcpc -i wlan0
+# ping buildroot.org
+
 Enjoy!
diff --git a/board/technexion/imx6ulpico/rootfs_overlay/lib/firmware/brcm/brcmfmac4339-sdio.txt b/board/technexion/imx6ulpico/rootfs_overlay/lib/firmware/brcm/brcmfmac4339-sdio.txt
new file mode 100644
index 0000000..4716c7e
--- /dev/null
+++ b/board/technexion/imx6ulpico/rootfs_overlay/lib/firmware/brcm/brcmfmac4339-sdio.txt
@@ -0,0 +1,102 @@
+# Sample NVRAM for BCM94339 WLCSP with eTR,iPA, and eLNA.
+sromrev=11
+boardrev=0x1100
+boardtype=0x06c9
+boardflags=0x10081401
+boardflags2=0x00000000
+boardflags3=0x08001188
+#boardnum=57410
+macaddr=00:90:4c:c5:12:38
+ccode=0
+regrev=0
+antswitch=0
+pdgain2g=7
+pdgain5g=7
+tworangetssi2g=0
+tworangetssi5g=0
+vendid=0x14e4
+devid=0x43ae
+manfid=0x2d0
+#prodid=0x052e
+nocrc=1
+otpimagesize=502
+xtalfreq=37400
+extpagain2g=2
+pdetrange2g=2
+extpagain5g=2
+pdetrange5g=2
+rxgains2gelnagaina0=2
+rxgains2gtrisoa0=6
+rxgains2gtrelnabypa0=1
+rxgains5gelnagaina0=4
+rxgains5gtrisoa0=4
+rxgains5gtrelnabypa0=1
+rxchain=1
+txchain=1
+aa2g=1
+aa5g=1
+tssipos5g=0
+tssipos2g=0
+pa2ga0=0xFF47,0x17B5,0xFD2B
+pa2gccka0=0xFF5F,0x1B46,0xFCCC
+pa5ga0=0xff54,0x16ec,0xfd45,0xff52,0x16a1,0xfd4d,0xff46,0x15b7,0xfd5a,0xff56,0x156d,0xfd79
+pa5gbw40a0=0xff59,0x17ca,0xfd30,0xff42,0x163d,0xfd4b,0xff31,0x152e,0xfd55,0xff60,0x16d8,0xfd54
+pa5gbw80a0=0xff56,0x1740,0xfd3f,0xff50,0x1738,0xfd3d,0xff4d,0x16b4,0xfd42,0xff58,0x1634,0xfd60
+# Default Target Power for 2G -- 17dBm(11)/14dBm(54)/13dBm(MCS7)/12dBm(MCS8)/12dBm(MCS9)
+maxp2ga0=74
+maxp5ga0=74,74,74,74
+cckbw202gpo=0x0000
+cckbw20ul2gpo=0x0000
+mcsbw202gpo=0xaa888888
+mcsbw402gpo=0xaa888888
+dot11agofdmhrbw202gpo=0x6666
+ofdmlrbw202gpo=0x0066
+tssifloor2g=500
+# Default Target Power for 5G -- 14dBm(54)/13dBm(MCS7)/12dBm(MCS8)/12dBm(MCS9)
+mcsbw205glpo=0xaa866666
+mcsbw405glpo=0xaa866666
+mcsbw805glpo=0xaa866666
+mcsbw205gmpo=0xaa866666
+mcsbw405gmpo=0xaa866666
+mcsbw805gmpo=0xaa866666
+mcsbw205ghpo=0xaa866666
+mcsbw405ghpo=0xaa866666
+mcsbw805ghpo=0xaa866666
+mcslr5glpo=0x0000
+mcslr5gmpo=0x0000
+mcslr5ghpo=0x0000
+sb20in40hrpo=0x0
+sb20in80and160hr5glpo=0x0
+sb40and80hr5glpo=0x0
+sb20in80and160hr5gmpo=0x0
+sb40and80hr5gmpo=0x0
+sb20in80and160hr5ghpo=0x0
+sb40and80hr5ghpo=0x0
+sb20in40lrpo=0x0
+sb20in80and160lr5glpo=0x0
+sb40and80lr5glpo=0x0
+sb20in80and160lr5gmpo=0x0
+sb40and80lr5gmpo=0x0
+sb20in80and160lr5ghpo=0x0
+sb40and80lr5ghpo=0x0
+dot11agduphrpo=0x0
+dot11agduplrpo=0x0
+phycal_tempdelta=25
+cckdigfilttype=2
+swctrlmap_5g=0x00080008,0x00500010,0x00100008,0x000000,0x078
+swctrlmap_2g=0x00010001,0x00220002,0x00020001,0x042202,0x1ff
+swctrlmapext_5g=0x00000000,0x00000000,0x00000000,0x000000,0x000
+swctrlmapext_2g=0x00000000,0x00000000,0x00000000,0x000000,0x000
+#
+#GPIO 0 for SDIO HW OOB interruption
+#muxenab=0x10
+#sd_gpout=0
+#sd_oobonly=1
+#
+rssicorrnorm_c0=-2,0
+rssicorrnorm5g_c0=3,5,2,3,4,2,2,3,1,2,3,1
+## ED threshold level to address the new ETSI requirement - 10/31/2013
+ed_thresh2g=-77
+ed_thresh5g=-77
+#
+paparambwver=1
diff --git a/configs/imx6ulpico_defconfig b/configs/imx6ulpico_defconfig
index 2372636..8406226 100644
--- a/configs/imx6ulpico_defconfig
+++ b/configs/imx6ulpico_defconfig
@@ -8,14 +8,30 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc5"
 
+# rootfs overlay
+BR2_ROOTFS_OVERLAY="board/technexion/imx6ulpico/rootfs_overlay"
+
+# patches
+BR2_GLOBAL_PATCH_DIR="board/technexion/imx6ulpico/patches"
+
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/technexion/imx6ulpico/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ul-pico-hobbit"
 
+# wifi firmware for brcm4339
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX=y
+
+# wireless packages
+BR2_PACKAGE_WIRELESS_TOOLS=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
+
 # bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="pico-imx6ul"
