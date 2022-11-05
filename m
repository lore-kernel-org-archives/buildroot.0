Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B483C433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 20:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B48254032A;
	Sat,  5 Nov 2022 20:28:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B48254032A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LaEMeXyKkjD2; Sat,  5 Nov 2022 20:28:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B727640222;
	Sat,  5 Nov 2022 20:28:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B727640222
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BEB8C1BF283
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 20:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9669340222
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 20:28:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9669340222
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VxOtrWQDjg3B for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 20:28:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70209400D9
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 20:28:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70209400D9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5CF1F87E21; Sat,  5 Nov 2022 20:28:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 21:20:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b21e2f216b08135366c7d9ba1eb087f6bdaba482
X-Git-Newrev: b1ebbb919aebdfb1cc984803d2dee554edb4672e
X-Patchwork-Hint: ignore
Message-Id: <20221105202833.5CF1F87E21@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docopt-cpp: fix static build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b1ebbb919aebdfb1cc984803d2dee554edb4672e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following static build failure raised since the addition of the
package in commit 43f96ced67c9a1f84d3f0edf5cd632178eb176b8:

[ 66%] Linking CXX shared library libdocopt.so
ld (ld-elf2flt): -shared used without passing a shared library ID

Fixes:
 - http://autobuild.buildroot.org/results/834a0209c8165b3208ebf8654cb6cf8e3568b671

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...t-use-BUILD_SHARED_LIBS-where-appropriate.patch | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
