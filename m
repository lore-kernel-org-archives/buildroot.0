Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C37C2C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 11:13:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22D4660E90
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 11:13:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 22D4660E90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2CF860632;
	Sun, 25 Jul 2021 11:12:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K-HinSpUlZ9s; Sun, 25 Jul 2021 11:12:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A18860645;
	Sun, 25 Jul 2021 11:12:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ADB911BF48B
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 11:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A86374011D
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 11:12:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SEwpUdsBDU0D for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 11:12:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 10CFC400EE
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 11:12:42 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id hs23so10808206ejc.13
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 04:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MafIK9x4OtkFZsKLLuI+wM14BuSnVL9b6FUnWloHKVA=;
 b=YmLlr2kDeY02xT1NUMylpiplzXBCOvf+5SXHbANLYCYvk14OQDd5wkYYblRFspSc1n
 5ayNezklrb+ii9qvu5jVv6UIz2xkMfNm3oQS2SQKMotD4unrMDKLTT+P3JeWTmSwTUGL
 cpr4t0r0MFdMdWlfPj9RgFCBvNaHT9ghG4gfpMTJOWu3SmkB++Y0NJmDWoHxURLwqfhE
 yTQekD9lKTG7u5P2uvRDqpe//Vm6APQdanUyzpYrIMqOczuyoRLsCUkjae52NkC7Dtaz
 uAFrElB+9K6mphd7Lu9maJkz5vfFn8272NdCs2HvQbTcXgCTY9eZXmEhbcsdB9S1aCdD
 Mlgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MafIK9x4OtkFZsKLLuI+wM14BuSnVL9b6FUnWloHKVA=;
 b=faW9rLqZEys1f/BTdMzuSwXE2Z5ZrodzkRLkx+nfMwBvdLWLM3+7SEOjCsuUBJ1SHl
 ykRbcrlLIeTamX4oW2InmRMFxCqwKl9xiDYQnohcPsX3vBryiA1VSyXNoTwP8LubWtAq
 6ByEi6Uv5Bn8TpMlqfxwGcxedWRFbkru+lPTzax16cgdaGkV/Z5S5oPI3skbXIXSzgDB
 Zd6uEUrTbqajGRLVD2pSVyWT9rKu2qtSwzFqTJtOOEbIdbXEKAybo4i5fXl/OlyQNZRx
 62dcNq2cEJLwM6crPr8XoUgheOF2Cel69e6z4ZZMmuVFGOfjBpZt7RS1jH6K2ol/ivcB
 PDjA==
X-Gm-Message-State: AOAM530JFmX/SBRJk7FbzW0rgOuyPyGUKpk5I9P3FUZtaVbM/3VS8auu
 MFnUXFuzYoTbX8lE+Lm9eFRhjr+U+2bwoUYH
X-Google-Smtp-Source: ABdhPJzszQkL51mkhU2JINm9BRoGPwHeJRYZmCYZFLurCJvmOpzaB9RVDS7Jc9Xzcyh4dOfFTDab1g==
X-Received: by 2002:aa7:dd08:: with SMTP id i8mr7793782edv.163.1627211561042; 
 Sun, 25 Jul 2021 04:12:41 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id v13sm13190255ejh.62.2021.07.25.04.12.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 04:12:40 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 13:12:30 +0200
Message-Id: <20210725111231.359830-2-arnout@mind.be>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210725111231.359830-1-arnout@mind.be>
References: <20210725111231.359830-1-arnout@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 2/3] package/clapack: Remove
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Alexandre PAYEN <alexandre.payen@smile.fr>,
 Romain Naour <romain.naour@smile.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Benjamin Kamath <kamath.ben@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

clapack has been unmaintained for a couple of years. It is
semi-automatically generated from lapack sources using the f2c
fortran-to-C converter, which itself is pretty much unmaintained.

Remove the package. Remove the dependency on !CLAPACK from lapack.
Automatically select lapack from legacy if possible.

Cc: Alexandre PAYEN <alexandre.payen@smile.fr>
Cc: Benjamin Kamath <kamath.ben@gmail.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy                              |  9 +++
 DEVELOPERS                                    |  1 -
 package/Config.in                             |  1 -
 ...bf2c-to-be-built-as-a-static-library.patch | 32 --------
 ...est-build-sensitive-to-BUILD_TESTING.patch | 80 -------------------
 ...-to-run-arithchk-when-cross-compilin.patch | 70 ----------------
 ...add-library-and-header-install-rules.patch | 23 ------
 ...add-library-and-header-install-rules.patch | 24 ------
 package/clapack/0006-remove-uninit-f2c.patch  | 24 ------
 package/clapack/0007-off64-t.patch            | 16 ----
 package/clapack/Config.in                     | 33 --------
 package/clapack/clapack.hash                  |  5 --
 package/clapack/clapack.mk                    | 22 -----
 package/lapack/Config.in                      |  1 -
 14 files changed, 9 insertions(+), 332 deletions(-)
 delete mode 100644 package/clapack/0001-cmake-force-libf2c-to-be-built-as-a-static-library.patch
 delete mode 100644 package/clapack/0002-cmake-make-test-build-sensitive-to-BUILD_TESTING.patch
 delete mode 100644 package/clapack/0003-cmake-do-not-try-to-run-arithchk-when-cross-compilin.patch
 delete mode 100644 package/clapack/0004-cmake-blas-add-library-and-header-install-rules.patch
 delete mode 100644 package/clapack/0005-cmake-lapack-add-library-and-header-install-rules.patch
 delete mode 100644 package/clapack/0006-remove-uninit-f2c.patch
 delete mode 100644 package/clapack/0007-off64-t.patch
 delete mode 100644 package/clapack/Config.in
 delete mode 100644 package/clapack/clapack.hash
 delete mode 100644 package/clapack/clapack.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index aee7e425ef..fdb0369de2 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,15 @@ endif
 
 comment "Legacy options removed in 2021.08"
 
+config BR2_PACKAGE_CLAPACK
+	bool "cblas/clapack package removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_LAPACK if BR2_PACKAGE_LAPACK_ARCH_SUPPORTS && BR2_TOOLCHAIN_HAS_FORTRAN
+	help
+	  The clapack package was removed. LAPACK no longer generates a
+	  C version. Use lapack instead. This does require a Fortran
+	  compilerhowever.
+
 config BR2_PACKAGE_SPIDERMONKEY
 	bool "spidermonkey package removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 596670993a..119c9e0862 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2387,7 +2387,6 @@ F:	package/lrzip/
 N:	Samuel Martin <s.martin49@gmail.com>
 F:	package/armadillo/
 F:	package/canfestival/
-F:	package/clapack/
 F:	package/cwiid/
 F:	package/flite/
 F:	package/nginx/
diff --git a/package/Config.in b/package/Config.in
index 12b1323fc2..f49c700f9c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1880,7 +1880,6 @@ menu "Other"
 	source "package/cctz/Config.in"
 	source "package/cereal/Config.in"
 	source "package/clang/Config.in"
-	source "package/clapack/Config.in"
 	source "package/cmocka/Config.in"
 	source "package/cppcms/Config.in"
 	source "package/cracklib/Config.in"
diff --git a/package/clapack/0001-cmake-force-libf2c-to-be-built-as-a-static-library.patch b/package/clapack/0001-cmake-force-libf2c-to-be-built-as-a-static-library.patch
deleted file mode 100644
index 8fede9da91..0000000000
--- a/package/clapack/0001-cmake-force-libf2c-to-be-built-as-a-static-library.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 4fe2f454e454d9e6b1e83b2ea67581990461ed36 Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Sat, 11 Jan 2014 22:05:25 +0100
-Subject: [PATCH 1/6] cmake: force libf2c to be built as a static library
-
-As stated in INSTALL/LAPACK_version.c, liblapack requires to be linked
-against the static library of libf2c.
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- F2CLIBS/libf2c/CMakeLists.txt | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/F2CLIBS/libf2c/CMakeLists.txt b/F2CLIBS/libf2c/CMakeLists.txt
-index 43d7b3f..f98d66a 100644
---- a/F2CLIBS/libf2c/CMakeLists.txt
-+++ b/F2CLIBS/libf2c/CMakeLists.txt
-@@ -58,5 +58,10 @@ if(WIN32)
- endif()
- include_directories(${CLAPACK_SOURCE_DIR}/F2CLIBS/libf2c)
- include_directories(${CLAPACK_BINARY_DIR}/F2CLIBS/libf2c)
--add_library(f2c ${OFILES} ${CMAKE_CURRENT_BINARY_DIR}/arith.h)
-+add_library(f2c STATIC ${OFILES} ${CMAKE_CURRENT_BINARY_DIR}/arith.h)
- set_property(TARGET f2c PROPERTY PREFIX lib)
-+# Set fPIC on the library when build shared libraries is enabled, because
-+# libf2c.a will most likely be included by some shared libraries in such cases.
-+if(UNIX AND BUILD_SHARED_LIBS)
-+  set_target_properties(f2c PROPERTIES COMPILE_FLAGS "-fPIC")
-+endif()
--- 
-1.8.5.3
-
diff --git a/package/clapack/0002-cmake-make-test-build-sensitive-to-BUILD_TESTING.patch b/package/clapack/0002-cmake-make-test-build-sensitive-to-BUILD_TESTING.patch
deleted file mode 100644
index eac4164f5d..0000000000
--- a/package/clapack/0002-cmake-make-test-build-sensitive-to-BUILD_TESTING.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From 834c221936d9c460b44e3a65b6fedfb3193f491b Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Sat, 11 Jan 2014 21:33:12 +0100
-Subject: [PATCH 2/6] cmake: make test build sensitive to BUILD_TESTING
-
-This patch prevent from wasting time building the tests if it's our
-wish.
-
-The test build takes a significant amount of time, and the binaries
-are not installed.
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- BLAS/TESTING/CMakeLists.txt | 3 +++
- CMakeLists.txt              | 9 ++++++---
- TESTING/CMakeLists.txt      | 4 ++++
- 3 files changed, 13 insertions(+), 3 deletions(-)
-
-diff --git a/BLAS/TESTING/CMakeLists.txt b/BLAS/TESTING/CMakeLists.txt
-index ec2c587..e7dc0b7 100644
---- a/BLAS/TESTING/CMakeLists.txt
-+++ b/BLAS/TESTING/CMakeLists.txt
-@@ -25,6 +25,9 @@
- #       make single FRC=FRC
- #
- #######################################################################
-+if(NOT BUILD_TESTING)
-+  return()
-+endif()
- 
- macro(add_blas_test name src)
-   get_filename_component(baseNAME ${src} NAME_WE)
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 320ccc6..0a362c0 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,6 +1,5 @@
- cmake_minimum_required(VERSION 2.6)
- project(CLAPACK C)
--enable_testing()
- include(CTest)
- 
- if(WIN32 AND NOT CYGWIN)
-@@ -11,7 +10,9 @@ else()
-   set(SECOND_SRC  ${CLAPACK_SOURCE_DIR}/INSTALL/second.c)
-   set(DSECOND_SRC  ${CLAPACK_SOURCE_DIR}/INSTALL/dsecnd.c)
- endif()
--enable_testing()
-+if(NOT BUILD_TESTING)
-+  enable_testing()
-+endif()
- option(USE_BLAS_WRAP "pre-pend f2c_ to each function in blas" OFF)
- if(NOT USE_BLAS_WRAP)
- # _zrotg_ seems to be missing in the wrap header
-@@ -21,7 +22,9 @@ include_directories(${CLAPACK_SOURCE_DIR}/INCLUDE)
- add_subdirectory(F2CLIBS)
- add_subdirectory(BLAS)
- add_subdirectory(SRC)
--add_subdirectory(TESTING)
-+if(NOT BUILD_TESTING)
-+  add_subdirectory(TESTING)
-+endif()
- set(CLAPACK_VERSION 3.2.1)
- set(CPACK_PACKAGE_VERSION_MAJOR 3)
- set(CPACK_PACKAGE_VERSION_MINOR 2)
-diff --git a/TESTING/CMakeLists.txt b/TESTING/CMakeLists.txt
-index d59359d..f6b083a 100644
---- a/TESTING/CMakeLists.txt
-+++ b/TESTING/CMakeLists.txt
-@@ -1,3 +1,7 @@
-+if(NOT BUILD_TESTING)
-+  return()
-+endif()
-+
- if(MSVC_VERSION)
- #  string(REPLACE "/STACK:10000000" "/STACK:900000000000000000"
- #    CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS}")
--- 
-1.8.5.3
-
diff --git a/package/clapack/0003-cmake-do-not-try-to-run-arithchk-when-cross-compilin.patch b/package/clapack/0003-cmake-do-not-try-to-run-arithchk-when-cross-compilin.patch
deleted file mode 100644
index cd9828ff38..0000000000
--- a/package/clapack/0003-cmake-do-not-try-to-run-arithchk-when-cross-compilin.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From a2f0669fac1f8e7183b15cf7d14f0e99a2d8b012 Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Sat, 11 Jan 2014 21:47:39 +0100
-Subject: [PATCH 3/6] cmake: do not try to run arithchk when cross-compiling to
- generate sources
-
-Instead, use a predefined arith.h if provided, or generate a default one.
-
-The arithchk binary is still built (but not installed) to allow the user to
-run it on its target and use it; so then allowing to build an optimized
-blas library.
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- F2CLIBS/libf2c/CMakeLists.txt | 38 ++++++++++++++++++++++++++++----------
- 1 file changed, 28 insertions(+), 10 deletions(-)
-
-diff --git a/F2CLIBS/libf2c/CMakeLists.txt b/F2CLIBS/libf2c/CMakeLists.txt
-index f98d66a..45a0804 100644
---- a/F2CLIBS/libf2c/CMakeLists.txt
-+++ b/F2CLIBS/libf2c/CMakeLists.txt
-@@ -38,17 +38,35 @@ set(TIME dtime_.c etime_.c)
- 
- # For INTEGER*8 support (which requires system-dependent adjustments to
- # f2c.h), add ${QINT} to the OFILES  assignment below...
--add_executable(arithchk arithchk.c)
--if(UNIX)
--  target_link_libraries(arithchk m)
-+if(CMAKE_CROSSCOMPILING)
-+  if(ARITH_H)
-+    message(STATUS "Using the user-defined '${ARITH_H}' as arith.h header.")
-+    configure_file("${ARITH_H}" "${CMAKE_CURRENT_BINARY_DIR}/arith.h" COPYONLY)
-+  else()
-+    message(STATUS "No user-defined arith.h header.")
-+    if(NOT EXISTS "${CMAKE_CURRENT_BINARY_DIR}/arith.h")
-+      message(WARNING "Generating the default non-optimized 'arith.h' header.
-+
-+To generate and provide a custom arith.h header:
-+run the cross-compiled arithchk binary on your target,
-+and use its output to fill your custom arith.h header.")
-+      file(WRITE "${CMAKE_CURRENT_BINARY_DIR}/arith.h"
-+        "/* default, not optimized arith.h */")
-+    endif()
-+  endif()
-+else()
-+  add_executable(arithchk arithchk.c)
-+  if(UNIX)
-+    target_link_libraries(arithchk m)
-+  endif()
-+  set_target_properties(arithchk PROPERTIES COMPILE_DEFINITIONS
-+    "NO_FPINIT;NO_LONG_LONG")
-+  ADD_CUSTOM_COMMAND(
-+     OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/arith.h
-+     COMMAND arithchk > ${CMAKE_CURRENT_BINARY_DIR}/arith.h
-+     DEPENDS arithchk
-+     )
- endif()
--set_target_properties(arithchk PROPERTIES COMPILE_DEFINITIONS 
--  "NO_FPINIT;NO_LONG_LONG")
--ADD_CUSTOM_COMMAND(
--   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/arith.h
--   COMMAND arithchk > ${CMAKE_CURRENT_BINARY_DIR}/arith.h
--   DEPENDS arithchk
--   )
- 
- 
- set(OFILES  ${MISC} ${POW} ${CX} ${DCX} ${REAL} ${DBL} ${INT} 
--- 
-1.8.5.3
-
diff --git a/package/clapack/0004-cmake-blas-add-library-and-header-install-rules.patch b/package/clapack/0004-cmake-blas-add-library-and-header-install-rules.patch
deleted file mode 100644
index e83b066dac..0000000000
--- a/package/clapack/0004-cmake-blas-add-library-and-header-install-rules.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 675111e8ffc179276a7e4950fe4a4eda4d38a703 Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Sat, 11 Jan 2014 21:48:32 +0100
-Subject: [PATCH 4/6] cmake: blas: add library and header install rules
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- BLAS/SRC/CMakeLists.txt | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/BLAS/SRC/CMakeLists.txt b/BLAS/SRC/CMakeLists.txt
-index d1caff8..a5de5a1 100644
---- a/BLAS/SRC/CMakeLists.txt
-+++ b/BLAS/SRC/CMakeLists.txt
-@@ -141,3 +141,5 @@ if(UNIX)
-   target_link_libraries(blas m)
- endif()
- target_link_libraries(blas f2c)
-+install(TARGETS blas LIBRARY DESTINATION lib ARCHIVE DESTINATION lib)
-+install(FILES "${CLAPACK_SOURCE_DIR}/INCLUDE/blaswrap.h" DESTINATION include)
--- 
-1.8.5.3
-
diff --git a/package/clapack/0005-cmake-lapack-add-library-and-header-install-rules.patch b/package/clapack/0005-cmake-lapack-add-library-and-header-install-rules.patch
deleted file mode 100644
index abba460b6c..0000000000
--- a/package/clapack/0005-cmake-lapack-add-library-and-header-install-rules.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 9dfac0d55a31be59a856bad9d3a5071d65176597 Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Sat, 11 Jan 2014 21:49:22 +0100
-Subject: [PATCH 5/6] cmake: lapack: add library and header install rules
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- SRC/CMakeLists.txt | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/SRC/CMakeLists.txt b/SRC/CMakeLists.txt
-index ac4cce3..aa60555 100644
---- a/SRC/CMakeLists.txt
-+++ b/SRC/CMakeLists.txt
-@@ -377,4 +377,5 @@ if(BUILD_COMPLEX16)
- endif()
- add_library(lapack ${ALLOBJ} ${ALLXOBJ})
- target_link_libraries(lapack blas)
--
-+install(TARGETS lapack LIBRARY DESTINATION lib ARCHIVE DESTINATION lib)
-+install(FILES "${CLAPACK_SOURCE_DIR}/INCLUDE/clapack.h" DESTINATION include)
--- 
-1.8.5.3
-
diff --git a/package/clapack/0006-remove-uninit-f2c.patch b/package/clapack/0006-remove-uninit-f2c.patch
deleted file mode 100644
index 83c2c5c75f..0000000000
--- a/package/clapack/0006-remove-uninit-f2c.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-uninit.c includes glibc-specific <fpu_control.h> not provided by musl.
-Somewhat portable replacement is <fenv.h>, which is available in musl
-but requires non-trivial changes to uninit.c.
-
-f2c uses _uninit_f2c() from uninit.c to implement its -trapuv option,
-pre-initializiing floating-point variables to NaN and asking FPU to send
-SIGFPE whenever NaN value is encountered.
-
-clapack source has already been run through f2c without -trapuv,
-so uninit.c code is not used anywhere and can be safely excluded.
-
-Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
-
---- a/F2CLIBS/libf2c/CMakeLists.txt
-+++ b/F2CLIBS/libf2c/CMakeLists.txt
-@@ -1,7 +1,7 @@
- set(MISC 
-   f77vers.c i77vers.c main.c s_rnge.c abort_.c exit_.c getarg_.c iargc_.c
-   getenv_.c signal_.c s_stop.c s_paus.c system_.c cabs.c ctype.c
--  derf_.c derfc_.c erf_.c erfc_.c sig_die.c uninit.c)
-+  derf_.c derfc_.c erf_.c erfc_.c sig_die.c)
- set(POW pow_ci.c pow_dd.c pow_di.c pow_hh.c pow_ii.c pow_ri.c pow_zi.c pow_zz.c)
- set(CX 	c_abs.c c_cos.c c_div.c c_exp.c c_log.c c_sin.c c_sqrt.c)
- set(DCX	z_abs.c z_cos.c z_div.c z_exp.c z_log.c z_sin.c z_sqrt.c)
diff --git a/package/clapack/0007-off64-t.patch b/package/clapack/0007-off64-t.patch
deleted file mode 100644
index bf66d3c95f..0000000000
--- a/package/clapack/0007-off64-t.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-musl only provides off64_t, not __off64_t.
-glibc and uclibc have both defined.
-
-Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
-
---- a/F2CLIBS/libf2c/sysdep1.h
-+++ b/F2CLIBS/libf2c/sysdep1.h
-@@ -10,7 +10,7 @@
- 
- #ifdef __linux__
- #define USE_LARGEFILE
--#define OFF_T __off64_t
-+#define OFF_T off64_t
- #endif
- 
- #ifdef _AIX43
diff --git a/package/clapack/Config.in b/package/clapack/Config.in
deleted file mode 100644
index 98f94b0e60..0000000000
--- a/package/clapack/Config.in
+++ /dev/null
@@ -1,33 +0,0 @@
-config BR2_PACKAGE_CLAPACK_ARCH_SUPPORTS
-	bool
-	default y
-	# assembler: Error: value out of range
-	depends on !BR2_m68k_cf
-	# _fpu_control is used on PowerPC, but not available with
-	# uClibc or musl
-	depends on !BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC
-
-comment "clapack needs a glibc toolchain"
-	depends on BR2_powerpc
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
-
-config BR2_PACKAGE_CLAPACK
-	bool "cblas/clapack"
-	depends on BR2_PACKAGE_CLAPACK_ARCH_SUPPORTS
-	help
-	  BLAS and LAPACK C implementation (f2c'ed version of).
-
-	  http://www.netlib.org/clapack/
-
-config BR2_PACKAGE_CLAPACK_ARITH_H
-	string "Custom BLAS arith.h"
-	depends on BR2_PACKAGE_CLAPACK
-	help
-	  To optimize BLAS library for the hardware, an 'arith.h' header
-	  should be provided.
-
-	  If empty, the library will not be optimized by the compiler.
-
-	  In any case an 'arithchk' program is built
-	  (but not installed), to be run on the target to generate this
-	  arith.h header.
diff --git a/package/clapack/clapack.hash b/package/clapack/clapack.hash
deleted file mode 100644
index ad586fac72..0000000000
--- a/package/clapack/clapack.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# Locally calculated
-sha256 0b3f782bc24845d85f36bafbff0f2f1384dc72df730fda4e7924ec1a70baca5a clapack-3.2.1-CMAKE.tgz
-# License files, locally calculated
-sha256 23014869214a231525b38c39fdb5f82364fa24154ac80fdcab2a79671460fd09 COPYING
-sha256 44561c447e91203ddc747beeca5cc2794d95ee982c17c578670e4f0408bc3904 F2CLIBS/libf2c/Notice
diff --git a/package/clapack/clapack.mk b/package/clapack/clapack.mk
deleted file mode 100644
index 9a083f3223..0000000000
--- a/package/clapack/clapack.mk
+++ /dev/null
@@ -1,22 +0,0 @@
-################################################################################
-#
-# clapack
-#
-################################################################################
-
-CLAPACK_VERSION = 3.2.1
-CLAPACK_SOURCE = clapack-$(CLAPACK_VERSION)-CMAKE.tgz
-# This package provides 3 libraries:
-# - libf2c.a (not installed)
-# - libblas (statically linked with libf2c.a)
-# - liblapack (statically linked with libf2c.a)
-CLAPACK_LICENSE = HPND (libf2c), BSD-3-Clause (libblas and liblapack)
-CLAPACK_LICENSE_FILES = F2CLIBS/libf2c/Notice COPYING
-CLAPACK_SITE = http://www.netlib.org/clapack
-CLAPACK_INSTALL_STAGING = YES
-
-ifneq ($(BR2_PACKAGE_CLAPACK_ARITH_H),)
-CLAPACK_CONF_OPTS += -DARITH_H=$(BR2_PACKAGE_CLAPACK_ARITH_H)
-endif
-
-$(eval $(cmake-package))
diff --git a/package/lapack/Config.in b/package/lapack/Config.in
index e84a19bb45..4e92b49ab6 100644
--- a/package/lapack/Config.in
+++ b/package/lapack/Config.in
@@ -17,7 +17,6 @@ config BR2_PACKAGE_LAPACK
 	bool "lapack/blas"
 	depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_FORTRAN
-	depends on !BR2_PACKAGE_CLAPACK
 	help
 	  LAPACK and BLAS FORTRAN implementation. This package
 	  installs two libraries: libblas and liblapack.
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
