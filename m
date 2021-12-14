Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0027C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 08:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AD938139C;
	Tue, 14 Dec 2021 08:28:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zzQVkXj4M9Z3; Tue, 14 Dec 2021 08:28:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81A4D813B8;
	Tue, 14 Dec 2021 08:28:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E1B3E1BF2A6
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 08:28:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC53F8139B
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 08:28:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sNTvNE0V_B1A for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 08:28:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8CDB8813B0
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 08:28:51 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BE2DrBs024915;
 Tue, 14 Dec 2021 09:28:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=qkqMcm2wa2fYqe2E5VTibelPVIbtB7odvAl/HZ9x9wQ=;
 b=jru5jRwkFpbsn1wK2ZVCWr8nCsE0S/A6Akfh5k6QaNCB4BjODeECcpjlMha6dAy4hp6H
 hKoYYYCmaCgzP+LFrNKp8k+kAbR2o4ITJ3QwgHyzdlneIuq3Xl8YFo/ZNvr+m+lcXMNQ
 tnAuKmctxHUuIRljGJ28PhEyQrhBAXB5EUm0dQSuZ/owaiPGS5vogqrexEOCZBcjbwyv
 mkiZPyBkGWIX6fT50d+9I7hA0bU+YkOjHvcfVKp4wOnmcF7UD0M8YK0n3+feEW3/PuxC
 IEPwBp4S7HDfeNTbg7o4vuM+UV9qgyWSul/KTVPKw9ON48belFt9cXAB5aQFBBeJnkaC LA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cx3jtwfdc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Dec 2021 09:28:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E3A9610002A;
 Tue, 14 Dec 2021 09:28:47 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D75CC22683B;
 Tue, 14 Dec 2021 09:28:47 +0100 (CET)
Received: from lmecxl0909.lme.st.com (10.75.127.46) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 14 Dec
 2021 09:28:47 +0100
To: Dario Binacchi <dariobin@libero.it>, <buildroot@buildroot.org>
References: <20211212123753.11848-1-dariobin@libero.it>
 <20211212123753.11848-3-dariobin@libero.it>
From: Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Message-ID: <3e7dbedc-b23f-c635-2c93-e19219b8fe81@foss.st.com>
Date: Tue, 14 Dec 2021 09:28:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211212123753.11848-3-dariobin@libero.it>
Content-Language: en-GB
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-14_03,2021-12-13_01,2021-12-02_01
Subject: Re: [Buildroot] [RESEND PATCH v2,
 2/4] boot/afboot-stm32: upgrade version
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
Cc: Lee Jones <lee.jones@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Acked-by: Christophe Priouzeau <christophe.priouzeau@foss.st.com>

On 12/12/21 1:37 PM, Dario Binacchi wrote:
> Newer versions of the kernel generate device trees that are not
> storable in a single 16kB sector. In these cases the kernel load address
> must be changed.
> The commit 2e499dcff3ef ("Add possibility to use custom kernel load address")
> adds the possibility to override the default (0x08008000) kernel load
> address.
> 
> This also required changes to the stm32f429_disco_defconfig and
> stm32f469_disco_xip_defconfig configurations.
> 
> Signed-off-by: Dario Binacchi <dariobin@libero.it>
> ---
>   ...69i-disco-change-kernel-load-address.patch | 26 ---------------
>   boot/afboot-stm32/Config.in                   | 32 +++++++++++++++++++
>   boot/afboot-stm32/afboot-stm32.hash           |  2 +-
>   boot/afboot-stm32/afboot-stm32.mk             | 18 ++++++++---
>   configs/stm32f429_disco_defconfig             |  1 +
>   configs/stm32f469_disco_xip_defconfig         |  3 +-
>   6 files changed, 50 insertions(+), 32 deletions(-)
>   delete mode 100644 board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0001-stm32f469i-disco-change-kernel-load-address.patch
> 
> diff --git a/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0001-stm32f469i-disco-change-kernel-load-address.patch b/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0001-stm32f469i-disco-change-kernel-load-address.patch
> deleted file mode 100644
> index 1f8d929bfb..0000000000
> --- a/board/stmicroelectronics/stm32f469-disco/patches/afboot-stm32/0001-stm32f469i-disco-change-kernel-load-address.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From d87969f72671cab5a88ba6e2418e43d0fa267d6f Mon Sep 17 00:00:00 2001
> -From: Dario Binacchi <dariobin@libero.it>
> -Date: Sat, 13 Nov 2021 15:46:32 +0100
> -Subject: [PATCH] stm32f469i-disco: change kernel load address
> -
> -Signed-off-by: Dario Binacchi <dariobin@libero.it>
> ----
> - stm32f469i-disco.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/stm32f469i-disco.c b/stm32f469i-disco.c
> -index 2da1f4b..3aacb12 100644
> ---- a/stm32f469i-disco.c
> -+++ b/stm32f469i-disco.c
> -@@ -85,7 +85,7 @@ static void fmc_wait_busy(void)
> -
> - void start_kernel(void)
> - {
> --	void (*kernel)(uint32_t reserved, uint32_t mach, uint32_t dt) = (void (*)(uint32_t, uint32_t, uint32_t))(0x08008000 | 1);
> -+	void (*kernel)(uint32_t reserved, uint32_t mach, uint32_t dt) = (void (*)(uint32_t, uint32_t, uint32_t))(0x0800C000 | 1);
> -
> - 	kernel(0, ~0UL, 0x08004000);
> - }
> ---
> -2.17.1
> -
> diff --git a/boot/afboot-stm32/Config.in b/boot/afboot-stm32/Config.in
> index 309b9e0491..71f4c7e382 100644
> --- a/boot/afboot-stm32/Config.in
> +++ b/boot/afboot-stm32/Config.in
> @@ -5,3 +5,35 @@ config BR2_TARGET_AFBOOT_STM32
>   	  afboot-stm32 is a very small bootloader for STM32 platforms
>   
>   	  https://github.com/mcoquelin-stm32/afboot-stm32
> +
> +if BR2_TARGET_AFBOOT_STM32
> +
> +choice
> +	prompt "Board type"
> +	help
> +	  Select the proper stm32 board type.
> +
> +config BR2_TARGET_AFBOOT_STM32_F429_DISCO
> +	bool "stm32f429-disco"
> +
> +config BR2_TARGET_AFBOOT_STM32_F469_DISCO
> +	bool "stm32f469-disco"
> +
> +endchoice
> +
> +config BR2_TARGET_AFBOOT_STM32_KERNEL_ADDR
> +	hex "Kernel load address"
> +	default "0x08008000"
> +	help
> +	  This is the physical address in your flash memory the kernel will
> +	  be linked for and stored to. This address is dependent on your own
> +	  flash usage.
> +
> +config BR2_TARGET_AFBOOT_STM32_DTB_ADDR
> +	hex "Device-tree load address"
> +	default "0x08004000"
> +	help
> +	  This is the physical address in your flash memory the device-tree
> +	  will be stored to. This address is dependent on your own flash usage.
> +
> +endif
> diff --git a/boot/afboot-stm32/afboot-stm32.hash b/boot/afboot-stm32/afboot-stm32.hash
> index 75f47295f6..80b9b6a106 100644
> --- a/boot/afboot-stm32/afboot-stm32.hash
> +++ b/boot/afboot-stm32/afboot-stm32.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated
> -sha256 9b37b661bd3091ceb5d8dc5a56a2dfc02ae9ebc0c63dad3c4289c9d6b3d3ec89  afboot-stm32-0.2.tar.gz
> +sha256  132f9817e615131856892cbe3df1502cdcd0700a12a48aa6bae8acfd5f093b42  afboot-stm32-3566acd582e5536fb60864281788a30f5527df2d-br1.tar.gz
> diff --git a/boot/afboot-stm32/afboot-stm32.mk b/boot/afboot-stm32/afboot-stm32.mk
> index 0fb4735285..80074a3c35 100644
> --- a/boot/afboot-stm32/afboot-stm32.mk
> +++ b/boot/afboot-stm32/afboot-stm32.mk
> @@ -4,17 +4,27 @@
>   #
>   ################################################################################
>   
> -AFBOOT_STM32_VERSION = 0.2
> -AFBOOT_STM32_SITE = $(call github,mcoquelin-stm32,afboot-stm32,v$(AFBOOT_STM32_VERSION))
> +AFBOOT_STM32_VERSION = 3566acd582e5536fb60864281788a30f5527df2d
> +AFBOOT_STM32_SITE = https://github.com/mcoquelin-stm32/afboot-stm32.git
> +AFBOOT_STM32_SITE_METHOD = git
>   AFBOOT_STM32_INSTALL_IMAGES = YES
>   AFBOOT_STM32_INSTALL_TARGET = NO
>   
> +ifeq ($(BR2_TARGET_AFBOOT_STM32_F429_DISCO),y)
> +AFBOOT_STM32_BOARD=stm32f429i-disco
> +else
> +AFBOOT_STM32_BOARD=stm32f469i-disco
> +endif
> +
>   define AFBOOT_STM32_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CROSS_COMPILE=$(TARGET_CROSS) all
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CROSS_COMPILE=$(TARGET_CROSS) \
> +		$(AFBOOT_STM32_BOARD) \
> +		KERNEL_ADDR=$(BR2_TARGET_AFBOOT_STM32_KERNEL_ADDR) \
> +		DTB_ADDR=$(BR2_TARGET_AFBOOT_STM32_DTB_ADDR)
>   endef
>   
>   define AFBOOT_STM32_INSTALL_IMAGES_CMDS
> -	$(INSTALL) -m 0755 -t $(BINARIES_DIR) -D $(@D)/stm32*.bin
> +	$(INSTALL) -m 0755 -t $(BINARIES_DIR) -D $(@D)/$(AFBOOT_STM32_BOARD).bin
>   endef
>   
>   $(eval $(generic-package))
> diff --git a/configs/stm32f429_disco_defconfig b/configs/stm32f429_disco_defconfig
> index 2c0641a6c5..4007eb20a5 100644
> --- a/configs/stm32f429_disco_defconfig
> +++ b/configs/stm32f429_disco_defconfig
> @@ -15,4 +15,5 @@ BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
>   BR2_TARGET_ROOTFS_INITRAMFS=y
>   # BR2_TARGET_ROOTFS_TAR is not set
>   BR2_TARGET_AFBOOT_STM32=y
> +BR2_TARGET_AFBOOT_STM32_KERNEL_ADDR=0x0800C000
>   BR2_PACKAGE_HOST_OPENOCD=y
> diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
> index e8b2cf3d21..4c49ffcc7a 100644
> --- a/configs/stm32f469_disco_xip_defconfig
> +++ b/configs/stm32f469_disco_xip_defconfig
> @@ -1,6 +1,5 @@
>   BR2_arm=y
>   BR2_cortex_m4=y
> -BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f469-disco/patches"
>   # BR2_UCLIBC_INSTALL_UTILS is not set
>   BR2_GCC_ENABLE_LTO=y
>   BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
> @@ -16,4 +15,6 @@ BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
>   BR2_TARGET_ROOTFS_INITRAMFS=y
>   # BR2_TARGET_ROOTFS_TAR is not set
>   BR2_TARGET_AFBOOT_STM32=y
> +BR2_TARGET_AFBOOT_STM32_F469_DISCO=y
> +BR2_TARGET_AFBOOT_STM32_KERNEL_ADDR=0x0800C000
>   BR2_PACKAGE_HOST_OPENOCD=y
> 


-- 
Best regards / Cordialement,

Christophe Priouzeau | Tel: +33 244027320
STMicroelectronics
ST online: www.st.com<http://www.st.com/>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
