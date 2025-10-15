Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2E5CCD195
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 19:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2330F60690;
	Wed, 15 Oct 2025 19:05:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id daVSaEeyZLg4; Wed, 15 Oct 2025 19:05:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF7C260648
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF7C260648;
	Wed, 15 Oct 2025 19:05:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4415E781
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 19:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A43483C04
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 19:05:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g-ZDhuIWkkt2 for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 19:05:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 981D18234F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 981D18234F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 981D18234F
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 19:05:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0643.dip0.t-ipconnect.de [91.58.6.67])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B258AA4C6CA1
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 21:05:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51144)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v96oJ-0000000006n-0m2j
 for buildroot@buildroot.org; Wed, 15 Oct 2025 19:05:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 15 Oct 2025 21:05:19 +0200
Message-ID: <20251015190519.1073379-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760555119;
 bh=tKo5Q7j3dp/2WUmoGnfrDZ82Y6b40JXYggDaIAgp+Ag=;
 h=From:To:Subject:Date:From;
 b=op5jwrdvgDkWJOo0PVwwe6KybAggL/ukQZtk7WUUbWUMRp1yqDjsdCd2eu+IRE2qB
 kJ0bo2JlEwRZba36tDCdZX3inGs5Lic1ZlybjzLyyRDaBzbHtNa9yuJXVzD4dHMGLH
 hOM/vUFlUZhK22FngDxO2mw0VIDa4AWokPq7FvEmkDMBo8h5lrlzYqEcXl1+ZpzAF/
 9xOuSpP6HLEENlp2YB/0kMslfus2oEAVZBPEJfm0vqj8V4EkvpIHzFzdbCbWGMrYx1
 BF5o8z+4HWBEktyAIX3DQ16LfMe9C9MyzaRE7hZVELl+vRLZsXG7pWO1ltPPw59DE3
 TtllmAkWIkS7Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=op5jwrdv
Subject: [Buildroot] [PATCH 1/1] package/lesstif: remove package
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

lesstif received its last release in 2009, the homepage was last
updated in 2013: https://lesstif.sourceforge.net

The last update on the project trackers was in 2015:
https://sourceforge.net/projects/lesstif/support

Debian removed lesstif in 2013:
https://wiki.debian.org/lesstif2motifTransition

The package is causing build errors since the default version of gcc was
bumped to 14.x with buildroot commit 1e1fafa1f0f5069418e92f702c2a66db6408a634:

CutPaste.c:1031:25: error: assignment to 'long int *' from incompatible
 pointer type 'char *' [-Wincompatible-pointer-types]

Instead of fixing an unmaintained package we remove it from buildroot,
no other package depends on it.

Fixes:
https://autobuild.buildroot.net/results/798/798ccab7b69754fb9b73b84e31d91bece8e7a2b4/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy             |  6 ++++++
 package/Config.in            |  1 -
 package/lesstif/Config.in    | 11 ----------
 package/lesstif/lesstif.hash |  3 ---
 package/lesstif/lesstif.mk   | 42 ------------------------------------
 5 files changed, 6 insertions(+), 57 deletions(-)
 delete mode 100644 package/lesstif/Config.in
 delete mode 100644 package/lesstif/lesstif.hash
 delete mode 100644 package/lesstif/lesstif.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index f3558c0f3a..ced3bab9c7 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_LESSTIF
+	bool "lesstif has been removed"
+	select BR2_LEGACY
+	help
+	  lesstif is unmaintained and has been removed
+
 config BR2_KERNEL_HEADERS_6_16
 	bool "kernel headers version 6.16.x are no longer supported"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index e9906b066e..1ae92409c4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1740,7 +1740,6 @@ menu "Graphics"
 	source "package/lcms2/Config.in"
 	source "package/lensfun/Config.in"
 	source "package/leptonica/Config.in"
-	source "package/lesstif/Config.in"
 	source "package/libart/Config.in"
 	source "package/libavif/Config.in"
 	source "package/libdecor/Config.in"
diff --git a/package/lesstif/Config.in b/package/lesstif/Config.in
deleted file mode 100644
index 654ee6f1a0..0000000000
--- a/package/lesstif/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_LESSTIF
-	bool "lesstif"
-	depends on BR2_USE_MMU # fork()
-	depends on BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_XLIB_LIBXT
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_FREETYPE
-	help
-	  lesstif is the Hungry Programmers' version of OSF/Motif
-
-	  http://lesstif.sourceforge.net/
diff --git a/package/lesstif/lesstif.hash b/package/lesstif/lesstif.hash
deleted file mode 100644
index 31a394dbbc..0000000000
--- a/package/lesstif/lesstif.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  eb4aa38858c29a4a3bcf605cfe7d91ca41f4522d78d770f69721e6e3a4ecf7e3  lesstif-0.95.2.tar.bz2
-sha256  94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  COPYING.LIB
diff --git a/package/lesstif/lesstif.mk b/package/lesstif/lesstif.mk
deleted file mode 100644
index 378c594e3b..0000000000
--- a/package/lesstif/lesstif.mk
+++ /dev/null
@@ -1,42 +0,0 @@
-################################################################################
-#
-# lesstif
-#
-################################################################################
-
-LESSTIF_VERSION = 0.95.2
-LESSTIF_SOURCE = lesstif-$(LESSTIF_VERSION).tar.bz2
-LESSTIF_SITE = http://downloads.sourceforge.net/project/lesstif/lesstif/$(LESSTIF_VERSION)
-LESSTIF_INSTALL_STAGING = YES
-LESSTIF_DEPENDENCIES = \
-	xlib_libXt \
-	xlib_libXext \
-	freetype
-LESSTIF_LICENSE = LGPL-2.0+
-LESSTIF_LICENSE_FILES = COPYING.LIB
-LESSTIF_CONF_OPTS = \
-	--with-gnu-ld \
-	--with-freetype-config=$(STAGING_DIR)/usr/bin/freetype-config \
-	--enable-production=yes \
-	--enable-build-tests=no \
-	--no-recursion
-
-# Reduces the buggy makefile to the smallest possible (and working) thing
-define LESSTIF_NOMAN2HTML
-	echo "all:" > $(@D)/doc/Makefile
-	echo "" >> $(@D)/doc/Makefile
-	echo "install:" >> $(@D)/doc/Makefile
-	echo "" >> $(@D)/doc/Makefile
-	echo "clean:" >> $(@D)/doc/Makefile
-endef
-
-# Prevents to copy ac_find_motif.m4 on target, it would else
-# be created at $(TARGET_DIR)/$(HOST_DIR)/share/aclocal/ac_find_motif.m4
-define LESSTIF_FIXACLOCAL
-	sed -i -e "/install-data-am: install-aclocalDATA/d" $(@D)/scripts/autoconf/Makefile
-endef
-
-LESSTIF_POST_CONFIGURE_HOOKS += LESSTIF_NOMAN2HTML
-LESSTIF_POST_CONFIGURE_HOOKS += LESSTIF_FIXACLOCAL
-
-$(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
