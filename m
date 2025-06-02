Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF09C5AD49
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 10:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C9C18195C;
	Mon,  2 Jun 2025 10:14:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QG1b97rLI8I7; Mon,  2 Jun 2025 10:14:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 772CA81819
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 772CA81819;
	Mon,  2 Jun 2025 10:14:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 868C31F7
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 10:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C89861011
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 10:14:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bv05pDqyC4hj for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 10:14:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4CE7760E00
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CE7760E00
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4CE7760E00
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 10:14:47 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ac3eb3fdd2eso811242066b.0
 for <buildroot@buildroot.org>; Mon, 02 Jun 2025 03:14:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748859285; x=1749464085;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0UwN4s2/N8Kje+aPWcRMCIuzlrBMONR8lNJbmbyZ4JY=;
 b=YYnwbyg/kWfdWZtkrGbpmndpZKtS2cs08qRcbajV5aOFdAcM8FIzrgyMaynhvtMfyS
 D5fh1Ajyp9fLz/POgRYa1Hw94ADk1hcRnYfOzCquyNSG8RwHNa53bmp3OggqREhPf/fc
 X6K9FRQl+2lyPF76YDp9MUbUR9rZz0hMDd5WEDBX8Zgc1sr2dXooWbaSYNsJKvyU6zgR
 0DBmJCUn+mH5/coOYGwVel+Yu/ouX9wNJtcauzMm1kF3z5f/CW8qjfJN2AtcdASF9Jz7
 IFTrCDMLTj2w697YLjoiSs2VhmtuI6HxW5iSwx1JKIA0J3zpAc4vTtRtI8IM4nSfZq7T
 yzDA==
X-Gm-Message-State: AOJu0YyS8HH3uGJVj55XyYb9h4tv4x+atBY7+xruex09GjP932I6Xj8T
 oEOnrdtHX32IDdqZsg3n3xrIQwf4JFWjM4Js2R/z9jtPjMTzf5S/nANuCXH2xA==
X-Gm-Gg: ASbGncvof5q7DyJjZ+lmgjI+XDtKU6xKZ9IjiQb0y2U67iyLu4fUlQ2Ik0gpn4ZZaqQ
 fSgVEmlGiVtJkWncPY65NQCNNip+AMJDQFyb/EChGyv+bySK33OUwYWrJpPt9436mhQ1Sns7z+F
 fsT128LAp6tfBWEPdjeOMbz1JBlHbRP7IN5JPKdYBo5MY55mXd637J2oDiIr4wvIZO4IaipVd+D
 feIViHmsClVS1dfeNe2PQgnONC5kmRhhLiuznAZIbAQXT/iHY2wPAi6/DZfB3YRfTbv+AIr9GFR
 08p517D/3vyMruTHB4L3wa9SM+S2GwNwZrotYhvuHbUjWKzoveaJD92DLbhQE4oKapNoGaaCWdG
 ooMhahJlypp9DBQNbnSzB/VpKfzxO3Z56
X-Google-Smtp-Source: AGHT+IFyzUygY31uN1ViEYyjyziyTDF5Ta7QFnBoyNjva6n6hLwO6U3+b9/jKhu2QoKuy7Npdydw/Q==
X-Received: by 2002:a17:907:7209:b0:ad8:9bcd:300d with SMTP id
 a640c23a62f3a-adb32264b4dmr1236598966b.10.1748859284523; 
 Mon, 02 Jun 2025 03:14:44 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5dd043a9sm768438466b.89.2025.06.02.03.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 03:14:43 -0700 (PDT)
From: yegorslists@googlemail.com
To: buildroot@buildroot.org
Date: Mon,  2 Jun 2025 12:14:35 +0200
Message-Id: <20250602101435.764559-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1748859285; x=1749464085; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0UwN4s2/N8Kje+aPWcRMCIuzlrBMONR8lNJbmbyZ4JY=;
 b=MnwBgQBI5BI+DlMbORYPE/nXC+sEidbClb+xSJQkjJDDC0gxxduMUWNJbRA378lh1V
 7nM0LoY8x7lUnsehNumYeJj/3uqadl+oQCy6v379y3VmE88qZnsum4jw+l/867q/h+JK
 tjoAWWRSOmXKp8IJeU3GRgS+cA57ZtdvfnOhaS4GIvNXqvv48aAauzKwv3CIRe3gG9O4
 lLbfg+dBiQEObOfSb6XCBykWBFG+STe31vsno4TbwjINxVkPp82PoK87aS4Cvem8pxjn
 KsWr2kbLK2rk5GqsxcUPnAw0Mc/xOP+JpbbLldar86uf8OcayUoiGSKI7njEi/PkaN+V
 wGgQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MnwBgQBI
Subject: [Buildroot] [PATCH] package/libftdi1: fix static building
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
Cc: Daniel Sangue <daniel.sangue@sangue.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Restore the following patch, as the upstream still cannot produce static
only libraries:

0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch

Fixes:

https://autobuild.buildroot.org/results/07744b67b53d2b25e78e0f61b511a342677e2abb/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...andard-CMake-flag-to-drive-the-share.patch | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 package/libftdi1/0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch

diff --git a/package/libftdi1/0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch b/package/libftdi1/0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
new file mode 100644
index 0000000000..856587b7a6
--- /dev/null
+++ b/package/libftdi1/0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
@@ -0,0 +1,93 @@
+From b0ea5773c90e36654da37562a03e62d9a66575bf Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sun, 25 Jan 2015 09:45:04 +0100
+Subject: [PATCH] cmake: use the standard CMake flag to drive the shared object
+ build
+
+Remove the STATICLIBS CMake option (and the code handling it) and let
+the standard CMake flags drive the shared object build.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+[Fabrice: update for 1.5]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ CMakeOptions.txt      |  1 -
+ ftdipp/CMakeLists.txt | 14 +-------------
+ src/CMakeLists.txt    | 13 +------------
+ 3 files changed, 2 insertions(+), 26 deletions(-)
+
+diff --git a/CMakeOptions.txt b/CMakeOptions.txt
+index 07b5887..b780ffd 100644
+--- a/CMakeOptions.txt
++++ b/CMakeOptions.txt
+@@ -1,4 +1,3 @@
+-option ( STATICLIBS "Build static libraries" ON )
+ option ( BUILD_TESTS "Build unit tests with Boost Unit Test framework" OFF )
+ option ( DOCUMENTATION "Generate API documentation with Doxygen" OFF )
+ option ( EXAMPLES "Build example programs" ON )
+diff --git a/ftdipp/CMakeLists.txt b/ftdipp/CMakeLists.txt
+index 360a831..df88569 100644
+--- a/ftdipp/CMakeLists.txt
++++ b/ftdipp/CMakeLists.txt
+@@ -11,7 +11,7 @@ include_directories(BEFORE ${CMAKE_CURRENT_BINARY_DIR}
+ include_directories(${Boost_INCLUDE_DIRS})
+ 
+ # Shared library
+-add_library(ftdipp1 SHARED ${cpp_sources})
++add_library(ftdipp1 ${cpp_sources})
+ 
+ math(EXPR VERSION_FIXUP "${MAJOR_VERSION} + 1")    # Compatibility with previous releases
+ set_target_properties(ftdipp1 PROPERTIES VERSION ${VERSION_FIXUP}.${MINOR_VERSION}.0 SOVERSION 3)
+@@ -28,18 +28,6 @@ install ( TARGETS ftdipp1
+           ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
+ )
+ 
+-# Static library
+-if ( STATICLIBS )
+-  add_library(ftdipp1-static STATIC ${cpp_sources})
+-  set_target_properties(ftdipp1-static PROPERTIES OUTPUT_NAME "ftdipp1")
+-  set_target_properties(ftdipp1-static PROPERTIES CLEAN_DIRECT_OUTPUT 1)
+-
+-  install ( TARGETS ftdipp1-static
+-            ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
+-            COMPONENT staticlibs
+-  )
+-endif ()
+-
+ install ( FILES ${cpp_headers}
+           DESTINATION include/${PROJECT_NAME}
+           COMPONENT headers
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index e145af1..ca7efa4 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -21,7 +21,7 @@ configure_file(ftdi_version_i.h.in "${CMAKE_CURRENT_BINARY_DIR}/ftdi_version_i.h
+ set(c_sources     ${CMAKE_CURRENT_SOURCE_DIR}/ftdi.c ${CMAKE_CURRENT_SOURCE_DIR}/ftdi_stream.c CACHE INTERNAL "List of c sources" )
+ set(c_headers     ${CMAKE_CURRENT_SOURCE_DIR}/ftdi.h CACHE INTERNAL "List of c headers" )
+ 
+-add_library(ftdi1 SHARED ${c_sources})
++add_library(ftdi1 ${c_sources})
+ 
+ math(EXPR VERSION_FIXUP "${MAJOR_VERSION} + 1")    # Compatibility with previous releases
+ set_target_properties(ftdi1 PROPERTIES VERSION ${VERSION_FIXUP}.${MINOR_VERSION}.0 SOVERSION 2)
+@@ -38,17 +38,6 @@ install ( TARGETS ftdi1
+           ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
+ )
+ 
+-if ( STATICLIBS )
+-  add_library(ftdi1-static STATIC ${c_sources})
+-  target_link_libraries(ftdi1-static ${LIBUSB_LIBRARIES})
+-  set_target_properties(ftdi1-static PROPERTIES OUTPUT_NAME "ftdi1")
+-  set_target_properties(ftdi1-static PROPERTIES CLEAN_DIRECT_OUTPUT 1)
+-  install ( TARGETS ftdi1-static
+-            ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
+-            COMPONENT staticlibs
+-  )
+-endif ()
+-
+ install ( FILES ${c_headers}
+           DESTINATION include/${PROJECT_NAME}
+           COMPONENT headers
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
