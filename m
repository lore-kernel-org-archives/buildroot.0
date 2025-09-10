Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE93CCAC583
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 21:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F7AB6158F;
	Wed, 10 Sep 2025 21:33:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id acHgdKttWP4W; Wed, 10 Sep 2025 21:33:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FC0761573
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FC0761573;
	Wed, 10 Sep 2025 21:33:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CC08A234
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B268D843BA
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 30AGZAEJx97s for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 21:33:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 96C0B843B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96C0B843B4
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96C0B843B4
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D25D01A0D9B
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AAF73606D4
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 63DD7102F28AA; 
 Wed, 10 Sep 2025 23:33:20 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Sep 2025 23:32:19 +0200
Message-ID: <20250910213241.1529448-12-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757540000; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=EpQOGf9zJG1H9M990/5FgTUL6pqZcZS9wpFvyfh9AYc=;
 b=YMpfzQVfZfJDoUetzE1xKbQALH7KSro0HcgbS0J3T5wXa+QXC6uz8feYyFOwZDemRhHmu7
 c1I+1WxLsI0Wc7UxgYDOn0NtKyFXFEalPKrhNlH8BHN9x3poQx4YCBGTU9Z53W2TRLXaoj
 FgeIz0Uece6erFK/56KBWMv/2YdVJFfp8XGvIwVjmmQzmhR0tcyUWzcJunRWsoqFKEe78t
 9V1ixouP3FzIZvKccL7JFKdpuqIgBq6LQhHnjr0//vTxI/6G6SU0SKjrmy0C89S/ombp1T
 oa8GLCol3KV7W/4SGjKg+AlHOPc07OYRaml5nZKUOU0lqn6t+RQQOKiRiAdF6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=YMpfzQVf
Subject: [Buildroot] [PATCH 11/23] package/libsexy: remove package
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

libsexy requires libgtk2, which we're about to remove, so let's drop
libsexy.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy             |  7 +++++++
 package/Config.in            |  1 -
 package/libsexy/Config.in    | 11 -----------
 package/libsexy/libsexy.hash |  3 ---
 package/libsexy/libsexy.mk   | 14 --------------
 5 files changed, 7 insertions(+), 29 deletions(-)
 delete mode 100644 package/libsexy/Config.in
 delete mode 100644 package/libsexy/libsexy.hash
 delete mode 100644 package/libsexy/libsexy.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index f1f9dd2cfa..548e517b42 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_LIBSEXY
+	bool "libsexy has been removed"
+	select BR2_LEGACY
+	help
+	  The libsexy package has been removed, as libgtk2 has been
+	  removed as well.
+
 config BR2_PACKAGE_LIBGLADE
 	bool "libglade has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index d54c579b82..317030a44e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -419,7 +419,6 @@ comment "X applications"
 comment "X libraries and helper libraries"
 	depends on BR2_PACKAGE_XORG7
 
-	source "package/libsexy/Config.in"
 	source "package/x11r7/xkeyboard-config/Config.in"
 
 comment "X window managers"
diff --git a/package/libsexy/Config.in b/package/libsexy/Config.in
deleted file mode 100644
index a2a2cc820c..0000000000
--- a/package/libsexy/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_LIBSEXY
-	bool "libsexy"
-	depends on BR2_PACKAGE_LIBGTK2
-	select BR2_PACKAGE_LIBXML2
-	help
-	  libsexy is a collection of GTK+ widgets that extend the
-	  functionality of such standard widgets as GtkEntry and
-	  GtkLabel by subclassing them and working around the
-	  limitations of the widgets.
-
-	  https://blog.chipx86.com/tag/libsexy/
diff --git a/package/libsexy/libsexy.hash b/package/libsexy/libsexy.hash
deleted file mode 100644
index 6f47e8ba7c..0000000000
--- a/package/libsexy/libsexy.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  8c4101a8cda5fccbba85ba1a15f46f2cf75deaa8b3c525ce5b135b9e1a8fe49e  libsexy-0.1.11.tar.gz
-sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
diff --git a/package/libsexy/libsexy.mk b/package/libsexy/libsexy.mk
deleted file mode 100644
index b079264122..0000000000
--- a/package/libsexy/libsexy.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# libsexy
-#
-################################################################################
-
-LIBSEXY_VERSION = 0.1.11
-LIBSEXY_SITE = http://releases.chipx86.com/libsexy/libsexy
-LIBSEXY_DEPENDENCIES = libgtk2 libxml2
-LIBSEXY_INSTALL_STAGING = YES
-LIBSEXY_LICENSE = LGPL-2.1+
-LIBSEXY_LICENSE_FILES = COPYING
-
-$(eval $(autotools-package))
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
