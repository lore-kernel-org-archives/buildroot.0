Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B20D9EA7944
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 21:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D39AC40D35;
	Wed,  4 Feb 2026 21:28:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Io09LSTiwsdv; Wed,  4 Feb 2026 21:28:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 497CF40C88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770240504;
	bh=g96mJ/0W/gtbDGLpN6oRmiiDlf1kGFy8UF5SOiFr2B0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HmdT07QFyPQ4ujHkAEiNTq/vYGAZ9vW2m9EJ28M0xKlrWcWs0dHWxyY7NntvBbRDE
	 W82bctYEpEOhrtzZ+rT07OInTovmMmQwHq01XF/Ryn0jZLoqFgzOS1C2QL0GCP3K6V
	 Tx0ayjdQ4enYqdbvT6kOs3BC3Ia8XR3M9Sq5poMTzGb+NM2sn9uX7CQIir9zB3rXzo
	 C/Bj1UoEPYhT/JfOklhLif6t4PMtCCmuUqtCgMyoHqOzbAig7QHbwXpYe/yuLbbcxw
	 A75T3BPkMG+yRQJA5hUkEJFk5ItepYRhP4/2gqLNwWNDVqfjduKMFYnhB2EvvpElvT
	 o4xL+Delftc5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 497CF40C88;
	Wed,  4 Feb 2026 21:28:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 65847173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 21:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45DB683641
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 21:28:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yHKvNnedRjcS for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 21:28:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7BF76834E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BF76834E8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7BF76834E8
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 21:28:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ed3.dip0.t-ipconnect.de [91.58.14.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C9925A4C21DB;
 Wed,  4 Feb 2026 22:28:16 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46980)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vnkQ4-0000000063l-2LVx;
 Wed, 04 Feb 2026 21:28:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  4 Feb 2026 22:28:16 +0100
Message-ID: <20260204212816.1493261-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770240496;
 bh=/28oosTelZzbVYkhyzedUx5wQ+yJaxwevDFDVkr3p0s=;
 h=From:To:Cc:Subject:Date:From;
 b=GD1sbh1QNtcW2RNCAWZhhF8zKdrsRAofuIrC+zK/52Q0BSsG+UTemNwEssdrd+nfc
 QxQ1DxyCWn06w3nZG5J4uK56DqGxumPl8WFlODm8jZKpx6rQn01/EeLC/uX3BIarsu
 ATz5dGhMtHUKo8buKoVnrsc1hUx/z9gakUW0rUMQKYRza6bPph72iW7bCsYW2G2rOj
 jWca5+rODvKV4n3f+smsBALUdDhceIc6Ge8RJ3p1jKDK4Yc4z/BU7LwEEFXF6UxXZl
 U5frXraUofMjZkJLg4pWDXermWCZFtDnD3nJEYk1YHu5Vgiu/8OvRTcAdlVCMB/GI3
 EbyeeJyMvYiNg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=GD1sbh1Q
Subject: [Buildroot] [PATCH 1/1] package/cegui: remove package
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
index 4539b19bbe..a8550d9a2c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_CEGUI
+	bool "cegui"
+	select BR2_LEGACY
+	help
+	  cegui was removed from Buildroot as it was insufficiently
+	  maintained. It can be re-added if someone volunteers to
+	  maintain it.
+
 config BR2_PACKAGE_DVDRW_TOOLS
 	bool "dvdrw-tools removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 6284bea7f4..3fc9056a33 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -334,7 +334,6 @@ comment "Graphic applications"
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
