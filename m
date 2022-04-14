Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64085C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 19:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB8054186E;
	Thu, 14 Apr 2022 19:29:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e1H7Y7wkW_ao; Thu, 14 Apr 2022 19:29:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5ED8941862;
	Thu, 14 Apr 2022 19:29:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 876C51BF319
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7513440993
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:29:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 604JP5JDK2WZ for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 19:29:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 670A0404D7
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 19:29:13 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id u18so7624712eda.3
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 12:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=BDF5k6hsYWWxOzd+OqEw0LthmQXwBaeUhHPNB60wzwI=;
 b=DZXvgHqZM1x/kWWCJoavs0seLTFuK9j6JmjY/qZOnwgzQDSrIj/VbEwq6R0cgtLB4I
 MXZGuTWfpx8td9NH4tGPmEM2GE51xD1OMOBD+N3/GW8o/xSQpYdaXJJhpZ9FCHp4oBdI
 nUzdLfyLamrYHbKNiaf/4cI5qZOxveX7yjacDeA0GgpOgDQ56Gv4RMyzD8CKIymGFsQp
 ogsTL+jnlKpXclELYGXR+pyBYrm/Sg0SgEMxvXsvcxqwcqyJI6aXBfQZqI4+hqCKGjun
 xTuuLTGUW0WCIeGlLbuYH7OM29yZsqcmG6hENwfe0sYi4GhMayWJ1EDq2sU3r5wD1+uw
 sxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BDF5k6hsYWWxOzd+OqEw0LthmQXwBaeUhHPNB60wzwI=;
 b=3buq12GJcrFnr2YNgFerYbHdPQmDidizVF+2McVur/7YRaH6kzGvu4dt0Atz+mReBW
 1+dK2sCgoQCBtc8M8fyyB//31KqQjvaskz3+spDeKFt06cSBITwNtxNGMbrgtqxnrEMh
 VUuY56fqc5Ljf9k1Ahlb1h5v2D1okhcIzR+CnpenbnKq2WtaXntoQ+pwqI527BodC2CC
 N1e4j8faEylOZQbfF0Am4yymcyE0L7xAjEeX5+hboaD4TOW1FZXFi/ok8ioRaUtO9UMm
 qqibajtnyEowzFPAxF2q8HmG6GIxyjLw+G0TyQW+508pHHOC7paujJKX9WC+V4SszHGU
 2eOw==
X-Gm-Message-State: AOAM531uIuabgu21kAp+KC2o+69JWF2L76nDBcrodwZJmW6QSUohS0Sx
 N6rNCgDITbLehWsqlviLBrBjUhKlb3WCWQ==
X-Google-Smtp-Source: ABdhPJxfxPwtzmDnQHkuj5Dm8vr1RJnFHKITVnh0J+vqjglZ1NnJdzw84bu7pXGwgLegYL2MIQSISA==
X-Received: by 2002:a50:e696:0:b0:419:998d:5feb with SMTP id
 z22-20020a50e696000000b00419998d5febmr4785450edm.122.1649964551516; 
 Thu, 14 Apr 2022 12:29:11 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a170906c08400b006e82dbd3f6esm935587ejz.116.2022.04.14.12.29.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 12:29:11 -0700 (PDT)
Message-ID: <0fc56a0d-7d91-33cd-8f0d-24443d699171@mind.be>
Date: Thu, 14 Apr 2022 21:29:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220406194148.39490-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220406194148.39490-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libressl: bump to version 3.5.1
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



On 06/04/2022 21:41, Fabrice Fontaine wrote:
> This bump will fix the following build failure with pure-ftpd thanks to
> https://github.com/libressl-portable/openbsd/commit/f5674b4e2330b382bacefd3393affc8eb2ee2ba8:
> 
> tls.c: In function 'tls_init_options':
> tls.c:329:5: warning: implicit declaration of function 'SSL_CTX_set_num_tickets'; did you mean 'SSL_CTX_set_options'? [-Wimplicit-function-declaration]
>       SSL_CTX_set_num_tickets(tls_ctx, 0);
>       ^~~~~~~~~~~~~~~~~~~~~~~
>       SSL_CTX_set_options
> 
> https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-3.5.0-relnotes.txt
> https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-3.5.1-relnotes.txt
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/f5d36180949278510199aa499e253780558c6ffe
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Since this is indeed a development release, I've marked it as Changes Requested.

  Regards,
  Arnout

> ---
>   package/libressl/libressl.hash | 2 +-
>   package/libressl/libressl.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
> index e923998713..5474d8e537 100644
> --- a/package/libressl/libressl.hash
> +++ b/package/libressl/libressl.hash
> @@ -1,4 +1,4 @@
>   # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
> -sha256  ff88bffe354818b3ccf545e3cafe454c5031c7a77217074f533271d63c37f08d  libressl-3.4.3.tar.gz
> +sha256  a7d0026f67622275ec8f8239ded422a653d5ccc84df55dea2acd406017185608  libressl-3.5.1.tar.gz
>   # Locally computed
>   sha256  5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
> diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
> index 0bb468cedb..81b0163b93 100644
> --- a/package/libressl/libressl.mk
> +++ b/package/libressl/libressl.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBRESSL_VERSION = 3.4.3
> +LIBRESSL_VERSION = 3.5.1
>   LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
>   LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
>   LIBRESSL_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
