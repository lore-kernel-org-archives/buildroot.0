Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F03EC433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 21:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2519660D76;
	Fri, 17 Dec 2021 21:38:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ig7Zpv1cueFB; Fri, 17 Dec 2021 21:38:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53F5A60EAA;
	Fri, 17 Dec 2021 21:38:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3DFE91BF358
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B1A084B73
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:38:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RmPG8y27N-8O for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 21:38:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB52083F82
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 21:38:47 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id z7so12753605edc.11
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 13:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xl0oP2BmmjN/hXQmijSmKuofa9J5w8y292TWgjphH3U=;
 b=gDdHNuzP/wL1xCDMZWo9ModRg4EEVxCMpmyz19OWIKQg9Yr8E9BcZB/s5+T59+MBLt
 8a6GzbWHYscadPP4UZIMhRofTyFn8noMAJRSdqUCXBEdhngr2VEN/qkXHtZ5+/TfVYa3
 8BD4UMZTg6rcLS9nUxKuwfBz1EnQ/kfNoeyqv2WWcyJZxlFOtYIq2Z+u2gul8Crw0ReR
 DTeYUvBQyR3LP9+0vyCXh+5cGWawSnLt2G1P0+iAiBrynfijDubsPsNzvbzi8LSvTpQN
 Zet9pWUYXVzSkBKYuy3Y3g720wjWfLVMa2EZKL/l0WYz0BtsBycTJk88hzDiupx/FrVc
 rksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xl0oP2BmmjN/hXQmijSmKuofa9J5w8y292TWgjphH3U=;
 b=p6TY3DxoF2DteeMBVxUP0vK/gnqerjOumwcSPHNEGrR4P7lYpF0uXRrj55dO5ggYpI
 nE7LncZImbgP0MLHdeeaa55dcUzt3n/aqZfK7gFYSjYzV8fccwT/oJlrre8/XIADdG4I
 zcIVacUTZ9qqQN/JpDh/gc2jDn0/9OCrPD9Rp/73U5OTTNnmdc79PwBxqXCJmIehDV5K
 4qPXhRGy0nqGs0nwO8DfRy5nlzAI7/9Z6YfjMkm1VZHSZSSTeJmv1q1hvPj9xVuFoXdg
 NcGT3WGiS98L67lkt42FgaT+HqWm6mG1bd4meSkKjp6cbxv2RsXYcYH/7elWpY5BQxfZ
 iWPA==
X-Gm-Message-State: AOAM531WCtFj8/5+uuGN9fTwZIoaQvp89ykg+b84dbp+C+6T+mH42E8L
 pYtrsi67K0W1NDHKPmyVHC6OLg==
X-Google-Smtp-Source: ABdhPJy3mdGSg5HC8D8JmDyxMlyXNw/cPOnLCHcIljrDD4Op05Vi8tPHf4tH6RzmqQG6YMN1TLKJMQ==
X-Received: by 2002:a05:6402:1778:: with SMTP id
 da24mr4543572edb.144.1639777126054; 
 Fri, 17 Dec 2021 13:38:46 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id gs9sm1911123ejc.30.2021.12.17.13.38.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 13:38:45 -0800 (PST)
Message-ID: <fcfa858e-fe6c-5a4a-3ea6-cc480db3c169@mind.be>
Date: Fri, 17 Dec 2021 22:38:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Dario Binacchi <dariobin@libero.it>, buildroot@buildroot.org
References: <20211212123753.11848-1-dariobin@libero.it>
 <20211212123753.11848-3-dariobin@libero.it>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211212123753.11848-3-dariobin@libero.it>
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
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/12/2021 13:37, Dario Binacchi wrote:
> Newer versions of the kernel generate device trees that are not
> storable in a single 16kB sector. In these cases the kernel load address
> must be changed.
> The commit 2e499dcff3ef ("Add possibility to use custom kernel load address")
> adds the possibility to override the default (0x08008000) kernel load
> address.
> 
> This also required changes to the stm32f429_disco_defconfig and
> stm32f469_disco_xip_defconfig configurations.

  I heavily rewrote the commit message again.

> Signed-off-by: Dario Binacchi <dariobin@libero.it>
[snip]
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

  I see no reason to add these config options. Building all boards hardly has an 
effect on build time. Also, it makes it a lot more complicated to add more 
boards (e.g. by patching afboot-stm32).

  So I removed this and reverted to 'make all'.

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

  There's no reason at all to switch to git download, you can download a tarball 
from a commit hash as well.


  I made all those changes and applied to master. Please double-check if it i 
still correct.

  Regards,
  Arnout


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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
