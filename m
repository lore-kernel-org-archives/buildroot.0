From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Sun,  6 Oct 2019 15:28:08 +0200
Subject: [Buildroot] [PATCH 1/1] configs/bananapro: bump Linux to 5.3.4
Message-ID: <20191006132808.12060-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed no longer necessary patch.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 ...s-sun7i-a20-bananapro.dts-disable-00.patch | 44 -------------------
 configs/bananapro_defconfig                   |  7 ++-
 2 files changed, 3 insertions(+), 48 deletions(-)
 delete mode 100644 board/lemaker/bananapro/patches/linux/0001-arch-arm-boot-dts-sun7i-a20-bananapro.dts-disable-00.patch

diff --git a/board/lemaker/bananapro/patches/linux/0001-arch-arm-boot-dts-sun7i-a20-bananapro.dts-disable-00.patch b/board/lemaker/bananapro/patches/linux/0001-arch-arm-boot-dts-sun7i-a20-bananapro.dts-disable-00.patch
deleted file mode 100644
index c8e8c03753..0000000000
--- a/board/lemaker/bananapro/patches/linux/0001-arch-arm-boot-dts-sun7i-a20-bananapro.dts-disable-00.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 896e82ab14e7e4e361ffa7c81def787907c1bf4c Mon Sep 17 00:00:00 2001
-From: Bartosz Bilas <b.bilas@grinn-global.com>
-Date: Sun, 19 May 2019 21:04:35 +0200
-Subject: [PATCH] arch/arm/boot/dts/sun7i-a20-bananapro.dts: disable 00B
- IRQ for brcm wifi module
-
-	BugLink: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=908438
-
-Signed-off-by: Hans de Goede <hdegoede@redhat.com>
-Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
----
- arch/arm/boot/dts/sun7i-a20-bananapro.dts | 16 +++++++++++++---
- 1 file changed, 13 insertions(+), 3 deletions(-)
-
-diff --git a/arch/arm/boot/dts/sun7i-a20-bananapro.dts b/arch/arm/boot/dts/sun7i-a20-bananapro.dts
-index 0176e9de0..93b3340f5 100644
---- a/arch/arm/boot/dts/sun7i-a20-bananapro.dts
-+++ b/arch/arm/boot/dts/sun7i-a20-bananapro.dts
-@@ -160,9 +160,19 @@
- 	brcmf: wifi at 1 {
- 		reg = <1>;
- 		compatible = "brcm,bcm4329-fmac";
--		interrupt-parent = <&pio>;
--		interrupts = <7 15 IRQ_TYPE_LEVEL_LOW>;
--		interrupt-names = "host-wake";
-+		/*
-+		 * OOB interrupt support is broken ATM, often the first irq
-+		 * does not get seen resulting in the drv probe failing with:
-+		 *
-+		 * brcmfmac: brcmf_sdio_bus_rxctl: resumed on timeout
-+		 * brcmfmac: brcmf_bus_started: failed: -110
-+		 * brcmfmac: brcmf_attach: dongle is not responding: err=-110
-+		 * brcmfmac: brcmf_sdio_firmware_callback: brcmf_attach failed
-+		 *
-+		 * interrupt-parent = <&pio>;
-+		 * interrupts = <7 15 IRQ_TYPE_LEVEL_LOW>;
-+		 * interrupt-names = "host-wake";
-+		 */
- 	};
- };
- 
--- 
-2.21.0
-
diff --git a/configs/bananapro_defconfig b/configs/bananapro_defconfig
index 4ec41795bc..20191da174 100644
--- a/configs/bananapro_defconfig
+++ b/configs/bananapro_defconfig
@@ -1,12 +1,11 @@
 # Architecture
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_GLOBAL_PATCH_DIR="board/lemaker/bananapro/patches"
 BR2_ARM_EABIHF=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 5.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_1=y
+# Linux headers same as kernel, a 5.3 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3=y
 
 # Toolchain
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
@@ -23,7 +22,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/lemaker/bananapro/post-image.sh"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.1.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.3.4"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/lemaker/bananapro/linux-wifi.fragment"
-- 
2.23.0
