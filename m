From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Feb 2018 22:04:25 +0100
Subject: [Buildroot] [git commit branch/next] configs/orange-pi-zero-plus2:
 enable WiFi support
Message-ID: <20180214210440.90D6684331@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=53ae154c77228b36d1d9ae0cad057de8879ad2bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Orange-Pi Zero Plus2 board has AP6212 WiFi/BT combo, but does
not have ethernet port. So it makes sense to enable wireless
networking by default:

- add DTS patch enabling AP6212 WiFi/BT combo support
  -- this patch is on its way to mainline Linux v4.16
- enable WiFi support in kernel config
- enable Broadcom brcmfmac kernel driver in kernel config
- add Broadcom wireless firmware package to image
- add basic wireless tools to image
- add mdev to image to enable module autoloading
- add rootfs overlay with proper NVRAM file for on-board AP6212 chip

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../orangepi-zero-plus2/linux-extras.config        | 10 +++
 ...64-dts-orange-pi-zero-plus2-enable-ap6212.patch | 73 ++++++++++++++++++++++
 .../lib/firmware/brcm/brcmfmac43430-sdio.txt       | 54 ++++++++++++++++
 configs/orangepi_zero_plus2_defconfig              | 17 ++++-
 4 files changed, 153 insertions(+), 1 deletion(-)

diff --git a/board/orangepi/orangepi-zero-plus2/linux-extras.config b/board/orangepi/orangepi-zero-plus2/linux-extras.config
new file mode 100644
index 0000000000..52b4b4b29e
--- /dev/null
+++ b/board/orangepi/orangepi-zero-plus2/linux-extras.config
@@ -0,0 +1,10 @@
+# wireless core
+CONFIG_WIRELESS=y
+CONFIG_CFG80211=y
+CONFIG_MAC80211=y
+CONFIG_CFG80211_WEXT=y
+
+# wireless drivers
+CONFIG_WLAN=y
+CONFIG_WLAN_VENDOR_BROADCOM=y
+CONFIG_BRCMFMAC=m
diff --git a/board/orangepi/orangepi-zero-plus2/patches/linux/linux-0001-arm64-dts-orange-pi-zero-plus2-enable-ap6212.patch b/board/orangepi/orangepi-zero-plus2/patches/linux/linux-0001-arm64-dts-orange-pi-zero-plus2-enable-ap6212.patch
new file mode 100644
index 0000000000..282e2171f2
--- /dev/null
+++ b/board/orangepi/orangepi-zero-plus2/patches/linux/linux-0001-arm64-dts-orange-pi-zero-plus2-enable-ap6212.patch
@@ -0,0 +1,73 @@
+From: Sergey Matyukevich <geomatsi@gmail.com>
+Date: Sun, 11 Feb 2018 16:21:43 +0300
+Subject: [PATCH] arm64: dts: orange-pi-zero-plus2: enable AP6212a WiFi/BT combo
+
+Enable AP6212a WiFi/BT combo chip on orange-pi-zero-plus2 board:
+- WiFi SDIO interface is connected to MMC1
+- WiFi REG_ON pin connected to gpio PA9: attach to mmc-pwrseq
+- WiFi HOST_WAKE pin connected to gpio PL7
+- BT is connected to UART1
+
+Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
+Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
+---
+ .../allwinner/sun50i-h5-orangepi-zero-plus2.dts    | 32 ++++++++++++++++++++++
+ 1 file changed, 32 insertions(+)
+
+diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
+index a42fd79a62a3..d415b7b67cce 100644
+--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
++++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
+@@ -64,6 +64,13 @@
+ 		regulator-min-microvolt = <3300000>;
+ 		regulator-max-microvolt = <3300000>;
+ 	};
++
++	wifi_pwrseq: wifi_pwrseq {
++		compatible = "mmc-pwrseq-simple";
++		pinctrl-names = "default";
++		reset-gpios = <&pio 0 9 GPIO_ACTIVE_LOW>; /* PA9 */
++		post-power-on-delay-ms = <200>;
++	};
+ };
+ 
+ &mmc0 {
+@@ -75,6 +82,25 @@
+ 	status = "okay";
+ };
+ 
++&mmc1 {
++	pinctrl-names = "default";
++	pinctrl-0 = <&mmc1_pins_a>;
++	vmmc-supply = <&reg_vcc3v3>;
++	vqmmc-supply = <&reg_vcc3v3>;
++	mmc-pwrseq = <&wifi_pwrseq>;
++	bus-width = <4>;
++	non-removable;
++	status = "okay";
++
++	brcmf: wifi at 1 {
++		reg = <1>;
++		compatible = "brcm,bcm4329-fmac";
++		interrupt-parent = <&r_pio>;
++		interrupts = <0 7 IRQ_TYPE_LEVEL_LOW>;	/* PL7 */
++		interrupt-names = "host-wake";
++	};
++};
++
+ &mmc2 {
+ 	pinctrl-names = "default";
+ 	pinctrl-0 = <&mmc2_8bit_pins>;
+@@ -90,3 +116,9 @@
+ 	pinctrl-0 = <&uart0_pins_a>;
+ 	status = "okay";
+ };
++
++&uart1 {
++	pinctrl-names = "default";
++	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
++	status = "okay";
++};
+-- 
+2.16.1
+
diff --git a/board/orangepi/orangepi-zero-plus2/rootfs_overlay/lib/firmware/brcm/brcmfmac43430-sdio.txt b/board/orangepi/orangepi-zero-plus2/rootfs_overlay/lib/firmware/brcm/brcmfmac43430-sdio.txt
new file mode 100644
index 0000000000..8f0bf69063
--- /dev/null
+++ b/board/orangepi/orangepi-zero-plus2/rootfs_overlay/lib/firmware/brcm/brcmfmac43430-sdio.txt
@@ -0,0 +1,54 @@
+#AP6212_NVRAM_V1.0_20140603
+# 2.4 GHz, 20 MHz BW mode
+
+# The following parameter values are just placeholders, need to be updated.
+manfid=0x2d0
+prodid=0x0726
+vendid=0x14e4
+devid=0x43e2
+boardtype=0x0726
+boardrev=0x1101
+boardnum=22
+macaddr=00:90:4c:c5:12:38
+sromrev=11
+boardflags=0x00404201
+xtalfreq=26000
+nocrc=1
+ag0=255
+aa2g=1
+ccode=ALL
+
+pa0itssit=0x20
+extpagain2g=0
+
+#PA parameters for 2.4GHz, measured at CHIP OUTPUT
+pa2ga0=-168,7161,-820
+AvVmid_c0=0x0,0xc8
+cckpwroffset0=5
+
+# PPR params
+maxp2ga0=90
+txpwrbckof=6
+cckbw202gpo=0x5555
+legofdmbw202gpo=0x77777777
+mcsbw202gpo=0xaaaaaaaa
+
+# OFDM IIR :
+ofdmdigfilttype=7
+# PAPD mode:
+papdmode=2
+
+il0macaddr=00:90:4c:c5:12:38
+wl0id=0x431b
+
+#OOB parameters
+hostwake=0x40
+hostrdy=0x41
+usbrdy=0x03
+usbrdydelay=100
+deadman_to=0xffffffff
+# muxenab: 0x1 for UART enable, 0x10 for Host awake
+muxenab=0x10
+# CLDO PWM voltage settings - 0x4 - 1.1 volt
+#cldo_pwm=0x4
+
diff --git a/configs/orangepi_zero_plus2_defconfig b/configs/orangepi_zero_plus2_defconfig
index 7906dba5c7..5ca6cf0fe2 100644
--- a/configs/orangepi_zero_plus2_defconfig
+++ b/configs/orangepi_zero_plus2_defconfig
@@ -2,8 +2,10 @@ BR2_aarch64=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_VFPV4=y
 
-# Linux headers same as kernel, a 4.15 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero-plus2/patches"
+BR2_ROOTFS_OVERLAY="board/orangepi/orangepi-zero-plus2/rootfs_overlay"
 
 # Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
@@ -35,6 +37,19 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15.2"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-orangepi-zero-plus2"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-zero-plus2/linux-extras.config"
+
+# wireless firmware
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX=y
+
+# wireless tools
+BR2_PACKAGE_IW=y
+BR2_PACKAGE_WIRELESS_TOOLS=y
+BR2_PACKAGE_WIRELESS_TOOLS_LIB=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_WPA_SUPPLICANT_NL80211=y
+BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
 
 # Filesystem
 BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi Zero Plus2"
