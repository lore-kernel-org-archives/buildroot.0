Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C80DAC27C4F
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 14:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95C6B81091;
	Sun, 30 Jun 2024 14:43:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SrtocDBSZ1vF; Sun, 30 Jun 2024 14:43:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADAA48142A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADAA48142A;
	Sun, 30 Jun 2024 14:43:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 399A81BF976
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 258FB405DE
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:43:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o1zBLDvt_H3Q for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 14:43:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DB54B40541
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB54B40541
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB54B40541
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 14:43:21 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3626c29d3f0so1089395f8f.1
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 07:43:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719758600; x=1720363400;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rLXeJBKGTeC0dfi1iHvXz/Nq7NWEXI2rUY/pcHjXB04=;
 b=Ioyf0tr+00xnkELb4Xzf9Xnhm4EcvuLVz9TE7zVjNyMMMHaY/R7J2VWYcUWjINFCzW
 PHJeNWj0KchAH/60uPtdbCFojN+BZgEard+lEitnRyQd5SeAgin9xxkcRlafr/gtiyxR
 5INBVKXOyVHWxDVHEC7VXUVOlpQFYLYe1L+q9W+w1GqYY97r3nEczbWQIx0apbdrfNNO
 0H3k3GaWQnb7LkQfGp5WrnZTIv909BKIs+8kYEnWXjPlAts32ClR21Z8qBPaXBZjLmto
 SsB9P6HKxOkGDnvwxgIUnp6SiioFA9NsPz/segRoR57rMgu+ULtCG/xaoojJUnU5RENt
 04ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwYsZOzZzV/zseaW8YA9Au2apTZaZDERLXNBNEaPNzqwn79VxJO1zHnrHIfKfOuUse3CB4RhbDiqmXfYuq/wGkFt4rAwL/5A==
X-Gm-Message-State: AOJu0YwSyPRA5GWmiwrv6znsmhaUYgCHsW7OmFf0exY6XCZjpSiiHyJB
 EEVYTONvW4C82Dp53z9yrysr6ti8c3UF0ldd8Xk6kkrSenzUrOiqjk1PwdxhFRE=
X-Google-Smtp-Source: AGHT+IG15a7QTGHy9iTjknG48hl5Btc+vFqWNpy8EcuUZjo1wcSs7tVWBmlT8Gx2JsZFGIw7hES/OQ==
X-Received: by 2002:a5d:524c:0:b0:360:791c:afed with SMTP id
 ffacd0b85a97d-367756a3ba6mr2168549f8f.13.1719758599976; 
 Sun, 30 Jun 2024 07:43:19 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0cd71esm7640185f8f.21.2024.06.30.07.43.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jun 2024 07:43:19 -0700 (PDT)
Message-ID: <48269063-e23a-47d3-ad44-5eedcf2df23d@mind.be>
Date: Sun, 30 Jun 2024 16:43:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20240628164824.11246-1-bernd@kuhls.net>
Content-Language: en-GB
In-Reply-To: <20240628164824.11246-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719758600; x=1720363400; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rLXeJBKGTeC0dfi1iHvXz/Nq7NWEXI2rUY/pcHjXB04=;
 b=Bivw6Cv9zlpno0OIYS5ZrVcFqWrKZ6GtxqbVM9HsHG3kxMoo5RkMpGGgYYk2e+DNAU
 RIrEfdhSMxKsJSO8hCwjzRajupxiDhm8p/1U6t1ecMBMjHKoq1ahtPSLm5AmzTSNKXiE
 eKGatxVl6GKg/+Yxht+rWAzoMxu9n27N+NMbRm2Jyn7KbXJShvuT0g9RgChOekWGE4RV
 l5vN/UhkWvpWShsMKmZtyp0eLzImE3JSHd6KbeYuU1hFAIf3A6ZXmoeNBS9+aFT/Jcf9
 mDJcG1W1RgLtIfxvPdvHRpBcmfzuEP6mkJ6Y/jVw7Y2Bd7hga7Ir3i/7ixhIYkb229bR
 iwzg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Bivw6Cv9
Subject: Re: [Buildroot] [PATCH 1/2] package/libva: bump version to 2.22.0
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
> Release notes: https://github.com/intel/libva/blob/master/NEWS
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   package/libva/libva.hash | 2 +-
>   package/libva/libva.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libva/libva.hash b/package/libva/libva.hash
> index 24825ddc1f..b1358b99a7 100644
> --- a/package/libva/libva.hash
> +++ b/package/libva/libva.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  f7c3fffef3f04eb146e036dad2587d852bfb70e4926d014bf437244915ef7425  libva-2.21.0.tar.gz
> +sha256  467c418c2640a178c6baad5be2e00d569842123763b80507721ab87eb7af8735  libva-2.22.0.tar.gz
>   sha256  c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
> diff --git a/package/libva/libva.mk b/package/libva/libva.mk
> index 79dbe577c8..46f42afba8 100644
> --- a/package/libva/libva.mk
> +++ b/package/libva/libva.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBVA_VERSION = 2.21.0
> +LIBVA_VERSION = 2.22.0
>   LIBVA_SITE = $(call github,intel,libva,$(LIBVA_VERSION))
>   LIBVA_LICENSE = MIT
>   LIBVA_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
