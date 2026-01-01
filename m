Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32589EEB57D
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 11:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E50E480B28;
	Thu,  1 Jan 2026 11:36:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o38_h3syr4Al; Thu,  1 Jan 2026 11:36:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3CB880B2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767267395;
	bh=gxnsJQacD2r8xvED+3TFOfjU1tVIw0DY5zOnB9SBhtM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z+XxF4IQqbPOyxhbRfjNnwd6v1gVLjQq4aBnpJYgfOQecItwOEhTwVZ0cSC7MUge6
	 5OVxl7OnNNuBjKRPyYZyxVGO+YL1fo4JRkGdHVTTgI9LcwGGbmEBD7H1gpeNCPJ9a5
	 O2GLNpOGZRSYIbXbioekDEgVBLoepjpV+vyEbYE95/JRxNxhY35fcLslg5hnbv6tS1
	 Xz4geSXA4ne3Z/1renveRo7lA7K+Wxa2raylsGXhtegx52evBTYQ/ZBmq5OoPIezUq
	 fOd1yKy2XkqkJ1fl9vBs06iUdw49sRl8Il6Gd+jQN/3hYihAu1YMTmeMXDyC0kp44x
	 vjfMwKujirv5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3CB880B2C;
	Thu,  1 Jan 2026 11:36:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DA3619D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 11:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B74D406BB
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 11:36:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tdCCbwpEL416 for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 11:36:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 024684066F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 024684066F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 024684066F
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 11:36:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B9B10A4C305F
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 12:36:16 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38862)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbGyW-000000004G0-0P05
 for buildroot@buildroot.org; Thu, 01 Jan 2026 11:36:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  1 Jan 2026 12:36:16 +0100
Message-ID: <20260101113616.1893585-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260101113616.1893585-1-bernd@kuhls.net>
References: <20260101113616.1893585-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767267376;
 bh=L6OOcRGdxcY3rOLZDYLe5wJVGKynImqE71SlZTfMhNY=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=HwNqnqTdjUpc4mRdMdHjzLzFp6dWNHaXPXyxMAQTy6X5MLEufJ74eWpWesa2zKe4h
 yuJXCms/ejt0IlOZX7iXeX6DqEQPhR7wXZ/FFfC00ccQfyMsyJ4DRhL/qHUwQXnYWU
 emHbBps8fcZKPgx7EtNcSlhBVVJ0ne8sO09SMN600fjrFPywoAz4RLfamz3u89tb2V
 9yWc3ehfZ2PwFhFXqHZ1TR8TZu7JD++W9lNVQKjwueaCs6d4x9R562zg2Sh1MZhYmy
 5DSSU+nfgakAE4nkw41tNmQlsLhUF3+LBoVcVjq2p2p1LTwEom6Pno5g3dnUBN5GC0
 6zFwuA8WMIfVQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=HwNqnqTd
Subject: [Buildroot] [PATCH 2/2] package/cegui: bump version
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

Removed patches which are included in this release.

Updated dependencies and configure options due to upstream commits:
https://github.com/cegui/cegui/commit/36c0eaf629b46bdaa3448d20d46294cb0dbc6db5
https://github.com/cegui/cegui/commit/c9adaa03d67e2ba650e063dc7b60c63113ba6cf0
https://github.com/cegui/cegui/commit/20f5ac6658ce151e73772906cdb9be93603c5064

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0002-XMLParser.cpp-include-string.h.patch | 37 -------------------
 ...-of-xmlGetLastError-for-libxml2-2-12.patch | 29 ---------------
 package/cegui/cegui.hash                      |  2 +-
 package/cegui/cegui.mk                        | 29 +++++++--------
 4 files changed, 15 insertions(+), 82 deletions(-)
 delete mode 100644 package/cegui/0002-XMLParser.cpp-include-string.h.patch
 delete mode 100644 package/cegui/0003-Fix-return-type-of-xmlGetLastError-for-libxml2-2-12.patch

diff --git a/package/cegui/0002-XMLParser.cpp-include-string.h.patch b/package/cegui/0002-XMLParser.cpp-include-string.h.patch
deleted file mode 100644
index e117d6220d..0000000000
--- a/package/cegui/0002-XMLParser.cpp-include-string.h.patch
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
diff --git a/package/cegui/0003-Fix-return-type-of-xmlGetLastError-for-libxml2-2-12.patch b/package/cegui/0003-Fix-return-type-of-xmlGetLastError-for-libxml2-2-12.patch
deleted file mode 100644
index 9091062e28..0000000000
--- a/package/cegui/0003-Fix-return-type-of-xmlGetLastError-for-libxml2-2-12.patch
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
index 835658763e..9b2a1704b6 100644
--- a/package/cegui/cegui.mk
+++ b/package/cegui/cegui.mk
@@ -4,20 +4,19 @@
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
 	-DCEGUI_BUILD_IMAGECODEC_FREEIMAGE=OFF \
 	-DCEGUI_BUILD_RENDERER_IRRLICHT=OFF \
 	-DCEGUI_BUILD_RENDERER_OGRE=OFF \
 	-DCEGUI_BUILD_RENDERER_OPENGLES=OFF \
 	-DCEGUI_BUILD_XMLPARSER_XERCES=OFF \
 	-DCEGUI_USE_FRIBIDI=OFF \
-	-DCEGUI_SAMPLES_ENABLED=OFF \
 	-DCEGUI_BUILD_APPLICATION_TEMPLATES=OFF \
 	-DCEGUI_BUILD_PYTHON_MODULES_SWIG=OFF
 CEGUI_DEPENDENCIES = glm \
@@ -60,16 +59,16 @@ endif
 
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
@@ -79,18 +78,18 @@ else
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
 
 $(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
