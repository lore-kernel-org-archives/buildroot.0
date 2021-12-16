Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBC7C433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 19:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA4C140017;
	Thu, 16 Dec 2021 19:36:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HhgVBN4TcoRO; Thu, 16 Dec 2021 19:36:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B921F40399;
	Thu, 16 Dec 2021 19:36:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 017261BF3A9
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F27D860EB9
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:36:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 37b2E_C1Cu8q for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 19:36:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C0EDF60E2F
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 19:36:47 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id y12so89899931eda.12
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 11:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MXNn3UqMOwHC7PeMJNmiCr1mmGWRM0mDFrobysBbJ/k=;
 b=UIFHN0zPx6g2kAefZJJWlPvPBgb4hOaQaA7hXUTrA1OT0V/f5hU5CvAjSg/rhU8qCp
 yb+Iyo/2JEPK3T8WeNhDUJDCLYwecxFF8Q675nZ5ETEIYiWZZqDWgiMuuxi87DkvjN5v
 +q3Bof3HmJ/8sR4ObmPSYgMWc9PbceDcaFCg631hil7mPl5aoHajZcF4L9u6iDR+b67K
 3XysXs5HIjnpyE4DKZCJno/vGLjKtBEx3eCQkON9lSjYIg/hkvYEHH+NwlCwHaeLxxr5
 e1ra3j/PVITyJ0XovARcCyKVzElPKoqqXKc55mVlJemV6/1W8H5DZ5UiWva1Cl0JwCao
 uwMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MXNn3UqMOwHC7PeMJNmiCr1mmGWRM0mDFrobysBbJ/k=;
 b=DsH5ggNd0r2J12jP6L5A4LATy1p60Olgqm4d2NOIdhvFEA2aYUSAUr2W8afYfb/n02
 COXoEjQE9OjBO0my6O8yz/0vA6zoIQiMyjgauL66pfSpkAzG4A/CmkmkxPA/S6dF0FM6
 fW5jjT4bqrXqI+AAcG+dvie8YufWS9wzk4loIuYstRRtEumdPagz9Y5NUZbIXUa/bICf
 FE6fTq/5KJn3PxIcOL8GdXY5zWimhFDDhDhwj6MuPzKIvaOgSHPkw7B/2zW7tllfnjxO
 j/zUK+9XFtayralZ95qatUOkOjvL9wzJdJxX7KHEldB+R3O/UaO1TX63MN4jeaP7CZCj
 dYaw==
X-Gm-Message-State: AOAM5314A4p+3D5/Vp6iGCSaZqEHiTJdCStAyd81/gRjsxYgCKivWuTh
 iBoJrTVzHzvLixJy2TZcDqhvfCVaoa2DqA==
X-Google-Smtp-Source: ABdhPJyV6/sq7Vgcg8iXjiAPo4ppzbm9YfxA4NM0lNyip/AqaEfVe+NPasyOEd1e3WLuPDltZ7CLgw==
X-Received: by 2002:a17:907:2da0:: with SMTP id
 gt32mr18007942ejc.711.1639683405882; 
 Thu, 16 Dec 2021 11:36:45 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id i5sm2068829ejw.121.2021.12.16.11.36.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 11:36:45 -0800 (PST)
Message-ID: <fc93c1ae-4323-09bd-38a9-1639b3d71c1a@mind.be>
Date: Thu, 16 Dec 2021 20:36:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20211215203821.14470-1-peter@korsgaard.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211215203821.14470-1-peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH] package/libopenssl: bump version to 1.1.1m
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/12/2021 21:38, Peter Korsgaard wrote:
> Minor bugfix release:
> 
>   Changes between 1.1.1l and 1.1.1m [14 Dec 2021]
> 
>    *) Avoid loading of a dynamic engine twice.
>       [Bernd Edlinger]
> 
>    *) Fixed building on Debian with kfreebsd kernels
>       [Mattias Ellert]
> 
>    *) Prioritise DANE TLSA issuer certs over peer certs
>       [Viktor Dukhovni]
> 
>    *) Fixed random API for MacOS prior to 10.12
>       These MacOS versions don't support the CommonCrypto APIs
>       [Lenny Primak]
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libopenssl/libopenssl.hash | 4 ++--
>   package/libopenssl/libopenssl.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
> index 93c688d9dd..a055cbc270 100644
> --- a/package/libopenssl/libopenssl.hash
> +++ b/package/libopenssl/libopenssl.hash
> @@ -1,5 +1,5 @@
> -# From https://www.openssl.org/source/openssl-1.1.1l.tar.gz.sha256
> -sha256  0b7a3e5e59c34827fe0c3a74b7ec8baef302b98fa80088d7f9153aa16fa76bd1  openssl-1.1.1l.tar.gz
> +# From https://www.openssl.org/source/openssl-1.1.1m.tar.gz.sha256
> +sha256  f89199be8b23ca45fc7cb9f1d8d3ee67312318286ad030f5316aca6462db6c96  openssl-1.1.1m.tar.gz
>   
>   # License files
>   sha256  c32913b33252e71190af2066f08115c69bc9fddadf3bf29296e20c835389841c  LICENSE
> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index f139213315..bd8ef6141a 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBOPENSSL_VERSION = 1.1.1l
> +LIBOPENSSL_VERSION = 1.1.1m
>   LIBOPENSSL_SITE = https://www.openssl.org/source
>   LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
>   LIBOPENSSL_LICENSE = OpenSSL or SSLeay
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
