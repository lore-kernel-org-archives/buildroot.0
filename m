Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 242FAC3F6B0
	for <buildroot@archiver.kernel.org>; Sat, 13 Aug 2022 08:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CC4283033;
	Sat, 13 Aug 2022 08:35:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CC4283033
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AcEuGOL58x20; Sat, 13 Aug 2022 08:35:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9723682F13;
	Sat, 13 Aug 2022 08:35:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9723682F13
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0B7EA1BF5B5
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 08:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2EA9416D4
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 08:35:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2EA9416D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5sR7Z0rFgngS for <buildroot@lists.busybox.net>;
 Sat, 13 Aug 2022 08:35:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FC03416DE
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4FC03416DE
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 08:35:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 7C72E240005;
 Sat, 13 Aug 2022 08:35:25 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Sat, 13 Aug 2022 10:35:19 +0200
Message-Id: <20220813083521.1382565-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220813083521.1382565-1-thomas.petazzoni@bootlin.com>
References: <20220813083521.1382565-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660379725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pm7qqZg+roehqX8gpEDWe4bi5Ynr91c1Fb9qkgFKXzM=;
 b=iMnGOjaVWv70tCnUGaSi/gwoCW53kh/N/4vO42eKiDXSd64pdZoU7DTP+JQrFCNH1MmwzJ
 +G1btZLc7ECzDUqUyBp44PXXUQlAHDsq24Kr+8zxsvZz52a3PB2PcZ2NA3jQzfC3j8Xv3+
 W0e+E0obdUqB3OBRcD1XWGMakleii87clHreiO6PJYPnc4v8duPXEfc7t9H1E01C0DhdNK
 1jTBelVrOxtyWAV4et1miZnQYJ/2uV007IDUbmhb1p96VYQ8Adv6ccqTmEa9Pqfe2txI5p
 l9ncpZH6aMNPwIlFKgRC9syb+l+CFXWMx6H2v2QAylA7C0tMmyWYOnXrr2FkcA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iMnGOjaV
Subject: [Buildroot] [PATCH 3/4] package/gdb: switch to GDB 11.x as the
 default version
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that GDB 12.x has been added, and GDB 9.x removed, we can make GDB
11.x the default version.

The handling of the GMP dependency needs a bit of change. Until now,
the GMP dependency was needed when building full GDB (host or target)
in version 11.x or 12.x, so we were explicitly checking whether those
versions were enabled.

Now that only GDB 10.x and the ARC-specific version of GDB are the
only remaining ones not needing GDB, we invert the logic: only those
two versions do not trigger the addition of the GMP dependency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdb/Config.in      |  3 +--
 package/gdb/Config.in.host |  6 +++---
 package/gdb/gdb.mk         | 14 +++++++-------
 3 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index c50c3d517a..273b3072ae 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -51,8 +51,7 @@ config BR2_PACKAGE_GDB_DEBUGGER
 	bool "full debugger"
 	depends on BR2_USE_WCHAR
 	depends on !BR2_sh
-	select BR2_PACKAGE_GMP if BR2_GDB_VERSION_11
-	select BR2_PACKAGE_GMP if BR2_GDB_VERSION_12
+	select BR2_PACKAGE_GMP if !BR2_GDB_VERSION_10 && !BR2_arc
 	select BR2_PACKAGE_NCURSES
 
 comment "full gdb on target needs a toolchain w/ wchar"
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 9876c4e8bc..33ffc632ee 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -41,7 +41,7 @@ config BR2_PACKAGE_HOST_GDB_SIM
 
 choice
 	prompt "GDB debugger Version"
-	default BR2_GDB_VERSION_10
+	default BR2_GDB_VERSION_11
 	depends on !BR2_arc
 	help
 	  Select the version of gdb you wish to use.
@@ -63,8 +63,8 @@ endif
 config BR2_GDB_VERSION
 	string
 	default "arc-2020.09-release-gdb" if BR2_arc
-	default "10.2"	   if BR2_GDB_VERSION_10 || !BR2_PACKAGE_HOST_GDB
-	default "11.2"     if BR2_GDB_VERSION_11
+	default "10.2"	   if BR2_GDB_VERSION_10
+	default "11.2"     if BR2_GDB_VERSION_11 || !BR2_PACKAGE_HOST_GDB
 	default "12.1"     if BR2_GDB_VERSION_12
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
 
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index dd126b42ce..d2bbfcb290 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -65,8 +65,9 @@ GDB_DEPENDENCIES += host-flex host-bison
 HOST_GDB_DEPENDENCIES += host-flex host-bison
 endif
 
-# Add the necessary host-gmp dependency for the newer releases of GDB
-ifeq ($(BR2_GDB_VERSION_11)$(BR2_GDB_VERSION_12),y)
+# All newer versions of GDB need host-gmp, so it's only for older
+# versions that the dependency can be avoided.
+ifeq ($(BR2_GDB_VERSION_10)$(BR2_arc),)
 HOST_GDB_DEPENDENCIES += host-gmp
 endif
 
@@ -154,11 +155,10 @@ GDB_CONF_OPTS += \
 	--without-curses
 endif
 
-# When GDB >= 11.x (because it's enabled for the host) and we're
-# building the full gdb for the target, we need gmp as a
-# dependency. For now the default gdb version in Buildroot doesn't
-# require gmp.
-ifeq ($(BR2_GDB_VERSION_11)$(BR2_GDB_VERSION_12):$(BR2_PACKAGE_GDB_DEBUGGER),y:y)
+# Starting from GDB 11.x, gmp is needed as a dependency to build full
+# gdb. So we avoid the dependency only for GDB 10.x and the special
+# version used on ARC.
+ifeq ($(BR2_GDB_VERSION_10)$(BR2_arc):$(BR2_PACKAGE_GDB_DEBUGGER),:y)
 GDB_CONF_OPTS += \
 	--with-libgmp-prefix=$(STAGING_DIR)/usr
 GDB_DEPENDENCIES += gmp
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
