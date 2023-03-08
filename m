Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7DDC678D5
	for <buildroot@archiver.kernel.org>; Wed,  8 Mar 2023 08:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E234461136;
	Wed,  8 Mar 2023 08:51:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E234461136
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U-N0ZfcqrK_W; Wed,  8 Mar 2023 08:51:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26E0861130;
	Wed,  8 Mar 2023 08:51:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26E0861130
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D7491BF844
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 08:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBD7581E82
 for <buildroot@lists.busybox.net>; Wed,  8 Mar 2023 08:51:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBD7581E82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UuX24mWNC_Ay for <buildroot@lists.busybox.net>;
 Wed,  8 Mar 2023 08:51:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 006C181349
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 006C181349
 for <buildroot@busybox.net>; Wed,  8 Mar 2023 08:51:00 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id l25so14604017wrb.3
 for <buildroot@busybox.net>; Wed, 08 Mar 2023 00:51:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678265459;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VGYc5vzLyKmTz35ZIYCmRIBWP29z56RDViERTBVX8Ts=;
 b=mIj2+4TOFrL0GJU4omUjMktzyImRnEhx9iyjVZyDhd+NSbkyFbh6exWN8jIRfe0XrD
 X4TIHeby9ja0HbS11zLmbHlRGjF1XBcz5ScbAP2tBrrzeGoJX4XABwHuVu1ptUxvHfGI
 tKqwfRCvQmTG4r6p4DrUB7kmBhe1ZPQLv1PTmVLY/qh2SUHg1B/0PFkausKzV5OZbkMi
 C06O0u7OSFG312gRsPZB9kay3RDMeZxjPAJIeoYjkz8h7T+Ex8PWQa5aGyxaE0zPaBw3
 g1qu8Xuo3hSKbDx57acu6Y9m/36HVSJdkifBOqGTv6dHOls9yIihfChaAY8SxPNvcBVU
 0drw==
X-Gm-Message-State: AO0yUKWNQBRXwLG6mMjnAXHYoT0vEveT0pBxHE26+2eF6vk2y83Wv/oU
 P/jRKSANV5DJF90HpJkuzlQ8U+pxMEk=
X-Google-Smtp-Source: AK7set9nlHezAc/8qTPBrVkVrZPZKKxoeNqYU1ec+STIs+TFwVAq4LI0EU9j1RWfJeYTjzZE62wVNw==
X-Received: by 2002:adf:f448:0:b0:2ca:e8c2:6d29 with SMTP id
 f8-20020adff448000000b002cae8c26d29mr11078346wrp.7.1678265459074; 
 Wed, 08 Mar 2023 00:50:59 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 b16-20020adfee90000000b002c794495f6fsm14440341wro.117.2023.03.08.00.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 00:50:58 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  8 Mar 2023 09:50:55 +0100
Message-Id: <20230308085055.126427-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678265459;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VGYc5vzLyKmTz35ZIYCmRIBWP29z56RDViERTBVX8Ts=;
 b=SgZjaJxir94RRU/TKEDAZYwHmJd0e6xoTKo5TPB+JpVgARtYemR7Kgi5V0mxfYfIFa
 SS8wS/h2MC59YpDoJzzuhmkX7XB2zC4v1HPLYmkl7AQ6ZVXihtqEhJ4Qe0Mi42HGKEj6
 IfwRSaWsw2HBs/Wvobgs84wYTwgc5FYysW7ZpI21MJ7jOPjkpIrd9yu1AERUekhzVrg7
 fDq6QCYm4IRZkP0zSsw/rzrwBXYtwG4Q+C+XaQ5T1TAo5inZrHiSyeu2A5ysTwqUrEpK
 A5suljhJlXY1YLB5QoZq5IX8128qrjt/YK7NqUp6KzAHReVw8nCia2OKDwW32pTHry2j
 +gVQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SgZjaJxi
Subject: [Buildroot] [PATCH] package/libgtk3: bump to version 3.24.37
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
index 9fed2c9df..22c37bf60 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.36.sha256sum
-sha256  27a6ef157743350c807ffea59baa1d70226dbede82a5e953ffd58ea6059fe691  gtk+-3.24.36.tar.xz
+# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.37.sha256sum
+sha256  6745f0b4c053794151fd0f0e2474b077cccff5f83e9dd1bf3d39fe9fe5fb7f57  gtk+-3.24.37.tar.xz
 
 # Hash for license file:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 283c129ce..18a8a9fa4 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.24
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).36
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).37
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = https://download.gnome.org/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPL-2.0+
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
