Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E816BD5E156
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 13:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54AC160FE0;
	Tue, 16 Dec 2025 13:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XWUC6PzoWDgJ; Tue, 16 Dec 2025 13:56:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22EBF60FBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765893413;
	bh=pUYFBbBz5Ytk8eeYYRsitZXDLG6TtY8KN5+nRfL6Kqo=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=ide53+9ewGfMMuGx659xBpuUY63fRxhp2nCjhHT98sFexZnKzuUtMaZVMFt/c3flW
	 HFiuB24JpIJfPmwK61MfwGc50M4Km/i1vyNKgUaa/eT3CtCuJWo1wCV7tsyX4pfp2u
	 gYu/8MxQwk2ucH4PzPcX/sv+gT2gyvKY3VfdWLamXi+nMoyrMy8tCSmukJtHSFsz11
	 E8zORjramuFmb+PuEfhQpFwBCXkrCSo5d6N7+zrxlDjZLAnHHGggWztlvmQdogKCYD
	 p49zBeFJOcAusozy0T+Qpj0iCf9zUa4WrUrPYE4Od6fA3h3omnom1AiBHbGWr95wR/
	 a8mGG9WfhYU2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22EBF60FBD;
	Tue, 16 Dec 2025 13:56:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 55CEB151
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 13:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4798C404F7
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 13:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0sPYpi-kLDRP for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 13:56:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 06BA640450
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06BA640450
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 06BA640450
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 13:56:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 6AA88C19D32
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 13:56:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D57F66071C
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 13:56:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 755AB1194353F; Tue, 16 Dec 2025 14:56:40 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Dec 2025 14:56:32 +0100
Message-ID: <20251216135633.1413876-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765893402; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=TjsrbFLrwIUu8AKrXqRoY0KUNKLKTaaI5ie+95HXpHI=;
 b=TZjxuUji+aYjTwlT70Gk60pGqivuXjlC3sy3uzty4FQyY05SI+HRf5z9p2HUyVRavy00oK
 mazIWH6Wt4QzT77ejJAlqEtOwF9VyGA9XBtdDWcgvgWxomkpQ+/HokaSmzeAokeBt11Njx
 FGNntHWGjn5UG5/GAKRikgLOurg/VkWW87tTMDC1MNRFTGpf9plcBjJHDo6b/gqAqulbDs
 VXSmq4IGpHfrxld+lSqQ3vQjgZXaLGpYX7AWWuOJwzDvP77eMF4jaGH7cZOBfU7tZxcV43
 eAE9aVMD+vyfkzj0qVx1RfIrmLeONIdl8sxYXhpAPuQKdai96ES1Cvj9RewSpQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=TZjxuUji
Subject: [Buildroot] [PATCH] package/connman-gtk: remove package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Last upstream release: December 2015
- Last upstream commit: June 2018
- Github repo marked as archived/read-only
- No maintainer in DEVELOPERS file
- Doesn't build with recent Gtk versions

Fixes:

  https://autobuild.buildroot.net/results/54d8cc10e4d017deabf8664898a2d09e3a115f66/

(This has been broken for a long time, this build falure is from
January 2025, so our LTS branch is similarly affected)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                     |  7 +++++++
 package/Config.in                    |  1 -
 package/connman-gtk/Config.in        | 22 ----------------------
 package/connman-gtk/connman-gtk.hash |  3 ---
 package/connman-gtk/connman-gtk.mk   | 17 -----------------
 5 files changed, 7 insertions(+), 43 deletions(-)
 delete mode 100644 package/connman-gtk/Config.in
 delete mode 100644 package/connman-gtk/connman-gtk.hash
 delete mode 100644 package/connman-gtk/connman-gtk.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 07d5034860..3473dbf010 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_CONNMAN_GTK
+	bool "connman-gtk"
+	select BR2_LEGACY
+	help
+	  connman-gtk has been removed as it was no longer maintained
+	  upstream.
+
 config BR2_PACKAGE_RPI_USERLAND
 	bool "rpi-userland has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 0ffdf5f4d6..f72b935d5a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2458,7 +2458,6 @@ endif
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
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
