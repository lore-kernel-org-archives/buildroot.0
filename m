Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8693105F79E
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 07:54:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D40960F4C;
	Sat, 14 Mar 2026 07:54:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Wy4j9Sumshq; Sat, 14 Mar 2026 07:54:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FFA060F72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773474860;
	bh=5uqnJ3KvcQbbIvhkp4d3t8s/4GNLUGgOqtMS8nw8vwE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Cm/A7UknA9Px7WU0voB+b68hwoaFlDushgR6ziQVM6l1wheqnfwH7FpYdRzmTP6qo
	 xlHqYNSDZsabuCaMJqkL2X7Sqk0JiLYxdKTVqu6A3UfUz9/Yj0rU1qwcMP9P8Z5Vcp
	 2Ywp+ZlEgddy9MFbH6FJDHoR93bxOLlnOiST8Bg37acJYNq/r226twOgSx7n4ucgLN
	 7wnqRKc/yzgVZli4nN5fe+gZJQMGIpaX4WNrPR7b1YJYlIQBmV0aptA3O1NfI6t+4z
	 yX7KY+EBO/+iqzbWqcwR1u6xeWcwp4IBu+Qjse7PFp2ih7OAOadbi59K3k0bknfQam
	 5xgMvh0OVVyrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FFA060F72;
	Sat, 14 Mar 2026 07:54:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 15C81201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F013F400A2
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:54:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id as6NLCcxUhBl for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 07:54:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BE53940135
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE53940135
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE53940135
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:54:17 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-439b9cf8cb5so3322305f8f.0
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 00:54:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773474856; x=1774079656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=T87jZAQxVQU2iZszkc5yvrgxnV8WLjTpIGaQ8oF5VcQ=;
 b=jMWadyDfgUDes67c7aqUhyOKYiRSj5Yiw78IdtPgXvu2hblcB2HyYsZL2IwSoaAjkl
 vV6HSQR7Pi7r2mGe3PvDqJ34QKvv/nkX1HQ1SuGCV6KqqYGdYuQy3CVzYEjxUPYCDTy3
 5XIzffg1Lcp+Nivg4sjo1ybbFxkeGKuPmgjlUl4nOWju5C/dktc7JSIjXJS27JG3u5aw
 HRRnAFnuDmPUyldfxrNn+Y33zyfQdnXOyCkfMnOiiTTJv9xtP4eD8SgOiaFbWtWX0gCA
 wBN8wyylnZ42LP/0ufq0Uem21Lfp1qNutKHXOy5vF09FH8KJyWaecQWLS3o80a1al3Mr
 AVSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVI6kvYgwFjirhQv9xqopT5Vi42CggYZKZFZdEALxWNCxMZQ8tQMpGs6XVgg4vkE3jauQtuW3psiFg=@buildroot.org
X-Gm-Message-State: AOJu0YzJqZ3yuqjwr5gDNmnJdgWA2pG3HgUQltUbTmZttq5+LsZ7Cl5V
 v8wI4UwST9omEoKBM6fjpB5qIXDG5ULPnYC355Xvh1vyC/tmCkTKCBiXgMevuzkhGNAwPOrWk3U
 KEhLq
X-Gm-Gg: ATEYQzxJueaz6hc7GiK2UlL2jWL8Em/jXkx5HKaDE0RQxWLiDPwiKSTcGu2QdzGTo1B
 utdY568VXG2tGAExDIn3xJcJhReWHkNnGx5FRoa0KywsaB0GGBh8M5FidHHP7zzY/fF8gCyV6Pb
 xFrLii9iW/IjjRNnTrhyW41RgNPfLM9L/FO9dQLa4tix2dmdV5IaK9SQeNM5IhIKCIkLUeanElb
 HcdZSTCLaGpvi+4k1iAnNl8L9ACc2ifn+WhoETLP5/2TllHvdIxnMqSPoLnB48gvAZcgJ5X4Xwn
 RFZZzwWP5vcx+QAD4wChon/uiR4WItIJRq297+DUiXfSUzRGJsXDj/jzrP5MabAYDntOBvnrTVA
 jUwNS1AvdBsSjpn34jkUUDJpf2qoGJ/pXrjiQS0Q1Em9iDLKLTULuMaCN9+HJh9fIP0aJtEWOEu
 laUuSpE96WOBlmzTw=
X-Received: by 2002:a5d:5e01:0:b0:439:befa:91cb with SMTP id
 ffacd0b85a97d-43a04dc0958mr10760430f8f.45.1773474855517; 
 Sat, 14 Mar 2026 00:54:15 -0700 (PDT)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe22e9ddsm21952261f8f.37.2026.03.14.00.54.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Mar 2026 00:54:15 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 14 Mar 2026 08:54:14 +0100
Message-ID: <20260314075414.15484-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260307185425.729667-1-bernd@kuhls.net>
References: <20260307185425.729667-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773474856; x=1774079656; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T87jZAQxVQU2iZszkc5yvrgxnV8WLjTpIGaQ8oF5VcQ=;
 b=QTC/1eS4BC2SU4qHN/l9P9LwrMdlYl5xgQpXGNeiNRDW+6iDGbPgf6d2MzheQ+lWgb
 bA7AnirLCDtYsqtGAOHfb71mD8ldtcAqb41S5ItycfCWwo0JrkJ7oyinuB/1o1MwuYRD
 V+GQMbtkpLi0KvCsAJ72bX+sHfp4VhJufP8Ss5HVZW7RzjVnIeo5dbfGw6q9GaAIEf6G
 SDh7ZV+BbCa+3wK8DvV11djkHxyFmIbQL6E2tdCVygcM7uFQ+prPB0kEGTr7ynu3TOQy
 Y0v5eNOcoPS5CnjNhBYkst7D30a9kJtJBN22DFXTV7hpxtoSkogI7T5RecO3LT/9Xthm
 kA9A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QTC/1eS4
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

Applied to 2026.02.x. Thanks

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
