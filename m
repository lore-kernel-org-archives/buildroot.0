Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B5FC3DA42
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 17:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F3AE607C2;
	Wed, 17 Jul 2024 17:03:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YuP7j30itZgY; Wed, 17 Jul 2024 17:03:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30516608C1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30516608C1;
	Wed, 17 Jul 2024 17:03:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 453481BF38C
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 17:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32283816E9
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 17:03:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sI0pmMcUlqZM for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 17:03:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0777F8108F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0777F8108F
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0777F8108F
 for <buildroot@busybox.net>; Wed, 17 Jul 2024 17:03:06 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4266fcb311cso50505255e9.1
 for <buildroot@busybox.net>; Wed, 17 Jul 2024 10:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721235785; x=1721840585;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4Y9OBm/6r6AQRQ9HIpN7y24nwKsp8jC3M/5tZMnR51E=;
 b=nJi/GB7Gpw4mAs3vqDfNbWV/PPZrCCyqu97tvmCIp65qmEbHo79IWsgUJo2iL/5l8h
 oYxexfQRDd0NVa1VAJpMBZcDY6Zqpcc6e8HhO00hMkP11C4MCT9I23BcMKFsNlxRrzX0
 94vlND3bir9WTxG5iWDrHsI9N7C0JJQVpQLCgRQtpoWgehmsYZ7NOi3D3/ujMmIIshUM
 RRPRivgLSdKPyD+Ng3d/ll7kxxCAZBEXlW6QWkfY6bfJ8fSPBzhIlQkCpno1KoLJA5Qs
 8xzOJlnKKUOk96G3NS15Srl5VXz6S1vtX9B6OCmpbN9JlX6i469t8oYMspyrBv0NG44U
 tcDw==
X-Gm-Message-State: AOJu0Yy1/G2EwUK1f5MMKRYyaihH2LTCg7MJltc5isUk+qW0ABGCa9Pe
 mX8w3XFLGFhsbedmlMhS84Op8JB76CIUrKLN2Y9v0xQLS9IwODEPy38QotHvMdinq+10T3O2COQ
 =
X-Google-Smtp-Source: AGHT+IF1nRzvRV4EEgRGnJhbCaTKzmLgHBZppGny8eftDnWM48Pxvhkizydr1ysnJw2+5hf3Q26qvw==
X-Received: by 2002:a05:600c:1d1e:b0:426:64a2:5362 with SMTP id
 5b1f17b1804b1-427c2cc97efmr17948235e9.8.1721235784974; 
 Wed, 17 Jul 2024 10:03:04 -0700 (PDT)
Received: from vm-2404.. (140.33.66.37.rev.sfr.net. [37.66.33.140])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427c778b030sm5223895e9.4.2024.07.17.10.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jul 2024 10:03:04 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 17 Jul 2024 19:02:56 +0200
Message-ID: <20240717170256.787061-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1721235785; x=1721840585; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4Y9OBm/6r6AQRQ9HIpN7y24nwKsp8jC3M/5tZMnR51E=;
 b=XmLzFdJxTGW/fmwKDIT1556vSgU8cZ5l8tZVccdAb7mOZjQgaRH816rgnNwYRy9Ko7
 tA1/7PEp3x2Mt0BikD6MbqSDu1iQF3wdBdBT55PZXUF5aDxvBN5z8R1mJVmigGrCa2EY
 BVJ9szzmlBBHMUalVZCWLFZKFsJgYk36PMNGoRbYusDsLnJBsv7CvahQfCXq4qmwbreY
 tgMreP1giffVqc3HrbmdJcyZ7+9VlaAX4d3z7dElGnXtX/mEGG2VpGS9rOoMzss+p1E8
 8HrmR5LDiYmvixd/9tVeGD/JTHmMuIhzBVlJFuLlnHpG6ckm39VTQ/mWx02aetEpCQ7P
 6eUw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=XmLzFdJx
Subject: [Buildroot] [PATCH] package/libgtk3: security bump to version
 3.24.43
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

fix CVE-2024-6655 (Library injection from CWD)

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libgtk3/libgtk3.hash | 4 ++--
 package/libgtk3/libgtk3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index a1d8b1694..6a682a741 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.42.sha256sum
-sha256  50f89f615092d4dd01bbd759719f8bd380e5f149f6fd78a94725e2de112377e2  gtk+-3.24.42.tar.xz
+# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.43.sha256sum
+sha256  7e04f0648515034b806b74ae5d774d87cffb1a2a96c468cb5be476d51bf2f3c7  gtk+-3.24.43.tar.xz
 
 # Hash for license file:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 547fd194a..d6d7c64a5 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.24
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).42
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).43
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = https://download.gnome.org/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPL-2.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
