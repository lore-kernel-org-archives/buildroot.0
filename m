Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B05C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 21:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A973E60B45;
	Thu,  8 Dec 2022 21:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A973E60B45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C6wQo-Qxp8kM; Thu,  8 Dec 2022 21:22:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD90860B3A;
	Thu,  8 Dec 2022 21:22:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD90860B3A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F7181BF396
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 677C060B31
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:22:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 677C060B31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hna7FNWqqbsC for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 21:22:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7193C60B0B
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7193C60B0B
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 21:22:19 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 fa4-20020a17090af0c400b002198d1328a0so6859983pjb.0
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 13:22:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kKJczXb9TipjQxxmOfO3zAYNVlorBELSAkVZCbGTci4=;
 b=c2W2kNLjM08AoL/nfvwdtdp8qN96jFbXU7FmvTDrimBifBKuSvsMGUXOGDsGBkQaRw
 Fx+rFmuBjl7uWMxZcCZwPYvZ7wNfvmFltV0LG3ti5GIRczMOSGvFJFnZ2gwpvCTKRwYi
 EIKAC6JghSHmJz2CfY5nRGp+c5OrsR82Pi16Jrv519dr8LyZG5yhxPZovI94bPkHtGB0
 jx9rknVh7XPMSn+GZNYm7t1Q75zSqqbZv94riuKwTZfYhZpyWplj4vMcuTFxiNWJXg6h
 gDhIMp0IeugWqZOZNHD1mP5nmfng/ZeX+q4XSKgACRkHyZUuFrFSLrxrKEpXi+GEPLBU
 xMgA==
X-Gm-Message-State: ANoB5plMrLVNyKOvY7/M3d2CfzCkbLpT9F9RLoKILLEvLCro5TrzszK8
 GIoueJ/xPLEOmvRoLv8U87AdegD2UM4=
X-Google-Smtp-Source: AA0mqf5cyCZBqkB7lkS6wTykbNIQB/fY/VYBHcwVTTNQyfRdKUgQGUApyitY4qzyswkqVwSSJrtfPQ==
X-Received: by 2002:a17:902:b194:b0:188:612b:441b with SMTP id
 s20-20020a170902b19400b00188612b441bmr3041993plr.65.1670534538410; 
 Thu, 08 Dec 2022 13:22:18 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 i16-20020a17090332d000b00182d25a1e4bsm17031940plr.259.2022.12.08.13.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 13:22:17 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 13:22:14 -0800
Message-Id: <20221208212215.4109073-1-christian@paral.in>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/docker-engine: security bump to
 version 20.10.21
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

Partial mitigations for CVE-2022-39253 Git vulnerability and other fixes:

https://github.com/moby/moby/releases/tag/v20.10.21

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index dfd4f4e365..10e9727a08 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  228caadac1b37a5ba310eb25418cf1fdd8878336f1d8faf0a2daa87fcc577577  docker-engine-20.10.19.tar.gz
+sha256  61f4c3a2d0426e1bbbda1b0e5dd33ec203776f7d99d1a61522c77c04c4ed09fe  docker-engine-20.10.21.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index dc45baf055..36c66485ba 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 20.10.19
+DOCKER_ENGINE_VERSION = 20.10.21
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
