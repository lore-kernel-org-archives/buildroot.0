Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C90C433FE
	for <buildroot@archiver.kernel.org>; Sun, 16 Oct 2022 23:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 993F160B9F;
	Sun, 16 Oct 2022 23:00:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 993F160B9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IdjeFC2a9oxQ; Sun, 16 Oct 2022 23:00:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D87BD6079D;
	Sun, 16 Oct 2022 23:00:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D87BD6079D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4C1501BF385
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 23:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 316CA409DD
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 23:00:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 316CA409DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9fyu3C9OIJBT for <buildroot@lists.busybox.net>;
 Sun, 16 Oct 2022 23:00:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C100400B8
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C100400B8
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 23:00:50 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 o9-20020a17090a0a0900b0020ad4e758b3so9399103pjo.4
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 16:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OpK2q6lb1KfojX0bAaTYw15LvM4sdYhL26XfgMUVfQw=;
 b=FfP3gy6bgGt4bRyi3g7ZofjkUCXSdOt8KEvdyAY+H79lWZfp95p87WBPe9cNxnoSWN
 QICsYh9QrwuKam7hBBO1tFpGY1MoSxvH1N1nidfDfRgsYf9rMdI1r7OsQPcm+0l5/hZY
 vdF1DKmGP+CtMEUK49AFQOiohmlTbVfMoXZtjXO6OflyD9vRLHY5vyAbe2hPcDdNx65h
 LAG2zboHhMvZZiCBh/hzcO11wGEmWJAcaPQHecfbdc+9EHcLVpkYxSgFT1lClK9f0xuD
 79gZfe22RDNdGrOPEJ6UUIE2Qvs4P6B4izWTSKULDPZjJr3wPQ8CBuHL9k54bytLhmj5
 yedw==
X-Gm-Message-State: ACrzQf08wupYR9hGlZSIxhMo+AA9Btepx1+cpE+EBfmRTwaJzdPExM/3
 uUmjLAmWshPnNs64qwEmGGNAJ0dbPhoW9g==
X-Google-Smtp-Source: AMsMyM6/zASZ02LBCpRLfzrvQVvzglcO2PkpVRRTOYz2AGCv0P/emhRiCBx+rNfJWoP2rFyDagU3rw==
X-Received: by 2002:a17:902:d503:b0:185:457a:9325 with SMTP id
 b3-20020a170902d50300b00185457a9325mr9160297plg.140.1665961249268; 
 Sun, 16 Oct 2022 16:00:49 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 8-20020a630308000000b0043c80e53c74sm4905242pgd.28.2022.10.16.16.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 16:00:48 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 16 Oct 2022 16:00:46 -0700
Message-Id: <20221016230046.451093-1-christian@paral.in>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/docker-compose: bump to version
 v2.11.2
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

https://github.com/docker/compose/releases/tag/v2.11.2

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-compose/docker-compose.hash | 2 +-
 package/docker-compose/docker-compose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-compose/docker-compose.hash b/package/docker-compose/docker-compose.hash
index 46a8c59d55..39f98523b8 100644
--- a/package/docker-compose/docker-compose.hash
+++ b/package/docker-compose/docker-compose.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7f051283dc2c047a40604c52dffa579a079bdf54eca742da54f8352dcffc3549  docker-compose-2.10.0.tar.gz
+sha256  69d7d0311ac34ed4543f9a694995fbc4e2b785976a5a710015c20f0d04c204cb  docker-compose-2.11.2.tar.gz
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/docker-compose/docker-compose.mk b/package/docker-compose/docker-compose.mk
index 1d071cc423..bc88d8df88 100644
--- a/package/docker-compose/docker-compose.mk
+++ b/package/docker-compose/docker-compose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_COMPOSE_VERSION = 2.10.0
+DOCKER_COMPOSE_VERSION = 2.11.2
 DOCKER_COMPOSE_SITE = $(call github,docker,compose,v$(DOCKER_COMPOSE_VERSION))
 DOCKER_COMPOSE_LICENSE = Apache-2.0
 DOCKER_COMPOSE_LICENSE_FILES = LICENSE
-- 
2.38.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
