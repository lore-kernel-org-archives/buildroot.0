Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2025E6689C
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 22:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84467811FF;
	Fri, 19 Dec 2025 22:42:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8pTTf6cT6vgs; Fri, 19 Dec 2025 22:42:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8258B83C28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766184170;
	bh=nniKde4Y0uLLIMeD4iCVX8bFdhXJw9TJ49O0GH5+hNk=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BXpqYBFqhuIuJGyLLzqaWeZimqhw7NaZTXJppE510DT3kbkVajfu9rSPivlMybUrY
	 GDuXBAGEYpb/WCaRgi7eIzdWmWrYRZ+66dGefqusMfAU5xzIN7yzQzPNCZgnnDtFEm
	 2RLJP1vvPhIkuMvSFEFYJKTUt/+c6ukG+pRj4ItHAgyc7hRJzZYJapvip8oWEDu/BK
	 e1kTgBZw2dRS9Y6NPVUttCZVfoYp9Vg1h23JQcfTDWtElPEHH6tiyi+ILjT0dR0Yk4
	 GJ1JomMIHnW94TQ2P18f0fSn8SubmKnJzw/q8gAJTFYYOEH857ubXaagJcNQh+gZZ3
	 Y6OB0eP163d7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8258B83C28;
	Fri, 19 Dec 2025 22:42:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 637A5119
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55FE483C12
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XKXe4yCg80o3 for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 22:42:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3F65883BEB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F65883BEB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F65883BEB
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:42:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a05d4.dip0.t-ipconnect.de [91.58.5.212])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D1BE3A4C4733;
 Fri, 19 Dec 2025 23:41:50 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45868)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vWjAN-000000002VW-1JPv;
 Fri, 19 Dec 2025 22:41:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>, Simon Dawson <spdawson@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Fri, 19 Dec 2025 23:41:26 +0100
Message-ID: <20251219224140.1318253-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251219224140.1318253-1-bernd@kuhls.net>
References: <20251219224140.1318253-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766184110;
 bh=Rfxlcx0ppfZ2z8wNva0XVpbiefaRzd2oVMPo+TvPzL4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=RcNhEUK4rQI8i76YVDXA+NN48v+Vup5+TRtcdltYCo6jkMUsXEpp7NHAm7oM8juWZ
 e9utK9KUZWOivaIe+9PWK3T4cVDP5Hpob5JiTGgAl7UcA96yD4Iv/Rr05r0acOBHLs
 PIrweF0lehcljf54Z0Q8Wy/4V8J3i3SGLDYgiONFdYH/6g2hPyJF5Gvq39LRzpIU2u
 47A7pcoIRTL/8Vid3m2UUzQ5ZwebadAQXbIbkcoZPhwUyjJx7PCBUOJqwiBqbyagpj
 nDzcMjLsSetI6qeS7Jb47DMAyHCqRWMzL2nJySJuq7hoqMnUoabJtuTbAvu3Y49lcY
 Ug/SZyhFl9Sxg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=RcNhEUK4
Subject: [Buildroot] [PATCH v5 06/20] package/let-me-create: remove package
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
index b2bf4d0403..f47a805167 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -511,7 +511,6 @@ package/lcdproc/0001-LCDd.conf.patch lib_patch.Upstream
 package/lcdproc/0002-Add-missing-ioctl-header.patch lib_patch.Upstream
 package/lcdproc/0003-Fixcompilation-with-GCC-10-x.patch lib_patch.Upstream
 package/leafnode2/0001-cross_makefile.patch lib_patch.Upstream
-package/let-me-create/0001-fix-build-with-musl-C-library.patch lib_patch.Upstream
 package/leveldb/0001-Fix-compilation-with-g-4.8.2.patch lib_patch.Upstream
 package/leveldb/0002-CMake-install-libmemenv.a.patch lib_patch.Upstream
 package/leveldb/0003-CMakeLists.txt-check-for-atomic-library.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index c00edd7495..9ec8802e27 100644
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
index 1de4c9467e..3f1e0e76fd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2789,7 +2789,6 @@ F:	package/glog/
 F:	package/gssdp/
 F:	package/gupnp/
 F:	package/gupnp-av/
-F:	package/let-me-create/
 F:	package/nanomsg/
 
 N:	Ralf Dragon <hypnotoad@lindra.de>
diff --git a/package/Config.in b/package/Config.in
index 85b7e02dcc..7547f4bb85 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1819,7 +1819,6 @@ menu "Hardware handling"
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
