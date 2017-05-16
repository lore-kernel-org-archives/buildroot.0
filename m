From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 May 2017 22:55:37 +0200
Subject: [Buildroot] [git commit branch/next] lego: ev3: use mainline kernel
Message-ID: <20170516205628.4D8BE80AD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=da6d09788133bf10dccf6482ee812ff30060f86e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

It is finally possible to boot LEGO MINDSTORMS EV3 from the mainline
Linux kernel. This patch updates the defconfg to use the mainline kernel
instead of the custom ev3dev kernel.

[Peter: lock kernel headers version]
Signed-off-by: David Lechner <david@lechnology.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/lego/ev3/busybox.fragment                    |  3 +
 board/lego/ev3/genimage.cfg                        |  2 +-
 board/lego/ev3/linux.fragment                      | 49 +++++++++++++
 .../patches/linux/0001-adc-device-tree-node.patch  | 56 ++++++++++++++
 .../linux/0002-sound-device-tree-node.patch        | 85 ++++++++++++++++++++++
 board/lego/ev3/post-image.sh                       |  2 +
 board/lego/ev3/readme.txt                          |  9 +--
 configs/lego_ev3_defconfig                         | 22 ++++--
 8 files changed, 212 insertions(+), 16 deletions(-)

diff --git a/board/lego/ev3/busybox.fragment b/board/lego/ev3/busybox.fragment
new file mode 100644
index 0000000..901274d
--- /dev/null
+++ b/board/lego/ev3/busybox.fragment
@@ -0,0 +1,3 @@
+CONFIG_BEEP=y
+CONFIG_FEATURE_BEEP_FREQ=440
+CONFIG_FEATURE_BEEP_LENGTH_MS=250
diff --git a/board/lego/ev3/genimage.cfg b/board/lego/ev3/genimage.cfg
index 6b8546c..3568295 100644
--- a/board/lego/ev3/genimage.cfg
+++ b/board/lego/ev3/genimage.cfg
@@ -19,7 +19,7 @@ image flash.bin {
 		size = 320K
 	}
 	partition uimage {
-		image = "uImage"
+		image = "uImage.da850-lego-ev3"
 		size = 3M
 		offset = 0x50000
 	}
diff --git a/board/lego/ev3/linux.fragment b/board/lego/ev3/linux.fragment
index 5593636..439cccf 100644
--- a/board/lego/ev3/linux.fragment
+++ b/board/lego/ev3/linux.fragment
@@ -1,6 +1,55 @@
+CONFIG_ARCH_DAVINCI_DM644x=n
+CONFIG_ARCH_DAVINCI_DM355=n
+CONFIG_ARCH_DAVINCI_DM646x=n
+CONFIG_ARCH_DAVINCI_DA830=n
+CONFIG_ARCH_DAVINCI_DM365=n
+CONFIG_MACH_SFFSDR=n
+CONFIG_MACH_NEUROS_OSD2=n
+CONFIG_MACH_DM355_LEOPARD=n
+CONFIG_MACH_MITYOMAPL138=n
+CONFIG_MACH_OMAPL138_HAWKBOARD=n
+CONFIG_MACH_DAVINCI_DA850_EVM=n
+CONFIG_ATA=n
+CONFIG_MTD=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_M25P80=y
+CONFIG_MTD_SPI_NOR=y
+CONFIG_MTD_UBI=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_COUNT=1
 CONFIG_BLK_DEV_RAM_SIZE=32768
+CONFIG_INPUT_EVDEV=y
+CONFIG_INPUT_PWM_BEEPER=y
+CONFIG_SPI_DAVINCI=y
+CONFIG_PINCTRL_DA850_PUPD=y
+CONFIG_V4L_PLATFORM_DRIVERS=n
+CONFIG_SOUND=n
+CONFIG_SND=n
+CONFIG_SND_SOC=n
+CONFIG_SND_EDMA_SOC=n
+CONFIG_SND_DAVINCI_SOC_MCASP=n
+CONFIG_SND_SOC_TLV320AIC3X=n
+CONFIG_SND_SIMPLE_CARD=n
+CONFIG_DAVINCI_WATCHDOG=y
+CONFIG_USB=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_OHCI_HCD_DAVINCI=y
+CONFIG_USB_MUSB_HDRC=y
+CONFIG_USB_MUSB_GADGET=y
+CONFIG_USB_MUSB_DA8XX=y
+CONFIG_NOP_USB_XCEIV=y
+CONFIG_USB_GADGET=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGER_MTD=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+CONFIG_LEDS_TRIGGER_CPU=y
+CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
+CONFIG_RTC_DRV_OMAP=y
+CONFIG_IIO=y
+CONFIG_TI_ADS7950=y
+CONFIG_PWM_TIECAP=y
+CONFIG_PWM_TIEHRPWM=y
 CONFIG_SQUASHFS=y
 CONFIG_SQUASHFS_LZ4=y
 CONFIG_SQUASHFS_LZO=y
diff --git a/board/lego/ev3/patches/linux/0001-adc-device-tree-node.patch b/board/lego/ev3/patches/linux/0001-adc-device-tree-node.patch
new file mode 100644
index 0000000..dabda1e
--- /dev/null
+++ b/board/lego/ev3/patches/linux/0001-adc-device-tree-node.patch
@@ -0,0 +1,56 @@
+From 8a81ff173c5c9a0ab1df84fab17971dbcce8490a Mon Sep 17 00:00:00 2001
+From: David Lechner <david@lechnology.com>
+Date: Tue, 7 Feb 2017 13:22:07 -0600
+Subject: ARM: da850-lego-ev3: Add device tree node for A/DC
+
+This adds a node for the TI ADS7957 analog/digital converter on LEGO
+MINDSTORMS EV3 as well as a regulator node that is used by the A/DC node.
+
+Signed-off-by: David Lechner <david@lechnology.com>
+Signed-off-by: Sekhar Nori <nsekhar@ti.com>
+---
+ arch/arm/boot/dts/da850-lego-ev3.dts | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+
+diff --git a/arch/arm/boot/dts/da850-lego-ev3.dts b/arch/arm/boot/dts/da850-lego-ev3.dts
+index 112ec92..0309537 100644
+--- a/arch/arm/boot/dts/da850-lego-ev3.dts
++++ b/arch/arm/boot/dts/da850-lego-ev3.dts
+@@ -139,6 +139,19 @@
+ 		enable-active-high;
+ 		regulator-boot-on;
+ 	};
++
++	/*
++	 * This is a simple voltage divider on VCC5V to provide a 2.5V
++	 * reference signal to the ADC.
++	 */
++	adc_ref: regulator2 {
++		compatible = "regulator-fixed";
++		regulator-name = "adc ref";
++		regulator-min-microvolt = <2500000>;
++		regulator-max-microvolt = <2500000>;
++		regulator-boot-on;
++		vin-supply = <&vcc5v>;
++	};
+ };
+ 
+ &pmx_core {
+@@ -293,6 +306,14 @@
+ 			};
+ 		};
+ 	};
++
++	adc: adc at 3 {
++		compatible = "ti,ads7957";
++		reg = <3>;
++		#io-channel-cells = <1>;
++		spi-max-frequency = <10000000>;
++		vref-supply = <&adc_ref>;
++	};
+ };
+ 
+ &gpio {
+-- 
+cgit v1.1
+
diff --git a/board/lego/ev3/patches/linux/0002-sound-device-tree-node.patch b/board/lego/ev3/patches/linux/0002-sound-device-tree-node.patch
new file mode 100644
index 0000000..a095222
--- /dev/null
+++ b/board/lego/ev3/patches/linux/0002-sound-device-tree-node.patch
@@ -0,0 +1,85 @@
+From 7723d70bebd749ef24fef19db52d827c7fd7f858 Mon Sep 17 00:00:00 2001
+From: David Lechner <david@lechnology.com>
+Date: Tue, 7 Feb 2017 13:22:09 -0600
+Subject: ARM: da850-lego-ev3: Add device tree node for sound
+
+This adds a device tree node for sound on LEGO MINDSTORMS EV3. The EV3
+uses one of the SoC PWMs connected to an amplifier to create sound from
+a speaker.
+
+The PWM is passed through a low-pass filter, so it is actually possible
+to do PCM playback, but there is no existing driver, so just using
+pwm-beeper for now, since it is also a compatible mode of operation.
+
+Signed-off-by: David Lechner <david@lechnology.com>
+Signed-off-by: Sekhar Nori <nsekhar@ti.com>
+---
+ arch/arm/boot/dts/da850-lego-ev3.dts | 31 +++++++++++++++++++++++++++++++
+ 1 file changed, 31 insertions(+)
+
+diff --git a/arch/arm/boot/dts/da850-lego-ev3.dts b/arch/arm/boot/dts/da850-lego-ev3.dts
+index 0309537..c20580a 100644
+--- a/arch/arm/boot/dts/da850-lego-ev3.dts
++++ b/arch/arm/boot/dts/da850-lego-ev3.dts
+@@ -123,6 +123,14 @@
+ 		pinctrl-0 = <&system_power_pin>;
+ 	};
+ 
++	sound {
++		compatible = "pwm-beeper";
++		pinctrl-names = "default";
++		pinctrl-0 = <&ehrpwm0b_pins>;
++		pwms = <&ehrpwm0 1 1000000 0>;
++		amp-supply = <&amp>;
++	};
++
+ 	/*
+ 	 * This is a 5V current limiting regulator that is shared by USB,
+ 	 * the sensor (input) ports, the motor (output) ports and the A/DC.
+@@ -152,6 +160,18 @@
+ 		regulator-boot-on;
+ 		vin-supply = <&vcc5v>;
+ 	};
++
++	/*
++	 * This is the amplifier for the speaker.
++	 */
++	amp: regulator3 {
++		pinctrl-names = "default";
++		pinctrl-0 = <&amp_pins>;
++		compatible = "regulator-fixed";
++		regulator-name = "amp";
++		gpio = <&gpio 111 GPIO_ACTIVE_HIGH>;
++		enable-active-high;
++	};
+ };
+ 
+ &pmx_core {
+@@ -208,6 +228,13 @@
+ 			0x4c 0x00008000 0x0000f000
+ 		>;
+ 	};
++
++	amp_pins: pinmux_amp_pins {
++		pinctrl-single,bits = <
++			/* GP6[15] */
++			0x34 0x00000008 0x0000000f
++		>;
++	};
+ };
+ 
+ &pinconf {
+@@ -316,6 +343,10 @@
+ 	};
+ };
+ 
++&ehrpwm0 {
++	status = "okay";
++};
++
+ &gpio {
+ 	status = "okay";
+ };
+-- 
+cgit v1.1
+
diff --git a/board/lego/ev3/post-image.sh b/board/lego/ev3/post-image.sh
index 81626dc..553d27a 100755
--- a/board/lego/ev3/post-image.sh
+++ b/board/lego/ev3/post-image.sh
@@ -4,6 +4,8 @@ BOARD_DIR="$(dirname $0)"
 GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
 GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 
+ln -sf "uImage.da850-lego-ev3" "${BINARIES_DIR}/uImage"
+
 rm -rf "${GENIMAGE_TMP}"
 
 genimage \
diff --git a/board/lego/ev3/readme.txt b/board/lego/ev3/readme.txt
index c40907c..8df91ac 100644
--- a/board/lego/ev3/readme.txt
+++ b/board/lego/ev3/readme.txt
@@ -13,12 +13,6 @@ See:
 - http://www.lego.com/en-us/mindstorms/products/ev3/31313-mindstorms-ev3/
 - http://www.ti.com/product/am1808
 
-The buildroot configuration uses the Linux kernel of the ev3dev project.
-See:
-- https://github.com/ev3dev/ev3-kernel/
-- https://github.com/ev3dev/lego-linux-drivers/
-- http://www.ev3dev.org/
-
 How it works
 ============
 
@@ -65,7 +59,8 @@ After building, you should obtain this tree:
     ????????? rootfs.squashfs
     ????????? sdcard.img
     ????????? u-boot.bin
-    ????????? uImage
+    ????????? uImage -> uImage.da850-lego-ev3
+    ????????? uImage.da850-lego-ev3
 
 Installation
 ============
diff --git a/configs/lego_ev3_defconfig b/configs/lego_ev3_defconfig
index 543a227..4d764c5 100644
--- a/configs/lego_ev3_defconfig
+++ b/configs/lego_ev3_defconfig
@@ -2,22 +2,28 @@
 BR2_arm=y
 BR2_arm926t=y
 
+# Build options
+BR2_GLOBAL_PATCH_DIR="board/lego/ev3/patches"
+
 # system
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/lego/ev3/post-image.sh"
-# Linux headers same as kernel, a 4.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/ev3dev/ev3dev-kernel.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="v4.4.19-15-ev3dev-ev3_1"
-BR2_LINUX_KERNEL_DEFCONFIG="ev3dev"
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11"
+BR2_LINUX_KERNEL_DEFCONFIG="davinci_all"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/lego/ev3/linux.fragment"
-BR2_LINUX_KERNEL_UIMAGE=y
-BR2_LINUX_KERNEL_EXT_EV3DEV_LINUX_DRIVERS=y
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0xc0008000"
+BR2_LINUX_KERNEL_APPENDED_UIMAGE=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="da850-lego-ev3"
+
+# Target packages
+BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/lego/ev3/busybox.fragment"
 
 # filesystem
 BR2_TARGET_ROOTFS_EXT2=y
