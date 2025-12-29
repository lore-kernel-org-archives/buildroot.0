Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1118EE92FCB
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 18:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8D4A60B6A;
	Mon, 29 Dec 2025 18:00:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jEhD3acQhCqI; Mon, 29 Dec 2025 18:00:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0F8860A93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767031232;
	bh=NSN+FkoEG1ia9C54tPcYQln6wgfkRzVKeGf4aXtb4Q0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qgp2iUZLvW8+ReWjB4q73c2J/+ojhmIFE+H3j6AYXYUeDTF+E0FwCxeqwlIN0HdRh
	 rJl7HJcjIz9hsLW/GQmnIb9g18u7qO+YQ8ijqyQyMgz1qUXa9ZCWYVRKT5gxPcs2At
	 BGPtY5jrqdIeLRXnsAbh0B4XZQyAkr9D/z69yrvNaZr2cGlj43F0pPPPKhMA6/Qs7B
	 rVts4YD+xnKCuhfd5H6uEfgvjKPHcWxzhZqc/yAp0fxPFpPkChP2YnSEC3D/pUtjPI
	 vaGSF6OVEYZo2gFt0KAfYdzykmX7kbKBge9WdjC9Vb+fz1iEd6HVLKtojcl5uqRFCp
	 kAGqjUkQI8cog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0F8860A93;
	Mon, 29 Dec 2025 18:00:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EFB3177
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35ED2407CF
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:00:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Hoq3oFTSAdh for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 18:00:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2E74B4074C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E74B4074C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E74B4074C
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:00:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 22924A4C258F;
 Mon, 29 Dec 2025 18:59:40 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53686)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vaHWt-000000002P5-1yEX;
 Mon, 29 Dec 2025 17:59:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Romain Naour <romain.naour@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Mon, 29 Dec 2025 18:59:12 +0100
Message-ID: <20251229175938.3549882-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251229175938.3549882-1-bernd@kuhls.net>
References: <20251229175938.3549882-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767031180;
 bh=xTA3YwI3uMi0Z3b6tqR15ETLXOkdbwsEpulN+82tYTs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=WRVRnP6o6hC1Mu5DDoY9uLaSqscojfhVUqEalR0eA5rU0f2T/2UFOI+YW8Hvcz3oC
 O+IttDbIjDayC4xmCXUV4zSoo+Et9DaQOXmUMNDbj2YOop1B9AhVfTWK3j2xGkk0XG
 EkgwGJaOEoY7FUCYQYZucMIyYs4KOUEheumf5BVQvbCpjl+ULpbSuMkBw472R2sBIC
 o5iT7II05465SCWvnM25Ce+lgLHkRXXxoj/r6DgsaiEBqrw+gX87TjZMxZ5A3sVUqA
 0hoSC+bGrfRyvZB7gbnTcy9vphkkMArPyVZQ1aYyPARqMu/eYdPUi3iOK/wL/6n3W1
 OhozSInOYaWfw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=WRVRnP6o
Subject: [Buildroot] [PATCH v8 04/29] package/connman-gtk: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Analysis of https://github.com/jgke/connman-gtk:
marked as read-only: Oct 2021
last commit: Jun 2018
last bug report: Oct 2021
last pull request: Apr 2020

The package is broken with gcc 15.x and no other package depends on it.

Fixes:
https://autobuild.buildroot.net/results/54d/54d8cc10e4d017deabf8664898a2d09e3a115f66/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                     |  6 ++++++
 package/Config.in                    |  1 -
 package/connman-gtk/Config.in        | 22 ----------------------
 package/connman-gtk/connman-gtk.hash |  3 ---
 package/connman-gtk/connman-gtk.mk   | 17 -----------------
 5 files changed, 6 insertions(+), 43 deletions(-)
 delete mode 100644 package/connman-gtk/Config.in
 delete mode 100644 package/connman-gtk/connman-gtk.hash
 delete mode 100644 package/connman-gtk/connman-gtk.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index cc0b264ba4..94d1c4ea08 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_CONNMAN_GTK
+	bool "connman-gtk has been removed"
+	select BR2_LEGACY
+	help
+	  connman-gtk is unmaintained and has been removed
+
 config BR2_PACKAGE_LIBMHASH
 	bool "libmhash has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 2617020fe6..06e3782e87 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2461,7 +2461,6 @@ endif
 	source "package/civetweb/Config.in"
 	source "package/cloudflared/Config.in"
 	source "package/connman/Config.in"
-	source "package/connman-gtk/Config.in"
 	source "package/conntrack-tools/Config.in"
 	source "package/corkscrew/Config.in"
 	source "package/crda/Config.in"
diff --git a/package/connman-gtk/Config.in b/package/connman-gtk/Config.in
deleted file mode 100644
index 467bf7ec88..0000000000
--- a/package/connman-gtk/Config.in
+++ /dev/null
@@ -1,22 +0,0 @@
-comment "connman-gtk needs libgtk3 and a glibc or uClibc toolchain w/ wchar, threads, resolver, dynamic library"
-	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS || !BR2_PACKAGE_LIBGTK3 || \
-		BR2_TOOLCHAIN_USES_MUSL
-
-config BR2_PACKAGE_CONNMAN_GTK
-	bool "connman-gtk"
-	depends on BR2_USE_WCHAR # libglib2, connman
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, connman
-	depends on BR2_USE_MMU # libglib2
-	depends on !BR2_STATIC_LIBS # connman
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # connman
-	depends on !BR2_TOOLCHAIN_USES_MUSL # connman
-	depends on BR2_PACKAGE_LIBGTK3
-	select BR2_PACKAGE_CONNMAN
-	select BR2_PACKAGE_LIBGLIB2
-	help
-	  GTK GUI for ConnMan.
-
-	  https://github.com/jgke/connman-gtk
diff --git a/package/connman-gtk/connman-gtk.hash b/package/connman-gtk/connman-gtk.hash
deleted file mode 100644
index 72e2fcaaa5..0000000000
--- a/package/connman-gtk/connman-gtk.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  49bdc4769a7c508b0130e4705eef21aec9df1ea4f5c29fee48a0cae8db828fca  connman-gtk-1.1.1.tar.bz2
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/connman-gtk/connman-gtk.mk b/package/connman-gtk/connman-gtk.mk
deleted file mode 100644
index 0ea49198e6..0000000000
--- a/package/connman-gtk/connman-gtk.mk
+++ /dev/null
@@ -1,17 +0,0 @@
-################################################################################
-#
-# connman-gtk
-#
-################################################################################
-
-CONNMAN_GTK_VERSION = 1.1.1
-CONNMAN_GTK_SITE = https://github.com/jgke/connman-gtk/releases/download/v$(CONNMAN_GTK_VERSION)
-CONNMAN_GTK_SOURCE = connman-gtk-$(CONNMAN_GTK_VERSION).tar.bz2
-CONNMAN_GTK_INSTALL_STAGING = YES
-CONNMAN_GTK_DEPENDENCIES = host-intltool connman libglib2 libgtk3 \
-	$(TARGET_NLS_DEPENDENCIES)
-CONNMAN_GTK_LICENSE = GPL-2.0+
-CONNMAN_GTK_LICENSE_FILES = COPYING
-CONNMAN_GTK_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
-
-$(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
