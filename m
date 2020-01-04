From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Sat,  4 Jan 2020 17:48:37 +0100
Subject: [Buildroot] [PATCH 1/2] board/lemaker/bananapro: fix wlan module
Message-ID: <20200104164838.1501828-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Restore a patch which disables 00B IRQ for built-in wlan module
which allows working wlan module again. It turned out that
it shouldn't have been deleted because the bug still exists
in the mainline linux kernel so keep this patch the same as
armbian[1] to have wifi connection working correctly.

[1] https://github.com/armbian/build/blob/master/patch/kernel/sunxi-dev/ARM-dts-sun7i-Disable-OOB-IRQ-for-brcm-wifi-on-Cubietruck-and-Banana-Pro.patch

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 ...s-sun7i-a20-bananapro.dts-disable-00.patch | 44 +++++++++++++++++++
 configs/bananapro_defconfig                   |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 board/lemaker/bananapro/patches/linux/0001-arch-arm-boot-dts-sun7i-a20-bananapro.dts-disable-00.patch

diff --git a/board/lemaker/bananapro/patches/linux/0001-arch-arm-boot-dts-sun7i-a20-bananapro.dts-disable-00.patch b/board/lemaker/bananapro/patches/linux/0001-arch-arm-boot-dts-sun7i-a20-bananapro.dts-disable-00.patch
new file mode 100644
index 0000000000..c8e8c03753
--- /dev/null
+++ b/board/lemaker/bananapro/patches/linux/0001-arch-arm-boot-dts-sun7i-a20-bananapro.dts-disable-00.patch
@@ -0,0 +1,44 @@
+From 896e82ab14e7e4e361ffa7c81def787907c1bf4c Mon Sep 17 00:00:00 2001
+From: Bartosz Bilas <b.bilas@grinn-global.com>
+Date: Sun, 19 May 2019 21:04:35 +0200
+Subject: [PATCH] arch/arm/boot/dts/sun7i-a20-bananapro.dts: disable 00B
+ IRQ for brcm wifi module
+
+	BugLink: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=908438
+
+Signed-off-by: Hans de Goede <hdegoede@redhat.com>
+Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
+---
+ arch/arm/boot/dts/sun7i-a20-bananapro.dts | 16 +++++++++++++---
+ 1 file changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/arch/arm/boot/dts/sun7i-a20-bananapro.dts b/arch/arm/boot/dts/sun7i-a20-bananapro.dts
+index 0176e9de0..93b3340f5 100644
+--- a/arch/arm/boot/dts/sun7i-a20-bananapro.dts
++++ b/arch/arm/boot/dts/sun7i-a20-bananapro.dts
+@@ -160,9 +160,19 @@
+ 	brcmf: wifi at 1 {
+ 		reg = <1>;
+ 		compatible = "brcm,bcm4329-fmac";
+-		interrupt-parent = <&pio>;
+-		interrupts = <7 15 IRQ_TYPE_LEVEL_LOW>;
+-		interrupt-names = "host-wake";
++		/*
++		 * OOB interrupt support is broken ATM, often the first irq
++		 * does not get seen resulting in the drv probe failing with:
++		 *
++		 * brcmfmac: brcmf_sdio_bus_rxctl: resumed on timeout
++		 * brcmfmac: brcmf_bus_started: failed: -110
++		 * brcmfmac: brcmf_attach: dongle is not responding: err=-110
++		 * brcmfmac: brcmf_sdio_firmware_callback: brcmf_attach failed
++		 *
++		 * interrupt-parent = <&pio>;
++		 * interrupts = <7 15 IRQ_TYPE_LEVEL_LOW>;
++		 * interrupt-names = "host-wake";
++		 */
+ 	};
+ };
+ 
+-- 
+2.21.0
+
diff --git a/configs/bananapro_defconfig b/configs/bananapro_defconfig
index a990380570..95bd871468 100644
--- a/configs/bananapro_defconfig
+++ b/configs/bananapro_defconfig
@@ -1,6 +1,7 @@
 # Architecture
 BR2_arm=y
 BR2_cortex_a7=y
+BR2_GLOBAL_PATCH_DIR="board/lemaker/bananapro/patches"
 BR2_ARM_EABIHF=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-- 
2.24.1
