Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA975E9A053
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0A05611F7;
	Thu, 19 Feb 2026 17:26:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CqCitwZYq_5w; Thu, 19 Feb 2026 17:26:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3B4661056
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771522000;
	bh=EXv9Ae8TG5zlhhV8PnLRTZkw+ap1LZ/fRuSD3BEkVIs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kc+HdNRgqIXeSrWiEEWEQTXCLlZrS5o18X0cIxYog6P16vS/Qd/m1zYeHisa6rhBV
	 b96tQEVPEEUZAD0CKu6QNRZXRkphalaXFsHIKF/gxATBHsqe3PXZK3X/1ALYnNEL+s
	 3TnA6+2D3UsCcCTzIK5LPK/wjGgC++H+bNEp2hkG7nZCokBqgjMX7LmUjr3/1vcLlL
	 +BCvYWDRdZW5J4mQtK9SLOO4ffcUavr1ZeRcK/4HSDPUkSiCkfTZUzwv4636rLlIkF
	 /YzqFZGveBoktrQK83O3F0gRUKSIWuREeTEP9y1JoxLNSdchKIu+1xe6JoNi0K3ZWh
	 8dLiqmlJVIgbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3B4661056;
	Thu, 19 Feb 2026 17:26:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FD03206
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E94048086C
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IWNctwhMpDXJ for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:26:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DCC40809B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCC40809B7
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DCC40809B7
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:33 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-4359228b7c6so950113f8f.2
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 09:26:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771521992; x=1772126792;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/27RVbh3D+nQHx7dSwg8XFSmlk6vK7DWhBTwsq8WbH4=;
 b=g34MYoAkLyv6X0h0bmvq6lib8zJcr17b5MUK2qbj0aIkN2eQ/CYmW+3A4k36ZXl/kY
 tVSDmpjsyUjX6lcIJ/CwKZlhSepYENf3GW0L1SruivsG/A5LSpIfiiT8O+4UX4oYqdBd
 HqdbYkqDyZzBAacJEm/v4XdjfdWqpk3lGUOgQQG4FIwinxcwqUpQhZtc1C5ib5yDcWjy
 /bPICMxjSDRBSKUZG+dhSGri9/6VuFNZZMOPEN5YAZBRKGYmV+VV+yjf35sGJkEFUOXQ
 T5Wob6S6qG7r0DG2Bn/wn9z90GE8bxK58hhmV6ItOTuX31LeK6rqWtFb4yzHwYs/ulUh
 Rjlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJAmfNT5HoLo+BNgIzH3e9dMGVLR27OuFnYStb5D/+tZBYb3vp1BsbkXmekz0ubs9QwBNCiW2AoG8=@buildroot.org
X-Gm-Message-State: AOJu0YzMAQsuFQW88eoVpjgCsSHtEU2GdrscBY1et0RG6zsRPXgPNgRD
 i/oHyRtK7PCiYQLYNjJGE3KCj43PMt0nok0bFTD1N3lCxn866bFhXRABDzFWGNbg6xo=
X-Gm-Gg: AZuq6aL/4b+kCvSAlWHLDUKMqkDm0R45yM9eAMaqPXvY9nsDShZZlJ+WGaLPtlJYoXQ
 gsJ40Q6wm3eyMhkxVYbAYBeOBf5Hm1KEQAxWwfefKIk/6SdYtn4mzVZJ1RdKVjzDbrBwM2v7LzS
 /3tj0Cj5wChOTHC+BjV9hJXT1bwBMPZZLWvJ11r+WIF+t59mpLJ9CBhEbQ0Pi0Sdd5+w2WXXja/
 IhsYGYG0dpMM9JQUUcg8ueWVTi3IP12Gqa4QFIX8VnB+ovc04wv3oVbPKDPWRlzO0dYujM9uWPz
 DA2StRbTLfFuRE2Qusl+93+V48RSKvmgXmQVYPheslY7kMEbYf6if/91EUIUg75gIcsNKqIxc/U
 2b29fy4HTLdwQg18u6wn1TqnhvE8jV6PxjkXn2VoFUFrzYAyD5Zy4CCztRhLrzU0nS73/Q33wye
 ZQPJ292cg4Jrpzw+k=
X-Received: by 2002:a05:600c:8708:b0:480:1a9a:e571 with SMTP id
 5b1f17b1804b1-48379bd7313mr310929505e9.22.1771521991676; 
 Thu, 19 Feb 2026 09:26:31 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a31bc0e3sm13937875e9.5.2026.02.19.09.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 09:26:31 -0800 (PST)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 19 Feb 2026 18:26:30 +0100
Message-ID: <20260219172630.340849-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210081137.807581-1-peter@korsgaard.com>
References: <20260210081137.807581-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771521992; x=1772126792; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/27RVbh3D+nQHx7dSwg8XFSmlk6vK7DWhBTwsq8WbH4=;
 b=KuHXS3NT8MU2tDv7CCiulXsc7ew0wHTx8OYu4PEoFHmYVii7tENeg7w6R1tqSVJTE+
 yeAO4CPNAq7p9zq3xEfnveegqN35iJ5P3fq/34JGsGY197MeLBqmmWFxunsI3YDLSkgm
 VSXe+4C8p0mBWaCqZoYRrHPyTWxuHGLfbwlFacLMsicushSsw5X7nwOhDFgj9GfJVxO8
 6B/3G2obWdS+34htQJflFT8L4PTqcqAMy+cfcSw+J3xpsZvkPIgx7PKEVcj2OQr4OpzQ
 xq2sZjTjoerP6xJMb/BrLguDhzWB390x5Hi451ZktDeAcvtmuLFfsD4aT1rZar422TBf
 sWxQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KuHXS3NT
Subject: Re: [Buildroot] [PATCH] package/libpng: security bump to version
 1.6.55
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Fixes the following security vulnerability:
> 
> CVE-2026-25646 (High): Heap buffer overflow in png_set_quantize when called
> with no histogram and a palette larger than twice the requested maximum
> number of colors.
> 
> For more details, see the advisory:
> https://github.com/pnggroup/libpng/security/advisories/GHSA-g8hp-mq4h-rqm3
> 
> Release notes:
> https://github.com/pnggroup/libpng/blob/v1.6.55/ANNOUNCE
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/libpng/libpng.hash | 6 +++---
>  package/libpng/libpng.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
> index 4cf8718cc6..7901f82c3a 100644
> --- a/package/libpng/libpng.hash
> +++ b/package/libpng/libpng.hash
> @@ -1,5 +1,5 @@
> -# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.54/
> -sha1  3dcffaeb58daa7b754bebe93cb008342964d9f39  libpng-1.6.54.tar.xz
> +# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.55/
> +sha1  13f7bedf27009e59961f823cc779a5f9f5341a91  libpng-1.6.55.tar.xz
>  # Locally computed:
> -sha256  01c9d8a303c941ec2c511c14312a3b1d36cedb41e2f5168ccdaa85d53b887805  libpng-1.6.54.tar.xz
> +sha256  d925722864837ad5ae2a82070d4b2e0603dc72af44bd457c3962298258b8e82d  libpng-1.6.55.tar.xz
>  sha256  bdb0a645ea18c60507d0368379b1ac5474b92255fcc2d115e07486a7672ba526  LICENSE
> diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
> index d052fa7862..01c1cbbec7 100644
> --- a/package/libpng/libpng.mk
> +++ b/package/libpng/libpng.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBPNG_VERSION = 1.6.54
> +LIBPNG_VERSION = 1.6.55
>  LIBPNG_SERIES = 16
>  LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
>  LIBPNG_SITE = https://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
