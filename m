Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1A3C6FD18
	for <buildroot@archiver.kernel.org>; Wed, 29 Mar 2023 18:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6FC16156E;
	Wed, 29 Mar 2023 18:18:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6FC16156E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HYxRZVqCaK7B; Wed, 29 Mar 2023 18:18:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2791661569;
	Wed, 29 Mar 2023 18:18:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2791661569
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B4111BF33B
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 18:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 344D8839DD
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 18:18:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 344D8839DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F2R1-UmbBoME for <buildroot@lists.busybox.net>;
 Wed, 29 Mar 2023 18:18:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78E6D827DD
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 78E6D827DD
 for <buildroot@buildroot.org>; Wed, 29 Mar 2023 18:18:42 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 e15-20020a17090ac20f00b0023d1b009f52so19453018pjt.2
 for <buildroot@buildroot.org>; Wed, 29 Mar 2023 11:18:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680113921;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/YH4X2nIOyNAjqDIwS59LKak0c6vJE/R+994EQr3oA8=;
 b=T2rj9wNwNjKgbb1OT9kf8Tay89144LSVhe1NNTpsuL+R43UBpyg6llRtuXIkZ6evd1
 PgRm1YJ9fKeczsDgJtw3MmgJEyQHTVox9tA2+9zcOF7ykEY5K9/oJue1XVJ/vTq6hVXZ
 +o9RSq07mOFakv1Ukqpmm1qE1S1K/foWVI6IRf4rqE6xTQ1nkTxLaLbnMoxf3qlwCGnB
 iJgw0BvkD1Fa7s/8jnG3NIPTem+tvbD7QF8uLzVAO2qMIDGrQO8nlJ1HaL1BNuSZhyXQ
 SIOyeC79u4uN2XRi99fOAwo5LpYDzYMATanVKl/OqCFW1h/zXNA8hoDHwLrZ4Dg6SzG6
 JrFw==
X-Gm-Message-State: AAQBX9fzTGEGS4som4+TlWUlieBtOl1gEJ6vWr+uzI0Ezqk/8lRMC5Zn
 JbgTjBAFPr0PGY0R2gQayecbgN+QNjo=
X-Google-Smtp-Source: AKy350aJzmfnpTvhld1Wqk7/LoXt38+oMqjyPlTEg/9XRrEcKzEMqSsZqNbG4OhydRjFdz3lrbSdag==
X-Received: by 2002:a17:90b:164b:b0:23d:50c6:2d17 with SMTP id
 il11-20020a17090b164b00b0023d50c62d17mr22928547pjb.10.1680113921507; 
 Wed, 29 Mar 2023 11:18:41 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 c10-20020a17090a020a00b0023af4eb597csm1694167pjc.52.2023.03.29.11.18.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 11:18:41 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 29 Mar 2023 11:18:30 -0700
Message-Id: <20230329181830.252720-1-christian@paral.in>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 1/1] package/docker-engine: bump to version
 v23.0.2
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bug fixes and enhancements.

https://github.com/moby/moby/releases/tag/v23.0.2

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 99ab5e4003..4b7c026eef 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c8e6c0ac5f0c772023e3430f80190e0f86644b6d94cac63118b03561385f7b56  docker-engine-23.0.1.tar.gz
+sha256  4caca59c774445a5aad6114d89c97c88d9705f048704fecdd3f5712cb369dc39  docker-engine-23.0.2.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index c61aa491c2..a27625a38e 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 23.0.1
+DOCKER_ENGINE_VERSION = 23.0.2
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
