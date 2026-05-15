Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0412BCD4F47
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3F658437E;
	Fri, 15 May 2026 13:34:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sU75e1wj3gXW; Fri, 15 May 2026 13:34:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3F5384240
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852068;
	bh=HBXEYjVQ+8RGBw7dV5OP4voJK9+MW/PzUpFDayT8oMw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JhVm8UnMf6PLDoHdkMsxvm33L8+Y+/zvdHv+z9+Ve54GoGwZl0aENABbaIHRT33NR
	 RGFvNomm74QBFHZe/Kdmg4PFgnuKho3hpf3P8M1ZCYszunCZlU7T12/GA0DXV+WhyE
	 H44TOBaA8TgOi+IVhNYQIbhXVrfosezH88OGYT0k5mFfae/VNE89Un9hrBpzPookMW
	 FGZaJbZE31DKzZgIhGT3IInZv6JX9oS0Yd1PYGolfsycnT3uWTx3k2Hv2vb1HDZo3n
	 p2yM02PBKIzwp5kE/uOsjtOSoRd1g1dspIX59UNcboiz9ZxAqWS4iAsNmNknx8OOKr
	 ft2opdz+FxWRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3F5384240;
	Fri, 15 May 2026 13:34:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 569DA42B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47B4484375
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mtbwHOVjeseL for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:34:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6ACB984368
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6ACB984368
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6ACB984368
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:21 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4891b0786beso59955335e9.1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:34:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778852059; x=1779456859;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MtDrGmwG47/Pj5PSiRAqYsmyFXFXIkK9Bm6Pr6pnEFc=;
 b=iJwRqb7YsU+40AaL29/LGvnxJfSW+wvRZHHPvaO89Sbq/wT1M7ceS1AOp4jeIPaWkm
 AW8YOXPkDFaUlnto9FiFKTxk6WLxDF2OgJ5201hYDdHqsR1wdIhBhY9tU/Zy7SEw4ymm
 QV+b8QpmlOryBkKyJXgCOJS+zGL8CD6NJD7fPIsjSZhUcmhMRM5aqmpahpMal+7vIrOa
 ceDhvzqw+tiMcRhd9rcmscAlx77RrlYcq6DO+BLQMgVSkZJGvDRHr9zFIXaxNkpUTR3e
 ImkNWhA/prB+UdJoctZYHQP3GudlNWN5bATykUqQzuw1JRK8BhTdDQoALhi4sB1yyEsv
 EMWQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/pECUO4sGIDaHuXDL4e9DmXaJCE+uQfK79ABnlGY+xuDPICT49AewzCpf54eJ30O1WfEq0N0ixCUU=@buildroot.org
X-Gm-Message-State: AOJu0Yxm0IS67YTHnbD4fKrKBbiI/EcdU1XwHQBdKGN1htn6O7p3w1XV
 fUJpA0kn1jJdjxkQOOrjZkt5aAWEZ0GCfIGKhm7YbOGRG9oSb63ZJFadztsQshn7j5pkmqu4548
 GD7SM
X-Gm-Gg: Acq92OEqUq9yTK1H3NXsEt9/weHJLSDWoqcYyRBXlXs4gZWxHVJyMEZVgB/TweC7CKO
 5Qx5OBYFG1u2n1rdYJxUKFOe8g1Kbee3HLR8nwesZ/b52rEH37vlSlOAiyAnZUjbDt8hMy8mBT7
 SZrAC9JwRyErDdiPhoP0nsp3mBanUw+AqfXP2P44h5QooUdzElBbHREKePqf26fbLPKI6i8Hwhy
 XvcKOBqEmKAviy/o9eo9wuDLUc9co6spysT14oo3KvZJiZsEzUI/GFedTRoRrP5f3ta2aVDpjUj
 uHQ5clKvyFTMZuFhI6fj/JUj9cM5IBrKVw2/aELflBWZBauZQCH8YOpDWBoNJm909Vlq9UeYM2F
 uVVuDHfUTRgcGG/Wd7bohCpjgencRwx86cs0baozW/zd6SWJislRwCkDIOYZCHwxbnVjwoA2ysS
 rNkt/T2zHYqrncJ8a5zz9+H7oIOd7MvKWMxBUyuPdRQQmU
X-Received: by 2002:a05:600c:4692:b0:485:4eaf:eb53 with SMTP id
 5b1f17b1804b1-48fe632661bmr56408275e9.19.1778852059449; 
 Fri, 15 May 2026 06:34:19 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9adc2209sm13175346f8f.0.2026.05.15.06.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:34:18 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 15:34:18 +0200
Message-ID: <20260515133418.316861-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430044114.7686-1-bernd@kuhls.net>
References: <20260430044114.7686-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778852059; x=1779456859; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MtDrGmwG47/Pj5PSiRAqYsmyFXFXIkK9Bm6Pr6pnEFc=;
 b=TX/LoCC9RNHlEGN5QYh5Z8XPwvzNKxsCzzkeRdLDnhGoCn5K62/2f8Dls1mPrH7kBq
 EP18sIZxLXOYIN8u/LGuGw9RHHyXsaHZHFTViAeVBScbbQym6ei3XutLeicdaiv8F5VG
 vllSivD102eoTEJV+Ze/QbrYgWpVb56HUj7t/1NZdvz06DqqUcBFb2nnJnz4VF4Aampe
 9PGdWE3wBZZO3G74mEqovEnlQ6ttdA65Mu/AhrCXOMLQIT2M41qeGxKkwxBwaaPBDPaa
 AlNFKJRpwEPnF+QK5DMIZVJVZQtbKjm3MPHulvMBoO3UxdjWI2hup259TjHrEIk7/NAe
 qX3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TX/LoCC9
Subject: Re: [Buildroot] [PATCH 1/1] package/rsync: security bump version to
 3.4.2
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
> https://download.samba.org/pub/rsync/NEWS#3.4.2
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/rsync/rsync.hash | 4 ++--
>  package/rsync/rsync.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/rsync/rsync.hash b/package/rsync/rsync.hash
> index 5feacd0663..933d330323 100644
> --- a/package/rsync/rsync.hash
> +++ b/package/rsync/rsync.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -# https://rsync.samba.org/ftp/rsync/src/rsync-3.4.1.tar.gz.asc
> -sha256  2924bcb3a1ed8b551fc101f740b9f0fe0a202b115027647cf69850d65fd88c52  rsync-3.4.1.tar.gz
> +# https://rsync.samba.org/ftp/rsync/src/rsync-3.4.2.tar.gz.asc
> +sha256  ff10aa2c151cd4b2dbbe6135126dbc854046113d2dfb49572a348233267eb315  rsync-3.4.2.tar.gz
>  # Locally calculated
>  sha256  85c19ea50a224c2d0067a69c083584e5717b40b76610ec1218f91385775067dd  COPYING
> diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
> index e4c02a756f..3282a759c6 100644
> --- a/package/rsync/rsync.mk
> +++ b/package/rsync/rsync.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RSYNC_VERSION = 3.4.1
> +RSYNC_VERSION = 3.4.2
>  RSYNC_SITE = https://rsync.samba.org/ftp/rsync/src
>  RSYNC_LICENSE = GPL-3.0+ with exceptions
>  RSYNC_LICENSE_FILES = COPYING
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
