Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E80C433FE
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 02:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 169F781493;
	Mon,  7 Nov 2022 02:25:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 169F781493
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NVd6YW35xUfj; Mon,  7 Nov 2022 02:25:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A1AE81521;
	Mon,  7 Nov 2022 02:25:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A1AE81521
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C10C1BF398
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 02:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67AC18146A
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 02:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67AC18146A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cEhJGeqWGPl8 for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 02:25:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CE1D8145D
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2CE1D8145D
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 02:25:06 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id b2so7819679iof.12
 for <buildroot@buildroot.org>; Sun, 06 Nov 2022 18:25:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4WxMUZk74tCcZ0ADSG63A/O5koH/vr+DeuUJufvBhf8=;
 b=yVLjrPFRV4vVZPV7L4xrgUzqwwF9z+ms/nCma9lpYWylkcuRljh5y5eqw3I7izGST0
 KpJktvjT2BjMM6tgjNVIgdkWVkbgIiyYGYmfoJ505ysIte8F/duWLo+C2vqQJdvVPPcW
 ZRzx+S/xJr/+e6DaiN0fEoRyb/IB86BarHY0dwYwAntY/rOvtIKT+4/kH4Nh1XNl85l+
 Rnfq2o15zYnpPIhlE2kdE2RzEgPvrRiJbRJXkI1Ygzifs906OO6CKCIl292nGZfAvIHo
 nQXxHiRglLCFpdd3NPeFoa+kvR7NcUKayHfDz5T3GWgIb1ybt4hmq5ETpO8vXo/tgOv+
 o6jQ==
X-Gm-Message-State: ACrzQf0GG+fpuWR1Epckwq5zYiMGGR0sVsF1M1YnpDAhzPUAceVKZhYn
 BB+8xsEbiXZ/jRDDVpVGyKDhvUZ5rKLWhg==
X-Google-Smtp-Source: AMsMyM7eymkQd6sLVItaVtIcWgVgD4Y9s0Nd1NS/xf/gvxHRxRK0XgClYv25QGCf6Fjy67xWTt092g==
X-Received: by 2002:a05:6638:1453:b0:375:9242:df71 with SMTP id
 l19-20020a056638145300b003759242df71mr11394431jad.53.1667787904936; 
 Sun, 06 Nov 2022 18:25:04 -0800 (PST)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 z25-20020a027a59000000b003717c1df569sm2215225jad.165.2022.11.06.18.25.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 18:25:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Nov 2022 19:24:57 -0700
Message-Id: <20221107022458.3448020-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221107022458.3448020-1-james.hilliard1@gmail.com>
References: <20221107022458.3448020-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4WxMUZk74tCcZ0ADSG63A/O5koH/vr+DeuUJufvBhf8=;
 b=Gh6GPfsfnR9jRgPurCFlveOJLrM+SKTNKhnWUhww0b6pUy1IxR58woulKgnoHEl7WH
 ubr3xOaw9MITqxEAasklehY+6N33tBAgOW1Imw8Pas175X6wnRH9vLXPgEUxQ3Otm6NN
 Re1mU2SlUQVg4xHXE4hgI8iRFwq79vWTpbupflUrojCxXhHkVorjiX8FAZIZwLi65qA2
 OUpS8sm4rImfqV+0hXIIVVBZlXnNt41FlfrsaM2bpAapPCUTMsAUM6hPB0CFw6QGbNhm
 8/KoDHzpNj94OHvbLONOwZN0b6NJw6lOXMxmz5mtdX+b3tcMzyXtwPfXsdq3aA4rbEbe
 tRyw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Gh6GPfsf
Subject: [Buildroot] [PATCH 2/3] package/zxing-cpp: bump to version 1.4.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 ...bs-private-not-exported-to-the-users.patch | 43 -----------------
 ...akeLists-txt-add-BUILD_OPENCV-option.patch | 39 ---------------
 package/zxing-cpp/Config.in                   |  2 +
 package/zxing-cpp/zxing-cpp.hash              |  4 +-
 package/zxing-cpp/zxing-cpp.mk                | 47 +++++++++++++++----
 5 files changed, 41 insertions(+), 94 deletions(-)
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
index e9c80b4453..a728e3c352 100644
--- a/package/zxing-cpp/zxing-cpp.mk
+++ b/package/zxing-cpp/zxing-cpp.mk
@@ -4,23 +4,50 @@
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
+ifeq ($(BR2_PACKAGE_PYTHON3)$(BR2_PACKAGE_PYTHON_PYBIND),y)
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
