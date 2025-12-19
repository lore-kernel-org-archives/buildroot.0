Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A0DD78770
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 17:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02131612BB;
	Fri, 19 Dec 2025 17:53:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cMN7wJVTUGjX; Fri, 19 Dec 2025 17:53:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB148612C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766166794;
	bh=6EwN2H8hzctQ67M5FI+mfpaVj7tNU1FSIhNlFWCwYDk=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nSMRs4IkD12BG7vQo6b1lOIF5wX9ABcnylHiHMq2VMmizgGMWOfvQEGo1VSAMdqub
	 gr9pv01xfq5EbcFpDGVRYMaWVnHc7R07KIxy9PXJkDySF6olwcWwCuyzJJg0HdLqPS
	 8IQIaL9tLyJqw6WrUIsaMnay6PaphZ1jXAbze2HeRyDpSnGMZWoqO0evLxgFvCNYQX
	 nqOnvOynbIaNllILsoJY2rEyC+09wUAYyda1SfLv1+AhtSHh0etKRw4SVA+hw//yAl
	 tj7kHk0xZBhDVZ6hpzKM2EOn949q2bZZ7FFxjGp7zlMLQ3vDxBa9NxyzukWIegwrcf
	 yc+QfnYOG16vQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB148612C9;
	Fri, 19 Dec 2025 17:53:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 55EDD293
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 17:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C9CA4065D
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 17:53:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EUHRT-pPwhjL for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 17:53:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E8C024010A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8C024010A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E8C024010A
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 17:53:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a05d4.dip0.t-ipconnect.de [91.58.5.212])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9CE05A4C4ACD;
 Fri, 19 Dec 2025 18:52:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38748)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vWedr-000000002KQ-1d0e;
 Fri, 19 Dec 2025 17:51:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
	Simon Dawson <spdawson@gmail.com>
Date: Fri, 19 Dec 2025 18:51:37 +0100
Message-ID: <20251219175141.1907408-19-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251219175141.1907408-1-bernd@kuhls.net>
References: <20251219175141.1907408-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766166721;
 bh=IJN+0ybENo57eEhey9cYQdn8uM1jTh7lCvgCc2bYP7I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=mGxvZIRwDMbqRsNPfShaU0wCUgIA1LCBMVWN0jgwCGhAmEng0dlNFTUAppWp4uCek
 nPnrStWKEXCIfEMXwveW0dTWMz8F1Ga3/eJrQTKwC2lYtyXbjmPGtBI1DOXXf8hopT
 KjVYG72L3sZIEzTgnaarKHXkAam0ZxD/HE3zJ5ZiLG3H2APzrYVPc4GLobd3US8P6y
 znqHe2DgMjAWmj6rM/ZCW+Smh7Nar+LlqhOXzzSnAm6MAp2m8700UARfIq9h5lGfNi
 d1pvydp8SaHwECxvg5Ube7OyV2NW5rWfo/JgzFBAX+7N2vCCFR4r1pdflwwI0/y+VA
 bq3ueoYes9+cQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=mGxvZIRw
Subject: [Buildroot] [PATCH v4 18/20] package/libcuefile: remove package
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

Last release 2011: https://www.musepack.net/index.php?pg=src

The package is broken with cmake 4 and no other package depends on it.

Fixes:
https://autobuild.buildroot.net/results/b92211c11edcbf4a0c5abe823e0deaa14133ae89/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  1 -
 Config.in.legacy                              |  6 +++++
 package/Config.in                             |  1 -
 package/libcuefile/0001-fix-static-link.patch | 25 -----------------
 .../0002-libcuefile-fedora-c99.patch          | 27 -------------------
 package/libcuefile/Config.in                  |  6 -----
 package/libcuefile/libcuefile.hash            |  7 -----
 package/libcuefile/libcuefile.mk              | 25 -----------------
 8 files changed, 6 insertions(+), 92 deletions(-)
 delete mode 100644 package/libcuefile/0001-fix-static-link.patch
 delete mode 100644 package/libcuefile/0002-libcuefile-fedora-c99.patch
 delete mode 100644 package/libcuefile/Config.in
 delete mode 100644 package/libcuefile/libcuefile.hash
 delete mode 100644 package/libcuefile/libcuefile.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index ea3b7fa794..343aac6f0d 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -526,7 +526,6 @@ package/libb64/0002-Initialize-C++-objects.patch lib_patch.Upstream
 package/libcdaudio/0001-libcdaudio-enable-autoreconf.patch lib_patch.Upstream
 package/libcgicc/0001-disable-documentation-option.patch lib_patch.Sob lib_patch.Upstream
 package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch lib_patch.Upstream
-package/libcuefile/0001-fix-static-link.patch lib_patch.Upstream
 package/libdaemon/0001-testd-use-unistd-h-instead-of-sys-unistd-h.patch lib_patch.Upstream
 package/libdnet/0001-python-makefile.patch lib_patch.Upstream
 package/libdrm/0001-tests-meson.build-disable-nouveau-tests-for-static-b.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 5ac266436b..935faea7aa 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_LIBCUEFILE
+	bool "libcuefile has been removed"
+	select BR2_LEGACY
+	help
+	  libcuefile is unmaintained and has been removed
+
 config BR2_PACKAGE_MPD_MUSEPACK
 	bool "musepack support in mpd has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 568c4f0754..4c0225eb12 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1543,7 +1543,6 @@ menu "Audio/Sound"
 	source "package/libcdio-paranoia/Config.in"
 	source "package/libcodec2/Config.in"
 	source "package/libcue/Config.in"
-	source "package/libcuefile/Config.in"
 	source "package/libg7221/Config.in"
 	source "package/libgsm/Config.in"
 	source "package/libid3tag/Config.in"
diff --git a/package/libcuefile/0001-fix-static-link.patch b/package/libcuefile/0001-fix-static-link.patch
deleted file mode 100644
index 6eb58909fd..0000000000
--- a/package/libcuefile/0001-fix-static-link.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Fix static only build
-
-Make sure to build the shared library only if BUILD_SHARED_LIBS is
-ON. Normally, CMake takes care of this automatically, but libcuefile
-wants to build both the shared and static variants, so the normal
-logic of CMake doesn't apply.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/src/CMakeLists.txt
-===================================================================
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -4,7 +4,11 @@
- add_library(cuefile-static STATIC cd cdtext cue_parse cue_print cue_scan cuefile time toc toc_parse toc_print toc_scan)
- set_target_properties(cuefile-static PROPERTIES OUTPUT_NAME cuefile CLEAN_DIRECT_OUTPUT 1)
- 
-+if (BUILD_SHARED_LIBS)
- add_library(cuefile-shared SHARED cd cdtext cue_parse cue_print cue_scan cuefile time toc toc_parse toc_print toc_scan)
- set_target_properties(cuefile-shared PROPERTIES OUTPUT_NAME cuefile CLEAN_DIRECT_OUTPUT 1 VERSION 0.0.0 SOVERSION 0)
- 
- install(TARGETS cuefile-static cuefile-shared LIBRARY DESTINATION "lib${LIB_SUFFIX}" ARCHIVE DESTINATION "lib${LIB_SUFFIX}")
-+else (BUILD_SHARED_LIBS)
-+install(TARGETS cuefile-static LIBRARY DESTINATION "lib${LIB_SUFFIX}" ARCHIVE DESTINATION "lib${LIB_SUFFIX}")
-+endif (BUILD_SHARED_LIBS)
diff --git a/package/libcuefile/0002-libcuefile-fedora-c99.patch b/package/libcuefile/0002-libcuefile-fedora-c99.patch
deleted file mode 100644
index 3f76dd315c..0000000000
--- a/package/libcuefile/0002-libcuefile-fedora-c99.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 7dd8752f5aa2dccbaccb4c28a23f659df3bc0d19 Mon Sep 17 00:00:00 2001
-From: DJ Delorie <dj@redhat.com>
-Date: Thu, 27 Apr 2023 17:24:58 -0400
-Subject: [PATCH] Fix C99 compatibility issue
-
-Related to:
-
-  <https://fedoraproject.org/wiki/Changes/PortingToModernC>
-  <https://fedoraproject.org/wiki/Toolchain/PortingToModernC>
-
-See Also https://bugzilla.redhat.com/show_bug.cgi?id=2190307
-Signed-off-by: DJ Delorie <dj@redhat.com>
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Upstream: https://src.fedoraproject.org/rpms/libcuefile/blob/7dd8752f5aa2dccbaccb4c28a23f659df3bc0d19/f/libcuefile-fedora-c99.patch
----
-diff -rup a/src/cue_parse.c b/src/cue_parse.c
---- a/src/cue_parse.c	2011-06-18 07:28:43.000000000 -0400
-+++ b/src/cue_parse.c	2023-04-27 16:10:13.314263314 -0400
-@@ -1513,6 +1513,8 @@ void yyerror (char *s)
- 	fprintf(stderr, "%d: %s\n", cue_lineno, s);
- }
- 
-+void cue_delete_buffer(void);
-+
- Cd *cue_parse (FILE *fp)
- {
- 	cue_yyin = fp;
diff --git a/package/libcuefile/Config.in b/package/libcuefile/Config.in
deleted file mode 100644
index 416b3e1495..0000000000
--- a/package/libcuefile/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_LIBCUEFILE
-	bool "libcuefile"
-	help
-	  Cue File library from Musepack
-
-	  http://www.musepack.net/
diff --git a/package/libcuefile/libcuefile.hash b/package/libcuefile/libcuefile.hash
deleted file mode 100644
index 2f737af0dc..0000000000
--- a/package/libcuefile/libcuefile.hash
+++ /dev/null
@@ -1,7 +0,0 @@
-# From https://www.musepack.net/index.php?pg=src
-md5  1a6ac52e1080fd54f0f59372345f1e4e  libcuefile_r475.tar.gz
-# Calculated based on the hash above
-sha256  b681ca6772b3f64010d24de57361faecf426ee6182f5969fcf29b3f649133fe7  libcuefile_r475.tar.gz
-
-# Hash for license file:
-sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/libcuefile/libcuefile.mk b/package/libcuefile/libcuefile.mk
deleted file mode 100644
index 891c1eec37..0000000000
--- a/package/libcuefile/libcuefile.mk
+++ /dev/null
@@ -1,25 +0,0 @@
-################################################################################
-#
-# libcuefile
-#
-################################################################################
-
-LIBCUEFILE_VERSION = 475
-LIBCUEFILE_SITE = http://files.musepack.net/source
-LIBCUEFILE_SOURCE = libcuefile_r$(LIBCUEFILE_VERSION).tar.gz
-LIBCUEFILE_INSTALL_STAGING = YES
-LIBCUEFILE_LICENSE = GPL-2.0+
-LIBCUEFILE_LICENSE_FILES = COPYING
-
-define LIBCUEFILE_INSTALL_STAGING_INCLUDES
-	cp -r $(@D)/include $(STAGING_DIR)/usr
-endef
-
-define LIBCUEFILE_INSTALL_TARGET_INCLUDES
-	cp -r $(@D)/include $(TARGET_DIR)/usr
-endef
-
-LIBCUEFILE_POST_INSTALL_STAGING_HOOKS += LIBCUEFILE_INSTALL_STAGING_INCLUDES
-LIBCUEFILE_POST_INSTALL_TARGET_HOOKS += LIBCUEFILE_INSTALL_TARGET_INCLUDES
-
-$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
