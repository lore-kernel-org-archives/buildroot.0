Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02AAEB64DD
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 16:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1535581F25;
	Mon,  3 Jul 2023 16:18:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1535581F25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VVFLwbiURoAC; Mon,  3 Jul 2023 16:18:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6321381EB7;
	Mon,  3 Jul 2023 16:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6321381EB7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 889E11BF4D8
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 16:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62BA381EB7
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 16:18:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62BA381EB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AJxaTPBfw0gj for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 16:18:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62A5681EB5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 62A5681EB5
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 16:18:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BEB76A4C029B
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 18:18:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39106)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qGMFg-0003JT-1j
 for buildroot@buildroot.org; Mon, 03 Jul 2023 18:18:12 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  3 Jul 2023 18:18:12 +0200
Message-Id: <20230703161812.40064-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230703161812.40064-1-bernd@kuhls.net>
References: <20230703161812.40064-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688401092;
 bh=JEpr63E+T0E6oFYM0VC0Msxr6UGyJT59pd3A03mCBLM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=EdXk98k40dTeHbBbsH/Z3PBWsaiv4O8DMytmxzxqrhq/mBz/Sbtuw/PUpRQ5ZdY2s
 Trmhp6Zhht7HBzn7ryp6TdLYmwEZqM1tdHbEgYdt6keYSpc57mdO1XS0osKAXaCDvw
 LTAO65a21p7wmnxyARdIRQYwcgod8/iHUDk1Rr8aFwtu7XGoN/tOY/pLObNORJxHnQ
 AmgJz/Xf0PtP34r5EbB2k+UfOLAbEvF8e3NAtBkZvv2eTDpayT/ChprkaTUKCyzofM
 dYx4911Lh33Hm4nGFzJXhFf8NM+AW8uKeC9eFS6+ki3bC97MEQELZqC1jZYc5yXbWz
 y0vE6ZQZk6bjQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=EdXk98k4
Subject: [Buildroot] [PATCH 2/2] package/libnatpmp: bump version to 20230423
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

Updated license hash due to reformat of license file:
https://github.com/miniupnp/libnatpmp/commit/d89c1db679c09dbe71ba58b012e4afae2de06376

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libnatpmp/libnatpmp.hash | 4 ++--
 package/libnatpmp/libnatpmp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnatpmp/libnatpmp.hash b/package/libnatpmp/libnatpmp.hash
index 38bc3f4444..7bdd784bf7 100644
--- a/package/libnatpmp/libnatpmp.hash
+++ b/package/libnatpmp/libnatpmp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e1aa9c4c4219bc06943d6b2130f664daee213fb262fcb94dd355815b8f4536b0  libnatpmp-20150609.tar.gz
-sha256  e8d8277e1a101fcfedb0cd5a1cc76646522c0da69f3490dd5a4055fc87ea96a2  LICENSE
+sha256  0684ed2c8406437e7519a1bd20ea83780db871b3a3a5d752311ba3e889dbfc70  libnatpmp-20230423.tar.gz
+sha256  7184f1e2114b518440962e7de67f0b9d5faa3789ba1f1a7ff33159bd26834b06  LICENSE
diff --git a/package/libnatpmp/libnatpmp.mk b/package/libnatpmp/libnatpmp.mk
index 3623027713..3a625ea0fe 100644
--- a/package/libnatpmp/libnatpmp.mk
+++ b/package/libnatpmp/libnatpmp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNATPMP_VERSION = 20150609
+LIBNATPMP_VERSION = 20230423
 LIBNATPMP_SITE = http://miniupnp.free.fr/files
 LIBNATPMP_INSTALL_STAGING = YES
 LIBNATPMP_LICENSE = BSD-3-Clause
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
