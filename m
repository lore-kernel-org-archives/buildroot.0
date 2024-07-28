Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06078C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 07:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDD9F81778;
	Sun, 28 Jul 2024 07:54:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X2dyEkEOdwzc; Sun, 28 Jul 2024 07:54:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8CD881799
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8CD881799;
	Sun, 28 Jul 2024 07:54:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 043301BF32E
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 07:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E673A606DC
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 07:53:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tw6yPS9LEvRc for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 07:53:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2C54A60649
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C54A60649
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C54A60649
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 07:53:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cca8.dip0.t-ipconnect.de [79.214.204.168])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 11620A4C31D5;
 Sun, 28 Jul 2024 09:53:40 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36762)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sXyiq-000000006Eo-04bV;
 Sun, 28 Jul 2024 07:53:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 28 Jul 2024 09:53:39 +0200
Message-Id: <20240728075339.4793-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1722153220;
 bh=hoUij3NGGOJDQQsiboQX9YTBB2BONC5iBfKFDthyxI4=;
 h=From:To:Cc:Subject:Date:From;
 b=jUPSZl5bkPxnSVQweZYW174BXcE+0cXJVhItdJW3VGtqMNxAtHkHm/rnjpHOHxn7l
 3FDUT1GyWNPy1vF808GX4s/szWYABbHBl+kMWAd8IQd689pQePoUtAGkQdvwcnX5Wr
 74TuGYSZGRfzkB3VusB0ca5OgXky9fAWPiSab6AgRfjrx/elNLAlmcYLs58ZQXo/nj
 G5FOtz2EYJ0e9KmzbJ5Jd1mktMiiuw0/5fu63mLTsJm7+nWR9EiZidw5CIjvajJ269
 M+XULpdYoyCzDsZ/zzmTX4GQaRlSp99lBGM+fknedk5r1NYvlUVRMmc9HracDrNl+S
 1jMiNPgt+Fh7g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=jUPSZl5b
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/tvheadend/tvheadend.hash | 2 +-
 package/tvheadend/tvheadend.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 225123a5f0..f0140aefdc 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8454c696e9987ae77d1bc6e1fe45536bd9ef69192b6e568840fe8994ca2a5c2b  tvheadend-d2e41b553e7cc6eb06fd21b42bbed4b3a1f28bc0.tar.gz
+sha256  b613319b01db2f7e08f735dd1da318041265a6f44b435491f3e8b0e32efd6d2f  tvheadend-b774bdd25351e51eba0282ccf7c65904dc1b5655.tar.gz
 sha256  16aaf037a2d00e6e7804de64619887fc7539f1ede99e3282c86dfbc61c2af63e  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 0453e08f4b..46a082838f 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = d2e41b553e7cc6eb06fd21b42bbed4b3a1f28bc0
+TVHEADEND_VERSION = b774bdd25351e51eba0282ccf7c65904dc1b5655
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
