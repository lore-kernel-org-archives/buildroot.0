Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12DAAD1BDE7
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 22:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D94E860B33;
	Wed,  3 Dec 2025 22:03:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6zVEfHkSu01k; Wed,  3 Dec 2025 22:03:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E788460E92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764799427;
	bh=/3ZQwZQi2/+BzKU12fQKk7A7jNlfwq1DxJ7dbasPjnw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ZQJG4rUCVe+vDlnjf5IVRFQW58pDaoQ1TQTLPDvbSslg8tF/XU/0YZXoxWftNb5Z6
	 xWJS+N7eRrAgiggBZjzTxFLidwPIUgt6O+rPb/6aXfyIXgYRQybGN+zZciG68233Wf
	 kKeu8u7TxiO17m+E1e9nRFNsxtW2qhq/z4rYtTsRUEcJbGBOBSBOMibexPrV9Hu7Qu
	 JTMQFcvsNBp54V4UBp+aQEajZQKOU1TmBlTlnBjJrR/jSJdw3VUwE5218BQ5LFlwGe
	 iEiOxCnd4RBYV2UXlcyOq/H82oz/9yoy4vddfispSKcHBruFiZul0cTicI7qlVISyX
	 gl4qnagAa4xfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E788460E92;
	Wed,  3 Dec 2025 22:03:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E2EFBD3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9DA540335
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:03:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ojvdBOtHqs-z for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 22:03:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 84305401D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84305401D4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84305401D4
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:03:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B74A8A4C79CF;
 Wed,  3 Dec 2025 22:59:05 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56204)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQuqh-000000002OS-1bUX;
 Wed, 03 Dec 2025 21:57:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Dec 2025 22:57:13 +0100
Message-ID: <20251203215723.2323032-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251203215723.2323032-1-bernd@kuhls.net>
References: <20251203215723.2323032-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764799145;
 bh=uqrAx2b2HMANb2hgVbNypBvKVIZLdHDfslaBiCJWKD4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=j7h+pXNgnAKe8ACeepc4n6JUgdZ9P3wq/O1fAu5yLv3Q3wB3hawxGXB7ccnejO0I6
 rJnZD+RJkZXiYIQTBsZA2I7mH+UgihRMO1XSxTKMsg2Z1kBZw3SmSWrG0+ZesOpvsW
 4k5U2L+SFZcY0/K8WS+E9wl2QGV3PMRyStlS6hP7mhf+/+uKZrxJ3XNGjGIPm6WrRO
 OufQXPgVYn8OXlVJ0PzvAFBPsvPTgf7+A+98eXgzeOWdaewau01RwQMdbjhk1mUL7E
 Y+ytGgKJUbvDjvXkxt3zc+z1fopW4tGWSUiCvOICeamsDPcQuHREXWtb85CP9/Jkl+
 rWSk5nIIuDsoA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=j7h+pXNg
Subject: [Buildroot] [PATCH/next 06/16] package/graphite2: bump version
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, RJ Ascani <rj.ascani@gmail.com>,
 Daniel Nicoletti <dantti12@gmail.com>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Last release dates back to 2020 with > 120 commits since then, including
fixes for cmake 4 compatibility.

Instead of backporting several patches we bump the package to the latest
commit which allows to remove patch 0001.

Updated license hash due to upstream commit
https://github.com/silnrsi/graphite/commit/f9dad5a35edb0c3f1031f5627623fb9e7f9bc24c

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  1 -
 ...l-a-libtool-file-with-static-library.patch | 67 -------------------
 package/graphite2/graphite2.hash              |  5 +-
 package/graphite2/graphite2.mk                |  6 +-
 4 files changed, 4 insertions(+), 75 deletions(-)
 delete mode 100644 package/graphite2/0001-don-t-install-a-libtool-file-with-static-library.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 394c0523c3..1721d8f4d8 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -441,7 +441,6 @@ package/gob2/0001-dont-include-from-prefix.patch lib_patch.Upstream
 package/gobject-introspection/0001-Add-rpath-links-to-ccompiler.patch lib_patch.Upstream
 package/gpsd/S50gpsd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/gptfdisk/0001-gptcurses-partially-revert-Tweaks-for-building-on-th.patch lib_patch.Upstream
-package/graphite2/0001-don-t-install-a-libtool-file-with-static-library.patch lib_patch.Upstream
 package/grpc/0003-disable-unconditionally-downloading-api-repos.patch lib_patch.Upstream
 package/gstreamer1/gstd/0001-Don-t-require-gstd-check-user-xenv.sh-for-systemd-se.patch lib_patch.Upstream
 package/guile/0001-calculate-csqrt_manually.patch lib_patch.Upstream
diff --git a/package/graphite2/0001-don-t-install-a-libtool-file-with-static-library.patch b/package/graphite2/0001-don-t-install-a-libtool-file-with-static-library.patch
deleted file mode 100644
index ac150622d5..0000000000
--- a/package/graphite2/0001-don-t-install-a-libtool-file-with-static-library.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 3edb88b55c0870989778c670d555aa159a2c3abc Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 31 Aug 2020 20:56:43 +0200
-Subject: [PATCH] don't install a libtool file with static library
-
-Static library is supported since version 1.3.11 and
-https://github.com/silnrsi/graphite/commit/2f143c04da5caa43ddf4dba437b2f2bc26bf4238
-
-However, graphite2 is still installing libgraphite2.la which contains
-incorrect information (i.e. dlname set to libgraphite2.so and
-old_library set to ''):
-
-dlname='libgraphite2.so'
-
-library_names='libgraphite2.so.3.2.1 libgraphite2.so.3 libgraphite2.so'
-
-old_library=''
-
-dependency_libs=''
-
-This will result in the following build failure with any applications
-using this file such as harfbuzz:
-
-arm-linux-g++.br_real: error: /home/buildroot/autobuild/run/instance-3/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgraphite2.so: No such file or directory
-make[5]: *** [main] Error 1
-
-Instead of trying to fix this libtool file, just disable it when
-building a static library as it is not needed
-
-Fixes:
- - http://autobuild.buildroot.org/results/9ebe1d11e80755d59190ef2aae82bbba5cc45e44
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/silnrsi/graphite/pull/65]
----
- src/CMakeLists.txt | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index b6ac26bf..a7ace040 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -131,7 +131,9 @@ if  (${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
-         nolib_test(stdc++ $<TARGET_SONAME_FILE:graphite2>)
-     endif ()
-     set(CMAKE_CXX_IMPLICIT_LINK_LIBRARIES "")
--    CREATE_LIBTOOL_FILE(graphite2 "/lib${LIB_SUFFIX}")
-+    if (BUILD_SHARED_LIBS)
-+        CREATE_LIBTOOL_FILE(graphite2 "/lib${LIB_SUFFIX}")
-+    endif()
- endif()
- 
- if  (${CMAKE_SYSTEM_NAME} STREQUAL "Darwin")
-@@ -146,7 +148,9 @@ if  (${CMAKE_SYSTEM_NAME} STREQUAL "Darwin")
-     include(Graphite)
-     nolib_test(stdc++ $<TARGET_SONAME_FILE:graphite2>)
-     set(CMAKE_CXX_IMPLICIT_LINK_LIBRARIES "")
--    CREATE_LIBTOOL_FILE(graphite2 "/lib${LIB_SUFFIX}")
-+    if (BUILD_SHARED_LIBS)
-+        CREATE_LIBTOOL_FILE(graphite2 "/lib${LIB_SUFFIX}")
-+    endif()
- endif()
- 
- if  (${CMAKE_SYSTEM_NAME} STREQUAL "Windows")
--- 
-2.28.0
-
diff --git a/package/graphite2/graphite2.hash b/package/graphite2/graphite2.hash
index e005375f8a..0880fc7208 100644
--- a/package/graphite2/graphite2.hash
+++ b/package/graphite2/graphite2.hash
@@ -1,4 +1,3 @@
-# From https://github.com/silnrsi/graphite/releases/download/1.3.14/graphite2-1.3.14.sha256sum
-sha256  f99d1c13aa5fa296898a181dff9b82fb25f6cc0933dbaa7a475d8109bd54209d  graphite2-1.3.14.tgz
 # Locally computed
-sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  LICENSE
+sha256  b5e919f4b5788f8ed5a2d9d0ce17a23d1c0f625979e53c5e7336fc2ba0b7a7d6  graphite2-142e1bda3439d2bd376bcac9c2b247c9532bacde.tar.gz
+sha256  cab46cd45adbfea4b1d0f14b033c70062c73074fa0b56532c2f351576ddf455e  LICENSE
diff --git a/package/graphite2/graphite2.mk b/package/graphite2/graphite2.mk
index 7f9e3c516e..0f630e8bdf 100644
--- a/package/graphite2/graphite2.mk
+++ b/package/graphite2/graphite2.mk
@@ -4,10 +4,8 @@
 #
 ################################################################################
 
-GRAPHITE2_VERSION = 1.3.14
-GRAPHITE2_SOURCE = graphite2-$(GRAPHITE2_VERSION).tgz
-GRAPHITE2_SITE = \
-	https://github.com/silnrsi/graphite/releases/download/$(GRAPHITE2_VERSION)
+GRAPHITE2_VERSION = 142e1bda3439d2bd376bcac9c2b247c9532bacde
+GRAPHITE2_SITE = $(call github,silnrsi,graphite,$(GRAPHITE2_VERSION))
 GRAPHITE2_INSTALL_STAGING = YES
 GRAPHITE2_LICENSE = LGPL-2.1+
 GRAPHITE2_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
