Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52399C2BD09
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 19:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC5246076C;
	Mon, 24 Jun 2024 19:26:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KMgsO7iK31Tz; Mon, 24 Jun 2024 19:26:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E08F36082B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E08F36082B;
	Mon, 24 Jun 2024 19:26:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B2E601BF473
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 19:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0DC56082B
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 19:26:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yfmtqvcKvnZj for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 19:26:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com;
 envelope-from=ckhardin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B96E26076C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B96E26076C
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B96E26076C
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 19:26:17 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1f480624d0fso36747245ad.1
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 12:26:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719257176; x=1719861976;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mGFt4t3Y8ToMXM1PcPGJtaDPMsBbswzk87J373iXIt0=;
 b=bqYhIjxWyIP9jOmwKCVLPGtCi2Q9UerIU+nZ45Y1moEFLAOHnI3DyucdzmCiSyGTWe
 KGiyesoi9u3UhptWlzt1K5nSVQ0jHdhU9MEyZ4HHyqiR1MX9WSJf+zWrOvMZkUtf786K
 hTIIENNYf9vpNxfwIFHoV3NNuDemaEc8DEeZNJTG7uN+4l2JwZ18ZeKI9KFk2BPVj6IK
 blO5lhoYbN8vnP2iVXG1dcjOQupvH7pwAEThofVKsRIlvU4O6PMZR/ZfQQArWHRrusdx
 QR+dHQ9YU3CdhHxuGNlHs91aRKhLtLlefn7ngrg1WiwK86w7dkpVoNIKiuJ7/1oMULr/
 FJNQ==
X-Gm-Message-State: AOJu0Yw02vHpAQSZ4pmU17M7VRkXeMcXPfv8ur8eauY4IhVSkLivXm16
 ctadIJKOJseJ00luBVEX6v1sMXyfPtQQ61JaJ+LX65xGMUva6bXLF1xOhw==
X-Google-Smtp-Source: AGHT+IGLG7tdVMJwmsfIyBcfQAx/OOLJzKfnc/bGgmmrIiYNcRfTj6j0pFL8bPrVPaWy+YG5/AO0rA==
X-Received: by 2002:a17:902:c40e:b0:1f9:f3c6:ed37 with SMTP id
 d9443c01a7336-1fa23f22771mr68072585ad.14.1719257176161; 
 Mon, 24 Jun 2024 12:26:16 -0700 (PDT)
Received: from localhost.localdomain ([12.125.190.90])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb7cf962sm66202515ad.231.2024.06.24.12.26.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 24 Jun 2024 12:26:15 -0700 (PDT)
From: Charles Hardin <ckhardin@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jun 2024 12:26:10 -0700
Message-Id: <20240624192610.78164-1-ckhardin@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719257176; x=1719861976; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mGFt4t3Y8ToMXM1PcPGJtaDPMsBbswzk87J373iXIt0=;
 b=GkdLAEQY4pS3q9WydtHykt0s4rMV63J46iQVmpv8/gCxjTFZyHsCxWraKXN+m4I+Ur
 d2l3S/z0qTuqkK6pTuE9r6DI2yqwF0mfV1Zhxsf3ctD07Eee/wkmTzh4OjT0OrndD7x4
 vvO0iALZKxEwoK0w055QJGNUA3x61oHYMCBA5DPYwGIWipziHbagqK197sag5NxLmIyW
 frS6FF/5nVWPPMRb+UI3K2CJi+4HPK/5UsNjZjHFdfK8/qy2SD0ExsvrU8oW2iCPdEvo
 eD8NzVdbpmD9USudXoipk+karppGexuG0XGbpySh9YXsKcY3U0G/fTiDINdojr2HN9NJ
 wzxA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GkdLAEQY
Subject: [Buildroot] [PATCH 1/1] package/alsa-plugins: bump version to 1.2.12
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
Cc: Charles Hardin <ckhardin@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://www.alsa-project.org/wiki/Changes_v1.2.11_v1.2.12#alsa-plugins

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
---
 package/alsa-plugins/alsa-plugins.hash | 2 +-
 package/alsa-plugins/alsa-plugins.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-plugins/alsa-plugins.hash b/package/alsa-plugins/alsa-plugins.hash
index 5d190e4d7b..6943be6253 100644
--- a/package/alsa-plugins/alsa-plugins.hash
+++ b/package/alsa-plugins/alsa-plugins.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  8c337814954bb7c167456733a6046142a2931f12eccba3ec2a4ae618a3432511  alsa-plugins-1.2.7.1.tar.bz2
+sha256  7bd8a83d304e8e2d86a25895d8dcb0ef0245a8df32e271959cdbdc6af39b66f2  alsa-plugins-1.2.12.tar.bz2
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING.GPL
diff --git a/package/alsa-plugins/alsa-plugins.mk b/package/alsa-plugins/alsa-plugins.mk
index d23a81c5ee..25ecc589fc 100644
--- a/package/alsa-plugins/alsa-plugins.mk
+++ b/package/alsa-plugins/alsa-plugins.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_PLUGINS_VERSION = 1.2.7.1
+ALSA_PLUGINS_VERSION = 1.2.12
 ALSA_PLUGINS_SOURCE = alsa-plugins-$(ALSA_PLUGINS_VERSION).tar.bz2
 ALSA_PLUGINS_SITE = https://www.alsa-project.org/files/pub/plugins
 ALSA_PLUGINS_LICENSE = LGPL-2.1+
-- 
2.39.3 (Apple Git-146)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
