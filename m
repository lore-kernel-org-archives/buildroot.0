Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59FBEB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 19:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 440A941596;
	Thu,  6 Jul 2023 19:19:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 440A941596
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qV5UEXkJiOrU; Thu,  6 Jul 2023 19:19:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E16640484;
	Thu,  6 Jul 2023 19:19:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E16640484
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C069A1BF4E6
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 19:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6E2540484
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 19:19:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6E2540484
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8xwkh0Gefazy for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 19:19:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E506740476
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E506740476
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 19:19:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfe4.dip0.t-ipconnect.de [79.214.207.228])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 178DAA4C0EBF
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 21:19:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34628)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qHUVU-0006Qs-2b
 for buildroot@buildroot.org; Thu, 06 Jul 2023 21:19:12 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  6 Jul 2023 21:19:12 +0200
Message-Id: <20230706191912.3008144-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230706191912.3008144-1-bernd@kuhls.net>
References: <20230706191912.3008144-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688671153;
 bh=ajMwMwcK9TrHhU+DrsoHPQzEiaQ/gMQfESawb0a320Q=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=khtmKGK+sB9CYf9zhSOxcUHT6UqcMDEdZ2tBdBljGRP5yaUfyZ2q4rhVBo/bsn4te
 gzzvQ2lygAdH2/jBW9G9Em7YLrQT9WL8NlTBjUYMrV3JDF/Sfi70Uug3KnrZXEqqoJ
 MSjN0/NldyUpS7gG4DjrPyYHarTMAXQLhVsNI2w495/nGtmFOJJz/tjsqSqXxQESq/
 3Zit+BQYDzRg2DvugfXxBm2BSnAH7ttULgJVeje4dCGr7EqcOn56FTA9xvh4Oswmkd
 Ppgr8NZ90QXsyj41qFft30qyAd6tVmCp7zC1k5i9RBohnmcbzwTx+dp0fVYG+W7d10
 hUgTN8bJqfDgw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=khtmKGK+
Subject: [Buildroot] [PATCH 2/2] package/cryptodev-linux: bump version to
 1.13
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

Changelog:
https://github.com/cryptodev-linux/cryptodev-linux/blob/master/NEWS
"* Fix compilation issues against Linux kernel 6.3"

Fixes:
http://autobuild.buildroot.net/results/9b9/9b9ad744d8a37fc46726461551a2dcb3c26a1341/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/cryptodev-linux/cryptodev-linux.hash | 2 +-
 package/cryptodev-linux/cryptodev-linux.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptodev-linux/cryptodev-linux.hash b/package/cryptodev-linux/cryptodev-linux.hash
index d649e8934a..300aa3bcd4 100644
--- a/package/cryptodev-linux/cryptodev-linux.hash
+++ b/package/cryptodev-linux/cryptodev-linux.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f51c2254749233b1b1d7ec9445158bd709f124f88e1c650fe2faac83c3a81938  cryptodev-linux-1.12.tar.gz
+sha256  33b7915c46eb39a37110e88c681423c0dd0df25d784b6e1475ac3196367f0db5  cryptodev-linux-1.13.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/cryptodev-linux/cryptodev-linux.mk b/package/cryptodev-linux/cryptodev-linux.mk
index 5a9e6ad233..580ea89520 100644
--- a/package/cryptodev-linux/cryptodev-linux.mk
+++ b/package/cryptodev-linux/cryptodev-linux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRYPTODEV_LINUX_VERSION = 1.12
+CRYPTODEV_LINUX_VERSION = 1.13
 CRYPTODEV_LINUX_SITE = $(call github,cryptodev-linux,cryptodev-linux,cryptodev-linux-$(CRYPTODEV_LINUX_VERSION))
 CRYPTODEV_LINUX_INSTALL_STAGING = YES
 CRYPTODEV_LINUX_LICENSE = GPL-2.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
