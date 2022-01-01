Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496D8C433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 21:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E378B40184;
	Sat,  1 Jan 2022 21:57:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m3hNL7iqAIIK; Sat,  1 Jan 2022 21:57:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF2D340186;
	Sat,  1 Jan 2022 21:57:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 60C101BF376
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 21:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FC34401FC
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 21:57:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OadqB8PfCin8 for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 21:57:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6201401DD
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 21:57:20 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id o3so4058897wrh.10
 for <buildroot@buildroot.org>; Sat, 01 Jan 2022 13:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=124h5fdX+RLZ4YXw0bxtYEn5IeQnMgzQChcfMfVc/DM=;
 b=Xf5IliVqurB1q/iVhfJMHqKjCLnGY973oDMrks+Ebg9aR/judTAul4dpM2+vyui6ao
 2tx5oKdnbyJzrRZxtBO+7XIbA7VZr7DbPFRlIrqMiSklioDoFzvfIim7xR7unD/LE0p4
 HWNLaNsAnAv4Ohm2X1eTe1RmAKXwnAlQTy4SbrEficHaxZa0S4nZ5hsfHQ5xtHUwfAYa
 jta4rQjk51sf5xe7yeBv4q9wbzS9712o6hr9d9KGDuOira1moJ+jBjOBQawd8hE1C3J9
 OW1cXEUNIpDkiHcIGa2IwTlV84nIyavsOcVlHDH5WKD+dhnfoYam2SYwnzZ4RcsiX/Fx
 bH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=124h5fdX+RLZ4YXw0bxtYEn5IeQnMgzQChcfMfVc/DM=;
 b=DI1zwkIZHbMbFyUvH9HlRFNCPTIZVfSUAblu0s3d2sOqm/FvjlDAomZmvj7mMAfXZJ
 66LPyX/xfY2AMQTdfkPLDieVgxUPEgvvJ0E7WodNyyqicK4kXjJOxg2YFfz8pc6xNiFf
 1pWaGiDHRgaXebV9NU1bqC9FmUpJktw+cI5TkCY9n3zjJ9iDAC6+KQqlHkylGfAGOsqn
 1lFM+V3U/24K5PLUFa1vlb3lnfykM5nlWUklreEGvpHx+RqT2V1zBgf0DtXGy8EE7BXh
 aFlTA2wMsNtU89fzXBiFYuGjcMQgK6B0OV4J/sabO4fe8s+okXrHze3nqxtYM2/JAnfE
 AdeA==
X-Gm-Message-State: AOAM532bUTYN7LNXuM268ki9PFEhKdnuOV+Am445qReSZM5wmZpogO+n
 vQdlg+GsICZ2lGpF02I5wvCxPgwAC3Q=
X-Google-Smtp-Source: ABdhPJxvrb3978qo5zLEYm6+Ey3XMpTp30XmRgzmnn4yCk6OfhxOmJ7q2d+VRp9Gz5hD8E/xxMT5Xg==
X-Received: by 2002:a5d:4e92:: with SMTP id e18mr34371739wru.89.1641074238562; 
 Sat, 01 Jan 2022 13:57:18 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id w11sm30799246wrn.65.2022.01.01.13.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jan 2022 13:57:18 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  1 Jan 2022 22:56:22 +0100
Message-Id: <20220101215622.2013558-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mraa: bump to version 2.2.0
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
 Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Refresh upstream status of first patch
- Drop second patch (already in version)

https://github.com/eclipse/mraa/blob/v2.2.0/docs/changelog.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...de-Declare-gVERSION-global-as-extern.patch |   7 +-
 ...2-CMakeLists.txt-add-BUILDCPP-option.patch | 193 ------------------
 package/mraa/mraa.hash                        |   2 +-
 package/mraa/mraa.mk                          |   2 +-
 4 files changed, 6 insertions(+), 198 deletions(-)
 delete mode 100644 package/mraa/0002-CMakeLists.txt-add-BUILDCPP-option.patch

diff --git a/package/mraa/0001-include-Declare-gVERSION-global-as-extern.patch b/package/mraa/0001-include-Declare-gVERSION-global-as-extern.patch
index b3a1f5a03a..110c020a62 100644
--- a/package/mraa/0001-include-Declare-gVERSION-global-as-extern.patch
+++ b/package/mraa/0001-include-Declare-gVERSION-global-as-extern.patch
@@ -1,13 +1,14 @@
-From dbb5961f106ec42cd70689d933674c9c37aedfe1 Mon Sep 17 00:00:00 2001
+From aaa0a5cd4e401bde4fb3691dd4e6c70a5c61e031 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Bj=C3=B6rn=20Esser?= <besser82@fedoraproject.org>
 Date: Mon, 13 Apr 2020 20:12:11 +0200
 Subject: [PATCH] include: Declare gVERSION global as 'extern'.
 
 Fixes build with '-fno-common'.
 
+Signed-off-by: Thomas Ingleby <thomas.ingleby@intel.com>
 [Retrieved from:
-https://github.com/eclipse/mraa/pull/1012/commits/dbb5961f106ec42cd70689d933674c9c37aedfe1]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmaail.com>
+https://github.com/eclipse/mraa/commit/aaa0a5cd4e401bde4fb3691dd4e6c70a5c61e031]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  include/version.h | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
diff --git a/package/mraa/0002-CMakeLists.txt-add-BUILDCPP-option.patch b/package/mraa/0002-CMakeLists.txt-add-BUILDCPP-option.patch
deleted file mode 100644
index fbadfe79ef..0000000000
--- a/package/mraa/0002-CMakeLists.txt-add-BUILDCPP-option.patch
+++ /dev/null
@@ -1,193 +0,0 @@
-From cb88e4dd1fbbb9d24e625dba2768b88ed99da309 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 13 Jun 2020 22:51:37 +0200
-Subject: [PATCH] CMakeLists.txt: add BUILDCPP option
-
-C++ is a mandatory dependency since version 1.4.0 and
-https://github.com/eclipse/mraa/commit/122cab1f1e53b7c9c7cd82905b962071f9bad9dc
-
-As a result, build on embedded toolchains that do not support C++ fails
-on:
-
-CMake Error at CMakeLists.txt:2 (project):
-  The CMAKE_CXX_COMPILER:
-
-    /home/naourr/work/instance-1/output-1/per-package/mraa/host/bin/arm-linux-g++
-
-  is not a full path to an existing compiler tool.
-
-Fixes:
- - http://autobuild.buildroot.org/results/31086422e03611c16ab59c4418e3669b580bc0c0
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/eclipse/mraa/commit/cb88e4dd1fbbb9d24e625dba2768b88ed99da309]
----
- CMakeLists.txt                | 69 +++++++++++++++++++----------------
- src/java/CMakeLists.txt       |  4 +-
- src/javascript/CMakeLists.txt | 34 +++++++++--------
- 3 files changed, 59 insertions(+), 48 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 250d9106e..90c0dc920 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,5 +1,5 @@
- cmake_minimum_required (VERSION 2.8.11)
--project (mraa C CXX)
-+project (mraa C)
- 
- FIND_PACKAGE (Threads REQUIRED)
- 
-@@ -11,6 +11,8 @@ else ()
-   set (CMAKE_C_STANDARD 99)
- endif ()
- 
-+option (BUILDCPP "Enable C++ (needed by FTDI4222 and tests)" ON)
-+
- ###############################################################################
- # Detect supported warning flags
- # Modified from work By Dan Liew (fpbench - MIT)
-@@ -33,15 +35,18 @@ set (MRAA_C_WARNING_FLAGS
-   -Werror=missing-parameter-type
- )
- 
--# Warning flags for the C++ compiler only
--set (MRAA_CXX_WARNING_FLAGS
--  -Wnon-virtual-dtor
--  -Woverloaded-virtual
--  -Wreorder
--)
--
- include (CheckCCompilerFlag)
--include (CheckCXXCompilerFlag)
-+if (BUILDCPP)
-+  # Warning flags for the C++ compiler only
-+  set (MRAA_CXX_WARNING_FLAGS
-+    -Wnon-virtual-dtor
-+    -Woverloaded-virtual
-+    -Wreorder
-+  )
-+
-+  enable_language (CXX)
-+  include (CheckCXXCompilerFlag)
-+endif ()
- function (MRAA_SANITIZE_FLAG_NAME OUTPUT_VAR FLAG)
-   string (REPLACE "-" "_" SANITIZED_FLAG_NAME "${FLAG}")
-   string (REPLACE "/" "_" SANITIZED_FLAG_NAME "${SANITIZED_FLAG_NAME}")
-@@ -62,28 +67,30 @@ foreach (flag ${MRAA_BOTH_WARNING_FLAGS} ${MRAA_C_WARNING_FLAGS})
-   endif ()
- endforeach ()
- 
--# Globally set C++ compiler warning flags that are supported and emit
--# a warning about unsupported flags
--foreach (flag ${MRAA_BOTH_WARNING_FLAGS} ${MRAA_CXX_WARNING_FLAGS})
--  MRAA_SANITIZE_FLAG_NAME (SANITIZED_FLAG_NAME "${flag}")
--  CHECK_CXX_COMPILER_FLAG ("${flag}" HAS_CXX_${SANITIZED_FLAG_NAME})
--  if (HAS_CXX_${SANITIZED_FLAG_NAME})
--    set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${flag}")
--  else ()
--    message (WARNING "C++ compiler does not support flag \"${flag}\"")
--  endif ()
--endforeach ()
--
--# This function adds the c++11 flag to a c++ target (if supported)
--function(use_cxx_11 targetname)
--  include(CheckCXXCompilerFlag)
--  CHECK_CXX_COMPILER_FLAG("-std=c++11" COMPILER_SUPPORTS_CXX11)
--  if (COMPILER_SUPPORTS_CXX11)
--    set_target_properties(${targetname} PROPERTIES COMPILE_FLAGS "-std=c++11")
--  else()
--    message(FATAL_ERROR "Target '${targetname}' requires c++11 which is not supported by this compiler")
--  endif()
--endfunction()
-+if (BUILDCPP)
-+  # Globally set C++ compiler warning flags that are supported and emit
-+  # a warning about unsupported flags
-+  foreach (flag ${MRAA_BOTH_WARNING_FLAGS} ${MRAA_CXX_WARNING_FLAGS})
-+    MRAA_SANITIZE_FLAG_NAME (SANITIZED_FLAG_NAME "${flag}")
-+    CHECK_CXX_COMPILER_FLAG ("${flag}" HAS_CXX_${SANITIZED_FLAG_NAME})
-+    if (HAS_CXX_${SANITIZED_FLAG_NAME})
-+      set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${flag}")
-+    else ()
-+      message (WARNING "C++ compiler does not support flag \"${flag}\"")
-+    endif ()
-+  endforeach ()
-+
-+  # This function adds the c++11 flag to a c++ target (if supported)
-+  function(use_cxx_11 targetname)
-+    include(CheckCXXCompilerFlag)
-+    CHECK_CXX_COMPILER_FLAG("-std=c++11" COMPILER_SUPPORTS_CXX11)
-+    if (COMPILER_SUPPORTS_CXX11)
-+      set_target_properties(${targetname} PROPERTIES COMPILE_FLAGS "-std=c++11")
-+    else()
-+      message(FATAL_ERROR "Target '${targetname}' requires c++11 which is not supported by this compiler")
-+    endif()
-+  endfunction()
-+endif()
- 
- # Set CMAKE_INSTALL_LIBDIR if not defined
- include(GNUInstallDirs)
-diff --git a/src/java/CMakeLists.txt b/src/java/CMakeLists.txt
-index 231c755fa..cfa72a0df 100644
---- a/src/java/CMakeLists.txt
-+++ b/src/java/CMakeLists.txt
-@@ -16,7 +16,9 @@ include_directories (
- set_source_files_properties (mraajava.i PROPERTIES SWIG_FLAGS ";-package;mraa;-I${CMAKE_BINARY_DIR}/src")
- set_source_files_properties (mraajava.i PROPERTIES CPLUSPLUS ON)
- 
--set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fpermissive -DJAVACALLBACK")
-+if (BUILDCPP)
-+  set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fpermissive -DJAVACALLBACK")
-+endif()
- set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DJAVACALLBACK")
- 
- if (NOT DEFINED ENV{JAVA_HOME_NATIVE})
-diff --git a/src/javascript/CMakeLists.txt b/src/javascript/CMakeLists.txt
-index 25fd36275..99a96b49d 100644
---- a/src/javascript/CMakeLists.txt
-+++ b/src/javascript/CMakeLists.txt
-@@ -36,25 +36,27 @@ set_target_properties (mraajs PROPERTIES
- )
- 
- message (STATUS "INFO - swig Version ${SWIG_VERSION}")
--message (STATUS "INFO - CXX compiler Version ${CMAKE_CXX_COMPILER_ID} ${CMAKE_CXX_COMPILER_VERSION}")
-+if (BUILDCPP)
-+  message (STATUS "INFO - CXX compiler Version ${CMAKE_CXX_COMPILER_ID} ${CMAKE_CXX_COMPILER_VERSION}")
- 
--if (${V8_VERSION_MAJOR} GREATER 3)
--  message (STATUS "INFO - Using V8 version > 3 so requiring C++11 compiler")
--  # Node 0.12.x V8 engine major version is '3'.
--  # Node 2.1.0  V8 engine major version is '4'.
--  set_property (TARGET mraajs PROPERTY CXX_STANDARD 11)
--  set_property (TARGET mraajs PROPERTY CXX_STANDARD_REQUIRED ON)
--  if (CMAKE_VERSION VERSION_LESS "3.1")
--    message (WARNING "Need to use CMAKE version 3.1+, but it is ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}.${CMAKE_PATCH_VERSION}, using a workaround.")
--    if (CMAKE_COMPILER_IS_GNUCXX)
--      if (CMAKE_CXX_COMPILER_VERSION VERSION_LESS "4.7")
--        message (FATAL_ERROR "GNU gcc compiler is also too old (need 4.7+, but ${CMAKE_CXX_COMPILER_VERSION}) and does not support C++11 standard.")
-+  if (${V8_VERSION_MAJOR} GREATER 3)
-+    message (STATUS "INFO - Using V8 version > 3 so requiring C++11 compiler")
-+    # Node 0.12.x V8 engine major version is '3'.
-+    # Node 2.1.0  V8 engine major version is '4'.
-+    set_property (TARGET mraajs PROPERTY CXX_STANDARD 11)
-+    set_property (TARGET mraajs PROPERTY CXX_STANDARD_REQUIRED ON)
-+    if (CMAKE_VERSION VERSION_LESS "3.1")
-+      message (WARNING "Need to use CMAKE version 3.1+, but it is ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}.${CMAKE_PATCH_VERSION}, using a workaround.")
-+      if (CMAKE_COMPILER_IS_GNUCXX)
-+        if (CMAKE_CXX_COMPILER_VERSION VERSION_LESS "4.7")
-+          message (FATAL_ERROR "GNU gcc compiler is also too old (need 4.7+, but ${CMAKE_CXX_COMPILER_VERSION}) and does not support C++11 standard.")
-+        endif ()
-+        set (MRAA_CXX11_WORKAROUND_OPTION "-std=gnu++11")
-+      else ()
-+        set (MRAA_CXX11_WORKAROUND_OPTION "-std=c++11")
-       endif ()
--      set (MRAA_CXX11_WORKAROUND_OPTION "-std=gnu++11")
--    else ()
--      set (MRAA_CXX11_WORKAROUND_OPTION "-std=c++11")
-+      set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${MRAA_CXX11_WORKAROUND_OPTION} ")
-     endif ()
--    set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${MRAA_CXX11_WORKAROUND_OPTION} ")
-   endif ()
- endif ()
- 
diff --git a/package/mraa/mraa.hash b/package/mraa/mraa.hash
index f29a5ce838..321b6409ed 100644
--- a/package/mraa/mraa.hash
+++ b/package/mraa/mraa.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5351ce9eb654014d8ea7f43bdb2d17e6d1955536938a2ea0d467f4008e614345  mraa-2.1.0.tar.gz
+sha256  076669bee8423ffef3065735b293a329020be86630fea457174dbfcc67a0554a  mraa-2.2.0.tar.gz
 sha256  fac52622ed3badd86b34857b21777ab90296d6ccbc2ac0fd457c09fdeefa9ef1  COPYING
diff --git a/package/mraa/mraa.mk b/package/mraa/mraa.mk
index 910339b386..47178a423b 100644
--- a/package/mraa/mraa.mk
+++ b/package/mraa/mraa.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MRAA_VERSION = 2.1.0
+MRAA_VERSION = 2.2.0
 MRAA_SITE = $(call github,eclipse,mraa,v$(MRAA_VERSION))
 MRAA_LICENSE = MIT
 MRAA_LICENSE_FILES = COPYING
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
