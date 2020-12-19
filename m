From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 19 Dec 2020 08:34:07 +0100
Subject: [Buildroot] [git commit] configs/roseapplypi: bump kernel to 5.10.1
Message-ID: <20201219071948.704E88772A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b7460aa0555969e7916705816bf5952592b7b7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And drop now upstreamed patches. Mmc support is still not mainline, but
enqueued for 5.12:

https://www.spinics.net/lists/linux-i2c/msg49279.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-arm-dts-owl-s500-Fix-incorrect-PPI.patch  | 52 -------------
 .../0002-arm-dts-owl-s500-add-RoseapplePi.patch    | 89 ----------------------
 configs/roseapplepi_defconfig                      |  6 +-
 3 files changed, 3 insertions(+), 144 deletions(-)

diff --git a/board/roseapplepi/patches/linux/0001-arm-dts-owl-s500-Fix-incorrect-PPI.patch b/board/roseapplepi/patches/linux/0001-arm-dts-owl-s500-Fix-incorrect-PPI.patch
deleted file mode 100644
index 615be675ae..0000000000
--- a/board/roseapplepi/patches/linux/0001-arm-dts-owl-s500-Fix-incorrect-PPI.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
-Subject: [PATCH 1/4] arm: dts: owl-s500: Fix incorrect PPI interrupt specifiers
-To:     Rob Herring <robh+dt@kernel.org>,
-        Andreas F??rber <afaerber@suse.de>,
-        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
-Cc:     devicetree at vger.kernel.org, linux-arm-kernel at lists.infradead.org,
-        linux-kernel at vger.kernel.org
-Date: Mon, 15 Jun 2020 03:19:08 +0300 (10 weeks, 3 days, 20 hours ago)
-X-Mailer: git-send-email 2.27.0
-
-The PPI interrupts for cortex-a9 were incorrectly specified, fix them.
-
-Fixes: fdfe7f4f9d85 ("ARM: dts: Add Actions Semi S500 and LeMaker Guitar")
-Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- arch/arm/boot/dts/owl-s500.dtsi | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/arch/arm/boot/dts/owl-s500.dtsi b/arch/arm/boot/dts/owl-s500.dtsi
-index 5ceb6cc4451d..1dbe4e8b38ac 100644
---- a/arch/arm/boot/dts/owl-s500.dtsi
-+++ b/arch/arm/boot/dts/owl-s500.dtsi
-@@ -84,21 +84,21 @@ scu: scu at b0020000 {
- 		global_timer: timer at b0020200 {
- 			compatible = "arm,cortex-a9-global-timer";
- 			reg = <0xb0020200 0x100>;
--			interrupts = <GIC_PPI 0 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_EDGE_RISING)>;
-+			interrupts = <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_EDGE_RISING)>;
- 			status = "disabled";
- 		};
- 
- 		twd_timer: timer at b0020600 {
- 			compatible = "arm,cortex-a9-twd-timer";
- 			reg = <0xb0020600 0x20>;
--			interrupts = <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_EDGE_RISING)>;
-+			interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_EDGE_RISING)>;
- 			status = "disabled";
- 		};
- 
- 		twd_wdt: wdt at b0020620 {
- 			compatible = "arm,cortex-a9-twd-wdt";
- 			reg = <0xb0020620 0xe0>;
--			interrupts = <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_EDGE_RISING)>;
-+			interrupts = <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_EDGE_RISING)>;
- 			status = "disabled";
- 		};
- 
--- 
-2.27.0
-
-
diff --git a/board/roseapplepi/patches/linux/0002-arm-dts-owl-s500-add-RoseapplePi.patch b/board/roseapplepi/patches/linux/0002-arm-dts-owl-s500-add-RoseapplePi.patch
deleted file mode 100644
index 87a6ee245f..0000000000
--- a/board/roseapplepi/patches/linux/0002-arm-dts-owl-s500-add-RoseapplePi.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
-Subject: [PATCH 4/4] arm: dts: owl-s500: Add RoseapplePi
-To:     Rob Herring <robh+dt@kernel.org>,
-        Andreas F??rber <afaerber@suse.de>,
-        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
-Cc:     devicetree at vger.kernel.org, linux-kernel at vger.kernel.org,
-        linux-arm-kernel at lists.infradead.org
-Date: Mon, 15 Jun 2020 03:19:11 +0300 (10 weeks, 3 days, 20 hours ago)
-X-Mailer: git-send-email 2.27.0
-
-Add a Device Tree for the RoseapplePi SBC.
-
-Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- arch/arm/boot/dts/Makefile                 |  1 +
- arch/arm/boot/dts/owl-s500-roseapplepi.dts | 47 ++++++++++++++++++++++
- 2 files changed, 48 insertions(+)
- create mode 100644 arch/arm/boot/dts/owl-s500-roseapplepi.dts
-
-diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
-index e8dd99201397..d0712e7275da 100644
---- a/arch/arm/boot/dts/Makefile
-+++ b/arch/arm/boot/dts/Makefile
-@@ -856,6 +856,7 @@ dtb-$(CONFIG_ARCH_ORION5X) += \
- dtb-$(CONFIG_ARCH_ACTIONS) += \
- 	owl-s500-cubieboard6.dtb \
- 	owl-s500-guitar-bb-rev-b.dtb \
-+	owl-s500-roseapplepi.dtb \
- 	owl-s500-sparky.dtb
- dtb-$(CONFIG_ARCH_PRIMA2) += \
- 	prima2-evb.dtb
-diff --git a/arch/arm/boot/dts/owl-s500-roseapplepi.dts b/arch/arm/boot/dts/owl-s500-roseapplepi.dts
-new file mode 100644
-index 000000000000..c61fbaa3821e
---- /dev/null
-+++ b/arch/arm/boot/dts/owl-s500-roseapplepi.dts
-@@ -0,0 +1,47 @@
-+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
-+/*
-+ * Roseapple Pi
-+ *
-+ * Copyright (c) 2020 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
-+ */
-+
-+/dts-v1/;
-+
-+#include "owl-s500.dtsi"
-+
-+/ {
-+	compatible = "roseapplepi,roseapplepi", "actions,s500";
-+	model = "Roseapple Pi";
-+
-+	aliases {
-+		serial2 = &uart2;
-+	};
-+
-+	chosen {
-+		stdout-path = "serial2:115200n8";
-+	};
-+
-+	memory at 0 {
-+		device_type = "memory";
-+		reg = <0x0 0x80000000>; /* 2GB */
-+	};
-+
-+	uart2_clk: uart2-clk {
-+		compatible = "fixed-clock";
-+		clock-frequency = <921600>;
-+		#clock-cells = <0>;
-+	};
-+};
-+
-+&twd_timer {
-+	status = "okay";
-+};
-+
-+&timer {
-+	clocks = <&hosc>;
-+};
-+
-+&uart2 {
-+	status = "okay";
-+	clocks = <&uart2_clk>;
-+};
--- 
-2.27.0
-
-
diff --git a/configs/roseapplepi_defconfig b/configs/roseapplepi_defconfig
index 45c42ec0f9..2af94d010b 100644
--- a/configs/roseapplepi_defconfig
+++ b/configs/roseapplepi_defconfig
@@ -3,15 +3,15 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_GLOBAL_PATCH_DIR="board/roseapplepi/patches"
-# Linux headers same as kernel, a 5.7 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_7=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/roseapplepi/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/roseapplepi/genimage.cfg"
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.7.19"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/roseapplepi/linux.config"
 BR2_LINUX_KERNEL_UIMAGE=y
