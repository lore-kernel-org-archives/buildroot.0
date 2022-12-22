Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0E5C4332F
	for <buildroot@archiver.kernel.org>; Thu, 22 Dec 2022 22:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A801640546;
	Thu, 22 Dec 2022 22:18:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A801640546
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NxIm3H8pxLbe; Thu, 22 Dec 2022 22:18:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 507624046B;
	Thu, 22 Dec 2022 22:18:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 507624046B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9FF991BF357
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 22:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8726C8204C
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 22:18:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8726C8204C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WZGKhA-d3QVO for <buildroot@lists.busybox.net>;
 Thu, 22 Dec 2022 22:18:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D625981FAA
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D625981FAA
 for <buildroot@buildroot.org>; Thu, 22 Dec 2022 22:18:11 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so2326633wms.2
 for <buildroot@buildroot.org>; Thu, 22 Dec 2022 14:18:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L8ONnqqDQ9qX8ohRKQmX2wOlX2xvea6JfXCZm2d7M8s=;
 b=fnQpjXXd9Jyml8nsJeQhCTOAvaP9s4VxNpCcCbQPo6Qr4oHU/n++pCVW++BKwIN5Ym
 M1K+8ipJUYjA8BFoeKP/BEU2xX53SUevXSvZazWunNa3dPbD3tb4P3enNrptGbNlyJhw
 CbjlVhD0Yq3GcwqcElj4OnZYa6sZo9PtHfzYWB4rfc6vYrCm4qiQRj4Qa5K2MoesgeO9
 Jcwtfu9gcG5bXVEVI7Hs9f8PVP3IWDsNSBvtLvKp4YwwH0ghISqu4a1RiHrmbIvZCyQA
 3rwNMH28LdXsoXT6fMqMSs6oezyW7kS9VqHabDd2j18GDChMYZPhPRRMingWKkF2poHf
 HJNw==
X-Gm-Message-State: AFqh2ko7eq8GX9vqtb2xAydxd+4XMOH7EQHRdD1TWEciCgkXQzxL71lF
 no8l15jzWfwcsAwD+u8F3pncRjfa0rY=
X-Google-Smtp-Source: AMrXdXvJUaf8nA7mv59CV4JgQPp5ffFMhvBZ6SnceR6G6afTo8TtJLPIFC+6eyA0/eoRND6Qgp6K/w==
X-Received: by 2002:a05:600c:4e11:b0:3d3:4012:8da8 with SMTP id
 b17-20020a05600c4e1100b003d340128da8mr5330416wmq.40.1671747489694; 
 Thu, 22 Dec 2022 14:18:09 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 v26-20020a7bcb5a000000b003cf4eac8e80sm2726609wmj.23.2022.12.22.14.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 14:18:09 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 22 Dec 2022 23:18:02 +0100
Message-Id: <20221222221802.46607-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L8ONnqqDQ9qX8ohRKQmX2wOlX2xvea6JfXCZm2d7M8s=;
 b=BNdLh4VdB2PjUOaqQjlIbxMm+Qh7c9DZPLc6bwelKvIu6MaJx0+g1ije0uQJqS8nRz
 WoHoODH9F+AjgIEQOIaDAZzvo1BsKigo2Ln8GdGLxbiqO7Vhew0zKsHeSSfk2R/0jnGh
 sTxAjQZbVgYzPc5Ktl4FqsrQnY3IIJsUwC0+AL0xKbKBjNGQhBqk2jT9sB11jnm0c/uR
 NPLxqCieLC+MInmxFuHH4zOvOyckpI6G1k8oXaSnfkbEEm7mn8OmlIoTrWW+h/WVAhzr
 bHupK3CjgwYsQNc1wt8baq7tOXSU20kf1bJJHVxUK5REFJhQ00VzTj0jcO4ISFXraWKS
 ZvfQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BNdLh4Vd
Subject: [Buildroot] [PATCH 1/1] package/hiredis: bump to version 1.1.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Replace first patch
- Drop second and third patches (already in version)

https://github.com/redis/hiredis/blob/v1.1.0/CHANGELOG.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...1-CMakeLists.txt-do-not-force-SHARED.patch |  47 -----
 ...eLists.txt-respect-BUILD_SHARED_LIBS.patch | 171 ++++++++++++++++++
 ...-allow-building-without-a-C-compiler.patch |  57 ------
 .../0003-Explicitly-set-c99-in-CMake.patch    |  28 ---
 package/hiredis/hiredis.hash                  |   2 +-
 package/hiredis/hiredis.mk                    |   4 +-
 6 files changed, 174 insertions(+), 135 deletions(-)
 delete mode 100644 package/hiredis/0001-CMakeLists.txt-do-not-force-SHARED.patch
 create mode 100644 package/hiredis/0001-CMakeLists.txt-respect-BUILD_SHARED_LIBS.patch
 delete mode 100644 package/hiredis/0002-CMakeLists.txt-allow-building-without-a-C-compiler.patch
 delete mode 100644 package/hiredis/0003-Explicitly-set-c99-in-CMake.patch

diff --git a/package/hiredis/0001-CMakeLists.txt-do-not-force-SHARED.patch b/package/hiredis/0001-CMakeLists.txt-do-not-force-SHARED.patch
deleted file mode 100644
index b7fdb87910..0000000000
--- a/package/hiredis/0001-CMakeLists.txt-do-not-force-SHARED.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 0ce382c275b087e866517c003e565f8cc4855bdd Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 29 Aug 2020 23:19:26 +0200
-Subject: [PATCH] CMakeLists.txt: do not force SHARED
-
-Allow the user to build static libraries by removing SHARED from
-ADD_LIBRARY calls.
-
-Here is an extract of
-https://cmake.org/cmake/help/latest/command/add_library.html:
-
-"If no type is given explicitly the type is STATIC or SHARED based on
-whether the current value of the variable BUILD_SHARED_LIBS is ON."
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: probably not upstreamable as is because it will
-conflict with https://github.com/redis/hiredis/pull/851. So, this patch
-will probably have to be reworked for 1.0.x]
----
- CMakeLists.txt | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 1beccc6..fed79fd 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -40,7 +40,7 @@ IF(WIN32)
-     ADD_COMPILE_DEFINITIONS(_CRT_SECURE_NO_WARNINGS WIN32_LEAN_AND_MEAN)
- ENDIF()
- 
--ADD_LIBRARY(hiredis SHARED ${hiredis_sources})
-+ADD_LIBRARY(hiredis ${hiredis_sources})
- 
- SET_TARGET_PROPERTIES(hiredis
-     PROPERTIES WINDOWS_EXPORT_ALL_SYMBOLS TRUE
-@@ -97,7 +97,7 @@ IF(ENABLE_SSL)
-     FIND_PACKAGE(OpenSSL REQUIRED)
-     SET(hiredis_ssl_sources
-         ssl.c)
--    ADD_LIBRARY(hiredis_ssl SHARED
-+    ADD_LIBRARY(hiredis_ssl
-             ${hiredis_ssl_sources})
- 
-     IF (APPLE)
--- 
-2.28.0
-
diff --git a/package/hiredis/0001-CMakeLists.txt-respect-BUILD_SHARED_LIBS.patch b/package/hiredis/0001-CMakeLists.txt-respect-BUILD_SHARED_LIBS.patch
new file mode 100644
index 0000000000..38e9282041
--- /dev/null
+++ b/package/hiredis/0001-CMakeLists.txt-respect-BUILD_SHARED_LIBS.patch
@@ -0,0 +1,171 @@
+From 286ba29771611abfaf126527141cac1d406c7eaf Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 22 Dec 2022 23:00:56 +0100
+Subject: [PATCH] CMakeLists.txt: respect BUILD_SHARED_LIBS
+
+To allow building hiredis on toolchain without dynamic library support,
+respect standard cmake BUILD_SHARED_LIBS:
+https://cmake.org/cmake/help/latest/variable/BUILD_SHARED_LIBS.html
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/redis/hiredis/pull/1147]
+---
+ CMakeLists.txt | 70 ++++++++++++++++++++++++++++++++++----------------
+ 1 file changed, 48 insertions(+), 22 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 3d52d0c..66a1383 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,5 +1,6 @@
+ CMAKE_MINIMUM_REQUIRED(VERSION 3.0.0)
+ 
++OPTION(BUILD_SHARED_LIBS "Build shared libraries" ON)
+ OPTION(ENABLE_SSL "Build hiredis_ssl for SSL support" OFF)
+ OPTION(DISABLE_TESTS "If tests should be compiled or not" OFF)
+ OPTION(ENABLE_SSL_TESTS "Should we test SSL connections" OFF)
+@@ -44,35 +45,49 @@ IF(WIN32)
+     ADD_DEFINITIONS(-D_CRT_SECURE_NO_WARNINGS -DWIN32_LEAN_AND_MEAN)
+ ENDIF()
+ 
+-ADD_LIBRARY(hiredis SHARED ${hiredis_sources})
+ ADD_LIBRARY(hiredis_static STATIC ${hiredis_sources})
+-ADD_LIBRARY(hiredis::hiredis ALIAS hiredis)
+ ADD_LIBRARY(hiredis::hiredis_static ALIAS hiredis_static)
++SET(HIREDIS_DEFAULT_LIBRARY hiredis_static)
++SET(HIREDIS_TARGETS hiredis_static)
+ 
+ IF(NOT MSVC)
+     SET_TARGET_PROPERTIES(hiredis_static
+         PROPERTIES OUTPUT_NAME hiredis)
+ ENDIF()
+ 
+-SET_TARGET_PROPERTIES(hiredis
+-    PROPERTIES WINDOWS_EXPORT_ALL_SYMBOLS TRUE
+-    VERSION "${HIREDIS_SONAME}")
++IF(BUILD_SHARED_LIBS)
++    ADD_LIBRARY(hiredis SHARED ${hiredis_sources})
++    ADD_LIBRARY(hiredis::hiredis ALIAS hiredis)
++    SET(HIREDIS_DEFAULT_LIBRARY hiredis)
++    SET(HIREDIS_TARGETS ${HIREDIS_TARGETS} hiredis)
++    SET_TARGET_PROPERTIES(hiredis
++        PROPERTIES WINDOWS_EXPORT_ALL_SYMBOLS TRUE
++        VERSION "${HIREDIS_SONAME}")
++ENDIF()
+ IF(MSVC)
+     SET_TARGET_PROPERTIES(hiredis_static
+         PROPERTIES COMPILE_FLAGS /Z7)
+ ENDIF()
+ IF(WIN32 OR MINGW)
+-    TARGET_LINK_LIBRARIES(hiredis PUBLIC ws2_32 crypt32)
++    IF(BUILD_SHARED_LIBS)
++        TARGET_LINK_LIBRARIES(hiredis PUBLIC ws2_32 crypt32)
++    ENDIF()
+     TARGET_LINK_LIBRARIES(hiredis_static PUBLIC ws2_32 crypt32)
+ ELSEIF(CMAKE_SYSTEM_NAME MATCHES "FreeBSD")
+-    TARGET_LINK_LIBRARIES(hiredis PUBLIC m)
++    IF(BUILD_SHARED_LIBS)
++        TARGET_LINK_LIBRARIES(hiredis PUBLIC m)
++    ENDIF()
+     TARGET_LINK_LIBRARIES(hiredis_static PUBLIC m)
+ ELSEIF(CMAKE_SYSTEM_NAME MATCHES "SunOS")
+-    TARGET_LINK_LIBRARIES(hiredis PUBLIC socket)
++    IF(BUILD_SHARED_LIBS)
++        TARGET_LINK_LIBRARIES(hiredis PUBLIC socket)
++    ENDIF()
+     TARGET_LINK_LIBRARIES(hiredis_static PUBLIC socket)
+ ENDIF()
+ 
+-TARGET_INCLUDE_DIRECTORIES(hiredis PUBLIC $<INSTALL_INTERFACE:include> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>)
++IF(BUILD_SHARED_LIBS)
++    TARGET_INCLUDE_DIRECTORIES(hiredis PUBLIC $<INSTALL_INTERFACE:include> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>)
++ENDIF()
+ TARGET_INCLUDE_DIRECTORIES(hiredis_static PUBLIC $<INSTALL_INTERFACE:include> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>)
+ 
+ CONFIGURE_FILE(hiredis.pc.in hiredis.pc @ONLY)
+@@ -103,7 +118,7 @@ set(CPACK_RPM_PACKAGE_AUTOREQPROV ON)
+ 
+ include(CPack)
+ 
+-INSTALL(TARGETS hiredis hiredis_static
++INSTALL(TARGETS ${HIREDIS_TARGETS}
+     EXPORT hiredis-targets
+     RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
+     LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
+@@ -161,39 +176,50 @@ IF(ENABLE_SSL)
+     FIND_PACKAGE(OpenSSL REQUIRED)
+     SET(hiredis_ssl_sources
+         ssl.c)
+-    ADD_LIBRARY(hiredis_ssl SHARED
+-            ${hiredis_ssl_sources})
++
+     ADD_LIBRARY(hiredis_ssl_static STATIC
+             ${hiredis_ssl_sources})
++    SET(HIREDIS_SSL_DEFAULT_LIBRARY hiredis_ssl_static)
++    SET(HIREDIS_SSL_TARGETS hiredis_ssl_static)
++    IF(BUILD_SHARED_LIBS)
++        ADD_LIBRARY(hiredis_ssl SHARED
++            ${hiredis_ssl_sources})
++        SET(HIREDIS_SSL_DEFAULT_LIBRARY hiredis_ssl)
++        SET(HIREDIS_SSL_TARGETS ${HIREDIS_SSL_TARGETS} hiredis_ssl)
++    ENDIF()
+     IF(NOT MSVC)
+         SET_TARGET_PROPERTIES(hiredis_ssl_static
+             PROPERTIES OUTPUT_NAME hiredis_ssl)
+     ENDIF()
+ 
+-    IF (APPLE)
++    IF (APPLE AND BUILD_SHARED_LIBS)
+         SET_PROPERTY(TARGET hiredis_ssl PROPERTY LINK_FLAGS "-Wl,-undefined -Wl,dynamic_lookup")
+     ENDIF()
+ 
+-    SET_TARGET_PROPERTIES(hiredis_ssl
+-        PROPERTIES
+-        WINDOWS_EXPORT_ALL_SYMBOLS TRUE
+-        VERSION "${HIREDIS_SONAME}")
++    IF(BUILD_SHARED_LIBS)
++        SET_TARGET_PROPERTIES(hiredis_ssl
++            PROPERTIES
++            WINDOWS_EXPORT_ALL_SYMBOLS TRUE
++            VERSION "${HIREDIS_SONAME}")
++    ENDIF()
+     IF(MSVC)
+         SET_TARGET_PROPERTIES(hiredis_ssl_static
+             PROPERTIES COMPILE_FLAGS /Z7)
+     ENDIF()
+ 
+-    TARGET_INCLUDE_DIRECTORIES(hiredis_ssl PRIVATE "${OPENSSL_INCLUDE_DIR}")
+     TARGET_INCLUDE_DIRECTORIES(hiredis_ssl_static PRIVATE "${OPENSSL_INCLUDE_DIR}")
++    IF(BUILD_SHARED_LIBS)
++        TARGET_INCLUDE_DIRECTORIES(hiredis_ssl PRIVATE "${OPENSSL_INCLUDE_DIR}")
++        TARGET_LINK_LIBRARIES(hiredis_ssl PRIVATE ${OPENSSL_LIBRARIES})
++    ENDIF()
+ 
+-    TARGET_LINK_LIBRARIES(hiredis_ssl PRIVATE ${OPENSSL_LIBRARIES})
+     IF (WIN32 OR MINGW)
+         TARGET_LINK_LIBRARIES(hiredis_ssl PRIVATE hiredis)
+         TARGET_LINK_LIBRARIES(hiredis_ssl_static PUBLIC hiredis_static)
+     ENDIF()
+     CONFIGURE_FILE(hiredis_ssl.pc.in hiredis_ssl.pc @ONLY)
+ 
+-    INSTALL(TARGETS hiredis_ssl hiredis_ssl_static
++    INSTALL(TARGETS ${HIREDIS_SSL_TARGETS}
+         EXPORT hiredis_ssl-targets
+         RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
+         LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
+@@ -236,10 +262,10 @@ ENDIF()
+ IF(NOT DISABLE_TESTS)
+     ENABLE_TESTING()
+     ADD_EXECUTABLE(hiredis-test test.c)
+-    TARGET_LINK_LIBRARIES(hiredis-test hiredis)
++    TARGET_LINK_LIBRARIES(hiredis-test ${HIREDIS_DEFAULT_LIBRARY})
+     IF(ENABLE_SSL_TESTS)
+         ADD_DEFINITIONS(-DHIREDIS_TEST_SSL=1)
+-        TARGET_LINK_LIBRARIES(hiredis-test hiredis_ssl)
++        TARGET_LINK_LIBRARIES(hiredis-test ${HIREDIS_SSL_DEFAULT_LIBRARY})
+     ENDIF()
+     IF(ENABLE_ASYNC_TESTS)
+         ADD_DEFINITIONS(-DHIREDIS_TEST_ASYNC=1)
+-- 
+2.35.1
+
diff --git a/package/hiredis/0002-CMakeLists.txt-allow-building-without-a-C-compiler.patch b/package/hiredis/0002-CMakeLists.txt-allow-building-without-a-C-compiler.patch
deleted file mode 100644
index 08a9ef9854..0000000000
--- a/package/hiredis/0002-CMakeLists.txt-allow-building-without-a-C-compiler.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From bb4a8937411a9e6ac2e5c12c0e7eeaa7dab251ba Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 5 Sep 2020 12:54:21 +0200
-Subject: [PATCH] CMakeLists.txt: allow building without a C++ compiler
-
-Define hiredis as a C project (and use a single PROJECT statement) to
-avoid the following build failure if a C++ compiler is not found:
-
-CMake Error at CMakeLists.txt:3 (PROJECT):
-  The CMAKE_CXX_COMPILER:
-
-    /srv/storage/autobuild/run/instance-1/output-1/host/bin/arm-linux-g++
-
-  is not a full path to an existing compiler tool.
-
-  Tell CMake where to find the compiler by setting either the environment
-  variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full path
-  to the compiler, or to the compiler name if it is in the PATH.
-
-The only cpp source file is examples/example-qt.cpp which is never
-compiled with cmake buildsystem. This file is compiled only with the
-Makefile buildsystem so perhaps it should be removed. If it is added to
-the cmake buildsystem, a call to enable_language(CXX) will have to be
-added.
-
-Fixes:
- - http://autobuild.buildroot.org/results/830ec3398cd29b9fc5cde06a225ef531d7a9d850
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/redis/hiredis/pull/872]
----
- CMakeLists.txt | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 4cbd438..9d65b7f 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,6 +1,5 @@
- CMAKE_MINIMUM_REQUIRED(VERSION 3.4.0)
- INCLUDE(GNUInstallDirs)
--PROJECT(hiredis)
- 
- OPTION(ENABLE_SSL "Build hiredis_ssl for SSL support" OFF)
- OPTION(DISABLE_TESTS "If tests should be compiled or not" OFF)
-@@ -20,7 +19,7 @@ getVersionBit(HIREDIS_SONAME)
- SET(VERSION "${HIREDIS_MAJOR}.${HIREDIS_MINOR}.${HIREDIS_PATCH}")
- MESSAGE("Detected version: ${VERSION}")
- 
--PROJECT(hiredis VERSION "${VERSION}")
-+PROJECT(hiredis LANGUAGES "C" VERSION "${VERSION}")
- 
- # Hiredis requires C99
- SET(CMAKE_C_STANDARD 99)
--- 
-2.28.0
-
diff --git a/package/hiredis/0003-Explicitly-set-c99-in-CMake.patch b/package/hiredis/0003-Explicitly-set-c99-in-CMake.patch
deleted file mode 100644
index 7e6ef8bca4..0000000000
--- a/package/hiredis/0003-Explicitly-set-c99-in-CMake.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 13a35bdb64615e381c5e1151cdd4e78bba71a6db Mon Sep 17 00:00:00 2001
-From: michael-grunder <michael.grunder@gmail.com>
-Date: Fri, 28 Aug 2020 12:35:01 -0700
-Subject: [PATCH] Explicitly set c99 in CMake
-
-See #869
-
-[Retrieved from:
-https://github.com/redis/hiredis/commit/13a35bdb64615e381c5e1151cdd4e78bba71a6db]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- CMakeLists.txt | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 1beccc69a..4cbd438d7 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -22,6 +22,9 @@ MESSAGE("Detected version: ${VERSION}")
- 
- PROJECT(hiredis VERSION "${VERSION}")
- 
-+# Hiredis requires C99
-+SET(CMAKE_C_STANDARD 99)
-+
- SET(ENABLE_EXAMPLES OFF CACHE BOOL "Enable building hiredis examples")
- 
- SET(hiredis_sources
diff --git a/package/hiredis/hiredis.hash b/package/hiredis/hiredis.hash
index a45cf68f99..cdcbef1525 100644
--- a/package/hiredis/hiredis.hash
+++ b/package/hiredis/hiredis.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e0ab696e2f07deb4252dda45b703d09854e53b9703c7d52182ce5a22616c3819  hiredis-1.0.2.tar.gz
+sha256  fe6d21741ec7f3fc9df409d921f47dfc73a4d8ff64f4ac6f1d95f951bf7f53d6  hiredis-1.1.0.tar.gz
 sha256  dca05ce8fc87a8261783b4aed0deef8becc9350b6aa770bc714d0c1833b896eb  COPYING
diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
index 83f0268c2b..a5efb61acc 100644
--- a/package/hiredis/hiredis.mk
+++ b/package/hiredis/hiredis.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-HIREDIS_VERSION_MAJOR = 1.0
-HIREDIS_VERSION = $(HIREDIS_VERSION_MAJOR).2
+HIREDIS_VERSION_MAJOR = 1.1
+HIREDIS_VERSION = $(HIREDIS_VERSION_MAJOR).0
 HIREDIS_SITE = $(call github,redis,hiredis,v$(HIREDIS_VERSION))
 HIREDIS_LICENSE = BSD-3-Clause
 HIREDIS_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
