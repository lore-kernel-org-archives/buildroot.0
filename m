Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 906BAFC9EF8
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 11:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DDB580CBC;
	Sat,  7 Mar 2026 11:21:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Lu8bHFTNZJ7; Sat,  7 Mar 2026 11:21:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4589080CF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772882501;
	bh=Y8DjHfYWwhNc0s1IvRRgObtExISr51MgDMXhoQihJcE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dohaDp71bd5Q+agQmIlsvpTsSUwmh2hAFJfBbEd5K67ImURJTufzk5cIt3h3Yy7bf
	 yMXzS1kAj+KU8fYe45kPAqD1d9ctVjhz7eadNgVyOjL6+Zw3SymQtSgKlGKrbCaLkv
	 Zg6s8mRkzDYouqXL2g1ORMlNh/7D4PWx1lab0R3HM8aPOQkcZKI56XK56o+g5Oquqg
	 yvbfk8zd4xYE2QoCeS//0N92YfQ3DNbZl1gNFG1WlmYZ2gy/5phlgar1vTdK4Ly+gu
	 joGYb03LJCI919p6Mhh96CP0/1DPdGMlQZx5GitG5o+Gp3uDn5L1TsIc61b6RTs7AC
	 s84NSWn+Rd3rQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4589080CF8;
	Sat,  7 Mar 2026 11:21:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 117A5223
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 11:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB94B80AED
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 11:21:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cj5NN407hv8H for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 11:21:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A819E8423E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A819E8423E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A819E8423E
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 11:21:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc67.dip0.t-ipconnect.de [84.161.188.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 145BCA4C38F1
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 12:21:00 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51228)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vypiN-000000004DY-2oUA
 for buildroot@buildroot.org; Sat, 07 Mar 2026 11:20:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  7 Mar 2026 12:20:57 +0100
Message-ID: <20260307112057.31154-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260307112057.31154-1-bernd@kuhls.net>
References: <20260307112057.31154-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772882460;
 bh=/J6Cwm8PvgeAKw5OEUwmnNTGY3XLsBIJSq3oUcwC4UU=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=byuKGSpeJscPb8mcQXbnnd+TSadrzu+XSDipX9keU5/H6AFtBBiq41EIlFdi/oN5F
 5l6iyklEN65z4YUdCBIVOpbexUz7ESmN6LXlnz0tsmzp1v13TGh/BwgHlH2hR1AzOP
 +Ts0lcU4DS0GjNQJCEPBn9Ay24YNLOqAAWdp/hpFjMzjF6PSDrFg3k3Pa0BsLNJIsB
 qaOS22JSY84l6x1PoAfx4zm+i9IBbOcX56KA1dpzP2lZzzsF4WoFp/bHNyZdywrjh/
 tMmD9w0p56fqGL5NEAlwiVi1gTTzupMba3l0hK6rLMescpFSdRF2es+Qx6K6oyY95u
 0WRPf8CpQuZCw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=byuKGSpe
Subject: [Buildroot] [PATCH 4/4] package/cegui: remove package
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

The package has no buildroot maintainer and causes many build errors:
https://autobuild.buildroot.net/?reason=cegui%

We remove the package for now, no other package depends on it.

Fixes:
https://autobuild.buildroot.net/results/248/248fabed54239e3f4cfe68c3b964a2b6a52c9dd5/
and many more.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                           |  8 ++
 package/Config.in                          |  1 -
 package/cegui/0001-Fix-cmake-4-build.patch | 28 -------
 package/cegui/Config.in                    | 24 ------
 package/cegui/cegui.hash                   |  3 -
 package/cegui/cegui.mk                     | 95 ----------------------
 6 files changed, 8 insertions(+), 151 deletions(-)
 delete mode 100644 package/cegui/0001-Fix-cmake-4-build.patch
 delete mode 100644 package/cegui/Config.in
 delete mode 100644 package/cegui/cegui.hash
 delete mode 100644 package/cegui/cegui.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 2950a3153a..6df95d562a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2026.05"
 
+config BR2_PACKAGE_CEGUI
+	bool "cegui"
+	select BR2_LEGACY
+	help
+	  cegui was removed from Buildroot as it was insufficiently
+	  maintained. It can be re-added if someone volunteers to
+	  maintain it.
+
 config BR2_PACKAGE_SPHINXBASE
 	bool "sphinxbase removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 9c64ea5b9f..d18b2ba0fa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -333,7 +333,6 @@ comment "Graphic applications"
 	source "package/wmenu/Config.in"
 
 comment "Graphic libraries"
-	source "package/cegui/Config.in"
 	source "package/efl/Config.in"
 	source "package/fb-test-app/Config.in"
 	source "package/fbdump/Config.in"
diff --git a/package/cegui/0001-Fix-cmake-4-build.patch b/package/cegui/0001-Fix-cmake-4-build.patch
deleted file mode 100644
index 952b17e494..0000000000
--- a/package/cegui/0001-Fix-cmake-4-build.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 6c0e6d8ffb3c13cd7fb08c8ef217daf45eabdf99 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Tue, 2 Dec 2025 20:38:29 +0100
-Subject: [PATCH] Fix cmake 4 build
-
-Upstream: https://github.com/cegui/cegui/pull/1334
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 418931822..645ff6cf7 100755
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,7 +1,7 @@
- ################################################################################
- # Top-level CMakeLists.txt file for Crazy Eddie's GUI System
- ################################################################################
--cmake_minimum_required(VERSION 3.1)
-+cmake_minimum_required(VERSION 3.5)
- 
- if (APPLE AND NOT CMAKE_OSX_ARCHITECTURES)
-     set( CMAKE_OSX_ARCHITECTURES ${CMAKE_HOST_SYSTEM_PROCESSOR} CACHE STRING "Build architectures for Mac OS X")
--- 
-2.47.3
-
diff --git a/package/cegui/Config.in b/package/cegui/Config.in
deleted file mode 100644
index 20b865835b..0000000000
--- a/package/cegui/Config.in
+++ /dev/null
@@ -1,24 +0,0 @@
-comment "cegui needs a toolchain w/ C++, threads, dynamic library, wchar, gcc >= 5"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
-			|| BR2_STATIC_LIBS || !BR2_USE_WCHAR \
-			|| !BR2_TOOLCHAIN_GCC_AT_LEAST_5
-
-config BR2_PACKAGE_CEGUI
-	bool "cegui"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++11 PR59987
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_USE_WCHAR
-	select BR2_PACKAGE_GLM
-	select BR2_PACKAGE_LIBGLFW if BR2_PACKAGE_HAS_LIBGL # SampleBrowser dependency
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	help
-	  Crazy Eddie's GUI System is a free library providing windowing
-	  and widgets for graphics APIs / engines where such
-	  functionality is not natively available, or severely lacking.
-	  The library is object orientated, written in C++, and targeted
-	  at games developers who should be spending their time creating
-	  great games, not building GUI sub-systems!
-
-	  http://www.cegui.org.uk/
diff --git a/package/cegui/cegui.hash b/package/cegui/cegui.hash
deleted file mode 100644
index be0939148c..0000000000
--- a/package/cegui/cegui.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  9460cbbe7fc3bb3cf6abfd7f5a9c5f135b20e9898400bd698a5fa0d0fe879865  cegui-e7a03afc70c6182a091ff31accb9d77c6bdf6f60.tar.gz
-sha256  cc869e2ece8ad039f6d7fd17259db4ea0ae0a502d02a1bb506c0168deb12e40d  COPYING
diff --git a/package/cegui/cegui.mk b/package/cegui/cegui.mk
deleted file mode 100644
index 9b2a1704b6..0000000000
--- a/package/cegui/cegui.mk
+++ /dev/null
@@ -1,95 +0,0 @@
-################################################################################
-#
-# cegui
-#
-################################################################################
-
-CEGUI_VERSION = e7a03afc70c6182a091ff31accb9d77c6bdf6f60
-CEGUI_SITE = $(call github,cegui,cegui,$(CEGUI_VERSION))
-CEGUI_LICENSE = MIT
-CEGUI_LICENSE_FILES = COPYING
-CEGUI_INSTALL_STAGING = YES
-CEGUI_CONF_OPTS = \
-	-DCEGUI_BUILD_RESOURCE_PROVIDER_MINIZIP=OFF \
-	-DCEGUI_BUILD_IMAGECODEC_FREEIMAGE=OFF \
-	-DCEGUI_BUILD_RENDERER_IRRLICHT=OFF \
-	-DCEGUI_BUILD_RENDERER_OGRE=OFF \
-	-DCEGUI_BUILD_RENDERER_OPENGLES=OFF \
-	-DCEGUI_BUILD_XMLPARSER_XERCES=OFF \
-	-DCEGUI_USE_FRIBIDI=OFF \
-	-DCEGUI_BUILD_APPLICATION_TEMPLATES=OFF \
-	-DCEGUI_BUILD_PYTHON_MODULES_SWIG=OFF
-CEGUI_DEPENDENCIES = glm \
-	$(if $(BR2_PACKAGE_LIBGLFW),libglfw) \
-	$(if $(BR2_PACKAGE_HAS_LIBGL),libgl) \
-	$(if $(BR2_PACKAGE_HAS_LIBGLES),libgles) \
-	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
-
-# libepoxy support cannot be enabled together with libglew
-ifeq ($(BR2_PACKAGE_LIBGLEW)$(BR2_PACKAGE_LIBGLU),yy)
-CEGUI_DEPENDENCIES += libglew libglu
-CEGUI_CONF_OPTS += -DCEGUI_USE_GLEW=ON -DCEGUI_USE_EPOXY=OFF \
-	-DCEGUI_BUILD_RENDERER_OPENGL=ON \
-	-DCEGUI_BUILD_RENDERER_OPENGL3=ON
-else ifeq ($(BR2_PACKAGE_LIBEPOXY),y)
-CEGUI_DEPENDENCIES += libepoxy
-# old OpenGL renderer module is only supported using GLEW
-CEGUI_CONF_OPTS += -DCEGUI_USE_EPOXY=ON -DCEGUI_USE_GLEW=OFF \
-	-DCEGUI_BUILD_RENDERER_OPENGL=OFF \
-	-DCEGUI_BUILD_RENDERER_OPENGL3=ON
-else
-CEGUI_CONF_OPTS += -DCEGUI_USE_EPOXY=OFF -DCEGUI_USE_GLEW=OFF \
-	-DCEGUI_BUILD_RENDERER_OPENGL=OFF \
-	-DCEGUI_BUILD_RENDERER_OPENGL3=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_EXPAT),y)
-CEGUI_DEPENDENCIES += expat
-CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_EXPAT=ON
-else
-CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_EXPAT=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_SDL2)$(BR2_PACKAGE_SDL2_IMAGE),yy)
-CEGUI_DEPENDENCIES += sdl2 sdl2_image
-CEGUI_CONF_OPTS += -DCEGUI_BUILD_IMAGECODEC_SDL2=ON
-else
-CEGUI_CONF_OPTS += -DCEGUI_BUILD_IMAGECODEC_SDL2=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_PCRE),y)
-CEGUI_DEPENDENCIES += pcre
-CEGUI_CONF_OPTS += -DCEGUI_REGEX_MATCHER=PCRE
-else
-CEGUI_CONF_OPTS += -DCEGUI_REGEX_MATCHER=std
-endif
-
-ifeq ($(BR2_PACKAGE_FREETYPE),y)
-CEGUI_DEPENDENCIES += freetype
-CEGUI_CONF_OPTS += -DCEGUI_USE_FREETYPE=ON
-else
-CEGUI_CONF_OPTS += -DCEGUI_USE_FREETYPE=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_LIBXML2),y)
-CEGUI_DEPENDENCIES += libxml2
-CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_LIBXML2=ON
-else
-CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_LIBXML2=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_PUGIXML),y)
-CEGUI_DEPENDENCIES += pugixml
-CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_PUGIXML=ON
-else
-CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_PUGIXML=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_TINYXML2),y)
-CEGUI_DEPENDENCIES += tinyxml2
-CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_TINYXML2=ON
-else
-CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_TINYXML2=OFF
-endif
-
-$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
