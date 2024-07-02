Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC82C30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEB9281152;
	Tue,  2 Jul 2024 07:04:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0i3G9qf5shBN; Tue,  2 Jul 2024 07:04:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B962C8100F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B962C8100F;
	Tue,  2 Jul 2024 07:04:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 890221BF97C
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8034C40752
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:04:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H0bpgMosoBoy for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:04:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 322A640749
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 322A640749
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 322A640749
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:04:13 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52cdcd26d61so4299740e87.2
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 00:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719903851; x=1720508651;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cnVBaWATah3d2ljRnNx8o65Y4OMB3Bv1rch3iCXB8lw=;
 b=pXQR+gwEKaHgkBQLPZZE2HusDgWd4m5vXo7Nyo57YveA5/wcJJEPaeNHvFW90qCGl1
 v7cvSpJ2KO+fNKi/Eiet6OBy1uY4FJJhMCaotNaKoqgvXFfyO45JQu+LdW9zd4NUY2Le
 JPio+jQeeu6As38WOR+GjXlk1xVEC6smy/Jsz/sfMmsZOK6B6KxE5i8mcoYUVwQPqD/h
 kHavI7Z6rU8+3eVckkiC7pembhbmm9mwpa+IHxlphtXSx+UR6rV8QSol+y8WL4VW2YZO
 rTHMn13c2a9tzY1vB4hLYDw8ywCveBnuTGdi9K0KPBmXhJVq2RezzoOqfhi+Yq2VJ5mm
 YQxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxBaUo9m4sLqA0Pm+o7x4PNo9mLusZShACuHYbKnz8TY4uDDGO3NXcMLI+SrO3kcaKL7TkUXTSu62GgjBlGMvw5pwatF4ILA==
X-Gm-Message-State: AOJu0YxYE1+KdoSSfKf5fZm9IBxjYJwjCyrVq6B923plvDJK5dk8zAfh
 Yv1NLRVL6B6oS7x05V0xh+Xlr/b/cSkY6TLkxvSxb1Efygnb29BgHI8IYHPoUWc=
X-Google-Smtp-Source: AGHT+IGRnwjF0FSpgAVRAA/znrPX7Cl+VTX3He6S0TorT4OIpm1MFf98fMUnediCMOt8ShR+ZinY3g==
X-Received: by 2002:ac2:4e0b:0:b0:52e:767a:ad9c with SMTP id
 2adb3069b0e04-52e826fc0dcmr4750589e87.53.1719903850925; 
 Tue, 02 Jul 2024 00:04:10 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af5b626sm182398505e9.15.2024.07.02.00.04.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 00:04:10 -0700 (PDT)
Message-ID: <6bf4be51-9b2e-4d5a-8766-2799c165b2a8@mind.be>
Date: Tue, 2 Jul 2024 09:04:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240701173815.1725948-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240701173815.1725948-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719903851; x=1720508651; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cnVBaWATah3d2ljRnNx8o65Y4OMB3Bv1rch3iCXB8lw=;
 b=H8OtPEgVuvU6LkJ8twBPenlo4nMV7FKsGAWR8KANsuI2XEJhqY4QYVfvG4HC8cBFkn
 RMPW8Egyfxes/9Oh4wy/v2hmwnv4/p816iNYoXgUPCyyz5fKpeTSp2I3K8cRxzWYK3Bn
 yUUBVCFKDs2/1/1+IlkuG/p8klUXOwzFcmMarjg026v0cacFTJJ0uexjQiAJv+BKLvzM
 tFHMu+OGkRpB2nAEmwRPUPe8vcv3m21D/0yKjEOEIKlsO81HddjQoplJwbtavscVH3Jw
 WsFDNw486sj/GZCV1//AAAoVm+eNQwrFNgbUvqoF+y/jNiPkTgRNIdkO/m/KBpkcBWhf
 Z4Ug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=H8OtPEgV
Subject: Re: [Buildroot] [PATCH 1/3] package/python-starlette: bump to
 version 0.37.2
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/07/2024 19:38, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied all three to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-starlette/python-starlette.hash | 4 ++--
>   package/python-starlette/python-starlette.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
> index 03d77cf5be..f04aaea7c0 100644
> --- a/package/python-starlette/python-starlette.hash
> +++ b/package/python-starlette/python-starlette.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/starlette/json
> -md5  0a1e026d653dc448ae07f47eefe1dc8b  starlette-0.36.3.tar.gz
> -sha256  90a671733cfb35771d8cc605e0b679d23b992f8dcfad48cc60b38cb29aeb7080  starlette-0.36.3.tar.gz
> +md5  b0ba8178dd4bf2cdff53c8702212be52  starlette-0.37.2.tar.gz
> +sha256  9af890290133b79fc3db55474ade20f6220a364a0402e0b556e7cd5e1e093823  starlette-0.37.2.tar.gz
>   # Locally computed sha256 checksums
>   sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
> diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
> index 9d137f5f5a..af2c2d4ac7 100644
> --- a/package/python-starlette/python-starlette.mk
> +++ b/package/python-starlette/python-starlette.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_STARLETTE_VERSION = 0.36.3
> +PYTHON_STARLETTE_VERSION = 0.37.2
>   PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
> -PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/be/47/1bba49d42d63f4453f0a64a20acbf2d0bd2f5a8cde6a166ee66c074a08f8
> +PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/61/b5/6bceb93ff20bd7ca36e6f7c540581abb18f53130fabb30ba526e26fd819b
>   PYTHON_STARLETTE_SETUP_TYPE = pep517
>   PYTHON_STARLETTE_LICENSE = BSD-3-Clause
>   PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
