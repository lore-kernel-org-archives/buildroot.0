Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C98ECC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13B95816A0;
	Fri, 16 Oct 2026 15:04:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iujmQrW8YoOB; Fri, 16 Oct 2026 15:04:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6EA0D81668
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163090;
	b=TbIvIVNf3PsRODKYQnD2rpmoREFl+p8rhigtKK0eaGcBKFRqgEcTf09/6lXhAQINxhO6
	 6V+/qNdOZ/V9EEgnDr53mRS3bCkUVPFsCmpQlnlUVRdUzv46bwbTn0sn4EU1Z1+EI70D4
	 kSNIaXF21DLqrIRICeD7FrD5KcjV7iMx991HN+ivK6nuubc9p75UiCJ5ZPnrBLtITcncr
	 MCrA4Nym6WaGUvFsk8GKdOWZRyAEyIYOJm31hIQYS9L4uCrD/bTaf0PTvSKnndMI5Xegf
	 tfKPnHoX4LkaMpmv0I48vR0TXOOQG4GlAr9TjCOerI4mYMB2O/WY94p0HnBrTCugNTA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163090;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=7driBoMC3wJr2yf9q8nfwo/s9f3t0gbyG7XNjJpMLw8=;
	b=iKWe7JbdhhF0m12utN2Dqn5gKFSb02Six4MPZlSWVUzypZufoEIY+7MBsv4Smy9SD1If
	 AN0VpGe6cgaDzPfgc23Var794YNiIm4isUJrWKXFyAfPILyVZ4A7DmupqiMltK4T/5XAb
	 P1syyFYBzGP1YyJvQlDKzzdDMoGSjqv8UKlu01dwIDvQZJJLyFYuNm6ne6ffOW4hzeqnB
	 1WZ9Dsfupv2bmCinedVN1WGmEPCps0Eozx/Wj1pcZCMYiq89PGWcf4n3+04A+PO/zWuH2
	 pA6wkcNBFdTwWl3DOrvGEsCz4mqmiLQNGRadCfaRTUaX2M304mTroGkoR1OFr4mEERA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163090;
	bh=7driBoMC3wJr2yf9q8nfwo/s9f3t0gbyG7XNjJpMLw8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mALP+xWHXLFVqUyMVYf/JsvGBkbAENO/GZKxfWfNYY0Y0bbAPEc4Jk/5kUxvr9ecT
	 USBQ/zxIN8AoLjvUhO5k77r8Nadne25YArXKReoeGxjD6oeIGA2sHbUfJpQx8SbTYb
	 l0f3eODbJ68Cg9D53gDYUW73ei3ao87ZQd4TJaqvrgkWRfV70b9BqoDt2Q/M057efI
	 c7gLPK0xzJpAw7QxQsTcfuTj+0jcp8uM6wzZMNlyWYkJjTL9EpelNqW14sU8ODE4+R
	 xCjo9Bi1Elai+2rLy7u+crvHsLnWqkSoRR4RSa1un8xjD5t/nRIQfuOsZiqh3qjLwj
	 EMhksgELoD4EA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EA0D81668;
	Fri, 16 Oct 2026 15:04:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EC626255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE18A81690
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2yOjhmOdoFBg for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:04:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B2F1C8165E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163082;
 b=dd4uJJ+B1JEJ9s284mCmq+30ui47WHUjBiMtY4Q4JRG+nNg99EXjXidi0y5aKjMSgC2Y
 ENYB+3uBXaYokPxHKlnL3nZvvJGhpTH0cYQOKxL+EhnJvOD6jNYmxHsdK++dfgzsMKwWp
 FeE0VC78U6704FDMtKlvmKpKp3ldKIlmgy77/PRn9iT9Ez10oeAZ7InhGCBlX2NhsHauf
 MH6yhkHGMDeyLKKADnVQK6wiQv8/FEaErrdL3NiWm64ZkQY30MD4IBElN6/xZ+Y/eeh4F
 zNve2lOSVxoXqyQv3IXv3/RdtrmdEYoOK4gtAxEdm8qc5hXJ89NnUk3cDNbI6CfND1Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163082;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=K2LRMSa5S0+Vmr8hOwOlgSn5zCnrN6bT6bPL7Dl9axA=;
 b=JvuBfQBRcv2auL4a0UpVlxjDcxB8hR6/QDD3pGg/NHQOeK+HWEvPl0ixafteHPrNvUqU
 O5tzY4eLFS6foXSX+hmYKLh9YsMI6Q/hGuchRhpopRCHVYni1R4bwzgDU7g/g1G8woVNu
 ZqU4nYRYOpWsjnvO3CbzPcKEX1xG9KFm903v+GP9pd0ZMwLs8hGofcv2AvshNH4Tl4Oog
 6kkGqVTcNxl38EiMISUuwBYwMnenNmkgT/LnYA5BWUdx272AsFHHqqlAwYC5GAP0klp9O
 z/lspBDsafNEmvSogHcIDjJjQ37UfGRENfaPVRiQUlqqFmc6iZoHxvCp+81Vgeu2aiw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Uff77044; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::429"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B2F1C8165E
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:04:41 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-48de6a62a4cso3490839f8f.2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:04:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163080; x=1792767880;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=K2LRMSa5S0+Vmr8hOwOlgSn5zCnrN6bT6bPL7Dl9axA=;
 b=zw92bqLUMRpkdVpZy7yyaZjzUWtmzvspLsZE7bwLbcxuk73tp6pN+MaY/B43t60Qr9
 CdYZB+zvGQyadSgs0haU7wiWrxNRY4ylR90d5kPWTrWo38FCv8a9ItRFskqZ1ivPBAuL
 Ti1mT8UcO/0oqX718GP93ouZ4C5gyIZZpQhzOAzWRo+s8FLbhOL93TS4ZAWuDzh4bubl
 lEOR92Zzj4aLMj5k5F+445z1b01BRFAQxY1VX7iVAJvMIz1tl/Vfpnx1/peogAP4Tcbb
 3xOAjERxcNmYVyJlZG86sRFWzrdwo+95El/HQzQrg2VFn2B4/R9rJvTBPJL5Jyn1yN4z
 EAoA==
X-Gm-Message-State: AFq9FYJP6cwBIY/JVWD7ZuvkBFvRj+FQnhLalTHeUCMsPFkSSbNmSwx5
 ajFCM2sOL2B4vSSM2rr4uwxFhrzJPsgu7hTafwnmWN61MiTnrZH9KKCV7vvdakb4qhTLp0533fI
 ZFUxyzZc=
X-Gm-Gg: AYBFou3+hddZGUgtwEwCza+YoAhFcPT1nHe65MaTpt9ZpKRDUHsPslAkulzbDhc129x
 mq3wPzfRLmRYg8woeogsoOVhmTTa7JSkD4vgc1DbGXuS3kCHSGFkMY00/Wt8VzACsTaw2LfmbXt
 K/GzYG6v/u5C1qo2muWyIixcnWH02Hbo6zqfIX9JG003bRN7yl775vZe+6+aK3sklC0GWxZ5UeO
 93NBB37eWThdRsR4idwTV2O9V+uvwn9octD9tRLEel2/sPWrRp3us4IvzaXMOZJUWt2ziAdsUks
 4PteFeyu1KJ24CCTpmrr6Uh97uyrIJ8P7BpdMWRPkTk0C8hw+tAeK5t07DDOEw0OfdDvB2yTG/j
 TjQwAWxsxxsFAyfhPd5bTbKwUD7wxXp65M0IUT082as0bq5EXNXHyNFP1mjtzxhzimHfbYBsTva
 3qhtDAaWFXy6AyxJZSrgAncNDN3Naz5q4Jj7l+4JC4QyAfjMXziIpEOxpazPD0kP0nEQGnqA7n6
 luJOHGX+rcvyjy+xPTldNMEnRG6bYQ97niNFklgwL08ix659Qpy
X-Received: by 2002:a05:6000:4919:b0:48e:43a:1d84 with SMTP id
 ffacd0b85a97d-48e043a1e56mr1169210f8f.23.1792163079663; 
 Fri, 16 Oct 2026 08:04:39 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4ee183sm5508920f8f.29.2026.10.16.08.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:04:38 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:04:36 +0200
Message-ID: <20261016150438.68768-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261004080256.2996402-1-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/tzdata: bump version to 2026e
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
> https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/VXIA4AU73OQL3OZ3ZBZHWIASIIVBGUJV/
> https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/L4IGHJRBUQR53F7RTEHM5IS7ZMBR3YXP/
> https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/NVHSX2PAQIT44U5FCCEVNJJYXQMMTJSA/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/tzdata/tzdata.hash | 4 ++--
>  package/tzdata/tzdata.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
> index 4d4d410ce1..e2b278ddac 100644
> --- a/package/tzdata/tzdata.hash
> +++ b/package/tzdata/tzdata.hash
> @@ -1,4 +1,4 @@
> -# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/VX2Z3CBO6KHTYZNBBKFFWM7ZCI6TVCXP/
> -sha512  a44882258c0a7fbe587e8b73d6bb3cd5be7d4788976ea742adbbf176eb3b33e5bd7d1714b2fffe2972b1a42e7335eac39ed0bd63e819bb421550f8cae1df4f2f  tzdata2026b.tar.gz
> +# From https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/VXIA4AU73OQL3OZ3ZBZHWIASIIVBGUJV/
> +sha512  5be2f875f73b75e5783c474bf7a6c768e433cc90283f8fc6a75e3d05bd92aec97936e8a55ccca5e880b5dacc18ba65932bab0e783e1ed5d2af4a3a4df95512be  tzdata2026e.tar.gz
>  # Locally computed:
>  sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
> diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
> index 71f8fc3ac1..221e34773d 100644
> --- a/package/tzdata/tzdata.mk
> +++ b/package/tzdata/tzdata.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TZDATA_VERSION = 2026b
> +TZDATA_VERSION = 2026e
>  TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
>  TZDATA_SITE = https://www.iana.org/time-zones/repository/releases
>  TZDATA_SELINUX_MODULES = tzdata
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
