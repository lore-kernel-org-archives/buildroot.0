Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63E0CD128A
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 13:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50AFC40859;
	Mon,  8 Apr 2024 13:40:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id piB4IbZDmkWt; Mon,  8 Apr 2024 13:39:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 911EC40855
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 911EC40855;
	Mon,  8 Apr 2024 13:39:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 222BE1BF59F
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 13:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D8AD81EB9
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 13:39:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m0TvUR9TVyv3 for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 13:39:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DDA3481E96
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDA3481E96
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DDA3481E96
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 13:39:55 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4166ccac761so7405815e9.0
 for <buildroot@buildroot.org>; Mon, 08 Apr 2024 06:39:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712583594; x=1713188394;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tt+ruy6Vg+jefuOrqw1Lonlj6q/UwRbFP4UvQssvlWI=;
 b=v8JO6yERQoVjnJntTZSPRxFIRtF9OkTfEDumji4eQyw/tHvjOfAFAFlhJhTE3zrLNL
 yF/lQTUJ3/lkBfAh88lnP6GwgMXgVRlv0VkB0yS4cHFG/572Gvb/+l6nIIWm0YAgkY2f
 fTefGMzPm4LRLH6HqzV7m9yo2xv54+YAwk1agVlIfRUMygblM0vGQXO+KIikccPfj7nw
 1VJsSw1D5LDMkZgSFLPfy3B9h206KwuqoG+mbpbEPKLSAlAhHwcJeEZRdusSJfpfQU9R
 rcHkj+QAR21xjiKpWLXaObtXajSuO84lYP3iex2fxdv/KuNqSV1Bo/Prfnc3Agk2I+RR
 Uazw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWSapFm5NtiIkP3djGP1dR4cScRGYZTgpU+R10hDcwDfFjbrVBBDyXy+FOSorRN6RwKOkYv2cERfu/FZGvs9JZzz1wFfIBNg==
X-Gm-Message-State: AOJu0YzqYIg+kYZtO+Uy7+I12m9NnpQlQo6wvgFaO7zKRUD/0fdkJ9jz
 EQT38YtGS2I8kx9CwnVSDwL6szvyCe5kE8x7Lq8SOhv4AkzuUUQ/P5VXi4ZmkMLgl8mNQdtlV2o
 3
X-Google-Smtp-Source: AGHT+IGidhZN+jWBE2S/Zdrq/sX9iIN/NLZe+ekhJLEW+9tAuUWNkpz4sIlW4ekcPXn4IAmktYzseQ==
X-Received: by 2002:a05:600c:4ec6:b0:415:6d51:8e2d with SMTP id
 g6-20020a05600c4ec600b004156d518e2dmr7071757wmq.13.1712583593728; 
 Mon, 08 Apr 2024 06:39:53 -0700 (PDT)
Received: from [10.1.0.191] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 y16-20020adff6d0000000b0034335f13570sm9002686wrp.116.2024.04.08.06.39.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Apr 2024 06:39:52 -0700 (PDT)
Message-ID: <60429996-284d-4074-b1f0-8cb99d837bc6@mind.be>
Date: Mon, 8 Apr 2024 15:39:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20240407103512.1112712-1-romain.naour@smile.fr>
 <20240407103512.1112712-16-romain.naour@smile.fr>
Content-Language: en-GB
In-Reply-To: <20240407103512.1112712-16-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712583594; x=1713188394; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Tt+ruy6Vg+jefuOrqw1Lonlj6q/UwRbFP4UvQssvlWI=;
 b=e7fVtZrK8Fa1qsow//rOjbFL0hJYnb6JoDsPFt+ZuHnyb6/d3LgdfRPDG7OyNlv9/V
 FyI/8x/4b0QF/VEEolk0c4eggzwsQhkKlW7ALxoeY/YckQzwQ0PDBgq3QSIaoBZC8eOl
 V1yd46RNiMboF5UgH32Ba3AFPoM6HdBr7XLyrAvcfzLeqduNDyvhtY8jS/avsyRsgRSV
 s+uahZRQ+jZ/lPedQdLF3unPdACxXWYiQLKhAyThFiqpFXCwL+IR5fOu+rp7U6jmsQK+
 j8s+5ldjM8d+j5pjEOLmm39AY5nTA0MOhBJXw7Eu6UF0jS+UdgTPcbUL4yxOwCCcpoQp
 okbQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=e7fVtZrK
Subject: Re: [Buildroot] [PATCH v12 15/16] boot/ti-k3-r5-loader: remove
 BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/04/2024 12:35, Romain Naour wrote:
> Since all AM62 and AM64 defconfig has been updated to use binman
> and ti-k3-image-gen has been removed, binman is now mandatory
> for all TI K3 SoC. So remove BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN
> option since since it can't be disabled anymore.
> 
> We can remove BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN without
> legacy handling since this option is not part of any Buildroot
> release.
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>   boot/ti-k3-r5-loader/Config.in          | 11 ++-------
>   boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 30 ++++++++++---------------
>   configs/ti_am62x_sk_defconfig           |  1 -
>   configs/ti_am64x_sk_defconfig           |  1 -
>   4 files changed, 14 insertions(+), 29 deletions(-)
> 
> diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
> index c0c7222a10..d91aefed79 100644
> --- a/boot/ti-k3-r5-loader/Config.in
> +++ b/boot/ti-k3-r5-loader/Config.in
> @@ -1,6 +1,8 @@
>   config BR2_TARGET_TI_K3_R5_LOADER
>   	bool "ti-k3-r5-loader"
>   	depends on BR2_aarch64
> +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-rpds-py -> python-jsonschema
> +	select BR2_TARGET_TI_K3_BOOT_FIRMWARE # binman
>   	help
>   	  Separate U-Boot SPL build for R5 core on TI's K3 processors.
>   	  Usually used to build tiboot3.bin with k3-image-gen.
> @@ -93,15 +95,6 @@ config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_CONFIG_FILE
>   	help
>   	  Path to the TI K3 R5 Loader configuration file.
>   
> -config BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN
> -	bool "ti-k3-r5-loader use binman"
> -	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-rpds-py -> python-jsonschema
> -	select BR2_TARGET_TI_K3_BOOT_FIRMWARE
> -	help
> -	  Use binman tool for generation and signing of boot images.
> -
> -	  https://docs.u-boot.org/en/v2024.01/develop/package/binman.html
> -
>   config BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN
>   	string "tiboot3.bin binary name"
>   	default "tiboot3.bin"
> diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> index 0191a2501c..93d9e0b134 100644
> --- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> +++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> @@ -35,11 +35,20 @@ TI_K3_R5_LOADER_LICENSE_FILES = Licenses/gpl-2.0.txt
>   TI_K3_R5_LOADER_CPE_ID_VENDOR = denx
>   TI_K3_R5_LOADER_CPE_ID_PRODUCT = u-boot
>   TI_K3_R5_LOADER_INSTALL_IMAGES = YES
> +# https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/buildman/requirements.txt

  In patch 4/16 you have another URL, it would be best to add that one here as 
well, because the URL above has just 2 dependencies.

# 
https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/binman/binman.rst?plain=1#L377

  I didn't change that when applying patch 4/16 because it would anyway lead to 
a conflict here.


> +# Make sure that all binman requirements are build before ti-k3-r5-loader.

  build -> built

  Regards,
  Arnout

>   TI_K3_R5_LOADER_DEPENDENCIES = \
>   	host-pkgconf \
>   	$(BR2_MAKE_HOST_DEPENDENCY) \
>   	host-arm-gnu-toolchain \
> -	host-openssl
> +	host-openssl \
> +	host-python3 \
> +	host-python-jsonschema \
> +	host-python-pyelftools \
> +	host-python-pylibfdt \
> +	host-python-pyyaml \
> +	host-python-setuptools \
> +	ti-k3-boot-firmware
>   
>   TI_K3_R5_LOADER_MAKE = $(BR2_MAKE)
>   TI_K3_R5_LOADER_MAKE_ENV = $(TARGET_MAKE_ENV)
> @@ -58,21 +67,8 @@ TI_K3_R5_LOADER_MAKE_OPTS = \
>   	CROSS_COMPILE=$(HOST_DIR)/bin/arm-none-eabi- \
>   	ARCH=arm \
>   	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS)))" \
> -	HOSTLDFLAGS="$(HOST_LDFLAGS)"
> -
> -ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN),y)
> -# https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/buildman/requirements.txt > -TI_K3_R5_LOADER_DEPENDENCIES += \
> -	host-python-jsonschema \
> -	host-python-pyyaml \
> -	ti-k3-boot-firmware
> -# Make sure that all binman requirements are build before ti-k3-r5-loader.
> -TI_K3_R5_LOADER_DEPENDENCIES += \
> -	host-python3 \
> -	host-python-pyelftools \
> -	host-python-pylibfdt \
> -	host-python-setuptools
> -TI_K3_R5_LOADER_MAKE_OPTS += BINMAN_INDIRS=$(BINARIES_DIR)
> +	HOSTLDFLAGS="$(HOST_LDFLAGS)" \
> +	BINMAN_INDIRS=$(BINARIES_DIR)
>   
>   TI_K3_R5_LOADER_TIBOOT3_BIN = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN))
>   
> @@ -90,8 +86,6 @@ define TI_K3_R5_LOADER_INSTALL_SWSFW_ITB
>   	fi
>   endef
>   
> -endif # BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN
> -
>   define TI_K3_R5_LOADER_BUILD_CMDS
>   	$(TARGET_CONFIGURE_OPTS) $(TI_K3_R5_LOADER_MAKE) -C $(@D) $(TI_K3_R5_LOADER_MAKE_OPTS)
>   endef
> diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
> index b62f624d82..fa2c008d4c 100644
> --- a/configs/ti_am62x_sk_defconfig
> +++ b/configs/ti_am62x_sk_defconfig
> @@ -30,7 +30,6 @@ BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
>   BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.01"
>   BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_evm_r5"
>   BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN="tiboot3-am62x-gp-evm.bin"
> -BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
> index 56e1b23335..f7c6d16b35 100644
> --- a/configs/ti_am64x_sk_defconfig
> +++ b/configs/ti_am64x_sk_defconfig
> @@ -30,7 +30,6 @@ BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
>   BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.01"
>   BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am64x_evm_r5"
>   BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN="tiboot3-am64x-gp-evm.bin"
> -BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
