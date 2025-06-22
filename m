Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E62DC7115C
	for <buildroot@archiver.kernel.org>; Sun, 22 Jun 2025 10:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E01CA40651;
	Sun, 22 Jun 2025 10:25:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rL6MEi0lryq0; Sun, 22 Jun 2025 10:25:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D618440602
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D618440602;
	Sun, 22 Jun 2025 10:25:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7ED0DC8
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 10:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68FE440406
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 10:25:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KPuB2nN97YAu for <buildroot@buildroot.org>;
 Sun, 22 Jun 2025 10:25:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2ECF44026E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2ECF44026E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2ECF44026E
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 10:25:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bd3.dip0.t-ipconnect.de [91.58.11.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D3711A4C2539;
 Sun, 22 Jun 2025 12:25:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40644)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uTHsj-000000000IJ-3eMM;
 Sun, 22 Jun 2025 10:25:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 22 Jun 2025 12:25:02 +0200
Message-Id: <20250622102502.3844586-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1750587902;
 bh=y5NMSbb3z9Q1J49FY2RrGHSQQzCaBNOfbttEIl9InRk=;
 h=From:To:Cc:Subject:Date:From;
 b=vQaG17UQ/49yRGDlFQ3K9LJwW4Rcs6E0GnmbkDygltFqCGGDFH9BKdYuL4092Q8TZ
 m8GH9+5Rm50W31vGtrcSqvS0uKOD1btSN1zl0SYsPC1Ra78j1iNLHoUU8fZzT9s06E
 /nYcnlXy+8eCJSsrm9WhGqEjJIkpVCRTHlU9Gu8YayAanD3s+FYcXUZTppjWWQNqlm
 DZWl53T6mabgnO74i6bWU2sfOWqEF2ZJRlm67Hima8JKCukHPGW0vjUhy5UHamrYgt
 StAQXW/xdNLhQEi3IaSQH839CviYzvdVL35m+tiBGR0FpEI+XlFl+wIju4XHf4tuSD
 FXI+5IyAyiESg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=vQaG17UQ
Subject: [Buildroot] [PATCH 1/1] package/exiv2: security bump version to
 0.28.5
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

Changelog: https://exiv2.org/whatsnew.html

Release notes of 0.28.0 with a long list of security-related fixes:
https://github.com/Exiv2/exiv2/issues/2406#issuecomment-1529139799

0.28.1 fixed CVE-2023-44398: https://github.com/Exiv2/exiv2/issues/2813

0.28.2 fixed CVE-2024-24826 & CVE-2024-25112:
https://github.com/Exiv2/exiv2/issues/2914

0.28.3 fixed CVE-2024-39695: https://github.com/Exiv2/exiv2/issues/3008

0.28.5 fixed CVE-2025-26623: https://github.com/Exiv2/exiv2/issues/3181

Please read https://github.com/Exiv2/exiv2/issues/2406 for the discussion
whether all of these CVEs are relevant and their status of backporting to
the 0.27.x branch.

Removed patch which is included in this release.

Switched to github helper due to upstream not providing tarballs anymore.

Added optional support for inih:
https://github.com/Exiv2/exiv2/commit/43c9ec0f5095d92e2dd748c6c0b6f7ae4e6c73bf
and brotli:
https://github.com/Exiv2/exiv2/commit/557a5cebd52ced79d11080089d8e2874126fb038
both introduced in the 0.28.x branch.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...dd-BUILD_WITH_STACK_PROTECTOR-option.patch | 54 -------------------
 package/exiv2/Config.in                       | 12 +++++
 package/exiv2/exiv2.hash                      |  2 +-
 package/exiv2/exiv2.mk                        | 19 +++++--
 4 files changed, 29 insertions(+), 58 deletions(-)
 delete mode 100644 package/exiv2/0001-add-BUILD_WITH_STACK_PROTECTOR-option.patch

diff --git a/package/exiv2/0001-add-BUILD_WITH_STACK_PROTECTOR-option.patch b/package/exiv2/0001-add-BUILD_WITH_STACK_PROTECTOR-option.patch
deleted file mode 100644
index 18684ebbfa..0000000000
--- a/package/exiv2/0001-add-BUILD_WITH_STACK_PROTECTOR-option.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 4bb57da5fb0bb0d7e747b9e325e9ec0876ffc1f9 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 31 Jul 2021 16:36:50 +0200
-Subject: [PATCH] add BUILD_WITH_STACK_PROTECTOR option
-
-Add BUILD_WITH_STACK_PROTECTOR to avoid the following build failure with
-toolchains that don't support stack-protector:
-
-/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/9.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: utils.cpp:(.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPcEEvT_S7_St20forward_iterator_tag[_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPcEEvT_S7_St20forward_iterator_tag]+0xd0): undefined reference to `__stack_chk_fail'
-
-Indeed, support for -fstack-protector-strong can't be detected through
-check_cxx_compiler_flag as some toolchains need to link with -lssp to
-enable SSP support
-
-Fixes:
- - http://autobuild.buildroot.org/results/ae4635899124c602c70d2b342a76f95c34aa4a3d
-
-Upstream: https://github.com/Exiv2/exiv2/commit/f31c0eba098889899d29b7b0da830aee2b62a7b8
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- CMakeLists.txt            | 1 +
- cmake/compilerFlags.cmake | 4 ++--
- 2 files changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 6f0da06a..0746ee14 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -47,6 +47,7 @@ mark_as_advanced(
-     EXIV2_TEAM_USE_SANITIZERS
- )
- 
-+option( BUILD_WITH_STACK_PROTECTOR    "Build with stack protector"                            ON )
- option( BUILD_WITH_CCACHE             "Use ccache to speed up compilations"                   OFF )
- option( BUILD_WITH_COVERAGE           "Add compiler flags to generate coverage stats"         OFF )
- 
-diff --git a/cmake/compilerFlags.cmake b/cmake/compilerFlags.cmake
-index 35faf501..0a646e50 100644
---- a/cmake/compilerFlags.cmake
-+++ b/cmake/compilerFlags.cmake
-@@ -33,8 +33,8 @@ if ( MINGW OR UNIX OR MSYS ) # MINGW, Linux, APPLE, CYGWIN
-             endif()
-             if(HAS_FCF_PROTECTION)
-                 add_compile_options(-fcf-protection)
--            endif()
--            if(HAS_FSTACK_PROTECTOR_STRONG)
-+              endif()
-+	    if(BUILD_WITH_STACK_PROTECTOR AND HAS_FSTACK_PROTECTOR_STRONG)
-                 add_compile_options(-fstack-protector-strong)
-             endif()
-         endif()
--- 
-2.31.1
-
diff --git a/package/exiv2/Config.in b/package/exiv2/Config.in
index 8407c25b41..c65e484b2e 100644
--- a/package/exiv2/Config.in
+++ b/package/exiv2/Config.in
@@ -20,6 +20,18 @@ config BR2_PACKAGE_EXIV2
 
 if BR2_PACKAGE_EXIV2
 
+config BR2_PACKAGE_EXIV2_BROTLI
+	bool "Brotli support"
+	select BR2_PACKAGE_BROTLI
+	help
+	  Build with Brotli support for JPEG XL
+
+config BR2_PACKAGE_EXIV2_INIH
+	bool "Inih support"
+	select BR2_PACKAGE_INIH
+	help
+	  Build with inih support
+
 config BR2_PACKAGE_EXIV2_PNG
 	bool "PNG image support"
 	select BR2_PACKAGE_ZLIB
diff --git a/package/exiv2/exiv2.hash b/package/exiv2/exiv2.hash
index c871277801..b0586880ac 100644
--- a/package/exiv2/exiv2.hash
+++ b/package/exiv2/exiv2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4c192483a1125dc59a3d70b30d30d32edace9e14adf52802d2f853abf72db8a6  exiv2-0.27.6-Source.tar.gz
+sha256  e1671f744e379a87ba0c984617406fdf8c0ad0c594e5122f525b2fb7c28d394d  exiv2-0.28.5.tar.gz
 sha256  a7ba75cb966aca374711e2af49e5f3aea6a4443a803440f5d93e73a5a1222f66  COPYING
diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
index 869f8e48dd..104df9a7e1 100644
--- a/package/exiv2/exiv2.mk
+++ b/package/exiv2/exiv2.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-EXIV2_VERSION = 0.27.6
-EXIV2_SOURCE = exiv2-$(EXIV2_VERSION)-Source.tar.gz
-EXIV2_SITE = https://github.com/Exiv2/exiv2/releases/download/v$(EXIV2_VERSION)
+EXIV2_VERSION = 0.28.5
+EXIV2_SITE = $(call github,Exiv2,exiv2,v$(EXIV2_VERSION))
 EXIV2_INSTALL_STAGING = YES
 EXIV2_LICENSE = GPL-2.0+
 EXIV2_LICENSE_FILES = COPYING
@@ -16,6 +15,20 @@ EXIV2_CONF_OPTS += \
 	-DBUILD_WITH_STACK_PROTECTOR=OFF \
 	-DEXIV2_BUILD_SAMPLES=OFF
 
+ifeq ($(BR2_PACKAGE_EXIV2_BROTLI),y)
+EXIV2_CONF_OPTS += -DEXIV2_ENABLE_BROTLI=ON
+EXIV2_DEPENDENCIES += brotli
+else
+EXIV2_CONF_OPTS += -DEXIV2_ENABLE_BROTLI=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_EXIV2_INIH),y)
+EXIV2_CONF_OPTS += -DEXIV2_ENABLE_INIH=ON
+EXIV2_DEPENDENCIES += inih
+else
+EXIV2_CONF_OPTS += -DEXIV2_ENABLE_INIH=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_EXIV2_LENSDATA),y)
 EXIV2_CONF_OPTS += -DEXIV2_ENABLE_LENSDATA=ON
 else
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
