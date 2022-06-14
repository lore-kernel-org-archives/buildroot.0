Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C24DC433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 18:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCEB440918;
	Tue, 14 Jun 2022 18:48:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id teOKmnlpoaxP; Tue, 14 Jun 2022 18:48:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FEE240860;
	Tue, 14 Jun 2022 18:48:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 623971BF306
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 18:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 517CC60A78
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 18:48:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CALHC3E7iToR for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 18:48:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61F9A6068A
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 18:48:19 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id o7so18928524eja.1
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 11:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=fdzB3bWZVVqdMxmD9H5KfaudNMxSyzop0wpfwis38bU=;
 b=UeYJAimxgD4Rgn/eipoQ6yczOyZORZ8jT9qp/OqTicFxEZB4NLAtdg5zrs24BbuW3Y
 hfybQoB14jnC1Y6UhYIUHNOJbP5mPgHPzmPNS4fZXQp8hNnTkx6a8+DkgRvG9OceJK0e
 WSFQbdEYvIp0hY2Uq2Niz7Vz3wD/z8T6Y1Yhg8GJ3gTJVSGqN7hw4tfm8drAS7ILF173
 7bDoUNWsq61wKZTQh7xoizFx/VQiEcPrfFJ7xHdeKSm2ZxQ1yI1c+xsOZqgqwoFOvk91
 dHsmlQzCIT78VKIZhuxIWLgMboZptb2o7n5DZhiJG8Jq8nnOA9RWyMgSwDYFWPO/Z1k6
 Klyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fdzB3bWZVVqdMxmD9H5KfaudNMxSyzop0wpfwis38bU=;
 b=AvFUFobHPptsQxLUoNBs+5GNiz0vCzwU9MVX0pTmH4G/SBGNF09GOB1B9eRaVf/wBX
 Ox2L5lUBRBS1Ijvvqie8Vr057AJPgpGrs8Skf2pS4l887rvSxe6j0hOJUvrRYigWEEBJ
 OX+Y/WUnnJIQ+M4dgVeuHTFML/MF0Q0l4auPv0Gqa+TGHN2DrY/JIKTFledWVJXPlfQy
 HRZMYTqCPgQaUqLpl3VLNijO8jMgwDmpgbrVfjhgIRy/4nIBbKAi2quljuxKH5VUPSID
 +xuJXjZFOpmAK4SDSkxhJVldAM6BesHtNR0joOL/CDOiXYI2bFk9qT/a7+nIjfeYe3Bu
 tG7w==
X-Gm-Message-State: AJIora8GX4V4cWsb5iQEteKjyUpGC+h2UzMgZAS+zNr1RpckadY76E9/
 QOK3CBVLw17wKvQcvdn96bG4XA==
X-Google-Smtp-Source: ABdhPJz3ZYL+rJAalQMHEW7dFhFo5SskCiH4bRD4Vwtsc9L2jIR9181+illyHdIZ26w/oKo3Lvc+zw==
X-Received: by 2002:a17:907:96ab:b0:711:f0a8:8fdc with SMTP id
 hd43-20020a17090796ab00b00711f0a88fdcmr5679674ejc.359.1655232498880; 
 Tue, 14 Jun 2022 11:48:18 -0700 (PDT)
Received: from [10.1.0.138] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 l13-20020a056402254d00b0042617ba637bsm7796736edb.5.2022.06.14.11.48.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 11:48:18 -0700 (PDT)
Message-ID: <7765b8c6-1c90-78d2-43e6-e17522cd205d@mind.be>
Date: Tue, 14 Jun 2022 20:48:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220611172731.2980548-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220611172731.2980548-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.111
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



On 11/06/2022 19:27, Bernd Kuhls wrote:
> Release notes:
> https://lists.freedesktop.org/archives/dri-devel/2022-June/357686.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libdrm/libdrm.hash | 6 +++---
>   package/libdrm/libdrm.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
> index e0fac3a4d1..48b60f66cd 100644
> --- a/package/libdrm/libdrm.hash
> +++ b/package/libdrm/libdrm.hash
> @@ -1,6 +1,6 @@
> -# From https://lists.freedesktop.org/archives/dri-devel/2022-February/342405.html
> -sha256  eecee4c4b47ed6d6ce1a9be3d6d92102548ea35e442282216d47d05293cf9737  libdrm-2.4.110.tar.xz
> -sha512  52f92ef1fe4c218a1d7dba53ef43334dbfca80e3209afe59f3a32c4bf67473126534e990df07a931a12d46a3b997c21ef17c1c4d8a0c88d44d5c6c040e3b6be3  libdrm-2.4.110.tar.xz
> +# From https://lists.freedesktop.org/archives/dri-devel/2022-June/357686.html
> +sha256  1ad7164f77424de6f4ecba7c262bde196a214c6e19a6fbf497f0815f4d7ab2a9  libdrm-2.4.111.tar.xz
> +sha512  17e92e9e4ded8031ac222764bed7e9ff430a1a377f5e435f6b62b4a7f45cb4c4b769b3b79fbcba11512c1ac973abf8cdcca8e0b9659ae095e915d3d5efcf5516  libdrm-2.4.111.tar.xz
>   
>   # Hash for license file
>   sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
> diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
> index b64db06931..5cfd2d56eb 100644
> --- a/package/libdrm/libdrm.mk
> +++ b/package/libdrm/libdrm.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBDRM_VERSION = 2.4.110
> +LIBDRM_VERSION = 2.4.111
>   LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
>   LIBDRM_SITE = https://dri.freedesktop.org/libdrm
>   LIBDRM_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
