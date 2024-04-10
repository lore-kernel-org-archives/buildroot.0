Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722D2CD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 19:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D39D40182;
	Wed, 10 Apr 2024 19:42:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vD3vMNfn7IsJ; Wed, 10 Apr 2024 19:42:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37C9F40399
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37C9F40399;
	Wed, 10 Apr 2024 19:42:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F65A1BF59A
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 19:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A873820FB
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 19:41:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I2jECUlPJILi for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 19:41:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 33931820F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33931820F7
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33931820F7
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 19:41:53 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-416f04059beso6911635e9.1
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 12:41:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712778112; x=1713382912;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aocxZ7i77JzvlH7cPp0zbvqIGeKMHG6QEimPQJruyAY=;
 b=YpcUK2sKqV4l3/WILvNPnYMCWcyW9cEsMTH8vcqM9RLx1UNGPlQCsK2EzPq861+qrB
 OCgdhV1EVT1rldisZRf6zONwZWPhmRmIP8zUL48aeYN5ZV9QvwcaoZ1Z3tMJC8Cizh2G
 H6iThoY6mJWBy4oECY31ZhleO+YQ4CScRgBNDV8vVwL9Hu2LHIJRV+tni3IK3NjsffeP
 5dzrdv2K4wEM3m+ZTBi5zpaTOJWIQoeu1VHkkxfMi30ZjCSrvk/d1PZeSH1zGqJ2ilJt
 tjuIVsCyHQXudzCtcK8SB0hgBHTPQcSgmkroix+toK2Urh+Jzk4HJMmbo9Xhr/xcc2cu
 WsIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFxhiVDKkkI85UXmTJETL2E4gADCpXOgR/ps0p+8jO2sJp00NSo0+pzvTnw52CwCGoxIvz1UXi9wJjGjUo1UpthWoqyhwOcA==
X-Gm-Message-State: AOJu0YyKdyKnI9WgXYTBKFmbbO9tZ5fRtRDJVCnD8LT8gawPkG+diIG7
 EDZ1Em01G8EbICjycP30C+fC1YR3wac5R9Pd6RPbtfNNPfxtHyqdiIjJbsF7wEINWKiQUSgIQZm
 g
X-Google-Smtp-Source: AGHT+IGh/VshJlVYt/GCMkNu/CleyG3o9DCJnsrxsP4nen+jXWUsqRIrsyZ5vd+T76+0xV7Oql4lBA==
X-Received: by 2002:a05:600c:3592:b0:415:511c:f801 with SMTP id
 p18-20020a05600c359200b00415511cf801mr2582262wmq.34.1712778111547; 
 Wed, 10 Apr 2024 12:41:51 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 k23-20020a05600c1c9700b0041469869d11sm3206636wms.47.2024.04.10.12.41.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Apr 2024 12:41:51 -0700 (PDT)
Message-ID: <68394e48-3b02-4a67-871c-4d4719f28873@mind.be>
Date: Wed, 10 Apr 2024 21:41:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <ZgQcVayV4juxXnnZ@waldemar-brodkorb.de>
Content-Language: en-GB
In-Reply-To: <ZgQcVayV4juxXnnZ@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712778112; x=1713382912; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aocxZ7i77JzvlH7cPp0zbvqIGeKMHG6QEimPQJruyAY=;
 b=QW3GYQhGqWM4XXir4u3f5+fuCqyoyzgKYsgY1yjEQkKCN3A3GJ+OUifkdqIZi0t+cS
 av/ifgtfcDPPVxnm6RUJhWVM0F5bzeoJMJp+WC3GIxjr6uXWMKO64VAp7TyYncWCedJk
 rbL1h/jMzBwSNYAXAx0D20sikg/ZvtnecsM9+dwGSmBd3Lgb9eHjwMP9Vsd9MvVJltTs
 LMjIzRszL0WUmiPRN/AFu8gLLBgAHCy1X+XqeNA9T/jazeNh2DTwksg+qdwAcOIdoza+
 kW1XxZNciKfHjwISkZF4SOvfzUHp1OeHF4MDhr/sb+hugyFHvz1PvGRnbK/3MSUqfazW
 A4xg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QW3GYQhG
Subject: Re: [Buildroot] [PATCH] package/uclibc: bump to 1.0.47
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



On 27/03/2024 14:17, Waldemar Brodkorb wrote:
> Fixes riscv port. NPTL/TLS fixed. C++ applications now working.
> Added explicit_bzero and reallocarray.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/uclibc/uclibc.hash | 4 ++--
>   package/uclibc/uclibc.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
> index ae1f3178d9..a10ceab54c 100644
> --- a/package/uclibc/uclibc.hash
> +++ b/package/uclibc/uclibc.hash
> @@ -1,4 +1,4 @@
> -# From https://downloads.uclibc-ng.org/releases/1.0.44/uClibc-ng-1.0.45.tar.xz.sha256
> -sha256  c2f4c6b6e19d7c9c226992a3746efd7ab932040463c15ee0bc8f4132b5777ac4  uClibc-ng-1.0.45.tar.xz
> +# From https://downloads.uclibc-ng.org/releases/1.0.47/uClibc-ng-1.0.47.tar.xz.sha256
> +sha256  29a4d684a06da344ee3ee09acc2ca7649d592ae3ff848f698145c46def05efcb  uClibc-ng-1.0.47.tar.xz
>   # Locally calculated
>   sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index 88623840bf..a7b18133ff 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -UCLIBC_VERSION = 1.0.45
> +UCLIBC_VERSION = 1.0.47
>   UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
>   UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
>   UCLIBC_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
