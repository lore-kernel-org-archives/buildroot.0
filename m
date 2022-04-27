Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B75C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 19:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0267D8137C;
	Wed, 27 Apr 2022 19:40:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FV8ILyu5YI7z; Wed, 27 Apr 2022 19:40:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2128A80C40;
	Wed, 27 Apr 2022 19:40:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EF3391BF2EA
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDA9060BAD
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:40:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yRlWbLQK1t1Y for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 19:40:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E20E7607AA
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 19:40:05 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id j6so5368417ejc.13
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 12:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=892f687tYwiU6n3n7O+iNEOqWzVznD8sun6c7WaEqM0=;
 b=PxmQxgmfKQ2ZHcEcjXW0GiDUeSusJ0Oxm1daQBgQEN0amUv4X3xAxOh/sGzKZVy9S1
 9DZ2b0tPS9NAI6g9gUvgWJVTn7d16iwxPKweCxjByKUDstTRqhoGZK5UyfWdPeV6OIDr
 CMCXmKFOWDoP6Dxak+9l2SnCEcGubFjfTyYphV3mPIMoag6XeOmL3ligfmQvoBwKYKcN
 3kmSUls/lzDWOU4EmWqTy7RMsoY1dP4E9vRzzJ63mLIhYFnQEOw1FEMmTsNKHsBJ9O6P
 JTevi8+xEeSj9LY7zjPmxahL4auWS2tfjtymLjg/4PZEcOKYJ6nhTxrH9tD/Vb4aDAuh
 oDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=892f687tYwiU6n3n7O+iNEOqWzVznD8sun6c7WaEqM0=;
 b=dYTTKK5llHAIuX18qk+YvA+Oln6mElFHlimuvYrimg2CD9nMjqgL1SAkTg3Is2MgRZ
 3IKIukQHfWmZIwoi+jYv6OANJdVZPg/RcrEJaF5Yo3xpY8pHprm6hjzFXcCfLAst3DID
 XEO9OaXVh7fQHbqd/+qR0HdJmplxkvRNMZfxtX5x9VYtDYj/NjBLTspGzH+HScQonLfh
 x7LW1m727QQlOafX1UYogJ4ykPrgzkop7GoIYjD5Rn7wZLhcgKB5fS2YiqpzU3XyUAP/
 FCWcTsjuvVL+rG+DyrasG2cBf5BtDLHbgy0ZGkYWJ5kCn7Mdyy3sRxtmrsCcggUOYK+y
 /jyw==
X-Gm-Message-State: AOAM530krvx1SfTLZIVp11wYX6ruN7yvIcaTKz3XmVdv4ZtJAV06VBWA
 QzoQgAGlwe5jNGMa+kDbM6o8lw==
X-Google-Smtp-Source: ABdhPJxh2pA6xDj5R/BEvOiO4jl2STkf7qR6H7136R9Dmu2nJNAG6GSfghbByRo7cG559Pm2CgzVfg==
X-Received: by 2002:a17:907:c06:b0:6f0:2da8:b705 with SMTP id
 ga6-20020a1709070c0600b006f02da8b705mr28987987ejc.501.1651088404079; 
 Wed, 27 Apr 2022 12:40:04 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 t25-20020aa7db19000000b0042617ba63besm93509eds.72.2022.04.27.12.40.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 12:40:03 -0700 (PDT)
Message-ID: <bc5c68a9-006c-5096-2c37-5f08e27fbc36@mind.be>
Date: Wed, 27 Apr 2022 21:40:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220427083240.1081081-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220427083240.1081081-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.62.1
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/04/2022 10:32, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/meson/meson.hash | 4 ++--
>   package/meson/meson.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/meson/meson.hash b/package/meson/meson.hash
> index 38fa43f6dc..2037c46bbc 100644
> --- a/package/meson/meson.hash
> +++ b/package/meson/meson.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated after checking pgp signature
> -# https://github.com/mesonbuild/meson/releases/download/0.62.0/meson-0.62.0.tar.gz.asc
> -sha256  06f8c1cfa51bfdb533c82623ffa524cacdbea02ace6d709145e33aabdad6adcb  meson-0.62.0.tar.gz
> +# https://github.com/mesonbuild/meson/releases/download/0.62.1/meson-0.62.1.tar.gz.asc
> +sha256  a0f5caa1e70da12d5e63aa6a9504273759b891af36c8d87de381a4ed1380e845  meson-0.62.1.tar.gz
>   sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
> diff --git a/package/meson/meson.mk b/package/meson/meson.mk
> index 13adc2f2b1..6d55f19402 100644
> --- a/package/meson/meson.mk
> +++ b/package/meson/meson.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -MESON_VERSION = 0.62.0
> +MESON_VERSION = 0.62.1
>   MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
>   MESON_LICENSE = Apache-2.0
>   MESON_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
