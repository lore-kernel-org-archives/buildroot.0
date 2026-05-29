Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEADACD6E4C
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C46A780E3D;
	Fri, 29 May 2026 08:29:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ozx34x7teqmG; Fri, 29 May 2026 08:29:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0D7680E3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043364;
	bh=Nj4fXpgozYf7hMbMYvidb01mabz5VOXM3wcFTfDtxkI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hk0xjMxjhLoisFrKhIdP1jfPN77N55OHC82qj3Sg6v5alyUsMhOfDz8BeEL3+9aKr
	 RStVsdEoI0uDaN584OAmpPOaZYvSj4b3sws5MH97UTykyBpml0oAJJZaHjQ9oGlofJ
	 xBFF+j616dEoyaBpmGMeF2MeO6LdPaRsPet2y3QzFEyIiyykzhdyQZj1t2Inc0Sf50
	 WjPe30cEJWe76kgekGlV8pt0O7Z0oaZXLJuF9TuFuDB1z7L7J76r5FPiFw5Kx9xAvi
	 Y8kYO8KcpNzIQH9sbGYZHrcmTKgGkVbIYJz3cHEia2TlgKen7B0iajMBaxuTXrhWWP
	 siCJiP8aD2AwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0D7680E3F;
	Fri, 29 May 2026 08:29:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 78A9028E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6585B42234
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rd5JqOY70eup for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:29:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A806142222
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A806142222
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A806142222
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:18 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-459bf19e87bso8248557f8f.1
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043357; x=1780648157;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nJz1rr8csdPkFrJIGrge0SEAgRemn7t36HFCLbjGWx0=;
 b=ZuYIl2AWfc+mxzgymY8rKn2WGmMdPVodxeJDb2AjZnkw+T33MV0bKX/vGyX9DGDHrj
 x5mMbvx0xT8IHNlz3dL2/cayuAGIVzNg7OjU+WQXgkZ88khpkRstb3Em7lpYCP71tpAE
 z3yE4ihimmT5urb04vR8A5DFcU+xxbbzplPP8ldFe+YfJhEWWMzSs7A4JX+BwGWRVZ2A
 4oXiwjira1gAxlEO3Q/kuh86eOZr8mWwZCZC9SVq7inK9N3lOAhnz2/BXcOJJunJSQRe
 1Hrb540gt8t11Tj/DmFFT+kuNaFu36BgeoQIrNDPfWLW5J+jV4WvGbql4ut6ao8Kh3Ug
 ZG0g==
X-Forwarded-Encrypted: i=1;
 AFNElJ8VsI7oQ0FaGdFptpYHPQVr7hu08ZKC1WR1AZCt9dJFoKP4sq/PIa3Zutde7NDnxZ0kadq+cIl8apQ=@buildroot.org
X-Gm-Message-State: AOJu0YwPOssryXbUlaxm8RaLPWdgbt19CGW/fiWtQQN8C9yxTNcyhM0a
 z36gUJQzkqtrC39LtnXy7+uybxsf3MA8KJ3a3EQmHIzw8pw1y8B5faW83+20LC6HVvs=
X-Gm-Gg: Acq92OEQ1Sj2Esx9JZUc7gjrg5W+w3xNm1yRLHtJfl9ZmX5Q1EW32H+uwAKzs4L7vlk
 HbEdFAisF8KpTVEVaGqn00nTVaSbLrUT3DNDA/JuPQlL5wHBw0cxG5Teiu69tFvCW5qEhPse4Ja
 NM0C+D1CfsGFf7eyprWVKwiJV8ZOOaU7E3ykhb969bzTQOLsN4uw5ZQ/CN5/4uzdE5VeiJ/ABkV
 IArAVOeY++S5cUR4ZCy1ioEj+YJpHqMW8Ukw2CAubi9uiJKONigCF2LSRxjHVL6j0WbypL8z1IM
 I5GD9WxNwjWE/wBdlKgx950T4AtxVIKEvyR19we+o2yoh/wHzfu82cr5tz9YVIwr29PU6moMuaP
 ZQzDtho1ttIenN1w4VfiXh3+082t63Z/CbAXzBFTauRHNWm8TGbo/mQt7V+cMzrxV/cnFX7E8Rg
 GuJLNSqHCO3tQDjgo2RlnfqtqrB0shWDmZHurbKAt3IClQk/3QM34JZTUNLw==
X-Received: by 2002:a5d:5241:0:b0:45e:779a:302c with SMTP id
 ffacd0b85a97d-45ef14721b1mr2587591f8f.29.1780043356465; 
 Fri, 29 May 2026 01:29:16 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34bd896sm1900716f8f.14.2026.05.29.01.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:29:16 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:29:15 +0200
Message-ID: <20260529082915.57186-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260307185425.729667-1-bernd@kuhls.net>
References: <20260307185425.729667-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043357; x=1780648157; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nJz1rr8csdPkFrJIGrge0SEAgRemn7t36HFCLbjGWx0=;
 b=QpzeZvjBJXIAeC+sYPXXLqzM7UogJsj60YyVXVtOrLBzp+QYwusdqsBAgY61oe5/ov
 sd2vnnwE3mD8+y1+szRxnRkmEMv/8LQP5+pblFK1PPJNet/gsOM0jRXe5ZpkB5XAAS13
 s2/TEDFcFysVFEbiOCKQ38QvEsVOVS9AdGjXU9/fjMQzfFKiYpjZ7uHxQ/PE4zrypwwL
 p8XBa2ybXJ9tb8ZfuIZUr/XsPj1dy3XB5Q5mgQKvmUfQbnzA8xxAcS3dstm6KRuFVEmM
 uFXZVJeaZXVJMK96uTLRLLA/YogYnpUfe93XMi08axP2ayKHfNXbIzLRCcUx5eaFCi70
 jq0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QpzeZvjB
Subject: Re: [Buildroot] [PATCH 1/1] package/libheif: needs gcc >= 10
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Fixes build error with gcc 9.x:
> 
> output/build/libheif-1.21.1/libheif/nclx.h:128:50: error:
>  'bool nclx_profile::operator==(const nclx_profile&)
>  const' cannot be defaulted
> 
>  using this defconfig:
> 
>   BR2_arm=y
>   BR2_TOOLCHAIN_EXTERNAL=y
>   BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
>   BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
>   BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-static-2020.11.2.tar.bz2"
>   BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
>   BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
>   BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
>   # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
>   BR2_TOOLCHAIN_EXTERNAL_CXX=y
>   BR2_STATIC_LIBS=y
>   BR2_PACKAGE_LIBHEIF=y
> 
> According to https://github.com/strukturag/libheif/issues/1615#issuecomment-3457979167
> gcc >= 10 with support for C++20 is needed for the package.
> 
> The failing code was introduced upstream in version 0.21.0 with commit
> https://github.com/strukturag/libheif/commit/a62f933e380e165dc2c12a879d0ceed1529b3efa
> which was added to buildroot with commit
> a8aed698c706ec534ddc41cdce651c18016c28ca.
> 
> Also removed -std=c++11 from CXXFLAGS.
> 
> The build error was not yet recorded by the autobuilders.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  package/kodi-imagedecoder-heif/Config.in | 6 +++---
>  package/libheif/Config.in                | 6 +++---
>  package/libheif/libheif.mk               | 1 -
>  3 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/package/kodi-imagedecoder-heif/Config.in b/package/kodi-imagedecoder-heif/Config.in
> index f41b164ff4..d77f10ee98 100644
> --- a/package/kodi-imagedecoder-heif/Config.in
> +++ b/package/kodi-imagedecoder-heif/Config.in
> @@ -3,7 +3,7 @@ config BR2_PACKAGE_KODI_IMAGEDECODER_HEIF
>  	depends on BR2_INSTALL_LIBSTDCPP # libde265, libheif, tinyxml2
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libde265, libheif
>  	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730 # libheif
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # libheif
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # libheif
>  	select BR2_PACKAGE_LIBDE265
>  	select BR2_PACKAGE_LIBHEIF
>  	select BR2_PACKAGE_TINYXML2
> @@ -12,7 +12,7 @@ config BR2_PACKAGE_KODI_IMAGEDECODER_HEIF
>  
>  	  https://github.com/xbmc/imagedecoder.heif
>  
> -comment "kodi-imagedecoder-heif needs a toolchain w/ C++, threads, gcc >= 4.8"
> +comment "kodi-imagedecoder-heif needs a toolchain w/ C++, threads, gcc >= 10"
>  	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730 # libheif
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_10
> diff --git a/package/libheif/Config.in b/package/libheif/Config.in
> index 0ae86a07f4..9e88fb826d 100644
> --- a/package/libheif/Config.in
> +++ b/package/libheif/Config.in
> @@ -2,14 +2,14 @@ config BR2_PACKAGE_LIBHEIF
>  	bool "libheif"
>  	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730
>  	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	help
>  	  libheif is an HEIF and AVIF file format decoder and encoder.
>  
>  	  https://github.com/strukturag/libheif
>  
> -comment "libheif needs a toolchain w/ C++, threads, gcc >= 4.8"
> +comment "libheif needs a toolchain w/ C++, threads, gcc >= 10"
>  	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730
> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
>  		!BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
> index acd302d847..c4196f9353 100644
> --- a/package/libheif/libheif.mk
> +++ b/package/libheif/libheif.mk
> @@ -11,7 +11,6 @@ LIBHEIF_LICENSE_FILES = COPYING
>  LIBHEIF_CPE_ID_VENDOR = struktur
>  LIBHEIF_INSTALL_STAGING = YES
>  LIBHEIF_CONF_OPTS = \
> -	-DCMAKE_CXX_FLAGS="-std=c++11" \
>  	-DENABLE_PLUGIN_LOADING=OFF \
>  	-DWITH_AOM_DECODER=OFF \
>  	-DWITH_AOM_ENCODER=OFF \
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
