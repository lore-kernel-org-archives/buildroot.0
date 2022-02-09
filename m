Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AB3C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59AB7813B2;
	Wed,  9 Feb 2022 21:43:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R61qB_RR15bZ; Wed,  9 Feb 2022 21:43:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A225B817E4;
	Wed,  9 Feb 2022 21:43:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F0581BF9C1
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B47860FD4
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SR7xI9QezLeD for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A861860E45
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id BB9658323E; Wed,  9 Feb 2022 21:25:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:08:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d27906769fa6cf2bce268ea957527579165e2d8e
X-Git-Newrev: e643be1bfc3dccd82e0940d61c5f6954f4033a21
X-Patchwork-Hint: ignore
Message-Id: <20220209212559.BB9658323E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gpsd: drop python2 support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e643be1bfc3dccd82e0940d61c5f6954f4033a21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
