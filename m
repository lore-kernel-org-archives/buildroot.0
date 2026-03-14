Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02839107BCFE
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 07:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC41960EFB;
	Sat, 14 Mar 2026 07:53:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cveu6hmz6fzz; Sat, 14 Mar 2026 07:53:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AACFC60F01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773474806;
	bh=V0wZ8e/UvkPmGi/K9NQsdmjy5koe0RmjNvqyEktmVwI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Bclk+CHa0Je98o1BWHa56LID4vQg3LQOwZoR1jRgCZkolfJrvwJ+f3KDha5+saAgd
	 alQws5Nzh0/SvUjLnkvXfVIXe+MMTl+TZ3ihN3O18mvF26G3wFY6/xxnuxC4vaSglD
	 rKS72s3g21oJ4pt4mxj1hqWBScv8+ySKPL/D3oVgvV5ni0SjVrkmL/ta5sVuWGvztq
	 SLcnMFLovVubPasNWx9Z8UqLsnSdv8xj2iNpnxsc3xDVHEE1J9T8mEJWC8HspTbF7l
	 k3ywye/MiIlLndDTwDxbNyQahjJbGLEZSv38MsN35oVrmtBMJEl9xw1srOlxDCIYls
	 GO+UU4YyVqskg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AACFC60F01;
	Sat, 14 Mar 2026 07:53:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A4BE201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BDDF60EE7
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:53:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O3PBPb-1kMtr for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 07:53:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6F34360ED9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F34360ED9
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F34360ED9
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:53:23 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-48541edecf9so30760035e9.1
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 00:53:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773474801; x=1774079601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JlTaxu+yEuX0sHTzhP/qLjxEpEFmYJ2fG0my/EyHNnk=;
 b=r4LRAKkdyJ08/EjadTwN9d3M4k87CbDSqgsDlYTAhhxRkBJU0oFfWvSQsMjkTzb+Zf
 Z7DiCgEso4qfMfrO2aXnBC5T/scQDbG1zb9JrFBWIU+XT9FHtCUu8R3qfPDWR2y/qzzj
 C5AR67zBgBR7x7W7Ri1rl4aeZfqHFgcKUcWTC7Ph8z1rjUd2RgTXWakeEcyiWOsR0YIk
 y+we3E2zUlhJFJmbsnxpFkimKC1ji2Rb6J1oskF7KVDZTZYDe0zeoh3Loe5UPbPUjImh
 whpQV5vgmI6E8xL/i+U58pzqTEJ0IPNXiiZrgShe9/DaAPD6V1WrvLmvqwNMvGVJeAvl
 AA6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQE3Hiyiv4TtfORGURd1lEZHhHytgaFmKR6NZSNsaGmaIU9fbBVe1ETulWKOnegUlybNhYHi7NBgg=@buildroot.org
X-Gm-Message-State: AOJu0YwhQVUn0PWWttH2pXikMPmXIB+hPdXR5Nrgrfb89Njs64WOlE3p
 X5hL0r+xS1ZEJS3aq45LUKCw+EAeXIr7vpSi/u1yLV0kc4EQcFO18n6/OFvzTvMnB6pjH0Tcg55
 Uyw4t
X-Gm-Gg: ATEYQzwStTQu7XMsK0RJw5LtKGre0ysXTmuF2JM1S/8Ecrlj9ta+CROTZvU5NdPomH6
 oaG8E6EfDdDtYVs0VZBEtsKr07itBqENP91IdW0g3ZJHlatsDe1agjgM4xj+ccR+qkb/7kBYZya
 j/U5sqe77t7ss/58NL8IGIrBM7AFcn84Z2wEopPBWQHfcrGJ28qACT1vteCT4THOPXZi3WT4H7n
 mqUvaVdp5JcwDcFBEiJBvg7jq/heNjqMu4kVXhSYB8SKZjxbabVnpfLegZ6imxzpOWTCKU/gqyI
 MwdeGd3Au892z/V5fek0op3OfSykE+HfP+7qi74fSkcugZAb2/AyD1490r+WI+gc07eFu05tlDQ
 0XqvbB98VCzMaX2h8iftTJYYSdHUaq5G1OJFLAim50TAQG526nmq3WYk7DZ5DLOblAMsFTR85F5
 drcEE9cSigvlmjhnKcIKMciSqjEQ==
X-Received: by 2002:a05:600c:8b72:b0:485:4328:407a with SMTP id
 5b1f17b1804b1-485566f7999mr97146055e9.19.1773474801162; 
 Sat, 14 Mar 2026 00:53:21 -0700 (PDT)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48556413456sm39886275e9.5.2026.03.14.00.53.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Mar 2026 00:53:20 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 14 Mar 2026 08:53:19 +0100
Message-ID: <20260314075319.14555-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304193908.3512983-1-bernd@kuhls.net>
References: <20260304193908.3512983-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773474801; x=1774079601; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JlTaxu+yEuX0sHTzhP/qLjxEpEFmYJ2fG0my/EyHNnk=;
 b=aAQA1/U8FT3WpA3UZQfl0fWyL7D2aVl8aQVKpUHCeCkL+vE/MT4EkI1PifOdXAIgXh
 kBHmQUoTltH70KiWaD2rNbmVd8egh+LtxFZ6vgI4Tijk2AbKJjE4PsV+VoPkBwaVWvRb
 i3tn6ZzwDEZ+Mzj6Unjt1zDwJ5aIFg1d8RFaGty7vI621lqUAq5PMX3NAzzBBg9g1uWb
 uN4v4/X36g4/4ey9XI7wRUQpDPCieopiFs2hwp+6rq1f6zoHLy+TEA9Y+6LE+DUGnXYl
 mYhEp8Z130LAnfvqHAJCviaQRFUfNf8hfoR+yablxZ+FngxI7HWQG2yr69/LEqFKEYSc
 EzfQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=aAQA1/U8
Subject: Re: [Buildroot] [PATCH 1/1] package/clamav: security bump version
 to 1.5.2
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
> https://blog.clamav.net/2026/03/clamav-152-and-144-security-patch.html
> 
> Fixes CVE-2026-20031: https://www.cve.org/CVERecord?id=CVE-2026-20031
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.11.x & 2026.02.x. Thanks

> ---
>  package/clamav/clamav.hash | 2 +-
>  package/clamav/clamav.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
> index 807c8fc2ea..db50d77194 100644
> --- a/package/clamav/clamav.hash
> +++ b/package/clamav/clamav.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256  64fe4a16a5622c1d71efe9ed7f2c2fbd37f8f237da9f11ff66b73038df71db91  clamav-1.5.1.tar.gz
> +sha256  f34018cf22f05bdd9d1a1574ca07193e3e030ca52050c3e5c220e23a32314965  clamav-1.5.2.tar.gz
>  sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING.txt
>  sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING/COPYING.bzip2
>  sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING/COPYING.file
> diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
> index bda714ea65..7f8008ab5f 100644
> --- a/package/clamav/clamav.mk
> +++ b/package/clamav/clamav.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -CLAMAV_VERSION = 1.5.1
> +CLAMAV_VERSION = 1.5.2
>  CLAMAV_SITE = https://www.clamav.net/downloads/production
>  CLAMAV_LICENSE = GPL-2.0
>  CLAMAV_LICENSE_FILES = \
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
