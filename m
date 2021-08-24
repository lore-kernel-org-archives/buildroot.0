Return-Path: <SRS0=7Mk9=NP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C47C4338F
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 10:03:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 332D96125F
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 10:03:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 332D96125F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F292B403AE;
	Tue, 24 Aug 2021 10:03:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ToVEa8xcgJo; Tue, 24 Aug 2021 10:03:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45781403DF;
	Tue, 24 Aug 2021 10:03:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 31A061BF419
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 10:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CD1180DA5
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 10:03:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GHRX0mieIlHc for <buildroot@lists.busybox.net>;
 Tue, 24 Aug 2021 10:03:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A1F8080CA6
 for <buildroot@buildroot.org>; Tue, 24 Aug 2021 10:03:24 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id g13so44237969lfj.12
 for <buildroot@buildroot.org>; Tue, 24 Aug 2021 03:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qSSuDFudJ2rhlg2oOxvh+TumMHCcuXTxbhUcC+lGRkk=;
 b=GVnlH3qLp6IgDhblPTroXGZlMikHkDCGod8ZweiVYFb0KBUXJW9xsoMsy0ko8e6ne6
 wgvjOQk3SU9RHnA7EGujuM9ljfMvqMrCU4Bsv8aHM0+8M3yO6R1CRTYwzydvKgl1V1MR
 578sKg2ou6aK+vkJoiCdtBFIywMDVisd7VH9t3b6nfKuemTdMoBruNVYqpxgmFITUqRf
 UpobC26qqbuKr20DIIxiJGIIu/ypLOcgry3HjgNtdxURBY0zb1kq7r252ZDg/NITjPgM
 hvvZ4hnJnECZ4kWbrjMEifpl0nZUngoQ8mh6DO3m/IkRnoLaivCoTr3xGc6Lv8r6AJOK
 fH7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qSSuDFudJ2rhlg2oOxvh+TumMHCcuXTxbhUcC+lGRkk=;
 b=NNP4HrMhG9W5909JWvNh6C5foPU0JrMSbGKCdN55gD+D7vB+S8t8HZaEeOGK0U2Lfb
 OXRAHSUuRB5cYx2GdU5q59A8e3CgrId8t47BNjiYe/Lg10rgqlSJyecdE+wljcT1GQnD
 +8svbUBzuIg8Bw4aNH7jsr8b0v3Bc+alW1JiCKqE1a5IcEgw+PodXZ7sQb5dYcE/qfnD
 Ljzyp4VL1L+lekCBZwStlKMdGewnN+X+fyONJ7R2YS/Mt+eLBICbIz1w0xmH6QrEYLin
 HyjKWY9qJIZplfh176/9mKodEwARh8pdwj/5gg8pTtVvrfHDChbzrU4aykWeNkaKBOLg
 b/Qw==
X-Gm-Message-State: AOAM532bjC802e7nypLD0ze1Q2d44KDIvNJSTyzkeG3Zfq/S24t0yfYo
 4+NwVqS/LmqDR7PFEfSerRoY/mswVWHrmdLl3L8=
X-Google-Smtp-Source: ABdhPJzjzkPC6gkvHvkodJx0BQ7oN+Onn4vmEoqUvB+7HH/wmROGuRMa+2HOzljjUq88PURQYXvGog==
X-Received: by 2002:ac2:4c46:: with SMTP id o6mr28240432lfk.573.1629799402287; 
 Tue, 24 Aug 2021 03:03:22 -0700 (PDT)
Received: from localhost.localdomain (m90-131-47-35.cust.tele2.lt.
 [90.131.47.35])
 by smtp.gmail.com with ESMTPSA id b10sm1707274lfj.237.2021.08.24.03.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 03:03:21 -0700 (PDT)
From: Yauheni Saldatsenka <eugentoo@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 24 Aug 2021 13:03:11 +0300
Message-Id: <20210824100311.287591-2-eugentoo@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824100311.287591-1-eugentoo@gmail.com>
References: <20210824100311.287591-1-eugentoo@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] [PATCH v2 1/1]
 configs/stm32f469_disco_xip_defconfig: alternative defconfig for XIP
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Result of make tinyconfig was taken as a starting point to fit kernel
into flash memory.
Current setup kernel + rootfs fits in 1.6MB on-chip flash memory.

Fixes:
    - Move kernel to new flash bank due to growth of dtb size
    - Fix kernel start address in bootloader

For better binary size optimization gcc LTO is turned on.

Signed-off-by: Yauheni Saldatsenka <eugentoo@gmail.com>

----
v1 -> v2:
- Change codestyle in bash scripts
- Use in-tree dts with config fragment
- Update readme.txt
- Remove unnecessary target and host packages from defconfig

Signed-off-by: Yauheni Saldatsenka <eugentoo@gmail.com>
---
 .../stm32f469-disco/flash.sh                  |  6 +-
 .../linux/{defconfig => linux.config}         |  0
 ...32f469-i-Update-kernel-start-address.patch | 56 +++++++++++++++++++
 .../0002-kernel-start-address.patch           | 21 -------
 .../patches/afboot-stm32/0003-no-mpu.patch    | 22 --------
 ...fault-dram-address-without-remapping.patch | 38 +++++++++++++
 .../stm32f469-disco/readme.txt                | 26 +++++++--
 configs/stm32f469_disco_xip_defconfig         |  8 +--
 8 files changed, 117 insertions(+), 60 deletions(-)
 rename board/stmicroelectronics/stm32f469-disco/linux/{defconfig => linux.config} (100%)
 create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0001-stm32f469-i-Update-kernel-start-address.patch
 delete mode 100644 board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0002-kernel-start-address.patch
 delete mode 100644 board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0003-no-mpu.patch
 create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/linux/0001-Use-default-dram-address-without-remapping.patch

diff --git a/board/stmicroelectronics/stm32f469-disco/flash.sh b/board/stmicroelectronics/stm32f469-disco/flash.sh
index 176e1c9d2c..0e130908aa 100755
--- a/board/stmicroelectronics/stm32f469-disco/flash.sh
+++ b/board/stmicroelectronics/stm32f469-disco/flash.sh
@@ -3,15 +3,13 @@
 OUTPUT_DIR=$1
 BUILD_TYPE=$2
 
-if ! test -d "${OUTPUT_DIR}"
-then
+if ! test -d "${OUTPUT_DIR}"; then
     echo "ERROR: no output directory specified."
     echo "Usage: $0 OUTPUT_DIR"
     exit 1
 fi
 
-if  [[ -z "${BUILD_TYPE}" ]]
-then
+if  [[ -z "${BUILD_TYPE}" ]]; then
     echo "ERROR: no build type specified, please select 'xip' or 'uboot'."
     echo "Usage: $0 OUTPUT_DIR $1 BUILD_TYPE"
     exit 1
diff --git a/board/stmicroelectronics/stm32f469-disco/linux/defconfig b/board/stmicroelectronics/stm32f469-disco/linux/linux.config
similarity index 100%
rename from board/stmicroelectronics/stm32f469-disco/linux/defconfig
rename to board/stmicroelectronics/stm32f469-disco/linux/linux.config
diff --git a/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0001-stm32f469-i-Update-kernel-start-address.patch b/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0001-stm32f469-i-Update-kernel-start-address.patch
new file mode 100644
index 0000000000..d5d1e5a8ad
--- /dev/null
+++ b/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0001-stm32f469-i-Update-kernel-start-address.patch
@@ -0,0 +1,56 @@
+From fe5f3a86d07e378baeeddc1dfecd0686d83aa42f Mon Sep 17 00:00:00 2001
+From: Yauheni Saldatsenka <eugentoo@gmail.com>
+Date: Sat, 14 Aug 2021 18:54:51 +0300
+Subject: [PATCH] stm32f469-i: Update kernel start address
+
+As of GNU/Linux v5.12 kernel device tree binary grows above 0x08008000
+and overwrites kernel binary
+Therefore this commit moves kernel to the next flash bank
+
+Signed-off-by: Yauheni Saldatsenka <eugentoo@gmail.com>
+---
+ stm32f469i-disco.c | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/stm32f469i-disco.c b/stm32f469i-disco.c
+index 2da1f4b..46fc06a 100644
+--- a/stm32f469i-disco.c
++++ b/stm32f469i-disco.c
+@@ -6,6 +6,7 @@
+ #include "gpio.h"
+ #include "mpu.h"
+ 
++#define KERNEL_ADDR     0x08010000
+ #define CONFIG_HSE_HZ	8000000
+ #define CONFIG_PLL_M	8
+ #define CONFIG_PLL_N	360
+@@ -85,7 +86,7 @@ static void fmc_wait_busy(void)
+ 
+ void start_kernel(void)
+ {
+-	void (*kernel)(uint32_t reserved, uint32_t mach, uint32_t dt) = (void (*)(uint32_t, uint32_t, uint32_t))(0x08008000 | 1);
++	void (*kernel)(uint32_t reserved, uint32_t mach, uint32_t dt) = (void (*)(uint32_t, uint32_t, uint32_t))(KERNEL_ADDR | 1);
+ 
+ 	kernel(0, ~0UL, 0x08004000);
+ }
+@@ -102,7 +103,7 @@ int main(void)
+ 	volatile uint32_t *SYSCFG_MEMRMP = (void *)(SYSCFG_BASE + 0x00);
+ 	int i;
+ 
+-	mpu_config(0x0);
++	mpu_config(0xc0000000);
+ 
+ 	if (*FLASH_CR & FLASH_CR_LOCK) {
+ 		*FLASH_KEYR = 0x45670123;
+@@ -195,8 +196,6 @@ int main(void)
+ 	usart_setup(usart_base, 45000000);
+ 	usart_putch(usart_base, '.');
+ 
+-	*SYSCFG_MEMRMP = 0x4;
+-
+ 	start_kernel();
+ 
+ 	return 0;
+-- 
+2.32.0
+
diff --git a/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0002-kernel-start-address.patch b/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0002-kernel-start-address.patch
deleted file mode 100644
index 614effa85b..0000000000
--- a/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0002-kernel-start-address.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-diff --git a/stm32f469i-disco.c b/stm32f469i-disco.c
-index 2da1f4b65f..96e4dff65e 100644
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
diff --git a/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0003-no-mpu.patch b/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0003-no-mpu.patch
deleted file mode 100644
index bc66d2d0ef..0000000000
--- a/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0003-no-mpu.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-diff --git a/stm32f469i-disco.c b/stm32f469i-disco.c
-index d4d0909831..03f823f288 100644
---- a/stm32f469i-disco.c
-+++ b/stm32f469i-disco.c
-@@ -127,7 +127,7 @@ int main(void)
- 
- 	int i;
- 
--	mpu_config(0x0);
-+	mpu_config(0xc0000000); 
- 
- 	if (*FLASH_CR & FLASH_CR_LOCK) {
- 		*FLASH_KEYR = 0x45670123;
-@@ -229,7 +229,7 @@ int main(void)
- 	usart_setup(usart_base, 45000000);
- 	usart_putch(usart_base, '.');
- 
--	*SYSCFG_MEMRMP = 0x4;
-+	/* *SYSCFG_MEMRMP = 0x4; */
- 
- 	start_kernel();
- 
diff --git a/board/stmicroelectronics/stm32f469-disco/patches/linux/0001-Use-default-dram-address-without-remapping.patch b/board/stmicroelectronics/stm32f469-disco/patches/linux/0001-Use-default-dram-address-without-remapping.patch
new file mode 100644
index 0000000000..68fe8380a2
--- /dev/null
+++ b/board/stmicroelectronics/stm32f469-disco/patches/linux/0001-Use-default-dram-address-without-remapping.patch
@@ -0,0 +1,38 @@
+From 8ccf9f625d00138d86fb7d70f3efd58a8fb4d7ff Mon Sep 17 00:00:00 2001
+From: Yauheni Saldatsenka <eugentoo@gmail.com>
+Date: Mon, 23 Aug 2021 02:54:22 +0300
+Subject: [PATCH] Use default dram address without remapping
+
+Signed-off-by: Yauheni Saldatsenka <eugentoo@gmail.com>
+---
+ arch/arm/boot/dts/stm32f469-disco.dts | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/arch/arm/boot/dts/stm32f469-disco.dts b/arch/arm/boot/dts/stm32f469-disco.dts
+index 2e1b3bbbe4b5..06845614a19a 100644
+--- a/arch/arm/boot/dts/stm32f469-disco.dts
++++ b/arch/arm/boot/dts/stm32f469-disco.dts
+@@ -60,9 +60,9 @@ chosen {
+ 		stdout-path = "serial0:115200n8";
+ 	};
+ 
+-	memory@00000000 {
++	memory@c0000000 {
+ 		device_type = "memory";
+-		reg = <0x00000000 0x1000000>;
++		reg = <0xc0000000 0x1000000>;
+ 	};
+ 
+ 	aliases {
+@@ -84,7 +84,7 @@ vdd_dsi: vdd-dsi {
+ 	};
+ 
+ 	soc {
+-		dma-ranges = <0xc0000000 0x0 0x10000000>;
++		dma-ranges = <0xc0000000 0xc0000000 0x10000000>;
+ 	};
+ 
+ 	leds {
+-- 
+2.32.0
+
diff --git a/board/stmicroelectronics/stm32f469-disco/readme.txt b/board/stmicroelectronics/stm32f469-disco/readme.txt
index c1e1d30e69..646f340382 100644
--- a/board/stmicroelectronics/stm32f469-disco/readme.txt
+++ b/board/stmicroelectronics/stm32f469-disco/readme.txt
@@ -4,23 +4,37 @@ STM32F469 Discovery
 This tutorial describes how to use the predefined Buildroot
 configuration for the STM32F469 Discovery evaluation platform.
 
+There are two setups supported:
+1. Internal flash memory is fully occupied with u-boot bootloader which boots kernel with
+   root filesystem from MMC.
+2. Internal flash memory stores simple afboot-stm32 bootloader, device tree and
+   in place (XIP) kernel with built-in initramfs.
+   Kernel is based on tinyconfig.
+
 Building
 --------
+  Type
+  "make stm32f469_disco_defconfig"
+  to build u-boot setup
+  or
+  "make stm32f469_disco_xip_defconfig"
+  to build xip setup
+
+  Then
 
-  make stm32f469_disco_defconfig
-  make
+  "make"
 
 Flashing
 --------
 
-  ./board/stmicroelectronics/stm32f469-disco/flash.sh output/
+  ./board/stmicroelectronics/stm32f469-disco/flash.sh output/ <BUILD_TYPE>
 
-It will flash the U-boot bootloader.
+  <BUILD_TYPE> can be "xip" or "uboot"
 
-Creating SD card
+Creating SD card for u-boot setup
 ----------------
 
-Buildroot prepares an"sdcard.img" image in the output/images/ directory,
+Buildroot prepares an "sdcard.img" image in the output/images/ directory,
 ready to be dumped on a SD card. Launch the following command as root:
 
   dd if=output/images/sdcard.img of=/dev/<your-sd-device>
diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
index 81bdb0d6d6..fd2946ab8b 100644
--- a/configs/stm32f469_disco_xip_defconfig
+++ b/configs/stm32f469_disco_xip_defconfig
@@ -1,24 +1,18 @@
 BR2_arm=y
 BR2_cortex_m4=y
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f469-disco/patches"
-BR2_KERNEL_HEADERS_5_13=y
 # BR2_UCLIBC_INSTALL_UTILS is not set
-BR2_GCC_VERSION_11_X=y
 BR2_GCC_ENABLE_LTO=y
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f469-disco/linux/defconfig"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f469-disco/linux/linux.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_XZ=y
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="xipImage"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f469-disco"
-BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/stmicroelectronics/stm32f469-disco/linux/stm32f469-disco.dts"
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
-BR2_PACKAGE_ZLIB=y
 BR2_TARGET_ROOTFS_INITRAMFS=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_AFBOOT_STM32=y
 BR2_PACKAGE_HOST_OPENOCD=y
-BR2_PACKAGE_HOST_UTIL_LINUX=y
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
