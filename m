Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8098C021A9
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 22:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7936D82B5E;
	Mon, 17 Feb 2025 22:18:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 44ao6fn1776r; Mon, 17 Feb 2025 22:18:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CC6882B69
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CC6882B69;
	Mon, 17 Feb 2025 22:18:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10C1F72
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 22:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09C54605BB
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 22:18:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oMeCNa9jZUK8 for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 22:18:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 06212605D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06212605D2
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 06212605D2
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 22:18:47 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-38f325dd9e6so1475298f8f.1
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 14:18:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739830726; x=1740435526;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AKPNJNe2q6NFrWiko21k5P02Z6/NXuyx/sJKke2kLrU=;
 b=rt6fs//M6sN68WF3ig1zdH3jgcgB/vIlbRVdeEngtlQ0ueki8m65CHH7XbNH0R86D/
 yhLYjMGEUlt/BSB2IvbqbioNbLtrGSDQS0izzI1m9w07/thSSwaAMT5U/zJGOluZGmjd
 JINbopzxkmhCjnhaCQgokwTRf4iu8ni4/ROLaRAgV0U9PyvTxh7u8DqkHMXhnqfJbmv9
 z5/s8T5VLvEj1T4s6rEUrshJOEIYASD3pVqDSbEdfDiNt3fKoVuqVCUPOgR2dBlfhnjn
 xCQRJezcd+uFvN4hEHt9td6GXRbyz2tol4eJc7g67QasTNNMZIy6ZM4cuRc6xYTFNlFB
 kgnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaVNhGh3h79S9HWdG82A61K/7Y0rUrNMMq9DmIxyQOqJSPBGbn3YRsco9guPBAj78p6b+8uOOE26E=@buildroot.org
X-Gm-Message-State: AOJu0YzdpWyw18B3llXZ6cdmHxXGaqvGjp6sJqTFrK7cNcnBM5B7QQqa
 icR7SdNu49aIVVy8xi7BDic+Y2+nETwezOtDR4wxxYah2wYNmriBTajVIJseFqg=
X-Gm-Gg: ASbGncuPXz5MrPQr1Q/VmR/SL18zzB/k8P+r0xvRWBqF9qFMiTgfUy4zMgiE34QG6E1
 K5DYsuUvxD/SDvlqmxUj7YmJgYUg0B09KOI2gntNlPZl/Ay3y3v9l13+8AX4j8oDjePHtTebPJO
 m4lDQONAyOAp52QrImr8PdSvKJsLIAOag8mgpzppjRk5oUELbN75r7MTB4IUp5eWYCUGrn4AqQO
 VZoE2dO/dN/jIYUfZMDeWyPJHA69z5XbDgqYoylaWyAnSFgZasWSifnMiRo4KTjk74Xv7JDUC4k
 CKTH9XZ0ryfSaC2wWdWi+aDZHg3WsdmE+It/CfjiF6pPFGGeIQvDLN2ukIC6O8GUvFL1RgYfVm6
 jqHS86o7k4ooncwbwb9/2/odfLdttbpD0WgkguSjQSFa8MA==
X-Google-Smtp-Source: AGHT+IGdVQ4zsYq/vgWt6zseTi2e1ufOhKTdOZnDnbqI/tXGcI05cq6fJLA9rLd0+urQTHbtrbVRPQ==
X-Received: by 2002:a05:6000:dc6:b0:38f:3015:b9f4 with SMTP id
 ffacd0b85a97d-38f33f337eamr7918698f8f.27.1739830725611; 
 Mon, 17 Feb 2025 14:18:45 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f25913f5asm13470595f8f.52.2025.02.17.14.18.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 14:18:44 -0800 (PST)
Message-ID: <d97755e1-0db7-49b0-94f1-f50fa930c5e4@mind.be>
Date: Mon, 17 Feb 2025 23:18:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
References: <20250217124932.2653445-1-neal.frager@amd.com>
 <20250217124932.2653445-2-neal.frager@amd.com>
Content-Language: en-GB
In-Reply-To: <20250217124932.2653445-2-neal.frager@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1739830726; x=1740435526; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AKPNJNe2q6NFrWiko21k5P02Z6/NXuyx/sJKke2kLrU=;
 b=BocOzv26Ks8BaByvmIgcqd4NMB2RmT//qB7XmgybJAJPStZ5lIPzqJQ0Ky6iGiGjdE
 iziv95RZEyxZDnNdBAHD3gOW+Kk/3ufePpbl32O58usAZA+kv+kRXnSckZiEcJwd5f9w
 dJJBT7UU14FLrMlNXTdbt9pZ8EZPS5aZPZSqtn0EWGHPn+xmJrEKucJ1dfjC5C870dNY
 Y9+C/hVut96abFH2GNzc2SyF4KtFC4pxHiBBJh0YPwFhcA9eBfya3uCVUi1QD22lzb6e
 QEy4CZZJDDgffGOdnadKgNNK0uu+jGwAqwd0vD+Wp/rvnqi4Gc4kitADo6OCysqd+siy
 iTWA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BocOzv26
Subject: Re: [Buildroot] [PATCH v5 2/5] package/gcc-bare-metal: add multiple
 tuple support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/02/2025 13:49, Neal Frager wrote:
> Add support to gcc-bare-metal to support multiple architecture tuples
> with the BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH string.
> 
> To do this, custom configure, build and install commands are needed, so that
> each step goes through a loop of the architecture tuples in the list.
> 
> To keep consistency with autotools, all the relevant host configurations have
> been copied into the HOST_GCC_BARE_METAL_CONF_OPTS while removing any
> configurations that do not apply to gcc and removing redundant configs.
> 
> autotools redundant configs covered by $(HOST_CONFIGURE_OPTS):
> 	CFLAGS="$$(HOST_CFLAGS)"
> 	LDFLAGS="$$(HOST_LDFLAGS)"
> 
> autotools configs not applicable to gcc:
> 	--disable-gtk-doc
> 	--disable-gtk-doc-html
> 	--disable-doc
> 	--disable-docs
> 	--disable-documentation
> 	--disable-debug
> 	--with-xmlto=no
> 	--with-fop=no
> 	--disable-nls
> 
> Some of the configurations already in the gcc-bare-metal package also
> needed to be changed because they were incorrect.
> 
> Configs Incorrect:
> --disable-initfini_array -> --disable-initfini-array

  This is in fact "harmless" because configure converts all - to _ in the 
options anyway.

> --disable-libstdcxx-pch -> --disable-libstdcxx

  The --disable-libstdcxx-pch option does in fact exist. pch are the 
pre-compiled headers, while --disable-libstdcxx would disable C++ entirely... I 
can imagine that there's code for the auxiliary processors that is written in 
C++ so I don't think it's a good idea to disable it. And it's a static library 
anyway so just costs a bit of build time.

  Well, we actually pass --languages=c so it doesn't matter either way...

  Anyway, I've kept the --disable-libstdcxx-pch option. No need to change things 
that don't need to be changed :-)

  Regards,
  Arnout


> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
> - corrected sysroot configuration
> V2->V3:
> - removed unnecessary symlinks
> - removed unnecessary semi-colons
> V3->V4:
> - added all relevant autotools configs
> - removed any configs not relevant to gcc
> - corrected some configs already included in gcc-bare-metal
> V4->V5:
> - no changes
> ---
>   package/gcc-bare-metal/gcc-bare-metal.mk | 60 +++++++++++++++++-------
>   1 file changed, 44 insertions(+), 16 deletions(-)
> 
> diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
> index adaae6c307..7159dda1d8 100644
> --- a/package/gcc-bare-metal/gcc-bare-metal.mk
> +++ b/package/gcc-bare-metal/gcc-bare-metal.mk
> @@ -20,15 +20,9 @@ HOST_GCC_BARE_METAL_DEPENDENCIES = \
>   	host-mpfr \
>   	host-isl
>   
> -# gcc doesn't support in-tree build, so we create a 'build'
> -# subdirectory in the gcc sources, and build from there.
> -define HOST_GCC_BARE_METAL_CONFIGURE_SYMLINK
> -	mkdir -p $(@D)/build
> -	ln -sf ../configure $(@D)/build/configure
> -endef
> -
> -HOST_GCC_BARE_METAL_PRE_CONFIGURE_HOOKS += HOST_GCC_BARE_METAL_CONFIGURE_SYMLINK
> -HOST_GCC_BARE_METAL_SUBDIR = build
> +# Don't build documentation. It takes up extra space / build time,
> +# and sometimes needs specific makeinfo versions to work
> +HOST_GCC_BARE_METAL_CONF_ENV = MAKEINFO=missing
>   
>   HOST_GCC_BARE_METAL_MAKE_OPTS = \
>   	$(HOST_GCC_COMMON_MAKE_OPTS) \
> @@ -38,10 +32,15 @@ HOST_GCC_BARE_METAL_MAKE_OPTS = \
>   HOST_GCC_BARE_METAL_INSTALL_OPTS = install-gcc install-target-libgcc
>   
>   HOST_GCC_BARE_METAL_CONF_OPTS = \
> -	--target=$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE) \
> -	--disable-initfini_array \
> +	--prefix=$(HOST_DIR) \
> +	--sysconfdir=$(HOST_DIR)/etc \
> +	--localstatedir=$(HOST_DIR)/var \
> +	$(if $$($$(PKG)_OVERRIDE_SRCDIR),,--disable-dependency-tracking) \
> +	$(QUIET) \
> +	--disable-shared \
> +	--disable-initfini-array \
>   	--disable-__cxa_atexit \
> -	--disable-libstdcxx-pch \
> +	--disable-libstdcxx \
>   	--with-newlib \
>   	--disable-threads \
>   	--enable-plugins \
> @@ -54,9 +53,38 @@ HOST_GCC_BARE_METAL_CONF_OPTS = \
>   	--with-gmp=$(HOST_DIR) \
>   	--with-mpc=$(HOST_DIR) \
>   	--with-mpfr=$(HOST_DIR) \
> -	--with-isl=$(HOST_DIR) \
> -	--with-sysroot=$(TOOLCHAIN_BARE_METAL_BUILDROOT_SYSROOT) \
> -	AR_FOR_TARGET=$(HOST_DIR)/bin/$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE)-ar \
> -	RANLIB_FOR_TARGET=$(HOST_DIR)/bin/$(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE)-ranlib
> +	--with-isl=$(HOST_DIR)
> +
> +define HOST_GCC_BARE_METAL_CONFIGURE_CMDS
> +	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
> +		mkdir -p $(@D)/build-$(arch_tuple) && \
> +		cd $(@D)/build-$(arch_tuple) && \
> +		$(HOST_CONFIGURE_OPTS) \
> +		$(HOST_GCC_BARE_METAL_CONF_ENV) \
> +		CONFIG_SITE=/dev/null \
> +		$(@D)/configure \
> +			$(HOST_GCC_BARE_METAL_CONF_OPTS) \
> +			--target=$(arch_tuple) \
> +			--with-sysroot=$(HOST_DIR)/$(arch_tuple)/sysroot \
> +			AR_FOR_TARGET=$(HOST_DIR)/bin/$(arch_tuple)-ar \
> +			RANLIB_FOR_TARGET=$(HOST_DIR)/bin/$(arch_tuple)-ranlib
> +	)
> +endef
> +
> +define HOST_GCC_BARE_METAL_BUILD_CMDS
> +	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
> +		$(HOST_MAKE_ENV) $(MAKE) \
> +			$(HOST_GCC_BARE_METAL_MAKE_OPTS) \
> +			-C $(@D)/build-$(arch_tuple)
> +	)
> +endef
> +
> +define HOST_GCC_BARE_METAL_INSTALL_CMDS
> +	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
> +		$(HOST_MAKE_ENV) $(MAKE) \
> +			$(HOST_GCC_BARE_METAL_INSTALL_OPTS) \
> +			-C $(@D)/build-$(arch_tuple)
> +	)
> +endef
>   
>   $(eval $(host-autotools-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
