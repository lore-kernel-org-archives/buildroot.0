Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A69D3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 07:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7EE56075E;
	Sun, 28 Dec 2025 07:49:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6bv7ExEab693; Sun, 28 Dec 2025 07:49:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 025B360844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766908159;
	bh=GNYC91O/e4P7LrbP9wAC2jZ0pEfAkM9CnMDn+fykmsA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EuFpmdl9zoNtvr4RtfhXPhFRnbRKuGh9Ftqol4/goLPmdV4xW7GD+zFsmmq6rRVfd
	 3sxWJfSQTSX93pwBrCuCy9vYtdHtuS5pGgHJPsOFdhh5TRKng5k2Ihu2C0rJzvwj2B
	 /b5XRt0PlPoY6k7WqpiRxIIS+0xBYZjyKkc61OUnP2q9GfxFjNWmeeqF6t6JtIf/11
	 tSO+lHAncMtGCsnVzvAC1ONs1oVYErLCjbHBIFo5Gut0zvpzS//1aEjNPXXx05NPaQ
	 UNWyMQ+e0DNj0fTz3ACwwxoHBQ5UTsTi3MDFrwtifzAcsM+ZHTj8SaE2NTAVw8c+Qd
	 74E9TvU6t0IFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 025B360844;
	Sun, 28 Dec 2025 07:49:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C873D8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EBAB6075E
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:49:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id snv8ZA4__xXG for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 07:49:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 55FD060844
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55FD060844
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 55FD060844
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:49:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 033BFA4C220C;
 Sun, 28 Dec 2025 08:48:25 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35324)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vZlVo-000000004ex-1mkF;
 Sun, 28 Dec 2025 07:48:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Sun, 28 Dec 2025 08:47:59 +0100
Message-ID: <20251228074822.3370464-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251228074822.3370464-1-bernd@kuhls.net>
References: <20251228074822.3370464-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766908105;
 bh=LMsEWbsPt10ok06Z2B7naIE0yV9d6VHXVC/OE+kwpPQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=CKc6cOLge89uODET4vmlBNzPzOzC+HTaaHPp9g2XagZtAO9OMX4Ds7n246tfmvFSJ
 smiDFF2c8WmNk5aTvFOuRiF0sxU/OGwRfCw/MmreS+WvDdoF8swbn3+UH0c97a86VA
 ff0FdAn8Wdqdo/e2l/+S+JzBvxt4M9E6IGe0PfkKeDiJUHzYCtSgo7lZTOT75LJ+S2
 xLZKU1BWvkaRioGWuk0CYpye7w+sRMwg0FPGNsz8pUoo1+O2hw1zHNJCS333iA13v0
 L0Bz4gTCZE1/18TEw4OFxFofM0lKs8e4ccMxK65RbKuzepTJqYhyk/AoIt6v+XbnZz
 /MNxOw3GhXpwg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=CKc6cOLg
Subject: [Buildroot] [PATCH v6 04/26] package/connman-gtk: remove package
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
index 12bebc2583..f8276f0715 100644
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
index 14c9a6a4ab..d4a7ce0767 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2457,7 +2457,6 @@ endif
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
