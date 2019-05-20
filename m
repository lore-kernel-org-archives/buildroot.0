From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Mon, 20 May 2019 21:32:22 +0200
Subject: [Buildroot] [RFC PATCH 3/4] board/lemaker/bananapro/patches/linux:
 add patch to disable 00B IRQ
In-Reply-To: <20190520193223.14071-1-b.bilas@grinn-global.com>
References: <20190520193223.14071-1-b.bilas@grinn-global.com>
Message-ID: <20190520193223.14071-3-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 ...s-sun7i-a20-bananapro.dts-disable-00.patch | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 board/lemaker/bananapro/patches/linux/0001-arch-arm-boot-dts-sun7i-a20-bananapro.dts-disable-00.patch

diff --git a/board/lemaker/bananapro/patches/linux/0001-arch-arm-boot-dts-sun7i-a20-bananapro.dts-disable-00.patch b/board/lemaker/bananapro/patches/linux/0001-arch-arm-boot-dts-sun7i-a20-bananapro.dts-disable-00.patch
new file mode 100644
index 0000000000..428f591eb6
--- /dev/null
+++ b/board/lemaker/bananapro/patches/linux/0001-arch-arm-boot-dts-sun7i-a20-bananapro.dts-disable-00.patch
@@ -0,0 +1,44 @@
+From 896e82ab14e7e4e361ffa7c81def787907c1bf4c Mon Sep 17 00:00:00 2001
+From: Bartosz Bilas <b.bilas@grinn-global.com>
+Date: Sun, 19 May 2019 21:04:35 +0200
+Subject: [PATCH 1/1] arch/arm/boot/dts/sun7i-a20-bananapro.dts: disable 00B
+ IRQ for brcm wifi module
+
+	BugLink: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=908438
+
+Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
+Signed-off-by: Hans de Goede <hdegoede@redhat.com>
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
-- 
2.21.0
