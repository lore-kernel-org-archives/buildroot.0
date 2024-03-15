Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8A5C54E58
	for <buildroot@archiver.kernel.org>; Fri, 15 Mar 2024 19:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD9C860F8B;
	Fri, 15 Mar 2024 19:23:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g0WTytZEcF2J; Fri, 15 Mar 2024 19:23:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BD33608B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BD33608B1;
	Fri, 15 Mar 2024 19:23:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F16411BF307
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 19:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA17440399
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 19:23:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WkiwdBEZUvDX for <buildroot@lists.busybox.net>;
 Fri, 15 Mar 2024 19:23:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EFA094042B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFA094042B
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EFA094042B
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 19:22:59 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-413f1853bf3so14697055e9.0
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 12:22:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710530578; x=1711135378;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EXqT/X+pAFpaL63eatF+h7tSEoZOFdUtwrKh4JQUWxI=;
 b=huEkP8UnLTrZdqgGIRhe9k+Kpp2Db9s3g73zMZIvLcUJDcNpgrtYj1vyBFmXyB9GLQ
 bIP3hbGfOhknnBA6BGDG5bvdJ6DB4UsYZCZjWQXJqZQv/XuYZQKE2atSJpCNduI/Ckax
 0s2VOptg35VLi6oqB3O3LER/InCYhVx8+nv0oT6I/tL6Qo61ppc1s3/vGXd5E9KKc+nP
 LogSx6NrPixta4o1ml6idLZtY41JDG61+6hia8S0Q7SA+zklwWNkYkLeIdknPsk2Addi
 KT5mK+r8DUru/IrmCHtcvN9vCX81dgxSIRo3U1UUCREwXEO5cKzvFuAzMNe39ziY/rQS
 ZlJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNCRE62xFWMt0RxKweZDgCZPgwoVy5dph+SukZnbBS3OVwP/9E8ezr8ZV2caQMglyEwIKY0Wx6fvmSSoOpvb+888XUeIA2+A==
X-Gm-Message-State: AOJu0YwuaXiMgOb2cJXQnIAUNGphBi4rngMoNhF7S3x+ZDtzojuEXKvm
 4AbObwRAY1B04lR4N/UmcbJ5xzoD8PmNMUjO75T1+H2RxeD8I9PdlJekIHfgiIM=
X-Google-Smtp-Source: AGHT+IGECDCm6ReI0EdSVgc2rhHEEhf8lhCFx291/op6UgwpwzUMAjlnGeb1/DOJVUJnTulBXlTZ/w==
X-Received: by 2002:a05:6000:1:b0:33d:873a:616 with SMTP id
 h1-20020a056000000100b0033d873a0616mr4046440wrx.64.1710530577907; 
 Fri, 15 Mar 2024 12:22:57 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 bq22-20020a5d5a16000000b0033ebf702e17sm1863302wrb.21.2024.03.15.12.22.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 12:22:57 -0700 (PDT)
Message-ID: <dfc85aa9-da2c-46c5-b0b9-d7e7ab02cf16@mind.be>
Date: Fri, 15 Mar 2024 20:22:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20240314212043.23332-1-bernd@kuhls.net>
In-Reply-To: <20240314212043.23332-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1710530578; x=1711135378; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EXqT/X+pAFpaL63eatF+h7tSEoZOFdUtwrKh4JQUWxI=;
 b=GyspLhgIzTS1WK8ONllQPAQF4kBDN42kNxqzFfwnOl9CGENXhOfg1ebOOYoKDjVwpZ
 ODOmHQ8PtH/ZLR9TrEjzhbgGwaPGxphcwfayRVPd95lFsTlAV4UeddYMPCzF7Uun4RGq
 GgIfI+3bfmCs7rozYdd/L+XuffnsqeLuMWCMVo9Wpuph6OX1VLAiTg2corw2PKIk3W+Z
 N+tdlG/P8F6qveW8i9rICvELhf288EzOxelkJX3kcpc1nkDLjUZkWVM0CLDEDCFvcl6H
 LRsF5Z13AyOPNnHbllrLTlPnIpuf+DOdRdi7GH4sSHZT17uFVZHxKBQLj+Cd4ZaAwzu0
 zxrQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GyspLhgI
Subject: Re: [Buildroot] [PATCH v2 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 24.0.3
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/03/2024 22:20, Bernd Kuhls wrote:
> Release notes:
> https://lists.freedesktop.org/archives/mesa-announce/2024-February/000749.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-February/000751.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-March/000752.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> v2: squashed with uncommitted patch
> 
>   package/mesa3d-headers/mesa3d-headers.mk | 2 +-
>   package/mesa3d/mesa3d.hash               | 6 +++---
>   package/mesa3d/mesa3d.mk                 | 2 +-
>   3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
> index 1d006dbc91..7f39fefaf5 100644
> --- a/package/mesa3d-headers/mesa3d-headers.mk
> +++ b/package/mesa3d-headers/mesa3d-headers.mk
> @@ -12,7 +12,7 @@ endif
>   
>   # Not possible to directly refer to mesa3d variables, because of
>   # first/second expansion trickery...
> -MESA3D_HEADERS_VERSION = 24.0.0
> +MESA3D_HEADERS_VERSION = 24.0.3
>   MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
>   MESA3D_HEADERS_SITE = https://archive.mesa3d.org
>   MESA3D_HEADERS_DL_SUBDIR = mesa3d
> diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
> index 49b42e2132..1e94c2c612 100644
> --- a/package/mesa3d/mesa3d.hash
> +++ b/package/mesa3d/mesa3d.hash
> @@ -1,5 +1,5 @@
> -# From https://lists.freedesktop.org/archives/mesa-announce/2024-February/000747.html
> -sha256  dc7e8c077bc5884df95478263b34bdebb7e88e600689cb56fb07be2b8c304c36  mesa-24.0.0.tar.xz
> -sha512  9dfdea7cebb37b9c020335e24194b39b399f48b5af6eec30c3455108276ac4e29e7b06df942cb2abc7afa667784968c0c43d19b9afe30ef03021b9cb6a789f15  mesa-24.0.0.tar.xz
> +# From https://lists.freedesktop.org/archives/mesa-announce/2024-March/000752.html
> +sha256  77aec9a2a37b7d3596ea1640b3cc53d0b5d9b3b52abed89de07e3717e91bfdbe  mesa-24.0.3.tar.xz
> +sha512  76b3b479877c40f729d7f530af4e3577fa74363edcd3d9474350d498a51dbb761fc034b39bee8547e97c30fd3a520cbc50c742d5a187746e83ddab1df44f37e9  mesa-24.0.3.tar.xz
>   # License
>   sha256  a00275a53178e2645fb65be99a785c110513446a5071ff2c698ed260ad917d75  docs/license.rst
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 71929014c8..bdb7ea9a6c 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   # When updating the version, please also update mesa3d-headers
> -MESA3D_VERSION = 24.0.0
> +MESA3D_VERSION = 24.0.3
>   MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
>   MESA3D_SITE = https://archive.mesa3d.org
>   MESA3D_LICENSE = MIT, SGI, Khronos
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
