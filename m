Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD72C4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 18:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB1F360633;
	Sun, 28 Apr 2024 18:15:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TPUFBhcNUqBW; Sun, 28 Apr 2024 18:15:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6F3560635
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6F3560635;
	Sun, 28 Apr 2024 18:15:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6873F1BF344
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 18:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FBCB81EF9
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 18:15:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NLccbEgwn6XW for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 18:15:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 32F6B81EF2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32F6B81EF2
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 32F6B81EF2
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 18:15:02 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-34ce52fb920so587639f8f.3
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 11:15:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714328101; x=1714932901;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cEJj8epRRJxIupESiCb729NsE30d8ik8ha3lw1+erkY=;
 b=W4LwoNqHJqTET7u0mT3fE8qWEG2iejjigjzoBdMiYbrj2rruyG62nkeODMXRmGnvp8
 XkqmiH37qcLKuBLlKG+71GP3qxuSJUz/WGfQ0Ev2R4hz1v/3xD4oQKPDSHnfLfbpKQTV
 C6W/bTZtXevknVaKF9YHY0eBGDLUkkwvudXNSaBcU2Jl+mA9hFHaqk+GUBuhQbd60JzB
 XRJY6FHTZdAd+KdmE34/1lK0XXlZ097RkH0SRLS+IziX3WquhnYxgRmetTFfDS1AYRoL
 nTsgiWulegVX99IjbyZpTWrtqwPFdGai9SX5QWLYB1xDfzz1Q+SGmRALpy6g1LTyeV+G
 gp8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWo/8c7ReJBCS0xy0JKhpFfCH11rWHMOj6OMCkn5GeYfiNwfYq6RMoGxkYmB5wYiUHsPK5WZ+v95vkKcLzBxbOMDoc65bZrDA==
X-Gm-Message-State: AOJu0Yxpw/08RdgHpMVG1mM+aP4+WgpBXHbwi0kNwIVvou1aoo6Tkmvz
 AHsbN0SvJtusGjmsIS9DUbcolnBMT/wm6VRXn+8y/lqUt0o6OSNusa+vIkJVFRsIgv8Wz/1TqC2
 l
X-Google-Smtp-Source: AGHT+IHUg7xmJhOoQ8DyVVdxpmMHLqp4MZGM0ZdxE7FPSmk6TwSGijEfnYf+LSyI/sw+qx/Jnq4MPg==
X-Received: by 2002:adf:9bc6:0:b0:34c:11fb:3820 with SMTP id
 e6-20020adf9bc6000000b0034c11fb3820mr4851016wrc.54.1714328100489; 
 Sun, 28 Apr 2024 11:15:00 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 df15-20020a5d5b8f000000b0034cee43238fsm1771406wrb.27.2024.04.28.11.14.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Apr 2024 11:15:00 -0700 (PDT)
Message-ID: <5564d3cd-faa1-4dd4-8edf-e4224a2c2f9e@mind.be>
Date: Sun, 28 Apr 2024 20:14:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20240414141653.1376138-1-bernd@kuhls.net>
Content-Language: en-GB
In-Reply-To: <20240414141653.1376138-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1714328101; x=1714932901; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cEJj8epRRJxIupESiCb729NsE30d8ik8ha3lw1+erkY=;
 b=Kqj/X6Hdp6nDQPfCQsfCmNZxGDrZt3D6KLK4HRPB9sRtsLvD4cvkp4YhXkq3ib37WM
 z40eWBWyTyIVn2kGKFXIZzLDc+Be9NZxNxGsnlkVhb9fywpdxPeREcdlD5ioiOr1c/DP
 RFmH2Wx9QMk1AsGsFVRqb4NINksSUhqs1k4s2Lz+Bl+IFQFJiOwQtObmk9wCjJ5xXzKT
 DGrVlqNyzlooPpL8ocTxBrlujA7U6uwj8L2nDUyGS6Z/CFKAcG7h/ZtnkaxVRbhwHeGJ
 HIXvrqJaSp3tCZVqk6TN9vyp7oTwn/fwuzeyk2iRtJdrZhcUQYPyTpMjS5/wUoQEkaao
 6adg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Kqj/X6Hd
Subject: Re: [Buildroot] [PATCH 1/2] package/linux-headers: drop 6.7.x option
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/04/2024 16:16, Bernd Kuhls wrote:
> The 6.7.x series is now EOL upstream, so drop the linux-headers option
> and add legacy handling for it.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   Config.in.legacy                     | 7 +++++++
>   linux/linux.hash                     | 1 -
>   package/linux-headers/Config.in.host | 5 -----
>   3 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 76af1da348..98a4125f4b 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
>   
>   comment "Legacy options removed in 2024.05"
>   
> +config BR2_KERNEL_HEADERS_6_7
> +	bool "kernel headers version 6.7.x are no longer supported"
> +	select BR2_LEGACY
> +	help
> +	  Version 6.7.x of the Linux kernel headers are no longer
> +	  maintained upstream and are now removed.
> +
>   config BR2_TARGET_TI_K3_IMAGE_GEN
>   	bool "ti-k3-image-gen removed"
>   	select BR2_LEGACY
> diff --git a/linux/linux.hash b/linux/linux.hash
> index 4fa9f701cd..d66bb54b5e 100644
> --- a/linux/linux.hash
> +++ b/linux/linux.hash
> @@ -1,6 +1,5 @@
>   # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
>   sha256  8d0c8936e3140a0fbdf511ad7a9f21121598f3656743898f47bb9052d37cff68  linux-6.8.1.tar.xz
> -sha256  a9b99fb376f9fcd699c7c252aeef3bb5ba26280eb049711ac091b2eb2b487c03  linux-6.7.10.tar.xz
>   sha256  23e3e7b56407250f5411bdab95763d0bc4e3a19dfa431d951df7eacabd61a2f4  linux-6.6.22.tar.xz
>   sha256  d150d2d9d416877668d8b56f75759f166168d192419eefaa942ed67225cbec06  linux-6.1.82.tar.xz
>   # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index 4c3651450e..78ba644c95 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -48,10 +48,6 @@ config BR2_KERNEL_HEADERS_6_6
>   	bool "Linux 6.6.x kernel headers"
>   	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
>   
> -config BR2_KERNEL_HEADERS_6_7
> -	bool "Linux 6.7.x kernel headers"
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7
> -
>   config BR2_KERNEL_HEADERS_6_8
>   	bool "Linux 6.8.x kernel headers"
>   	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_8
> @@ -425,7 +421,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
>   	default "5.15.152"	if BR2_KERNEL_HEADERS_5_15
>   	default "6.1.82"	if BR2_KERNEL_HEADERS_6_1
>   	default "6.6.22"	if BR2_KERNEL_HEADERS_6_6
> -	default "6.7.10"	if BR2_KERNEL_HEADERS_6_7
>   	default "6.8.1"		if BR2_KERNEL_HEADERS_6_8
>   	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
>   	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
