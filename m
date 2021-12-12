Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D69CC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 12:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0E1460E7A;
	Sun, 12 Dec 2021 12:38:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KWAj2N87tInD; Sun, 12 Dec 2021 12:38:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCEA360E7B;
	Sun, 12 Dec 2021 12:38:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 14C841BF373
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03D4C404FE
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:37:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=libero.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HJB1yrVr0ayX for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 12:37:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from libero.it (smtp-34.italiaonline.it [213.209.10.34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B3E0B4048E
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 12:37:57 +0000 (UTC)
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it ([82.50.51.121])
 by smtp-34.iol.local with ESMTPA
 id wO70mmmvtUpmcwO71mGvI0; Sun, 12 Dec 2021 13:37:55 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
 t=1639312675; bh=LfBoQXXmc/hwYFWj/Kc32uq13Z1X5EUvofulfvRGQ8c=;
 h=From;
 b=ort1DhOThva3iY5nfqWKq2STjvnUn9XjS+BW0a2hT26xv50JPcVPf5DbdMk0JjhZE
 Odnj7jRPnelO2UF0H64QTnR+mXiRXl3EepxkR/cygBulGBZJvABExPJY1rnCq1Vg/5
 x2BDgVJnPotPpyLcIWOaBZvqKCJQilSPAvyeUfxSnM7Wadm2aflA4VwdyGeRAJWq1q
 MRawoC1cZWpI6NTsxx/W1p0/l+VOUsonVBlDfzHRM5r5HF+1LjcPf5bmHdbP07VzMg
 BF3VPrIVaSJGoBB0VSk0kjRlXGQb/q7QQYTe5D8yafUh2t5uFm2GeGczkVusQFi9PL
 JW0nqqMIdNItw==
X-CNFS-Analysis: v=2.4 cv=VsDmv86n c=1 sm=1 tr=0 ts=61b5ed23 cx=a_exe
 a=xtCFBUu/Ze6RtP+zVSd77w==:117 a=xtCFBUu/Ze6RtP+zVSd77w==:17 a=pGLkceISAAAA:8
 a=x06lECoZNFyqQeWrCsUA:9
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 13:37:50 +0100
Message-Id: <20211212123753.11848-2-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211212123753.11848-1-dariobin@libero.it>
References: <20211212123753.11848-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfIYBQeKBx+I9Uv1nhIe3VScveqbDtkPtAv2LwR5psLEkAWbDwK/YyTma+5tfPlsi4t15yLE8YKmHZS07lBouor99E73Ky4cIqbe2V7s9BgSGawveqSUV
 7wjQpDsNNh+Qh4gOQrzebwQc/K04Xc5PrURU7Fft1u7MuvQVqLLGcUQ/94Dy5sKKQBCui42e1ZGY0Lcb9ZqcGju3sepeYNLX0N+8HJ6ELHwqb9Xr6HlORFRs
 gdZp6tqJyGxZ2GMXwkmw7G5qfS8O9SAdFPrUEUnV6R7A0juQxqZ5JqpAIQ7+CAFnW9BX76QJsFt/iUaePvoSYLDUIvbd66HttRMUd9aHwsV7Qid2WFdsiGeK
 wmdV9MmwJEiK+ivU0xaIsi1dWhTi4Q==
Subject: [Buildroot] [RESEND PATCH v2,
 1/4] configs/stm32f469_xip_disco: fix kernel bootup
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Dario Binacchi via buildroot <buildroot@buildroot.org>
Reply-To: Dario Binacchi <dariobin@libero.it>
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 Lee Jones <lee.jones@linaro.org>, Dario Binacchi <dariobin@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Testing this configuration on the stm32f469-disco board failed. Removing
the changes on the DRAM I got a bootable image. I also changed the
kernel load address from 0x8010000 to 0x800C000 to allocate more space to
the kernel since 32kB for the device tree is enough.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
---
 .../stm32f469-disco/flash_xip.sh              |  2 +-
 .../stm32f469-disco/linux-xip.config          |  8 +--
 ...32f469-i-Update-kernel-start-address.patch | 56 -------------------
 ...69i-disco-change-kernel-load-address.patch | 26 +++++++++
 ...fault-dram-address-without-remapping.patch | 38 -------------
 configs/stm32f469_disco_xip_defconfig         |  1 +
 6 files changed, 32 insertions(+), 99 deletions(-)
 mode change 100644 => 100755 board/stmicroelectronics/stm32f469-disco/flash_xip.sh
 delete mode 100644 board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0001-stm32f469-i-Update-kernel-start-address.patch
 create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0001-stm32f469i-disco-change-kernel-load-address.patch
 delete mode 100644 board/stmicroelectronics/stm32f469-disco/patches/linux/0001-Use-default-dram-address-without-remapping.patch

diff --git a/board/stmicroelectronics/stm32f469-disco/flash_xip.sh b/board/stmicroelectronics/stm32f469-disco/flash_xip.sh
old mode 100644
new mode 100755
index b5a067cee5..da27cd327c
--- a/board/stmicroelectronics/stm32f469-disco/flash_xip.sh
+++ b/board/stmicroelectronics/stm32f469-disco/flash_xip.sh
@@ -15,6 +15,6 @@ ${OUTPUT_DIR}/host/bin/openocd -f board/stm32f469discovery.cfg \
   -c "flash info 0" \
   -c "flash write_image erase ${OUTPUT_DIR}/images/stm32f469i-disco.bin 0x08000000" \
   -c "flash write_image erase ${OUTPUT_DIR}/images/stm32f469-disco.dtb 0x08004000" \
-  -c "flash write_image erase ${OUTPUT_DIR}/images/xipImage 0x08010000" \
+  -c "flash write_image erase ${OUTPUT_DIR}/images/xipImage 0x0800C000" \
   -c "reset run" \
   -c "shutdown"
diff --git a/board/stmicroelectronics/stm32f469-disco/linux-xip.config b/board/stmicroelectronics/stm32f469-disco/linux-xip.config
index 2d0ce59b31..01a94eb9d1 100644
--- a/board/stmicroelectronics/stm32f469-disco/linux-xip.config
+++ b/board/stmicroelectronics/stm32f469-disco/linux-xip.config
@@ -18,7 +18,7 @@ CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 # CONFIG_MULTIUSER is not set
 # CONFIG_SYSFS_SYSCALL is not set
 # CONFIG_FHANDLE is not set
-# CONFIG_POSIX_TIMERS is not set
+CONFIG_POSIX_TIMERS=y
 # CONFIG_BUG is not set
 # CONFIG_BASE_FULL is not set
 # CONFIG_FUTEX is not set
@@ -47,12 +47,12 @@ CONFIG_ARCH_STM32=y
 CONFIG_CPU_V7M_NUM_IRQ=240
 # CONFIG_ARM_DMA_MEM_BUFFERABLE is not set
 CONFIG_SET_MEM_PARAM=y
-CONFIG_DRAM_BASE=0xc0000000
-CONFIG_DRAM_SIZE=0x01000000
+CONFIG_DRAM_BASE=0x00000000
+CONFIG_DRAM_SIZE=0x00800000
 CONFIG_HZ_1000=y
 # CONFIG_ATAGS is not set
 CONFIG_XIP_KERNEL=y
-CONFIG_XIP_PHYS_ADDR=0x08010000
+CONFIG_XIP_PHYS_ADDR=0x0800C000
 CONFIG_XIP_DEFLATED_DATA=y
 # CONFIG_SUSPEND is not set
 # CONFIG_STACKPROTECTOR is not set
diff --git a/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0001-stm32f469-i-Update-kernel-start-address.patch b/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0001-stm32f469-i-Update-kernel-start-address.patch
deleted file mode 100644
index d5d1e5a8ad..0000000000
--- a/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0001-stm32f469-i-Update-kernel-start-address.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From fe5f3a86d07e378baeeddc1dfecd0686d83aa42f Mon Sep 17 00:00:00 2001
-From: Yauheni Saldatsenka <eugentoo@gmail.com>
-Date: Sat, 14 Aug 2021 18:54:51 +0300
-Subject: [PATCH] stm32f469-i: Update kernel start address
-
-As of GNU/Linux v5.12 kernel device tree binary grows above 0x08008000
-and overwrites kernel binary
-Therefore this commit moves kernel to the next flash bank
-
-Signed-off-by: Yauheni Saldatsenka <eugentoo@gmail.com>
----
- stm32f469i-disco.c | 7 +++----
- 1 file changed, 3 insertions(+), 4 deletions(-)
-
-diff --git a/stm32f469i-disco.c b/stm32f469i-disco.c
-index 2da1f4b..46fc06a 100644
---- a/stm32f469i-disco.c
-+++ b/stm32f469i-disco.c
-@@ -6,6 +6,7 @@
- #include "gpio.h"
- #include "mpu.h"
- 
-+#define KERNEL_ADDR     0x08010000
- #define CONFIG_HSE_HZ	8000000
- #define CONFIG_PLL_M	8
- #define CONFIG_PLL_N	360
-@@ -85,7 +86,7 @@ static void fmc_wait_busy(void)
- 
- void start_kernel(void)
- {
--	void (*kernel)(uint32_t reserved, uint32_t mach, uint32_t dt) = (void (*)(uint32_t, uint32_t, uint32_t))(0x08008000 | 1);
-+	void (*kernel)(uint32_t reserved, uint32_t mach, uint32_t dt) = (void (*)(uint32_t, uint32_t, uint32_t))(KERNEL_ADDR | 1);
- 
- 	kernel(0, ~0UL, 0x08004000);
- }
-@@ -102,7 +103,7 @@ int main(void)
- 	volatile uint32_t *SYSCFG_MEMRMP = (void *)(SYSCFG_BASE + 0x00);
- 	int i;
- 
--	mpu_config(0x0);
-+	mpu_config(0xc0000000);
- 
- 	if (*FLASH_CR & FLASH_CR_LOCK) {
- 		*FLASH_KEYR = 0x45670123;
-@@ -195,8 +196,6 @@ int main(void)
- 	usart_setup(usart_base, 45000000);
- 	usart_putch(usart_base, '.');
- 
--	*SYSCFG_MEMRMP = 0x4;
--
- 	start_kernel();
- 
- 	return 0;
--- 
-2.32.0
-
diff --git a/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0001-stm32f469i-disco-change-kernel-load-address.patch b/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0001-stm32f469i-disco-change-kernel-load-address.patch
new file mode 100644
index 0000000000..1f8d929bfb
--- /dev/null
+++ b/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0001-stm32f469i-disco-change-kernel-load-address.patch
@@ -0,0 +1,26 @@
+From d87969f72671cab5a88ba6e2418e43d0fa267d6f Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dariobin@libero.it>
+Date: Sat, 13 Nov 2021 15:46:32 +0100
+Subject: [PATCH] stm32f469i-disco: change kernel load address
+
+Signed-off-by: Dario Binacchi <dariobin@libero.it>
+---
+ stm32f469i-disco.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/stm32f469i-disco.c b/stm32f469i-disco.c
+index 2da1f4b..3aacb12 100644
+--- a/stm32f469i-disco.c
++++ b/stm32f469i-disco.c
+@@ -85,7 +85,7 @@ static void fmc_wait_busy(void)
+ 
+ void start_kernel(void)
+ {
+-	void (*kernel)(uint32_t reserved, uint32_t mach, uint32_t dt) = (void (*)(uint32_t, uint32_t, uint32_t))(0x08008000 | 1);
++	void (*kernel)(uint32_t reserved, uint32_t mach, uint32_t dt) = (void (*)(uint32_t, uint32_t, uint32_t))(0x0800C000 | 1);
+ 
+ 	kernel(0, ~0UL, 0x08004000);
+ }
+-- 
+2.17.1
+
diff --git a/board/stmicroelectronics/stm32f469-disco/patches/linux/0001-Use-default-dram-address-without-remapping.patch b/board/stmicroelectronics/stm32f469-disco/patches/linux/0001-Use-default-dram-address-without-remapping.patch
deleted file mode 100644
index 68fe8380a2..0000000000
--- a/board/stmicroelectronics/stm32f469-disco/patches/linux/0001-Use-default-dram-address-without-remapping.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 8ccf9f625d00138d86fb7d70f3efd58a8fb4d7ff Mon Sep 17 00:00:00 2001
-From: Yauheni Saldatsenka <eugentoo@gmail.com>
-Date: Mon, 23 Aug 2021 02:54:22 +0300
-Subject: [PATCH] Use default dram address without remapping
-
-Signed-off-by: Yauheni Saldatsenka <eugentoo@gmail.com>
----
- arch/arm/boot/dts/stm32f469-disco.dts | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/arch/arm/boot/dts/stm32f469-disco.dts b/arch/arm/boot/dts/stm32f469-disco.dts
-index 2e1b3bbbe4b5..06845614a19a 100644
---- a/arch/arm/boot/dts/stm32f469-disco.dts
-+++ b/arch/arm/boot/dts/stm32f469-disco.dts
-@@ -60,9 +60,9 @@ chosen {
- 		stdout-path = "serial0:115200n8";
- 	};
- 
--	memory@00000000 {
-+	memory@c0000000 {
- 		device_type = "memory";
--		reg = <0x00000000 0x1000000>;
-+		reg = <0xc0000000 0x1000000>;
- 	};
- 
- 	aliases {
-@@ -84,7 +84,7 @@ vdd_dsi: vdd-dsi {
- 	};
- 
- 	soc {
--		dma-ranges = <0xc0000000 0x0 0x10000000>;
-+		dma-ranges = <0xc0000000 0xc0000000 0x10000000>;
- 	};
- 
- 	leds {
--- 
-2.32.0
-
diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
index 1ceffe4026..e8b2cf3d21 100644
--- a/configs/stm32f469_disco_xip_defconfig
+++ b/configs/stm32f469_disco_xip_defconfig
@@ -3,6 +3,7 @@ BR2_cortex_m4=y
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f469-disco/patches"
 # BR2_UCLIBC_INSTALL_UTILS is not set
 BR2_GCC_ENABLE_LTO=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f469-disco/linux-xip.config"
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
