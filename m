Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC8ACAC5A8
	for <buildroot@archiver.kernel.org>; Sun, 21 Sep 2025 10:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DAF160AD9;
	Sun, 21 Sep 2025 10:04:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eehWPFP14H_y; Sun, 21 Sep 2025 10:04:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AF2260A50
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AF2260A50;
	Sun, 21 Sep 2025 10:04:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D51ED1C0
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 10:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6F1E41540
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 10:04:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ArOe5KnB0lnd for <buildroot@buildroot.org>;
 Sun, 21 Sep 2025 10:04:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BD42C415A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD42C415A9
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD42C415A9
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 10:04:09 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b29e8a3e453so77487966b.0
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 03:04:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758449048; x=1759053848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BePweD6CWR+S1GmcprwqdwoY9vjq3luP0VDUjwCH/s8=;
 b=bJ9S0qW2wYI0yyf3LBmGPCUar3CNVIhVaMEVSaEF5SBmaC/bZ4tHUBGxpYdqFh/ZYM
 Nu/loVX8o174m+Ez0QYn3aKU6UupzxMcsQg7hX+lowg/dZdhcMYocu34pHjdgj17XaOV
 61f6TSnOPRsTJJTNdYmOmqXB76UWMoM1NJNVWxq57B8T4+taynxGQqC44Yzze7EhBjYP
 +eVqo9lAT2QYsCia39ahiFd9L+dTlaGC8bo0qwLJclGEhVYOb2ln83EH9NecplVWdz1F
 /G8I7/XfdQwBRY+iWXDMRthPYw4hu/9N77eKyIJD7S9jA2Y21GKIHhpAehs8g86DH92C
 hMcQ==
X-Gm-Message-State: AOJu0YyEv69jQ9RzFXCkAUBKK+SG5lE7CUMD+cWJkc8PU9PeEze5REyk
 h79btOzgMeVpQIGXdnDOFzI9/gSvLHYjBKkJWEWNKE3e9k8uvOF8Pz+hgY5FWUqV7FOmn7Nj1x+
 obFFt
X-Gm-Gg: ASbGncsdJrdOR75gpXPJorttCjYQDQExk0qjrawxN1EyqAmNVyFZtGAbwq4Dqd3fYDQ
 SdU6nb6gJ+n9oSGozxlEpBW+qoocwG0B7XJVHWS6lXdFxHQhqprTcidj1nvS2cIZOpmf4MO0Ols
 Roxq09+Tq+p4lFJeFGBqo8ZzU8cwTsEiS92GEfZqEP4uTBgGfaBuL8Cju8sTgVYpMu2t1uxA9aR
 Gg3u9txy0KVEU7CiZ7LrsOxDlPjsra4TDOsEV0owe1sWtoanzfmEuq54mMy2JkPGTbG1v6haNrl
 YSdg1IL3if4RN2Bqe+1PUqQfKMDQGBZ/IG6MKQ3jNrNmcnG1LNIs2kuYU4JEfFFjKlzFVQ0ddB8
 Cb+eT+DLla//lDH0uUmScthjEucisJslsh1hG5aIjJNB3hwUvXIwGa42J98DAPLpdFW9TMMQclU
 /HZl0YZFhFfMnmkjdtArI7WPEvyo8oKod0ueXnfzKy9AXp7tg286I8vxsqdsrEfpbL
X-Google-Smtp-Source: AGHT+IGfcbZZT7F/Mt+B+DRFllD7KCBC1m4bvrP5iFYYbxy4OCSlBfstWm9n3gFl1f2/7CXHdDf0CQ==
X-Received: by 2002:a17:906:2c0f:b0:b28:6440:a85c with SMTP id
 a640c23a62f3a-b286440e73dmr365618366b.50.1758449047563; 
 Sun, 21 Sep 2025 03:04:07 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b1fcfe888bcsm853361266b.71.2025.09.21.03.04.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Sep 2025 03:04:07 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 21 Sep 2025 12:03:52 +0200
Message-ID: <20250921100352.2620720-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250921100352.2620720-1-dario.binacchi@amarulasolutions.com>
References: <20250921100352.2620720-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1758449048; x=1759053848;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BePweD6CWR+S1GmcprwqdwoY9vjq3luP0VDUjwCH/s8=;
 b=kUY0N3IqXZC+wj/1KLOjB4OeZZJ/1gBqM358Lgs8Oqh3ss3vXIyDl9UXOu87IorGfS
 /VEpWtvDgaUmi6B0KNyQmXAfLB9tzZFHsAn8WnIeJQmXB9vPdWemGlbL/BIDSL0acF7n
 anb5ay5d+EgQhKdYx/jmjXZ/T9a3IK5jKJBqo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=kUY0N3Iq
Subject: [Buildroot] [PATCH v2 2/2] package/atop: bump to version 2.12.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Patch 0001-Makefile-allow-the-user-to-pass-additional-CFLAGS-an.patch
was removed because it has been integrated with commit
631defdd22e3b6872c440d368d7acf459150eea5.

Release notes:
https://www.atoptool.nl/downloadatop.php

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes v1 -> v2:
- Bump from 2.11.1 instead of 2.11.0

 ...he-user-to-pass-additional-CFLAGS-an.patch | 32 -------------------
 package/atop/atop.hash                        |  2 +-
 package/atop/atop.mk                          |  2 +-
 3 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 package/atop/0001-Makefile-allow-the-user-to-pass-additional-CFLAGS-an.patch

diff --git a/package/atop/0001-Makefile-allow-the-user-to-pass-additional-CFLAGS-an.patch b/package/atop/0001-Makefile-allow-the-user-to-pass-additional-CFLAGS-an.patch
deleted file mode 100644
index 0fc8f142b14a..000000000000
--- a/package/atop/0001-Makefile-allow-the-user-to-pass-additional-CFLAGS-an.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From c8e9d2b885deca065bd7955019a6aa071974042d Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Mon, 5 Aug 2024 23:38:08 +0200
-Subject: [PATCH] Makefile: allow the user to pass additional CFLAGS and
- LDFLAGS
-
-This is needed for some build systems. For example, Buildroot needs to
-disable optimizations on some CPU architectures.
-
-Upstream: https://github.com/Atoptool/atop/pull/314
-[Waldemar: rebase on top of 2.11.0]
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 3a63f69..ab44eaa 100644
---- a/Makefile
-+++ b/Makefile
-@@ -21,8 +21,8 @@ PMPATH2  = /usr/lib64/pm-utils/sleep.d
- PMPATHD  = /usr/lib/systemd/system-sleep
- 
- PKG_CONFIG ?= pkg-config
--CFLAGS  += -O2 -I. -Wall $(shell $(PKG_CONFIG) --cflags glib-2.0)  -Wno-stringop-truncation -Wmissing-prototypes -Wmissing-declarations -Wformat-security # -DNOPERFEVENT   # -DHTTPSTATS
--LDFLAGS += $(shell $(PKG_CONFIG) --libs glib-2.0)
-+override CFLAGS  += -O2 -I. -Wall $(shell $(PKG_CONFIG) --cflags glib-2.0)  -Wno-stringop-truncation -Wmissing-prototypes -Wmissing-declarations -Wformat-security # -DNOPERFEVENT   # -DHTTPSTATS
-+override LDFLAGS += $(shell $(PKG_CONFIG) --libs glib-2.0)
- OBJMOD0  = version.o
- OBJMOD1  = various.o  deviate.o   procdbase.o
- OBJMOD2  = acctproc.o photoproc.o photosyst.o cgroups.o rawlog.o ifprop.o parseable.o
diff --git a/package/atop/atop.hash b/package/atop/atop.hash
index 8f0cb695814b..aeb9a469d7d3 100644
--- a/package/atop/atop.hash
+++ b/package/atop/atop.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  77650f79f9e388b6f5666dc113849894575a29bb4de21b8cd58767bf8a905154  atop-2.11.1.tar.gz
+sha256  0d09ecc90c14e6ef41c22e3c57c142c3e4fb9cf3c94379077a33c961d5343086  atop-2.12.0.tar.gz
 
 # Hash for license file:
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/atop/atop.mk b/package/atop/atop.mk
index 155dec617747..b4a5bda52e40 100644
--- a/package/atop/atop.mk
+++ b/package/atop/atop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATOP_VERSION = 2.11.1
+ATOP_VERSION = 2.12.0
 ATOP_SITE = http://www.atoptool.nl/download
 ATOP_LICENSE = GPL-2.0+
 ATOP_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
