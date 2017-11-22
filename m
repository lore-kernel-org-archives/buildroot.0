From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 21:47:48 +0100
Subject: [Buildroot] [git commit branch/next] board/lego/ev3: update to 4.14
 kernel and 2017.11 U-Boot
Message-ID: <20171122204049.E2186810D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd6187491976cdfb97bcddbeaddf7f8c35f8e391
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This updates the LEGO MINDSTORMS EV3 board to Linux kernel 4.14 and
U-Boot 2017.11.

* Kernel patches are dropped because they are in mainline now.
* This caused the kernel image to be >3M so some adjustments to the image
  sizes/layout needed to be made in U-Boot.
* Updated U-Boot version bumped since we are touching this config anyway

Signed-off-by: David Lechner <david@lechnology.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/lego/ev3/genimage.cfg                        |  6 +-
 board/lego/ev3/linux.fragment                      |  6 ++
 .../patches/linux/0001-adc-device-tree-node.patch  | 56 --------------
 .../linux/0002-sound-device-tree-node.patch        | 85 ----------------------
 ...onfigs-legoev3-increase-flash-image-sizes.patch | 31 ++++++++
 configs/lego_ev3_defconfig                         |  8 +-
 6 files changed, 44 insertions(+), 148 deletions(-)

diff --git a/board/lego/ev3/genimage.cfg b/board/lego/ev3/genimage.cfg
index 0ec580c..3da3048 100644
--- a/board/lego/ev3/genimage.cfg
+++ b/board/lego/ev3/genimage.cfg
@@ -20,13 +20,13 @@ image flash.bin {
 	}
 	partition uimage {
 		image = "uImage.da850-lego-ev3"
-		size = 3M
+		size = 4M
 		offset = 0x50000
 	}
 	partition rootfs {
 		image = "rootfs.squashfs"
-		size = 9600K
-		offset = 0x350000
+		size = 10M
+		offset = 0x450000
 	}
 }
 
diff --git a/board/lego/ev3/linux.fragment b/board/lego/ev3/linux.fragment
index 439cccf..30dea57 100644
--- a/board/lego/ev3/linux.fragment
+++ b/board/lego/ev3/linux.fragment
@@ -54,3 +54,9 @@ CONFIG_SQUASHFS=y
 CONFIG_SQUASHFS_LZ4=y
 CONFIG_SQUASHFS_LZO=y
 CONFIG_SQUASHFS_XZ=y
+CONFIG_DRM=y
+CONFIG_DRM_TILCDC=n
+CONFIG_DRM_DUMB_VGA_DAC=n
+CONFIG_DRM_TINYDRM=y
+CONFIG_TINYDRM_ST7586=y
+CONFIG_FB_DA8XX=n
diff --git a/board/lego/ev3/patches/linux/0001-adc-device-tree-node.patch b/board/lego/ev3/patches/linux/0001-adc-device-tree-node.patch
deleted file mode 100644
index dabda1e..0000000
--- a/board/lego/ev3/patches/linux/0001-adc-device-tree-node.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 8a81ff173c5c9a0ab1df84fab17971dbcce8490a Mon Sep 17 00:00:00 2001
-From: David Lechner <david@lechnology.com>
-Date: Tue, 7 Feb 2017 13:22:07 -0600
-Subject: ARM: da850-lego-ev3: Add device tree node for A/DC
-
-This adds a node for the TI ADS7957 analog/digital converter on LEGO
-MINDSTORMS EV3 as well as a regulator node that is used by the A/DC node.
-
-Signed-off-by: David Lechner <david@lechnology.com>
-Signed-off-by: Sekhar Nori <nsekhar@ti.com>
----
- arch/arm/boot/dts/da850-lego-ev3.dts | 21 +++++++++++++++++++++
- 1 file changed, 21 insertions(+)
-
-diff --git a/arch/arm/boot/dts/da850-lego-ev3.dts b/arch/arm/boot/dts/da850-lego-ev3.dts
-index 112ec92..0309537 100644
---- a/arch/arm/boot/dts/da850-lego-ev3.dts
-+++ b/arch/arm/boot/dts/da850-lego-ev3.dts
-@@ -139,6 +139,19 @@
- 		enable-active-high;
- 		regulator-boot-on;
- 	};
-+
-+	/*
-+	 * This is a simple voltage divider on VCC5V to provide a 2.5V
-+	 * reference signal to the ADC.
-+	 */
-+	adc_ref: regulator2 {
-+		compatible = "regulator-fixed";
-+		regulator-name = "adc ref";
-+		regulator-min-microvolt = <2500000>;
-+		regulator-max-microvolt = <2500000>;
-+		regulator-boot-on;
-+		vin-supply = <&vcc5v>;
-+	};
- };
- 
- &pmx_core {
-@@ -293,6 +306,14 @@
- 			};
- 		};
- 	};
-+
-+	adc: adc at 3 {
-+		compatible = "ti,ads7957";
-+		reg = <3>;
-+		#io-channel-cells = <1>;
-+		spi-max-frequency = <10000000>;
-+		vref-supply = <&adc_ref>;
-+	};
- };
- 
- &gpio {
--- 
-cgit v1.1
-
diff --git a/board/lego/ev3/patches/linux/0002-sound-device-tree-node.patch b/board/lego/ev3/patches/linux/0002-sound-device-tree-node.patch
deleted file mode 100644
index a095222..0000000
--- a/board/lego/ev3/patches/linux/0002-sound-device-tree-node.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From 7723d70bebd749ef24fef19db52d827c7fd7f858 Mon Sep 17 00:00:00 2001
-From: David Lechner <david@lechnology.com>
-Date: Tue, 7 Feb 2017 13:22:09 -0600
-Subject: ARM: da850-lego-ev3: Add device tree node for sound
-
-This adds a device tree node for sound on LEGO MINDSTORMS EV3. The EV3
-uses one of the SoC PWMs connected to an amplifier to create sound from
-a speaker.
-
-The PWM is passed through a low-pass filter, so it is actually possible
-to do PCM playback, but there is no existing driver, so just using
-pwm-beeper for now, since it is also a compatible mode of operation.
-
-Signed-off-by: David Lechner <david@lechnology.com>
-Signed-off-by: Sekhar Nori <nsekhar@ti.com>
----
- arch/arm/boot/dts/da850-lego-ev3.dts | 31 +++++++++++++++++++++++++++++++
- 1 file changed, 31 insertions(+)
-
-diff --git a/arch/arm/boot/dts/da850-lego-ev3.dts b/arch/arm/boot/dts/da850-lego-ev3.dts
-index 0309537..c20580a 100644
---- a/arch/arm/boot/dts/da850-lego-ev3.dts
-+++ b/arch/arm/boot/dts/da850-lego-ev3.dts
-@@ -123,6 +123,14 @@
- 		pinctrl-0 = <&system_power_pin>;
- 	};
- 
-+	sound {
-+		compatible = "pwm-beeper";
-+		pinctrl-names = "default";
-+		pinctrl-0 = <&ehrpwm0b_pins>;
-+		pwms = <&ehrpwm0 1 1000000 0>;
-+		amp-supply = <&amp>;
-+	};
-+
- 	/*
- 	 * This is a 5V current limiting regulator that is shared by USB,
- 	 * the sensor (input) ports, the motor (output) ports and the A/DC.
-@@ -152,6 +160,18 @@
- 		regulator-boot-on;
- 		vin-supply = <&vcc5v>;
- 	};
-+
-+	/*
-+	 * This is the amplifier for the speaker.
-+	 */
-+	amp: regulator3 {
-+		pinctrl-names = "default";
-+		pinctrl-0 = <&amp_pins>;
-+		compatible = "regulator-fixed";
-+		regulator-name = "amp";
-+		gpio = <&gpio 111 GPIO_ACTIVE_HIGH>;
-+		enable-active-high;
-+	};
- };
- 
- &pmx_core {
-@@ -208,6 +228,13 @@
- 			0x4c 0x00008000 0x0000f000
- 		>;
- 	};
-+
-+	amp_pins: pinmux_amp_pins {
-+		pinctrl-single,bits = <
-+			/* GP6[15] */
-+			0x34 0x00000008 0x0000000f
-+		>;
-+	};
- };
- 
- &pinconf {
-@@ -316,6 +343,10 @@
- 	};
- };
- 
-+&ehrpwm0 {
-+	status = "okay";
-+};
-+
- &gpio {
- 	status = "okay";
- };
--- 
-cgit v1.1
-
diff --git a/board/lego/ev3/patches/uboot/configs-legoev3-increase-flash-image-sizes.patch b/board/lego/ev3/patches/uboot/configs-legoev3-increase-flash-image-sizes.patch
new file mode 100644
index 0000000..ee0ce61
--- /dev/null
+++ b/board/lego/ev3/patches/uboot/configs-legoev3-increase-flash-image-sizes.patch
@@ -0,0 +1,31 @@
+From cdd8d11858fa34f6e813fae46b5556e9fb3570dc Mon Sep 17 00:00:00 2001
+From: David Lechner <david@lechnology.com>
+Date: Sun, 19 Nov 2017 19:54:32 -0600
+Subject: [PATCH] configs: legoev3: increase flash image sizes
+
+This increases the kernel image to 4M and the rootfs image to 10M.
+
+It is getting hard to get a kernel image to fit in 3M and the rootfs image
+size now matches the filesyssize variable.
+
+Signed-off-by: David Lechner <david@lechnology.com>
+---
+ include/configs/legoev3.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/configs/legoev3.h b/include/configs/legoev3.h
+index 79fa3c4..2eeaf85 100644
+--- a/include/configs/legoev3.h
++++ b/include/configs/legoev3.h
+@@ -204,7 +204,7 @@
+ 	"mmcargs=setenv bootargs mem=${memsize} console=${console} root=/dev/mmcblk0p2 rw rootwait lpj=747520\0" \
+ 	"mmcboot=bootm ${loadaddr}\0" \
+ 	"flashargs=setenv bootargs mem=${memsize} initrd=${filesysaddr},${filesyssize} root=/dev/ram0 rw rootfstype=squashfs console=${console} lpj=747520\0" \
+-	"flashboot=sf probe 0; sf read ${loadaddr} 0x50000 0x300000; sf read ${filesysaddr} 0x350000 0x960000; bootm ${loadaddr}\0" \
++	"flashboot=sf probe 0; sf read ${loadaddr} 0x50000 0x400000; sf read ${filesysaddr} 0x450000 0xA00000; bootm ${loadaddr}\0" \
+ 	"loadimage=fatload mmc 0 ${loadaddr} uImage\0" \
+ 	"loadbootscr=fatload mmc 0 ${bootscraddr} boot.scr\0" \
+ 	"bootscript=source ${bootscraddr}\0" \
+-- 
+2.7.4
+
diff --git a/configs/lego_ev3_defconfig b/configs/lego_ev3_defconfig
index dea84d9..0281924 100644
--- a/configs/lego_ev3_defconfig
+++ b/configs/lego_ev3_defconfig
@@ -9,13 +9,13 @@ BR2_GLOBAL_PATCH_DIR="board/lego/ev3/patches"
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/lego/ev3/post-image.sh"
-# Linux headers same as kernel, a 4.11 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+# Linux headers same as kernel, a 4.14 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14"
 BR2_LINUX_KERNEL_DEFCONFIG="davinci_all"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/lego/ev3/linux.fragment"
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0xc0008000"
@@ -36,7 +36,7 @@ BR2_TARGET_ROOTFS_SQUASHFS4_XZ=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.05"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="legoev3"
 
 # host
