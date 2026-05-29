Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C2ECD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C5C661514;
	Fri, 29 May 2026 08:29:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lKGclD-LA1CM; Fri, 29 May 2026 08:29:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B9EB6150D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043357;
	bh=HgpEpCJaNduBGi0yUns/qMACH1GlOS0tAelzd2KXA1o=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ioonx8MPZGgWaowh1T0Il6TB5BmrsG86x6ZO4wThtCsOp4Ya9XCNqzN5jvtLFnD56
	 bYha/m/stcPeWG1lmiEJFfn97JXavvscU69ANevuc9dzTLkctvSiu8thoYyRNz0j7u
	 qoKa5wveg1rCXrPWEHWmyz+SejtZZrZAYNYrFYdZZyKXT2WWaZTzjGxP1m4zLyzzVr
	 /Lj5d0G16R4ols2FZTeerSrc1uM9ah3qVf+0t8b0oHzXuI98Z5KqSL5pIqXdQ73eZ7
	 puDIgVXWV9ffEURk98gyj5rLqMUeveClfRRe3ePNFcf/q1EvDcTN2BwRZ7Vf1ogPV1
	 VpMo4ks8L1f/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B9EB6150D;
	Fri, 29 May 2026 08:29:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D787B28E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B630A421FF
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IxMwR7hoIRON for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:29:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7C4B5421F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C4B5421F7
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C4B5421F7
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:12 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-49042aeeb75so91063035e9.1
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043350; x=1780648150;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Tx+LmyE3NAIhN9zJ0zNl2BfNbtUsPhZMuuj3gpHSq0U=;
 b=n9whbOuM0V/wc3j1EbfQc3X54CGp/o/5w6Szal+OUHeoy78nDELl2PelFrqunHej+b
 Gb7UcQ3BX2taiG/8gg5jPllJlntZrJgt6lhz340RKp7fp7WGIHYBLDBwViqP8TayJPvG
 1dEa47XDCTHcpKgbslOEpEAtR/csUEtpxdRzZnDqJwt7rM+eiWB2gcnT6Ue+xiF3yX5T
 Ks1EkRurrzOcMIiqqIkJqnAc4oCpXlUHhAdV/AjnlB63nP/cMWJwi/NgDyj17kJiIEAs
 pNMvMW9hNESLifvp4lKR8LMwjSjNk56qBpLk1VJmsTnErWm3RsvFvqCk121KOTKWBqXY
 jwDg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+N6azc0PhO17GrGyiF0V18UJYZaQIpALwk4ihVp/qWqXH4TTIZFT9hAgsihV+ORQ/Km0SPDNX88rU=@buildroot.org
X-Gm-Message-State: AOJu0YyvEhJt3/4QmAenD3FfOWU8CpqtTmELAuVzxcfQudsMBh+ze33X
 SOACIRUYATkZ4xVYZ/58hq6jATsutag3gZGiKPXHNTriKeb7/4NY1EVci7KfsASwqUU=
X-Gm-Gg: Acq92OEddZ5mpu4VdriviIHl0qGL03dpzTT48r5XKmGNiQ/A67w2099v5JFAi1ub4PW
 y0eozWasytC0Pcs8nWKZhvjMEeMAqufLLaJBOf5y53gpi2hqyUOeND9/0Kt7+rSqEx/1dU0RG7/
 W+bAD2/XXl8i4Rlg4xGX1kYM+mGOkZcM7m02PrThiDyHtmN2P9232xu/lexz/gdURfC9rUENKeN
 iviw/uhPsyp9PFuy/OWouZEbq8hpTAPZpJbD+lNCJ1IlpE3Tj7T+RkoRo75a+epu9FrU3iy1Deu
 PgRJMnTJfYkEfYHk78qoqjUeOrL+t6RmUpKbPqsUcrcb+QETgROdMyFpQ6GsTDQV7l9t4km+hnS
 0p2Xqft2Ctx3/fpa6Z0WZ6XABc5LVih54ewALvaEYMD1Mx/1GuiIHnBmiiz+RcppAMcDblySdCN
 o3JefFnHP53uFGA0duLzWF0jBRh+WozzdyanWTa0IOUskgzZT3DDMWkZmtmA==
X-Received: by 2002:a05:600c:154f:b0:490:3c15:7146 with SMTP id
 5b1f17b1804b1-4909c0cfa25mr31378005e9.19.1780043350407; 
 Fri, 29 May 2026 01:29:10 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909d68980csm31883385e9.1.2026.05.29.01.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:29:10 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:29:09 +0200
Message-ID: <20260529082909.56734-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260102141225.167269-1-bernd@kuhls.net>
References: <20260102141225.167269-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043350; x=1780648150; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tx+LmyE3NAIhN9zJ0zNl2BfNbtUsPhZMuuj3gpHSq0U=;
 b=ITwGM3X4yKsZtuX0DAxFm1Y3VMc+ZwhT47raW2NCp2VjkJeb2Web1Dau8MVQ181ox5
 NDh0e8DirNgvkvtm3WlQ7rpXN+XG/6A/CgzZbWRrO4bP/GPgNX5jMuSuxssze4JHwtQ+
 6C3RLtRQTIqea5aOlyDOows9Cwu/Ihscoz2IVuaR2fvtIfhXi8BKN8mkrHL9BIbTbRta
 xuKigBvhJOIenrLEDTgRR3V8EGhN0FsEZb3GSHUlLAatBzZ6fiKF2ob3gQLFupIKj5wo
 Ex/er6btXlyY9IuuRkwYcRtSbtXOSZbfi4LgH3hNhaEB5hsbeJsXFDUiC78U9Zr2P3Ay
 y6+g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ITwGM3X4
Subject: Re: [Buildroot] [PATCH 1/1] package/libheif: security bump version
 to 1.21.1
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
> https://github.com/strukturag/libheif/releases/tag/v1.21.0
> https://github.com/strukturag/libheif/releases/tag/v1.21.1
> 
> Fixes CVE-2025-68431.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  package/libheif/libheif.hash | 2 +-
>  package/libheif/libheif.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
> index da2516a583..3da82e3e27 100644
> --- a/package/libheif/libheif.hash
> +++ b/package/libheif/libheif.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  68ac9084243004e0ef3633f184eeae85d615fe7e4444373a0a21cebccae9d12a  libheif-1.20.2.tar.gz
> +sha256  9799b4b1c19006f052bcf399c761cc147e279762683cefaf16871dbb9b4ea2a1  libheif-1.21.1.tar.gz
>  sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
> diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
> index d82ec6a0ec..acd302d847 100644
> --- a/package/libheif/libheif.mk
> +++ b/package/libheif/libheif.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBHEIF_VERSION = 1.20.2
> +LIBHEIF_VERSION = 1.21.1
>  LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
>  LIBHEIF_LICENSE = LGPL-3.0+
>  LIBHEIF_LICENSE_FILES = COPYING
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
