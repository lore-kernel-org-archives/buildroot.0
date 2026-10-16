Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880B1CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E55581754;
	Fri, 16 Oct 2026 15:05:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Axd1iff8HD4P; Fri, 16 Oct 2026 15:05:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 400B881751
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163148;
	b=Wn+gEBRr3p9Fz7mpOfrAvzWT4u2hZgtmIwzoTShQvhsPb78auJ8BNeaFvyO+j3idZGW1
	 s2ccGhOhcnmrARHSXP4it4skVJ3QUBPSUhVbSvNu6i8hRQ3gC1PH/1LpYwosZfxfqMU69
	 EyaGAY6BE6aZNL+OEji5b5gdsW8oOzzIuFzfbO3xJDSZHh66XjBjIKm5PnEBHqYjpXkqu
	 oiVO4cwT8A476vOEbskDwAGpYAcUajzL3Xw9eR1JZV0nbBGmLfVi7JQt15GFyw0NBSfu+
	 raF9LwvQPwvWxcidOxXA5p29jQVT8zr4yamAdbCf3V1U3m04r17WCu/VfaPlMNaU8ZQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163148;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=VwfLgj2+5QWvssQwkVADdQ7RPK3MChWFGHFoGWm4mMg=;
	b=I9Q8hVO36IRIleb3909IexiZ1t5NlYu/YOndfVHubS1yiPGvCTnRW3XWr+8TDvjJ0KtS
	 uVg21b5ydiTU27Gaz3cLpGVWMhfl5FPQdzekNvf3nxEtcKn0K6wV/XFLYm5jrKP2mIaA5
	 iFDlBEAO66NKovcEfr2hvuyZ/duv5/ie915htW97wLGu9SIEBmeETnJd3MojZP5RcdOkt
	 q8JR71RLw0XMqRx/gIVtju07J99DcbuD0P1mLLK/EPbBzGt7Z/q91fYlGJB3rI9MXGGeS
	 FWDYORNGGERlKHQDkIk54rRid4rpwHj2FTQNPbK8Q1XZ9sw1leKBOoyPQfF0fPo16iA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163148;
	bh=VwfLgj2+5QWvssQwkVADdQ7RPK3MChWFGHFoGWm4mMg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=syW+yNEXljpY0iyt+wtIJGJcTG1P434hCheD50Csseepz4ioS2Jnd9mVBhk/xu3Zb
	 kZEoiYb/ns9t4J9tSSi6RFzYAUcv7PdAJRcx82y9ox3BTEr3dgkUxQbS1jdrv4+aCG
	 5mCGcyVXH5FfanEA1rmVImFPq5pj3rBOmb3uDoJLTXD61afPlaxrCzn+Sb0ZupyAfZ
	 BQ8o/Syy/6j0Scnnmyhn17NYw/PbFGZTpqNIKa+0LWpbkZBnAevgehr0iRztt075xu
	 DXyjNRjj7+uNKJzbQBDEkngcjtsoELScM1i6s4+F0Af87A8SgE2EfAnkHvEOLs3uxP
	 4MPA0l+qSBPYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 400B881751;
	Fri, 16 Oct 2026 15:05:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D749D255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D520C81751
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m6T_2y6k6HFu for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:05:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 747A4816E0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163145;
 b=Tl1JQ/2VtQryruLKMNotLvIx3yaxEl4wJvgS1NpG1tyFQNJb1i4LabVqD7qovEL2IvHV
 9b5j7UNYYDcpdOrbJwpLmaO9Swv6RSs9meYGjvrj7CXMJtFKm53S6hnd5cdyKW0aCV2d1
 c9N3j+HXPM2LxMFHB6qqYRsIPy7wTdkW7Vv0NUZ5IAnQq6WHT+cNHDlU+JuxhV1hQ1/nG
 ORFXtxpwrelqaS6Wi/2210iqVRwco8ChIvZgnm+fisYDLS0fyTMCiieumI+tzkJIV7UPT
 kX8qrtNeizHSg8Se9z7/XZaZXpImAw5UjYKW49tDPCvP8d1x6gcAaa3Eq61BQMjp/zg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163145;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=QrLOAlMXgXWkOLSpEviL0N3cDgdOx0AxPvUVxCur7no=;
 b=XInWhitVuIVVIF6CJ8WQUoxKyf0hkKYpjBDdFsYOMn6FrED4n3W88uxkCpPnXCmeEa3+
 yEKxMkQ2kLtaSPLJP0JuQh55RTb451uap3a3IWZFw12RIYwhHaP01CJXycWGHsUrLamB7
 1TUI8CTr5kdcV+TmlnK2e1FPFMj7EPHx6fHu24RyUKU3CNhciRGRB+yFW3QyTyHE0dmD4
 bP0ZC+H6HGxJoELXl+XbhtzhmL5TCaeLnCYqhPeZkHe/L9fCHHlDqF9wWXM39Ew9XgZmu
 guWT+OR3As6mxtUaVKeEZbzIyL4WEatK8yMtWqMdNjX4UzyAuxo3sp/3oi9D3VNt24Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Esca0aAa; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 747A4816E0
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:05:45 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a1d293b293so317015e9.2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:05:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163143; x=1792767943;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=QrLOAlMXgXWkOLSpEviL0N3cDgdOx0AxPvUVxCur7no=;
 b=b3cbm6qwZrv4mOfm2/SY+dZgFWB1CfJNU5PNedevVJO57e0DF+XqX6DVNAQyQiKDCT
 NLR5DBtchqvVb+kr5h5dbrTHsyyKz9L/Ya5j6L7By86KrazKxCf0UDadhksUNE7n3F/2
 piXFtY3Hkva882LBCafg9Dc+JSFni3SsxoywaW7INJPlzfChVXgem+X4kiO3nXNoZug4
 VjMUpIUPElbQVlc5reHszZZeVcy1TJlV299xoZmJALPcFw+6WvyorSV42yWIhPJlWDKw
 Ki+jAPLJ06V8xvt4M7ovR3dWulDQZsIwMW5U0dT7ZDvzBY/IE3MGJxTODSJzK3FM8i9/
 TtsA==
X-Gm-Message-State: AFq9FYL09iOa4j1Z4zlm3EDUSDzZlLnyvU/CSy+238S3GnF6KoqwSGqv
 +9jy33LKfK0ODt909pU5YF51xN16+XXS4M5jUJfTzfu+yThsiqcdaaEOetWmwdg/J5QHikz0mgS
 6pLMbPrc=
X-Gm-Gg: AYBFou3vY+8rh0UlLXZhirf6VqX4wwW9oy28kGlgZKxPPMlZqGKFgmtGcOvUIfQegek
 ZNu6rI0r8JHi90WxeXaC7GiNTRzyS96g6/+IC81xMdeKIR1clxXTUxQRPrUjW31j7D9ihraIYz0
 MS5wJO/AOJvHgHa9ODTEVD9LD6HyIdgxZTv/0XxfhNiII9sDOyNz9C1zM62NYkD9VjUmyRrj58P
 rGStpV7OR9L/93XGgGIbm/X+RB0YOMXDf3yZN3A2EYwC4hyfU8Rxxwuayasrih4DALHqx2fpLPg
 qkgP1MhY4ahzBycZ1zyFnKfZLpz3lR76isAyqraOTjVwerTQdpC8wzYJnclD/K1kTJ5c+30bq7t
 zuLJAwYVRXRMXiTIKFsYYyd6HIBOOE6q+di2/H1KVT4dsTvRRd0PIsun3TS3qu7xIsFFHSzgx53
 9OMSS/cUNvzWW1zB1m0KjhT8S8o4FHelV1VZrwWHdOisreg12Nc31rZ2E36QoCQXn+Qd//plHap
 T+RtsjIngTQsTBLYPpWkEJ9jUc/0KMPJ7dm2dBINQ==
X-Received: by 2002:a05:600d:8496:10b0:4a1:c342:a226 with SMTP id
 5b1f17b1804b1-4a1d75af37amr1814965e9.2.1792163142733; 
 Fri, 16 Oct 2026 08:05:42 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1c10fe9d3sm131987255e9.13.2026.10.16.08.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:05:42 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:05:39 +0200
Message-ID: <20261016150541.74799-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261007195935.1615148-1-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/expat: security bump version to
 2.9.0
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> https://github.com/libexpat/libexpat/blob/R_2_9_0/expat/Changes
> https://blog.hartwork.org/posts/expat-2-9-0-released/
> 
> Fixes CVE-2026-77214 & CVE-2026-102633.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/7f94443e4e632c515950d3489c6af67a6d4ab81d
> 
>  package/expat/expat.hash | 4 ++--
>  package/expat/expat.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/expat/expat.hash b/package/expat/expat.hash
> index 262ad4bf0d..41778fc536 100644
> --- a/package/expat/expat.hash
> +++ b/package/expat/expat.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_5
> -sha256  1e727b8933ec51a77a9a9d9afcf8e688bce45d907c13e36ab7393fe36e703182  expat-2.8.5.tar.xz
> +# From https://github.com/libexpat/libexpat/releases/tag/R_2_9_0
> +sha256  1e6371862cc31999b368c3b89b49994f0677e1bab5f1b2b85ae3741f5d803051  expat-2.9.0.tar.xz
>  # Locally calculated
>  sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
> diff --git a/package/expat/expat.mk b/package/expat/expat.mk
> index be4180992f..be5d8ae0b8 100644
> --- a/package/expat/expat.mk
> +++ b/package/expat/expat.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -EXPAT_VERSION = 2.8.5
> +EXPAT_VERSION = 2.9.0
>  EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
>  EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
>  EXPAT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
