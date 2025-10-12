Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE8BCCD184
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 15:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A762607D9;
	Sun, 12 Oct 2025 15:22:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GlhcWYsdZHrK; Sun, 12 Oct 2025 15:22:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B89E160DC5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B89E160DC5;
	Sun, 12 Oct 2025 15:22:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B656912B
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 15:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A78D860DC5
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 15:22:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cvP300UUXESv for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 15:22:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9F4E0607D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F4E0607D9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F4E0607D9
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 15:22:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 18D21A4C6766;
 Sun, 12 Oct 2025 17:22:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33670)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v7xto-000000003hK-1HN0;
 Sun, 12 Oct 2025 15:22:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thijs Vermeir <thijsvermeir@gmail.com>
Date: Sun, 12 Oct 2025 17:22:16 +0200
Message-ID: <20251012152216.92949-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760282537;
 bh=j2ViwGPfVjIDZJVnggZVjDNEPHs7uwXBfrOUYrNJ9v4=;
 h=From:To:Cc:Subject:Date:From;
 b=rw3F1t/ekunxpxK9hpJA9CCdpkPSzGvXChDk81kmXGI3xiluVpL5/jIBvyeNshIGS
 +04QrJlJqbGd5wO/nJx6D+y5F6V8AV3sk3UUWO4agCfspj51eHrnaidrPxN/zkO+Pa
 6Q3PG90QXgJrj2lANELibEga419hsyyoqwJ/le3bEmE0uOjoCUU4xzqpOXK0CXca/k
 WiKmr1ZiEmv1ZypVTvVkaO33aCGIUITBT0MCs6BldUTCESc3QoI1O7hHOtN0hTszxN
 s7YDVM+jbWvYXLDNAiVm3ale1hMfRTfiU/b07JJlsd8nHeUdu8hq9acE57pkUDSrWe
 9nq6Fg9jrsnmg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=rw3F1t/e
Subject: [Buildroot] [PATCH 1/1] package/x265: bump version to 4.1
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

Release notes:
4.1: https://mailman.videolan.org/pipermail/x265-devel/2024-November/014095.html
4.0: https://mailman.videolan.org/pipermail/x265-devel/2024-September/013940.html
3.6: https://mailman.videolan.org/pipermail/x265-devel/2024-April/013664.html

Rebased patch 0001 and removed patch 0002 due to upstream commit
https://bitbucket.org/multicoreware/x265_git/commits/4bf31dc15fb6d1f93d12ecf21fad5e695f0db5c0

Added patches 0002 & 0003 to fix build with CMake 4.x.

Added patch 0004 and adjusted _CONF_OPTS to fix non-NEON build.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Afaics this bump does not introduce new build errors but does not fix a
build error already present in version 3.5:
https://autobuild.buildroot.org/results/c27/c270ed8f9f1c643b249f2206d76d1261abfe9a88/

Quote:
    /home/autobuild/autobuild/instance-11/output-1/host/lib/gcc/i686-buildroot-linux-musl/13.3.0/../../../../i686-buildroot-linux-musl/bin/ld: read-only segment has dynamic relocation

 ...ists.txt-do-not-force-compiler-flags.patch | 42 ++++++-------
 ...-error-with-latest-CMake-4.0-release.patch | 35 +++++++++++
 ...s.txt-allow-setting-CPU_HAS_NEON-whe.patch | 40 -------------
 ...-Fix-for-CMake-Build-Errors-in-MacOS.patch | 60 +++++++++++++++++++
 ...n-undefined-symbols-in-armv6l-armv7l.patch | 28 +++++++++
 package/x265/x265.hash                        |  4 +-
 package/x265/x265.mk                          |  6 +-
 7 files changed, 146 insertions(+), 69 deletions(-)
 create mode 100644 package/x265/0002-Fix-CMake-build-error-with-latest-CMake-4.0-release.patch
 delete mode 100644 package/x265/0002-source-CMakeLists.txt-allow-setting-CPU_HAS_NEON-whe.patch
 create mode 100644 package/x265/0003-Fix-for-CMake-Build-Errors-in-MacOS.patch
 create mode 100644 package/x265/0004-Fix-neon-undefined-symbols-in-armv6l-armv7l.patch

diff --git a/package/x265/0001-CMakeLists.txt-do-not-force-compiler-flags.patch b/package/x265/0001-CMakeLists.txt-do-not-force-compiler-flags.patch
index af0e57f206..4a12c15ca4 100644
--- a/package/x265/0001-CMakeLists.txt-do-not-force-compiler-flags.patch
+++ b/package/x265/0001-CMakeLists.txt-do-not-force-compiler-flags.patch
@@ -21,43 +21,37 @@ Bernd Kuhls <bernd.kuhls@t-online.de>.
 
 Upstream: https://bitbucket.org/multicoreware/x265_git/pull-requests/26
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+[Bernd: rebased for 4.1]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
- source/CMakeLists.txt              | 10 +++-------
- source/dynamicHDR10/CMakeLists.txt |  6 +++---
- 2 files changed, 6 insertions(+), 10 deletions(-)
+ source/CMakeLists.txt              | 6 +++---
+ source/dynamicHDR10/CMakeLists.txt | 6 +++---
+ 2 files changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/source/CMakeLists.txt b/source/CMakeLists.txt
-index a407271b4..a34bf4d4f 100755
+index c14489ea6..fa331e8af 100755
 --- a/source/CMakeLists.txt
 +++ b/source/CMakeLists.txt
-@@ -239,11 +239,7 @@ if(GCC)
-         endif()
+@@ -270,14 +270,14 @@ if(GCC)
      endif()
      if(ARM AND CROSS_COMPILE_ARM)
--        if(ARM64)
--            set(ARM_ARGS -fPIC)
--        else()
--            set(ARM_ARGS -march=armv6 -mfloat-abi=soft -mfpu=vfp -marm -fPIC)
--        endif()
-+        set(ARM_ARGS -fPIC)
          message(STATUS "cross compile arm")
+-		set(ARM_ARGS -march=armv6 -mfloat-abi=soft -mfpu=vfp -marm -fPIC)
++		set(ARM_ARGS -fPIC)
      elseif(ARM)
-         if(ARM64)
-@@ -252,10 +248,10 @@ if(GCC)
+         find_package(Neon)
+         if(CPU_HAS_NEON)
+-            set(ARM_ARGS -mcpu=native -mfloat-abi=hard -mfpu=neon -marm -fPIC)
++            set(ARM_ARGS -mfpu=neon -fPIC)
+             add_definitions(-DHAVE_NEON)
          else()
-             find_package(Neon)
-             if(CPU_HAS_NEON)
--                set(ARM_ARGS -mcpu=native -mfloat-abi=hard -mfpu=neon -marm -fPIC)
-+                set(ARM_ARGS -mfpu=neon -fPIC)
-                 add_definitions(-DHAVE_NEON)
-             else()
--                set(ARM_ARGS -mcpu=native -mfloat-abi=hard -mfpu=vfp -marm)
-+	        set(ARM_ARGS -fPIC)
-             endif()
+-            set(ARM_ARGS -mcpu=native -mfloat-abi=hard -mfpu=vfp -marm)
++            set(ARM_ARGS -fPIC)
          endif()
      endif()
+     if(ARM64)
 diff --git a/source/dynamicHDR10/CMakeLists.txt b/source/dynamicHDR10/CMakeLists.txt
-index 22fb79d44..2cea7c48a 100644
+index 4243338c6..62853a06b 100644
 --- a/source/dynamicHDR10/CMakeLists.txt
 +++ b/source/dynamicHDR10/CMakeLists.txt
 @@ -43,14 +43,14 @@ if(GCC)
diff --git a/package/x265/0002-Fix-CMake-build-error-with-latest-CMake-4.0-release.patch b/package/x265/0002-Fix-CMake-build-error-with-latest-CMake-4.0-release.patch
new file mode 100644
index 0000000000..95d7a7c7b2
--- /dev/null
+++ b/package/x265/0002-Fix-CMake-build-error-with-latest-CMake-4.0-release.patch
@@ -0,0 +1,35 @@
+From b354c009a60bcd6d7fc04014e200a1ee9c45c167 Mon Sep 17 00:00:00 2001
+From: yaswanthsastry <yaswanth.sastry@multicorewareinc.com>
+Date: Mon, 24 Feb 2025 17:07:03 +0530
+Subject: [PATCH] Fix CMake build error with latest CMake 4.0 release
+
+Upstream: https://bitbucket.org/multicoreware/x265_git/commits/b354c009a60bcd6d7fc04014e200a1ee9c45c167
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ source/CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/source/CMakeLists.txt b/source/CMakeLists.txt
+index 37dbe1a87..4f5b3ed82 100755
+--- a/source/CMakeLists.txt
++++ b/source/CMakeLists.txt
+@@ -7,13 +7,13 @@ if(NOT CMAKE_BUILD_TYPE)
+ endif()
+ message(STATUS "cmake version ${CMAKE_VERSION}")
+ if(POLICY CMP0025)
+-    cmake_policy(SET CMP0025 OLD) # report Apple's Clang as just Clang
++    cmake_policy(SET CMP0025 NEW) # report Apple's Clang as just Clang
+ endif()
+ if(POLICY CMP0042)
+     cmake_policy(SET CMP0042 NEW) # MACOSX_RPATH
+ endif()
+ if(POLICY CMP0054)
+-    cmake_policy(SET CMP0054 OLD) # Only interpret if() arguments as variables or keywords when unquoted
++    cmake_policy(SET CMP0054 NEW) # Only interpret if() arguments as variables or keywords when unquoted
+ endif()
+ 
+ project (x265)
+-- 
+2.51.0
+
diff --git a/package/x265/0002-source-CMakeLists.txt-allow-setting-CPU_HAS_NEON-whe.patch b/package/x265/0002-source-CMakeLists.txt-allow-setting-CPU_HAS_NEON-whe.patch
deleted file mode 100644
index 51be8f2d02..0000000000
--- a/package/x265/0002-source-CMakeLists.txt-allow-setting-CPU_HAS_NEON-whe.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 0088d29e7c75ea7f100a100aea4e2a797469427f Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sat, 13 Jul 2024 10:10:54 +0200
-Subject: [PATCH] source/CMakeLists.txt: allow setting CPU_HAS_NEON when
- CROSS_COMPILE_ARM
-
-The logic in source/cmake/FindNeon.cmake is not appropriate for
-cross-compilation scenarios, so in order to allow cross-compiling for
-ARM, CROSS_COMPILE_ARM needs to be defined. However that currently
-doesn't allow the enabling of NEON support, so let's allow the user to
-manually set CPU_HAS_NEON in this case.
-
-Upstream: https://bitbucket.org/multicoreware/x265_git/pull-requests/26
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- source/CMakeLists.txt | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/source/CMakeLists.txt b/source/CMakeLists.txt
-index a34bf4d4f..072bf62ab 100755
---- a/source/CMakeLists.txt
-+++ b/source/CMakeLists.txt
-@@ -239,8 +239,13 @@ if(GCC)
-         endif()
-     endif()
-     if(ARM AND CROSS_COMPILE_ARM)
--        set(ARM_ARGS -fPIC)
-         message(STATUS "cross compile arm")
-+        if(CPU_HAS_NEON)
-+          set(ARM_ARGS -mfpu=neon -fPIC)
-+          add_definitions(-DHAVE_NEON)
-+        else()
-+	  set(ARM_ARGS -fPIC)
-+	endif()
-     elseif(ARM)
-         if(ARM64)
-             set(ARM_ARGS -fPIC)
--- 
-2.45.2
-
diff --git a/package/x265/0003-Fix-for-CMake-Build-Errors-in-MacOS.patch b/package/x265/0003-Fix-for-CMake-Build-Errors-in-MacOS.patch
new file mode 100644
index 0000000000..200ba15be4
--- /dev/null
+++ b/package/x265/0003-Fix-for-CMake-Build-Errors-in-MacOS.patch
@@ -0,0 +1,60 @@
+From 51ae8e922bcc4586ad4710812072289af91492a8 Mon Sep 17 00:00:00 2001
+From: yaswanthsastry <yaswanth.sastry@multicorewareinc.com>
+Date: Mon, 7 Apr 2025 11:27:36 +0530
+Subject: [PATCH] Fix for CMake Build Errors in MacOS
+
+Upstream: https://bitbucket.org/multicoreware/x265_git/commits/51ae8e922bcc4586ad4710812072289af91492a8
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ source/CMakeLists.txt | 15 +++++++--------
+ 1 file changed, 7 insertions(+), 8 deletions(-)
+
+diff --git a/source/CMakeLists.txt b/source/CMakeLists.txt
+index 4f5b3ed82..7183fd3ce 100755
+--- a/source/CMakeLists.txt
++++ b/source/CMakeLists.txt
+@@ -6,18 +6,14 @@ if(NOT CMAKE_BUILD_TYPE)
+         FORCE)
+ endif()
+ message(STATUS "cmake version ${CMAKE_VERSION}")
+-if(POLICY CMP0025)
+-    cmake_policy(SET CMP0025 NEW) # report Apple's Clang as just Clang
+-endif()
++
+ if(POLICY CMP0042)
+     cmake_policy(SET CMP0042 NEW) # MACOSX_RPATH
+ endif()
+-if(POLICY CMP0054)
+-    cmake_policy(SET CMP0054 NEW) # Only interpret if() arguments as variables or keywords when unquoted
+-endif()
++
+ 
+ project (x265)
+-cmake_minimum_required (VERSION 2.8.8) # OBJECT libraries require 2.8.8
++cmake_minimum_required (VERSION 2.8.8...3.10) # OBJECT libraries require 2.8.8
+ include(CheckIncludeFiles)
+ include(CheckFunctionExists)
+ include(CheckSymbolExists)
+@@ -168,7 +164,7 @@ if(APPLE)
+   add_definitions(-DMACOS=1)
+ endif()
+ 
+-if(${CMAKE_CXX_COMPILER_ID} STREQUAL "Clang")
++if(${CMAKE_CXX_COMPILER_ID} STREQUAL "Clang" OR ${CMAKE_CXX_COMPILER_ID} STREQUAL "AppleClang")
+     set(CLANG 1)
+ endif()
+ if(${CMAKE_CXX_COMPILER_ID} STREQUAL "Intel")
+@@ -740,6 +736,9 @@ if((MSVC_IDE OR XCODE OR GCC) AND ENABLE_ASSEMBLY)
+     if(ARM OR CROSS_COMPILE_ARM)
+     # compile ARM arch asm files here
+         enable_language(ASM)
++        if(APPLE)
++            set(ARM_ARGS ${ARM_ARGS} -arch ${CMAKE_OSX_ARCHITECTURES})
++        endif()
+         foreach(ASM ${ARM_ASMS})
+ 			set(ASM_SRC ${CMAKE_CURRENT_SOURCE_DIR}/common/arm/${ASM})
+             list(APPEND ASM_SRCS ${ASM_SRC})
+-- 
+2.51.0
+
diff --git a/package/x265/0004-Fix-neon-undefined-symbols-in-armv6l-armv7l.patch b/package/x265/0004-Fix-neon-undefined-symbols-in-armv6l-armv7l.patch
new file mode 100644
index 0000000000..75f1d4c532
--- /dev/null
+++ b/package/x265/0004-Fix-neon-undefined-symbols-in-armv6l-armv7l.patch
@@ -0,0 +1,28 @@
+From ddb1933598736394b646cb0f78da4a4201ffc656 Mon Sep 17 00:00:00 2001
+From: Uthayakumar Muthu <uthayakumar.muthu@multicorewareinc.com>
+Date: Sun, 12 Jan 2025 13:17:21 +0530
+Subject: [PATCH] Fix neon undefined symbols in armv6l,armv7l
+
+Upstream: https://bitbucket.org/multicoreware/x265_git/commits/ddb1933598736394b646cb0f78da4a4201ffc656
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ source/common/cpu.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/source/common/cpu.cpp b/source/common/cpu.cpp
+index ae0907890..35c43deaf 100644
+--- a/source/common/cpu.cpp
++++ b/source/common/cpu.cpp
+@@ -352,7 +352,7 @@ uint32_t cpu_detect(bool benableavx512)
+ {
+     int flags = 0;
+ 
+-#if HAVE_ARMV6
++#if HAVE_ARMV6 && ENABLE_ASSEMBLY
+     flags |= X265_CPU_ARMV6;
+ 
+     // don't do this hack if compiled with -mfpu=neon
+-- 
+2.51.0
+
diff --git a/package/x265/x265.hash b/package/x265/x265.hash
index fb9a5b5910..640cd9ce0d 100644
--- a/package/x265/x265.hash
+++ b/package/x265/x265.hash
@@ -1,5 +1,3 @@
-# From https://mailman.videolan.org/pipermail/x265-devel/2021-March/013257.html
-md5  deb5df5cb2ec17bdbae6ac6bbc3b1eef  x265_3.5.tar.gz
 # Locally generated
-sha256  e70a3335cacacbba0b3a20ec6fecd6783932288ebc8163ad74bcc9606477cae8  x265_3.5.tar.gz
+sha256  a31699c6a89806b74b0151e5e6a7df65de4b49050482fe5ebf8a4379d7af8f29  x265_4.1.tar.gz
 sha256  d8afb1bcc7a2cfc603683b168d6987ef0a48e59e0da3693bf55c5d33b67e2b49  COPYING
diff --git a/package/x265/x265.mk b/package/x265/x265.mk
index bd5180b24b..ad4285fb16 100644
--- a/package/x265/x265.mk
+++ b/package/x265/x265.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-X265_VERSION = 3.5
+X265_VERSION = 4.1
 X265_SOURCE = x265_$(X265_VERSION).tar.gz
 X265_SITE = https://bitbucket.org/multicoreware/x265_git/downloads
 X265_LICENSE = GPL-2.0+
@@ -23,7 +23,9 @@ endif
 ifeq ($(BR2_ARM_CPU_ARMV7A),y)
 X265_CONF_OPTS += -DCROSS_COMPILE_ARM=1
 ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
-X265_CONF_OPTS += -DCPU_HAS_NEON=1
+X265_CONF_OPTS += -DENABLE_NEON=ON
+else
+X265_CONF_OPTS += -DENABLE_NEON=OFF
 endif
 endif
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
