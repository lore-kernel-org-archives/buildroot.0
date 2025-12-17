Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6FDD66B9D
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 19:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47F1B6069F;
	Wed, 17 Dec 2025 19:32:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mKEwkjaToMTu; Wed, 17 Dec 2025 19:32:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 401BA6071D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765999970;
	bh=bqhfW8pbrw0BV6oxphdyGL4mLQBaL/VYCKb5g/2RbbY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=aWUbET7gHV6HkWoOgbhr+wpQGUbclVizxGkc1fIyXp4E40PzGtVDgFXVQLoSPxWa3
	 nFMM1ExglvuLHHBC4/Li/cmvCjfNgCKnG6LgpluksvnVvLvD3YR+NMDLiNtygM/iHA
	 D0K7wVYjZYBrHbgqZU6ppl6FNMKF4NtFAMBP6lgUh9+ZJFvkugFWyWrY6dw8/7vQFi
	 r4gN8hTUNZtn67uw0zzEbXH3pkGO7xjF0o4JfAQ73woAbm0S1ge3+mbm/PyxtnFI6k
	 iq7h/wgSnFQHILbC+v6DHZhH8dhDVy0QaBuqGLfLdJt42TQu8h0fWjY18HAAzAaKMO
	 D+FD+d2eEcjfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 401BA6071D;
	Wed, 17 Dec 2025 19:32:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D1970361
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 19:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B83A64044F
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 19:32:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZeXScrRWXQ8H for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 19:32:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 97DB540418
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97DB540418
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97DB540418
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 19:32:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6455FA4C1323;
 Wed, 17 Dec 2025 20:32:45 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39338)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVxGO-000000002R2-31CS;
 Wed, 17 Dec 2025 19:32:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 20:32:43 +0100
Message-ID: <20251217193244.3770538-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765999965;
 bh=XbbybOCURkHLDHNJAD6Q73UjRKLqVydZdoPUqQjxb78=;
 h=From:To:Cc:Subject:Date:From;
 b=rmu5bGIpyjq6sDBXgODsTDlVTJpbnS3iviAa45iXucOK0NPkhix6oUTI1Yr0PlEAf
 2t9tbjB2ri2Ks0Ub9fmFM/SkHofxIh1rHBQ5Eh3XGqU7TjTjjKZ/ADthN1u1TIYWO0
 GJsO4liNtieohxhKC7LR0KCSpsacT1Zmp1jtdz7JX9wwf9gXHRepNLs1auZgtdbpko
 M5vaS8L36xQo0ZV3xWoyDrJtF5ipbS3fFOqIdcc/EbMJGid/xe+c1OkI6d0BE6tFQK
 ngzhH0Ljbyfej2w+f7BuimY3Nu5l0gAHKyN83y7xKKBxASUIES48LjqHMg0HYkpCh1
 cZvEm+WtnhIwg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=rmu5bGIp
Subject: [Buildroot] [PATCH 1/2] package/znc: Fix build with SWIG 4.4
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
Cc: =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../znc/0001-Fix-build-with-SWIG-4.4.patch    | 150 ++++++++++++++++++
 1 file changed, 150 insertions(+)
 create mode 100644 package/znc/0001-Fix-build-with-SWIG-4.4.patch

diff --git a/package/znc/0001-Fix-build-with-SWIG-4.4.patch b/package/znc/0001-Fix-build-with-SWIG-4.4.patch
new file mode 100644
index 0000000000..58f8f9cf1f
--- /dev/null
+++ b/package/znc/0001-Fix-build-with-SWIG-4.4.patch
@@ -0,0 +1,150 @@
+From e39adff11522e43468627aec8d315224e3057df3 Mon Sep 17 00:00:00 2001
+From: Dominique Leuenberger <dimstar@opensuse.org>
+Date: Tue, 2 Dec 2025 11:10:27 +0100
+Subject: [PATCH] Fix build with SWIG 4.4
+
+SWIG 4.4 has dropped the usage of SWIG_NULLPTR again, which means we can't
+rely on its presence to identify SWIG >= 4.2.0
+
+Generate a swig_version.h by parsing the output of `swig -version` and
+writing this in a hex representation
+
+Fixes #1979
+
+Upstream: https://github.com/znc/znc/commit/49af1c8d53031e83877d3a378682dee9b834123b
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ modules/modpython/CMakeLists.txt              | 17 ++++--
+ modules/modpython/codegen.pl                  |  9 ++--
+ modules/modpython/generate_swig_version.cmake | 53 +++++++++++++++++++
+ 3 files changed, 71 insertions(+), 8 deletions(-)
+ create mode 100644 modules/modpython/generate_swig_version.cmake
+
+diff --git a/modules/modpython/CMakeLists.txt b/modules/modpython/CMakeLists.txt
+index e65cc8607c..7184f42ff3 100644
+--- a/modules/modpython/CMakeLists.txt
++++ b/modules/modpython/CMakeLists.txt
+@@ -29,6 +29,17 @@ if(APPLE)
+ endif()
+ 
+ if(SWIG_FOUND)
++	set(SWIG_VERSION_HEADER "${CMAKE_CURRENT_BINARY_DIR}/swig_version.h")
++
++	add_custom_command(
++	    OUTPUT "${SWIG_VERSION_HEADER}"
++	    COMMAND ${CMAKE_COMMAND}
++	            -DSWIG_EXECUTABLE=${SWIG_EXECUTABLE}
++	            -DSWIG_VERSION_HEADER=${SWIG_VERSION_HEADER}
++	            -P "${CMAKE_CURRENT_SOURCE_DIR}/generate_swig_version.cmake"
++	    DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/generate_swig_version.cmake"
++	)
++
+ 	add_custom_command(
+ 		OUTPUT "pyfunctions.cpp"
+ 		COMMAND "${PERL_EXECUTABLE}"
+@@ -36,7 +47,7 @@ if(SWIG_FOUND)
+ 		"${CMAKE_CURRENT_SOURCE_DIR}/functions.in"
+ 		"pyfunctions.cpp"
+ 		VERBATIM
+-		DEPENDS codegen.pl functions.in)
++		DEPENDS codegen.pl functions.in "${SWIG_VERSION_HEADER}")
+ 
+ 	add_custom_command(
+ 		OUTPUT "swigpyrun.h"
+@@ -98,7 +109,7 @@ endfunction()
+ add_custom_target(modpython_dist
+ 	COMMAND "${CMAKE_COMMAND}" -E tar cz
+ 	"${CMAKE_CURRENT_SOURCE_DIR}/generated.tar.gz"
+-	"swigpyrun.h" "znc_core.py" "modpython_biglib.cpp" "pyfunctions.cpp"
+-	DEPENDS swigpyrun.h znc_core.py modpython_biglib.cpp pyfunctions.cpp
++	"swigpyrun.h" "znc_core.py" "modpython_biglib.cpp" "pyfunctions.cpp" "${SWIG_VERSION_HEADER}"
++	DEPENDS swigpyrun.h znc_core.py modpython_biglib.cpp pyfunctions.cpp "${SWIG_VERSION_HEADER}"
+ 	VERBATIM)
+ add_dependencies(modpython_dist copy_csocket_h)
+diff --git a/modules/modpython/codegen.pl b/modules/modpython/codegen.pl
+index 1f01dd8124..bbd8e2d588 100755
+--- a/modules/modpython/codegen.pl
++++ b/modules/modpython/codegen.pl
+@@ -49,6 +49,8 @@
+  * Don't change it manually.                                               *
+  ***************************************************************************/
+ 
++#include "swig_version.h"
++
+ namespace {
+ 	inline swig_type_info* ZNC_SWIG_pchar_descriptor(void) {
+ 		static int init = 0;
+@@ -60,11 +62,8 @@
+ 		return info;
+ 	}
+ 
+-// SWIG 4.2.0 replaced SWIG_Python_str_AsChar with SWIG_PyUnicode_AsUTF8AndSize.
+-// SWIG doesn't provide any good way to detect SWIG version (other than parsing
+-// `swig -version`), but it also introduced SWIG_NULLPTR in 4.2.0.
+-// So let's abuse that define to do different code for new SWIG.
+-#ifdef SWIG_NULLPTR
++// SWIG_VERSION is defined as 0x040200 for 4.2.0.
++#if defined(SWIG_VERSION) && SWIG_VERSION >= 0x040200
+ 	// This is copied/adapted from SWIG 4.2.0 from pystrings.swg
+ 	inline int ZNC_SWIG_AsCharPtrAndSize(PyObject *obj, char** cptr, size_t* psize, int *alloc) {
+ #if PY_VERSION_HEX>=0x03000000
+diff --git a/modules/modpython/generate_swig_version.cmake b/modules/modpython/generate_swig_version.cmake
+new file mode 100644
+index 0000000000..2d52501c62
+--- /dev/null
++++ b/modules/modpython/generate_swig_version.cmake
+@@ -0,0 +1,53 @@
++# generate_swig_version.cmake
++execute_process(
++    COMMAND ${SWIG_EXECUTABLE} -version
++    OUTPUT_VARIABLE SWIG_OUTPUT
++    ERROR_VARIABLE SWIG_ERROR
++    OUTPUT_STRIP_TRAILING_WHITESPACE
++    ERROR_STRIP_TRAILING_WHITESPACE
++)
++
++set(FULL_OUTPUT "${SWIG_OUTPUT}\n${SWIG_ERROR}")
++
++string(REGEX MATCH "SWIG Version ([0-9]+)\\.([0-9]+)\\.([0-9]+)" MATCH_FOUND "${FULL_OUTPUT}")
++
++if(MATCH_FOUND)
++    # Extract capture groups
++    set(SWIG_VERSION_MAJOR ${CMAKE_MATCH_1})
++    set(SWIG_VERSION_MINOR ${CMAKE_MATCH_2})
++    set(SWIG_VERSION_PATCH ${CMAKE_MATCH_3})
++
++    message(STATUS "Found SWIG Version: ${SWIG_VERSION_MAJOR}.${SWIG_VERSION_MINOR}.${SWIG_VERSION_PATCH}")
++
++    # Format: 0x<MAJ><MIN><PATCH> (assuming 8 bits per component)
++    # Calculation: (Major << 16) | (Minor << 8) | Patch
++
++    math(EXPR VERSION_NUM
++        "(${SWIG_VERSION_MAJOR} << 16) + (${SWIG_VERSION_MINOR} << 8) + ${SWIG_VERSION_PATCH}"
++        OUTPUT_FORMAT HEXADECIMAL
++    )
++
++    set(HEADER_FILE "swig_version.h")
++
++    file(WRITE ${SWIG_VERSION_HEADER}
++"// Auto-generated by CMake
++#ifndef SWIG_VERSION_META_H
++#define SWIG_VERSION_META_H
++
++#define SWIG_VERSION_MAJOR ${SWIG_VERSION_MAJOR}
++#define SWIG_VERSION_MINOR ${SWIG_VERSION_MINOR}
++#define SWIG_VERSION_PATCH ${SWIG_VERSION_PATCH}
++
++// Hex format 0xMAJMINPAT (e.g. 4.1.0 -> 0x40100)
++#define SWIG_VERSION  ${VERSION_NUM}
++
++#endif // SWIG_VERSION_META_H
++"
++    )
++
++    message(STATUS "Generated ${HEADER_FILE} with version ${VERSION_NUM}")
++
++else()
++    message(WARNING "Could not parse SWIG version from output:\n${FULL_OUTPUT}")
++endif()
++
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
