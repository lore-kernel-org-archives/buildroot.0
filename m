Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56132D1266C
	for <buildroot@archiver.kernel.org>; Tue,  2 Dec 2025 19:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29C306136F;
	Tue,  2 Dec 2025 19:58:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vpqV_ZlhrWJb; Tue,  2 Dec 2025 19:58:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 792D360FE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764705532;
	bh=oqxxKIy6xASRwu3/0+wtuq32A7/iLivmcOPRpM7plb8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BgmMlvgo89jhaRuo6O+wFCwA4zZ3o/l3cvwThBJBx6tj+zgu3ef7YROX6ueUxE6q5
	 ShE1cwos+Ilnwri3KMTnPI3DTREC2X6SnH9RXRUiGbCR5Is5A7x0lJ6GxsWlW3MhF2
	 LZBuz6/iGrXstpzEG4vxSdk+lcftSNx6Nfet6xsFd6SD5T8JfWnFUVRUTzuA3ok4yM
	 ldnisb87vCpsCE61ZnqK7zYntRCxgPA3Cty568Ige27E8dhFGL87oJHAiSOl6xs6zt
	 tpaleeCMGjq6R/jcG79b8TM5ZgmR0SAAqEzfc/Z9m8py8ke9waohBm8xcI1wx/7uUA
	 LBN9oWbcaeH7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 792D360FE2;
	Tue,  2 Dec 2025 19:58:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 85810E7
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 19:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63D2440503
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 19:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mJ_JlzXz76KD for <buildroot@buildroot.org>;
 Tue,  2 Dec 2025 19:58:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1ED45400E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1ED45400E0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1ED45400E0
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 19:58:48 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B9159A4C2C81
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 20:58:45 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35078)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQWWK-000000007LQ-3ndO
 for buildroot@buildroot.org; Tue, 02 Dec 2025 19:58:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  2 Dec 2025 20:58:45 +0100
Message-ID: <20251202195845.1666460-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764705525;
 bh=/fbkznaJ5EIFmWwfzFq1NEOkCKEuz/ZPFH72bFvHkaA=;
 h=From:To:Subject:Date:From;
 b=jDGcmurGhGME86HaJ2EVellimE2DYvy0hpx1gbh8obV0HRbK3K5+4ZvQ53lcL5JEZ
 EvzgL9XYqYMBe/NYS1mNcNwsZXxqNzL0fo4/lHuFh1sBl/YSAAP5pkKdhU9/3OCBbm
 6vU0Hy+rEcOdFGXmBmtD3zpYTFw6a8TSEnz4Arga7Ov2g7BwlJ+Ts1DWwK3C90kTYu
 5LJBkVKrL9HtJUvdUBrYCo44juDfexPwAAwg8i1L9LWJ/ku0oavrPGiPleB2sppEev
 UErVlmR8R5n/pStx9u0IqYFwAu0QFeyFtZ+iHEMmXhLykKiGcThYA+ILIA/wWGJhmS
 63PBGjNBTlaXw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=jDGcmurG
Subject: [Buildroot] [PATCH/next 1/1] package/cegui: bump version
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

Added patch to fix build with cmake 4.

Removed patches which are included in this release.

Updated dependencies and configure options due to upstream commits:
https://github.com/cegui/cegui/commit/36c0eaf629b46bdaa3448d20d46294cb0dbc6db5
https://github.com/cegui/cegui/commit/c9adaa03d67e2ba650e063dc7b60c63113ba6cf0
https://github.com/cegui/cegui/commit/20f5ac6658ce151e73772906cdb9be93603c5064

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/cegui/0001-Fix-cmake-4-build.patch    | 28 ++++++++++++++
 .../0001-XMLParser.cpp-include-string.h.patch | 37 -------------------
 ...-of-xmlGetLastError-for-libxml2-2-12.patch | 29 ---------------
 package/cegui/cegui.hash                      |  2 +-
 package/cegui/cegui.mk                        | 29 +++++++--------
 5 files changed, 43 insertions(+), 82 deletions(-)
 create mode 100644 package/cegui/0001-Fix-cmake-4-build.patch
 delete mode 100644 package/cegui/0001-XMLParser.cpp-include-string.h.patch
 delete mode 100644 package/cegui/0002-Fix-return-type-of-xmlGetLastError-for-libxml2-2-12.patch

diff --git a/package/cegui/0001-Fix-cmake-4-build.patch b/package/cegui/0001-Fix-cmake-4-build.patch
new file mode 100644
index 0000000000..952b17e494
--- /dev/null
+++ b/package/cegui/0001-Fix-cmake-4-build.patch
@@ -0,0 +1,28 @@
+From 6c0e6d8ffb3c13cd7fb08c8ef217daf45eabdf99 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Tue, 2 Dec 2025 20:38:29 +0100
+Subject: [PATCH] Fix cmake 4 build
+
+Upstream: https://github.com/cegui/cegui/pull/1334
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 418931822..645ff6cf7 100755
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ ################################################################################
+ # Top-level CMakeLists.txt file for Crazy Eddie's GUI System
+ ################################################################################
+-cmake_minimum_required(VERSION 3.1)
++cmake_minimum_required(VERSION 3.5)
+ 
+ if (APPLE AND NOT CMAKE_OSX_ARCHITECTURES)
+     set( CMAKE_OSX_ARCHITECTURES ${CMAKE_HOST_SYSTEM_PROCESSOR} CACHE STRING "Build architectures for Mac OS X")
+-- 
+2.47.3
+
diff --git a/package/cegui/0001-XMLParser.cpp-include-string.h.patch b/package/cegui/0001-XMLParser.cpp-include-string.h.patch
deleted file mode 100644
index e117d6220d..0000000000
--- a/package/cegui/0001-XMLParser.cpp-include-string.h.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From b98ed87225fa3c0f156b0798ca5c285d8fa8fac1 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 15 Jun 2021 07:27:41 +0200
-Subject: [PATCH] XMLParser.cpp: include string.h
-
-Include string.h to avoid the following build failure:
-
-/home/buildroot/autobuild/run/instance-3/output-1/build/cegui-00b4e1fe174da53b7ed726ab5970ba51bd5b5ee0/cegui/src/XMLParserModules/RapidXML/XMLParser.cpp:73:5: error: 'memcpy' was not declared in this scope
-   73 |     memcpy(buf, source.getDataPtr(), size);
-      |     ^~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/1cb09e5f52435efc505c61707b2d5d2ee871524b
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: 628f7edf4b420f752f1965ea11e5e747e3ff93b0
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- cegui/src/XMLParserModules/RapidXML/XMLParser.cpp | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/cegui/src/XMLParserModules/RapidXML/XMLParser.cpp b/cegui/src/XMLParserModules/RapidXML/XMLParser.cpp
-index 810ea6bbf..59822fc80 100644
---- a/cegui/src/XMLParserModules/RapidXML/XMLParser.cpp
-+++ b/cegui/src/XMLParserModules/RapidXML/XMLParser.cpp
-@@ -38,6 +38,8 @@
- #include "CEGUI/Logger.h"
- #include "CEGUI/Exceptions.h"
- 
-+#include <string.h>
-+
- // Start of CEGUI namespace section
- namespace CEGUI
- {
--- 
-2.31.1
-
diff --git a/package/cegui/0002-Fix-return-type-of-xmlGetLastError-for-libxml2-2-12.patch b/package/cegui/0002-Fix-return-type-of-xmlGetLastError-for-libxml2-2-12.patch
deleted file mode 100644
index 9091062e28..0000000000
--- a/package/cegui/0002-Fix-return-type-of-xmlGetLastError-for-libxml2-2-12.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 285ba5a2c0c435ed865c6e86afe314a822fd1e3f Mon Sep 17 00:00:00 2001
-From: oreo639 <oreo6391@gmail.com>
-Date: Sun, 18 Feb 2024 14:16:21 -0800
-Subject: [PATCH] Fix return type of xmlGetLastError for libxml2 2.12
-
-https://gitlab.gnome.org/GNOME/libxml2/-/commit/45470611b047db78106dcb2fdbd4164163c15ab7
-
-Upstream: https://github.com/cegui/cegui/commit/285ba5a2c0c435ed865c6e86afe314a822fd1e3f
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- cegui/src/XMLParserModules/Libxml2/XMLParser.cpp | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/cegui/src/XMLParserModules/Libxml2/XMLParser.cpp b/cegui/src/XMLParserModules/Libxml2/XMLParser.cpp
-index 74a3dbddd..a408f9305 100644
---- a/cegui/src/XMLParserModules/Libxml2/XMLParser.cpp
-+++ b/cegui/src/XMLParserModules/Libxml2/XMLParser.cpp
-@@ -109,7 +109,11 @@ void LibxmlParser::parseXML(XMLHandler& handler,
- 
-     if (!doc)
-     {
-+#if LIBXML_VERSION >= 21200
-+        const xmlError* err = xmlGetLastError();
-+#else
-         xmlError* err = xmlGetLastError();
-+#endif
- 
-         throw GenericException(
-             String("xmlParseMemory failed in file: '") +
diff --git a/package/cegui/cegui.hash b/package/cegui/cegui.hash
index 131b248619..be0939148c 100644
--- a/package/cegui/cegui.hash
+++ b/package/cegui/cegui.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  5b6f9e209e8a29b2f30d6aef92efd125c8bedaab5be04b562208be51e5e7f04e  cegui-00b4e1fe174da53b7ed726ab5970ba51bd5b5ee0.tar.gz
+sha256  9460cbbe7fc3bb3cf6abfd7f5a9c5f135b20e9898400bd698a5fa0d0fe879865  cegui-e7a03afc70c6182a091ff31accb9d77c6bdf6f60.tar.gz
 sha256  cc869e2ece8ad039f6d7fd17259db4ea0ae0a502d02a1bb506c0168deb12e40d  COPYING
diff --git a/package/cegui/cegui.mk b/package/cegui/cegui.mk
index 2e56322374..6f3edf5826 100644
--- a/package/cegui/cegui.mk
+++ b/package/cegui/cegui.mk
@@ -4,19 +4,18 @@
 #
 ################################################################################
 
-CEGUI_VERSION = 00b4e1fe174da53b7ed726ab5970ba51bd5b5ee0
+CEGUI_VERSION = e7a03afc70c6182a091ff31accb9d77c6bdf6f60
 CEGUI_SITE = $(call github,cegui,cegui,$(CEGUI_VERSION))
 CEGUI_LICENSE = MIT
 CEGUI_LICENSE_FILES = COPYING
 CEGUI_INSTALL_STAGING = YES
 CEGUI_CONF_OPTS = \
-	-DCEGUI_HAS_MINIZIP_RESOURCE_PROVIDER=OFF \
+	-DCEGUI_BUILD_RESOURCE_PROVIDER_MINIZIP=OFF \
 	-DCEGUI_BUILD_RENDERER_IRRLICHT=OFF \
 	-DCEGUI_BUILD_RENDERER_OGRE=OFF \
 	-DCEGUI_BUILD_RENDERER_OPENGLES=OFF \
 	-DCEGUI_BUILD_XMLPARSER_XERCES=OFF \
 	-DCEGUI_USE_FRIBIDI=OFF \
-	-DCEGUI_SAMPLES_ENABLED=OFF \
 	-DCEGUI_BUILD_APPLICATION_TEMPLATES=OFF \
 	-DCEGUI_BUILD_PYTHON_MODULES_SWIG=OFF
 CEGUI_DEPENDENCIES = glm \
@@ -59,16 +58,16 @@ endif
 
 ifeq ($(BR2_PACKAGE_PCRE),y)
 CEGUI_DEPENDENCIES += pcre
-CEGUI_CONF_OPTS += -DCEGUI_HAS_PCRE_REGEX=ON
+CEGUI_CONF_OPTS += -DCEGUI_REGEX_MATCHER=PCRE
 else
-CEGUI_CONF_OPTS += -DCEGUI_HAS_PCRE_REGEX=OFF
+CEGUI_CONF_OPTS += -DCEGUI_REGEX_MATCHER=std
 endif
 
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 CEGUI_DEPENDENCIES += freetype
-CEGUI_CONF_OPTS += -DCEGUI_HAS_FREETYPE=ON
+CEGUI_CONF_OPTS += -DCEGUI_USE_FREETYPE=ON
 else
-CEGUI_CONF_OPTS += -DCEGUI_HAS_FREETYPE=OFF
+CEGUI_CONF_OPTS += -DCEGUI_USE_FREETYPE=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
@@ -78,18 +77,18 @@ else
 CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_LIBXML2=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_RAPIDXML),y)
-CEGUI_DEPENDENCIES += rapidxml
-CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_RAPIDXML=ON
+ifeq ($(BR2_PACKAGE_PUGIXML),y)
+CEGUI_DEPENDENCIES += pugixml
+CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_PUGIXML=ON
 else
-CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_RAPIDXML=OFF
+CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_PUGIXML=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_TINYXML),y)
-CEGUI_DEPENDENCIES += tinyxml
-CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_TINYXML=ON
+ifeq ($(BR2_PACKAGE_TINYXML2),y)
+CEGUI_DEPENDENCIES += tinyxml2
+CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_TINYXML2=ON
 else
-CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_TINYXML=OFF
+CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_TINYXML2=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBFREEIMAGE),y)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
