Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE14C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61CB58120B;
	Fri, 10 Jul 2026 13:52:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XLpUcqa-QC7L; Fri, 10 Jul 2026 13:52:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16DAF81180
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691575;
	bh=qKsrwiX3yOKf8Jy+mwem1f1GbC5tKzkLjvO+3Fy5t6I=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mr/ZI/+kdOxdXRKMIPZRoTb6CP8BrDsXi6/zGXZo0d6gUxszRfoiK7ud0BbuSF2lk
	 c6A15wLqncbCz7uf8xGN/cgQ6XRPTWw3K2GFhUdNO4W0iSJtnaiVw3m7EwaUAb3I0E
	 d71jVCzO++hkzqjmLiZAJgCSFQXA7kA7XZJnf+XOvvxTgrnCpbusMLhDbKZVnsUUzn
	 6Mu0Deg6YYo69PwHNlZpOKKUAoYQtj7+kHImsgu4IPGj19d1B02NgB6Vughrc2OB9G
	 J7oE1Jxiy4k3al34rnqISsHBV/UXw7DHhNEEPUQu13lU1jO048mhNJzIw6L8RIggMK
	 w0CKtIQWs56Lw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16DAF81180;
	Fri, 10 Jul 2026 13:52:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 63F0A2FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 603CC40DBD
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id COcainqhY8Zk for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:52:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 62CE740D86
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62CE740D86
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 62CE740D86
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:50 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-493f431e317so5897325e9.0
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 06:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783691568; x=1784296368;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=bgaDQn1GN+JH/kHT5PhIW58z3xTAOFAjuiTfkdRUfsc=;
 b=Du9eGIWc90dED1hge4KeIwiYcXaFeVYaudicBJ6bSrfaktgSJaGHND2y+A+SRNvM8O
 gjxsVGWaTMb/fR2JFJ7D61KFrtYFMgrU6HPyTsu5+Ix3Kzdos+eq32l/12CfGVy1P8Eg
 GF85UaGjPAjsN+eJ+y7E53SwQGg6KYYP1isJul0LiTZNQfp5QVZumgs51oP4NzlF4H4L
 QxQboTmd8mxSZqpZG5U1N3UCO8CFbeZpSExTFDPlnaEUKOO6hHWhV1xp5QF0lgy+P8gk
 fWgL/VAFRVzuF2nzqdy3jPvTyq0qCIZkgx10r8kP0vhwjqlDj8S/Zsev0nankV5JW51G
 8wsw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrBVzwkYdt+sMiF3J71sCWOSxpGXcvOvxHCtig/hrt3WRWayhYx0+5tCmOOlnhaiAjw0/YonLLatIk=@buildroot.org
X-Gm-Message-State: AOJu0YzRPebKcN7+FMnnpEQXlOIN4isU27zTYZoZ5SH9xJwV8XR50hvM
 1RT0xvEGaCbDw7FqfwrhM9K7QEQir5/TvJ83FhQc4AmGUnuqTgTT73Qt8QM6Xxekl+/PcZ8UU9p
 RoX9x
X-Gm-Gg: AfdE7cnR7klOLOjusskV0WdGpOxeAUfyoXy1iktyW3RokVzKgG57oajXeMuSFQNPkiF
 Z8Rki+mgTy6ZEKuUkq/346fU7755VO3D6WxNgT723l5vaQBp0/RFxUf2RTx37JWWkR1nAVNLXET
 IAjVzap6zx6QXDioJ3jUwBzHbtdsZlc5QWHGUJX+Da9dlUOcDh79502/gRyh4dDtjfxdVyXqoA4
 i5hfhWaiKvtaN4HJetFZisP8K++A1/vw8w69vo5aRrMk/8iXt7MYBengmvNPILbuQwXlELcf3yb
 V2xTqxdjCnEVLQjTv0Nomd1YYFD6qPOCGuQf+b0cRSiaYG/0n6W4Q62xFJ0P5TT58OLx7JpniJ8
 lJJezPKd4G7oEDwfio9KFfsc1NQqD7RiJ9FY7EzbwC2tirQpMewJQvrw4DiOIsYZ6NXGL5VEqGX
 EOAo8pfQ==
X-Received: by 2002:a05:600c:5308:b0:493:d0f7:69c3 with SMTP id
 5b1f17b1804b1-493e68eefecmr111242525e9.33.1783691568352; 
 Fri, 10 Jul 2026 06:52:48 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6ccaf1sm248630065e9.2.2026.07.10.06.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 06:52:48 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 10 Jul 2026 15:52:47 +0200
Message-ID: <20260710135247.761030-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260703195050.3703334-1-bernd@kuhls.net>
References: <20260703195050.3703334-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783691568; x=1784296368; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bgaDQn1GN+JH/kHT5PhIW58z3xTAOFAjuiTfkdRUfsc=;
 b=F1XNu9Qx4hJtxLilJrdzXHma/PM0ImYsNfNOSDCu79Ex69Od9MhJQwwTH5PerfEqOn
 /l1Xw4FgwlQw3j30ox72Z5jI0S/D/3te/ZtRgeY1TzcIH65UqIylCgmuxftiZ8/HCfO3
 8VcM1e9vACmU1qiJ82zGpc1B8saT5ZHBhrSI4JjI5TUNAt8kg573mR9wN7RlgiRBkfH9
 S0FmyV7XXRW92BDxtRpgYgfmCfa47xL25H+sS/1Os74C4eJDBeZp6nCxSlzkNjmDA04B
 7iEmWljqV0gAZAFP6e8aXrnLWZDyIL8060KJ9E5YBBKLZfMD5+eEEqSr0sbFP3ZsymDz
 rsBA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=F1XNu9Qx
Subject: Re: [Buildroot] [PATCH 1/1] package/clamav: security bump version
 to 1.5.3
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
> https://blog.clamav.net/2026/07/clamav-153-and-145-security-patch.html
> 
> Fixes CVE-2026-20213, CVE-2026-20214, CVE-2026-20215, CVE-2026-20216,
> CVE-2026-20217, CVE-2026-20243 & CVE-2026-20244.
> 
> "Upgraded the Rust tar dependency to resolve the RUSTSEC-2026-0067 and
>  RUSTSEC-2026-0068 advisories, and upgraded the Rust openssl dependency
>  to resolve CVE-2026-41676."
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.05.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/d020186f5fe23e27e9b1d59374c2f31b4f550616
> 
>  package/clamav/clamav.hash | 2 +-
>  package/clamav/clamav.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
> index db50d77194..be5a2ec5c7 100644
> --- a/package/clamav/clamav.hash
> +++ b/package/clamav/clamav.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256  f34018cf22f05bdd9d1a1574ca07193e3e030ca52050c3e5c220e23a32314965  clamav-1.5.2.tar.gz
> +sha256  89af57a45bbf13de4dc91ed7f20b435388c88428eb7dc30639a02b2f0fc2dad1  clamav-1.5.3.tar.gz
>  sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING.txt
>  sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING/COPYING.bzip2
>  sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING/COPYING.file
> diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
> index 7f8008ab5f..9467174e93 100644
> --- a/package/clamav/clamav.mk
> +++ b/package/clamav/clamav.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -CLAMAV_VERSION = 1.5.2
> +CLAMAV_VERSION = 1.5.3
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
