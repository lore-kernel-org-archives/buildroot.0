Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68BDC3DA59
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 20:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 092884038E;
	Sat, 20 Jul 2024 20:43:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LxNkee-9s3qO; Sat, 20 Jul 2024 20:43:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACC8440390
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACC8440390;
	Sat, 20 Jul 2024 20:43:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 00D901BF2CF
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 20:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E268E81253
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 20:43:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SBPVAyWXmDbX for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 20:43:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A247080B3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A247080B3E
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A247080B3E
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 20:43:48 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4265b7514fcso13836375e9.1
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 13:43:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721508226; x=1722113026;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7l4mdFOqeLxbp0QEedt7TGV1NexZUyBTz/hyemSbS8I=;
 b=AIHsP6I+RfUbAMvGLlSLovSAOJlts852ePuulNCk7kywlSYwgbVd6tA9jc23R764rl
 BOGqGnhRoYMe3y6iTRrO4ynyWebYL8HN4A69GuxUsXwhRCMgTftvlNjZ+EJgXKfrC5C0
 rHWLSm5gxpsufF1QtDsqEbwak6HMHxWaZ1cYs0SF92KJg4QhzDBP1rAkks8e+/Q0zo61
 kejo4PvGpPJob/JuVz5HcPUAX8/WPmNqU33i55sZ2Is3RFAGMI+wdFjo/VydUaIx8gYo
 a0fQS+cQmY+d1wSciExPR9k6nLzoYwSyhEJXqFcvg++Vekb0sOYvW2/z+q29ci0gnGxF
 iTBw==
X-Gm-Message-State: AOJu0Yz0LFX4nAOfbx55pZoiciYstt6Cg0YOrmEBp+E1VYsmHN0lFzlc
 kHJJL4e+O0VcO7IKdGjtReJEFIDnmChG4ODme+jA6lvwzWaRdsGYAo5Yug==
X-Google-Smtp-Source: AGHT+IGN5vddhIbuQg0B3vPca8wmL+LTNQsKgFahf8VtSDRVUQelFKZ63+vsIu9K/Ali8FqvwaFo7Q==
X-Received: by 2002:a05:600c:4513:b0:426:5c36:f57a with SMTP id
 5b1f17b1804b1-427da84ab76mr21106015e9.14.1721508225941; 
 Sat, 20 Jul 2024 13:43:45 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d8f1cf7esm56597915e9.39.2024.07.20.13.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jul 2024 13:43:45 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 22:43:41 +0200
Message-ID: <20240720204341.1521701-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721508226; x=1722113026; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7l4mdFOqeLxbp0QEedt7TGV1NexZUyBTz/hyemSbS8I=;
 b=BG01qkGAYHxHwIJ6HeTN10pyOzzKEGDDae1S9snqgrWrntshVPauj15fKivx5+1LYg
 mBE8n6w4HPAdCND8/iV7H/6A5lTbk9VB6B5uv+gaGJ+WY+ncOnA//uRje8M4qNWdxBnf
 8fcdJwodYxHERozMaF0Eq8WrjjAk9uhmQHmnopAkI+0tMlEeijZosXWe96jjSRdpMENS
 xvpMrsvEt7TqOSiBtlOOAOmYnVgwhrXfXKDKykUfWSeuoIr4gJ5iuiYpnwZjtaFPQxgQ
 zJNbqvFHQF3oxeiou4378Rmw+mDyevxFiJqYaBHi4E3adPZltsrCmJ3QFSeV1KigmIqZ
 vuOg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BG01qkGA
Subject: [Buildroot] [PATCH 1/1] package/gtkiostream: fix version
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Matt Flax <flatmax@flatmax.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update GTKIOSTREAM_VERSION to make it compatible with what is returned
by https://release-monitoring.org/project/373420/

Fixes: fab48302865e5c0c98d91b696bc90e75e38189bb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gtkiostream/gtkiostream.hash | 2 +-
 package/gtkiostream/gtkiostream.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gtkiostream/gtkiostream.hash b/package/gtkiostream/gtkiostream.hash
index 90c754f48c..225504be1b 100644
--- a/package/gtkiostream/gtkiostream.hash
+++ b/package/gtkiostream/gtkiostream.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  44e8d921d462005cd330a1c24e5bd8061175b90ae53f537dbf73f59b74f6e01b  gtkiostream-v1.8.0.tar.gz
+sha256  44e8d921d462005cd330a1c24e5bd8061175b90ae53f537dbf73f59b74f6e01b  gtkiostream-1.8.0.tar.gz
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  gpl.txt
diff --git a/package/gtkiostream/gtkiostream.mk b/package/gtkiostream/gtkiostream.mk
index 36905d7e7d..970644d6df 100644
--- a/package/gtkiostream/gtkiostream.mk
+++ b/package/gtkiostream/gtkiostream.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GTKIOSTREAM_VERSION = v1.8.0
-GTKIOSTREAM_SITE = $(call github,flatmax,gtkiostream,$(GTKIOSTREAM_VERSION))
+GTKIOSTREAM_VERSION = 1.8.0
+GTKIOSTREAM_SITE = $(call github,flatmax,gtkiostream,v$(GTKIOSTREAM_VERSION))
 GTKIOSTREAM_LICENSE = GPL-2.0+
 GTKIOSTREAM_LICENSE_FILES = gpl.txt
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
