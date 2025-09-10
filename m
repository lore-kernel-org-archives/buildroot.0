Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1508FCA0FED
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 21:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBB0F60D86;
	Wed, 10 Sep 2025 21:33:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FLJIgTdJtWmL; Wed, 10 Sep 2025 21:33:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 184C961116
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 184C961116;
	Wed, 10 Sep 2025 21:33:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 61D56234
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F91240103
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4wWSPlmgEI2d for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 21:33:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 569044080B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 569044080B
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 569044080B
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 4236EC6B3BC
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 17EDD606D4
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9E11C102F29D9; 
 Wed, 10 Sep 2025 23:33:16 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Sep 2025 23:32:15 +0200
Message-ID: <20250910213241.1529448-8-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757539996; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=J3/FZnknSicOuQLYqLsW3UvC5s06bv6mjSgWsBoAGfQ=;
 b=OS1CMby6J6Fzap+Di1zgYTDnNi+4Q6fun0GJZFc3FLkusqTuoHOb3hA9EWiNWYDCv8JYBX
 losUHh4Mm8tIUxDtCPxZeCoedObLaY1grs5kJy6/mZMph47hAgZmcpcsDg9Z7xz25XAOw0
 uPQ/fzJr5oP2YhVeVX/GEeodlS7obdH+kCxgUAT/kVrkgtfhNw6x7VdKTXTmHrbGtGLTmf
 5c34nV/kWrkSzaoR7hZhy14lSBet7byv0s8KrcNUMVx4/8Rr7hjASwRYeHZMlR1FMRAJ86
 5410ebEEgteXNUO5HQdY24JAl/RuTEb7z7OFOatBuiubRurTvMI/cSt8RA4LLg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=OS1CMby6
Subject: [Buildroot] [PATCH 07/23] package/leafpad: remove package
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

This package needs libgtk2, which we are about to remove.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy             |  7 +++++++
 package/Config.in            |  1 -
 package/leafpad/Config.in    |  7 -------
 package/leafpad/leafpad.hash |  4 ----
 package/leafpad/leafpad.mk   | 13 -------------
 5 files changed, 7 insertions(+), 25 deletions(-)
 delete mode 100644 package/leafpad/Config.in
 delete mode 100644 package/leafpad/leafpad.hash
 delete mode 100644 package/leafpad/leafpad.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index ea23ae1b2c..a30755e608 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_LEAFPAD
+	bool "leafpad has been removed"
+	select BR2_LEGACY
+	help
+	  The leafpad package has been removed, as libgtk2 has been
+	  removed as well.
+
 config BR2_PACKAGE_GTK2_ENGINES
 	bool "gtk2-engines has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index b2c1be89a0..4974c32a37 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -401,7 +401,6 @@ comment "X applications"
 	source "package/dillo/Config.in"
 	source "package/docker/Config.in"
 	source "package/feh/Config.in"
-	source "package/leafpad/Config.in"
 	source "package/mupdf/Config.in"
 	source "package/nodm/Config.in"
 	source "package/pcmanfm/Config.in"
diff --git a/package/leafpad/Config.in b/package/leafpad/Config.in
deleted file mode 100644
index a4408547cd..0000000000
--- a/package/leafpad/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_LEAFPAD
-	bool "leafpad"
-	depends on BR2_PACKAGE_LIBGTK2
-	help
-	  GTK+ based simple text editor
-
-	  http://savannah.nongnu.org/download/leafpad
diff --git a/package/leafpad/leafpad.hash b/package/leafpad/leafpad.hash
deleted file mode 100644
index 4f6e68f0a2..0000000000
--- a/package/leafpad/leafpad.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# Locally calculated after checking pgp signature
-sha256  07d3f712f4dbd0a33251fd1dee14e21afdc9f92090fc768c11ab0ac556adbe97  leafpad-0.8.19.tar.gz
-# Locally computed
-sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/leafpad/leafpad.mk b/package/leafpad/leafpad.mk
deleted file mode 100644
index 608fa37be4..0000000000
--- a/package/leafpad/leafpad.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# leafpad
-#
-################################################################################
-
-LEAFPAD_VERSION = 0.8.19
-LEAFPAD_SITE = http://savannah.nongnu.org/download/leafpad
-LEAFPAD_DEPENDENCIES = libgtk2 host-intltool
-LEAFPAD_LICENSE = GPL-2.0+
-LEAFPAD_LICENSE_FILES = COPYING
-
-$(eval $(autotools-package))
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
