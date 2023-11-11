Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D840C4332F
	for <buildroot@archiver.kernel.org>; Sat, 11 Nov 2023 16:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B01BC41E53;
	Sat, 11 Nov 2023 16:36:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B01BC41E53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VKm8_lp2_awC; Sat, 11 Nov 2023 16:36:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E143041E4E;
	Sat, 11 Nov 2023 16:36:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E143041E4E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 537DB1BF38A
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 16:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BAAA40C10
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 16:36:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BAAA40C10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b04X9cf0H8RA for <buildroot@lists.busybox.net>;
 Sat, 11 Nov 2023 16:36:29 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB6BC40A92
 for <buildroot@buildroot.org>; Sat, 11 Nov 2023 16:36:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB6BC40A92
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-32f7bd27c2aso2052098f8f.2
 for <buildroot@buildroot.org>; Sat, 11 Nov 2023 08:36:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699720586; x=1700325386;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h6ZazGSkonFhKHSpcB1R2dNAyCI4LNkhE0TAUUtA0IQ=;
 b=N4e9/0642iTZln/QqpWIACH6Qa933Fgr8qIpPt9EMGcfcAW/56QFdpZiOnLbsSJwLK
 RXu7F3B8kHEPJ2n3QikTxUM1vQTKNuzK5b5yNkQD6RAhCivDyID5ZDnfg3hI2FMsthME
 VVvg/L4FKDDkKk1ZnLwog6Mnxifs1gn5dbhfwvcIPclePaic2Sk7Csw6OtJJ2hUUwl10
 bc/MH4rVWk5DKQBpJmpZJN6lG5Ir3+RUtihfcP0qBRn3E17vAB1QB6gnh/y9D1u0MDin
 MNUOWUH1hD1+O7m2mH/yL3iWnEUDdNV0XIjzJHTKlgo7yB57WWydxb/ZAqc7kpDaHxRs
 MRkQ==
X-Gm-Message-State: AOJu0Yw79vGTIxxkVEeloj2Px7WnCuE91VfZHjuJLdtWer/gT0TKJjAZ
 xRwil6U6hniVPznb6Ikrbriqvpjq+bQShg==
X-Google-Smtp-Source: AGHT+IGxsbHTaT5w0VzsTgPOxqXbbQtXDE9o+PA3JnGuPQPdp1Nfp9GOBwIbwt43ce9MEGeTeT52Ow==
X-Received: by 2002:a5d:64c6:0:b0:32f:8920:48ab with SMTP id
 f6-20020a5d64c6000000b0032f892048abmr1492408wri.65.1699720585716; 
 Sat, 11 Nov 2023 08:36:25 -0800 (PST)
Received: from thomas-Precision-7670.home
 ([2a02:a03f:eb68:2f00:ddfd:ab02:5d95:c69d])
 by smtp.gmail.com with ESMTPSA id
 t6-20020adfe446000000b0032da35baf7bsm1760468wrm.113.2023.11.11.08.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Nov 2023 08:36:25 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sat, 11 Nov 2023 17:36:16 +0100
Message-Id: <20231111163616.1059553-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1] package/lighttpd: bump to 1.4.73
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

News:
 - https://www.lighttpd.net/2023/10/30/1.4.73/

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/lighttpd/lighttpd.hash | 8 ++++----
 package/lighttpd/lighttpd.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index 3c114c05a1..5907558ada 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,6 +1,6 @@
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.72.sha512sum
-sha512  5becb57915e3548a1b9b980014be22b3c08dcf0e9be524f9cd0093886aaf6d00b20986e8b1fb10ecdbdffd8e42dd18e4a227b03d562c91bef9490ea6d5c480e3  lighttpd-1.4.72.tar.xz
-# From https://www.lighttpd.net/2023/10/6/1.4.72/
-sha256  f7cade4d69b754a0748c01463c33cd8b456ca9cc03bb09e85a71bcbcd54e55ec  lighttpd-1.4.72.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.73.sha512sum
+sha512  ee41a72b09614d630174ef832b08c050708f62c0b6299e82b0a5f91a63d62702d31237ae5bb1850f0160b94e36a66af38a2d7abdaa920235265d416d2b0b4015  lighttpd-1.4.73.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.73.sha256sum
+sha256  818816d0b314b0aa8728a7076513435f6d5eb227f3b61323468e1f10dbe84ca8  lighttpd-1.4.73.tar.xz
 # Locally calculated
 sha256  5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index af104de078..91877f8aae 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).72
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).73
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
