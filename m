Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D7EE92FCA
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 17:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E9D660AF9;
	Mon, 29 Dec 2025 17:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5xgCypb1WwOE; Mon, 29 Dec 2025 17:53:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55DF160B11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767030802;
	bh=YU1jJc3KIahsDpoW4aJwssN/MxPaGtfYpO6FeseCG60=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e50HQLYM4eEmHgVIGx56kjkVjdsHLIm6Tc7m6YN0cRXVniHL47H6H5QdcIxHuXWf/
	 AJRSNOe9+Jd7FEjpwxxDtIYzvi9nedOE+/NEN0EPXSO26mxEWaZf8c3Xu77VCzpp9k
	 QDQWlfJGxF6CVNzJe1vcEGq3G+EZiymrzAsJLsW2cpUlfmQgLWKK2uYU5czkmOOyYQ
	 vHEBpVTVeZORrl8Xh6mfl5TMm0hkAzJ9uio9CSuZJQK0svnPXDT3tiIBv38fN7Rfi7
	 fODtE2Q8jsP0OAG2y2CYbQpJwO9gmaueDJNeAim3CiEPNb6en6L+DbLUnmTILUZ78Z
	 FsXa1DbT71GcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55DF160B11;
	Mon, 29 Dec 2025 17:53:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D7095177
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D43A240454
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:53:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fbgoa85gvQtr for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 17:53:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A8D7D400BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8D7D400BA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A8D7D400BA
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:53:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E3BF2A4C2594;
 Mon, 29 Dec 2025 18:52:08 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38202)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vaHPV-0000000012P-2StJ;
 Mon, 29 Dec 2025 17:52:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Romain Naour <romain.naour@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Mon, 29 Dec 2025 18:51:34 +0100
Message-ID: <20251229175158.3548903-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251229175158.3548903-1-bernd@kuhls.net>
References: <20251229175158.3548903-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767030728;
 bh=WeJ2ysrwSpMgj/NaA+sKOWMO7/fowtzI2bt2Db7v3Jg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=feVRxmAflyyJTDGCGJQ+xS2NyNZJy3k3yv43vnv4Zi2C8I8kZRjmseQgpIo49ZMdk
 GbVKZFwcmL9nSK7PLqEQJHdqDBFwc1QW3NXRxIc5oMo0rDR9MvAa/xWefNmFlobI0k
 F955aV1RbAk4lI2uvA9mg+2UvQVAzRJBCTlrBU4RJbATOzoNG9A71eMNOA+BvL4+Ux
 d1vfsdUNBCn3E/cREzX+n4BTwOYy9mxaTKzJ4cWyooTdLMD3wZoukij87kyrIhExk/
 REHO/ujqiBUDIlfSSqcFtZKHqMj5zQbWTSTebCa32gW39uci8pAy6luMK2VreiZcpy
 +afsUk6IMK/pQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=feVRxmAf
Subject: [Buildroot] [PATCH v7 06/29] package/let-me-create: remove package
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

Analysis of https://github.com/CreatorDev/LetMeCreate:
last commit: Mar 2017
last bug report: Apr 2017
last pull request: no open PR

The package is broken with cmake 4 and no other package depends on it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 .checkpackageignore                           |  1 -
 Config.in.legacy                              |  6 +++
 DEVELOPERS                                    |  1 -
 package/Config.in                             |  1 -
 .../0001-fix-build-with-musl-C-library.patch  | 38 -------------------
 package/let-me-create/Config.in               | 27 -------------
 package/let-me-create/let-me-create.hash      |  3 --
 package/let-me-create/let-me-create.mk        | 26 -------------
 8 files changed, 6 insertions(+), 97 deletions(-)
 delete mode 100644 package/let-me-create/0001-fix-build-with-musl-C-library.patch
 delete mode 100644 package/let-me-create/Config.in
 delete mode 100644 package/let-me-create/let-me-create.hash
 delete mode 100644 package/let-me-create/let-me-create.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index a1166aabc9..fa3180a082 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -510,7 +510,6 @@ package/lcdproc/0001-LCDd.conf.patch lib_patch.Upstream
 package/lcdproc/0002-Add-missing-ioctl-header.patch lib_patch.Upstream
 package/lcdproc/0003-Fixcompilation-with-GCC-10-x.patch lib_patch.Upstream
 package/leafnode2/0001-cross_makefile.patch lib_patch.Upstream
-package/let-me-create/0001-fix-build-with-musl-C-library.patch lib_patch.Upstream
 package/leveldb/0001-Fix-compilation-with-g-4.8.2.patch lib_patch.Upstream
 package/leveldb/0002-CMake-install-libmemenv.a.patch lib_patch.Upstream
 package/leveldb/0003-CMakeLists.txt-check-for-atomic-library.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index e0ada2e10d..ff0549548d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_LET_ME_CREATE
+	bool "let-me-create has been removed"
+	select BR2_LEGACY
+	help
+	  let-me-create is unmaintained and has been removed
+
 config BR2_PACKAGE_HAWKTRACER
 	bool "hawktracer has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 44b1e97020..60efaf33b7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2806,7 +2806,6 @@ F:	package/glog/
 F:	package/gssdp/
 F:	package/gupnp/
 F:	package/gupnp-av/
-F:	package/let-me-create/
 F:	package/nanomsg/
 
 N:	Ralf Dragon <hypnotoad@lindra.de>
diff --git a/package/Config.in b/package/Config.in
index b6e6a31b14..5c337c0eb5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1822,7 +1822,6 @@ menu "Hardware handling"
 	source "package/hidapi/Config.in"
 	source "package/jitterentropy-library/Config.in"
 	source "package/lcdapi/Config.in"
-	source "package/let-me-create/Config.in"
 	source "package/libaio/Config.in"
 	source "package/libatasmart/Config.in"
 	source "package/libblockdev/Config.in"
diff --git a/package/let-me-create/0001-fix-build-with-musl-C-library.patch b/package/let-me-create/0001-fix-build-with-musl-C-library.patch
deleted file mode 100644
index 90a7246405..0000000000
--- a/package/let-me-create/0001-fix-build-with-musl-C-library.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 93fbc53a727a49dd5061e44e3156ff2044e6e0b5 Mon Sep 17 00:00:00 2001
-From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
-Date: Tue, 1 Aug 2017 22:44:22 +0530
-Subject: [PATCH] fix build with musl C library
-
-With musl C library, we get following build error:
-
-/home/buildroot/autobuild/run/instance-3/output/build/let-me-create-v1.5.2/src/core/spi.c: In function 'spi_transfer':
-/home/buildroot/autobuild/run/instance-3/output/build/let-me-create-v1.5.2/src/core/spi.c:170:19: error: '_IOC_SIZEBITS' undeclared (first use in this function)
-if (ioctl(fd, SPI_IOC_MESSAGE(1), &tr) < 0) {
-^
-/home/buildroot/autobuild/run/instance-3/output/build/let-me-create-v1.5.2/src/core/spi.c:170:19: note: each undeclared identifier is reported only once for each function it appears in
-
-Include <linux/ioctl.h> for musl C library compatibility.
-
-This build issue is detected by Buildroot autobuilder:
-http://autobuild.buildroot.net/results/af9/af946fa6fe05ee265e4ac97742b15afeb0cea1ab/
-
-Signed-off-by: Rahul Bedarkar rahulbedarkar89@gmail.com
----
-Upstream status: https://github.com/CreatorDev/LetMeCreate/pull/29
-
- src/core/spi.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/core/spi.c b/src/core/spi.c
-index 4d55cee..9ec7ea9 100644
---- a/src/core/spi.c
-+++ b/src/core/spi.c
-@@ -1,4 +1,5 @@
- #include <sys/ioctl.h>
-+#include <linux/ioctl.h>
- #include <linux/spi/spidev.h>
- #include <fcntl.h>
- #include <errno.h>
--- 
-2.7.4
-
diff --git a/package/let-me-create/Config.in b/package/let-me-create/Config.in
deleted file mode 100644
index b0fdc73d49..0000000000
--- a/package/let-me-create/Config.in
+++ /dev/null
@@ -1,27 +0,0 @@
-comment "let-me-create needs a toolchain w/ C++, threads, dynamic library"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_STATIC_LIBS
-
-config BR2_PACKAGE_LET_ME_CREATE
-	bool "let-me-create"
-	# build issues in static libs configuration
-	# see https://github.com/CreatorDev/LetMeCreate/issues/28
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	help
-	  This library is collection of small wrappers for some
-	  interfaces on the Creator Ci40 board. It aims at making
-	  easier to develop on this platform. It also provides
-	  wrappers for a few clicks.
-
-	  https://github.com/CreatorDev/LetMeCreate
-
-if BR2_PACKAGE_LET_ME_CREATE
-
-config BR2_PACKAGE_LET_ME_CREATE_EXAMPLES
-	bool "Build and install examples"
-	help
-	  Build and install examples
-
-endif
diff --git a/package/let-me-create/let-me-create.hash b/package/let-me-create/let-me-create.hash
deleted file mode 100644
index 899761786a..0000000000
--- a/package/let-me-create/let-me-create.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  5f42858a2062f34d2578e9cb1aed3ccb8d2409d908aa4c41a924418666d5f2bd  let-me-create-1.5.2.tar.gz
-sha256  8ffc162e1435e810845b09a4c0d534df057a030f4c107778677b6621dc203426  LICENSE
diff --git a/package/let-me-create/let-me-create.mk b/package/let-me-create/let-me-create.mk
deleted file mode 100644
index faa5e14d96..0000000000
--- a/package/let-me-create/let-me-create.mk
+++ /dev/null
@@ -1,26 +0,0 @@
-################################################################################
-#
-# LetMeCreate
-#
-################################################################################
-
-LET_ME_CREATE_VERSION = 1.5.2
-LET_ME_CREATE_SITE = $(call github,CreatorDev,LetMeCreate,v$(LET_ME_CREATE_VERSION))
-LET_ME_CREATE_INSTALL_STAGING = YES
-LET_ME_CREATE_LICENSE = BSD-3-Clause
-LET_ME_CREATE_LICENSE_FILES = LICENSE
-
-# pure static build not supported
-ifeq ($(BR2_SHARED_LIBS),y)
-LET_ME_CREATE_CONF_OPTS += -DBUILD_STATIC=OFF -DBUILD_SHARED=ON
-else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
-LET_ME_CREATE_CONF_OPTS += -DBUILD_STATIC=ON -DBUILD_SHARED=ON
-endif
-
-ifeq ($(BR2_PACKAGE_LET_ME_CREATE_EXAMPLES),y)
-LET_ME_CREATE_CONF_OPTS += -DBUILD_EXAMPLES=ON
-else
-LET_ME_CREATE_CONF_OPTS += -DBUILD_EXAMPLES=OFF
-endif
-
-$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
