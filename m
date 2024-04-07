Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75DACD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 20:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1D5440BF2;
	Sun,  7 Apr 2024 20:01:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gz4JVMuVQbE0; Sun,  7 Apr 2024 20:01:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B9F840C10
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B9F840C10;
	Sun,  7 Apr 2024 20:01:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 01F341BF473
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 20:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E358260ABF
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 20:01:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ayinkkk0bZPy for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 20:01:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9B84360AC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B84360AC1
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B84360AC1
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 20:01:27 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4164c9debf6so4812815e9.1
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 13:01:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712520085; x=1713124885;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V2KKFKe8MRpPhTNyx3bTs9/lz1LdrYWL4BusBqbwraM=;
 b=aSgLlRj75ln1niwcREqmJ0qNNbKe91sOZE3uS4pOxcrXtaDAq7JagraoKT5kdE1T59
 AC7nvoaegQDSZaQkU/o/dI0kE/VBB5jbL62AmQq5dT5cTfhtoO/HOOh2i1qjSXI1+7Al
 6IOsIv46Voh7PU2hUQRQYdkYLRCA6ujp2rB/XJ9ZmDajRSwIcravMyBYhCLCMusXUAAi
 mVQ6dlJstOvpYdHW3qLJng1gLfyAazN7N+RNKKUu7iKyH06nIbrHT7x3qqyvzzgGsBQU
 1xoM/ywpfllBNMxxDF7sp7Tg2OShqgSzwweBct1xSmI2eVQXGQ8mMdvGnEt5HS0mDWfC
 KpuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVT6PQvZg1gBbeROSpGqA4c31WGQuk0OV6xTEQo/PPlRx4Xr4a246bzWaVExId5YkD2KwabaWQZnBUyOrH916+qKN+H60BrHg==
X-Gm-Message-State: AOJu0Ywe8DapOIEl7QcDPmN9sQCA/A88e/m+dw5vwxM3zHm48jUyZgX9
 jdt/TuNLSeR22Ek27K4ygrpdNVv0gWBzBOHrMYNnp+kt2+DuKKDfSZtDDKrr7dQ=
X-Google-Smtp-Source: AGHT+IF1Zaa1GItSsy1bsIjJf4f4l2ZOPtIXt8ZoBb296T2iK7eUcmSTE+YJ13Ck8n2awS8GQHYwTw==
X-Received: by 2002:a05:600c:3d93:b0:416:70c4:b271 with SMTP id
 bi19-20020a05600c3d9300b0041670c4b271mr524102wmb.31.1712520085452; 
 Sun, 07 Apr 2024 13:01:25 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a05600c348700b00416770871f7sm501471wmq.25.2024.04.07.13.01.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 13:01:25 -0700 (PDT)
Message-ID: <691466c6-f6e9-455a-a956-7bd9e7eb59d4@mind.be>
Date: Sun, 7 Apr 2024 22:01:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org,
 =?UTF-8?Q?Gero_Schw=C3=A4ricke?= <gero.schwaericke@grandcentrix.net>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Anand Gadiyar <gadiyar@ti.com>, Xuanhao Shi <X15000177@gmail.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
References: <20240407103512.1112712-1-romain.naour@smile.fr>
 <20240407103512.1112712-4-romain.naour@smile.fr>
Content-Language: en-GB
In-Reply-To: <20240407103512.1112712-4-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712520085; x=1713124885; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=V2KKFKe8MRpPhTNyx3bTs9/lz1LdrYWL4BusBqbwraM=;
 b=Z4ueMILa9Hzs6v+EjA9VzhVbdrqM/7TDzaqTfDsrMBrJ9Ljhk+AViaaKcEB+SdAgXH
 mmCldjIqGkrR7QOGKdXeGUke4l0KBLZks0QKqGlSFNPKNi2uhKy9ywMHZuFs6pfajkpO
 HaU5MUFKpV+w5sXRHys3+OlsFKtdLsMU6mUFNnOWkxSaFNCK+mEeD0d0dAHA8rCZHYkz
 miRSkTNYVTnUP4Qdt41YZR4RsIbRiORk37+AGUgA6OojXMX9j67Dn83Ch8S357K4tlrN
 wCa8aBE2pMN2A3+Pf15h8hiqiEahHoKfYutuc5dNNuIGXzVjj6wRQObb/L8QWmElSr5J
 FI0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Z4ueMILa
Subject: Re: [Buildroot] [PATCH v12 03/16] boot/uboot: rename TI_K3_DM
 option to cover further TI K3 SoCs support
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



On 07/04/2024 12:34, Romain Naour wrote:
> BR2_TARGET_UBOOT_NEEDS_TI_K3_DM option has been introduced initially to
> support certain TI K3 devices such as AM62x and AM62Ax that require a
> Device Manager (DM) firmware.
> 
> This option needs to be renamed to use a more generic name in order
> to cover further TI K3 SoCs support along with the new u-boot binman
> tool that will be added in followup patch. With binman enabled in
> u-boot on TI K3 SoC, ti-k3-boot-firmware is needed at buildtime to
> provide ti-sysfw (System Firmware) for all TI K3 SoC along with Device
> Manager (DM) firmware for AM62x and AM62Ax devices.
> 
> With binman support enabled, we don't need to provide the path of the
> Device Manager firmware anymore (see [2]).
> We can remove DM="<DM firmware>.xer5f" from UBOOT_MAKE_OPTS.
> It also means that we can also remove BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME
> used to define DM path.
> 
>    DM=$(BINARIES_DIR)/ti-dm/$(UBOOT_TI_K3_DM_SOCNAME)/ipc_echo_testb_mcu1_0_release_strip.xer5f
> 
> For now, keep BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME and DM only when
> ti-k3-image-gen is used. We need to update ti_am62x_sk_defconfig
> to use binman before removing them along with ti-k3-image-gen.
> 
> [1] 52ce606c05ee3ac869f8087292bc3dbb0d25b79b
> [2] https://software-dl.ti.com/processor-sdk-linux/esd/AM62X/09_01_00_08/exports/docs/linux/Foundational_Components/U-Boot/UG-General-Info.html
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>   Config.in.legacy              |  8 ++++++++
>   boot/uboot/Config.in          | 23 ++++++++++++++---------
>   boot/uboot/uboot.mk           |  4 +++-
>   configs/ti_am62x_sk_defconfig |  2 +-
>   4 files changed, 26 insertions(+), 11 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index d00196e08b..4084ffa516 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,14 @@ endif
>   
>   comment "Legacy options removed in 2024.05"
>   
> +config BR2_TARGET_UBOOT_NEEDS_TI_K3_DM
> +	bool "u-boot TI K3 DM option has been renamed."
> +	select BR2_LEGACY
> +	select BR2_TARGET_UBOOT_NEEDS_TI_K3_BOOT_FIRMWARE
> +	help
> +	  The TI K3 Device Manager is already included in
> +	  ti-k3-boot-firmware.
> +
>   config BR2_PACKAGE_FLUTTER_GALLERY
>   	bool "flutter-gallery removed"
>   	select BR2_LEGACY
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 39b3f2c81b..e310c09217 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -240,18 +240,23 @@ config BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE
>   	  U-Boot, and that the TEE variable pointing to OPTEE's
>   	  tee.elf, is passed during the Buildroot build.
>   
> -config BR2_TARGET_UBOOT_NEEDS_TI_K3_DM
> -	bool "U-Boot needs TI K3 Device Manager (DM)"
> -	# We use the SoC selection defined for the ti-k3-image-gen
> -	# package
> -	depends on BR2_TARGET_TI_K3_IMAGE_GEN
> -	depends on BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX || BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
> +config BR2_TARGET_UBOOT_NEEDS_TI_K3_BOOT_FIRMWARE
> +	bool "U-Boot needs ti-k3-boot-firmware"
> +	depends on BR2_TARGET_TI_K3_BOOT_FIRMWARE

  I guess that if ti-k3-boot-firmware is selected, we can pretty much assume 
that U-Boot needs it, no? So I think this entire config option can be removed, 
so it gets enabled automatically if ti-k3-boot-firmware is enabled.

>   	help
> -	  Some TI K3 devices need the Device Manager (DM) firmware to
> -	  be available for the U-Boot build.
> +	  TI K3 devices needs at least ti-sysfw (System Firmware) when
> +	  built with u-boot's binman tool.
>   
> -if BR2_TARGET_UBOOT_NEEDS_TI_K3_DM
> +	  Some TI K3 devices using a split firmware boot flow (AM62,
> +	  j721e) also need the Device Manager (DM) firmware to be
> +	  available for the U-Boot build.
>   
> +if BR2_TARGET_UBOOT_NEEDS_TI_K3_BOOT_FIRMWARE

  I.e. this could just be

if BR2_TARGET_TI_K3_BOOT_FIRMWARE


  Regards,
  Arnout

> +
> +# TI_K3_DM_SOCNAME is only needed when ti-k3-image-gen is used for
> +# TI K3 devices using the Device Manager (DM) firmware.
> +# We use the SoC selection defined for the ti-k3-image-gen
> +# package.
>   config BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME
>   	string
>   	default "am62axx" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 491f654cec..47fb419e92 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -194,11 +194,13 @@ UBOOT_DEPENDENCIES += optee-os
>   UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.elf
>   endif
>   
> -ifeq ($(BR2_TARGET_UBOOT_NEEDS_TI_K3_DM),y)
> +ifeq ($(BR2_TARGET_UBOOT_NEEDS_TI_K3_BOOT_FIRMWARE),y)
>   UBOOT_TI_K3_DM_SOCNAME = $(call qstrip,$(BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME))
>   UBOOT_DEPENDENCIES += ti-k3-boot-firmware
> +ifneq ($(UBOOT_TI_K3_DM_SOCNAME),)
>   UBOOT_MAKE_OPTS += DM=$(BINARIES_DIR)/ti-dm/$(UBOOT_TI_K3_DM_SOCNAME)/ipc_echo_testb_mcu1_0_release_strip.xer5f
>   endif
> +endif
>   
>   ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPENSBI),y)
>   UBOOT_DEPENDENCIES += opensbi
> diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
> index 37df7a93f7..b2814526bb 100644
> --- a/configs/ti_am62x_sk_defconfig
> +++ b/configs/ti_am62x_sk_defconfig
> @@ -37,7 +37,7 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62x_evm_a53"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
>   BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>   BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> -BR2_TARGET_UBOOT_NEEDS_TI_K3_DM=y
> +BR2_TARGET_UBOOT_NEEDS_TI_K3_BOOT_FIRMWARE=y
>   # BR2_TARGET_UBOOT_FORMAT_BIN is not set
>   BR2_TARGET_UBOOT_FORMAT_IMG=y
>   BR2_TARGET_UBOOT_SPL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
