Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7472EC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 23:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 086EF6104F;
	Thu,  3 Nov 2022 23:16:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 086EF6104F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IZp2n7bN7EGm; Thu,  3 Nov 2022 23:16:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 207CA6104D;
	Thu,  3 Nov 2022 23:16:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 207CA6104D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 993A31BF322
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 23:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 821286104D
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 23:16:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 821286104D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1MtlMKDcN93V for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 23:16:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 597516104C
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 597516104C
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 23:16:28 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 bg9-20020a05600c3c8900b003bf249616b0so2182366wmb.3
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 16:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w0T+WoiDVXq01v16ONKYzGGKsfqB8emvIWPXz7sD5sw=;
 b=0EBFSeKLSG6PozfGvGtT/mBuj6Hx/FH3M9FrPLlIBSyXygjBsABxTUtszNlNSxnVg6
 ZfhwThrnX8AbNvMyCljYFSCgjgfWwRBCjxtJBoXI90uQlora0wFc7Bx4T5fV5FIp6mAI
 K/7oVZFXhxzrQ/Ip6uuUZh9apCdqKqk3D1iBTY8LmU1XJeV0PaBQglLIUj6AIfnW53rf
 WONoBkJjLeVMAVboHEXl8W6m9x4wl9IBtvtQN37jVDHmn16SxlTyLf2kexyqRkoC6D7f
 Xxlz2GlkVE1e3V/o/fBnbc0/KmfC13XY7x/4bjnOQXECVxjLeBgMUJTIlhKVemxtVtiV
 erew==
X-Gm-Message-State: ACrzQf1z67ICs6AtCzzFIyhz4zLRCRbhNmi4Y1wYSUvsONv7TdxMmQJZ
 AawAgplbQNWnTDP+kFZaOALzZ0vFROk=
X-Google-Smtp-Source: AMsMyM4RWnpcN1wleGt6UDgUlg7ReLBhfxXuedFKqmcXCGLrRRsweuyfxDGAP+D+2gZRunBJFWJjuA==
X-Received: by 2002:a05:600c:a4c:b0:3b4:fc1b:81 with SMTP id
 c12-20020a05600c0a4c00b003b4fc1b0081mr21076555wmq.125.1667517386137; 
 Thu, 03 Nov 2022 16:16:26 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 w30-20020a05600c099e00b003a6a3595edasm1067436wmp.27.2022.11.03.16.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 16:16:25 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  4 Nov 2022 00:16:23 +0100
Message-Id: <20221103231623.238493-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w0T+WoiDVXq01v16ONKYzGGKsfqB8emvIWPXz7sD5sw=;
 b=JaChpsS6Gh+/tiDMHbdC/6ItW4fmxOQ72mazslT+ycpIjSzsTdWMSCxBFyDhX6mkKe
 fDeS2d1ZetEdzzm8GPh97gDsNGOGY/T4LlxuA62fbwWzQLO3NCdtOq2QU0698ndzd836
 5yHU+lXDkwGlKAhugwoK8z/VbdaqJ33A9z4tuLypdjhEAb2mMhT0wHzy7wOliZtYmPEI
 2jn2NTyktcbksTOMJb9bCo+gtb0NikfdTI0rHewU8tNgHYZTean5xLeqaFNgeQqML/a3
 y2J3wn4N/yS7oYgnbnqUJUnvAf4ooU6R9o66beusme3Si8kGfIGqYPKVlWKIVujA3C9n
 Umxw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JaChpsS6
Subject: [Buildroot] [PATCH 1/1] package/docopt-cpp: fix static build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Eero Aaltonen <eero.aaltonen@vaisala.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following static build failure raised since the addition of the
package in commit 43f96ced67c9a1f84d3f0edf5cd632178eb176b8:

[ 66%] Linking CXX shared library libdocopt.so
ld (ld-elf2flt): -shared used without passing a shared library ID

Fixes:
 - http://autobuild.buildroot.org/results/834a0209c8165b3208ebf8654cb6cf8e3568b671

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-BUILD_SHARED_LIBS-where-appropriate.patch | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 package/docopt-cpp/0001-only-build-one-target-use-BUILD_SHARED_LIBS-where-appropriate.patch

diff --git a/package/docopt-cpp/0001-only-build-one-target-use-BUILD_SHARED_LIBS-where-appropriate.patch b/package/docopt-cpp/0001-only-build-one-target-use-BUILD_SHARED_LIBS-where-appropriate.patch
new file mode 100644
index 0000000000..77206d5208
--- /dev/null
+++ b/package/docopt-cpp/0001-only-build-one-target-use-BUILD_SHARED_LIBS-where-appropriate.patch
@@ -0,0 +1,87 @@
+From 6d3b803d2b0e4bf8703bbfa51a67f378d6bd59f6 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Th=C3=A9o=20DELRIEU?= <theo.delrieu@tanker.io>
+Date: Tue, 19 Nov 2019 14:58:59 +0100
+Subject: [PATCH] only build one target, use BUILD_SHARED_LIBS where
+ appropriate
+
+[Retrieved from:
+https://github.com/docopt/docopt.cpp/commit/6d3b803d2b0e4bf8703bbfa51a67f378d6bd59f6]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ CMakeLists.txt | 39 ++++++---------------------------------
+ 1 file changed, 6 insertions(+), 33 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index feff32e..14c3420 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -34,33 +34,15 @@ set(docopt_HEADERS
+ #============================================================================
+ # Compile targets
+ #============================================================================
+-if(MSVC OR XCODE)
+-    # MSVC requires __declspec() attributes, which are achieved via the 
+-    # DOCOPT_DLL and DOCOPT_EXPORTS macros below. Since those macros are only
+-    # defined when building a shared library, we must build the shared and
+-    # static libraries completely separately.
+-    # Xcode does not support libraries with only object files as sources.
+-    # See https://cmake.org/cmake/help/v3.0/command/add_library.html?highlight=add_library
+-    add_library(docopt SHARED ${docopt_SOURCES} ${docopt_HEADERS})
+-    add_library(docopt_s STATIC ${docopt_SOURCES} ${docopt_HEADERS})
+-else()
+-    # If not using MSVC or Xcode, we will create an intermediate object target
+-    # to avoid compiling the source code twice.
+-    add_library(docopt_o OBJECT ${docopt_SOURCES} ${docopt_HEADERS})
+-    set_target_properties(docopt_o PROPERTIES POSITION_INDEPENDENT_CODE TRUE)
+-
+-    add_library(docopt SHARED $<TARGET_OBJECTS:docopt_o>)
+-	set_target_properties(docopt PROPERTIES
+-			VERSION ${PROJECT_VERSION}
+-			SOVERSION ${PROJECT_VERSION_MAJOR}
+-			)
+-    add_library(docopt_s STATIC $<TARGET_OBJECTS:docopt_o>)
+-endif()
++add_library(docopt ${docopt_SOURCES} ${docopt_HEADERS})
++set_target_properties(docopt PROPERTIES
++  VERSION ${PROJECT_VERSION}
++  SOVERSION ${PROJECT_VERSION_MAJOR}
++)
+ 
+ target_include_directories(docopt PUBLIC $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}> $<INSTALL_INTERFACE:include/docopt>)
+-target_include_directories(docopt_s PUBLIC $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}> $<INSTALL_INTERFACE:include/docopt>)
+ 
+-if(MSVC)
++if(MSVC AND BUILD_SHARED_LIBS)
+     # DOCOPT_DLL: Must be specified when building *and* when using the DLL.
+     #             That's what the "PUBLIC" means.
+     # DOCOPT_EXPORTS: Must use __declspec(dllexport) when building the DLL.
+@@ -69,11 +51,6 @@ if(MSVC)
+                                       PRIVATE DOCOPT_EXPORTS)
+ endif()
+ 
+-if(NOT MSVC)
+-	set_target_properties(docopt PROPERTIES OUTPUT_NAME docopt)
+-	set_target_properties(docopt_s PROPERTIES OUTPUT_NAME docopt)
+-endif()
+-
+ if(USE_BOOST_REGEX)
+ 	add_definitions("-DDOCTOPT_USE_BOOST_REGEX")
+ 	# This is needed on Linux, where linking a static library into docopt.so
+@@ -82,9 +59,6 @@ if(USE_BOOST_REGEX)
+     find_package(Boost 1.53 REQUIRED COMPONENTS regex)
+     include_directories(${Boost_INCLUDE_DIRS})
+     target_link_libraries(docopt ${Boost_LIBRARIES})
+-	if(WITH_STATIC)
+-		target_link_libraries(docopt_s ${Boost_LIBRARIES})
+-	endif()
+ endif()
+ 
+ #============================================================================
+@@ -120,7 +94,6 @@ set(export_name "docopt-targets")
+ install(TARGETS docopt EXPORT ${export_name} DESTINATION ${CMAKE_INSTALL_LIBDIR})
+ 
+ # Development package
+-install(TARGETS docopt_s EXPORT ${export_name} DESTINATION ${CMAKE_INSTALL_LIBDIR})
+ install(FILES ${docopt_HEADERS} DESTINATION include/docopt)
+ 
+ # CMake Package
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
