Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88604C43334
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 19:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F198983E6A;
	Mon, 20 Jun 2022 19:36:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F198983E6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qH3GFQAJxmXY; Mon, 20 Jun 2022 19:36:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD82983E52;
	Mon, 20 Jun 2022 19:36:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD82983E52
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 035721BF3FD
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 19:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A600783E18
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 19:34:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A600783E18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xk-7fRGT1rD2 for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 19:34:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC0EC83E31
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 19:34:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC0EC83E31
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DDC38874DB; Mon, 20 Jun 2022 19:22:31 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 20 Jun 2022 20:59:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 016e21eb77c98863b5bbc8e6b0b7edf44f890d94
X-Git-Newrev: 56a27d7d00ea3a1851a46045bbc9472091412e76
X-Patchwork-Hint: ignore
Message-Id: <20220620192231.DDC38874DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/misc/toolchainfile.cmake.in: allow
 variables to be overridden
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

commit: https://git.buildroot.net/buildroot/commit/?id=56a27d7d00ea3a1851a46045bbc9472091412e76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some packages such as libclc need to override cmake toolchain
variables, to avoid errors caused by trying to set overriden
variables ensure that they are not defined before being set.

This prevents difficult to debug silent dropping of overriden
variables.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/misc/toolchainfile.cmake.in | 108 +++++++++++++++++++++++++++---------
 1 file changed, 81 insertions(+), 27 deletions(-)

diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
index be575566a4..30c0e63bf2 100644
--- a/support/misc/toolchainfile.cmake.in
+++ b/support/misc/toolchainfile.cmake.in
@@ -14,9 +14,15 @@ string(REPLACE "/share/buildroot" "" RELOCATED_HOST_DIR ${CMAKE_CURRENT_LIST_DIR
 # so that it can find our custom platform description.
 list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR})
 
-set(CMAKE_SYSTEM_NAME Buildroot)
-set(CMAKE_SYSTEM_VERSION 1)
-set(CMAKE_SYSTEM_PROCESSOR @@CMAKE_SYSTEM_PROCESSOR@@)
+if(NOT DEFINED CMAKE_SYSTEM_NAME)
+  set(CMAKE_SYSTEM_NAME Buildroot)
+endif()
+if(NOT DEFINED CMAKE_SYSTEM_VERSION)
+  set(CMAKE_SYSTEM_VERSION 1)
+endif()
+if(NOT DEFINED CMAKE_SYSTEM_PROCESSOR)
+  set(CMAKE_SYSTEM_PROCESSOR @@CMAKE_SYSTEM_PROCESSOR@@)
+endif()
 
 # Set the {C,CXX}FLAGS appended by CMake depending on the build type
 # defined by Buildroot. CMake defaults these variables with -g and/or
@@ -28,11 +34,17 @@ set(CMAKE_SYSTEM_PROCESSOR @@CMAKE_SYSTEM_PROCESSOR@@)
 # Note:
 #   if the project forces some of these flag variables, Buildroot is
 #   screwed up and there is nothing Buildroot can do about that :(
-set(CMAKE_C_FLAGS_DEBUG "" CACHE STRING "Debug CFLAGS")
-set(CMAKE_C_FLAGS_RELEASE " -DNDEBUG" CACHE STRING "Release CFLAGS")
+if(NOT DEFINED CMAKE_C_FLAGS_DEBUG)
+  set(CMAKE_C_FLAGS_DEBUG "" CACHE STRING "Debug CFLAGS")
+endif()
+if(NOT DEFINED CMAKE_C_FLAGS_RELEASE)
+  set(CMAKE_C_FLAGS_RELEASE " -DNDEBUG" CACHE STRING "Release CFLAGS")
+endif()
 
 # Build type from the Buildroot configuration
-set(CMAKE_BUILD_TYPE @@CMAKE_BUILD_TYPE@@ CACHE STRING "Buildroot build configuration")
+if(NOT DEFINED CMAKE_BUILD_TYPE)
+  set(CMAKE_BUILD_TYPE @@CMAKE_BUILD_TYPE@@ CACHE STRING "Buildroot build configuration")
+endif()
 
 # Buildroot defaults flags.
 # If you are using this toolchainfile.cmake file outside of Buildroot and
@@ -41,33 +53,75 @@ set(CMAKE_BUILD_TYPE @@CMAKE_BUILD_TYPE@@ CACHE STRING "Buildroot build configur
 #     cmake -DCMAKE_C_FLAGS="@@TARGET_CFLAGS@@ -Dsome_custom_flag" ...
 # * and make sure the project's CMake code extends them like this if needed:
 #     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Dsome_definitions")
-set(CMAKE_C_FLAGS "@@TARGET_CFLAGS@@" CACHE STRING "Buildroot CFLAGS")
-set(CMAKE_EXE_LINKER_FLAGS "@@TARGET_LDFLAGS@@" CACHE STRING "Buildroot LDFLAGS for executables")
-set(CMAKE_SHARED_LINKER_FLAGS "@@TARGET_LDFLAGS@@" CACHE STRING "Buildroot LDFLAGS for shared libraries")
-set(CMAKE_MODULE_LINKER_FLAGS "@@TARGET_LDFLAGS@@" CACHE STRING "Buildroot LDFLAGS for module libraries")
+if(NOT DEFINED CMAKE_C_FLAGS)
+  set(CMAKE_C_FLAGS "@@TARGET_CFLAGS@@" CACHE STRING "Buildroot CFLAGS")
+endif()
+if(NOT DEFINED CMAKE_EXE_LINKER_FLAGS)
+  set(CMAKE_EXE_LINKER_FLAGS "@@TARGET_LDFLAGS@@" CACHE STRING "Buildroot LDFLAGS for executables")
+endif()
+if(NOT DEFINED CMAKE_SHARED_LINKER_FLAGS)
+  set(CMAKE_SHARED_LINKER_FLAGS "@@TARGET_LDFLAGS@@" CACHE STRING "Buildroot LDFLAGS for shared libraries")
+endif()
+if(NOT DEFINED CMAKE_MODULE_LINKER_FLAGS)
+  set(CMAKE_MODULE_LINKER_FLAGS "@@TARGET_LDFLAGS@@" CACHE STRING "Buildroot LDFLAGS for module libraries")
+endif()
 
-set(CMAKE_INSTALL_SO_NO_EXE 0)
+if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
+  set(CMAKE_INSTALL_SO_NO_EXE 0)
+endif()
 
-set(CMAKE_PROGRAM_PATH "${RELOCATED_HOST_DIR}/bin")
-set(CMAKE_SYSROOT "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
-set(CMAKE_FIND_ROOT_PATH "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
-set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
-set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
-set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
-set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
+if(NOT DEFINED CMAKE_PROGRAM_PATH)
+  set(CMAKE_PROGRAM_PATH "${RELOCATED_HOST_DIR}/bin")
+endif()
+if(NOT DEFINED CMAKE_SYSROOT)
+  set(CMAKE_SYSROOT "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
+endif()
+if(NOT DEFINED CMAKE_FIND_ROOT_PATH)
+  set(CMAKE_FIND_ROOT_PATH "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
+endif()
+if(NOT DEFINED CMAKE_FIND_ROOT_PATH_MODE_PROGRAM)
+  set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
+endif()
+if(NOT DEFINED CMAKE_FIND_ROOT_PATH_MODE_PACKAGE)
+  set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
+endif()
+if(NOT DEFINED CMAKE_FIND_ROOT_PATH_MODE_LIBRARY)
+  set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
+endif()
+if(NOT DEFINED CMAKE_FIND_ROOT_PATH_MODE_INCLUDE)
+  set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
+endif()
 set(ENV{PKG_CONFIG_SYSROOT_DIR} "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
 
 # This toolchain file can be used both inside and outside Buildroot.
-set(CMAKE_C_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC@@")
+if(NOT DEFINED CMAKE_C_COMPILER)
+  set(CMAKE_C_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC@@")
+endif()
 if(@@TOOLCHAIN_HAS_CXX@@)
-  set(CMAKE_CXX_FLAGS_DEBUG "" CACHE STRING "Debug CXXFLAGS")
-  set(CMAKE_CXX_FLAGS_RELEASE " -DNDEBUG" CACHE STRING "Release CXXFLAGS")
-  set(CMAKE_CXX_FLAGS "@@TARGET_CXXFLAGS@@" CACHE STRING "Buildroot CXXFLAGS")
-  set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CXX@@")
+  if(NOT DEFINED CMAKE_CXX_FLAGS_DEBUG)
+    set(CMAKE_CXX_FLAGS_DEBUG "" CACHE STRING "Debug CXXFLAGS")
+  endif()
+  if(NOT DEFINED CMAKE_CXX_FLAGS_RELEASE)
+    set(CMAKE_CXX_FLAGS_RELEASE " -DNDEBUG" CACHE STRING "Release CXXFLAGS")
+  endif()
+  if(NOT DEFINED CMAKE_CXX_FLAGS)
+    set(CMAKE_CXX_FLAGS "@@TARGET_CXXFLAGS@@" CACHE STRING "Buildroot CXXFLAGS")
+  endif()
+  if(NOT DEFINED CMAKE_CXX_COMPILER)
+    set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CXX@@")
+  endif()
 endif()
 if(@@TOOLCHAIN_HAS_FORTRAN@@)
-  set(CMAKE_Fortran_FLAGS_DEBUG "" CACHE STRING "Debug Fortran FLAGS")
-  set(CMAKE_Fortran_FLAGS_RELEASE " -DNDEBUG" CACHE STRING "Release Fortran FLAGS")
-  set(CMAKE_Fortran_FLAGS "@@TARGET_FCFLAGS@@" CACHE STRING "Buildroot FCFLAGS")
-  set(CMAKE_Fortran_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_FC@@")
+  if(NOT DEFINED CMAKE_Fortran_FLAGS_DEBUG)
+    set(CMAKE_Fortran_FLAGS_DEBUG "" CACHE STRING "Debug Fortran FLAGS")
+  endif()
+  if(NOT DEFINED CMAKE_Fortran_FLAGS_RELEASE)
+    set(CMAKE_Fortran_FLAGS_RELEASE " -DNDEBUG" CACHE STRING "Release Fortran FLAGS")
+  endif()
+  if(NOT DEFINED CMAKE_Fortran_FLAGS)
+    set(CMAKE_Fortran_FLAGS "@@TARGET_FCFLAGS@@" CACHE STRING "Buildroot FCFLAGS")
+  endif()
+  if(NOT DEFINED CMAKE_Fortran_COMPILER)
+    set(CMAKE_Fortran_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_FC@@")
+  endif()
 endif()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
