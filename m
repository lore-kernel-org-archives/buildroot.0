Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C9EC27C53
	for <buildroot@archiver.kernel.org>; Wed, 19 Jun 2024 20:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC35080EBA;
	Wed, 19 Jun 2024 20:36:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jk5nPGU_ae5p; Wed, 19 Jun 2024 20:36:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B74D08434E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B74D08434E;
	Wed, 19 Jun 2024 20:36:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 20FCF1BF846
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0EF89607B8
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:36:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R5JErvEk67i4 for <buildroot@lists.busybox.net>;
 Wed, 19 Jun 2024 20:36:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EAB2F60681
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAB2F60681
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EAB2F60681
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 20:36:01 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-35f2d723ef0so162860f8f.1
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 13:36:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718829360; x=1719434160;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eFsqo6qzh0blUT3bu0oJT7l1bz+n8sOrY49E3/UR95c=;
 b=bz/LmSIc6qHldCq6E8nCihAabErKT+8XGfsBDIJ5HlKbPJlw9b601+5pGiTzf2ALey
 i16PplJvimX3uB0jq9zDxtIbcyldF/Y+nenYjqTRmYUxZjs8pUFIISq8m3GyDEStuuwD
 sFMtX1YqcAFoNEWDCwtxz/6r1t/t+kW6Xv5cl6e2AxxRWUzyhyXeXDYsf5ymJclqcc26
 iXb/ZF9AQ/z75gXKL9fIJexeRxfBR0QiF01Tz71mOHA2FIH0f5JB2i+IPAgW7YO95GH3
 nXXcg9Xiq7rJSFA+O4qQOVa8h2si3ipqbsxXe6wUpWUsI9tUGdsJYcOHZX0RIsPKjCM3
 Ps5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW169e1GDJFarLCj8vF7vV63YQ7P2GkwrxJIHCwUhtByXrwCG+hJtmSH5InzmyD15zF2O5EiizJTd2x5kKb2P2qzKIz1wHQPw==
X-Gm-Message-State: AOJu0Yxm+i2kJQb7DXbqEFQEKNinYwBLQKpCV7mAf1cVHPLvAn+5X6wN
 JE/KB2WzQJejKYrQCaIqiiA+rp7/nOWAsmFFNwEdsZ9BAx4KkMfBeJS3hggqf3w7NHae0o/OQfw
 T
X-Google-Smtp-Source: AGHT+IGjQfZ0e+ois/z+qHZLYafdJERMjKApUJA8Pez/N/E1b9KA/ROYhkgFBNLWVYqx4vRZYMNYGg==
X-Received: by 2002:a05:6000:e10:b0:35f:25eb:e57 with SMTP id
 ffacd0b85a97d-36319f5193dmr2681663f8f.71.1718829359704; 
 Wed, 19 Jun 2024 13:35:59 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d04f011sm2079435e9.0.2024.06.19.13.35.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 13:35:59 -0700 (PDT)
Message-ID: <b886e6c0-c584-4310-94b2-aff7ec1cca47@mind.be>
Date: Wed, 19 Jun 2024 22:35:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20240606195208.3184198-1-bernd@kuhls.net>
Content-Language: en-GB
In-Reply-To: <20240606195208.3184198-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1718829360; x=1719434160; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eFsqo6qzh0blUT3bu0oJT7l1bz+n8sOrY49E3/UR95c=;
 b=MO0If4kBsWPt4VIdUOHvsHSh/bTTN0ZTqMDIajwb/vleNVD0wrUfhqWCRg5/iSoeYr
 +LtSuSTxn53byW5PQn2kWpK4BuAIQFuqw9RIsMfpjNTElG7wTgK4+zUEZjX/96SRMfI9
 9mlMItWkd5vJVkeGNEJ+e4RVdhrLdty1Y58hGImzNF7hS9+IIbkJdSCGMoEAlGMSpUIQ
 wJP9uSaZ7EueCguYNlWrxTJuJyrptd/W5kF53N+J2vChnAxHI0PoWyPt/sX8gTmvX6Vi
 aJr1I8Xp+bzwQ5/gZ6GfL+4gfLeX/qLs/TRK6N1KBisxOlCtuoyNnhZk1Y3GZ4fupjkZ
 w3tw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MO0If4kB
Subject: Re: [Buildroot] [PATCH 1/1] package/php: security bump version to
 8.3.8
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



On 06/06/2024 21:52, Bernd Kuhls wrote:
> Fixes CVE-2024-4577, CVE-2024-5458, CVE-2024-5585
> 
> Changelog: https://www.php.net/ChangeLog-8.php#PHP_8_3
> Release notes: https://news-web.php.net/php.announce/429
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/php/php.hash | 2 +-
>   package/php/php.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/php/php.hash b/package/php/php.hash
> index 9b25eabd32..cd5f8a1c1b 100644
> --- a/package/php/php.hash
> +++ b/package/php/php.hash
> @@ -1,5 +1,5 @@
>   # From https://www.php.net/downloads.php
> -sha256  d53433c1ca6b2c8741afa7c524272e6806c1e895e5912a058494fea89988570a  php-8.3.7.tar.xz
> +sha256  aea358b56186f943c2bbd350c9005b9359133d47e954cfc561385319ae5bb8d7  php-8.3.8.tar.xz
>   
>   # License file
>   sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
> diff --git a/package/php/php.mk b/package/php/php.mk
> index ad2d901dfd..268b8e0a62 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -PHP_VERSION = 8.3.7
> +PHP_VERSION = 8.3.8
>   PHP_SITE = https://www.php.net/distributions
>   PHP_SOURCE = php-$(PHP_VERSION).tar.xz
>   PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
