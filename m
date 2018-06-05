From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jun 2018 18:47:56 +0200
Subject: [Buildroot] [git commit] configs/orangepi_zero_plus2: bump linux to
 v4.16
Message-ID: <20180605164638.B962A811C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0bfeef622291697d25dafd5836bef6bbbd277240
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump linux as well headers to v4.16 version, this eventually drop the
wifi patch since it has been merged to Linux v4.16.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...64-dts-orange-pi-zero-plus2-enable-ap6212.patch | 73 ----------------------
 configs/orangepi_zero_plus2_defconfig              |  5 +-
 2 files changed, 2 insertions(+), 76 deletions(-)

diff --git a/board/orangepi/orangepi-zero-plus2/patches/linux/linux-0001-arm64-dts-orange-pi-zero-plus2-enable-ap6212.patch b/board/orangepi/orangepi-zero-plus2/patches/linux/linux-0001-arm64-dts-orange-pi-zero-plus2-enable-ap6212.patch
deleted file mode 100644
index 282e2171f2..0000000000
--- a/board/orangepi/orangepi-zero-plus2/patches/linux/linux-0001-arm64-dts-orange-pi-zero-plus2-enable-ap6212.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From: Sergey Matyukevich <geomatsi@gmail.com>
-Date: Sun, 11 Feb 2018 16:21:43 +0300
-Subject: [PATCH] arm64: dts: orange-pi-zero-plus2: enable AP6212a WiFi/BT combo
-
-Enable AP6212a WiFi/BT combo chip on orange-pi-zero-plus2 board:
-- WiFi SDIO interface is connected to MMC1
-- WiFi REG_ON pin connected to gpio PA9: attach to mmc-pwrseq
-- WiFi HOST_WAKE pin connected to gpio PL7
-- BT is connected to UART1
-
-Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
-Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
----
- .../allwinner/sun50i-h5-orangepi-zero-plus2.dts    | 32 ++++++++++++++++++++++
- 1 file changed, 32 insertions(+)
-
-diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
-index a42fd79a62a3..d415b7b67cce 100644
---- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
-+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
-@@ -64,6 +64,13 @@
- 		regulator-min-microvolt = <3300000>;
- 		regulator-max-microvolt = <3300000>;
- 	};
-+
-+	wifi_pwrseq: wifi_pwrseq {
-+		compatible = "mmc-pwrseq-simple";
-+		pinctrl-names = "default";
-+		reset-gpios = <&pio 0 9 GPIO_ACTIVE_LOW>; /* PA9 */
-+		post-power-on-delay-ms = <200>;
-+	};
- };
- 
- &mmc0 {
-@@ -75,6 +82,25 @@
- 	status = "okay";
- };
- 
-+&mmc1 {
-+	pinctrl-names = "default";
-+	pinctrl-0 = <&mmc1_pins_a>;
-+	vmmc-supply = <&reg_vcc3v3>;
-+	vqmmc-supply = <&reg_vcc3v3>;
-+	mmc-pwrseq = <&wifi_pwrseq>;
-+	bus-width = <4>;
-+	non-removable;
-+	status = "okay";
-+
-+	brcmf: wifi at 1 {
-+		reg = <1>;
-+		compatible = "brcm,bcm4329-fmac";
-+		interrupt-parent = <&r_pio>;
-+		interrupts = <0 7 IRQ_TYPE_LEVEL_LOW>;	/* PL7 */
-+		interrupt-names = "host-wake";
-+	};
-+};
-+
- &mmc2 {
- 	pinctrl-names = "default";
- 	pinctrl-0 = <&mmc2_8bit_pins>;
-@@ -90,3 +116,9 @@
- 	pinctrl-0 = <&uart0_pins_a>;
- 	status = "okay";
- };
-+
-+&uart1 {
-+	pinctrl-names = "default";
-+	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
-+	status = "okay";
-+};
--- 
-2.16.1
-
diff --git a/configs/orangepi_zero_plus2_defconfig b/configs/orangepi_zero_plus2_defconfig
index 5ca6cf0fe2..8c83b3acd1 100644
--- a/configs/orangepi_zero_plus2_defconfig
+++ b/configs/orangepi_zero_plus2_defconfig
@@ -2,9 +2,8 @@ BR2_aarch64=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_VFPV4=y
 
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
-BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero-plus2/patches"
 BR2_ROOTFS_OVERLAY="board/orangepi/orangepi-zero-plus2/rootfs_overlay"
 
 # Firmware
@@ -33,7 +32,7 @@ BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-zero-plus2/boot.cmd
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-orangepi-zero-plus2"
