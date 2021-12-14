Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06696C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 19:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74C664029F;
	Tue, 14 Dec 2021 19:52:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v6fmphns-hkU; Tue, 14 Dec 2021 19:52:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4CEC402B8;
	Tue, 14 Dec 2021 19:52:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EF5711BF5DD
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 19:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBD8660BF3
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 19:52:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fV5jx6TVxuMu for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 19:52:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C45CD60BBA
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 19:52:06 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id v1so67283806edx.2
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 11:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wm3+Yh0NrBwrL/dTB3Swb6cwv70hJgyzlITbRk1jH8c=;
 b=LAFv4dIf+0pO5Fow9FTMW/bkGygQqBlJc4D4dvAgzy5o67NFcjaAEQQBS8Vjy93bpf
 KzXWpFOaOQNkRSS0QCrqUY6lpy8qOmJRkT6IyFzt3y5zVgPgamXgUCb8BQX5IQ9+E5iU
 Hack+AqiaApDqi+EqCzfploPOuev8MBleJHq3f65A72QrLssQvt3R7PboNNKU581gyyi
 sEBpp65Wu5uQ6Axjb9AWxU7o6hNG7TBQESs3HDkR/Wsg8RC/tCHzmGJsRWKRwwPGOobR
 W4uGqDpyJAjXKT0vREKHLZ43LL0ewzAQFoLqZdjOYAEBV/BWo/j245MrnN503/MYFnBN
 Ljkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wm3+Yh0NrBwrL/dTB3Swb6cwv70hJgyzlITbRk1jH8c=;
 b=VnGyxV9Oabv5eQguuFuzl3Ija7sDlruFvIIeqL+I493UGM7k/lhvFVDvLVRxZhJ8nL
 nbLUA2qR05FPYVU768Dp6cO1aElZyGzbRpW2CJlqSAnX1D+sp95EIz0Pl0EKAV7Qt3sJ
 +8BncjwizRZLoY9FL409wNkp1McQEnb+3MlxneG06BmsRcoe+d5tKZ9bdRmE/v3NLlni
 uxzitRyNcVWEZO2Bi9AU+PbMex5VvJYH/zY1C4DgcY8TgWqF+Vbr4jADwJKXsK4NeNqe
 CDA5Edt2O63+OKVbA32KEgNUJPJoKGEGE/1h/2dKtjwSecPmRDbRJXoZeVe8CS1ogQcJ
 qgZA==
X-Gm-Message-State: AOAM5337/1Wo9heMSmuzYr3gtWllmhL3eNY6A9eUWmmd7O/RspABPE4N
 RSvlZaciemS+lmj6ci6Eo+LuX3vHDMQ+vQ==
X-Google-Smtp-Source: ABdhPJwZBZx1sNSkcfQ1+VY9aOHnlDOgKe0JwNOMT63sz30w8+CyPuGZwBs15HkHXbQ5PMx/lMqEWw==
X-Received: by 2002:a17:907:1c85:: with SMTP id
 nb5mr8062413ejc.502.1639511524876; 
 Tue, 14 Dec 2021 11:52:04 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id 4sm218737ejc.160.2021.12.14.11.52.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 11:52:04 -0800 (PST)
Message-ID: <e257012c-104a-2788-b699-5f96906f8a2a@mind.be>
Date: Tue, 14 Dec 2021 20:52:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211212205111.971429-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211212205111.971429-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libcoap: bump to version 4.3.0
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
Cc: Joris Lijssens <joris.lijssens@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/12/2021 21:51, Fabrice Fontaine wrote:
> - disable examples source which is enabled by default since
>    https://github.com/obgm/libcoap/commit/feb8c15b4572569716cf1c037092edb4717ca537
> - mbedtls is an optional dependency since
>    https://github.com/obgm/libcoap/commit/f601ddbf78720a74f29acb704256bc2655c4aeaa
> - Add Apache-2.0 for mbedtls to licenses:
>    https://github.com/obgm/libcoap/commit/0fccf2e71347af0ef3973ac565fca110ec3d4f40
> 
> https://github.com/obgm/libcoap/blob/v4.3.0/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.


> ---
>   package/libcoap/libcoap.hash |  4 ++--
>   package/libcoap/libcoap.mk   | 17 ++++++++++++-----
>   2 files changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/package/libcoap/libcoap.hash b/package/libcoap/libcoap.hash
> index 3472006224..4a5bcaa7ff 100644
> --- a/package/libcoap/libcoap.hash
> +++ b/package/libcoap/libcoap.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated
> -sha256  29a0394a265d3febee41e5e2dc03d34292a0aede37f5f80334e529ac0dab2321  libcoap-4.2.1.tar.gz
> +sha256  1a195adacd6188d3b71c476e7b21706fef7f3663ab1fb138652e8da49a9ec556  libcoap-4.3.0.tar.gz
>   sha256  09dd86a017bad210527085008cbf706609c58210897b69845af14099577e7eb7  COPYING
> -sha256  c51e85271aca3fbdd79bb4ee45dcfd854724538dad83b70afbbdfc62415e3e7f  LICENSE
> +sha256  c5625e704d52deade1c9b2d7931ac8593be147ba63af62b53b8c7e309b7eaeb9  LICENSE
> diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
> index 9a5e04d4fd..528d7d18a5 100644
> --- a/package/libcoap/libcoap.mk
> +++ b/package/libcoap/libcoap.mk
> @@ -4,21 +4,28 @@
>   #
>   ################################################################################
>   
> -LIBCOAP_VERSION = 4.2.1
> +LIBCOAP_VERSION = 4.3.0
>   LIBCOAP_SITE = $(call github,obgm,libcoap,v$(LIBCOAP_VERSION))
>   LIBCOAP_INSTALL_STAGING = YES
> -LIBCOAP_LICENSE = BSD-2-Clause
> +LIBCOAP_LICENSE = BSD-2-Clause, Apache-2.0 (mbedtls)

  The statement in the license file is

When compiled with Mbed TLS support, this software includes components
that are licensed under the terms of the Apache 2.0 license

  I think they only include that statement because it links with mbedtls 
statically, or because of the headers or something, because there's no file in 
the source that is declared as Apache licensed.

  Note that there were already similar statements for GnuTLS (LGPL-2.1) and 
OpenSSL, and we don't include those licenses here.

  Therefore, I removed the Apache license and updated the commit message.

  Regards,
  Arnout

>   LIBCOAP_LICENSE_FILES = COPYING LICENSE
>   LIBCOAP_DEPENDENCIES = host-pkgconf
> -LIBCOAP_CONF_OPTS = --disable-examples --without-tinydtls
> +LIBCOAP_CONF_OPTS = \
> +	--disable-examples --disable-examples-source --without-tinydtls
>   LIBCOAP_AUTORECONF = YES
>   
>   ifeq ($(BR2_PACKAGE_GNUTLS),y)
>   LIBCOAP_DEPENDENCIES += gnutls
> -LIBCOAP_CONF_OPTS += --enable-dtls --with-gnutls --without-openssl
> +LIBCOAP_CONF_OPTS += \
> +	--enable-dtls --with-gnutls --without-mbedtls --without-openssl
>   else ifeq ($(BR2_PACKAGE_OPENSSL),y)
>   LIBCOAP_DEPENDENCIES += openssl
> -LIBCOAP_CONF_OPTS += --enable-dtls --without-gnutls --with-openssl
> +LIBCOAP_CONF_OPTS += \
> +	--enable-dtls --without-gnutls --without-mbedtls --with-openssl
> +else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
> +LIBCOAP_DEPENDENCIES += mbedtls
> +LIBCOAP_CONF_OPTS += \
> +	--enable-dtls --without-gnutls --with-mbedtls --without-openssl
>   else
>   LIBCOAP_CONF_OPTS += --disable-dtls
>   endif
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
