Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F4FC4332F
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 23:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E135D60A47;
	Mon, 14 Nov 2022 23:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E135D60A47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bgj4P9JC4PBD; Mon, 14 Nov 2022 23:23:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D979660746;
	Mon, 14 Nov 2022 23:23:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D979660746
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 56E401BF284
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 23:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31D6540127
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 23:23:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31D6540127
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ScgGseBe1GBx for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 23:23:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF4AB40120
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF4AB40120
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 23:23:00 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id l6so6578948ilq.3
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 15:23:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cR92mxELo7WO/r9KxnDFZ+DkZOyMh8c9XJoBgMK+rkY=;
 b=V1UWH5dgfX86QHbHpow2ddbb2/fEt8LuwrkoOrS4gWdL8SK9I151oVuCtfidzOU+iA
 Sac+UcEcZodAI8uwceejDoBOPedTRdiiOarMhk6xc4ElNr3pB7La+AGnk1EgVSyY6pJ4
 M4MnLkVN0787WLgpoEbgxARc4165oGyDvSUvP2QDenlqNYg7snZbTIPWXeZKe/hUSiPo
 V/3CIKSJ9rkfEm/G0J1ODlKzxeaaXSEKl3qqKr+3nMToD/StN/q7rqrI79s/3CWILkx9
 MqOPQJgHi+yd27C8+UQO/VIE2DbnvHMGtLRp5Ip5OXlSKctT4fx03ILkNV2t8C5jVTox
 IaPg==
X-Gm-Message-State: ANoB5pkUAlPqnuMwCr3+WWIcOx00yyE0O8yIVGL+F3SuTxH2GZ8ztanw
 bKP+TSUQAB1mSiWCSRENo2F1Djvf1ZYCaA==
X-Google-Smtp-Source: AA0mqf642oxyLkGq7dy5gRP5RyH8eXHU5bFhYiBkdgisnDRnR1DjiEIpg3krjqNPG87qESYZqxWzwQ==
X-Received: by 2002:a05:6e02:eec:b0:300:e393:34c3 with SMTP id
 j12-20020a056e020eec00b00300e39334c3mr6966374ilk.112.1668468179265; 
 Mon, 14 Nov 2022 15:22:59 -0800 (PST)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 w42-20020a05663837aa00b00375750e03fesm4051256jal.81.2022.11.14.15.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 15:22:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 14 Nov 2022 16:22:53 -0700
Message-Id: <20221114232254.3970611-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cR92mxELo7WO/r9KxnDFZ+DkZOyMh8c9XJoBgMK+rkY=;
 b=N5cXMhUg508Sz2XD84CVlvkdFNO8IrOA3KerUEFn1JNfnDkvVveD7WhE76ZUA97VuW
 XZ1gCA6oULtQIbyX1yNVfkbj7D9Dfi0yk0Fbv2L3AkdmW5eB3LCdEBpqWCadN3Hc3m4Z
 xpoFIxb+w9l2pofujtdZpZFE2/FxHAzE6BXXuLL/UYf9w3C7SuXaqX1B6FNZWJl0Xz7k
 87afAKpllRslQ8OBk9zQvgRICyNRhiMirxZppkSIXmM8KocizWZ3sRmXi+Yg9HY6NaUW
 DYINGlzVuirD0hbODVcdTpaxxxCDVfxSMpkyFJJTPL0MX1QHOivyV9gkjdSo/sG/NNtA
 LEyg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=N5cXMhUg
Subject: [Buildroot] [PATCH v2 1/2] package/zxing-cpp: bump to version 1.4.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patches which are no longer required.

Verified license remains Apache-2.0 after hash change.

Rework config options for 1.4.0.

Add new host-pkgconf and stb build dependency.

Drop optional libiconv dependency which is no longer used.

Add optional python module support.

Add optional qt5 support.

Add optional opencv4 support.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - fix makefile pybind check
  - add comment for qt5 required config
---
 ...bs-private-not-exported-to-the-users.patch | 43 -----------------
 ...akeLists-txt-add-BUILD_OPENCV-option.patch | 39 ---------------
 package/zxing-cpp/Config.in                   |  2 +
 package/zxing-cpp/zxing-cpp.hash              |  4 +-
 package/zxing-cpp/zxing-cpp.mk                | 48 +++++++++++++++----
 5 files changed, 42 insertions(+), 94 deletions(-)
 delete mode 100644 package/zxing-cpp/0001-Link-library-with-OpenCV-make-libs-private-not-exported-to-the-users.patch
 delete mode 100644 package/zxing-cpp/0002-CMakeLists-txt-add-BUILD_OPENCV-option.patch

diff --git a/package/zxing-cpp/0001-Link-library-with-OpenCV-make-libs-private-not-exported-to-the-users.patch b/package/zxing-cpp/0001-Link-library-with-OpenCV-make-libs-private-not-exported-to-the-users.patch
deleted file mode 100644
index 90b2320384..0000000000
--- a/package/zxing-cpp/0001-Link-library-with-OpenCV-make-libs-private-not-exported-to-the-users.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 9e5dfa57f3b998bc3049bfa893b20e81dea656df Mon Sep 17 00:00:00 2001
-From: Yuri <yuri@rawbw.com>
-Date: Sat, 20 Apr 2019 07:28:26 -0700
-Subject: [PATCH] Link library with OpenCV, not only the executable, make libs
- PRIVATE.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/glassechidna/zxing-cpp/pull/86]
----
- CMakeLists.txt | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 738f4e1..efe3aee 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -60,10 +60,12 @@ include_directories(core/src)
- add_library(libzxing ${LIBZXING_FILES})
- set_target_properties(libzxing PROPERTIES PREFIX "")
- 
-+set(libzxing_LIBS "")
-+
- find_package(Iconv)
- if(ICONV_FOUND)
-     include_directories(${ICONV_INCLUDE_DIR})
--    target_link_libraries(libzxing ${ICONV_LIBRARIES})
-+    set(libzxing_LIBS ${libzxing_LIBS} ${ICONV_LIBRARIES})
- else()
-     add_definitions(-DNO_ICONV=1)
- endif()
-@@ -75,9 +77,12 @@ if(OpenCV_FOUND)
-         "./opencv-cli/src/*.h"
-     )
-     add_executable(zxing-cv ${OPENCV_ZXING_FILES})
-+    set(libzxing_LIBS ${libzxing_LIBS} ${OpenCV_LIBRARIES})
-     target_link_libraries(zxing-cv libzxing ${OpenCV_LIBRARIES})
- endif()
- 
-+target_link_libraries(libzxing PRIVATE ${libzxing_LIBS})
-+
- # Add cli executable.
- file(GLOB_RECURSE ZXING_FILES
-     "./cli/src/*.cpp"
diff --git a/package/zxing-cpp/0002-CMakeLists-txt-add-BUILD_OPENCV-option.patch b/package/zxing-cpp/0002-CMakeLists-txt-add-BUILD_OPENCV-option.patch
deleted file mode 100644
index 31753d7c24..0000000000
--- a/package/zxing-cpp/0002-CMakeLists-txt-add-BUILD_OPENCV-option.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From fe740316af970f57ec511cdeafb512510e4842a9 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 9 Nov 2019 17:21:13 +0100
-Subject: [PATCH] CMakeLists.txt: add BUILD_OPENCV option
-
-Add BUILD_OPENCV option to allow the user to disable OpenCV. It is
-especially useful as opencv library can be built without highgui support
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/glassechidna/zxing-cpp/pull/90]
----
- CMakeLists.txt | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 738f4e1..12913cd 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -3,6 +3,7 @@ cmake_minimum_required(VERSION 3.0)
- project(zxing)
- 
- option(BUILD_TESTING "Enable generation of test targets" OFF)
-+option(BUILD_OPENCV "Enable OpenCV classes and OpenCV cli executable" ON)
- 
- set(CMAKE_LIBRARY_PATH /opt/local/lib ${CMAKE_LIBRARY_PATH})
- 
-@@ -44,8 +45,10 @@ else()
-     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
- endif()
- 
--# OpenCV classes
--find_package(OpenCV)
-+if (BUILD_OPENCV)
-+    # OpenCV classes
-+    find_package(OpenCV)
-+endif()
- if(OpenCV_FOUND)
-     list(APPEND LIBZXING_FILES
-         opencv/src/zxing/MatSource.cpp
diff --git a/package/zxing-cpp/Config.in b/package/zxing-cpp/Config.in
index c1109219a0..6c17565d2a 100644
--- a/package/zxing-cpp/Config.in
+++ b/package/zxing-cpp/Config.in
@@ -5,6 +5,8 @@ config BR2_PACKAGE_ZXING_CPP
 	bool "zxing-cpp"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_STB
+	select BR2_PACKAGE_PYTHON_PYBIND if BR2_PACKAGE_PYTHON3
 	help
 	  ZXing-cpp (pronounced "zebra crossing") is an open-source,
 	  multi-format 1D/2D barcode image processing library
diff --git a/package/zxing-cpp/zxing-cpp.hash b/package/zxing-cpp/zxing-cpp.hash
index cabe3e70d4..5457ede44a 100644
--- a/package/zxing-cpp/zxing-cpp.hash
+++ b/package/zxing-cpp/zxing-cpp.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  4c2b8601d0e3377143c1a0bbab220146af9fa5a5e29e8fbef42862fe3d38f8e6  zxing-cpp-e0e40ddec63f38405aca5c8c1ff60b85ec8b1f10.tar.gz
+sha256  126767bb56f8a1f25ae84d233db2e9b9be50d71f5776092d0e170ca0f0ed1862  zxing-cpp-1.4.0.tar.gz
 
 # License files
-sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  COPYING
+sha256  c6596eb7be8581c18be736c846fb9173b69eccf6ef94c5135893ec56bd92ba08  LICENSE
diff --git a/package/zxing-cpp/zxing-cpp.mk b/package/zxing-cpp/zxing-cpp.mk
index e9c80b4453..272397c22e 100644
--- a/package/zxing-cpp/zxing-cpp.mk
+++ b/package/zxing-cpp/zxing-cpp.mk
@@ -4,23 +4,51 @@
 #
 ################################################################################
 
-ZXING_CPP_VERSION = e0e40ddec63f38405aca5c8c1ff60b85ec8b1f10
-ZXING_CPP_SITE = $(call github,glassechidna,zxing-cpp,$(ZXING_CPP_VERSION))
+ZXING_CPP_VERSION = 1.4.0
+ZXING_CPP_SITE = $(call github,zxing-cpp,zxing-cpp,v$(ZXING_CPP_VERSION))
 ZXING_CPP_LICENSE = Apache-2.0
-ZXING_CPP_LICENSE_FILES = COPYING
+ZXING_CPP_LICENSE_FILES = LICENSE
 ZXING_CPP_INSTALL_STAGING = YES
 ZXING_CPP_SUPPORTS_IN_SOURCE_BUILD = NO
-ZXING_CPP_CONF_OPTS = -DBUILD_TESTING=OFF
+ZXING_CPP_DEPENDENCIES = host-pkgconf stb
+ZXING_CPP_CONF_OPTS = \
+	-DBUILD_READERS=ON \
+	-DBUILD_WRITERS=ON \
+	-DBUILD_EXAMPLES=ON \
+	-DBUILD_BLACKBOX_TESTS=OFF \
+	-DBUILD_UNIT_TESTS=OFF \
+	-DBUILD_DEPENDENCIES=LOCAL
 
-ifeq ($(BR2_PACKAGE_LIBICONV),y)
-ZXING_CPP_DEPENDENCIES += libiconv
+ifeq ($(BR2_PACKAGE_OPENCV3_LIB_HIGHGUI)$(BR2_PACKAGE_OPENCV4_LIB_HIGHGUI),y)
+ifeq ($(BR2_PACKAGE_OPENCV3),y)
+ZXING_CPP_DEPENDENCIES += opencv3
+endif
+ifeq ($(BR2_PACKAGE_OPENCV4),y)
+ZXING_CPP_DEPENDENCIES += opencv4
+endif
+ZXING_CPP_CONF_OPTS += -DCMAKE_REQUIRE_FIND_PACKAGE_OpenCV=TRUE
+else
+ZXING_CPP_CONF_OPTS += -DCMAKE_DISABLE_FIND_PACKAGE_OpenCV=TRUE
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV3_LIB_HIGHGUI),y)
-ZXING_CPP_DEPENDENCIES += opencv3
-ZXING_CPP_CONF_OPTS += -DBUILD_OPENCV=ON
+ifeq ($(BR2_PACKAGE_PYTHON3)$(BR2_PACKAGE_PYTHON_PYBIND),yy)
+ZXING_CPP_DEPENDENCIES += python3 python-pybind
+ZXING_CPP_CONF_OPTS += -DBUILD_PYTHON_MODULE=ON
+else
+ZXING_CPP_CONF_OPTS += -DBUILD_PYTHON_MODULE=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT5BASE),y)
+ZXING_CPP_DEPENDENCIES += qt5base
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK)$(BR2_PACKAGE_QT5MULTIMEDIA),yy)
+ZXING_CPP_DEPENDENCIES += qt5declarative qt5multimedia
+endif
+# Only set qt5 as required when all optional qt5 dependencies are present
+ifeq ($(BR2_PACKAGE_QT5BASE_GUI)$(BR2_PACKAGE_QT5DECLARATIVE_QUICK)$(BR2_PACKAGE_QT5MULTIMEDIA),yyy)
+ZXING_CPP_CONF_OPTS += -DCMAKE_REQUIRE_FIND_PACKAGE_Qt5=TRUE
+endif
 else
-ZXING_CPP_CONF_OPTS += -DBUILD_OPENCV=OFF
+ZXING_CPP_CONF_OPTS += -DCMAKE_DISABLE_FIND_PACKAGE_Qt5=TRUE
 endif
 
 $(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
