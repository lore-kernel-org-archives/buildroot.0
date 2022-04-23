Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D992C433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 15:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 386D360AE5;
	Sat, 23 Apr 2022 15:24:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3L0SQg8ZdYxM; Sat, 23 Apr 2022 15:24:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30AFD60750;
	Sat, 23 Apr 2022 15:24:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E49761BF421
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D121B419C9
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:24:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kzz12PLLuWL0 for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 15:24:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 61E9341554
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 15:24:51 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id g13so21664136ejb.4
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 08:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+kVWjRTGGwEPJEQyaUSXfwvitegVW5H8THbkPnLY4nM=;
 b=AFago1YQI/dW5HsufbtS83BsK6YHG115/ePhFa4juvY5DeWaaI2s77EP/0s/MQUpv/
 MRWDGkV5vvSxT0mqw2RnD/Va55jUCcyF8lcgn+0ASxWPsTue0bbFM1cgRrwMyMUaIelJ
 VPT5CRwdThBU981xgCsd/7FDsLumSEjt0Z3JmyZeXAKZPM4zCnV7vHh+DWXsAr+haLOt
 EGmsDZoRn20K/ZVxD4qVa5hgscSp6d0DVQQxaDQU74iloLjJ2acB4jk+sUCIbcQU/KgU
 BnGoAYDgfJTrVBCRo8QnKJAQ543FQoOfaLva7wE/4K72suMpkjXBHqlzYBVS3QK6ivsQ
 eVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+kVWjRTGGwEPJEQyaUSXfwvitegVW5H8THbkPnLY4nM=;
 b=mFSOBrLHyF5O7wPB1SAQgXMgh+MajFZYAMDzAtAir6tiSkPkxSuqEUmQPW7DQrp6/9
 EyfvcvSNxcHlKP+uO6mx/rnF2VZ9xKw35kZ21eILogrXurdcx297+qxTocRM30L0tSHy
 6hW4kvKKl5DHKzaC7kF4R9gDE6F5UOH3FBXbrLdCU706y/KUGcwWRUv6K1btj5Diyiz1
 xBmoxB6E5Lr1M+35C+Amrlgm/2uEypMZdfsfgz+hRNr8eH7inQ4zSjqC3QSwWMQIZ+sO
 +BtbRBKRBZSgEDQhRT7cp25lW5hnNxcibaQMLk0qV/a+B6vxznYecFf7rI+Tb4cb8pqM
 oKAw==
X-Gm-Message-State: AOAM531WMT7mVFXJkw3G/FP8KjE+U9ZyYEynGQZVCNJNFZlsTkZdfgu7
 2eLvNF3+PuAOMERXrg99WXARag==
X-Google-Smtp-Source: ABdhPJyYCLx3wCCfP0/2yQ3Hm9uUXE+t6MAfCEy+GutGcG8K/9Z79359qAU2s8YIZcGuNzapx3kTTQ==
X-Received: by 2002:a17:907:720d:b0:6f0:fa7b:fca1 with SMTP id
 dr13-20020a170907720d00b006f0fa7bfca1mr7806508ejc.514.1650727489447; 
 Sat, 23 Apr 2022 08:24:49 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 y19-20020a056402359300b00423e51be1cesm2310736edc.64.2022.04.23.08.24.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 08:24:48 -0700 (PDT)
Message-ID: <fccdd803-90e8-615c-9230-d79d6d291ceb@mind.be>
Date: Sat, 23 Apr 2022 17:24:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220420081939.295448-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220420081939.295448-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/wolfssl: all features needs
 dynamic library
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Jianhui Zhao <zhaojh329@gmail.com>, Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 20/04/2022 10:19, Fabrice Fontaine wrote:
> Add dynamic library dependency to BR2_PACKAGE_WOLFSSL_ALL to fix the
> following static build failure with ibrdtnd, a "wolfssl all"-enabled
> libcurl and openssl:
> 
> /nvmedata/autobuild/instance-5/output-1/per-package/ibrdtnd/host/opt/ext-toolchain/bin/../lib/gcc/sh4aeb-buildroot-linux-musl/11.2.0/../../../../sh4aeb-buildroot-linux-musl/bin/ld: /nvmedata/autobuild/instance-5/output-1/per-package/ibrdtnd/host/bin/../sh4aeb-buildroot-linux-musl/sysroot/usr/lib/libssl.a(ssl_ciph.o): in function `SSL_COMP_get_compression_methods':
> ssl_ciph.c:(.text+0x25ac): multiple definition of `SSL_COMP_get_compression_methods'; /nvmedata/autobuild/instance-5/output-1/per-package/ibrdtnd/host/sh4aeb-buildroot-linux-musl/sysroot/usr/lib/libwolfssl.a(libwolfssl_la-ssl.o):ssl.c:(.text+0x1ca60): first defined here
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/be1d327ed4c91a6280a88906a399dfe146f0b64e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libcurl/Config.in      | 5 +++++
>   package/libuhttpd/Config.in    | 3 ++-
>   package/libuhttpd/libuhttpd.mk | 2 +-
>   package/wolfssl/Config.in      | 4 ++++
>   4 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
> index f2ddce6e81..84ad18211a 100644
> --- a/package/libcurl/Config.in
> +++ b/package/libcurl/Config.in
> @@ -78,8 +78,13 @@ config BR2_PACKAGE_LIBCURL_MBEDTLS
>   config BR2_PACKAGE_LIBCURL_WOLFSSL
>   	bool "WolfSSL"
>   	depends on BR2_PACKAGE_WOLFSSL
> +	depends on !BR2_STATIC_LIBS # wolfssl-all
>   	select BR2_PACKAGE_WOLFSSL_ALL
>   
> +comment "WolfSSL needs a toolchain w/ dynamic library"
> +	depends on BR2_PACKAGE_WOLFSSL
> +	depends on BR2_STATIC_LIBS
> +
>   endchoice
>   
>   comment "A TLS library is needed for SSL/TLS support"
> diff --git a/package/libuhttpd/Config.in b/package/libuhttpd/Config.in
> index 97fc984ea0..a552a88f0c 100644
> --- a/package/libuhttpd/Config.in
> +++ b/package/libuhttpd/Config.in
> @@ -3,7 +3,8 @@ config BR2_PACKAGE_LIBUHTTPD
>   	depends on BR2_USE_MMU # fork()
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>   	select BR2_PACKAGE_LIBEV
> -	select BR2_PACKAGE_WOLFSSL_ALL if BR2_PACKAGE_WOLFSSL
> +	select BR2_PACKAGE_WOLFSSL_ALL if BR2_PACKAGE_WOLFSSL && \
> +		!BR2_STATIC_LIBS
>   	help
>   	  A lightweight and fully asynchronous HTTP server
>   	  library based on libev
> diff --git a/package/libuhttpd/libuhttpd.mk b/package/libuhttpd/libuhttpd.mk
> index b8cf935d01..0d5306c6dd 100644
> --- a/package/libuhttpd/libuhttpd.mk
> +++ b/package/libuhttpd/libuhttpd.mk
> @@ -18,7 +18,7 @@ LIBUHTTPD_CONF_OPTS += \
>   	-DUSE_MBEDTLS=OFF \
>   	-DUSE_OPENSSL=ON \
>   	-DUSE_WOLFSSL=OFF
> -else ifeq ($(BR2_PACKAGE_WOLFSSL),y)
> +else ifeq ($(BR2_PACKAGE_WOLFSSL_ALL),y)
>   LIBUHTTPD_DEPENDENCIES += wolfssl
>   LIBUHTTPD_CONF_OPTS += \
>   	-DSSL_SUPPORT=ON \
> diff --git a/package/wolfssl/Config.in b/package/wolfssl/Config.in
> index 3c6d68f592..3a97125e8d 100644
> --- a/package/wolfssl/Config.in
> +++ b/package/wolfssl/Config.in
> @@ -13,9 +13,13 @@ if BR2_PACKAGE_WOLFSSL
>   
>   config BR2_PACKAGE_WOLFSSL_ALL
>   	bool "enable all features, except SSLv3"
> +	depends on !BR2_STATIC_LIBS
>   	help
>   	  Enable all wolfSSL features, except SSL version 3.0 support.
>   
> +comment "all features, except SSLv3 needs a toolchain w/ dynamic library"
> +	depends on BR2_STATIC_LIBS
> +
>   config BR2_PACKAGE_WOLFSSL_SSLV3
>   	bool "enable SSLv3"
>   	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
