Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF26C43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A0C440746;
	Fri, 26 Jun 2026 14:55:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UBS7RsPjyjvF; Fri, 26 Jun 2026 14:55:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16BD640684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485730;
	bh=z0CxH7oP+dko7tTfzgAQzVP6o/8Y7rEXllbxapnk/ag=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UIFU72lAwtD+dKy67T/CECh3NV5C3HED1foHBy1F7jerp4OdbtzCQS1eeELlP2Qh8
	 z5VdOi+NqsH5m5cYAX9FWLjBRTaj9gWYR3UFKnVTgirN+5H112P73PX7V0NvUTYe9I
	 EfORCjeIN4Np/j7zz120kDtC7rxPkAd1vVSt5oHL8c+ZLHnjJrU3Zru7N1ocOfEMu5
	 Wypn3fHYNd3pJ/EWr5uMIfxn7fUTC1J2/WOL7wgQIMiLE3AR5+UPX/dMJ4qmguPZ+B
	 qkP3eeJLFZ2VR2qGxZp4ZVPYqKVnyVYbtxkZjoLtNnofOdEhUjxTcbHwmvgjqS8mJx
	 OQJXaNFnsRO8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16BD640684;
	Fri, 26 Jun 2026 14:55:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C02B53A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B19DF40695
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:55:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0vatMORi6GJt for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:55:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DFC9240684
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFC9240684
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DFC9240684
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:55:26 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-4631679f204so1222608f8f.0
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:55:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485725; x=1783090525;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/H6MqpUGrt0uRjWjJtp+Vy4ubYkjQDZJKtegEq9vYXs=;
 b=cwVBb9u2fgmBpxJxb9tgb6S40B05yOfE3DSxCR2tm+Bfc13tXtj1HuSuQpZivPbIR/
 2TPQnSrCjxRJiAkdcANkVjP1XLy2Vkg5uAVhF3GF8qX6SkY8Sauk2bPKxdLxhkZkrZO/
 f/2pGbEbUOTYu3pwqeZPS4/503N8vWSORPHF6djV1Yun77zhYEql0FRvPXkct3LqFtKy
 n3XPUozD1H/P8Li5RS/0x24GrYnBTaiCf13j1fT+IIcNqWCaZKK5Fz2TPrHsQAF3kpFC
 2TRgjrsza+ZK8dwxFTZnupjYzP8lruRAUIALZiSC2f0E9tYPUK3PN08JTtltMWfV8WhW
 7g0Q==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp7IkjuEaFQ973mMpxP8vkw4WZwYPu/hx5HmwWLTBCv1YtBg/FOD3gQb5gT5Cw+zPXtl2R2q4Zy3aY=@buildroot.org
X-Gm-Message-State: AOJu0YyuB+9k+SmqH+NCtlJTR8z0V/j7Rj0DxtrBV0AwjXoX3yEktsLZ
 fYFJAaUTKXwqeNwHRWmD40x0BNihybZObnnSHOycj017XpPprjarwF5zXE5f2UBsQUs=
X-Gm-Gg: AfdE7cl3drjIBpwHVyBYEkx5y521YfTDQqCBI+zun5cUuS3D5nhVP2/MmoJGdjls8by
 iOmw4wrGvbXMdCyNbzBpOrHs9n3m1752MLYS8mg2128uHiuenHC/UA5VKAl241y1mVKMlEajgXt
 B2TRpgo7dKe3QcRiBgUWISzaZsLhgOoLdkU8XSyQ08js++QY1CLr2umS3tE+EgwluXUnX4IM4B4
 LSZCUxMWgOXJEoGB/+ozjRilMs3sPIaE6VRyGMY5ng8BYeiHhU+z3mqlu4HQgpUXIIHLwqIO+Si
 uXVOxZ7OKbnsCTLDivL64TH81y6q3J5LTY0LBsb9UdRr+FEbCrLqcb9dtT4UtwwpalqAF0FOU4u
 M2Une6oT7rjpzKsDAyxlf5gJAfr+f/VO/KluuxGUZPSUhiK19G0vtqr77a0Czvc59zsQlRaDkRA
 XgQmMjd6zFowUAX84=
X-Received: by 2002:a05:6000:2689:b0:463:8aaf:d7ef with SMTP id
 ffacd0b85a97d-46a7e9f3df2mr28277721f8f.2.1782485724604; 
 Fri, 26 Jun 2026 07:55:24 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c9f240c3dsm24273030f8f.35.2026.06.26.07.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:55:24 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:55:23 +0200
Message-ID: <20260626145523.342786-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617185844.736701-1-bernd@kuhls.net>
References: <20260617185844.736701-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485725; x=1783090525; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/H6MqpUGrt0uRjWjJtp+Vy4ubYkjQDZJKtegEq9vYXs=;
 b=LZnoqQhebWN/W8JuzVf5oiVHkixed0uHz7gebI8F4TatjzanAH6kxo7Oqd6gwJ5ck5
 c94wcz1vWVOXYAEedbZChzKkv0Qav7ujN2FQXu9MrhX5tFVdMSuKC1Q0DjjB6GNbuBfa
 7JF9mSqHjosKAM/aTTFAZWMo2T0HMpCwiDbtdfVQpPIChkz0C1ukG5Y+ZzLD5shaT93F
 k/LhGxH3CfLZl5hdTFrIwGk9qjubO6x42JhTINYscoJ7ECrBUajiXunNYFOGmMt0woN+
 5sMXNykPntKJ3b/wAeHs3k5MflY7EJQ6Poy2YubBmezGc8QKiec3aFEVB7F33Q87rM6E
 ms1g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LZnoqQhe
Subject: Re: [Buildroot] [PATCH 1/1] package/squid: security bump version to
 7.6
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
> https://github.com/squid-cache/squid/blob/SQUID_7_6/ChangeLog
> https://seclists.org/oss-sec/2026/q2/896
> 
> Fixes CVE-2026-47729 and CVE-2026-50012.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.05.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/ddc267d7369b295a47838888dce316c02f22f5fc
> with the exception of an unrelated build error of the libcap package
> using the defconfig br-arm-full-static.
> 
>  package/squid/squid.hash | 4 ++--
>  package/squid/squid.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/squid/squid.hash b/package/squid/squid.hash
> index 508b5517c5..fe362e9a2e 100644
> --- a/package/squid/squid.hash
> +++ b/package/squid/squid.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/squid-cache/squid/releases/tag/SQUID_7_5
> -sha256  f6058907db0150d2f5d228482b5a9e5678920cf368ae0ccbcecceb2ff4c35106  squid-7.5.tar.xz
> +# From https://github.com/squid-cache/squid/releases/tag/SQUID_7_6
> +sha256  852178fdc37c5b0786a934fc990c7d2fffc82acf19b2284be209b96431d25992  squid-7.6.tar.xz
>  # Locally calculated
>  sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
> diff --git a/package/squid/squid.mk b/package/squid/squid.mk
> index 6d403c6c2e..627fef0b9e 100644
> --- a/package/squid/squid.mk
> +++ b/package/squid/squid.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SQUID_VERSION = 7.5
> +SQUID_VERSION = 7.6
>  SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
>  SQUID_SITE = https://github.com/squid-cache/squid/releases/download/SQUID_$(subst .,_,$(SQUID_VERSION))
>  SQUID_LICENSE = GPL-2.0+
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
