From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Jul 2017 17:34:25 +0200
Subject: [Buildroot] [git commit] configs/bananapro: bump Linux kernel to
	4.12.1
Message-ID: <20170715153828.5BF5080539@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea8aec0c261fda694a911a3d2176250c1361d79d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop the board specific patches which has been applied upstream.

[Peter: also drop now unused BR2_GLOBAL_PATCH_DIR]
Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ts-sun7i-Enable-audio-codec-on-Banana-Pro.patch | 35 ---------
 ...-dts-sun7i-Add-wifi-dt-node-on-Banana-Pro.patch | 85 ----------------------
 configs/bananapro_defconfig                        |  9 +--
 3 files changed, 3 insertions(+), 126 deletions(-)

diff --git a/board/lemaker/bananapro/patches/linux/0001-ARM-dts-sun7i-Enable-audio-codec-on-Banana-Pro.patch b/board/lemaker/bananapro/patches/linux/0001-ARM-dts-sun7i-Enable-audio-codec-on-Banana-Pro.patch
deleted file mode 100644
index 8552daa..0000000
--- a/board/lemaker/bananapro/patches/linux/0001-ARM-dts-sun7i-Enable-audio-codec-on-Banana-Pro.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 1647fe31882a105cef4c99770e4ec8ea47c5c653 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Wed, 4 Jan 2017 15:22:50 +0100
-Subject: [PATCH 1/1] ARM: dts: sun7i: Enable audio codec on Banana Pro
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This commit enables the on-chip audio codec present on the A20 SoC
-on the Banana Pro board.
-
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
-Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
----
- arch/arm/boot/dts/sun7i-a20-bananapro.dts | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/arch/arm/boot/dts/sun7i-a20-bananapro.dts b/arch/arm/boot/dts/sun7i-a20-bananapro.dts
-index 19d63d4049de..03799c647e13 100644
---- a/arch/arm/boot/dts/sun7i-a20-bananapro.dts
-+++ b/arch/arm/boot/dts/sun7i-a20-bananapro.dts
-@@ -104,6 +104,10 @@
- 	status = "okay";
- };
- 
-+&codec {
-+	status = "okay";
-+};
-+
- &ehci0 {
- 	status = "okay";
- };
--- 
-2.11.0
-
diff --git a/board/lemaker/bananapro/patches/linux/0002-ARM-dts-sun7i-Add-wifi-dt-node-on-Banana-Pro.patch b/board/lemaker/bananapro/patches/linux/0002-ARM-dts-sun7i-Add-wifi-dt-node-on-Banana-Pro.patch
deleted file mode 100644
index 7d514a8..0000000
--- a/board/lemaker/bananapro/patches/linux/0002-ARM-dts-sun7i-Add-wifi-dt-node-on-Banana-Pro.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From f2cb904f074bc7e90be475488872a82270e9bae7 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Mon, 9 Jan 2017 21:36:38 +0100
-Subject: [PATCH 2/2] ARM: dts: sun7i: Add wifi dt node on Banana Pro
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The Banana Pro has an AMPAK AP6181 WiFi+Bluetooth module. The WiFi part
-is a BCM43362 IC connected to MMC3 of the A20 SoC via SDIO. The IC also
-takes a power enable signal via GPIO.
-
-This commit adds a device-tree node to power it up, so the mmc subsys
-can scan it, and enables the mmc controller which is connected to it.
-
-As the wifi enable pin of the AP6181 module is not really a regulator,
-switch the mmc3 node to the mmc-pwrseq framework for controlling it.
-This more accurately reflectes how the hardware actually works.
-
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
-Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
----
- arch/arm/boot/dts/sun7i-a20-bananapro.dts | 29 +++++++++++++++++------------
- 1 file changed, 17 insertions(+), 12 deletions(-)
-
-diff --git a/arch/arm/boot/dts/sun7i-a20-bananapro.dts b/arch/arm/boot/dts/sun7i-a20-bananapro.dts
-index 03799c647e13..83516bc81225 100644
---- a/arch/arm/boot/dts/sun7i-a20-bananapro.dts
-+++ b/arch/arm/boot/dts/sun7i-a20-bananapro.dts
-@@ -76,6 +76,13 @@
- 		};
- 	};
- 
-+	wifi_pwrseq: wifi-pwrseq {
-+		compatible = "mmc-pwrseq-simple";
-+		pinctrl-names = "default";
-+		pinctrl-0 = <&vmmc3_pin_bananapro>;
-+		reset-gpios = <&pio 7 22 GPIO_ACTIVE_LOW>;
-+	};
-+
- 	reg_gmac_3v3: gmac-3v3 {
- 		compatible = "regulator-fixed";
- 		pinctrl-names = "default";
-@@ -87,17 +94,6 @@
- 		enable-active-high;
- 		gpio = <&pio 7 23 GPIO_ACTIVE_HIGH>;
- 	};
--
--	reg_vmmc3: vmmc3 {
--		compatible = "regulator-fixed";
--		pinctrl-names = "default";
--		pinctrl-0 = <&vmmc3_pin_bananapro>;
--		regulator-name = "vmmc3";
--		regulator-min-microvolt = <3300000>;
--		regulator-max-microvolt = <3300000>;
--		enable-active-high;
--		gpio = <&pio 7 22 GPIO_ACTIVE_HIGH>;
--	};
- };
- 
- &ahci {
-@@ -170,10 +166,19 @@
- &mmc3 {
- 	pinctrl-names = "default";
- 	pinctrl-0 = <&mmc3_pins_a>;
--	vmmc-supply = <&reg_vmmc3>;
-+	vmmc-supply = <&reg_vcc3v3>;
-+	mmc-pwrseq = <&wifi_pwrseq>;
- 	bus-width = <4>;
- 	non-removable;
- 	status = "okay";
-+
-+	brcmf: bcrmf at 1 {
-+		reg = <1>;
-+		compatible = "brcm,bcm4329-fmac";
-+		interrupt-parent = <&pio>;
-+		interrupts = <7 15 IRQ_TYPE_LEVEL_LOW>;
-+		interrupt-names = "host-wake";
-+	};
- };
- 
- &ohci0 {
--- 
-2.11.0
-
diff --git a/configs/bananapro_defconfig b/configs/bananapro_defconfig
index 0e6e230..d3768bf 100644
--- a/configs/bananapro_defconfig
+++ b/configs/bananapro_defconfig
@@ -4,15 +4,12 @@ BR2_cortex_a7=y
 BR2_ARM_EABIHF=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 4.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_10=y
+# Linux headers same as kernel, a 4.12 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_12=y
 
 # Toolchain
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 
-# Build options
-BR2_GLOBAL_PATCH_DIR="board/lemaker/bananapro/patches"
-
 # System configuration
 BR2_TARGET_GENERIC_HOSTNAME="bananapro"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Banana Pro!"
@@ -25,7 +22,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/lemaker/bananapro/post-image.sh"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.10.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.12.1"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/lemaker/bananapro/linux-wifi.fragment"
