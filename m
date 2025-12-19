Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B45D78770
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 17:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8616A60D8C;
	Fri, 19 Dec 2025 17:52:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D5dE8pax6xUH; Fri, 19 Dec 2025 17:52:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9E4B612C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766166757;
	bh=RO64Ocf9RjC6H5DcmqWTEN8W8sDBa81CTE9QTFCwgSQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nN66CixqeuUau9ptZHiVtDndwF0W+Y0b5FNGf8flrTYHJZMzLK5Za9TNubWBrDFTl
	 zx0Z0kVgivSw3Uzna336xDqcUAk/ZT6Qk9l3zf38zyJ0ydrJORjVw9qdMHdbUnPg07
	 x4EaJNS0BBJJEPRq5UQBKTuxHoQ09KKQalfLFxFEbDXISQ9+xVrNkLNg96QelYcbTB
	 9nELVa6xDjQdXeUamrTe6XF1Lqf50A18823ZlB3qS1unyAtHPr2tuzUrtMrcAzEmq6
	 sRpXjrjLKjgQInixPpOnw1VjSawszDhXK3/AIzpBTZPJ6ujejI2/q2f2Iqt5flonGV
	 52NNqaLarsrCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9E4B612C5;
	Fri, 19 Dec 2025 17:52:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C276119
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 17:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1EFB612C5
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 17:52:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id siXZ-JnN2-vT for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 17:52:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E048C60D8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E048C60D8C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E048C60D8C
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 17:52:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a05d4.dip0.t-ipconnect.de [91.58.5.212])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B5ACAA4C4AB2;
 Fri, 19 Dec 2025 18:51:48 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38748)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vWedo-000000002KQ-35WO;
 Fri, 19 Dec 2025 17:51:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
	Simon Dawson <spdawson@gmail.com>
Date: Fri, 19 Dec 2025 18:51:23 +0100
Message-ID: <20251219175141.1907408-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251219175141.1907408-1-bernd@kuhls.net>
References: <20251219175141.1907408-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766166708;
 bh=yExeYQ86Wu8cerYMZx1ePV8GlTny9pDE7EYhkMRskFA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Qzv1qhA5rskmTiZ/xDNG0IuNZRFsnP1S8eG4QDIK1s0psa7+OVHPCm28yANcZr2ZY
 b1mwLNY0gnEMhXfS6hbyYRZ/djpIygn2k2rb6pRWrriSTz7kQyAU617d0bC4hKrtab
 g90r8TeZ7wH1pVl9svC6A0hqg+iWrzcqXEtuwC/EmSOwfz/QPzxgOyjoq64fpFiiow
 v2Zedc2c+LhoWNp6JgJdT6PLghyiY7CgaThwHVk4qTi8r3u9Th86jk7JjNaD44aDEb
 1O9Vpg2WZ0cts6weTu9v6grJS3jg6LeXU/qOOd8VUzLOQzSYvDtqRd2LxMdikYzQIk
 82CWbEgXb0zpw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Qzv1qhA5
Subject: [Buildroot] [PATCH v4 04/20] package/connman-gtk: remove package
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
index 2a22070af9..cc9fc22616 100644
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
index 154d2dd22a..87c91e3439 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2456,7 +2456,6 @@ endif
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
