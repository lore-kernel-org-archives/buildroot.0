Return-Path: <SRS0=vKZi=NQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 524E3C432BE
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 18:19:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1298261075
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 18:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1298261075
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D57A780BFE;
	Wed, 25 Aug 2021 18:19:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0-DvhZwmlMq8; Wed, 25 Aug 2021 18:19:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EEAB80BBE;
	Wed, 25 Aug 2021 18:19:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 815231BF39F
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 18:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A441401E4
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 18:19:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L5rT9yLhAPlK for <buildroot@lists.busybox.net>;
 Wed, 25 Aug 2021 18:19:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A93240105
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 18:19:11 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id d16so264485ljq.4
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 11:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qSSuDFudJ2rhlg2oOxvh+TumMHCcuXTxbhUcC+lGRkk=;
 b=dv6wlMGCB2Dz6ANBeIsbR4NLbDyqcnpO/tlk7cs7CCtZg2BxjkBOyflovEXWNIiDet
 DmUEQYiur7K2sCQSswzrHOm9NB8yKBHBl5dOTg2CS8zFGEsZXE09usdX4mH+wMUuuQ1/
 Noii8st1U2eIEpdYKgRLh4U8KibFvHR5w0T4cFPrfHB4N8e9+z8zoHrORHKHr7e6njlB
 x7bmAk9dpQlb7zxMp4bo2MJUv4ViVNEVykpdjVsccr0zY9hy5Ir76x4US2kvJfK55/WR
 tvh2aJjNn5b7rcP5RorWxoKXyAnze8c0q3Tos1IB7q3SdYs0l7DzWlVSFzKkTbHgPyMx
 l6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qSSuDFudJ2rhlg2oOxvh+TumMHCcuXTxbhUcC+lGRkk=;
 b=I+eyUfe5JcEllavznUVp5ijVyfzgx7IAJERzBExFNcuhk4Fllxk5BLqgC5TDOpw/lK
 LCiRJvrGTmE80CGMfCGYXHXKpW4uCZVxWh2KXmt+g78LcAagTuXVoALX95rmenEO6ADH
 ZOj7UHZT9WLCiGuF/+IGM7SwjRz1MrXe4OpHSlbuJU7VtX6UXllcsCH8beF01/caBN1y
 6cX0ldekcUnSfhF8ahUaqIXausW71mGXqDmQhU7b8PnCTKLbcyncOU7ooTPNE/yapSd1
 PzeiVvemPva/NSjKhMj1DhXT+/JMoMGpzRxwXIWx2SxmuncdtlWOs71gU/Gcwxe5Ni4b
 yJ1g==
X-Gm-Message-State: AOAM532yAjRk1a+mpcNhjy9QLGhDGALUsvw3ifDRxB7qkcUcbF/Yqm1h
 BIZeYMQoc65QFEmzfy/bE4Ovmh0gAjqdq9gRePE=
X-Google-Smtp-Source: ABdhPJzRHza4OaQz6fr5ICe7EMgmE0dFhxB8p7IyjiYKsjoskGz4syCiq9HC4j+POiaZun0Tuwt0mQ==
X-Received: by 2002:a2e:a209:: with SMTP id h9mr37392691ljm.249.1629915549196; 
 Wed, 25 Aug 2021 11:19:09 -0700 (PDT)
Received: from localhost.localdomain (m90-131-47-37.cust.tele2.lt.
 [90.131.47.37])
 by smtp.gmail.com with ESMTPSA id j20sm80125lji.41.2021.08.25.11.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 11:19:08 -0700 (PDT)
From: Yauheni Saldatsenka <eugentoo@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 25 Aug 2021 21:18:57 +0300
Message-Id: <20210825181858.801574-2-eugentoo@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210825181858.801574-1-eugentoo@gmail.com>
References: <20210825181858.801574-1-eugentoo@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] [PATCH v2 1/1]
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
