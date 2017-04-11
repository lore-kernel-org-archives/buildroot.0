From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Tue, 11 Apr 2017 17:42:54 +0300
Subject: [Buildroot] [PATCH 2/2] arc: u-boot: Support slave core kick-start
	on axs103 v1.1
In-Reply-To: <1491921774-14748-1-git-send-email-vzakhar@synopsys.com>
References: <1491921774-14748-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <1491921774-14748-3-git-send-email-vzakhar@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With this patch we add a couple of of-the-tree patches for u-boot.

We have an update in hardware that changed the kick-start slave cores
procedure. So these patches introduce fixes to work with new axs103 version
correctly.

They have been already accepted in upstream u-boot so we need to get
rid of them as soon as these updates will get available in buildroot.

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
---
 .../0001-axs103-Clean-up-smp_kick_all_cpus.patch   | 48 +++++++++++++++
 ...ort-slave-core-kick-start-on-axs103-v1.1-.patch | 72 ++++++++++++++++++++++
 configs/snps_archs38_axs103_defconfig              |  1 +
 3 files changed, 121 insertions(+)
 create mode 100644 board/synopsys/axs10x/patches/u-boot/0001-axs103-Clean-up-smp_kick_all_cpus.patch
 create mode 100644 board/synopsys/axs10x/patches/u-boot/0002-axs103-Support-slave-core-kick-start-on-axs103-v1.1-.patch

diff --git a/board/synopsys/axs10x/patches/u-boot/0001-axs103-Clean-up-smp_kick_all_cpus.patch b/board/synopsys/axs10x/patches/u-boot/0001-axs103-Clean-up-smp_kick_all_cpus.patch
new file mode 100644
index 0000000..cf5122e
--- /dev/null
+++ b/board/synopsys/axs10x/patches/u-boot/0001-axs103-Clean-up-smp_kick_all_cpus.patch
@@ -0,0 +1,48 @@
+From ee5a5a51780bcb17e5240335ddfa9c98a0e6f890 Mon Sep 17 00:00:00 2001
+From: Alexey Brodkin <abrodkin@synopsys.com>
+Date: Thu, 30 Mar 2017 19:18:30 +0300
+Subject: [PATCH 1/2] axs103: Clean-up smp_kick_all_cpus()
+
+ * Rely on default pulse polarity value
+ * Don't mess with "multicore" value as it doesn't affect execution
+
+In essence we now do a bare minimal stuff:
+ 1) Select HS38x2_1 with CORE_SEL=1 bits
+ 2) Select "manual" core start (via CREG) with START_MODE=0
+ 3) Generate cpu_start pulse with START=1
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
+---
+ board/synopsys/axs10x/axs10x.c | 12 +++++-------
+ 1 file changed, 5 insertions(+), 7 deletions(-)
+
+diff --git a/board/synopsys/axs10x/axs10x.c b/board/synopsys/axs10x/axs10x.c
+index a5e774b2cf7b..57c790220f71 100644
+--- a/board/synopsys/axs10x/axs10x.c
++++ b/board/synopsys/axs10x/axs10x.c
+@@ -61,16 +61,14 @@ void smp_kick_all_cpus(void)
+ {
+ /* CPU start CREG */
+ #define AXC003_CREG_CPU_START	0xF0001400
+-
+ /* Bits positions in CPU start CREG */
+ #define BITS_START	0
+-#define BITS_POLARITY	8
++#define BITS_START_MODE	4
+ #define BITS_CORE_SEL	9
+-#define BITS_MULTICORE	12
+-
+-#define CMD	(1 << BITS_MULTICORE) | (1 << BITS_CORE_SEL) | \
+-		(1 << BITS_POLARITY) | (1 << BITS_START)
+ 
+-	writel(CMD, (void __iomem *)AXC003_CREG_CPU_START);
++	int cmd = readl((void __iomem *)AXC003_CREG_CPU_START);
++	cmd |= (1 << BITS_CORE_SEL) | (1 << BITS_START);
++	cmd &= ~(1 << BITS_START_MODE);
++	writel(cmd, (void __iomem *)AXC003_CREG_CPU_START);
+ }
+ #endif
+-- 
+2.7.4
+
diff --git a/board/synopsys/axs10x/patches/u-boot/0002-axs103-Support-slave-core-kick-start-on-axs103-v1.1-.patch b/board/synopsys/axs10x/patches/u-boot/0002-axs103-Support-slave-core-kick-start-on-axs103-v1.1-.patch
new file mode 100644
index 0000000..2f64a9a
--- /dev/null
+++ b/board/synopsys/axs10x/patches/u-boot/0002-axs103-Support-slave-core-kick-start-on-axs103-v1.1-.patch
@@ -0,0 +1,72 @@
+From a5fa3b17cb10ce020f8b7fe6a26c45d75f55b481 Mon Sep 17 00:00:00 2001
+From: Alexey Brodkin <abrodkin@synopsys.com>
+Date: Fri, 31 Mar 2017 11:14:35 +0300
+Subject: [PATCH 2/2] axs103: Support slave core kick-start on axs103 v1.1
+ firmware
+
+In axs103 v1.1 procedure to kick-start slave cores has changed quite a bit
+compared to previous implementation.
+
+In particular:
+ * We used to have a generic START bit for all cores selected by CORE_SEL
+   mask. But now we don't touch CORE_SEL at all because we have a dedicated
+   START bit for each core:
+     bit 0: Core 0 (master)
+     bit 1: Core 1 (slave)
+ * Now there's no need to select "manual" mode of core start
+
+Additional challenge for us is how to tell which axs103 firmware we're
+dealing with. For now we'll rely on ARC core version which was bumped
+from 2.1c to 3.0.
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
+---
+ board/synopsys/axs10x/axs10x.c | 23 +++++++++++++++++++++--
+ 1 file changed, 21 insertions(+), 2 deletions(-)
+
+diff --git a/board/synopsys/axs10x/axs10x.c b/board/synopsys/axs10x/axs10x.c
+index 57c790220f71..e6b69da3da7f 100644
+--- a/board/synopsys/axs10x/axs10x.c
++++ b/board/synopsys/axs10x/axs10x.c
+@@ -7,6 +7,7 @@
+ #include <common.h>
+ #include <dwmmc.h>
+ #include <malloc.h>
++#include <asm/arcregs.h>
+ #include "axs10x.h"
+ 
+ DECLARE_GLOBAL_DATA_PTR;
+@@ -66,9 +67,27 @@ void smp_kick_all_cpus(void)
+ #define BITS_START_MODE	4
+ #define BITS_CORE_SEL	9
+ 
++/*
++ * In axs103 v1.1 START bits semantics has changed quite a bit.
++ * We used to have a generic START bit for all cores selected by CORE_SEL mask.
++ * But now we don't touch CORE_SEL at all because we have a dedicated START bit
++ * for each core:
++ *     bit 0: Core 0 (master)
++ *     bit 1: Core 1 (slave)
++ */
++#define BITS_START_CORE1	1
++
++#define ARCVER_HS38_3_0	0x53
++
++	int core_family = read_aux_reg(ARC_AUX_IDENTITY) & 0xff;
+ 	int cmd = readl((void __iomem *)AXC003_CREG_CPU_START);
+-	cmd |= (1 << BITS_CORE_SEL) | (1 << BITS_START);
+-	cmd &= ~(1 << BITS_START_MODE);
++
++	if (core_family < ARCVER_HS38_3_0) {
++		cmd |= (1 << BITS_CORE_SEL) | (1 << BITS_START);
++		cmd &= ~(1 << BITS_START_MODE);
++	} else {
++		cmd |= (1 << BITS_START_CORE1);
++	}
+ 	writel(cmd, (void __iomem *)AXC003_CREG_CPU_START);
+ }
+ #endif
+-- 
+2.7.4
+
diff --git a/configs/snps_archs38_axs103_defconfig b/configs/snps_archs38_axs103_defconfig
index 7100998..9021f99 100644
--- a/configs/snps_archs38_axs103_defconfig
+++ b/configs/snps_archs38_axs103_defconfig
@@ -23,5 +23,6 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.01"
+BR2_TARGET_UBOOT_PATCH="board/synopsys/axs10x/patches/u-boot"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="axs103"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.7.4
