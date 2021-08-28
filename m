Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A630C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 14:58:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5156B60E77
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 14:58:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5156B60E77
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EE6A835C9;
	Sat, 28 Aug 2021 14:58:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id esx8YtA6j_uE; Sat, 28 Aug 2021 14:58:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76D4D835D9;
	Sat, 28 Aug 2021 14:58:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B7AB1BF37B
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 14:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44783835D9
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 14:58:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OvYhiTc2hMQi for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 14:57:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3FE9A835C9
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 14:57:56 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id u16so15183356wrn.5
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 07:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NV7AIxnk1nSGYJHm4k5I7l1DV+Xn7BGMLb1F64tXKJo=;
 b=WDcJOab4WCSSgc9l4b0bchLHvL5eK0aio4pE/FhZcn5BeELbFSMjvM3yK2dzRcXpjw
 BdImnug01oS47pk5OuziaXsqwGe0s/pYVReRLYakreMhl9vZXNp5WbmqbUiAB0qoibiz
 ipW3KOW3QMt0EoIVJP0u31GNhUpHEmVQlgwPRwCq8xfcPsMtH6LZnjodwWAjM8e3dSnI
 H7Qkabb/ryXbcw1LRK2C1yCg+ImHhOEVwtb4K0wJ8pm5RLdp1FmR0L9Fv865ATYJUwsa
 OIe+/GBG2IMmhL+UrQsL6YsIVYc7aqQ/nylMgxqoPsW1qJTnB2BVhYWvictjMXricN+h
 jGpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=NV7AIxnk1nSGYJHm4k5I7l1DV+Xn7BGMLb1F64tXKJo=;
 b=lpP+DtQtH/QIeDFHUbGoSbcRBkpWc/LGWZFytCAOjMvpSaRPU7QqWEHy1JXuOd3YZd
 rkv6Ir8x9NrQfbcpAqh4UuuwI8GH3eRLoxdmqc2Vi/9i1B7ns5J+Tu2zDVxrUm1PSr+V
 c0rn8ECSUro8PN1v5LhIH93tNumpakTUTjT5cb9w2M1l4veTSKxm2VFEVW5Ch9Z5nz8H
 ZDHQ+fXVaSsVsLTybP3HdwhkSixO3lwTt2QtNaeHL5i1bG1VJfCZgdruFwMSMq0tinMy
 pMaEva6C0o5W6gLkHgtRoL6lKBK2vZoZj+TpY/W8hMlv6CZK/2fKpBOxRIBFpF9722bV
 0lbw==
X-Gm-Message-State: AOAM533+wY4wHMyvplPMAdVH/46+sugXqxMpt3nZXl6EGoarOUN0sWDR
 UVScUg/mm5Z6Ct+aUZPDfu6DlQ==
X-Google-Smtp-Source: ABdhPJzqScDRNtg0OVDLG1d2XuOuPggHkjb3Buv80KLjfebooSmcuD3IYAYTGuLLbagPret+05yhgw==
X-Received: by 2002:adf:e4c5:: with SMTP id v5mr16704549wrm.1.1630162675027;
 Sat, 28 Aug 2021 07:57:55 -0700 (PDT)
Received: from [10.73.0.168] ([213.219.130.152])
 by smtp.gmail.com with ESMTPSA id z14sm1780846wmi.24.2021.08.28.07.57.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Aug 2021 07:57:54 -0700 (PDT)
To: Yauheni Saldatsenka <eugentoo@gmail.com>, buildroot@buildroot.org
References: <20210825181858.801574-1-eugentoo@gmail.com>
 <20210825181858.801574-2-eugentoo@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <a0e8c46c-16ad-5b31-832b-377dda07ef0c@mind.be>
Date: Sat, 28 Aug 2021 16:57:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210825181858.801574-2-eugentoo@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 2/3] [PATCH v2 1/1]
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

 Hi Yauheni,

 There were still a number of things not OK with this patch, but I've fixed them
up and applied to next, thanks.

 First of all, it should have been only a single commit, not split over 3 for
the different versions. Separate commits should only be made when you do
separate, more or less independent things. In this case, however, it's really a
single change you're making (adding the new defconfig). So I've squashed
everything into a single commit.


On 25/08/2021 20:18, Yauheni Saldatsenka wrote:
> Result of make tinyconfig was taken as a starting point to fit kernel
> into flash memory.
> Current setup kernel + rootfs fits in 1.6MB on-chip flash memory.
> 
> Fixes:
>     - Move kernel to new flash bank due to growth of dtb size
>     - Fix kernel start address in bootloader
> 
> For better binary size optimization gcc LTO is turned on.
> 
> Signed-off-by: Yauheni Saldatsenka <eugentoo@gmail.com>

[snip]
> diff --git a/board/stmicroelectronics/stm32f469-disco/linux/defconfig b/board/stmicroelectronics/stm32f469-disco/linux/linux.config
> similarity index 100%
> rename from board/stmicroelectronics/stm32f469-disco/linux/defconfig
> rename to board/stmicroelectronics/stm32f469-disco/linux/linux.config

 linux/linux.config is not a very useful name, so I've moved it up one
directory. I also called it linux-xip.config, to distinguish it more clearly
from the existing linux.fragment.


> diff --git a/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0001-stm32f469-i-Update-kernel-start-address.patch b/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0001-stm32f469-i-Update-kernel-start-address.patch
> new file mode 100644
> index 0000000000..d5d1e5a8ad
> --- /dev/null
> +++ b/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0001-stm32f469-i-Update-kernel-start-address.patch
> @@ -0,0 +1,56 @@
> +From fe5f3a86d07e378baeeddc1dfecd0686d83aa42f Mon Sep 17 00:00:00 2001
> +From: Yauheni Saldatsenka <eugentoo@gmail.com>
> +Date: Sat, 14 Aug 2021 18:54:51 +0300
> +Subject: [PATCH] stm32f469-i: Update kernel start address
> +
> +As of GNU/Linux v5.12 kernel device tree binary grows above 0x08008000
> +and overwrites kernel binary
> +Therefore this commit moves kernel to the next flash bank
> +
> +Signed-off-by: Yauheni Saldatsenka <eugentoo@gmail.com>

 Has this patch been sent upstream to afboot-stm32?


> +---
> + stm32f469i-disco.c | 7 +++----
> + 1 file changed, 3 insertions(+), 4 deletions(-)
> +
> +diff --git a/stm32f469i-disco.c b/stm32f469i-disco.c
> +index 2da1f4b..46fc06a 100644
> +--- a/stm32f469i-disco.c
> ++++ b/stm32f469i-disco.c
> +@@ -6,6 +6,7 @@
> + #include "gpio.h"
> + #include "mpu.h"
> + 
> ++#define KERNEL_ADDR     0x08010000
> + #define CONFIG_HSE_HZ	8000000
> + #define CONFIG_PLL_M	8
> + #define CONFIG_PLL_N	360
> +@@ -85,7 +86,7 @@ static void fmc_wait_busy(void)
> + 
> + void start_kernel(void)
> + {
> +-	void (*kernel)(uint32_t reserved, uint32_t mach, uint32_t dt) = (void (*)(uint32_t, uint32_t, uint32_t))(0x08008000 | 1);
> ++	void (*kernel)(uint32_t reserved, uint32_t mach, uint32_t dt) = (void (*)(uint32_t, uint32_t, uint32_t))(KERNEL_ADDR | 1);
> + 
> + 	kernel(0, ~0UL, 0x08004000);
> + }
> +@@ -102,7 +103,7 @@ int main(void)
> + 	volatile uint32_t *SYSCFG_MEMRMP = (void *)(SYSCFG_BASE + 0x00);
> + 	int i;
> + 
> +-	mpu_config(0x0);
> ++	mpu_config(0xc0000000);

 It's not clear how this is related to moving the kernel address...

> + 
> + 	if (*FLASH_CR & FLASH_CR_LOCK) {
> + 		*FLASH_KEYR = 0x45670123;
> +@@ -195,8 +196,6 @@ int main(void)
> + 	usart_setup(usart_base, 45000000);
> + 	usart_putch(usart_base, '.');
> + 
> +-	*SYSCFG_MEMRMP = 0x4;

 This also is not clear why it's removed.

 I still applied the patch as is.

> +-
> + 	start_kernel();
> + 
> + 	return 0;
> +-- 
> +2.32.0
[snip]
> diff --git a/board/stmicroelectronics/stm32f469-disco/patches/linux/0001-Use-default-dram-address-without-remapping.patch b/board/stmicroelectronics/stm32f469-disco/patches/linux/0001-Use-default-dram-address-without-remapping.patch
> new file mode 100644
> index 0000000000..68fe8380a2
> --- /dev/null
> +++ b/board/stmicroelectronics/stm32f469-disco/patches/linux/0001-Use-default-dram-address-without-remapping.patch
> @@ -0,0 +1,38 @@
> +From 8ccf9f625d00138d86fb7d70f3efd58a8fb4d7ff Mon Sep 17 00:00:00 2001
> +From: Yauheni Saldatsenka <eugentoo@gmail.com>
> +Date: Mon, 23 Aug 2021 02:54:22 +0300
> +Subject: [PATCH] Use default dram address without remapping
> +
> +Signed-off-by: Yauheni Saldatsenka <eugentoo@gmail.com>
> +---
> + arch/arm/boot/dts/stm32f469-disco.dts | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/arch/arm/boot/dts/stm32f469-disco.dts b/arch/arm/boot/dts/stm32f469-disco.dts
> +index 2e1b3bbbe4b5..06845614a19a 100644
> +--- a/arch/arm/boot/dts/stm32f469-disco.dts
> ++++ b/arch/arm/boot/dts/stm32f469-disco.dts
> +@@ -60,9 +60,9 @@ chosen {
> + 		stdout-path = "serial0:115200n8";
> + 	};
> + 
> +-	memory@00000000 {
> ++	memory@c0000000 {

 It's good that you update the device tree with a patch now instead of copying
it. However, the full dts was still there in the board directory, but unused. So
I removed it.

 Also, there were a few changes that you didn't keep - but I guess those weren't
actually needed.

> + 		device_type = "memory";
> +-		reg = <0x00000000 0x1000000>;
> ++		reg = <0xc0000000 0x1000000>;
> + 	};
> + 
> + 	aliases {
> +@@ -84,7 +84,7 @@ vdd_dsi: vdd-dsi {
> + 	};
> + 
> + 	soc {
> +-		dma-ranges = <0xc0000000 0x0 0x10000000>;
> ++		dma-ranges = <0xc0000000 0xc0000000 0x10000000>;
> + 	};
> + 
> + 	leds {
> +-- 
> +2.32.0
> +
> diff --git a/board/stmicroelectronics/stm32f469-disco/readme.txt b/board/stmicroelectronics/stm32f469-disco/readme.txt
> index c1e1d30e69..646f340382 100644
> --- a/board/stmicroelectronics/stm32f469-disco/readme.txt
> +++ b/board/stmicroelectronics/stm32f469-disco/readme.txt
> @@ -4,23 +4,37 @@ STM32F469 Discovery
>  This tutorial describes how to use the predefined Buildroot
>  configuration for the STM32F469 Discovery evaluation platform.
>  
> +There are two setups supported:
> +1. Internal flash memory is fully occupied with u-boot bootloader which boots kernel with
> +   root filesystem from MMC.
> +2. Internal flash memory stores simple afboot-stm32 bootloader, device tree and
> +   in place (XIP) kernel with built-in initramfs.

 Very good readme! I've just added here a sentence to say that no SD card is
needed, to make that explicit.


 Regards,
 Arnout

> +   Kernel is based on tinyconfig.
> +
>  Building
>  --------
> +  Type
> +  "make stm32f469_disco_defconfig"
> +  to build u-boot setup
> +  or
> +  "make stm32f469_disco_xip_defconfig"
> +  to build xip setup
> +
> +  Then
>  
> -  make stm32f469_disco_defconfig
> -  make
> +  "make"
>  
>  Flashing
>  --------
>  
> -  ./board/stmicroelectronics/stm32f469-disco/flash.sh output/
> +  ./board/stmicroelectronics/stm32f469-disco/flash.sh output/ <BUILD_TYPE>
>  
> -It will flash the U-boot bootloader.
> +  <BUILD_TYPE> can be "xip" or "uboot"
>  
> -Creating SD card
> +Creating SD card for u-boot setup
>  ----------------
>  
> -Buildroot prepares an"sdcard.img" image in the output/images/ directory,
> +Buildroot prepares an "sdcard.img" image in the output/images/ directory,
>  ready to be dumped on a SD card. Launch the following command as root:
>  
>    dd if=output/images/sdcard.img of=/dev/<your-sd-device>
> diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
> index 81bdb0d6d6..fd2946ab8b 100644
> --- a/configs/stm32f469_disco_xip_defconfig
> +++ b/configs/stm32f469_disco_xip_defconfig
> @@ -1,24 +1,18 @@
>  BR2_arm=y
>  BR2_cortex_m4=y
>  BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f469-disco/patches"
> -BR2_KERNEL_HEADERS_5_13=y
>  # BR2_UCLIBC_INSTALL_UTILS is not set
> -BR2_GCC_VERSION_11_X=y
>  BR2_GCC_ENABLE_LTO=y
> -BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> -BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f469-disco/linux/defconfig"
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f469-disco/linux/linux.config"
>  BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
>  BR2_LINUX_KERNEL_XZ=y
>  BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="xipImage"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f469-disco"
> -BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/stmicroelectronics/stm32f469-disco/linux/stm32f469-disco.dts"
>  BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
> -BR2_PACKAGE_ZLIB=y
>  BR2_TARGET_ROOTFS_INITRAMFS=y
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_TARGET_AFBOOT_STM32=y
>  BR2_PACKAGE_HOST_OPENOCD=y
> -BR2_PACKAGE_HOST_UTIL_LINUX=y
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
