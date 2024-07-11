Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA63DC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 07:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 737A2412A8;
	Fri, 12 Jul 2024 07:06:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B4qGX8Ege5hq; Fri, 12 Jul 2024 07:06:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47C154129B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47C154129B;
	Fri, 12 Jul 2024 07:06:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB0A01BF48C
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 07:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8DEA607C2
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 07:06:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ek8iRGaWvlH0 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 07:06:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AEAFA607BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEAFA607BC
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AEAFA607BC
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 07:06:52 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4266182a9d7so10450885e9.0
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 00:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720768011; x=1721372811;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=40exKbd6x1hDeE0nu4e+hhY1X0QpxglQyW4FX8BWU2Y=;
 b=imrnRcP0PTxlouin08m75nIfvFh8SUHEEobVoxpVncbKiJOpSi5ZXp7mui7AJGCWL9
 j/lWLHI4CET60uh5XW+ypvj610E4GLbnk1sRmQuAn9xL/6djaBFPEG6mLSMM+hbqa/w0
 fFvh7oPxFNXzY/Xvi1si/RYeug4Q5ULJVJNHD9UPDAcl3vsW8VI+tStN7Gj4uOD1GRQH
 wHtT2vCT3uzQHT7XHdn1vxJpcqFgFvl7KKUrGBF20TvE2MyJmm2rgM0zQR+xD3fU+52v
 ku96diCXS7EunAME/VWkK2ZvEoA94SY/9C8yXUrG0Cq8+Gsy4x53bNiks+QWchKQ3O5G
 4IUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXf7S++DWe7JmRdgKCEZL3gtmu2eYovm2oK4bPRSL+jzQh/rZ88owg5F0coActRsrV+DGUCxYNbZZmkxiOfX7KdxybDosqBMQ==
X-Gm-Message-State: AOJu0Yzr9/i71E2WIH8lphuAqOkQjZBXXfN8CZMf7v0BDrDmQn96sBP7
 ktNr0jtcA/YVGmqTvq8lfl63bVVo7BJJ4BtdZCFnAyt+gl1uWMHVrFX/jZDZMf4=
X-Google-Smtp-Source: AGHT+IEy69/7+k+SkQPxaKnPK9CsqcHhbWI15G+qIx56e6rkElwc8QI/TwXoXqnrFrv2+H5O3a59lA==
X-Received: by 2002:a05:600c:55ce:b0:426:59fe:ac2d with SMTP id
 5b1f17b1804b1-426708f1fc2mr71839945e9.32.1720768010769; 
 Fri, 12 Jul 2024 00:06:50 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f23a000sm12491785e9.5.2024.07.12.00.06.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 00:06:50 -0700 (PDT)
Message-ID: <206c8331-eac9-4b47-928f-35bb74514b73@mind.be>
Date: Fri, 12 Jul 2024 00:38:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chris Dimich <cdimich2188@gmail.com>, buildroot@buildroot.org
References: <20240611180007.2127244-1-cdimich2188@gmail.com>
 <20240611180007.2127244-12-cdimich2188@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240611180007.2127244-12-cdimich2188@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720768011; x=1721372811; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=40exKbd6x1hDeE0nu4e+hhY1X0QpxglQyW4FX8BWU2Y=;
 b=CvhIUoMy4E6irhTBR5SWcygdwtX9KtU2n1D1N3lHhuQvPCdqdJSdkXqyvBEJHICuoT
 TGUC8m/oT64Dqgp6mGhScMYcr7gcL+lKNFTU5iwKtWvt494KwXSJ0JOLW0uXQRTuIPqX
 PkIOJX4oZkW/9pF9VrtcAnNNyAA8Mrjcqw3eLJipH5gHVe/lG6ZUgyUSeP4oi8kuvWHq
 lyCLIgOFDifP2GZLO44ZATX6ypzhd6otjXqemvqkc+Toqovck9oJemKjz5elNmzDAj6R
 jvYQX2AZRk54y9h2k7UPXlaylh02mPV68XZJACSwgNNHeX8iheGQLjAZI5XckngvTTIN
 MbNw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CvhIUoMy
Subject: Re: [Buildroot] [PATCH 11/12]
 package/freescale-imx/firmware-upower: new package
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/06/2024 20:00, Chris Dimich wrote:
> This package provides NXP i.MX uPower firmware present on i.MX 8ULP SoC.
> This version comes from the NXP 6.1.55-2.2.0 release.
> 
> Signed-off-by: Chris Dimich <cdimich2188@gmail.com>
> ---
>   package/freescale-imx/Config.in               |  5 ++++
>   .../freescale-imx/firmware-upower/Config.in   | 22 +++++++++++++++
>   .../firmware-upower/firmware-upower.hash      |  4 +++
>   .../firmware-upower/firmware-upower.mk        | 27 +++++++++++++++++++
>   4 files changed, 58 insertions(+)
>   create mode 100644 package/freescale-imx/firmware-upower/Config.in
>   create mode 100644 package/freescale-imx/firmware-upower/firmware-upower.hash
>   create mode 100644 package/freescale-imx/firmware-upower/firmware-upower.mk
> 
> diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
> index 34ce1d1311..6d196a052d 100644
> --- a/package/freescale-imx/Config.in
> +++ b/package/freescale-imx/Config.in
> @@ -165,6 +165,10 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_ELE
>   		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91 || \
>   		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93
>   
> +config BR2_PACKAGE_FREESCALE_IMX_HAS_UPOWER
> +	bool
> +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULP

  I think it would be cleaner if the different SoC versions would select the 
features they have, rather than the other way round. So more like in 
arch/Config.in.arm for example.

  Still, this is how the whole file is constructed, and it's more important to 
be consistent. So I've applied as is. But if you feel up to it, feel free to 
refactor and turn the 'default y if...' into select statements.

  Regards,
  Arnout

> +
>   source "package/freescale-imx/imx-alsa-plugins/Config.in"
>   source "package/freescale-imx/imx-codec/Config.in"
>   source "package/freescale-imx/imx-kobs/Config.in"
> @@ -177,6 +181,7 @@ source "package/freescale-imx/imx-vpu-hantro/Config.in"
>   source "package/freescale-imx/imx-vpuwrap/Config.in"
>   source "package/freescale-imx/firmware-ele-imx/Config.in"
>   source "package/freescale-imx/firmware-imx/Config.in"
> +source "package/freescale-imx/firmware-upower/Config.in"
>   source "package/freescale-imx/imx-sc-firmware/Config.in"
>   source "package/freescale-imx/imx-seco/Config.in"
>   source "package/freescale-imx/imx-vpu-hantro-daemon/Config.in"
> diff --git a/package/freescale-imx/firmware-upower/Config.in b/package/freescale-imx/firmware-upower/Config.in
> new file mode 100644
> index 0000000000..ca7486d2b7
> --- /dev/null
> +++ b/package/freescale-imx/firmware-upower/Config.in
> @@ -0,0 +1,22 @@
> +comment "firmware-upower needs an i.MX platform with uPower"
> +	depends on !BR2_PACKAGE_FREESCALE_IMX_HAS_UPOWER
> +
> +config BR2_PACKAGE_FIRMWARE_UPOWER
> +	bool "firmware-upower"
> +	depends on BR2_PACKAGE_FREESCALE_IMX_HAS_UPOWER
> +	help
> +	  NXP i.MX uPower firmware present on i.MX 8ULP SoC.
> +
> +	  This library is provided by NXP as-is and doesn't have an
> +	  upstream.
> +
> +if BR2_PACKAGE_FIRMWARE_UPOWER
> +
> +config BR2_PACKAGE_FIRMWARE_UPOWER_UPOWER_FIRMWARE_NAME
> +	string
> +	default "upower_a0.bin" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULPA0
> +	default "upower_a1.bin" if \
> +		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULPA1 || \
> +		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULPA2
> +
> +endif # BR2_PACKAGE_FIRMWARE_UPOWER
> diff --git a/package/freescale-imx/firmware-upower/firmware-upower.hash b/package/freescale-imx/firmware-upower/firmware-upower.hash
> new file mode 100644
> index 0000000000..dc5938ad16
> --- /dev/null
> +++ b/package/freescale-imx/firmware-upower/firmware-upower.hash
> @@ -0,0 +1,4 @@
> +# Locally calculated
> +sha256  1df3a03d69feb38a450ee63abc7713d78cf6339988476e4c9f95ebbf63790f66  firmware-upower-1.3.1.bin
> +sha256  de37a0bcbf1717b910c1a53ea6eab853c404e61e8143bb6c081d39f532571e54  COPYING
> +sha256  b158adaac5e2d1c7fa6e739ff168ab498957e3303070f1c0b0e66d9a8f02a354  EULA
> diff --git a/package/freescale-imx/firmware-upower/firmware-upower.mk b/package/freescale-imx/firmware-upower/firmware-upower.mk
> new file mode 100644
> index 0000000000..dfdf75510c
> --- /dev/null
> +++ b/package/freescale-imx/firmware-upower/firmware-upower.mk
> @@ -0,0 +1,27 @@
> +################################################################################
> +#
> +# firmware-ele-imx
> +#
> +################################################################################
> +
> +FIRMWARE_UPOWER_VERSION = 1.3.1
> +FIRMWARE_UPOWER_SITE = $(FREESCALE_IMX_SITE)
> +FIRMWARE_UPOWER_SOURCE = firmware-upower-$(FIRMWARE_UPOWER_VERSION).bin
> +
> +FIRMWARE_UPOWER_LICENSE = NXP Semiconductor Software License Agreement
> +FIRMWARE_UPOWER_LICENSE_FILES = COPYING EULA
> +FIRMWARE_UPOWER_REDISTRIBUTE = NO
> +
> +FIRMWARE_UPOWER_INSTALL_IMAGES = YES
> +
> +define FIRMWARE_UPOWER_EXTRACT_CMDS
> +	$(call NXP_EXTRACT_HELPER,$(FIRMWARE_UPOWER_DL_DIR)/$(FIRMWARE_UPOWER_SOURCE))
> +endef
> +
> +FIRMWARE_UPOWER_UPOWER_FIRMWARE_NAME = $(call qstrip,$(BR2_PACKAGE_FIRMWARE_UPOWER_UPOWER_FIRMWARE_NAME))
> +
> +define FIRMWARE_UPOWER_INSTALL_IMAGES_CMDS
> +	cp $(@D)/$(FIRMWARE_UPOWER_UPOWER_FIRMWARE_NAME) $(BINARIES_DIR)/upower.bin
> +endef
> +
> +$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
