Return-Path: <SRS0=trv6=NC=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 963B0C4338F
	for <buildroot@archiver.kernel.org>; Wed, 11 Aug 2021 11:13:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AD9560F38
	for <buildroot@archiver.kernel.org>; Wed, 11 Aug 2021 11:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3AD9560F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09A1940111;
	Wed, 11 Aug 2021 11:13:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kge-nFcPWpi0; Wed, 11 Aug 2021 11:12:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D132C40172;
	Wed, 11 Aug 2021 11:12:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 51E471BF30A
 for <buildroot@lists.busybox.net>; Wed, 11 Aug 2021 11:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FBDE402E8
 for <buildroot@lists.busybox.net>; Wed, 11 Aug 2021 11:12:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4rv8iLoN7xnl for <buildroot@lists.busybox.net>;
 Wed, 11 Aug 2021 11:12:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8225B40111
 for <buildroot@buildroot.org>; Wed, 11 Aug 2021 11:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=w4WX7liowDx8kibNJRienz+BUJ1ihvrVkTjCmAQTvQs=; 
 b=IOMLFio2/pgF6cMRj0D5r0iZPTFb+NBC/NF8ETw/iAt+9+Kj/8Q0vZrlU4B6khHE+/LH0Cwznqwh8xuqD/wL+KSIjXR+2gAeg8M5g+bSccssu+QJSP8ROOMF74US/R/Cm+v7YD0cti6DA5/c6o+2YP6XQk55kcLC+04vn6dM6MFvK6eN3YGATEKlVb33SBgvvt5YXF4Eerz9WPRmBtGKKjFmfvmg4f2E6tCovMgQggPc4IsvSVeTi7x0VLg1pAo/SrbjseMgON7RSVdfbLNSA+KlkhkD7Jwl2EfIfA8t57PrJv8Z5o2LHq2f0xnQWgZYuDoovBHpIMdJoW4wZFb13Q==;
Received: from 91-153-34-142.elisa-laajakaista.fi ([91.153.34.142] helo=kodama)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mDm9h-0007YR-M8; Wed, 11 Aug 2021 13:12:17 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 9c5e6592;
 Wed, 11 Aug 2021 11:11:58 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Wed, 11 Aug 2021 14:11:58 +0300
Message-Id: <20210811111158.2577789-4-aperez@igalia.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210811111158.2577789-1-aperez@igalia.com>
References: <20210811111158.2577789-1-aperez@igalia.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/cage: bump to version 0.1.4
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Update Cage to version 0.1.4, which is a bug fix release that
supports using wlroots 0.14.x.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/cage/cage.hash | 4 ++--
 package/cage/cage.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cage/cage.hash b/package/cage/cage.hash
index 6e312bbf5f..31ae25bacc 100644
--- a/package/cage/cage.hash
+++ b/package/cage/cage.hash
@@ -1,5 +1,5 @@
-# Generated locally
-sha256 c28aa8230f937c89b564967748451c1eb15d8633a71a1ed6e22d532afa15462e  cage-0.1.3.tar.gz
+# Generated locally after checking GPG signature
+sha256 dfe27fb0c7d43db72d6c82f01e2736580a0791a23ba69d7b56285d08af98ad90  cage-0.1.4.tar.gz
 
 # Hashes for license files:
 sha256 e117104073335dbaf78596fb1bedf89dda63c71f60f0b665947b2d369c77ecee  LICENSE
diff --git a/package/cage/cage.mk b/package/cage/cage.mk
index 0950c70474..a661857a95 100644
--- a/package/cage/cage.mk
+++ b/package/cage/cage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAGE_VERSION = 0.1.3
+CAGE_VERSION = 0.1.4
 CAGE_SITE = https://github.com/Hjdskes/cage/releases/download/v$(CAGE_VERSION)
 CAGE_LICENSE = MIT
 CAGE_LICENSE_FILES = LICENSE
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
