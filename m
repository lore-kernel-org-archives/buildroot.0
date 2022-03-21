Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D928C433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 21:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1E9260FC0;
	Mon, 21 Mar 2022 21:17:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Po22KArUrAQ; Mon, 21 Mar 2022 21:17:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3DB260FB2;
	Mon, 21 Mar 2022 21:17:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 32B461BF239
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FD8140A65
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:17:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 681O9cKduv0b for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 21:17:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B386A40A30
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 21:17:45 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id q22so127027edb.5
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 14:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=L1kMEIYBy7DCWx4mMcYAiVDuNJ6CysurouppKYDKMxY=;
 b=bvOkbQSTZYwE7WiyTN6SpUca9SVeD5KpknKLQ06g08He/ilf5jGuDJgwI204ZEluhh
 CvME0UU3MrLql18TMNjQuBYnI3awYELfNdnlbbHblaMmG/FlOCc5DV6EByw7zEeUzLIt
 Ogj82ZgI1Pja3Chb+ulmtk2s7qsCaUeSaTxkyofizGtrCxNAlz1aoK1WIwZ+R0kRntIj
 A4dl94wDiGZCxC1mdJasdTdnbs/c+FGTA4B6Zu47X9IoXJEDtfe1QQjWWoxBjrfUNLcf
 5wBdXw0IAUurLX8H8cRtNiKNwWrTBedkIBNcouqAhaQr1uUlfZ3nS+G1nG5ueXem7Se2
 VswA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=L1kMEIYBy7DCWx4mMcYAiVDuNJ6CysurouppKYDKMxY=;
 b=EbCfdCr4quphVMAIXjOb1lRSumec1fQhcKi7yhreSQDZZ6Yb8+SvYBSty44RZwEtI1
 t7SEt/LyqGEdh4xqF3P7/IIgTlITtfZcYqxG+PGcDNmRh4yCbQpIQ6LVyTGkOvr6inFt
 hvKM4PIR8IJw9Vst8Lsb4Nk1zz5kL9+jJsy7QWk7lfidz/6w09d3f9NixZNCT9F+SdK4
 kEsydWrmns/Hn563KKhIUvMH5yMtGkbYE0K0uTkYpJRpReiatdUiiuKk+F+ZkArtSguC
 mCocCr4b1In6lHvNnEpuyvGb7h3S0TbNzmgoVJCQgrd872S8vP6UFBOVjuUyvT36Sglp
 XV2w==
X-Gm-Message-State: AOAM531OZihmfEVJVULoqCLongkvvqSYAvUgWas1h56Qlx39lrXQxgSJ
 ihAHdfHiyKrEH88KZ9x9usUhhw==
X-Google-Smtp-Source: ABdhPJwWyKbK4Yfc9dfAWbySwaxtakY9YTMsatqgPtKXF9HEa4BSl8pfi9letPpQfDM6uMgJ9hw26g==
X-Received: by 2002:a50:cf48:0:b0:415:df40:9e3d with SMTP id
 d8-20020a50cf48000000b00415df409e3dmr24575894edk.185.1647897463953; 
 Mon, 21 Mar 2022 14:17:43 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 22-20020a17090600d600b006dfbc46efabsm4300799eji.126.2022.03.21.14.17.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 14:17:43 -0700 (PDT)
Message-ID: <32557300-c9ef-288e-46de-ed6f5bce6357@mind.be>
Date: Mon, 21 Mar 2022 22:17:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220313092148.353432-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220313092148.353432-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/bind: reorder openssl variables
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/03/2022 10:21, Fabrice Fontaine wrote:
> openssl is mandatory since bump to version 9.16.26 in commit
> 8adeaec8afacbc680edebae91524f6144926ac92 so move openssl variables in
> the beginning of bind.mk instead of keeping them in the middle of the
> file. Moreover, drop "BIND_DEPENDENCIES += host-pkgconf zlib" as
> host-pkgconf is already mandatory
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   package/bind/bind.mk | 19 ++++++++-----------
>   1 file changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/package/bind/bind.mk b/package/bind/bind.mk
> index 5ddf7652eb..e0c81152e1 100644
> --- a/package/bind/bind.mk
> +++ b/package/bind/bind.mk
> @@ -28,7 +28,8 @@ BIND_TARGET_SERVER_SBIN += dnssec-keyfromlabel dnssec-signzone tsig-keygen
>   BIND_TARGET_TOOLS_BIN = dig host nslookup nsupdate
>   BIND_CONF_ENV = \
>   	BUILD_CC="$(TARGET_CC)" \
> -	BUILD_CFLAGS="$(TARGET_CFLAGS)"
> +	BUILD_CFLAGS="$(TARGET_CFLAGS)" \
> +	LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
>   BIND_CONF_OPTS = \
>   	$(if $(BR2_TOOLCHAIN_HAS_THREADS),--enable-threads,--disable-threads) \
>   	--without-lmdb \
> @@ -36,14 +37,17 @@ BIND_CONF_OPTS = \
>   	--with-randomdev=/dev/urandom \
>   	--enable-epoll \
>   	--enable-filter-aaaa \
> -	--disable-backtrace
> +	--disable-backtrace \
> +	--with-openssl=$(STAGING_DIR)/usr \
> +	--with-ecdsa=yes \
> +	--with-eddsa=no \
> +	--with-aes=yes
>   
> -BIND_DEPENDENCIES = libuv
> +BIND_DEPENDENCIES = host-pkgconf libuv openssl
>   
>   ifeq ($(BR2_PACKAGE_ZLIB),y)
>   BIND_CONF_OPTS += --with-zlib
>   BIND_DEPENDENCIES += zlib
> -BIND_DEPENDENCIES += host-pkgconf zlib
>   else
>   BIND_CONF_OPTS += --without-zlib
>   endif
> @@ -76,13 +80,6 @@ else
>   BIND_CONF_OPTS += --with-libxml2=no
>   endif
>   
> -BIND_DEPENDENCIES += host-pkgconf openssl
> -BIND_CONF_OPTS += \
> -	--with-openssl=$(STAGING_DIR)/usr \
> -	--with-ecdsa=yes \
> -	--with-eddsa=no \
> -	--with-aes=yes
> -BIND_CONF_ENV += LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
>   # GOST cipher support requires openssl extra engines
>   ifeq ($(BR2_PACKAGE_OPENSSL_ENGINES),y)
>   BIND_CONF_OPTS += --with-gost=yes
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
