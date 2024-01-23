Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD9DC47258
	for <buildroot@archiver.kernel.org>; Tue, 23 Jan 2024 12:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F829404A3;
	Tue, 23 Jan 2024 12:20:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F829404A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gQLO9A61vAdt; Tue, 23 Jan 2024 12:20:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 221B242470;
	Tue, 23 Jan 2024 12:20:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 221B242470
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B99121BF389
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 12:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 931DE82391
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 12:20:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 931DE82391
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZDJCiZodik6V for <buildroot@lists.busybox.net>;
 Tue, 23 Jan 2024 12:20:49 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ABB2282236
 for <buildroot@busybox.net>; Tue, 23 Jan 2024 12:20:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABB2282236
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40e7e2e04f0so46914375e9.1
 for <buildroot@busybox.net>; Tue, 23 Jan 2024 04:20:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706012448; x=1706617248;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vlW33I9hQ+TjB+TJ+tob/TPY9H1q3SI0i9/l2KOVTuE=;
 b=w4S8EqMgTGtPTFmCxDErJaOUeou9q0ab2wQXBfxYSz4M8rAXMnq+iGNsw6F1xlPf1d
 +NrRSfRGZKG+A3JI0nA334hyvhyF0HmHr1OxHqiYDNBH1TEmeuYueHdtSbgWjbnL84YI
 eoyZq5czlqRGtBZsuH6X6HF+UeaikunIs0sYJE9D0en07PcKQkbNk5uOXU11ZZbs/5SW
 jv9YJLLHMuuYkn7iDleZ7jaIgvEMtXbAhBy/cFSJi4CblBiSULM7plVM6s3JxIqyBErQ
 ybZ4rahv0ZuChWLr4q/AoNaXlMYAm7SgItrnIynBCApfLmPU1r3QMpu+1GGFk6eUzJkW
 IX1w==
X-Gm-Message-State: AOJu0Yz6pAmr4wtZ5xxQraGSu02p7LrPXdFmzRsfzej/zCNWV1wQg6IY
 DGx7DiZM7HO3euRghIF3t+WzxZoV15zfozuNHTL51OBuA3iEThgVrSbqwc7P
X-Google-Smtp-Source: AGHT+IEMyGw9F/Ha+4Zegd8rivfQBjuTiwWE4AVKOz6ljgGL4LSPgsnsBZJyHf2nPhik4IfeXEzvtw==
X-Received: by 2002:a05:600c:2a8e:b0:40e:42c9:ce9b with SMTP id
 x14-20020a05600c2a8e00b0040e42c9ce9bmr476735wmd.45.1706012447152; 
 Tue, 23 Jan 2024 04:20:47 -0800 (PST)
Received: from xubuntu-23.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 p16-20020a05600c469000b0040e39cbf2a4sm46674244wmo.42.2024.01.23.04.20.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 04:20:46 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 23 Jan 2024 13:20:42 +0100
Message-Id: <20240123122042.466413-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706012448; x=1706617248; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vlW33I9hQ+TjB+TJ+tob/TPY9H1q3SI0i9/l2KOVTuE=;
 b=Fy3WfMozsYs13L6RYEmW6qwNpDr8IDn7paN/fCA6FPCFZN6Y+HgkBRKROBbc8nDG4/
 K2SeDZF6B+LjyGYoIJDHa5i2LUCSVJKX3xRZ8iN2hFMQ3YB8UpIEoJSzQNtVdjabcU15
 f2OL6a+VH5v/ER/mSzyVndb8F1Nuw9eQRlzLq1r1Yes3rxG9FjuxrhsutiIarxU7HmMq
 G34C6i0cYIZ+4fC4mJcCwuvnTzp3SW9m2JGQ6IlFJxw3ivl0KFwEjZxbkfAHT+XpYCb8
 wloQvY0M4eASRUFPlQga5LsmsOCC418lw91SEfejjOVdjdCKNA1SyhDFYWm27bJcY15O
 iwlw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Fy3WfMoz
Subject: [Buildroot] [PATCH] package/libgtk3: bump to version 3.24.40
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
index c62dd8257..609a56aae 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.39.sha256sum
-sha256  1cac3e566b9b2f3653a458c08c2dcdfdca9f908037ac03c9d8564b4295778d79  gtk+-3.24.39.tar.xz
+# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.40.sha256sum
+sha256  444dbb11f4fd5d592d74422441671854d1b744d0a7f3a3fbf9d4f936eb0552d3  gtk+-3.24.40.tar.xz
 
 # Hash for license file:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 00a7672c6..69315b6ed 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.24
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).39
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).40
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = https://download.gnome.org/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPL-2.0+
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
