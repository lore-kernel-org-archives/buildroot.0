Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7ECC4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 08:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 684B2404EB;
	Sat,  5 Nov 2022 08:04:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 684B2404EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yLSQ_ZFHJYQu; Sat,  5 Nov 2022 08:04:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 848DD4046A;
	Sat,  5 Nov 2022 08:04:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 848DD4046A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CAADA1BF28E
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 08:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B357582106
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 08:04:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B357582106
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4nhiAbwGNkzb for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 08:04:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A8388141D
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A8388141D
 for <buildroot@busybox.net>; Sat,  5 Nov 2022 08:04:04 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id a5so10561151edb.11
 for <buildroot@busybox.net>; Sat, 05 Nov 2022 01:04:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9Z2rxrz9tW6yJ/s246SuPH82w+Cs8Pq9B3nYB0zf9Gk=;
 b=Sl2X/g1AAwXswqtvNoW0Y65EhOjY+gS+RUv5VXbhDnVYdURGhcXN8fJyr75qSowVdI
 pRp6k4psQNYXnW80gD0zRFJzNNCLZOS+/G5wMy+U4vIY8rdbdC7uSeEvLTqc7zveECGc
 m7NbbnXG8auZpGjrSb2OQBDv9VKfAqbbbiQUC+ofCWseduQBa1o9Z17n9mfO8cMm4kVR
 B3F8Tia/o5fhWL1SUJ+VTa/L12IeGv8+2uC2BkYyUFavtvx7jN38YRxi2cQoDMZqbtIf
 X2K9oxFEENMiE2Qh6+QTx46CGqVVvvrcBwB+8TOoEywj0rzhWiX5l/ZBdDvhd887SX3s
 gwGg==
X-Gm-Message-State: ACrzQf0CiIczFHaXiemuUmonqwkSyziynUp+U4X7mbaoL03HL0EThHNs
 +8C5TuZLyHWrd+ecHakzYcIHcP9Gs24=
X-Google-Smtp-Source: AMsMyM5d39/FnBotcDziHMjywrWauuDZCiJkVWGCJAeM+LKt5pthHLdrQD12H0qsdijFIWhJ7feE8g==
X-Received: by 2002:a50:9992:0:b0:461:6cde:ccdd with SMTP id
 m18-20020a509992000000b004616cdeccddmr38891756edb.402.1667635442608; 
 Sat, 05 Nov 2022 01:04:02 -0700 (PDT)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 hg11-20020a1709072ccb00b007a8de84ce36sm560765ejc.206.2022.11.05.01.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 01:04:02 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat,  5 Nov 2022 09:03:57 +0100
Message-Id: <20221105080357.1228447-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9Z2rxrz9tW6yJ/s246SuPH82w+Cs8Pq9B3nYB0zf9Gk=;
 b=TSPiuqtaNMC+QDiMle3bDj7UivN4IdVRLCnNbNBQ7Pv6w6IctzpPptK9GTlPFm/21K
 ymtIJU2l1m4Hs++Nhnrc4uQJpcy7KyfjWaqoh3Ch1XTBYFrH56QKJxOG+SufB7uethcf
 Cyd4MSCQApESkDAraQjcY7H/DbYJyfy7zHxTbf5ocRW3tA6EZt2Nnu9eFMgSCez89iUC
 sbYWt00Ixt+lGEKv5MbBQi+OTZIPiWHRXVtfwMkuk/Y2q+MmBqfniRU9XW+6gCatlpFm
 3/DY4YJ+MniEVAJDt/rsa4S8pyD0bmIcr4TpS6By1cBW1qhqualax2H49cH+u4Xuz9qM
 2zNg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TSPiuqta
Subject: [Buildroot] [PATCH] package/pango: bump to version 1.50.11
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
 package/pango/pango.hash | 4 ++--
 package/pango/pango.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pango/pango.hash b/package/pango/pango.hash
index cbd391db2..d073526cf 100644
--- a/package/pango/pango.hash
+++ b/package/pango/pango.hash
@@ -1,5 +1,5 @@
-# From https://ftp.acc.umu.se/pub/GNOME/sources/pango/1.50/pango-1.50.10.sha256sum
-sha256  7e5d2f1e40854d24a9a2c4d093bafe75dcdbeccdf1de43e4437332eabed64966  pango-1.50.10.tar.xz
+# From https://ftp.acc.umu.se/pub/GNOME/sources/pango/1.50/pango-1.50.11.sha256sum
+sha256  8800f812d89ee61388188703203f3a7878963c22f8695aaf1fa0a1a1428d17ae  pango-1.50.11.tar.xz
 
 # Locally computed
 sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 649f3398c..a61473431 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PANGO_VERSION_MAJOR = 1.50
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).10
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).11
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_INSTALL_STAGING = YES
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
