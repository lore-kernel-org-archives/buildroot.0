Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F66C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 14:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 348D440608;
	Mon, 15 Jul 2024 14:30:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZuofKT4E-D-i; Mon, 15 Jul 2024 14:30:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2D8F40650
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2D8F40650;
	Mon, 15 Jul 2024 14:30:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 991531BF3AD
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFB8740624
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:30:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ReTW8ESyVCh for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 14:30:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 62E1840637
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62E1840637
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 62E1840637
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 14:30:23 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4267300145eso33922525e9.3
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 07:30:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721053821; x=1721658621;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4zseJEdCQ3j/ZGDRyOv8qYBNsTfHhMyoSAK49/wvFVo=;
 b=Zu4p66W9SZhfqZw/zXNy4/4pj2NMnPmO+Jph9hEi0MWdwUdUZffAK5F0QDdk6viSvK
 zJ31E+7YreDW7bSzZaTqAovTHBJDcs8KrwHD6wYu3oD3qduPLhzzZ7gbJCE758fcXdL/
 j06G+EcdtqLYJVmC1IBN2zggZ+YCgD+XdZWNIykIrIVgrjH89O73DOmN/7Jph5s/jyVO
 NSQ6FknF7MDsRLL/+/92qFyKgptGMqQR3bfHgjZD7divVD99GeEkf8i1+mLfPqNEfo1e
 pWEHCbNbsc2XjKCpKzA9S5va9yDvYxMcPrxQScPXwM74gqarz10X7WHMDRYwoVi0FwXK
 gAbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8Axf1m+UQ+OeAoD7Utzhi+BmHGjdP75YToRwQ3sg/XMZric3XqTkDtn/HMkPUNGTmTq7epE/Fsbvqj2+xYEl9PtW+iNlZFA==
X-Gm-Message-State: AOJu0Yyt32mXQKVtI/Qjpd9ZDMHYo3c/BsjavImPO8PMv4hZDrevWwBz
 rW5Zr6dBf5hpNZFnRhCT7ZEDvuTg2iZwkxJhvtuNYXT6ts17PYNF8mpFy1oGfUE=
X-Google-Smtp-Source: AGHT+IEAuiOtIEcOFqrORLPn4Se9+WoLDW8pSb6gNry4gI2cODSgN8FIm3q0hwmReHGo2+mjo63Gfg==
X-Received: by 2002:a05:600c:4312:b0:426:6857:3156 with SMTP id
 5b1f17b1804b1-426707f8580mr130561725e9.27.1721053821285; 
 Mon, 15 Jul 2024 07:30:21 -0700 (PDT)
Received: from [10.8.0.42] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f2d74c6sm122686315e9.45.2024.07.15.07.30.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 07:30:20 -0700 (PDT)
Message-ID: <c30799b3-73e7-44f4-98dd-2f152dd1e45d@mind.be>
Date: Mon, 15 Jul 2024 16:30:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kory Maincent <kory.maincent@bootlin.com>, buildroot@buildroot.org
References: <20240711091206.2551882-1-kory.maincent@bootlin.com>
Content-Language: en-GB
In-Reply-To: <20240711091206.2551882-1-kory.maincent@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721053821; x=1721658621; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4zseJEdCQ3j/ZGDRyOv8qYBNsTfHhMyoSAK49/wvFVo=;
 b=UyBVNixFpJHCnd2GS8JkSBpcxNzS52oOKyllG3G8/OioLTFLQmru36TmCFaFs28C5C
 j25Dj8+MFfaohJeIUAb2Izuza3gtSz0p5OZ0lvMMOqUbNiKmVElfWEtJC+XfY3R30KiY
 MfIQGhl8jdtAvLQhFTJ3pxY7Vi+ioYwqbVOFwPDYUQdRz4cQNkb1HpYqj+UUCOx4jBIw
 T6CqsC0O+cQgrgDHCwb43go8rkFy4Rux8fkuNSOXt4LNjqh79ixCLhROYQs4ixfzbfiT
 sxg8jimyIKyYpdGfxNpnxce3GmEF66uQlxVjgUkxwl+8suRTijeEurXXsdtGgeWaqf7k
 CpwA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UyBVNixF
Subject: Re: [Buildroot] [PATCH] package/gcnano-binaries: Add STM32MP2
 support and bump to 6.4.15
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
Cc: Jens Kleintje <scooby22@web.de>, thomas.petazzoni@bootlin.com,
 Romain Gantois <romain.gantois@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/07/2024 11:12, Kory Maincent via buildroot wrote:
> From: Romain Gantois <romain.gantois@bootlin.com>
> 
> Add initial support for STM32MP257 GPU drivers.
> 
> gcnano-binaries will be configured for STM32MP1 platforms on ARM 32-bits
> and STM32MP2 on ARM 64-bits.
> 
> Update to the latest version of the gcnano-binaries blobs, which are
> compatible with the last v6.1-stm32mp-r2 kernel from the
> STMicroelectronics BSP.
> 
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/gcnano-binaries/Config.in            |  6 +++---
>   package/gcnano-binaries/gcnano-binaries.hash |  2 +-
>   package/gcnano-binaries/gcnano-binaries.mk   | 20 +++++++++++++++-----
>   3 files changed, 19 insertions(+), 9 deletions(-)
> 
> diff --git a/package/gcnano-binaries/Config.in b/package/gcnano-binaries/Config.in
> index 89f909f2c3..f01468f09f 100644
> --- a/package/gcnano-binaries/Config.in
> +++ b/package/gcnano-binaries/Config.in
> @@ -1,15 +1,15 @@
>   comment "gcnano-binaries needs a Linux kernel to be built"
> -	depends on BR2_arm
> +	depends on BR2_arm || BR2_aarch64
>   	depends on !BR2_LINUX_KERNEL
>   
>   comment "gcnano-binaries needs a glibc toolchain w/ threads, dynamic library"
> -	depends on BR2_arm
> +	depends on BR2_arm || BR2_aarch64
>   	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_TOOLCHAIN_HAS_THREADS \
>   		|| BR2_STATIC_LIBS
>   
>   config BR2_PACKAGE_GCNANO_BINARIES
>   	bool "gcnano-binaries"
> -	depends on BR2_arm
> +	depends on BR2_arm || BR2_aarch64
>   	depends on BR2_LINUX_KERNEL
>   	depends on BR2_TOOLCHAIN_USES_GLIBC
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm, wayland
> diff --git a/package/gcnano-binaries/gcnano-binaries.hash b/package/gcnano-binaries/gcnano-binaries.hash
> index 3192b0d854..d3c64d44a3 100644
> --- a/package/gcnano-binaries/gcnano-binaries.hash
> +++ b/package/gcnano-binaries/gcnano-binaries.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  8bb1f6ee633f3c30e16b33ff6913286edf31f77b69105a14d147509beba3ea94  gcnano-binaries-5d02efd5cb4cfa85307633891f3cf87550a8bc1d.tar.gz
> +sha256  4c7454ac44c9e3ead20a978a5c009e8489fa90ce5cf291be31016a7f497bea26  gcnano-binaries-bbaae49a0e4859ed53f898a250269c8a237261bc.tar.gz
>   sha256  29c78804b097b5cfee0e802bef9f60348a635640eadd8a91b7ce82ddf17fbf5a  EULA
> diff --git a/package/gcnano-binaries/gcnano-binaries.mk b/package/gcnano-binaries/gcnano-binaries.mk
> index c3aa5d48d2..03912ea585 100644
> --- a/package/gcnano-binaries/gcnano-binaries.mk
> +++ b/package/gcnano-binaries/gcnano-binaries.mk
> @@ -4,11 +4,20 @@
>   #
>   ################################################################################
>   
> -GCNANO_BINARIES_LIB_VERSION = 6.4.13
> +GCNANO_BINARIES_LIB_VERSION = 6.4.15
>   GCNANO_BINARIES_DRIVER_VERSION = $(GCNANO_BINARIES_LIB_VERSION)
> -GCNANO_BINARIES_USERLAND_VERSION = $(GCNANO_BINARIES_LIB_VERSION)-20230517
> -GCNANO_BINARIES_VERSION = 5d02efd5cb4cfa85307633891f3cf87550a8bc1d
> +
>   GCNANO_BINARIES_SITE = $(call github,STMicroelectronics,gcnano-binaries,$(GCNANO_BINARIES_VERSION))
> +GCNANO_BINARIES_VERSION = bbaae49a0e4859ed53f898a250269c8a237261bc
> +ifeq ($(BR2_arm),y)
> +GCNANO_BINARIES_USERLAND_VERSION = stm32mp1-$(GCNANO_BINARIES_LIB_VERSION)-20240206
> +GCNANO_BINARIES_ARCH_TYPE = arm
> +GCNANO_BINARIES_SOC_PLATFORM = st-mp1
> +else
> +GCNANO_BINARIES_USERLAND_VERSION = stm32mp2-$(GCNANO_BINARIES_LIB_VERSION)-20240517
> +GCNANO_BINARIES_ARCH_TYPE = arm64
> +GCNANO_BINARIES_SOC_PLATFORM = st-mp2
> +endif
>   
>   GCNANO_BINARIES_LICENSE = MIT, Vivante End User Software License Terms
>   GCNANO_BINARIES_LICENSE_FILES = EULA
> @@ -38,8 +47,9 @@ GCNANO_BINARIES_POST_EXTRACT_HOOKS += GCNANO_BINARIES_EXTRACT_HELPER
>   GCNANO_BINARIES_MODULE_SUBDIRS = gcnano-driver-stm32mp
>   
>   GCNANO_BINARIES_MODULE_MAKE_OPTS = \
> +	ARCH_TYPE=$(GCNANO_BINARIES_ARCH_TYPE) \
>   	KERNEL_DIR=$(LINUX_DIR) \
> -	SOC_PLATFORM=st-mp1 \
> +	SOC_PLATFORM=$(GCNANO_BINARIES_SOC_PLATFORM) \
>   	AQROOT=$(@D)/gcnano-driver-stm32mp \
>   	DEBUG=0
>   
> @@ -58,7 +68,7 @@ define GCNANO_BINARIES_INSTALL
>   	cp -a $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/release/include/* $(1)/usr/include/
>   	cd $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/pkgconfig/ ; \
>   	for file in *.pc ; do \
> -		sed -e "s|#PREFIX#|/usr|" -e "s|#VERSION#|22.0.3|" $$file > $$file.temp ; \
> +		sed -e "s|#PREFIX#|/usr|" -e "s|#VERSION#|23.0.3|" $$file > $$file.temp ; \
>   		$(INSTALL) -D -m 0644 $$file.temp $(1)/usr/lib/pkgconfig/$$file ; \
>   	done
>   endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
