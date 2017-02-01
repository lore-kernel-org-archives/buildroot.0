From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed,  1 Feb 2017 20:47:02 +0300
Subject: [Buildroot] [PATCH] configs: Update Synopsys VDK for ARC HS38
Message-ID: <1485971222-32589-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This updates Linux kernel for Synopsys ARC HS38 VDK so it matches real
platform and while at it bump kernel version to the latest.

Main changes:
 * Linux kernel v4.9.6 (latest in 4.9.x series in buildroot)
 * Add support of MMC controller which is used for rootfs
 * Add support of UIO which is used to communicate with EVSS

Now with this update image built by vanilla Buildroot VDK has
working UART, MMC, LCD, Ethernet, UIO etc.

And while at it we rename defconfing so it:
 1) Doesn't mention SMP any more - that's the only option anyways now
 2) Matches common naming scheme: vendor_arch_platform

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Zakharov Vlad <Vladislav.Zakharov@synopsys.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../linux/0001-arc-vdk-Disable-halt-on-reset.patch | 32 ++++++++++
 ...002-arc-vdk-Add-support-of-MMC-controller.patch | 70 ++++++++++++++++++++++
 .../linux/0003-arc-vdk-Add-support-of-UIO.patch    | 48 +++++++++++++++
 ...mp_vdk_defconfig => snps_archs38_vdk_defconfig} |  9 +--
 4 files changed, 155 insertions(+), 4 deletions(-)
 create mode 100644 board/synopsys/vdk/patches/linux/0001-arc-vdk-Disable-halt-on-reset.patch
 create mode 100644 board/synopsys/vdk/patches/linux/0002-arc-vdk-Add-support-of-MMC-controller.patch
 create mode 100644 board/synopsys/vdk/patches/linux/0003-arc-vdk-Add-support-of-UIO.patch
 rename configs/{snps_hs38_smp_vdk_defconfig => snps_archs38_vdk_defconfig} (61%)

diff --git a/board/synopsys/vdk/patches/linux/0001-arc-vdk-Disable-halt-on-reset.patch b/board/synopsys/vdk/patches/linux/0001-arc-vdk-Disable-halt-on-reset.patch
new file mode 100644
index 000000000000..7ff781494270
--- /dev/null
+++ b/board/synopsys/vdk/patches/linux/0001-arc-vdk-Disable-halt-on-reset.patch
@@ -0,0 +1,32 @@
+From 1e248a880ee46921f85213da32b18f6becf07078 Mon Sep 17 00:00:00 2001
+From: Alexey Brodkin <abrodkin@synopsys.com>
+Date: Tue, 31 Jan 2017 19:00:29 +0300
+Subject: [PATCH 1/3] arc: vdk: Disable halt on reset
+
+In recent VDKs ARC cores are configured as "run on reset"
+which made existing kernel configuration outdated to effect that
+slave cores never start execution of the code keeping only master
+online.
+
+With that fix we're again in sync with VDK platform.
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ arch/arc/configs/vdk_hs38_smp_defconfig | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/arch/arc/configs/vdk_hs38_smp_defconfig b/arch/arc/configs/vdk_hs38_smp_defconfig
+index 969b206d6c67..00036e814dc1 100644
+--- a/arch/arc/configs/vdk_hs38_smp_defconfig
++++ b/arch/arc/configs/vdk_hs38_smp_defconfig
+@@ -15,6 +15,7 @@ CONFIG_ARC_PLAT_AXS10X=y
+ CONFIG_AXS103=y
+ CONFIG_ISA_ARCV2=y
+ CONFIG_SMP=y
++# CONFIG_ARC_SMP_HALT_ON_RESET is not set
+ # CONFIG_ARC_HAS_GFRC is not set
+ CONFIG_ARC_UBOOT_SUPPORT=y
+ CONFIG_ARC_BUILTIN_DTB_NAME="vdk_hs38_smp"
+-- 
+2.7.4
+
diff --git a/board/synopsys/vdk/patches/linux/0002-arc-vdk-Add-support-of-MMC-controller.patch b/board/synopsys/vdk/patches/linux/0002-arc-vdk-Add-support-of-MMC-controller.patch
new file mode 100644
index 000000000000..bd5dedb1ff29
--- /dev/null
+++ b/board/synopsys/vdk/patches/linux/0002-arc-vdk-Add-support-of-MMC-controller.patch
@@ -0,0 +1,70 @@
+From c9d5ba0157fcfe48c0ec3448bdaecbabb8cefbca Mon Sep 17 00:00:00 2001
+From: Alexey Brodkin <abrodkin@synopsys.com>
+Date: Tue, 31 Jan 2017 19:02:44 +0300
+Subject: [PATCH 2/3] arc: vdk: Add support of MMC controller
+
+ARC VDK virtual platform emulates host MMC controller (DW Mobile Storage)
+and moreover rootfs is situated on that virtual card.
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ arch/arc/boot/dts/vdk_axs10x_mb.dtsi    | 18 ++++++++++++++++++
+ arch/arc/configs/vdk_hs38_smp_defconfig |  5 ++++-
+ 2 files changed, 22 insertions(+), 1 deletion(-)
+
+diff --git a/arch/arc/boot/dts/vdk_axs10x_mb.dtsi b/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
+index 99498a4b4216..1953914b9f4f 100644
+--- a/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
++++ b/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
+@@ -23,6 +23,12 @@
+ 				#clock-cells = <0>;
+ 			};
+ 
++			mmcclk: mmcclk {
++				compatible = "fixed-clock";
++				clock-frequency = <50000000>;
++				#clock-cells = <0>;
++			};
++
+ 			pguclk: pguclk {
+ 				#clock-cells = <0>;
+ 				compatible = "fixed-clock";
+@@ -94,5 +100,17 @@
+ 			interrupts = <5>;
+ 			interrupt-names = "arc_ps2_irq";
+ 		};
++
++		mmc at 0x15000 {
++			compatible = "snps,dw-mshc";
++			reg = <0x15000 0x400>;
++			num-slots = <1>;
++			fifo-depth = <1024>;
++			card-detect-delay = <200>;
++			clocks = <&apbclk>, <&mmcclk>;
++			clock-names = "biu", "ciu";
++			interrupts = <7>;
++			bus-width = <4>;
++		};
+ 	};
+ };
+diff --git a/arch/arc/configs/vdk_hs38_smp_defconfig b/arch/arc/configs/vdk_hs38_smp_defconfig
+index 00036e814dc1..85c697a7ef1c 100644
+--- a/arch/arc/configs/vdk_hs38_smp_defconfig
++++ b/arch/arc/configs/vdk_hs38_smp_defconfig
+@@ -79,9 +79,12 @@ CONFIG_USB_OHCI_HCD=y
+ CONFIG_USB_OHCI_HCD_PLATFORM=y
+ CONFIG_USB_STORAGE=y
+ CONFIG_USB_SERIAL=y
++CONFIG_MMC=y
++CONFIG_MMC_SDHCI=y
++CONFIG_MMC_SDHCI_PLTFM=y
++CONFIG_MMC_DW=y
+ # CONFIG_IOMMU_SUPPORT is not set
+ CONFIG_EXT3_FS=y
+-CONFIG_EXT4_FS=y
+ CONFIG_MSDOS_FS=y
+ CONFIG_VFAT_FS=y
+ CONFIG_NTFS_FS=y
+-- 
+2.7.4
+
diff --git a/board/synopsys/vdk/patches/linux/0003-arc-vdk-Add-support-of-UIO.patch b/board/synopsys/vdk/patches/linux/0003-arc-vdk-Add-support-of-UIO.patch
new file mode 100644
index 000000000000..2b084a93cc29
--- /dev/null
+++ b/board/synopsys/vdk/patches/linux/0003-arc-vdk-Add-support-of-UIO.patch
@@ -0,0 +1,48 @@
+From caa0dca3f4913712d1883e9b3b540f0815864ed9 Mon Sep 17 00:00:00 2001
+From: Alexey Brodkin <abrodkin@synopsys.com>
+Date: Tue, 31 Jan 2017 19:03:56 +0300
+Subject: [PATCH 3/3] arc: vdk: Add support of UIO
+
+ARC VDK for EVSS uses UIO for communication with Embedded Vision
+Subsystem.
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ arch/arc/boot/dts/vdk_axs10x_mb.dtsi    | 8 ++++++++
+ arch/arc/configs/vdk_hs38_smp_defconfig | 2 ++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/arch/arc/boot/dts/vdk_axs10x_mb.dtsi b/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
+index 1953914b9f4f..f0df59b23e21 100644
+--- a/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
++++ b/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
+@@ -112,5 +112,13 @@
+ 			interrupts = <7>;
+ 			bus-width = <4>;
+ 		};
++
++		/* Embedded Vision subsystem UIO mappings; only relevant for EV VDK */
++		uio_ev: uio at 0xD0000000 {
++			compatible = "generic-uio";
++			reg = <0xD0000000 0x2000 0xD1000000 0x2000 0x90000000 0x10000000 0xC0000000 0x10000000>;
++			reg-names = "ev_gsa", "ev_ctrl", "ev_shared_mem", "ev_code_mem";
++			interrupts = <23>;
++		};
+ 	};
+ };
+diff --git a/arch/arc/configs/vdk_hs38_smp_defconfig b/arch/arc/configs/vdk_hs38_smp_defconfig
+index 85c697a7ef1c..ecd7f42d50c9 100644
+--- a/arch/arc/configs/vdk_hs38_smp_defconfig
++++ b/arch/arc/configs/vdk_hs38_smp_defconfig
+@@ -83,6 +83,8 @@ CONFIG_MMC=y
+ CONFIG_MMC_SDHCI=y
+ CONFIG_MMC_SDHCI_PLTFM=y
+ CONFIG_MMC_DW=y
++CONFIG_UIO=y
++CONFIG_UIO_PDRV_GENIRQ=y
+ # CONFIG_IOMMU_SUPPORT is not set
+ CONFIG_EXT3_FS=y
+ CONFIG_MSDOS_FS=y
+-- 
+2.7.4
+
diff --git a/configs/snps_hs38_smp_vdk_defconfig b/configs/snps_archs38_vdk_defconfig
similarity index 61%
rename from configs/snps_hs38_smp_vdk_defconfig
rename to configs/snps_archs38_vdk_defconfig
index d4dcd1ba935d..d13fcb2236de 100644
--- a/configs/snps_hs38_smp_vdk_defconfig
+++ b/configs/snps_archs38_vdk_defconfig
@@ -3,17 +3,18 @@ BR2_arcle=y
 BR2_archs38=y
 
 # System
-BR2_TARGET_GENERIC_HOSTNAME="hs38_vdk"
+BR2_TARGET_GENERIC_HOSTNAME="archs38_vdk"
 BR2_TARGET_GENERIC_ISSUE="Welcome to the HS38 VDK Software Development Platform"
 BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
 BR2_TARGET_ROOTFS_EXT2=y
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.9 series
+BR2_KERNEL_HEADERS_4_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_PATCH="board/synopsys/vdk/patches/linux"
 BR2_LINUX_KERNEL_DEFCONFIG="vdk_hs38_smp"
 BR2_LINUX_KERNEL_VMLINUX=y
-- 
2.7.4
