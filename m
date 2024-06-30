Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A438C3064D
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 14:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C6F581091;
	Sun, 30 Jun 2024 14:43:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZrYY41Ogo5qN; Sun, 30 Jun 2024 14:43:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E55C810B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E55C810B4;
	Sun, 30 Jun 2024 14:43:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E04D51BF35A
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBB82810B4
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:43:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kUdQ4r6-8L50 for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 14:43:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CEB6B81091
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEB6B81091
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CEB6B81091
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 14:43:11 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ec10324791so23728391fa.1
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 07:43:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719758589; x=1720363389;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RlZQOWjaaD7iz9mZ9gfsfQ9xHSTZ4B/IChnDYnbUEVg=;
 b=gSROlC1Y/cgbQvh50agJ4aipigBjFW+tFPZ/5pOH4R5SMwJhbDHkbGchyXXFN0BMRl
 UZrkitV15DA0DCZSFtM1hVdoXYYyUGN1qdt9O0MwJulVIte4c0K54632qoB6lpSeWx8Q
 zJWQLK3sSZZDMS0zNyDfD1tHwGwBe+J0wdMugLiU4DBFL22vrQlsDhkD9K0jqyESoQvM
 JiMR5y2wD0FHDonC/bk/7CbjW7FMLUM0DvQBmmuRfQ644V8b2MtlDg87Q8YI23cyXksO
 5d6MjQ0o5wPDGkaGZ42SlFLEfQjS0KmlZ9Qj/RImh8kp1zrBNGlGk/wNj5i2ZW+6+t79
 CP0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDGCNCL7AsP/yVARuQ3HwH8xLSmAsWz50+EqRg+9snOnuOqp4d6fOw4LlW93CdKPj+8wHrxEeIMmHvPG5gm3tpJapAED1ZTA==
X-Gm-Message-State: AOJu0Yye1Gm1e6LIB11PuAq+Pn8Vvl+Jsfrs3Sb5yMMCgisnYea9J/7B
 JdH1/nkWePnCWlEmHbDmR3wF3Ce3dRXYPdKcIHVhGkpSp59chcrkSaA6eBeXYrWdNEA9L1AFkYK
 W
X-Google-Smtp-Source: AGHT+IHf3s+RLp2CvtdOv52wwQ8LUhRHG6PUguWH2/J7BL9ZzZlocP0LlzPacKwZwAkRvksQ8bvJMA==
X-Received: by 2002:a2e:a912:0:b0:2ee:4e67:85ec with SMTP id
 38308e7fff4ca-2ee5e337908mr31171411fa.5.1719758587764; 
 Sun, 30 Jun 2024 07:43:07 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4257dee5f2asm24718875e9.22.2024.06.30.07.43.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jun 2024 07:43:07 -0700 (PDT)
Message-ID: <593ad09e-f185-41fa-aa14-cfe3352755f6@mind.be>
Date: Sun, 30 Jun 2024 16:43:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20240628164803.11217-1-bernd@kuhls.net>
Content-Language: en-GB
In-Reply-To: <20240628164803.11217-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719758589; x=1720363389; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RlZQOWjaaD7iz9mZ9gfsfQ9xHSTZ4B/IChnDYnbUEVg=;
 b=GBeWk0TbsRcgdp5Hrsh9HDrlrbAtcHGPsqBPHKympRZXGhV9Fb8y48g9QlAPQw/tA4
 MdYKxxRsFwZqhUjZL+Veae6E5op9NEeaBh8HrRXCPvm/rJ2P8PnrG2RYlel87TMQuLoH
 efEDBO15fP7E6DMXplmOimNl9vNAwAZDgB4fHGfTmGEuskw6Lr1nRvwxslsbDzDgtBhO
 utjmCOQunReZsO7LntBlhuq0dL3ke2EVno2sM9Iy10y7cqW+Mixjp/7OGb8k9pPln+jY
 pR/iKkuWv1kd+Air7G5K9b5+n5S7afIQGac2He5iiCSfIa8OR2Tb9xWxh8PbJgEJEwJd
 3zfw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GBeWk0Tb
Subject: Re: [Buildroot] [PATCH 1/2] package/alsa-lib: bump version to 1.2.12
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



On 28/06/2024 18:48, Bernd Kuhls wrote:
> Changelog:
> https://www.alsa-project.org/wiki/Changes_v1.2.11_v1.2.12#alsa-lib
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   package/alsa-lib/alsa-lib.hash | 2 +-
>   package/alsa-lib/alsa-lib.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
> index 830643dea8..9c993c05ae 100644
> --- a/package/alsa-lib/alsa-lib.hash
> +++ b/package/alsa-lib/alsa-lib.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated
> -sha256  9f3f2f69b995f9ad37359072fbc69a3a88bfba081fc83e9be30e14662795bb4d  alsa-lib-1.2.11.tar.bz2
> +sha256  4868cd908627279da5a634f468701625be8cc251d84262c7e5b6a218391ad0d2  alsa-lib-1.2.12.tar.bz2
>   sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
>   sha256  bfe16cf823bcff261fc6a062c07ee96660e3c39678f42f39a788a68dbc234ced  aserver/COPYING
> diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
> index 246761d4e6..1dc25ea4a8 100644
> --- a/package/alsa-lib/alsa-lib.mk
> +++ b/package/alsa-lib/alsa-lib.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -ALSA_LIB_VERSION = 1.2.11
> +ALSA_LIB_VERSION = 1.2.12
>   ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
>   ALSA_LIB_SITE = https://www.alsa-project.org/files/pub/lib
>   ALSA_LIB_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (aserver)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
