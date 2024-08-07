Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C4FAC52D6F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 09:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B68D9404D7;
	Wed,  7 Aug 2024 09:25:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 54a9431yWUL1; Wed,  7 Aug 2024 09:25:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C93504061A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C93504061A;
	Wed,  7 Aug 2024 09:25:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF4241BF2CE
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 09:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB113606E0
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 09:25:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oKUOzhBX386K for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 09:25:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 728116070E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 728116070E
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 09:25:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6201884454; Wed,  7 Aug 2024 09:25:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 7 Aug 2024 10:58:33 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 92b84583f63ef3fdae050e6fd058f7193809d3d6
X-Git-Newrev: 6a3872661c6e51a97008efe8fceb317e6bdc5982
X-Patchwork-Hint: ignore
Message-Id: <20240807092530.6201884454@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/check: don't
 build shared lib when disabled
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6a3872661c6e51a97008efe8fceb317e6bdc5982
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

The build system of check was unconditionally building a shared
library, even when BUILD_SHARED_LIBS=OFF. This commit brings a patch,
submitted upstream, which fixes this issue, and allows to fix the
build in BR2_STATIC_LIBS=y configurations.

Fixes:

  http://autobuild.buildroot.net/results/d4a1c6d49dd15ce6b73cfade2557d49733e9318b/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 526b89b981cb3fa3da7644482d1f140f1fb25e27)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...sts.txt-don-t-build-shared-libraries-when.patch | 255 +++++++++++++++++++++
 1 file changed, 255 insertions(+)

diff --git a/package/check/0001-src-CMakeLists.txt-don-t-build-shared-libraries-when.patch b/package/check/0001-src-CMakeLists.txt-don-t-build-shared-libraries-when.patch
new file mode 100644
index 0000000000..6ed01f5401
--- /dev/null
+++ b/package/check/0001-src-CMakeLists.txt-don-t-build-shared-libraries-when.patch
@@ -0,0 +1,255 @@
+From 2ae2137d724d5f3a70d5d2856cb979d389c4cbd8 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Fri, 12 Jul 2024 21:30:43 +0200
+Subject: [PATCH] src/CMakeLists.txt: don't build shared libraries when not
+ enabled
+
+BUILD_SHARED_LIBS is a standard CMake option [1] that specifies
+whether shared libraries should be built or not. This commit adjusts
+src/CMakeLists.txt to observe this variable to decide whether the
+shared library variant should be built or not. This allows check to
+only build a static library in environments where only a static
+library can be compiled.
+
+This needs a bit of refactoring to avoid duplication:
+
+- Additional source files from libcompat are directly added to the
+  ${SOURCES} variable as needed
+
+- Additional libraries are collected into ${ADDITIONAL_LIBS} before
+  being associated to the static library and shared library (if enabled)
+
+[1] https://cmake.org/cmake/help/latest/variable/BUILD_SHARED_LIBS.html
+
+Fixes:
+
+__uClibc_main.c:(.text+0x12c): undefined reference to `__fini_array_end'
+/home/autobuild/autobuild/instance-20/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/13.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: __uClibc_main.c:(.text+0x130): undefined reference to `__fini_array_start'
+/home/autobuild/autobuild/instance-20/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/13.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: __uClibc_main.c:(.text+0x134): undefined reference to `__fini_array_end'
+
+Upstream: https://github.com/libcheck/check/pull/355
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/CMakeLists.txt | 137 ++++++++++++++++++++++-----------------------
+ 1 file changed, 67 insertions(+), 70 deletions(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 4a02dbe..e0cf32b 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -31,117 +31,106 @@ set(SOURCES
+   check_run.c
+   check_str.c)
+ 
+-set(HEADERS
+-  ${CONFIG_HEADER}
+-  ${CMAKE_CURRENT_BINARY_DIR}/check.h
+-  check.h.in
+-  check_error.h
+-  check_impl.h
+-  check_list.h
+-  check_log.h
+-  check_msg.h
+-  check_pack.h
+-  check_print.h
+-  check_str.h)
+-
+-configure_file(check.h.in check.h @ONLY)
+-
+-# To maintain compatibility with the Autotools installation
+-# we specifically create both shared and static libraries
+-# as that is what Autotools script has been doing.
+-# Normally CMake would create the system's native default library type.
+-
+-add_library(check STATIC ${SOURCES} ${HEADERS})
+-add_library(Check::check ALIAS check)
+-
+-
+-# We would like to create an OBJECT library but currently they are
+-# too unreliable and cumbersome,
+-# especially with target_link_libraries and install(EXPORT...
+-# https://stackoverflow.com/questions/38832528/transitive-target-include-directories-on-object-libraries
+-# So we instead do the work twice.
+-add_library(checkShared SHARED ${SOURCES} ${HEADERS})
+-add_library(Check::checkShared ALIAS checkShared)
+-
+ # Add parts of libcompat as required
+-target_sources(check PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../lib/fpclassify.c)
+-target_sources(checkShared PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../lib/fpclassify.c)
++list(APPEND SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/../lib/fpclassify.c)
+ 
+ if (NOT HAVE_LIBRT)
+-  target_sources(check PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../lib/clock_gettime.c)
+-  target_sources(check PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../lib/timer_create.c)
+-  target_sources(check PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../lib/timer_delete.c)
+-  target_sources(check PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../lib/timer_settime.c)
+-  target_sources(checkShared PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../lib/clock_gettime.c)
+-  target_sources(checkShared PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../lib/timer_create.c)
+-  target_sources(checkShared PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../lib/timer_delete.c)
+-  target_sources(checkShared PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../lib/timer_settime.c)
++  list(APPEND SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/../lib/clock_gettime.c)
++  list(APPEND SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/../lib/timer_create.c)
++  list(APPEND SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/../lib/timer_delete.c)
++  list(APPEND SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/../lib/timer_settime.c)
+ endif(NOT HAVE_LIBRT)
+ 
+ if(NOT HAVE_GETLINE)
+-  target_sources(check PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../lib/getline.c)
+-  target_sources(checkShared PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../lib/getline.c)
++  list(APPEND SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/../lib/getline.c)
+ endif(NOT HAVE_GETLINE)
+ 
+ if(NOT HAVE_GETTIMEOFDAY)
+-  target_sources(check PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../lib/gettimeofday.c)
+-  target_sources(checkShared PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../lib/gettimeofday.c)
++  list(APPEND SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/../lib/gettimeofday.c)
+ endif(NOT HAVE_GETTIMEOFDAY)
+ 
+ if(NOT HAVE_DECL_LOCALTIME_R)
+-  target_sources(check PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../lib/localtime_r.c)
+-  target_sources(checkShared PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../lib/localtime_r.c)
++  list(APPEND SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/../lib/localtime_r.c)
+ endif(NOT HAVE_DECL_LOCALTIME_R)
+ 
+ if(NOT HAVE_MALLOC)
+-  target_sources(check PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../lib/malloc.c)
+-  target_sources(checkShared PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../lib/malloc.c)
++  list(APPEND SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/../lib/malloc.c)
+ endif(NOT HAVE_MALLOC)
+ 
+ if(NOT HAVE_REALLOC)
+-  target_sources(check PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../lib/realloc.c)
+-  target_sources(checkShared PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../lib/realloc.c)
++  list(APPEND SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/../lib/realloc.c)
+ endif(NOT HAVE_REALLOC)
+ 
+ if(NOT HAVE_SNPRINTF)
+-  target_sources(check PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../lib/snprintf.c)
+-  target_sources(checkShared PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../lib/snprintf.c)
++  list(APPEND SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/../lib/snprintf.c)
+ endif(NOT HAVE_SNPRINTF)
+ 
+ if(NOT HAVE_DECL_STRDUP AND NOT HAVE__STRDUP)
+-  target_sources(check PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../lib/strdup.c)
+-  target_sources(checkShared PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../lib/snprintf.c)
++  list(APPEND SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/../lib/strdup.c)
+ endif(NOT HAVE_DECL_STRDUP AND NOT HAVE__STRDUP)
+ 
+ if(NOT HAVE_DECL_STRSIGNAL)
+-  target_sources(check PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../lib/strsignal.c)
+-  target_sources(checkShared PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../lib/strsignal.c)
++  list(APPEND SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/../lib/strsignal.c)
+ endif(NOT HAVE_DECL_STRSIGNAL)
+ 
+ if(NOT HAVE_DECL_ALARM)
+-  target_sources(check PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../lib/alarm.c)
+-  target_sources(checkShared PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../lib/alarm.c)
++  list(APPEND SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/../lib/alarm.c)
+ endif(NOT HAVE_DECL_ALARM)
+ 
+ if(NOT HAVE_PTHREAD)
+-  target_sources(check PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../lib/pthread_mutex.c)
+-  target_sources(checkShared PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../lib/pthread_mutex.c)
++  list(APPEND SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/../lib/pthread_mutex.c)
+ endif()
+ 
++set(HEADERS
++  ${CONFIG_HEADER}
++  ${CMAKE_CURRENT_BINARY_DIR}/check.h
++  check.h.in
++  check_error.h
++  check_impl.h
++  check_list.h
++  check_log.h
++  check_msg.h
++  check_pack.h
++  check_print.h
++  check_str.h)
++
++configure_file(check.h.in check.h @ONLY)
++
++# To maintain compatibility with the Autotools installation
++# we specifically create both shared and static libraries
++# as that is what Autotools script has been doing.
++# Normally CMake would create the system's native default library type.
++
++add_library(check STATIC ${SOURCES} ${HEADERS})
++add_library(Check::check ALIAS check)
++
++# We would like to create an OBJECT library but currently they are
++# too unreliable and cumbersome,
++# especially with target_link_libraries and install(EXPORT...
++# https://stackoverflow.com/questions/38832528/transitive-target-include-directories-on-object-libraries
++# So we instead do the work twice.
++if (BUILD_SHARED_LIBS)
++  add_library(checkShared SHARED ${SOURCES} ${HEADERS})
++  add_library(Check::checkShared ALIAS checkShared)
++endif (BUILD_SHARED_LIBS)
++
+ # Include libraries if available
+ if (HAVE_LIBM)
+-  target_link_libraries(check PUBLIC m)
+-  target_link_libraries(checkShared PUBLIC m)
++  list(APPEND ADDITIONAL_LIBS m)
+ endif (HAVE_LIBM)
+ if (HAVE_LIBRT)
+-  target_link_libraries(check PUBLIC rt)
+-  target_link_libraries(checkShared PUBLIC rt)
++  list(APPEND ADDITIONAL_LIBS rt)
+ endif (HAVE_LIBRT)
+ if (HAVE_SUBUNIT)
+-  target_link_libraries(check PUBLIC subunit)
+-  target_link_libraries(checkShared PUBLIC subunit)
++  list(APPEND ADDITIONAL_LIBS subunit)
+ endif (HAVE_SUBUNIT)
+ 
++target_link_libraries(check PUBLIC ${ADDITIONAL_LIBS})
++if (BUILD_SHARED_LIBS)
++  target_link_libraries(checkShared PUBLIC m)
++endif (BUILD_SHARED_LIBS)
++
++
+ if(MSVC)
+   target_compile_definitions(checkShared
+     PRIVATE "CK_DLL_EXP=_declspec(dllexport)"
+@@ -168,27 +157,35 @@ if (MSVC)
+   # So we call it this:
+   set(LIBRARY_OUTPUT_NAME "checkDynamic")
+ endif (MSVC)
++if (BUILD_SHARED_LIBS)
+ set_target_properties(checkShared PROPERTIES
+   OUTPUT_NAME ${LIBRARY_OUTPUT_NAME}
+   VERSION ${PROJECT_VERSION}
+   SOVERSION ${PROJECT_VERSION_MAJOR}
+   PUBLIC_HEADER "${public_headers}"
+ )
++endif (BUILD_SHARED_LIBS)
+ target_include_directories(check
+   PUBLIC
+     $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}>
+     $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/..>
+     $<INSTALL_INTERFACE:include>
+ )
++if (BUILD_SHARED_LIBS)
+ target_include_directories(checkShared
+   PUBLIC
+     $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}>
+     $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/..>
+     $<INSTALL_INTERFACE:include>
+-)
++ )
++endif (BUILD_SHARED_LIBS)
+ 
+ if(NOT THIS_IS_SUBPROJECT)
+-  install(TARGETS check checkShared
++  if (BUILD_SHARED_LIBS)
++    set(SHARED_LIBNAME checkShared)
++  endif ()
++
++  install(TARGETS check ${SHARED_LIBNAME}
+     EXPORT check-targets
+     ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
+     LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
+-- 
+2.45.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
