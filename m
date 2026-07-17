Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AA5C4451C
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 602BF40BD8;
	Fri, 17 Jul 2026 15:47:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jY09sGdq6s5C; Fri, 17 Jul 2026 15:47:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 379A840B75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303270;
	bh=xC6xtRwvZvJYPo8SP+OF9HDm+6U0qVi3SbAIaOCPdPo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Lcg9YZARI4PHmH05YWdpkOzb23fulkOZHvIQUVE7R9nPY7oPSUMyomWLwpEiTCRef
	 UUXOmzvdIgoOhPl8rezsr3HgkGBn27KBObFEHOWON5EXsmMaqrUzG3nUfni95EoYb/
	 h6vtpue+mUTbrLDrR4c1XoQSkSn61/2RI1N06TE2ulWIzhH6sUMGHhcpZzFLGamePT
	 TqTbQcM27nMoyxTpbmUjHFW+EMu4y3PbGkdeZ47WVtZKPpXZaIghdbSdmXNuC+54I2
	 XjE4ScXerZjijg9nqn3RwA98/kySLLwHOJhcMUM+22Jyg0rRWU3AmPDpZP6vn2Vj7S
	 O6MUisTcz8vJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 379A840B75;
	Fri, 17 Jul 2026 15:47:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 929E536E
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 843B960732
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2tuY6yDNyifM for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:47:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 72DA36065E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72DA36065E
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72DA36065E
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:44 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-47defd0c1c5so3700869f8f.3
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 08:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784303262; x=1784908062;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZPeIb2+hmy+pQefnImjFg02sjCgTAzFcOLIvKV5XCok=;
 b=j34pIV88UWp5Dg72foaMWiT7c2eYAiUAcyGw3/QH/rqfyUp0eUKUT+ufW6aOLtSoVG
 xY/+kFH43de4NNoxCc+rkWqlLx7CVFT3wNdSgEuMPh6rNRjo24rjqfM/4MwXxCTGtnSE
 LML8kbnFPA3gt0IuPgExPjQU0vOZFuNu1vRZSyeOU0SthcydQE74tEI1E7neNQi3tcEb
 9bu4IlUGBuj7IskK9PwAW6n+0mttF6oBB3xcNEUMMmADhmpu6NW/b6cy29CD3DkYfw9h
 G5D63nKztx36N5nBrqvSuNDFZsffobL0FBuXJLX+FegfbzJYZ89YfDcgSD7pDXQGIJ1m
 7mzQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrjJzrF6n7atZhUFDW3aw51i0AeRXMmv0K6FVZi5EdD/0gyAzzV54xrBubHkhbNisw6p2IJrAZE1kU=@buildroot.org
X-Gm-Message-State: AOJu0YzXQLP/MBPvSdECG3s/V1WXTZq3DOiUZCcPz6PV0XBro79oUwCS
 CJae9fzmaOeF3BNwFNGuG7uxgp2KpWhoepWgkLNJrkRIWR40fqyzl0URhCOmfJYgEVs=
X-Gm-Gg: AfdE7cnHo95qU706U4puM426JBpAHQ8taUvS84J8+L6I0jXOq5nX3qm4qPrq5Ngmh+q
 9+34sUpLIOz6QwuYlkQbvnjGE62R4g3+naqfFsyOakTE5wtV8TgwVRcqUBvzzgB4XjZl3YdE/Uw
 HIvzWg6/16AwsNWtJdYPW3Q9yEQE1v+MhsPrs4wDw8HFbyOz2dvuf27LlYMZWZ3q0yXnHNXHAGd
 NLhsG49Nq6EG5G4QT1n9O9MlUD655zeTcWXU6CHHnlSGE0F3gm10bymZOQa/KVBhnKCOKFYIuv9
 t2PIZmBxOFJkuEdQ1xgRgJixm/V4EQOkYefGZR/RDeSfZi0iOPaQdojsfcPr9CP0uYZNIGD84XH
 shwFUq7z0N5+HB6ZSwV/ALmx3LWKiCJQ2JBsgEGl4bJ6LwiLPZJ/OrOytzhSA2xlfIPdpkuU=
X-Received: by 2002:a05:600c:3143:b0:493:e79e:da98 with SMTP id
 5b1f17b1804b1-4954a413071mr41356075e9.39.1784303262213; 
 Fri, 17 Jul 2026 08:47:42 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63e519f4sm4662449f8f.14.2026.07.17.08.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 08:47:41 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Jul 2026 17:47:41 +0200
Message-ID: <20260717154741.192433-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260712113058.1579954-2-bernd@kuhls.net>
References: <20260712113058.1579954-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1784303262; x=1784908062; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZPeIb2+hmy+pQefnImjFg02sjCgTAzFcOLIvKV5XCok=;
 b=JAqHclrOFWSmbcq1xvNXrPeGhWSOFUYswUEU5IsC8MKd64Lf30okqOED5S2bKczVba
 0Xy47s+iNLMMZ6+6jU7cqR18bhId39KtJA/2Bz7+z0h796bl7xr7MwCoQ17OqO9mC1nU
 xL3cSQs+CjNj7U7l//cX9Og6dMeswgpGlV2gjXy71lhdxFyF1wpEiL4iSRgOihv1MHZZ
 P7l3og2VxB4DGqjj+UplhsKeNP58nPtbXbbzH4MQEq+znVunAR1dJ4WqVlaIww+9OWAC
 NQ5OKEm9MCyARELh61SpIf/1Hq8U71rOzU5KD1fLF4ne9yIji1QXSmDH9RQsb9k0w5tw
 D8vQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JAqHclrO
Subject: Re: [Buildroot] [PATCH 2/4] package/x11r7/xserver_xorg-server:
 security bump version to 21.1.24
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
> https://lists.x.org/archives/xorg-announce/2026-July/003718.html
> https://lists.x.org/archives/xorg-announce/2026-July/003716.html
> 
> Fixes
> -  CVE-2026-55999: glamor Font Atlas Heap Buffer Overflow
> -  CVE-2026-56000: GLX contextTags Use-After-Free in CommonMakeCurrent()
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/ac5c6561894d41b86a43af13c4a5af16612c9195
> https://gitlab.com/bkuhls/buildroot/-/commits/9c78a853c88fa85f7a31404b4ab324370cf049f6
> 
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 6 +++---
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
> index 5f10908c8a..1f664e88e4 100644
> --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
> +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
> @@ -1,5 +1,5 @@
> -# From https://lists.x.org/archives/xorg-announce/2026-June/003703.html
> -sha256  e39832e5617dadaf072fdf9f0e19e5d2e1c2a13607ac280bac1aba9f8fe14634  xorg-server-21.1.23.tar.xz
> -sha512  7eae854af1b5db1f5d1e59cb9d26b86d98fa176d4f80f70935c707f17982d0446a0a8ad8d29c922edbd208435f995b027604fbb72e62a7bf3ba79f2f570aa0bb  xorg-server-21.1.23.tar.xz
> +# From https://lists.x.org/archives/xorg-announce/2026-July/003718.html
> +sha256  1a4eb36ca65cc3b1b936566d677a9786e13c11cd5806e951ac55f3f5ce3984af  xorg-server-21.1.24.tar.xz
> +sha512  f51372b04fe21632fc778ff240705161ed2dccc0114dbe3ee25156d8ac85ec945e2ac05d8638bc7d8d54bad4dfc89cb26b6bd2058b7804d54ab7179e1ac2eb13  xorg-server-21.1.24.tar.xz
>  # Locally calculated
>  sha256  c9f90a6669109aad6c9a7c3b46cc2c574221a73b792afa419336816b49da5c11  COPYING
> diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> index cecbb821ae..d1596a8a3f 100644
> --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XSERVER_XORG_SERVER_VERSION = 21.1.23
> +XSERVER_XORG_SERVER_VERSION = 21.1.24
>  XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.xz
>  XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
>  XSERVER_XORG_SERVER_LICENSE = MIT
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
