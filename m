Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F59C44506
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C193A40DB2;
	Fri, 10 Jul 2026 13:52:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mV1wXIu1zHLF; Fri, 10 Jul 2026 13:52:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1553D40D6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691540;
	bh=MbbWYaRO0+ND5lJGPrC/huU4CvM5HMl1pHKgisx3kHw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EzmCYWSvvhPftvbIDQ/cYAqsF3EpowNZE44cmYwiWnaKq85txRUSBNxpQ8TKVhCf4
	 P3x84MMl8dzzUJVIeeqBsi91EjU7vIWiTrkEzf3I8ETLZs8c99x+lMkILyjIa4Vi7O
	 76WVLjwjazlRoId7YnZZFG+eVdmlGpYS35U2AzuCJ/EJGVjgY5yyVdWlKNQFRJSdDW
	 cc15ChtmdDVVG0Ss/1pDC2s0YPKzoQb+JaWgkIVRN9OaTs/A3tZjvf1Nt0cClTtOkh
	 chRFaM09qbmpjwEy6XtC0amMFYgZ5gWqd5VZmnFDc3fCJVTAoq5y5XizXPwxxsB4ey
	 noklaJ9+hC1Sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1553D40D6C;
	Fri, 10 Jul 2026 13:52:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B69B02FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4722400D1
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XT_miMgz9X32 for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:52:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9BB2D40120
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BB2D40120
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9BB2D40120
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:16 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so8579975e9.0
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 06:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783691535; x=1784296335;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=vxthUz4ElBdcxL+4cI/UZ/i970PQIOCkxYmWQNRchu0=;
 b=AP+r4XkSM5Gyqnm2l9zQ0nyq7FpjzIx8uH/aOrQibFVEe8CvELKUYYZptiFxYVPNV2
 416l/HF/XCepa0prSuHEVSlJKkJ58DiHeDxEp0oyqg+Pak4e0csXjnpfVZPU1vIXsnGK
 Q2RBrtHvu0RCf5EbQgUOa88bodYmr+j/U1bEl7/aXIt2GcY994iE0F7SHZjAxpdjxk5G
 Lv4hPQftfYCQToqHaL4Z6QAOs9xgOOHgnvRfC2F9P9dLCy7ptH6rBPoBqQSTZYfWRxnA
 n/sxYNBVQ4vkA2bReTmIupWil9bIN1w7RUP5lxl2fafej4fxcl6bjfYMsdo7bGIHw2hk
 6jGA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpvse0hhPkuK170tmuoAGUpY/oy46NnWiem2Q+8wDk1RM9kQcVr4y2Z+KbAlXXnd6Xlo0RUBoMy3/U=@buildroot.org
X-Gm-Message-State: AOJu0YxGz/FZsqVyKwRuGJV/zmLsDrImGKSZk57B7sCzKSH6LP+/HkUc
 UxWsLZZinSihOYPZntrxqh9QoO3ShMMbshgxvIYFBnW+CY3hbRjDPcUGI5KBBmBOG6XENidp7f7
 sEOtR
X-Gm-Gg: AfdE7cmWP4SElQs1bBR+rX0nH7ByHNTKPAiwfT+e7FE63jf/6jYvPT6xGtYj7R1ex1c
 g052lb4Ry2uSHPnu/2fbbrCEZ9whT40pIMubj0iMRvinH8GBB2WbEcwUeyvDRwmouXY04XBzc2W
 HztaxnBXHZOXSmm1VSrXEwmZZJOCjxEfWgiLQIntxzBu9QSWn2c1P6m3JswUxrxGSfU2FYmts4t
 FxR4LqSqj8vgUk//bDHQ5EATV9PdMt67u7T2Fq53im8wQAwyoRYzB0L7usCcrYSam6tJx7rRq05
 w26Zzs28c2cxRgxB311moJTNC/IVYBfrij69vL8NHUtg8DebBGO7nIaB6sEf3Md6yTPlM+2EiF+
 9f1Ewt8QnfyLvvED/DMSs1vaZyP00tDFK5EYobet3A71VUzgL9nX4eETDwni9IntakAgvRZkdZh
 kR8+oY6g==
X-Received: by 2002:a05:600c:34c9:b0:493:bc4a:fb50 with SMTP id
 5b1f17b1804b1-493e68fd540mr115417285e9.38.1783691534626; 
 Fri, 10 Jul 2026 06:52:14 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa039b126sm59240002f8f.24.2026.07.10.06.52.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 06:52:14 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 10 Jul 2026 15:52:13 +0200
Message-ID: <20260710135213.760574-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260705075745.3485915-1-bernd@kuhls.net>
References: <20260705075745.3485915-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783691535; x=1784296335; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vxthUz4ElBdcxL+4cI/UZ/i970PQIOCkxYmWQNRchu0=;
 b=cmKP5WuAoytyKCKgDCzOBbPEC8JKbDud92QwBAYMABpa3L+/JVk9I55v4tduabJXPT
 WldLVCsTGVEb+oqXQf0jH89hhaaYQXe33xk8r9sxRCtRiElINSgMplv/BGvEqMrqRNha
 eGYRo3eGVstCcfwF6B0TsdC9Q72yhMZFohcvA5DZyrtL+o4K+/cR9SK2z+Ri0Hc2iEkS
 qoT3qDDRGaa5lmJNT5FTRPFe5b2kBeVXVuhQq2pt7lWBs4BokOgh4t/ecJsyxS4aX0Lp
 LF1HoIDmoQ5apIeSl4NVEp1Upwe6/JoOY7mn8RgS6gzVC/AnBqNs7F8Kmnq2mnOSbnJ6
 YvfA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cmKP5WuA
Subject: Re: [Buildroot] [PATCH 1/1] package/hwdata: bump version to 0.409
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
> https://github.com/vcrhonek/hwdata/releases/tag/v0.409
> https://github.com/vcrhonek/hwdata/releases/tag/v0.408
> https://github.com/vcrhonek/hwdata/releases/tag/v0.407
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.05.x & 2025.02.x. Thanks

> ---
> Gitlab pipeline passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/2e51c00910a914bc0f9aac50361e7a3500bb7878
> 
>  package/hwdata/hwdata.hash | 2 +-
>  package/hwdata/hwdata.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
> index b7323fe117..74a7f5e7e7 100644
> --- a/package/hwdata/hwdata.hash
> +++ b/package/hwdata/hwdata.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated
> -sha256  1ccfd1ca723595b1fe8794f4157ec5635be1ebedb5d13769b4be75d0b75bc199  hwdata-0.406.tar.gz
> +sha256  23006accc0f931dd5187d0307a57d0744e2b8feb85e73c37bc0f5229fb31eadd  hwdata-0.409.tar.gz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
> diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
> index e12ce7efb6..7300b908b1 100644
> --- a/package/hwdata/hwdata.mk
> +++ b/package/hwdata/hwdata.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -HWDATA_VERSION = 0.406
> +HWDATA_VERSION = 0.409
>  HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
>  HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
>  HWDATA_LICENSE_FILES = COPYING LICENSE
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
