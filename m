Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E9EC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 17:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38F026FAC0;
	Tue, 21 Feb 2023 17:24:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38F026FAC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3-FHcc2inEdN; Tue, 21 Feb 2023 17:24:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6884D6FAA4;
	Tue, 21 Feb 2023 17:24:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6884D6FAA4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8A0A11BF42C
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 17:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD2AA61202
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 17:22:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD2AA61202
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id umwfppWZDxzw for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 17:22:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90D5F61230
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 90D5F61230
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 17:22:20 +0000 (UTC)
Received: from vfazio2.xes-mad.com (vfazio2.xes-mad.com [10.52.16.113])
 by mail.xes-mad.com (Postfix) with ESMTP id F3D9121718;
 Tue, 21 Feb 2023 11:22:18 -0600 (CST)
From: Vincent Fazio <vfazio@xes-inc.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 11:22:00 -0600
Message-Id: <20230221172205.2450111-10-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230221172205.2450111-1-vfazio@xes-inc.com>
References: <20230221172205.2450111-1-vfazio@xes-inc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=xes-inc.com; s=mail; 
 t=1677000139; bh=1kJpNsTYZAftzH4RUyQbsRb0UVJReykYI8cVf8Oajws=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ot+hreblnRHFHniQUlV5UTLhFq/BUe/KlVUxlvwouNKIZ4QiLODGAbbnKaWTZ2ipJ
 06P2U+IqI7wKW4Y7by4u8XrnjTD4TwbX8q82fQxn8pJcLinfHfs9cSFPKgEv3jL855
 Ij1/9hvcGG7aOQeelbpJv16AcqX58VdIWNQpW2VE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com
 header.a=rsa-sha256 header.s=mail header.b=Ot+hrebl
Subject: [Buildroot] [PATCH 10/15] package/motion: migrate to new autopoint
 flag
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Vincent Fazio <vfazio@gmail.com>, Joris Lijssens <joris.lijssens@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Vincent Fazio <vfazio@gmail.com>

Drop patch that is no longer necessary.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 ...1-configure.ac-remove-po-Makefile.in.patch | 29 -------------------
 package/motion/motion.mk                      |  2 +-
 2 files changed, 1 insertion(+), 30 deletions(-)
 delete mode 100644 package/motion/0001-configure.ac-remove-po-Makefile.in.patch

diff --git a/package/motion/0001-configure.ac-remove-po-Makefile.in.patch b/package/motion/0001-configure.ac-remove-po-Makefile.in.patch
deleted file mode 100644
index 9b514bafcd..0000000000
--- a/package/motion/0001-configure.ac-remove-po-Makefile.in.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 0e05d4116678de3a7d913177a8fc63f10e58ad24 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 18 Jan 2020 00:00:21 +0100
-Subject: [PATCH] configure.ac: remove po/Makefile.in
-
-The file po/Makefile.in is automatically added to AC_OUTPUT while using
-gettexize
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not upstreamable]
----
- configure.ac | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 3876adb..221dacf 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -471,7 +471,6 @@ LDFLAGS="$TEMP_LDFLAGS"
- AC_CONFIG_FILES([
- 	Makefile
- 	src/Makefile
--  po/Makefile.in
-   man/Makefile
-   data/camera1-dist.conf
-   data/camera2-dist.conf
--- 
-2.24.1
-
diff --git a/package/motion/motion.mk b/package/motion/motion.mk
index 4e9ccdc3f7..2cce6cd1ff 100644
--- a/package/motion/motion.mk
+++ b/package/motion/motion.mk
@@ -12,7 +12,7 @@ MOTION_CPE_ID_VENDOR = motion_project
 MOTION_DEPENDENCIES = host-pkgconf jpeg libmicrohttpd $(TARGET_NLS_DEPENDENCIES)
 # From git
 MOTION_AUTORECONF = YES
-MOTION_GETTEXTIZE = YES
+MOTION_AUTOPOINT = YES
 
 MOTION_CONF_OPTS += --without-optimizecpu
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
