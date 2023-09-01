Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC39CA0FF5
	for <buildroot@archiver.kernel.org>; Fri,  1 Sep 2023 19:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92DFE613CA;
	Fri,  1 Sep 2023 19:16:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92DFE613CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ugg0evTTEGpO; Fri,  1 Sep 2023 19:16:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA21F613CB;
	Fri,  1 Sep 2023 19:16:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA21F613CB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 225E61BF576
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 19:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFCF183BAC
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 19:16:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFCF183BAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U6HDzo3oqx8j for <buildroot@lists.busybox.net>;
 Fri,  1 Sep 2023 19:16:16 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81A9A83BA3
 for <buildroot@busybox.net>; Fri,  1 Sep 2023 19:16:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81A9A83BA3
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fee8af9cb9so23290085e9.1
 for <buildroot@busybox.net>; Fri, 01 Sep 2023 12:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693595774; x=1694200574;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SYDL7nGpMeiWHbKOSEWJ+94LuKDMpSUk1KElEC2tx/o=;
 b=Bk6WzsLoWKyH6deRdiuKliIE8wqdoVlaRGIVXf0lzLqqosC470RlfK//WnExmVd47t
 OAQXuP5yY6BFcNYIhJBHpIgjE1f1etrtyqVW+HXXX5TXwVai9qEEDqngPiIv/+gaoQyr
 1mP5itDmbySpyP0SYS7uG8D4nDgBUAsvSk6UPb5obJ7NxAd/mwMRjgK5hzB3gJZ6dtY2
 xViCz4gvSHBmDeg+9EFEkUT896E0Uk2TCLQtWkXu6X8RXehIi5j5Ko7ZDfJiyjoDeRHj
 YzLbGHr83rEz0PO2EfAcF3SHQm3DDN21eEqgP2aMPjDjs/kNhH7d6nMK/B3Mk1uPIJzk
 tVOw==
X-Gm-Message-State: AOJu0YzConSdf2GW4lrUFplOnmrX75f7RlyuaVagVft3td6b+DnRHSYn
 dNFjQjj35s0LFJdURStZ0Iaruq1JbBU=
X-Google-Smtp-Source: AGHT+IHlty4TAszlnxwmXBh8hRUycgmtRdIh/0XZRsHj4ZOdUzJ1YEvp+X1d6gzMA45wMJMUM3lOnw==
X-Received: by 2002:a7b:cb9a:0:b0:401:b53e:6c58 with SMTP id
 m26-20020a7bcb9a000000b00401b53e6c58mr2387075wmi.26.1693595774336; 
 Fri, 01 Sep 2023 12:16:14 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 p22-20020a1c7416000000b003fe23b10fdfsm8892090wmc.36.2023.09.01.12.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 12:16:13 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri,  1 Sep 2023 21:14:47 +0200
Message-Id: <20230901191447.717460-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693595774; x=1694200574; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SYDL7nGpMeiWHbKOSEWJ+94LuKDMpSUk1KElEC2tx/o=;
 b=WhsEdZvvShMvPPDt9eC9KXKfSk9+E3nG7+z08AHC5Z+RyMJTilLUIc1hogonUgfauY
 4irpA6Koih0bpvnmqHuD1f61c9c3ln59hfXEcI5pALN8y86JAtFXh/7DRhfznbPkBOcm
 MmxQt9DZwml5HWDCQAUPGmeifwhbzdIw1rOwO/pbTJKRF+X4O6lL5cm9RA42UTINvXA4
 /J0+4PfRPq65vEnKdhnob24qCJPupoVGUWgmQsvar9bQBaAlwy95SFaVz0oYrMgQQb3L
 uc7696+rlhUxH219AAYixQMVHJFSPFis+7gy8kRO4HaaoPNw5hWuyaw3gQ0ikEjd7Dm7
 lzgg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=WhsEdZvv
Subject: [Buildroot] [PATCH] package/mc: bump to version 4.8.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/mc/mc.hash | 4 ++--
 package/mc/mc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mc/mc.hash b/package/mc/mc.hash
index 5edfc7911..93462afa6 100644
--- a/package/mc/mc.hash
+++ b/package/mc/mc.hash
@@ -1,4 +1,4 @@
-# Hash from http://ftp.midnight-commander.org/mc-4.8.29.sha256
-sha256  01d8a3b94f58180cca5bf17257b5078d1fd6fd27a9b5c0e970ec767549540ad4  mc-4.8.29.tar.xz
+# Hash from http://ftp.midnight-commander.org/mc-4.8.30.sha256
+sha256  5ebc3cb2144b970c5149fda556c4ad50b78780494696cdf2d14a53204c95c7df  mc-4.8.30.tar.xz
 # sha256 locally computed:
 sha256  5576bbec76296e1c8e081f7037ebd01bdada388635f58d844a2f20d37bbe4284  COPYING
diff --git a/package/mc/mc.mk b/package/mc/mc.mk
index 894b23144..2b4279c30 100644
--- a/package/mc/mc.mk
+++ b/package/mc/mc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MC_VERSION = 4.8.29
+MC_VERSION = 4.8.30
 MC_SOURCE = mc-$(MC_VERSION).tar.xz
 MC_SITE = http://ftp.midnight-commander.org
 MC_LICENSE = GPL-3.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
