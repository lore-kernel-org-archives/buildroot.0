Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F30D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D9004066D;
	Sun,  7 Dec 2025 14:29:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fnC_EeNgkXtY; Sun,  7 Dec 2025 14:29:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A534E40679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765117755;
	bh=entkQF9gD2KXaCmy+CbmJvuhqQ1uApGOoueG9+fzOOY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ruBksOn9sPyjbmlMo4eQFCJdyxCv6twxnPhMagIVq3/DE2CC17yPfBJ0LNqqM+zVg
	 E/a5cwh7ACA3dz/CHi7MtSRl/WaNwH1KXcf2V9M090dMd3X0Tbm8aLif69ojX+0Opg
	 FZN6xuYMTsGDPHMBjnr1hW1AgTmPsSr6M3NFrcaB2jGUDgESekPUnsZKB7e/bFlfAG
	 9gPlqd4bRBrBdyqk048INsRVGkK4hFYSZPBNmkqoBycZZ9YllQTq1Xny0aVVmz5+Of
	 OXW4XmCTu41nC+Xwsv6wBWn7AsPTnBf7KZQVs2ztzHLSB+6Nx98HxcW638UagEj0IX
	 XBm5p/8ZLxe+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A534E40679;
	Sun,  7 Dec 2025 14:29:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 74E602CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7245C605A4
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:29:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZnIEgi01t2zn for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:29:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3783D60B95
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3783D60B95
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3783D60B95
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:29:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DA235A4C0991;
 Sun,  7 Dec 2025 15:27:00 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60616)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFit-000000001Fk-3fd3;
 Sun, 07 Dec 2025 14:26:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Bartosz Bilas <b.bilas@grinn-global.com>, Eric Limpens <limpens@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jianhui Zhao <zhaojh329@gmail.com>, Jon Ringle <jringle@gridpoint.com>,
 Julien Olivain <ju.o@free.fr>, Maxim Kochetkov <fido_max@inbox.ru>,
 Pieterjan Camerlynck <pieterjanca@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, TIAN Yuanhao <tianyuanhao3@163.com>
Date: Sun,  7 Dec 2025 15:26:48 +0100
Message-ID: <20251207142651.3695074-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207142651.3695074-1-bernd@kuhls.net>
References: <20251207142651.3695074-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765117620;
 bh=lWLx70F6Ta2cOSDx/8JVrjUu9aHU+vLzwCkM+zCIPcM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=PaznlQbuHq5O95uklu6Hsbgo1tppICzBhUNmLVKejl37cIfA+sPOx8Bu/tzb8+wff
 gYseb2mJeA6Zsnxy3elUE2ZvSmFfQtjSZfz4WfyiT6S1VhbI5dOBZ56X3XoSOaYgb8
 cP6SsIQjVP9M5eL6vxMFaeL7aZhWas9bGIQ1mY3XzWsCJV6TcX9hv3J+Ebf5MVf2m1
 DZUm6tdwHB7kGZomTAKH2lWs6PydUh4eotDPAlQDx2pkCcYgaPOeEj62ngyJxVaMD6
 e/s080aseshdfSfWfY9W7ObbZ4zpRs+t3x+/7mVBfgHQ9QkC0lLM7VobXzJdto5DTl
 rXnm8yVMztiDw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=PaznlQbu
Subject: [Buildroot] [PATCH/next 11/14] package/wampcc: fix cmake 4
 compatibility
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...004-Make-compatible-with-CMake-3.8.1.patch | 35 ++++++++++
 ...05-Build-Debian-packages-using-CPack.patch | 69 +++++++++++++++++++
 ...e-policy-to-set-MSVC-runtime-options.patch | 38 ++++++++++
 3 files changed, 142 insertions(+)
 create mode 100644 package/wampcc/0004-Make-compatible-with-CMake-3.8.1.patch
 create mode 100644 package/wampcc/0005-Build-Debian-packages-using-CPack.patch
 create mode 100644 package/wampcc/0006-Use-CMake-policy-to-set-MSVC-runtime-options.patch

diff --git a/package/wampcc/0004-Make-compatible-with-CMake-3.8.1.patch b/package/wampcc/0004-Make-compatible-with-CMake-3.8.1.patch
new file mode 100644
index 0000000000..69e656a3a6
--- /dev/null
+++ b/package/wampcc/0004-Make-compatible-with-CMake-3.8.1.patch
@@ -0,0 +1,35 @@
+From 95cbe3bb3e7cfa32b96356edbd3ce7a8a3bb9018 Mon Sep 17 00:00:00 2001
+From: GHANNADZADEH Saman <saman.ghannadzadeh@oxinst.com>
+Date: Mon, 4 Mar 2019 16:21:40 +0000
+Subject: [PATCH] Make compatible with CMake 3.8.1
+
+This ups the minimum CMake version, and declares th package version in
+the `project(...)` command to be compatible with CMake policy CMP0047.
+
+Upstream: https://github.com/darrenjs/wampcc/commit/95cbe3bb3e7cfa32b96356edbd3ce7a8a3bb9018
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 5ae1a370..251e0caa 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,11 +1,11 @@
+-cmake_minimum_required(VERSION 2.8.12 FATAL_ERROR)
++cmake_minimum_required(VERSION 3.1.0 FATAL_ERROR)
+ 
+-project(wampcc)
+-
+-# Version number
+ set (WAMPCC_VERSION_MAJOR 1)
+ set (WAMPCC_VERSION_MINOR 6)
+ set (WAMPCC_VERSION "${WAMPCC_VERSION_MAJOR}.${WAMPCC_VERSION_MINOR}")
++project(wampcc VERSION ${WAMPCC_VERSION})
++
++# Version number
+ # Include extra cmake modules
+ set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake")
+ 
diff --git a/package/wampcc/0005-Build-Debian-packages-using-CPack.patch b/package/wampcc/0005-Build-Debian-packages-using-CPack.patch
new file mode 100644
index 0000000000..6984b47e57
--- /dev/null
+++ b/package/wampcc/0005-Build-Debian-packages-using-CPack.patch
@@ -0,0 +1,69 @@
+From 36ef37248c1608a366846d17d60fec217e515377 Mon Sep 17 00:00:00 2001
+From: GHANNADZADEH Saman <saman.ghannadzadeh@oxinst.com>
+Date: Mon, 4 Mar 2019 16:28:36 +0000
+Subject: [PATCH] Build Debian packages using CPack
+
+Upstream: https://github.com/darrenjs/wampcc/commit/36ef37248c1608a366846d17d60fec217e515377
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt              |  5 ++++-
+ cmake/MakeDebPackages.cmake | 26 ++++++++++++++++++++++++++
+ 2 files changed, 30 insertions(+), 1 deletion(-)
+ create mode 100644 cmake/MakeDebPackages.cmake
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 0a8b528d..a9fb364c 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -7,7 +7,7 @@ project(wampcc VERSION ${WAMPCC_VERSION})
+ 
+ # Version number
+ # Include extra cmake modules
+-set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake")
++set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_LIST_DIR}/cmake")
+ 
+ 
+ ##
+@@ -37,6 +37,9 @@ set(INSTALL_LIB_DIR "${CMAKE_INSTALL_PREFIX}/lib" CACHE PATH  "Installation dire
+ set(INSTALL_INC_DIR "${CMAKE_INSTALL_PREFIX}/include" CACHE PATH "Installation directory for headers")
+ set(INSTALL_PKGCONFIG_DIR "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" CACHE PATH "Installation directory for pkgconfig (.pc) files")
+ 
++# Allow settin of RPATH for install
++SET(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)
++
+ ##
+ ## Platform checks, and generate config.h
+ ##
+diff --git a/cmake/MakeDebPackages.cmake b/cmake/MakeDebPackages.cmake
+new file mode 100644
+index 00000000..66ecb336
+--- /dev/null
++++ b/cmake/MakeDebPackages.cmake
+@@ -0,0 +1,26 @@
++set(CPACK_PACKAGE_VENDOR "Darren Smith")
++SET(CPACK_PACKAGE_CONTACT "Darren Smith")
++
++set(CPACK_PACKAGING_INSTALL_PREFIX "/usr/lib")
++
++SET(CPACK_GENERATOR "DEB")
++SET(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
++set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS ON)
++set(CPACK_DEBIAN_PACKAGE_GENERATE_SHLIBS ON)
++
++set(CPACK_DEB_COMPONENT_INSTALL ON)
++set(CPACK_DEBIAN_ENABLE_COMPONENT_DEPENDS YES)
++
++set(CPACK_COMPONENTS_ALL lib dev)
++set(CPACK_COMPONENT_DEV_DEPENDS lib)
++
++set(CPACK_DEBIAN_LIB_PACKAGE_NAME libwampcc)
++set(CPACK_DEBIAN_DEV_PACKAGE_NAME libwampcc-dev)
++
++if(BUILD_UTILS)
++  list(APPEND CPACK_COMPONENTS_ALL util)
++  set(CPACK_COMPONENT_UTIL_DEPENDS lib)
++  set(CPACK_DEBIAN_UTIL_PACKAGE_NAME wampcc-utils)
++endif()
++
++include(CPack)
diff --git a/package/wampcc/0006-Use-CMake-policy-to-set-MSVC-runtime-options.patch b/package/wampcc/0006-Use-CMake-policy-to-set-MSVC-runtime-options.patch
new file mode 100644
index 0000000000..5fedd90ad2
--- /dev/null
+++ b/package/wampcc/0006-Use-CMake-policy-to-set-MSVC-runtime-options.patch
@@ -0,0 +1,38 @@
+From 047f8742e721db4d0e91bb6313ec668900975de3 Mon Sep 17 00:00:00 2001
+From: Saman Ghannadzadeh <saman@saman-gh.co.uk>
+Date: Fri, 8 Sep 2023 15:09:23 +0100
+Subject: [PATCH] Use CMake policy to set MSVC runtime options
+
+Currently, we manually set the MSVC flags to set the runtime to be
+static or dynamic. This commit switches to letting CMake automatically do this,
+instead of us manually setting flags.
+
+This should make the CMake recipe more robust.
+
+Upstream: https://github.com/darrenjs/wampcc/commit/047f8742e721db4d0e91bb6313ec668900975de3
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[backported for 1.6]
+---
+ CMakeLists.txt | 11 +++++------
+ 1 file changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 7c261cb..28e1965 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,10 +1,13 @@
+-cmake_minimum_required(VERSION 3.1.0 FATAL_ERROR)
++cmake_minimum_required(VERSION 3.15.0 FATAL_ERROR)
+ 
+ set (WAMPCC_VERSION_MAJOR 1)
+ set (WAMPCC_VERSION_MINOR 6)
+ set (WAMPCC_VERSION "${WAMPCC_VERSION_MAJOR}.${WAMPCC_VERSION_MINOR}")
+ project(wampcc VERSION ${WAMPCC_VERSION})
+ 
++# Allows for setting MSVC static runtime
++cmake_policy(SET CMP0091 NEW)
++
+ # Version number
+ # Include extra cmake modules
+ set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_LIST_DIR}/cmake")
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
