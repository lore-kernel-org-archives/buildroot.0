Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0136EC4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 12:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2045400A4;
	Mon,  5 Dec 2022 12:17:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2045400A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GIo8FSGOEuDv; Mon,  5 Dec 2022 12:17:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B312404F5;
	Mon,  5 Dec 2022 12:17:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B312404F5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 04C431BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EAC64055E
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EAC64055E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3kRJeWD6xT2F for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5834405EF
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5834405EF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DEA0585B9E; Mon,  5 Dec 2022 11:26:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 14 Nov 2022 23:15:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f96a4463074e3061e5b080fb7ba65a7e085b184d
X-Git-Newrev: 96b9a589ea43fdf895930471d9031e52fc16eb7b
X-Patchwork-Hint: ignore
Message-Id: <20221205112609.DEA0585B9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-mediadriver: bump version to
 22.6.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=96b9a589ea43fdf895930471d9031e52fc16eb7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replaced patches with upstream patch which fixes both problems.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../intel-mediadriver/0001-Fix-uClibc-build.patch  |  65 ---------
 ...d-check-for-backtrace-3-via-FindBacktrace.patch | 150 +++++++++++++++++++++
 .../0002-Fix-build-with-libexecinfo.patch          |  43 ------
 package/intel-mediadriver/intel-mediadriver.hash   |   2 +-
 package/intel-mediadriver/intel-mediadriver.mk     |   2 +-
 5 files changed, 152 insertions(+), 110 deletions(-)

diff --git a/package/intel-mediadriver/0001-Fix-uClibc-build.patch b/package/intel-mediadriver/0001-Fix-uClibc-build.patch
deleted file mode 100644
index 97919d0632..0000000000
--- a/package/intel-mediadriver/0001-Fix-uClibc-build.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 2007edc683499d2e82772f84241b453bdf319372 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Fri, 29 Jul 2022 19:51:39 +0200
-Subject: [PATCH] Fix uClibc build
-
-uClibc does not provide execinfo.h
-
-Patch sent upstream: https://github.com/intel/media-driver/pull/1437
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- CMakeLists.txt                                              | 6 ++++++
- .../linux/common/os/osservice/mos_utilities_specific.cpp    | 4 ++++
- 2 files changed, 10 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 053904748..4a3f0869e 100755
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -53,6 +53,12 @@ option (BUILD_CMRTLIB "Build and Install cmrtlib together with media driver" ON)
- 
- option (ENABLE_PRODUCTION_KMD "Enable Production KMD header files" OFF)
- 
-+include(CheckIncludeFileCXX)
-+check_include_file_cxx("execinfo.h" HAVE_EXECINFO)
-+if (HAVE_EXECINFO)
-+    add_definitions(-DHAVE_EXECINFO)
-+endif()
-+
- include(GNUInstallDirs)
- 
- if (BUILD_CMRTLIB AND NOT CMAKE_WDDM_LINUX)
-diff --git a/media_softlet/linux/common/os/osservice/mos_utilities_specific.cpp b/media_softlet/linux/common/os/osservice/mos_utilities_specific.cpp
-index bde216b83..120b02d55 100644
---- a/media_softlet/linux/common/os/osservice/mos_utilities_specific.cpp
-+++ b/media_softlet/linux/common/os/osservice/mos_utilities_specific.cpp
-@@ -34,7 +34,9 @@
- #include <signal.h>
- #include <unistd.h>  // fork
- #include <algorithm>
-+#ifdef HAVE_EXECINFO
- #include <execinfo.h> // backtrace
-+#endif
- #include <sys/types.h>
- #include <sys/stat.h>  // fstat
- #include <sys/ipc.h>  // System V IPC
-@@ -2473,6 +2475,7 @@ void MosUtilities::MosTraceEvent(
-                 MOS_FreeMemory(pTraceBuf);
-             }
-         }
-+#ifdef HAVE_EXECINFO
-         if (m_mosTraceFilter & (1ULL << TR_KEY_CALL_STACK))
-         {
-             // reserve space for header and stack size field.
-@@ -2492,6 +2495,7 @@ void MosUtilities::MosTraceEvent(
-                 size_t ret = write(MosUtilitiesSpecificNext::m_mosTraceFd, traceBuf, nLen);
-             }
-         }
-+#endif
-     }
-     return;
- }
--- 
-2.30.2
-
diff --git a/package/intel-mediadriver/0001-build-check-for-backtrace-3-via-FindBacktrace.patch b/package/intel-mediadriver/0001-build-check-for-backtrace-3-via-FindBacktrace.patch
new file mode 100644
index 0000000000..46d843924e
--- /dev/null
+++ b/package/intel-mediadriver/0001-build-check-for-backtrace-3-via-FindBacktrace.patch
@@ -0,0 +1,150 @@
+From 08ad0e3da9f9ab48e423d0aea2af9605190aafe7 Mon Sep 17 00:00:00 2001
+From: Dmitry Rogozhkin <dmitry.v.rogozhkin@intel.com>
+Date: Mon, 31 Oct 2022 16:41:43 -0700
+Subject: [PATCH] build: check for backtrace(3) via FindBacktrace
+
+Fixes: #1533
+
+Change-Id: I81bcdb5e65c26f94b174af9b5e6218c14601c50f
+Signed-off-by: Dmitry Rogozhkin <dmitry.v.rogozhkin@intel.com>
+
+Downloaded from upstream PR:
+https://github.com/intel/media-driver/pull/1536
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ media_driver/media_top_cmake.cmake            | 11 +++++-
+ .../common/os/osservice/media_srcs.cmake      |  3 ++
+ .../linux/common/os/osservice/mos_compat.h.in | 35 +++++++++++++++++++
+ .../os/osservice/mos_utilities_specific.cpp   |  4 ++-
+ 4 files changed, 51 insertions(+), 2 deletions(-)
+ create mode 100644 media_softlet/linux/common/os/osservice/mos_compat.h.in
+
+diff --git a/media_driver/media_top_cmake.cmake b/media_driver/media_top_cmake.cmake
+index 1a8b3b242..e71c8630d 100755
+--- a/media_driver/media_top_cmake.cmake
++++ b/media_driver/media_top_cmake.cmake
+@@ -22,6 +22,10 @@ project( media )
+ 
+ find_package(PkgConfig)
+ find_package(X11)
++find_package(Backtrace)
++
++# to get access to generated header files
++include_directories(${CMAKE_BINARY_DIR})
+ 
+ bs_set_if_undefined(LIB_NAME iHD_drv_video)
+ 
+@@ -381,10 +385,15 @@ set_target_properties(${LIB_NAME} PROPERTIES LINK_FLAGS ${MEDIA_LINK_FLAGS})
+ set_target_properties(${LIB_NAME}        PROPERTIES PREFIX "")
+ set_target_properties(${LIB_NAME_STATIC} PROPERTIES PREFIX "")
+ 
++set(MEDIA_LINK_EXTERNAL_LIBS "${PKG_PCIACCESS_LIBRARIES} m pthread dl")
++if(Backtrace_FOUND)
++    set(MEDIA_LINK_EXTERNAL_LIBS "${MEDIA_LINK_EXTERNAL_LIBS} ${Backtrace_LIBRARY}")
++endif()
++
+ bs_ufo_link_libraries_noBsymbolic(
+     ${LIB_NAME}
+     "${INCLUDED_LIBS}"
+-    "${PKG_PCIACCESS_LIBRARIES} m pthread dl"
++    "${MEDIA_LINK_EXTERNAL_LIBS}"
+ )
+ 
+ if (NOT DEFINED INCLUDED_LIBS OR "${INCLUDED_LIBS}" STREQUAL "")
+diff --git a/media_softlet/linux/common/os/osservice/media_srcs.cmake b/media_softlet/linux/common/os/osservice/media_srcs.cmake
+index e90c502f3..4e8aad1d8 100644
+--- a/media_softlet/linux/common/os/osservice/media_srcs.cmake
++++ b/media_softlet/linux/common/os/osservice/media_srcs.cmake
+@@ -18,12 +18,15 @@
+ # ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ # OTHER DEALINGS IN THE SOFTWARE.
+ 
++configure_file(${CMAKE_CURRENT_LIST_DIR}/mos_compat.h.in ${CMAKE_BINARY_DIR}/mos_compat.h)
++
+ set(TMP_SOURCES_
+     ${CMAKE_CURRENT_LIST_DIR}/mos_util_debug_specific.cpp
+     ${CMAKE_CURRENT_LIST_DIR}/mos_utilities_specific.cpp
+ )
+ 
+ set(TMP_HEADERS_
++    ${CMAKE_BINARY_DIR}/mos_compat.h
+     ${CMAKE_CURRENT_LIST_DIR}/mos_utilities_specific.h
+     ${CMAKE_CURRENT_LIST_DIR}/mos_util_debug_specific.h
+ )
+diff --git a/media_softlet/linux/common/os/osservice/mos_compat.h.in b/media_softlet/linux/common/os/osservice/mos_compat.h.in
+new file mode 100644
+index 000000000..4a04febe5
+--- /dev/null
++++ b/media_softlet/linux/common/os/osservice/mos_compat.h.in
+@@ -0,0 +1,35 @@
++/*
++* Copyright (c) 2022, Intel Corporation
++*
++* Permission is hereby granted, free of charge, to any person obtaining a
++* copy of this software and associated documentation files (the "Software"),
++* to deal in the Software without restriction, including without limitation
++* the rights to use, copy, modify, merge, publish, distribute, sublicense,
++* and/or sell copies of the Software, and to permit persons to whom the
++* Software is furnished to do so, subject to the following conditions:
++*
++* The above copyright notice and this permission notice shall be included
++* in all copies or substantial portions of the Software.
++*
++* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
++* OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
++* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
++* THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
++* OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
++* ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
++* OTHER DEALINGS IN THE SOFTWARE.
++*/
++
++#ifndef __MOS_COMPAT_H__
++#define __MOS_COMPAT_H__
++
++// clib implementations (musl, uClibc) might provide backtrace(3)
++// in different header files or not provide it all and rely on external
++// implementations. So, we need to detect which header to be used.
++#cmakedefine01 Backtrace_FOUND
++#if Backtrace_FOUND
++#include <${Backtrace_HEADER}>
++#endif
++
++#endif // __MOS_COMPAT_H__
++
+diff --git a/media_softlet/linux/common/os/osservice/mos_utilities_specific.cpp b/media_softlet/linux/common/os/osservice/mos_utilities_specific.cpp
+index 305a0e01c..02555837a 100644
+--- a/media_softlet/linux/common/os/osservice/mos_utilities_specific.cpp
++++ b/media_softlet/linux/common/os/osservice/mos_utilities_specific.cpp
+@@ -34,13 +34,13 @@
+ #include <signal.h>
+ #include <unistd.h>  // fork
+ #include <algorithm>
+-#include <execinfo.h> // backtrace
+ #include <sys/types.h>
+ #include <sys/stat.h>  // fstat
+ #include <sys/ipc.h>  // System V IPC
+ #include <sys/types.h>
+ #include <sys/sem.h>
+ #include <sys/mman.h>
++#include "mos_compat.h" // libc variative definitions: backtrace
+ #include "mos_user_setting.h"
+ #include "mos_utilities_specific.h"
+ #include "mos_utilities.h"
+@@ -2492,6 +2492,7 @@ void MosUtilities::MosTraceEvent(
+                 MOS_FreeMemory(pTraceBuf);
+             }
+         }
++#if Backtrace_FOUND
+         if (m_mosTraceFilter(TR_KEY_CALL_STACK))
+         {
+             // reserve space for header and stack size field.
+@@ -2511,6 +2512,7 @@ void MosUtilities::MosTraceEvent(
+                 size_t ret = write(MosUtilitiesSpecificNext::m_mosTraceFd, traceBuf, nLen);
+             }
+         }
++#endif
+     }
+     return;
+ }
diff --git a/package/intel-mediadriver/0002-Fix-build-with-libexecinfo.patch b/package/intel-mediadriver/0002-Fix-build-with-libexecinfo.patch
deleted file mode 100644
index 3a6705f2b8..0000000000
--- a/package/intel-mediadriver/0002-Fix-build-with-libexecinfo.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From c5177d6fc64ad8bc25c8fbbe324e52744ef52e18 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 12 Aug 2022 09:50:33 +0200
-Subject: [PATCH] Fix build with libexecinfo
-
-Fix the following build failure with musl or uclibc-ng and libexecinfo:
-
-/home/giuliobenetti/autobuild/run/instance-2/output-1/build/intel-mediadriver-22.5.1/media_softlet/linux/common/os/osservice/mos_utilities_specific.cpp:2481: undefined reference to `backtrace'
-
-Fixes:
- - http://autobuild.buildroot.org/results/3316e39c5113bb7600374eda45497a87c9ac9873
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/intel/media-driver/pull/1470]
----
- media_driver/media_top_cmake.cmake | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/media_driver/media_top_cmake.cmake b/media_driver/media_top_cmake.cmake
-index 0e19a47c9..936d8c35a 100755
---- a/media_driver/media_top_cmake.cmake
-+++ b/media_driver/media_top_cmake.cmake
-@@ -271,10 +271,16 @@ set_target_properties(${LIB_NAME} PROPERTIES LINK_FLAGS ${MEDIA_LINK_FLAGS})
- set_target_properties(${LIB_NAME}        PROPERTIES PREFIX "")
- set_target_properties(${LIB_NAME_STATIC} PROPERTIES PREFIX "")
- 
-+set(MEDIA_LINK_EXTERNAL_LIBS "${PKG_PCIACCESS_LIBRARIES} m pthread dl")
-+find_package(Backtrace)
-+if(Backtrace_FOUND)
-+    set(MEDIA_LINK_EXTERNAL_LIBS "${MEDIA_LINK_EXTERNAL_LIBS} ${Backtrace_LIBRARY}")
-+endif()
-+
- bs_ufo_link_libraries_noBsymbolic(
-     ${LIB_NAME}
-     "${INCLUDED_LIBS}"
--    "${PKG_PCIACCESS_LIBRARIES} m pthread dl"
-+    "${MEDIA_LINK_EXTERNAL_LIBS}"
- )
- 
- if (NOT DEFINED INCLUDED_LIBS OR "${INCLUDED_LIBS}" STREQUAL "")
--- 
-2.35.1
-
diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index d1698cbfb5..a42a7841d5 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bee655102b0c56ea3eee6e8d1d203a67bf7e0c4696ebde2b8ae40067eb12b23f  intel-media-22.6.0.tar.gz
+sha256  a59c4c9facf567ccbea3aab36b150d961c56e48461283a2aa7c438a311b4d2d0  intel-media-22.6.2.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index d1a9ca7789..e46241ffee 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 22.6.0
+INTEL_MEDIADRIVER_VERSION = 22.6.2
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
