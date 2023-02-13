Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B477C636D4
	for <buildroot@archiver.kernel.org>; Mon, 13 Feb 2023 18:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FB19409E2;
	Mon, 13 Feb 2023 18:20:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FB19409E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IQ9Ir8YhJSW2; Mon, 13 Feb 2023 18:20:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F427409ED;
	Mon, 13 Feb 2023 18:20:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F427409ED
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A08921BF289
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 18:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A9C481B6D
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 18:20:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A9C481B6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8PNQZ2L3KgX8 for <buildroot@lists.busybox.net>;
 Mon, 13 Feb 2023 18:20:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF859813D9
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF859813D9
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 18:20:08 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id p26so33978073ejx.13
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 10:20:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zYwAPfKIED+/NZriHPeoDe9RQ5zH35/VJo/yOIBheY4=;
 b=LvUAOQI1j0Wg9Af3OAcoRtzZHPW8H0YKh18XdSFTnKA0r8C8qJ1q43Go7fFwAiVA+n
 oWSxVfNdRcx3ifnXWfoHBTbqsY6hCW9Q1LIgryVyvl5Q/uFFMYIdjz7/XGZKuB6zwN8C
 pf62PGJwPyL1jwjmHiFX1peGFciT+PX8iqkQOA/AwoRIJUmbsmaf8KUFdKraU9vwoYnG
 43Ws+p1LrSdm5xJI6xLrF+yB9citAD+0hUbnOx7Uke72PSEC3BAcb+dzoWCMqKgbmBDa
 ySMXJQJHvcDezlx/OHuSM1Nwgkrh9CLHBU+uq0OIgy04LbibSuhSOsCqJMaLMOia7gM/
 l3VA==
X-Gm-Message-State: AO0yUKWNh/n6j54LLlbVSZx2jAKvF+xSqFelILqnLXrqg1GGSQ39HtcF
 fHqQD7EbqD39qyIc9hVAqfVtaTUrHtR/Ww==
X-Google-Smtp-Source: AK7set+pPIcDmlcX9jJYjtNeCmuOVqT3Q3g21HMiExV6RhQ62ofXIgTqwIEy5Lx+fCqJOlcNPaT94g==
X-Received: by 2002:a17:907:3f11:b0:8aa:991:3923 with SMTP id
 hq17-20020a1709073f1100b008aa09913923mr32123530ejc.7.1676312406434; 
 Mon, 13 Feb 2023 10:20:06 -0800 (PST)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 v24-20020a170906859800b0088c224bf5b5sm7145165ejx.148.2023.02.13.10.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 10:20:05 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Feb 2023 19:19:43 +0100
Message-Id: <20230213181944.10292-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zYwAPfKIED+/NZriHPeoDe9RQ5zH35/VJo/yOIBheY4=;
 b=dlu15KD5S6Ndj7fIIwlVqvF3SLQCQwmR35oG0IxuFvt3QZNZ7wVnX/DVZePx7/2soU
 KiINIrWgwH5sJJeAiFB5pGQQ7t3hftla0itY0MlYvbx3LqgLgk8dRGLV20IQzbmOpP02
 wWyiQWpWMmZGiOUh8duFrx7JXXPvNBYIWSuC9Axesf44O3xJlVbyBTZ2m/O0UOylgYCU
 seoLJh4Kv4LaTB26xXtkf/Yg/WsOWeP839pZqGOblTgjv1umYfqi1cItEuN6k3/LAKrV
 ZhPtYZl/caYM+em8rntTCFt3jr93omLTB2wZvmhCIzw3N2EGbY5j3MzuUPnKNSUEyGNF
 LNoA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dlu15KD5
Subject: [Buildroot] [PATCH 1/4] package/libyang: bump version to 2.1.30
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
Cc: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/libyang/libyang.hash | 2 +-
 package/libyang/libyang.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libyang/libyang.hash b/package/libyang/libyang.hash
index da8600351b..26a28d6eed 100644
--- a/package/libyang/libyang.hash
+++ b/package/libyang/libyang.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f30ee1c3e13f0c5d25c4d2fb628e4b262b483d0a500464a7c12008ccc393a69e  libyang-2.1.4.tar.gz
+sha256  761cfd959342b147f6a43a84c931c7fde68dd3a1ad540a0e5302288b204f073d  libyang-2.1.30.tar.gz
 sha256  0b7ec43747d211a1e49c53588b0822062947bab6bdcc95238578beab34cba5bb  LICENSE
diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
index 6c57a2dd42..f160035c09 100644
--- a/package/libyang/libyang.mk
+++ b/package/libyang/libyang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBYANG_VERSION = 2.1.4
+LIBYANG_VERSION = 2.1.30
 LIBYANG_SITE = $(call github,CESNET,libyang,v$(LIBYANG_VERSION))
 LIBYANG_LICENSE = BSD-3-Clause
 LIBYANG_LICENSE_FILES = LICENSE
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
