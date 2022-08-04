Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E37BC00144
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 05:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9368981CE3;
	Thu,  4 Aug 2022 05:44:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9368981CE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hePTLRhv9hxx; Thu,  4 Aug 2022 05:44:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DFEC81CA5;
	Thu,  4 Aug 2022 05:44:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DFEC81CA5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 97A291BF2BF
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 05:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7330660BB2
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 05:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7330660BB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bbMkqJ-C5TSx for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 05:44:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC89B60BAC
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC89B60BAC
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 05:44:43 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id t2so18411365ply.2
 for <buildroot@buildroot.org>; Wed, 03 Aug 2022 22:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mjmQ4c8d1DkLNy4rh1dOJQEKt+X84IXyBru1EgCtyGM=;
 b=oq2MApWlyiDX/YJC10/yoNsTa7i/gITR0szW7PIdoymvnjuvHxCzJ357vM/cM4RzML
 bvYwQL/Wxvyy1W2nThOC00RdcPqcD+4lTBn363jJSti9mzKwXmTSfsm+j4/YS/xCuX2a
 AGiEBHN++VyaMNdEjhyv6abj7qg8MFwu9CCiEDFnghImUK5stwVstZVrfmESU2osXRiT
 f1TfsTZqcTK7XWvrh26yk4kep9w5Xo2MHa/E9FRdQESvef8df78nZh+eOYXHX9NfASM1
 8ColE02FkU+/zF3K4p7NeYIg8crG/U9pPBzCAXzzyoDzeGSChrPvfey82VHC5cckXm3+
 RlkQ==
X-Gm-Message-State: ACgBeo38PGhKOzoVLWkphX+11ESGmOIJfBuKPs4Fx7+0lS7mCHcFK9kS
 XLXit+80N6OL7Y7Tz4kJP/bglygz2kU3Rw==
X-Google-Smtp-Source: AA6agR4Q3+Vqpt2kftPx5a1fL/AtLYATPqbKGAHGgKH57qJhUJj5UmEXdIJmiar1fiZ38R2NeIvIXg==
X-Received: by 2002:a17:902:7102:b0:16e:e49f:1329 with SMTP id
 a2-20020a170902710200b0016ee49f1329mr351422pll.163.1659591882807; 
 Wed, 03 Aug 2022 22:44:42 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 d15-20020a17090ad98f00b001f200eabc65sm87849pjv.41.2022.08.03.22.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 22:44:42 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  3 Aug 2022 22:43:41 -0700
Message-Id: <20220804054341.3107780-2-christian@paral.in>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220804054341.3107780-1-christian@paral.in>
References: <20220804054341.3107780-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 2/2] package/docker-engine: bump to version
 20.10.17
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

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index d4fe83a806..2cf2f4a75e 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  dbe1ae342351108b7b30232c4bce0559c81ad9fb6c978d7c8425d6aa53e476c1  docker-engine-20.10.14.tar.gz
+sha256  061cf8579aa3c813c353c80fa480744e2f6cca2e6392f546bd0942a6a10c7a14  docker-engine-20.10.17.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 3aef31599f..293af1858c 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 20.10.14
+DOCKER_ENGINE_VERSION = 20.10.17
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
