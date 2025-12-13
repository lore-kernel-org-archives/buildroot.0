Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7525FD59F76
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 14:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C37281445;
	Sat, 13 Dec 2025 14:31:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qfh_21U8NTJ8; Sat, 13 Dec 2025 14:31:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 327C181C58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765636311;
	bh=gO2GRV/UOy7nZGlIYAvC26H5RzEExGnDTPUnnUaSsio=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z58GSsDniWcjoVykns7fKfxQLt8aLIbSIfURbQ6TifYN073HU57D/eDlWaIhodUhB
	 8jNGDwo9luaFfVI5Zy8H7ASxQCm2fNd5FqWocC/f4+MRKLaUUWRuoma4b3irX75Iel
	 jDWbFSNzowmfLerigzPBvdiQct8cfZtxiKrCgl5qlg1/Gr9u0YxltBjd9qzyXoGpSi
	 SXtuyyrvCf18osS2wUADrPte3ChR3tuIONqtuPcwjL6A42eAhwblORS67f05z3wmsW
	 LCQMyfDxEUSrafJjRrKlz2WTFxYEO6JSvhcdtDPoYBHC5pEYquzQ8/1xtOkX5yIR1x
	 EWOyDhwJVvePQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 327C181C58;
	Sat, 13 Dec 2025 14:31:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F032E7
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 018614078F
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:31:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KBXjc5fXURKS for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 14:31:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C510340785
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C510340785
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C510340785
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:31:48 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc21.dip0.t-ipconnect.de [79.214.204.33])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 305BEA4C4079
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 15:30:16 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56096)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUQdN-000000000dj-3QjK
 for buildroot@buildroot.org; Sat, 13 Dec 2025 14:30:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 15:29:59 +0100
Message-ID: <20251213143008.1329736-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251213143008.1329736-1-bernd@kuhls.net>
References: <20251213143008.1329736-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765636216;
 bh=Y0Ulkep+B2GGvdfyKz+NmnLiSg9s4xYkSEb2PdpxJNg=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=lSuseGz7GY4RXyFrEZ8NPwvhbK1hkA6xakKiqsfxSFRFMb9/eLDR0bSlBWahOCd0n
 8D7YeLbL10KqMfkKZM9Uf2UOU5Ipuftzbf35UrCb5kUtgCXkke82RDYWEckRVLaTiK
 siuI9hneQhprslefzoWYVn7m5XA52/MnaSGkvTUmm246vtwy1Zsw55O8zils+7nlFt
 5Su9pwio1pkOsMaY9nfthVWyirpfQSTMXq2NzqsUQbj/7WDrQQO620wFlLyCDLYjBX
 pez1CWzpxwFFUM6Ir0MDAvumaxS1nZ/eRlRwkDlzDq1c4uSVjG6fz0ppvZtkWGqHlv
 lWAojzlQK6NOQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=lSuseGz7
Subject: [Buildroot] [PATCH 08/16] package/libiqrf: remove package
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

Fails to build with cmake 4.

The package is a library without any reverse dependencies and no active
development since 2013.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  2 -
 Config.in.legacy                              |  6 +++
 package/Config.in                             |  1 -
 ...tic-library-and-find-required-thread.patch | 45 -------------------
 .../libiqrf/0002-use-only-c-language.patch    | 29 ------------
 package/libiqrf/Config.in                     | 16 -------
 package/libiqrf/libiqrf.hash                  |  3 --
 package/libiqrf/libiqrf.mk                    | 14 ------
 8 files changed, 6 insertions(+), 110 deletions(-)
 delete mode 100644 package/libiqrf/0001-cmake-handle-static-library-and-find-required-thread.patch
 delete mode 100644 package/libiqrf/0002-use-only-c-language.patch
 delete mode 100644 package/libiqrf/Config.in
 delete mode 100644 package/libiqrf/libiqrf.hash
 delete mode 100644 package/libiqrf/libiqrf.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index 09f3946e3d..e669d3e5cc 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -550,8 +550,6 @@ package/libgsm/0001-Misc-fixes-from-Archlinux.patch lib_patch.Upstream
 package/libgtk3/0001-Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch lib_patch.Upstream
 package/libhdhomerun/0001-dont-strip.patch lib_patch.Upstream
 package/libiio/S99iiod Shellcheck lib_sysv.Variables
-package/libiqrf/0001-cmake-handle-static-library-and-find-required-thread.patch lib_patch.Upstream
-package/libiqrf/0002-use-only-c-language.patch lib_patch.Upstream
 package/libjson/0001-fix-broken-makefile.patch lib_patch.Upstream
 package/libks/0001-CMakeLists.txt-honour-BUILD_TESTING.patch lib_patch.Upstream
 package/liblinear/0001-build-static-lib.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index a205e999e1..9b34b71202 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_LIBIQRF
+	bool "libiqrf has been removed"
+	select BR2_LEGACY
+	help
+	  libiqrf is unmaintained and has been removed
+
 config BR2_PACKAGE_LIBCGI
 	bool "libcgi has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 2ad6bbbe2d..db938863f6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1834,7 +1834,6 @@ menu "Hardware handling"
 	source "package/libgudev/Config.in"
 	source "package/libiio/Config.in"
 	source "package/libinput/Config.in"
-	source "package/libiqrf/Config.in"
 	source "package/libllcp/Config.in"
 	source "package/libmbim/Config.in"
 	source "package/libnfc/Config.in"
diff --git a/package/libiqrf/0001-cmake-handle-static-library-and-find-required-thread.patch b/package/libiqrf/0001-cmake-handle-static-library-and-find-required-thread.patch
deleted file mode 100644
index 7f460c131e..0000000000
--- a/package/libiqrf/0001-cmake-handle-static-library-and-find-required-thread.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 46660112b76664473cc98b8ae6c863fd27c27d2d Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Fri, 29 Aug 2014 23:40:59 +0200
-Subject: [PATCH] cmake: handle static library and find required thread
- module
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- CMakeLists.txt     | 2 ++
- src/CMakeLists.txt | 4 +++-
- 2 files changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 79f644c..7779a2a 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -6,7 +6,9 @@ enable_testing()
- # use local module (for Findlibusb-1.0.cmake)
- set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/Modules/")
- 
-+find_package(Threads REQUIRED)
- find_package(libusb-1.0 REQUIRED)
-+
- if (NOT LIBUSB_1_FOUND)
- 	message(FATAL_ERROR "libusb-1.0 not installed. (try apt-get install libusb-1.0-0-dev)")
- endif (NOT LIBUSB_1_FOUND)
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 149d198..0597ccd 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -18,8 +18,10 @@ set (iqrf_sources
- 
- include_directories ("${LIBUSB_1_INCLUDE_DIRS}")
- 
--add_library(iqrf SHARED ${iqrf_sources} ${iqrf_headers})
-+add_library(iqrf ${iqrf_sources} ${iqrf_headers})
-+
- target_link_libraries(iqrf ${LIBUSB_1_LIBRARIES})
-+target_link_libraries(iqrf ${CMAKE_THREAD_LIBS_INIT})
- 
- set_target_properties(iqrf PROPERTIES
- 	VERSION "${iqrf_version_major}.${iqrf_version_minor}"
--- 
-2.1.0
-
diff --git a/package/libiqrf/0002-use-only-c-language.patch b/package/libiqrf/0002-use-only-c-language.patch
deleted file mode 100644
index 2f1c23c28b..0000000000
--- a/package/libiqrf/0002-use-only-c-language.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Use only the C language
-
-libirqf is written completely in C, but by default, CMake assumes that
-both C and C++ are used, and therefore verifies that a C++ compiler is
-installed. This may not necessarily be the case for a C-only package
-in Buildroot.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/src/CMakeLists.txt
-===================================================================
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -1,5 +1,3 @@
--project(iqrf)
--
- set (iqrf_version_major 0)
- set (iqrf_version_minor 1)
- set (iqrf_version_patch 2)
-Index: b/CMakeLists.txt
-===================================================================
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,3 +1,5 @@
-+project(iqrf C)
-+
- cmake_minimum_required(VERSION 2.8.1)
- enable_testing()
- 
diff --git a/package/libiqrf/Config.in b/package/libiqrf/Config.in
deleted file mode 100644
index d86a7fd0ec..0000000000
--- a/package/libiqrf/Config.in
+++ /dev/null
@@ -1,16 +0,0 @@
-config BR2_PACKAGE_LIBIQRF
-	bool "libiqrf"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
-	select BR2_PACKAGE_LIBUSB
-	help
-	  This library implement specific protocol
-	  which is used for communicating with iqrf devices
-	  (http://iqrf.org) over usb. For usb access is used
-	  libusb library.
-
-	  https://github.com/nandra/libiqrf
-
-comment "libiqrf needs a toolchain w/ threads, gcc >= 4.9"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/libiqrf/libiqrf.hash b/package/libiqrf/libiqrf.hash
deleted file mode 100644
index df749def17..0000000000
--- a/package/libiqrf/libiqrf.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  8111031dd9dd6093a1927eb32dd7476fe22cfee9190043aa8e4c88003c104b16  libiqrf-0.1.2.tar.gz
-sha256  11e0700d7c23604d86fa1e7c54c7caa778d79eeb0035be8f80b5a552224ef015  src/iqrf.c
diff --git a/package/libiqrf/libiqrf.mk b/package/libiqrf/libiqrf.mk
deleted file mode 100644
index 3f4e3e8498..0000000000
--- a/package/libiqrf/libiqrf.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# libiqrf
-#
-################################################################################
-
-LIBIQRF_VERSION = 0.1.2
-LIBIQRF_SITE = $(call github,nandra,libiqrf,v$(LIBIQRF_VERSION))
-LIBIQRF_INSTALL_STAGING = YES
-LIBIQRF_DEPENDENCIES = libusb
-LIBIQRF_LICENSE = LGPL-2.1+
-LIBIQRF_LICENSE_FILES = src/iqrf.c
-
-$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
