Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE8AD66B9A
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 19:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9196B60B34;
	Wed, 17 Dec 2025 19:24:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vot824Mcn3sk; Wed, 17 Dec 2025 19:24:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8277360B4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765999491;
	bh=AtYq7+3tlK8VK0emnrXtgBzgno7WL+BrYVTB7zPJeZo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s2N6okBQtQgvgWUWXPNdrNFOhjyFEkbmzn9Dt6CQWszCJ0tvzKQvayCY+NNasz3qM
	 J7hc1NWOMehi4bEj3huDPMaRsQrw78bdxA+hIw+/hQS0HXNX4UKsiAthVFnUniYxbo
	 BZNPXv8f+nfgrPwFRNsi1oZp/bV+Ht6AbpwpRIYyE9dj/5lxrxkvYjEweOAlOm5hqo
	 2CNlw704tR3U2WBl7/xNnNZlpNuvSnFzBOyMQjUnlnD/UcCBJySOnrk0fxTe5mknww
	 6Oh38KKbNsx6wDgKUHUnW1j/F9wBvNCSVfR9Q13WF29oE5NKFwykMv2Bscls6f1/Ua
	 7mX+z/Ht4yXTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8277360B4B;
	Wed, 17 Dec 2025 19:24:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 78B8B361
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 19:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B41F40475
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 19:24:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kjXTOUngmWM9 for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 19:24:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D5BCA403D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5BCA403D8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D5BCA403D8
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 19:24:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AB057A4C4654;
 Wed, 17 Dec 2025 20:23:31 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51964)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVx7S-000000000pX-3r21;
 Wed, 17 Dec 2025 19:23:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Gilles Talis <gilles.talis@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>,
 Jianhui Zhao <zhaojh329@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Jan Heylen <jan.heylen@nokia.com>,
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Simon Dawson <spdawson@gmail.com>, Ben Boeckel <mathstuf@gmail.com>
Date: Wed, 17 Dec 2025 20:23:17 +0100
Message-ID: <20251217192330.3769476-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251217192330.3769476-1-bernd@kuhls.net>
References: <20251217192330.3769476-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765999411;
 bh=985qGCcIDJRELvkEno0I0K5GGGsmtGNWtvCWqUEVlac=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Xit6fQEGHOSQx0mOpJuBaPajpnCRd5eZIsB1+lSxYccP7OYKO5ZT2yivN2lERap3t
 NwlRvks4si3oewdIIUVi+UPY14PD7jAfjCoPoSx0i4oSIyX62L6kFckY8KRZJCXjG7
 UdIoYJ24yob5RHYo6f+ULhFJdTjIgPKSYQyMlVeYwvou6120+B+T3Y9KmV66XHQBMj
 AJ26N/xTTeJnuUHOP+YRp4WVM4HBy9e9vQahNd5eslmeYd9isu6sAi2sf80ycUBmQL
 ONkABgnHRP/gPNltMeQMuuo9mkH0Na7iFZI5yqwnDBVXa9yq9SVtPoeIM+XpNmu8pg
 gYtTZ9XO+6JvA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Xit6fQEG
Subject: [Buildroot] [PATCH v3 06/18] package/let-me-create: remove package
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
index 0b7d456e20..643bcdcd95 100644
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
