Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC025C433EF
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 18:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6838E404D7;
	Sat, 30 Apr 2022 18:52:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nTGUr_bubuXz; Sat, 30 Apr 2022 18:52:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67BB0404C3;
	Sat, 30 Apr 2022 18:52:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A40481BF5AE
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91F8C81A99
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:52:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AkKvjpzGoRya for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 18:52:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9018819F6
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 18:52:31 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id i27so21054462ejd.9
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 11:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=6+ywyzglvRCBZudG+FAdo5BwsboQwT1SN7cNWSFX6nU=;
 b=C+bj0QEn3i+4urYdAOtndLg9Yddf0BEW1VvSVdXbGQzIYPif9sLgY4k3yy9wnEqK4h
 UtI8T1QCwbk+QrpuRvFOJjOZ5CQEtghMqu6SOU2a9YNWAXlSwogijk/Spdv0HNRYibuc
 Kr/fIIRb1z735JcE4K4DO6ELbBk/ZT6lcfTyw6HKMRMA3plR+GBInLDfFDJMNscPePYM
 AmB2xIeuT8wvr4XgfBW/yvzhgfoOV8AVcdzlbl22ul/hKR/BZggey3F9Y5W4eBuBz4NY
 fUJy6lU7umKMZNqMP2s8DmiwIvtiqYq3KF5wE9/zVMvP+P/hEpsrQLuOtRpEFZ/8fZdv
 6rFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6+ywyzglvRCBZudG+FAdo5BwsboQwT1SN7cNWSFX6nU=;
 b=z1U9b3GjCRU4sSGCk+FJSCZNoYmJUZd5sThzjMuRYXBmraHWBuVU6kIyJPSYceepgJ
 Z7zOFPIwyJUNaZ48klO1dOgspkeMXUysmi/wkmdbKQuafMKkMp7Kj/1nxCVvkpkMZh6Y
 C9cKKBRAYyi9Dt2jm0T35uQQQJwzt8TOiO6DBRYTlsn1KmQkA+RyBTTGJpaEY8dNYosA
 8/yr1Gi+YozY0eOdecas8WDfTi9Eci7QQ6qtkTvymtFrXv4bGQf1qMDa4H7mePAmTM8w
 EFsj61qfcgkWH6ilS14OEvDcxa4M1py9xgS80BcfJXUIhkkoG+h02rvPNYcX8aDyaz5u
 zazA==
X-Gm-Message-State: AOAM531uvLIii/pq4kBlIR995e/cGVqreZX8myBkmLgh0cgeDR/yTtky
 znHZQot25RwMosf9JNiGPmTLPdEAEGi5Zg==
X-Google-Smtp-Source: ABdhPJxPa5XzgyKjCoku/Chv+Y8hRy7DqPrK76GBVu4PfvquaaoTYLJAjFecBcTB1hZqeqaW06hdJQ==
X-Received: by 2002:a17:907:7ea9:b0:6f3:de9c:c6fb with SMTP id
 qb41-20020a1709077ea900b006f3de9cc6fbmr4827564ejc.304.1651344750034; 
 Sat, 30 Apr 2022 11:52:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 mm29-20020a170906cc5d00b006f3ef214e0fsm1865887ejb.117.2022.04.30.11.52.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 11:52:29 -0700 (PDT)
Message-ID: <d90a82a7-1f6b-de3d-b0df-2c9268dc33d8@mind.be>
Date: Sat, 30 Apr 2022 20:52:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Thomas Huth <huth@tuxfamily.org>, buildroot@buildroot.org
References: <20220430084742.522833-1-huth@tuxfamily.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220430084742.522833-1-huth@tuxfamily.org>
Subject: Re: [Buildroot] [PATCH] package/frotz: Update to version 2.54
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



On 30/04/2022 10:47, Thomas Huth wrote:
> A simple update by bumping the version number and sha256 sum
> to the current version.
> 
> Signed-off-by: Thomas Huth <huth@tuxfamily.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/frotz/frotz.hash | 2 +-
>   package/frotz/frotz.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/frotz/frotz.hash b/package/frotz/frotz.hash
> index e5024aa2cd..145aa3800f 100644
> --- a/package/frotz/frotz.hash
> +++ b/package/frotz/frotz.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  8da558828dd74d6d6ee30483bb32276ef918b8b72b7f6e89b4f7cb27e7abf58b  frotz-2.53.tar.bz2
> +sha256  bdf9131e6de49108c9f032200cea3cb4011e5ca0c9fbdbf5b0c05f7c56c81395  frotz-2.54.tar.bz2
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/frotz/frotz.mk b/package/frotz/frotz.mk
> index c1362b2ac6..5af235137c 100644
> --- a/package/frotz/frotz.mk
> +++ b/package/frotz/frotz.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -FROTZ_VERSION = 2.53
> +FROTZ_VERSION = 2.54
>   FROTZ_SOURCE = frotz-$(FROTZ_VERSION).tar.bz2
>   FROTZ_SITE = $(call gitlab,DavidGriffith,frotz,$(FROTZ_VERSION))
>   FROTZ_DEPENDENCIES = host-pkgconf ncurses
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
