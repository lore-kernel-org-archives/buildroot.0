Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351F4E92FC4
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 18:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0821F605A3;
	Mon, 29 Dec 2025 18:01:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3TWqTz_Paeia; Mon, 29 Dec 2025 18:01:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E9C76076B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767031268;
	bh=0Kpr2B3IVOWDW2yXNfx8AzbM6F1KfPFtafcf269g8Nc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lnfoWG+DJX2q36jQGKvokqg3NpSQ/N47qku93VIVBEYI4wvBjZ2MXafoUSlQecKpO
	 kJ8f9MToV8KH/EXok4NYi+B41WAsScn0mMS4pjA96dqKcDLed842PNEyGiPcpV7fmA
	 6bZe7u08+g/h+p0eXkXSa2hGmf9UFTeCCzRZF3XzM0qxKEoVxR0jGRQO0tCGXvVdIG
	 bfYpZXaExa/MvpsxT1NbBH1Ye6GatvGJEMnfoYCpXBI8IFepUzXxmUL0LuAXXgRBZk
	 DUWrIjPihpDMHsT58AIIdoNbqbB53hk+JoSm/7Cw80BeVWkAHt58kBOZ7bgHX549eh
	 EEUiDGzshVQYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E9C76076B;
	Mon, 29 Dec 2025 18:01:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D3C0D177
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4A846076B
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:01:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rV_NxClHCpoa for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 18:01:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AA968605A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA968605A3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA968605A3
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:01:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B302EA4C259A;
 Mon, 29 Dec 2025 18:59:45 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53686)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vaHWt-000000002P5-3YnG;
 Mon, 29 Dec 2025 17:59:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Romain Naour <romain.naour@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Mon, 29 Dec 2025 18:59:15 +0100
Message-ID: <20251229175938.3549882-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251229175938.3549882-1-bernd@kuhls.net>
References: <20251229175938.3549882-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767031185;
 bh=VQv1MUtPwb5zgS035SaPk3pDHlHPpSO0RzN5u+NJhH4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=NnBVGOTnFJZLww3PvdSm0KjqXB8/wh+F0ZyYY7oa+oCjZXCsXm6bVZf2GIcYKWpyI
 FAhHaf5Q14WPq81AVCBLGAaR4k6iNc8DUxgdHCDPVEE448oNmZFzJFvR8BVh1zCuaa
 24GaPGLWLpBNBGy3QaVNLBjti4eq9rZNo0AUwdMSHp0h3UyrIAMoQZArSBsxxHJThP
 eLi9uGraaSG+a764xOfMbtp00LE+Dz+epaFd82ng/bwCVFOBW4ODzKZw1ebrcVDR8f
 S4xAz0KGC31SMp0edYhaKdqUxilOLxyKU/bpImv3jq4dvom9/yeBfMNIerxhkwJSl+
 sqQXrIOwitG9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=NnBVGOTn
Subject: [Buildroot] [PATCH v8 07/29] package/libcgi: remove package
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
development since 2021 (not counting a build fix provided by Fabrice in
2022).

Fixes:
https://autobuild.buildroot.net/results/604/604e8e5752e9a11d25bb65b9913db57d3db85b6f/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  1 -
 Config.in.legacy                              |  6 +++
 package/Config.in                             |  1 -
 ...-CMakeLists.txt-honour-BUILD_TESTING.patch | 44 -------------------
 package/libcgi/Config.in                      | 11 -----
 package/libcgi/libcgi.hash                    |  8 ----
 package/libcgi/libcgi.mk                      | 14 ------
 7 files changed, 6 insertions(+), 79 deletions(-)
 delete mode 100644 package/libcgi/0001-CMakeLists.txt-honour-BUILD_TESTING.patch
 delete mode 100644 package/libcgi/Config.in
 delete mode 100644 package/libcgi/libcgi.hash
 delete mode 100644 package/libcgi/libcgi.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index fa3180a082..2fc5887602 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -523,7 +523,6 @@ package/libavl/0001-fix-makefile.patch lib_patch.Upstream
 package/libb64/0001-Integer-overflows.patch lib_patch.Upstream
 package/libb64/0002-Initialize-C++-objects.patch lib_patch.Upstream
 package/libcdaudio/0001-libcdaudio-enable-autoreconf.patch lib_patch.Upstream
-package/libcgi/0001-CMakeLists.txt-honour-BUILD_TESTING.patch lib_patch.Upstream
 package/libcgicc/0001-disable-documentation-option.patch lib_patch.Sob lib_patch.Upstream
 package/libcuefile/0001-fix-static-link.patch lib_patch.Upstream
 package/libdaemon/0001-testd-use-unistd-h-instead-of-sys-unistd-h.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index ff0549548d..3ce540561f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_LIBCGI
+	bool "libcgi has been removed"
+	select BR2_LEGACY
+	help
+	  libcgi is unmaintained and has been removed
+
 config BR2_PACKAGE_LET_ME_CREATE
 	bool "let-me-create has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 5c337c0eb5..58905f4759 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2032,7 +2032,6 @@ menu "Networking"
 	source "package/gupnp-dlna/Config.in"
 	source "package/ibrcommon/Config.in"
 	source "package/ibrdtn/Config.in"
-	source "package/libcgi/Config.in"
 	source "package/libcgicc/Config.in"
 	source "package/libcoap/Config.in"
 	source "package/libcpprestsdk/Config.in"
diff --git a/package/libcgi/0001-CMakeLists.txt-honour-BUILD_TESTING.patch b/package/libcgi/0001-CMakeLists.txt-honour-BUILD_TESTING.patch
deleted file mode 100644
index 3ec674ae70..0000000000
--- a/package/libcgi/0001-CMakeLists.txt-honour-BUILD_TESTING.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 15ec267520efbe45193eb1df5361a4ab56164294 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 8 May 2022 17:54:42 +0200
-Subject: [PATCH] CMakeLists.txt: honour BUILD_TESTING
-
-Allow the user to disable tests through the standard BUILD_TESTING
-option: https://cmake.org/cmake/help/latest/module/CTest.html
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/rafaelsteil/libcgi/commit/15ec267520efbe45193eb1df5361a4ab56164294]
----
- CMakeLists.txt | 12 +++++++++---
- 1 file changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index cbf0d97..e3329a1 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -29,15 +29,21 @@ option(BUILD_SHARED_LIBS
- 	"Global flag to cause add_library to create shared libraries if on."
- 	ON
- )
-+option(BUILD_TESTING
-+	"Build tests."
-+	ON
-+)
- 
- # subdirectories
- add_subdirectory("include/libcgi")
- add_subdirectory("src")
- 
- # test
--enable_testing()
--include(CTest)
--add_subdirectory("test")
-+if(BUILD_TESTING)
-+	enable_testing()
-+	include(CTest)
-+	add_subdirectory("test")
-+endif(BUILD_TESTING)
- 
- # cmake package stuff
- configure_package_config_file(${PROJECT_NAME_LC}-config.cmake.in
diff --git a/package/libcgi/Config.in b/package/libcgi/Config.in
deleted file mode 100644
index 33369079b3..0000000000
--- a/package/libcgi/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_LIBCGI
-	bool "libcgi"
-	help
-	  LibCGI is a library written from scratch to easily make
-	  CGI applications in C.
-
-	  There are a lot of functions like string manipulation,
-	  session and cookie support, GET and POST methods manipulation
-	  etc..., to help you to quickly write powerful CGI programs.
-
-	  https://github.com/rafaelsteil/libcgi/
diff --git a/package/libcgi/libcgi.hash b/package/libcgi/libcgi.hash
deleted file mode 100644
index 5e8845ede2..0000000000
--- a/package/libcgi/libcgi.hash
+++ /dev/null
@@ -1,8 +0,0 @@
-# From https://github.com/rafaelsteil/libcgi/releases/download/v1.3.0/libcgi-1.3.0.tar.gz.md5
-md5  6efdc968bdf986832b7e220d1b914e57  libcgi-1.3.0.tar.gz
-# From https://github.com/rafaelsteil/libcgi/releases/download/v1.3.0/libcgi-1.3.0.tar.gz.sha256
-sha256  d932f380b1a5dbfbddffaa76fac71bf505a9585d441c9ae86bfbf76033d9d8df  libcgi-1.3.0.tar.gz
-
-# Hash for license file:
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1.txt
-sha256  f32c31e26ec840753a8cd47cd2681e48be4cee853212d16a4b1d85ac4d677669  LICENSES/MIT.txt
diff --git a/package/libcgi/libcgi.mk b/package/libcgi/libcgi.mk
deleted file mode 100644
index 22163310d3..0000000000
--- a/package/libcgi/libcgi.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# libcgi
-#
-################################################################################
-
-LIBCGI_VERSION = 1.3.0
-LIBCGI_SITE = https://github.com/rafaelsteil/libcgi/releases/download/v$(LIBCGI_VERSION)
-
-LIBCGI_INSTALL_STAGING = YES
-LIBCGI_LICENSE = LGPL-2.1+, MIT (base64.c)
-LIBCGI_LICENSE_FILES = LICENSES/LGPL-2.1.txt LICENSES/MIT.txt
-
-$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
