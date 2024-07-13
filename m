Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F76BC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 20:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F77E8202A;
	Sat, 13 Jul 2024 20:32:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zmzsBVlI_w-H; Sat, 13 Jul 2024 20:32:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF4F481FD9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF4F481FD9;
	Sat, 13 Jul 2024 20:32:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8BF6C1BF271
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85A1281F52
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:32:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0qyghLeiGt3s for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 20:32:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8DF5481E46
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DF5481E46
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8DF5481E46
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 20:32:12 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4266ea6a412so21010895e9.1
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 13:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720902730; x=1721507530;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=duNPKDVpxjRinPLsWWKVj9R/83HGwQwVIQ0+xGSjglM=;
 b=rE4BO6susHU5gDaTgf1okvCTpCqC6FPuSmCuL0Ns4nhaelvJbACeLlRWyYxkSF+59X
 eGlGPDnvU+OAbDE2d1haNBflNDOqPi546PPqEwtNK5dM37d0PtBDbUGN6+KiqV4Vn1xs
 k63dMuh71j84A5gCjqb0/HggTzTj68rm1U4/fDv2ghaR+CHf02zqnmE0v9hGoJBFdSA/
 7LXIWSt7mEZlQZUnRlihBSofy1bQsAUg19U7P/cWOJiczQENvCA3S8/s2TpFHrH/dcxL
 ALUVgNAb5Xw7aO7biuWiwdGw1wUFAtKYEOlX54Pj8eaELInV/OzMP8f/QQrXo4lYjJTm
 uzNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUic6aA5cwnuuo0xIrzZXzZLZjNx2xRxfME42EivURF5aEsIeJ+CSd6qAe2CxxPqKBcBreM7a09wvlW71h/U8GMRksnt2orDg==
X-Gm-Message-State: AOJu0YxhlOGijRuEdyHEsK7HOIQetSagw6OruEaRhRMCAiW4wLchFEj8
 uFS253IC9bIHCYEJFkSPSwwyl8HyaJG3h4FQBpjmvDroxNA3VQ/ieWWKLGCt/z0=
X-Google-Smtp-Source: AGHT+IE48FSAY8iKgzGav60KkF3vpbljUo1fu0LqSPhmpC9O4KDt5jkXo5ILHA2QnINFXCFhh0cJ3A==
X-Received: by 2002:a05:600c:4614:b0:426:54c9:dfe5 with SMTP id
 5b1f17b1804b1-426707cb1bdmr107680975e9.10.1720902730336; 
 Sat, 13 Jul 2024 13:32:10 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f2d73bdsm67461145e9.43.2024.07.13.13.32.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Jul 2024 13:32:09 -0700 (PDT)
Message-ID: <58a32327-ba50-49bb-9fd8-f743bacd3632@mind.be>
Date: Sat, 13 Jul 2024 22:32:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Heiko Thiery <heiko.thiery@gmail.com>, buildroot@buildroot.org
References: <20240713122331.298786-1-heiko.thiery@gmail.com>
 <20240713122331.298786-5-heiko.thiery@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240713122331.298786-5-heiko.thiery@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720902730; x=1721507530; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=duNPKDVpxjRinPLsWWKVj9R/83HGwQwVIQ0+xGSjglM=;
 b=Miz4ap5Zdly5ywDxW+IxIu4xyY2O1QE32zbNp49n4F3VlEDu1kdSZ2xddxJ/Y+fsnG
 pLIGeht4yPmAXfd8mGX4yhOchF3wonq3GgEHXjXMIHP0qz5noBl268ApAwPw9VkodlyA
 tPXeKHyhMZFIytslC+51+ALjhGq+JvA1SDXkKI10X0GmiTkIzSF6Kp+wQpkO13uqEb2U
 XQrrC+l0xrHUl0C4tHaZ5IG913d/7FF3MXZu53bAWk7yBF8X9V0TdvL6H0I/XjuAxlH/
 aDwFjazxlJR00IWrrNWUx4RihgoHRJUVixKG4EOPwGtqIuY0AZ3szCvzDvlU/TGbpD3L
 Lmdw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Miz4ap5Z
Subject: Re: [Buildroot] [PATCH v4 4/4] package/pkg-generic.mk: add variable
 to skip ccache dependency
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
Cc: Lance Fredrickson <lancethepants@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, Samuel Martin <s.martin49@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/07/2024 14:23, Heiko Thiery wrote:
> As more and more packages are required to build the host ccache package
> and therefore they has to be filtered out for ccache dependency the list
> growed up.
> 
> By adding the variable <PKG>_ADD_CCACHE_DEPENDENCY with the default
> value to 'yes' we can remove that dependency for each package that is
> needed by ccache by setting the value to 'no'. This can be done  in the
> package makefile instead of tracking the list in the core pkg-generic.mk file.
> 
> This behavior is similar to the skeleton and toolchain dependency.
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

[snip]
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index eeb7531dbb..0dd9f6b26d 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -761,6 +761,9 @@ endif # ifeq ($$($(2)_CPE_ID_VALID),YES)
>   # Similarly for the skeleton.
>   $(2)_ADD_TOOLCHAIN_DEPENDENCY	?= YES
>   $(2)_ADD_SKELETON_DEPENDENCY	?= YES
> +ifeq ($$(BR2_CCACHE),y)

  I've removed this condition and instead added it ...

> +$(2)_ADD_CCACHE_DEPENDENCY	?= YES
> +endif
>   
>   
>   ifeq ($(4),target)
> @@ -772,6 +775,10 @@ $(2)_DEPENDENCIES += toolchain
>   endif
>   endif
>   
> +ifeq ($$($(2)_ADD_CCACHE_DEPENDENCY),YES)

  ... here

ifeq ($$(BR2_CCACHE):$$($(2)_ADD_CCACHE_DEPENDENCY),y:YES)


  Regards,
  Arnout

> +$(2)_DEPENDENCIES += host-ccache
> +endif
> +
>   ifneq ($(1),host-skeleton)
>   $(2)_DEPENDENCIES += host-skeleton
>   endif
> @@ -792,12 +799,6 @@ $(2)_EXTRACT_DEPENDENCIES += \
>   		$$(call extractor-pkg-dependency,$$(notdir $$(dl))))
>   endif
>   
> -ifeq ($$(BR2_CCACHE),y)
> -ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate host-ccache host-cmake host-hiredis host-pkgconf host-zstd host-xxhash host-blake3,$(1)),)
> -$(2)_DEPENDENCIES += host-ccache
> -endif
> -endif
> -
>   ifeq ($$(BR2_REPRODUCIBLE),y)
>   ifeq ($$(filter host-skeleton host-fakedate,$(1)),)
>   $(2)_DEPENDENCIES += host-fakedate
> diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
> index 1d73b691e1..a8c7b48287 100644
> --- a/package/pkgconf/pkgconf.mk
> +++ b/package/pkgconf/pkgconf.mk
> @@ -11,6 +11,9 @@ PKGCONF_LICENSE = pkgconf license
>   PKGCONF_LICENSE_FILES = COPYING
>   PKGCONF_CPE_ID_VENDOR = pkgconf
>   
> +# The package is a dependency to ccache so ccache cannot be a dependency
> +HOST_PKGCONF_ADD_CCACHE_DEPENDENCY = NO
> +
>   # We are a ccache dependency, so we can't use ccache
>   HOST_PKGCONF_CONF_ENV = \
>   	CC="$(HOSTCC_NOCCACHE)" \
> diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
> index 4eaaf32ead..1bb3971191 100644
> --- a/package/skeleton/skeleton.mk
> +++ b/package/skeleton/skeleton.mk
> @@ -11,6 +11,9 @@
>   SKELETON_ADD_TOOLCHAIN_DEPENDENCY = NO
>   SKELETON_ADD_SKELETON_DEPENDENCY = NO
>   
> +# The package is a dependency to ccache so ccache cannot be a dependency
> +HOST_SKELETON_ADD_CCACHE_DEPENDENCY = NO
> +
>   # Although the $(HOST_DIR)/usr symlink is mostly for backward compatibility,
>   # there are weird packages that still require it (see host-systemd, and
>   # commit 35c11a027c88).
> diff --git a/package/tar/tar.mk b/package/tar/tar.mk
> index a7e85afb72..b9de082603 100644
> --- a/package/tar/tar.mk
> +++ b/package/tar/tar.mk
> @@ -13,6 +13,9 @@ TAR_CPE_ID_VENDOR = gnu
>   TAR_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
>   TAR_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
>   
> +# The package is a dependency to ccache so ccache cannot be a dependency
> +HOST_TAR_ADD_CCACHE_DEPENDENCY = NO
> +
>   # busybox installs in /bin, so we need tar to install as well in /bin
>   # so that we don't end up with two different tar
>   #
> diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
> index fde8e464f9..f16a784966 100644
> --- a/package/xxhash/xxhash.mk
> +++ b/package/xxhash/xxhash.mk
> @@ -10,6 +10,9 @@ XXHASH_LICENSE = BSD-2-Clause (library), GPL-2.0+ (xxhsum)
>   XXHASH_LICENSE_FILES = LICENSE cli/COPYING
>   XXHASH_INSTALL_STAGING = YES
>   
> +# The package is a dependency to ccache so ccache cannot be a dependency
> +HOST_XXHASH_ADD_CCACHE_DEPENDENCY = NO
> +
>   XXHASH_TARGETS = xxhsum libxxhash.pc
>   XXHASH_INSTALL_TARGETS = \
>   	install_libxxhash.includes \
> diff --git a/package/xz/xz.mk b/package/xz/xz.mk
> index fa4f6dbda9..e295144ed1 100644
> --- a/package/xz/xz.mk
> +++ b/package/xz/xz.mk
> @@ -13,6 +13,9 @@ XZ_LICENSE = Public Domain, BSD-0-Clause, GPL-2.0+, GPL-3.0+, LGPL-2.1+
>   XZ_LICENSE_FILES = COPYING COPYING.0BSD COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
>   XZ_CPE_ID_VENDOR = tukaani
>   
> +# The package is a dependency to ccache so ccache cannot be a dependency
> +HOST_XZ_ADD_CCACHE_DEPENDENCY = NO
> +
>   XZ_CONF_OPTS = \
>   	--enable-encoders=lzma1,lzma2,delta,x86,powerpc,ia64,arm,armthumb,arm64,sparc,riscv \
>   	--enable-decoders=lzma1,lzma2,delta,x86,powerpc,ia64,arm,armthumb,arm64,sparc,riscv \
> diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
> index a2da0dd479..575bb2c838 100644
> --- a/package/zstd/zstd.mk
> +++ b/package/zstd/zstd.mk
> @@ -12,6 +12,9 @@ ZSTD_LICENSE_FILES = LICENSE COPYING
>   ZSTD_CPE_ID_VENDOR = facebook
>   ZSTD_CPE_ID_PRODUCT = zstandard
>   
> +# The package is a dependency to ccache so ccache cannot be a dependency
> +HOST_ZSTD_ADD_CCACHE_DEPENDENCY = NO
> +
>   ZSTD_OPTS += PREFIX=/usr
>   ZSTD_OPTS += ZSTD_LEGACY_SUPPORT=0
>   ifeq ($(BR2_PACKAGE_ZLIB),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
