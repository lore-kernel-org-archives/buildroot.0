Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9F4C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 16:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A8AE403F8;
	Wed,  9 Feb 2022 16:54:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 98DLUVeNEqv0; Wed,  9 Feb 2022 16:54:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C04D40146;
	Wed,  9 Feb 2022 16:54:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F50B1BF47D
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDF3A60B5C
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:52:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HlCuCluAZj2r for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:52:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 214E960AEC
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:52:33 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 519C8E0005;
 Wed,  9 Feb 2022 16:52:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nHqCj-0001F1-JQ; Wed, 09 Feb 2022 17:52:29 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 17:50:41 +0100
Message-Id: <20220209165213.4498-16-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220209165213.4498-1-peter@korsgaard.com>
References: <20220209165213.4498-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 015/107] package/gpsd: drop python2 support
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gpsd/Config.in | 4 ++--
 package/gpsd/gpsd.mk   | 4 ----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index 1da9a5ce2a..b66d0952dd 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -81,8 +81,8 @@ config BR2_PACKAGE_GPSD_SQUELCH
 
 config BR2_PACKAGE_GPSD_PYTHON
 	bool "build Python support and modules"
-	depends on BR2_USE_WCHAR # python
-	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
+	depends on BR2_USE_WCHAR # python3
+	select BR2_PACKAGE_PYTHON3
 	help
 	  Python libraries and tools for the gpsd service daemon
 	  including gpsfake test harness.
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 636c6c95ba..4388b7e24d 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -194,10 +194,6 @@ ifeq ($(BR2_PACKAGE_PYTHON3),y)
 GPSD_SCONS_OPTS += \
 	python=yes \
 	python_libdir="/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages"
-else ifeq ($(BR2_PACKAGE_PYTHON),y)
-GPSD_SCONS_OPTS += \
-	python=yes \
-	python_libdir="/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"
 else
 GPSD_SCONS_OPTS += python=no
 endif
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
