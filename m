Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0434C27C53
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 17:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A737042805;
	Fri,  7 Jun 2024 17:07:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GkwkCWljdjNu; Fri,  7 Jun 2024 17:06:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34E25428A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34E25428A4;
	Fri,  7 Jun 2024 17:06:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 04C4E1BF969
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27F676158A
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4JK5Cf73_lkU for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 17:06:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 60ACC6152F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60ACC6152F
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 60ACC6152F
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 17:06:12 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-421396e3918so27987525e9.0
 for <buildroot@buildroot.org>; Fri, 07 Jun 2024 10:06:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717779970; x=1718384770;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5YQleT/TDJcFKTolFgGtJfr3uSBdKxReksMWVGli+Ew=;
 b=rAPMVPF1wL8jJMv5r0wMohUMrUl9RjazQjwHNP2y9hB5F3567aCeyuI+i4OOEAjjuz
 A29Kp+3ynC5GEpRMK/jcR/ghKrMn8LJsZ/KGrA+zuu/iHeeIqUFPDxSsqQ4xUSQc5p1C
 2eiliYV3SkPC3F5yJGlVamZC4S9pxGfRkUjn2Vha+PnN0+cHOaiQBnvW0lYJI2+9LyzO
 XFrVv9g257GcAeEeRQiyHajI3gUUzCJl+qti7TUOdW1mWSEsVG9ChSNYCBNHod0Ru1pZ
 o8yl9+8KnKCY+S3Q/A/M/umDhMbAFh8Bb0J9TqJRyp+bM7EMly0TBYa94zqSO7bEAs3J
 7NLQ==
X-Gm-Message-State: AOJu0YyjyW05/XGWFH87Qy1owt0Yf0FTrMGEPR+20WZXAqjWkD7bddPq
 tYhBA0iO3y757xVNHbpUNMJIytK6L5HOCnSacOjVAYvHG1ifKFIjUdEfJQ==
X-Google-Smtp-Source: AGHT+IE2eAmlOZXfZNtE8Pfd8ggtuxUO17y8Ur8YLUjLuzoD1lCNE1yby9P8tyDLZWDi1qjIsNt/9Q==
X-Received: by 2002:a5d:64c1:0:b0:354:f8a9:351 with SMTP id
 ffacd0b85a97d-35efed15b7bmr3498658f8f.3.1717779970346; 
 Fri, 07 Jun 2024 10:06:10 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5e989c9sm4355379f8f.73.2024.06.07.10.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 10:06:10 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri,  7 Jun 2024 19:05:59 +0200
Message-ID: <bb6a8adec9ee1abff34dd0e043841a77aa529987.1717779951.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717779951.git.yann.morin.1998@free.fr>
References: <cover.1717779951.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717779970; x=1718384770; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5YQleT/TDJcFKTolFgGtJfr3uSBdKxReksMWVGli+Ew=;
 b=nOF6XszN1r20emnvFK4ToM7DzJCGkr/whBixDfKcNqM4zcVthPaIc6dBCIthpcRWxM
 FMQvDbmIMLzEARD+WvVjrlyCGC2RDWjL3jCVt142noMFHzJ+eCzby3yLrdcc1Pmqh9/5
 Nv36rdFnkp9sB3YCmxmiODTV/x9luJae/xTAUSwwb5arfrE20+emIwQLGULSN63xyIHd
 KNc6w6xStnkKpTzZJKb+cQs1RofBURv3EoY8fTZEfLBr36/6+hzcG6if2/5lYVwE0KU2
 jeSiThAmOvk8YbGYuRmF7Y7WAreD8CtomNAH4tlLsu+xI61BTcY7VB+tA59mpi5+hTUF
 oouQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nOF6XszN
Subject: [Buildroot] [PATCH 18/20 v2] package/pkg-utils: accept
 pacakge-specific archive format version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-utils.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index d1964299af..598ae6605e 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -47,8 +47,9 @@ pkgname = $(lastword $(subst /, ,$(pkgdir)))
 
 # Helper to build the extension for a package archive, based on various
 # conditions.
+# NOTE! _EXTRA_FMT_VERSION should only be set by the infra, not individual packages!
 # $(1): upper-case package name
-pkg_source_ext = $(BR_FMT_VERSION_$($(1)_SITE_METHOD))$(BR_FMT_VERSION_$($(1)_DOWNLOAD_POST_PROCESS)).tar.gz
+pkg_source_ext = $(BR_FMT_VERSION_$($(1)_SITE_METHOD))$(BR_FMT_VERSION_$($(1)_DOWNLOAD_POST_PROCESS))$($(1)_EXTRA_FMT_VERSION).tar.gz
 
 # Define extractors for different archive suffixes
 INFLATE.bz2  = $(BZCAT)
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
