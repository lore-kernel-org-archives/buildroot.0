Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D0D7C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:57:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAB4A60E77
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AAB4A60E77
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7374A83276;
	Sat, 24 Jul 2021 20:57:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wpCHKhhL6wHk; Sat, 24 Jul 2021 20:57:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE2EB831EF;
	Sat, 24 Jul 2021 20:57:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C24081BF27E
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF988831EF
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:57:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VLcUwKpTsTVi for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 20:57:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 15D858316F
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 20:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=8vgvq3jUTnsumDWzh+DMvVJ7sgfGBESacRGAKFMsbiU=; 
 b=pITrp6DZEJ+eJd+E6N3Hr4jqKeO651Rzf6UFJPOEmbk1+nFrOKMrnIZ/AmBIlGwbPmqfgo3HaTP6x7SH9E9NSUn2gvPsSii/MzR8jBbnGK1XIAMdqT564j74S+rCuwkIYeDnwvlHMGqhhQ7SXbYB6pIBejuWFrgjWr+u0vcKrxZzYOL/t3aBMZDykGoRnG5CgLmcS8+4nSf40C1di/Feik7wrSZMZOQznf3nlr9Rm20wyaSmOG0PaHLOue5UoHBhoZSipFr0mqG6UYBmz1tvb94ai7P84QNfXu3qV+Fk+E9pxUQnntrafMbQCdV4Wpfr2APlYhTUC5xtarrz1veI1A==;
Received: from 91-153-34-142.elisa-laajakaista.fi ([91.153.34.142] helo=kodama)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1m7Oi0-0002hx-A1; Sat, 24 Jul 2021 22:57:20 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 37437e30;
 Sat, 24 Jul 2021 20:57:10 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 23:57:10 +0300
Message-Id: <20210724205710.138162-1-aperez@igalia.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: security bump to version
 2.32.3
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This is a minor release which provides fixes for CVE-2021-21775,
CVE-2021-21779, CVE-2021-30663, CVE-2021-30665, CVE-2021-30689,
CVE-2021-30720, CVE-2021-30734, CVE-2021-30744, CVE-2021-30749,
CVE-2021-30795, CVE-2021-30797, and CVE-2021-30799.

Full release notes can be found at:

  https://webkitgtk.org/2021/07/23/webkitgtk2.32.3-released.html

An accompanying security advisory has been published at:

  https://webkitgtk.org/security/WSA-2021-0004.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/webkitgtk.hash | 8 ++++----
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index dd950bbabe..1208dfce6c 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.32.2.tar.xz.sums
-md5  6dbf813fefd79c551be47b1312f27cec  webkitgtk-2.32.2.tar.xz
-sha1  958777627972b18501e5520d0aba9e274a2b151f  webkitgtk-2.32.2.tar.xz
-sha256  1790f86975bdef957ba9a12fc09202de8f55c885ee38467afc50d2bdb7a6c5cd  webkitgtk-2.32.2.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.32.3.tar.xz.sums
+md5  f31b802de421865ea9f1391ec8190519  webkitgtk-2.32.3.tar.xz
+sha1  9c9b2cb2638ea40706765768dd5cb3c95ab46dcb  webkitgtk-2.32.3.tar.xz
+sha256  c1f496f5ac654efe4cef62fbd4f2fbeeef265a07c5e7419e5d2900bfeea52cbc  webkitgtk-2.32.3.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 9c099c4e91..00972744c7 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.32.2
+WEBKITGTK_VERSION = 2.32.3
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
