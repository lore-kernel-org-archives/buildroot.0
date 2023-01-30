Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C90C61D97
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 17:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7859681E0A;
	Mon, 30 Jan 2023 17:07:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7859681E0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qwv3AvG17K39; Mon, 30 Jan 2023 17:07:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9E2781DF5;
	Mon, 30 Jan 2023 17:07:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9E2781DF5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AF2711BF28E
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 17:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87C1781DF5
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 17:07:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87C1781DF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mlPi0hLmkYtQ for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 17:07:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB8DC81AF6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB8DC81AF6
 for <buildroot@busybox.net>; Mon, 30 Jan 2023 17:07:22 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 j32-20020a05600c1c2000b003dc4fd6e61dso3682980wms.5
 for <buildroot@busybox.net>; Mon, 30 Jan 2023 09:07:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O6cJRsa32WNbdRH0fTM+DYAUMTbafLAWD31WvBQT8Kc=;
 b=eyLaPOTcabBElfce5L+i7ekeW+X49bGr2KS0FBM289zxaLuPB8Zk1GxP8el+dtbf5+
 wVFX6OwTc6SIRpAEh9Kxg5riQGEwRHGpbhpoMqmSq8axAEsBfT6ZavEbVMjzZzi04HxD
 af76A7CTj0fYPAD7ipO6/rTWkLwCsg9CkkJ1b/q5mK7SqYK8BC7A2/7sRhiTvPGGtWlF
 2jx+4vdhdtnretR+Zwjun1P2RDjdhlPB5Exv9S5q1RVzvAzm+pRkBG+ONISO/7ItxlIs
 6MOlkv3bBEI+MjBlpXz1TXHnu0ODMMdw4JTU1dTsK2e869H3KQrPVfJmCI+CkclVO4Hu
 Pz2A==
X-Gm-Message-State: AFqh2koN5Ys3GAUT6y6h29y0mtIhwVbAOkGxBSSZEikXrzQIug8yGd0F
 LJeAXHW++cj3vqR7Nv5s+/qhZtAkAlI=
X-Google-Smtp-Source: AMrXdXtRRmk2bzXlIqAADMPl4M5tp0dx59SUxV3eyUoyb0NJ8icJdFX43RXrQg6gDLM/pY25GSu2Gg==
X-Received: by 2002:a05:600c:1d8e:b0:3d1:fcb4:4074 with SMTP id
 p14-20020a05600c1d8e00b003d1fcb44074mr51820958wms.22.1675098440902; 
 Mon, 30 Jan 2023 09:07:20 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a05600c46d100b003dc530186e1sm6811231wmo.45.2023.01.30.09.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 09:07:20 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 30 Jan 2023 18:07:13 +0100
Message-Id: <20230130170713.13590-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O6cJRsa32WNbdRH0fTM+DYAUMTbafLAWD31WvBQT8Kc=;
 b=gTrirKXsTa00Wk0mFoFN+5QfkLQsAFJ2Bfnrekn4/A7jKYGHt32bKMhcZR5uAUvwiI
 khHFXGhJOlxWduNPnre9JQgVDlc/w13abWIfXQY11/pH5V+/by82w5vXtzSnKutRhO7y
 EP+pTzzCuTfuD/SEuwN3YfABi0fqyV6kaBN6MA3I0mGG/EsZeNRUbXgO2TSIv0mGaMnK
 G//PSm9QzvfJthOUBJeBNZnw/MWe3PElXUIrcMxtxi6tz/7IOK5cyrbxJWHzvhNuhglt
 a/UAJXSXJk8JNWl4xp3v/y3w5g2sKept1pTeHx2xGUTvb6ZqWy2iyREYO8lypajI4I+2
 J5cA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gTrirKXs
Subject: [Buildroot] [PATCH] package/luaposix: bump to version 36.0
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

diff LICENSE:
-Copyright (C) 2006-2021 luaposix authors
+Copyright (C) 2006-2023 luaposix authors

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luaposix/luaposix.hash | 4 ++--
 package/luaposix/luaposix.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luaposix/luaposix.hash b/package/luaposix/luaposix.hash
index ee76ea103..fc0b5fa74 100644
--- a/package/luaposix/luaposix.hash
+++ b/package/luaposix/luaposix.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1b5c48d2abd59de0738d1fc1e6204e44979ad2a1a26e8e22a2d6215dd502c797  luaposix-35.1.tar.gz
-sha256  f50bc0f3197523b1709f31707425f2de95f8a45534b081a6b564179ab059e850  LICENSE
+sha256  e0fcb4996f76aa49ae3e5edf69978171091e3d69d5de5589d591d227f8a427c1  luaposix-36.0.tar.gz
+sha256  ea0fdaae50b0d31a81c2c99f4354264783c71043fd40522feaa40eecc069599b  LICENSE
diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
index fa2670915..1a537defc 100644
--- a/package/luaposix/luaposix.mk
+++ b/package/luaposix/luaposix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAPOSIX_VERSION = 35.1
+LUAPOSIX_VERSION = 36.0
 LUAPOSIX_SITE = $(call github,luaposix,luaposix,v$(LUAPOSIX_VERSION))
 LUAPOSIX_LICENSE = MIT
 LUAPOSIX_LICENSE_FILES = LICENSE
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
