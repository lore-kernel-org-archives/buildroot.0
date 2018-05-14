From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Mon, 14 May 2018 11:10:35 +0300
Subject: [Buildroot] [PATCH] configs/snps_arc*_defconfig: update u-boot
 version
Message-ID: <20180514081035.5167-1-Evgeniy.Didin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With this commit we update u-boot version to 2018.05 for
Synopsys boards. U-boot version 2018.05 was released recently
and includes significant changes for ARC boards:
 * Fix for compile-time warning for AXS10x
 * Add support of platform-specific commands for HSDK
 * Add support for on-board SPI flash on HSDK

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: arc-buildroot at synopsys.com
---
 .../0001-axs103-Clean-up-smp_kick_all_cpus.patch   | 48 ---------------
 ...ort-slave-core-kick-start-on-axs103-v1.1-.patch | 72 ----------------------
 configs/snps_arc700_axs101_defconfig               |  2 +-
 configs/snps_archs38_axs103_defconfig              |  3 +-
 configs/snps_archs38_hsdk_defconfig                |  2 +-
 5 files changed, 3 insertions(+), 124 deletions(-)
 delete mode 100644 board/synopsys/axs10x/patches/u-boot/0001-axs103-Clean-up-smp_kick_all_cpus.patch
 delete mode 100644 board/synopsys/axs10x/patches/u-boot/0002-axs103-Support-slave-core-kick-start-on-axs103-v1.1-.patch

diff --git a/board/synopsys/axs10x/patches/u-boot/0001-axs103-Clean-up-smp_kick_all_cpus.patch b/board/synopsys/axs10x/patches/u-boot/0001-axs103-Clean-up-smp_kick_all_cpus.patch
deleted file mode 100644
index 7af878d813..0000000000
--- a/board/synopsys/axs10x/patches/u-boot/0001-axs103-Clean-up-smp_kick_all_cpus.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From ee5a5a51780bcb17e5240335ddfa9c98a0e6f890 Mon Sep 17 00:00:00 2001
-From: Alexey Brodkin <abrodkin@synopsys.com>
-Date: Thu, 30 Mar 2017 19:18:30 +0300
-Subject: [PATCH] axs103: Clean-up smp_kick_all_cpus()
-
- * Rely on default pulse polarity value
- * Don't mess with "multicore" value as it doesn't affect execution
-
-In essence we now do a bare minimal stuff:
- 1) Select HS38x2_1 with CORE_SEL=1 bits
- 2) Select "manual" core start (via CREG) with START_MODE=0
- 3) Generate cpu_start pulse with START=1
-
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
-Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
----
- board/synopsys/axs10x/axs10x.c | 12 +++++-------
- 1 file changed, 5 insertions(+), 7 deletions(-)
-
-diff --git a/board/synopsys/axs10x/axs10x.c b/board/synopsys/axs10x/axs10x.c
-index a5e774b2cf7b..57c790220f71 100644
---- a/board/synopsys/axs10x/axs10x.c
-+++ b/board/synopsys/axs10x/axs10x.c
-@@ -61,16 +61,14 @@ void smp_kick_all_cpus(void)
- {
- /* CPU start CREG */
- #define AXC003_CREG_CPU_START	0xF0001400
--
- /* Bits positions in CPU start CREG */
- #define BITS_START	0
--#define BITS_POLARITY	8
-+#define BITS_START_MODE	4
- #define BITS_CORE_SEL	9
--#define BITS_MULTICORE	12
--
--#define CMD	(1 << BITS_MULTICORE) | (1 << BITS_CORE_SEL) | \
--		(1 << BITS_POLARITY) | (1 << BITS_START)
- 
--	writel(CMD, (void __iomem *)AXC003_CREG_CPU_START);
-+	int cmd = readl((void __iomem *)AXC003_CREG_CPU_START);
-+	cmd |= (1 << BITS_CORE_SEL) | (1 << BITS_START);
-+	cmd &= ~(1 << BITS_START_MODE);
-+	writel(cmd, (void __iomem *)AXC003_CREG_CPU_START);
- }
- #endif
--- 
-2.7.4
-
diff --git a/board/synopsys/axs10x/patches/u-boot/0002-axs103-Support-slave-core-kick-start-on-axs103-v1.1-.patch b/board/synopsys/axs10x/patches/u-boot/0002-axs103-Support-slave-core-kick-start-on-axs103-v1.1-.patch
deleted file mode 100644
index 0fcc0e630f..0000000000
--- a/board/synopsys/axs10x/patches/u-boot/0002-axs103-Support-slave-core-kick-start-on-axs103-v1.1-.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From a5fa3b17cb10ce020f8b7fe6a26c45d75f55b481 Mon Sep 17 00:00:00 2001
-From: Alexey Brodkin <abrodkin@synopsys.com>
-Date: Fri, 31 Mar 2017 11:14:35 +0300
-Subject: [PATCH] axs103: Support slave core kick-start on axs103 v1.1
- firmware
-
-In axs103 v1.1 procedure to kick-start slave cores has changed quite a bit
-compared to previous implementation.
-
-In particular:
- * We used to have a generic START bit for all cores selected by CORE_SEL
-   mask. But now we don't touch CORE_SEL at all because we have a dedicated
-   START bit for each core:
-     bit 0: Core 0 (master)
-     bit 1: Core 1 (slave)
- * Now there's no need to select "manual" mode of core start
-
-Additional challenge for us is how to tell which axs103 firmware we're
-dealing with. For now we'll rely on ARC core version which was bumped
-from 2.1c to 3.0.
-
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
-Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
----
- board/synopsys/axs10x/axs10x.c | 23 +++++++++++++++++++++--
- 1 file changed, 21 insertions(+), 2 deletions(-)
-
-diff --git a/board/synopsys/axs10x/axs10x.c b/board/synopsys/axs10x/axs10x.c
-index 57c790220f71..e6b69da3da7f 100644
---- a/board/synopsys/axs10x/axs10x.c
-+++ b/board/synopsys/axs10x/axs10x.c
-@@ -7,6 +7,7 @@
- #include <common.h>
- #include <dwmmc.h>
- #include <malloc.h>
-+#include <asm/arcregs.h>
- #include "axs10x.h"
- 
- DECLARE_GLOBAL_DATA_PTR;
-@@ -66,9 +67,27 @@ void smp_kick_all_cpus(void)
- #define BITS_START_MODE	4
- #define BITS_CORE_SEL	9
- 
-+/*
-+ * In axs103 v1.1 START bits semantics has changed quite a bit.
-+ * We used to have a generic START bit for all cores selected by CORE_SEL mask.
-+ * But now we don't touch CORE_SEL at all because we have a dedicated START bit
-+ * for each core:
-+ *     bit 0: Core 0 (master)
-+ *     bit 1: Core 1 (slave)
-+ */
-+#define BITS_START_CORE1	1
-+
-+#define ARCVER_HS38_3_0	0x53
-+
-+	int core_family = read_aux_reg(ARC_AUX_IDENTITY) & 0xff;
- 	int cmd = readl((void __iomem *)AXC003_CREG_CPU_START);
--	cmd |= (1 << BITS_CORE_SEL) | (1 << BITS_START);
--	cmd &= ~(1 << BITS_START_MODE);
-+
-+	if (core_family < ARCVER_HS38_3_0) {
-+		cmd |= (1 << BITS_CORE_SEL) | (1 << BITS_START);
-+		cmd &= ~(1 << BITS_START_MODE);
-+	} else {
-+		cmd |= (1 << BITS_START_CORE1);
-+	}
- 	writel(cmd, (void __iomem *)AXC003_CREG_CPU_START);
- }
- #endif
--- 
-2.7.4
-
diff --git a/configs/snps_arc700_axs101_defconfig b/configs/snps_arc700_axs101_defconfig
index 0fefaf4aa8..7f71df6ca3 100644
--- a/configs/snps_arc700_axs101_defconfig
+++ b/configs/snps_arc700_axs101_defconfig
@@ -22,6 +22,6 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.05"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="axs101"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
diff --git a/configs/snps_archs38_axs103_defconfig b/configs/snps_archs38_axs103_defconfig
index 39ceeae433..bb32da9364 100644
--- a/configs/snps_archs38_axs103_defconfig
+++ b/configs/snps_archs38_axs103_defconfig
@@ -23,7 +23,6 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.01"
-BR2_TARGET_UBOOT_PATCH="board/synopsys/axs10x/patches/u-boot"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.05"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="axs103"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
diff --git a/configs/snps_archs38_hsdk_defconfig b/configs/snps_archs38_hsdk_defconfig
index 125063b444..eb1720e510 100644
--- a/configs/snps_archs38_hsdk_defconfig
+++ b/configs/snps_archs38_hsdk_defconfig
@@ -31,7 +31,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/synopsys/hsdk/genimage.cfg"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.05"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="hsdk"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_ELF=y
-- 
2.16.2
