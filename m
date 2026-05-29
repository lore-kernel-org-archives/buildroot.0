Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DFACD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DBBC615EF;
	Fri, 29 May 2026 08:30:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xS-m8FK7pb4k; Fri, 29 May 2026 08:30:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED1A361600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043457;
	bh=yLTEhMY4MmAbojfOX55TPB1gBtNNAqntGBOA4Ez2mNA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qxCDx91Dc29LpNrRGP7dbeleBs5yiHITOTmO0zuTTsnRRmObr1dqshWWnqJf8ls7S
	 U61HfT6dgrMrt1QXBzoEBhLwAAPnHw0lo0FL5uySDccqdPVqf/z7aWAxl3VUWZVBRe
	 Nb6cJR9a5rJHxryOzMSfjpUE2EfV5F0THC1QKAmXFS78OZJNh3MIQKFWop4be494pA
	 8Vhzp7SCM8OJ8txSX3pqmRE+whbAC12jaAgUsZrKPDOSO5Q3wMK/63cD2+1cOD3TMk
	 Klj74W6E1pjh8i0RF4Gg9+QPh1VRbisbcZykZUM7NM9S+/hnu/5L8X7KvcouWgEx/U
	 siweBHEJ/nH9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED1A361600;
	Fri, 29 May 2026 08:30:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 73E9028E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 553A342360
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rgHC0HRIDp5G for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:30:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3C64D4235E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C64D4235E
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C64D4235E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:38 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-45ebafde87cso4699107f8f.3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043436; x=1780648236;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HBoaQ7aC0H7/6ImvYC1r54ppJMg9nJUhAmYzcBc2dvw=;
 b=V4Dx1Lrkp0Ypo77skt/hObWl1NlSlgAJ/nbSeVG8t6M5wF7/aPWYYE2E1eNU0J0nNH
 qhHb+lEu9FJ9Y9d6hQ54fdKNpYhhPRwOt8dpBCuqMp3BAT6NM1Xuylp7n+hxuzmz/3Nq
 Gs1Lwcj0Fgnru3f51oxQmakH5diVgzA17uEgVQT0zBfUhgR/mInU0G+o1D/1JeNkEVFz
 1Iu4lR5SyuVTQGvlX82oTDrKHVTeIALizZIQoLXxttPCcLcnNzwM7HXLuLJIPezHjnjQ
 cNFEQl3lsLEUWkCZQwlqlgehnD/8WSwxJpXDtMBtTuQt7GeZTCr76bemybNFZXzJkDxF
 AYGQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8LfECN7u28gECeqAZWqMBGA9zb6aS2BCeFbXdsuZWdbU60mt/wwFHKysRr27JgUkGFfnqxSc3jzGo=@buildroot.org
X-Gm-Message-State: AOJu0YxuQZw8hwHUEILexRva7+PaftfDzykem3KqlCZ67QnkWOCL9oWA
 8w/RCkCx4jybzIhGLNZ0J5lw71f0iVhlvzlXrdRsvrTccOA57U8QRtICu8+TMtOVJTU=
X-Gm-Gg: Acq92OEllxtSIHp2QWjMzV4OkblDFO0Q0BK1xyb8WR/AvW1JblQmEFhENBSsufMmp11
 1DCjDWJTKenQZYnwUUEkf0kbWfATovqxUWJ7ghoIWjXvUCvu7RQUf5OZdIK0mL8AWoeYO5I9P5I
 ZXg03+cDCQHwIScKbeFG7Vw6NaVibf87tzB8/zuDc7kJOby1VrauKu6jaxtFg/fE9b2440GnBg/
 1EzI2Zzf0ibQK3h54jg8JkhGcq0WhY3QI0+mvLXwQktPQJkrcia1xKccZTt4l8ds+fqCrRrbFZv
 vfP2UAlbGwuEiEYZJGLj61rHEXOwOQOuaKmYMjpLkMgLzzrcE7EcvFS6kF5CrcZM+iESSNJN2XG
 wW+c8Q15l00a3CPf8J4/7ioQPDPTrQmZTkHYv4IFJ5msOixZ6fytZm2FAHxkpy3URcQXz1iu7MW
 s6G7dymfJOuQ01T1n2hoShdQo1VZEVcn9vmxttXp1brKqAS4v8NKs+ex4c8g==
X-Received: by 2002:adf:e650:0:b0:43d:1c21:ead5 with SMTP id
 ffacd0b85a97d-45ef144a693mr2436809f8f.22.1780043436010; 
 Fri, 29 May 2026 01:30:36 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef3563cb9sm1889123f8f.29.2026.05.29.01.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:30:35 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:30:35 +0200
Message-ID: <20260529083035.60096-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520180023.338276-3-bernd@kuhls.net>
References: <20260520180023.338276-3-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043436; x=1780648236; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HBoaQ7aC0H7/6ImvYC1r54ppJMg9nJUhAmYzcBc2dvw=;
 b=W91N2VjcVuK5euGs/UW0yauSxIq66EZQnnDYgSoUfnMQIUWN4EU3azWQz9LroYhm4b
 5D9b1S4KueuW8292iGWIqo2WBlfVc3u/ZOfKmcwimT+25YLgHlWhiBF6efKKUu2ynEPj
 uJyf8HI5MQ62zYSzvZKBPZcJkSrIFK8bdcveuFZ9ZksVAyZlsGeqoLivgbVNW+BodXS7
 mn6ZHW2ZNPbfr4wTE6B2qXA1+wCw4fAM3Z4hi3FHEz2s3K31eWy1K9WSw+T8p/9NVpth
 f7LdIBne4sp+moJXyegrFhSEEcI3lN803EPcCHc57qMsC75Vo2oCnjyhlAuL6VrqWXBe
 D82g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=W91N2Vjc
Subject: Re: [Buildroot] [PATCH 3/3] package/imagemagick: security bump
 version to 7.1.2-23
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
> https://github.com/ImageMagick/Website/blob/main/ChangeLog.md#712-23---2026-05-17
> 
> Fixes the following CVEs:
> CVE-2026-42326, CVE-2026-45031, CVE-2026-45358, CVE-2026-45359,
> CVE-2026-45624, CVE-2026-45664, CVE-2026-46520, CVE-2026-46521,
> CVE-2026-46522, CVE-2026-46523, CVE-2026-46557 & CVE-2026-46559.
> [copied list of CVEs from
>  https://www.news.de/technik/859626214/imagemagick-gefaehrdet-it-sicherheitshinweis-vom-bsi-und-bug-report-bekannte-schwachstellen-und-sicherheitsluecken/1/]
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/imagemagick/imagemagick.hash | 2 +-
>  package/imagemagick/imagemagick.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
> index a308cd1f06..fa46fc7cde 100644
> --- a/package/imagemagick/imagemagick.hash
> +++ b/package/imagemagick/imagemagick.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  91ffe35706ef01d0fc9630e3a81b168b9bdb10b5e1e0b0983c287063cce21210  imagemagick-7.1.2-19.tar.gz
> +sha256  f129f7d87fc21da453d032dd291b80ea13faf2497f13ef8279d97759ed7d5c46  imagemagick-7.1.2-23.tar.gz
>  sha256  131447ad0099069beaa32acf1700716eea294a5bdf936d8211d7026b1849e5d4  LICENSE
> diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
> index d88323ca2d..e08f0a803c 100644
> --- a/package/imagemagick/imagemagick.mk
> +++ b/package/imagemagick/imagemagick.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -IMAGEMAGICK_VERSION = 7.1.2-19
> +IMAGEMAGICK_VERSION = 7.1.2-23
>  IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
>  IMAGEMAGICK_LICENSE = Apache-2.0
>  IMAGEMAGICK_LICENSE_FILES = LICENSE
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
