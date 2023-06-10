Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00BBEC7EE2F
	for <buildroot@archiver.kernel.org>; Sat, 10 Jun 2023 12:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D473408A5;
	Sat, 10 Jun 2023 12:25:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D473408A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M1UOXRyXzcKw; Sat, 10 Jun 2023 12:25:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F811405F5;
	Sat, 10 Jun 2023 12:25:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F811405F5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DF19A1BF377
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 12:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B838C83C5C
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 12:25:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B838C83C5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L19SyJInwJ8M for <buildroot@lists.busybox.net>;
 Sat, 10 Jun 2023 12:25:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A622D83C5B
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A622D83C5B
 for <buildroot@busybox.net>; Sat, 10 Jun 2023 12:25:23 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f736e0c9a8so20226515e9.2
 for <buildroot@busybox.net>; Sat, 10 Jun 2023 05:25:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686399921; x=1688991921;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KSlmmc9JHUyUPhiiJzUaeYdUXmBN0YDQiIupPvYtNeM=;
 b=Hu6g96mAcLyo/0pzMhUymYQL1p8OGRV192+/ZSlnnimJL51KHNg7Z0a/ANVMV+tWT3
 C2c6a0JOT1Xh4DwHt8FOCFiiImbThizHSWX+TypFWJN5v0JcmTk0ZQ1U2DSOwgoiziRy
 f2gOiiHV3cTqKsqmNFhdekUz2RasNZIqP1pFIB7fZItow40agtCXtQ5h7WXViYF7cuKZ
 ovyj8/Na8pO+8Uz+2Is/t83tfv4s4HMuzjpQKt1YNI4jfkHxCJ5tGPFGYLpSJsCF/L9L
 TBV4e3kNO9oWzdnSRSVl9veOfQz7YqVrfozYQuakTL8APORWvg3R73WVZwwHt6iLWK2S
 NAWQ==
X-Gm-Message-State: AC+VfDwpqtJkk5hjCMEvgPSjz66XFRMI/tnh6PPrhiV2C3Auwz8LaOAC
 bBxY5q2l7A9qJ9wHbw6cGWn9TjlN4+4=
X-Google-Smtp-Source: ACHHUZ43kR5UljZNL88cjkt6CdD6/Syke5GWUin2faMrgqzyxImT3fKis7tRvs67I6BMP20UUG2gFw==
X-Received: by 2002:a05:6000:196e:b0:30e:52ed:ddda with SMTP id
 da14-20020a056000196e00b0030e52eddddamr1025658wrb.38.1686399921373; 
 Sat, 10 Jun 2023 05:25:21 -0700 (PDT)
Received: from vm.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 u8-20020adfeb48000000b003062b2c5255sm7043054wrn.40.2023.06.10.05.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jun 2023 05:25:20 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 10 Jun 2023 14:25:15 +0200
Message-Id: <20230610122516.1633303-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686399921; x=1688991921;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KSlmmc9JHUyUPhiiJzUaeYdUXmBN0YDQiIupPvYtNeM=;
 b=UMVgKBi249ac4sUNylHTreSCdULzKlkxRA2OlPUJu9Mv/biS1usUwxjQUCFBTJcBYs
 yaMUtAhaJpppMEiHYREiDMZdLVbhJvg+PB4d4RE248zY46W20g6T1CYierB6DtaxZ0r1
 mrgYT6lvlYSRCm5Xip+FTe4ivbKl8tS6LIkpvFI9728et0qFR68IWAYZWVLmB1Ryuty4
 CXA4feVTsvUGP8KRHhBv2/YgSTnnTKGSOHDZVjGTFmAfF4SK9EgJk6Mkdmmp3j5bdTrN
 7GDd9Mr3tdsynSufrNxq9mx9s546K4luqbUbtghcr/IeLhtWSs32nzUSjvuu3ZiVEZOE
 2k8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=UMVgKBi2
Subject: [Buildroot] [PATCH] package/libgtk3: bump to version 3.24.38
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
 package/libgtk3/libgtk3.hash | 4 ++--
 package/libgtk3/libgtk3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index 22c37bf60..4d6c210c6 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.37.sha256sum
-sha256  6745f0b4c053794151fd0f0e2474b077cccff5f83e9dd1bf3d39fe9fe5fb7f57  gtk+-3.24.37.tar.xz
+# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.38.sha256sum
+sha256  ce11decf018b25bdd8505544a4f87242854ec88be054d9ade5f3a20444dd8ee7  gtk+-3.24.38.tar.xz
 
 # Hash for license file:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 8291b8d35..6655a0d09 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.24
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).37
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).38
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = https://download.gnome.org/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPL-2.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
