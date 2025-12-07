Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA81D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 14:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 270FA605EB;
	Sun,  7 Dec 2025 14:47:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yUkaHAftbYyC; Sun,  7 Dec 2025 14:47:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D42660AC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765118846;
	bh=ZgyZUM1SM3ZQF58QokfJ02LaY1scv3KGgaslJjUV/iU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=VBFprS9WiCgesacypPH6XGCBYgBM4tWZZYRM3CC+tGCvVkjZ2Om19h6rgXLIox6X0
	 /Bf8EMIMqS3dFPGUXdDs68eVOZ2DPuaqh7Iyvgjbz4+/P728PR4TmR/81bn9S7y+Hb
	 6LhHTImkRcfryS5nTajmfCrdgIeMNhhtE161NpeVv1yGFNjekiehcMwVoQg04SLjMg
	 Lvg/0QxGTukU4+DNO2MOGnjxX/fVtcrkPQrwGAZYyz83ju35S4KT9jYLyceTMhEnia
	 YTmR0KoYdD3nAPdp2RLhld1LFm6Q5KOCmESS4FYTteiKHz6QSvOmHyqsWAJjvgWJoT
	 GHkzquvwtSalw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D42660AC8;
	Sun,  7 Dec 2025 14:47:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D2948151
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF690821FB
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:47:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s6XsAQw1S7Uz for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 14:47:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B06DA80D5F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B06DA80D5F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B06DA80D5F
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 14:47:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E2C74A4C0CC2;
 Sun,  7 Dec 2025 15:42:58 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56734)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSFyI-00000000416-0CKg;
 Sun, 07 Dec 2025 14:42:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Dec 2025 15:42:33 +0100
Message-ID: <20251207144243.3696572-24-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251207144243.3696572-1-bernd@kuhls.net>
References: <20251207144243.3696572-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765118578;
 bh=RbOtKux1aDXZmFd6HUHdluEPfx6wF/RMT60uFsB7vmQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=hkOAbU904HkQzfk1pVjf/4NNHmOe3Jl+8/jMXHCRz3DngNrYhDCbdFv8l+78EfwPL
 2FBncTjCS5Q8X60AAEbOO0GV1n3/TUAfN5xUehdj6eD6DATbMqHuPQhRKGnkxAzHXc
 hHOwHRawvqFv4jGmYhuwnBB+UDMzrLqTYNJvzlOWAI+mFOvHj/xYkhOWxuU6/HjJWU
 5sMrZL9DTCM33GhIQ2AiG/yDO5fY1H10XYUwOPVYLTyq6/fL8tMnHUUvcFTO2Mm8kP
 DEfpbcHcE1WN4CfAYKcL/vxZH4Z9J1z+0Ay8xKiCZWSac7rLn/CUklezwOdaFdkbyy
 ScGZ7Cj4GdZOw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=hkOAbU90
Subject: [Buildroot] [PATCH/next 24/33] package/{libtorrent,
 rtorrent}: bump version to 0.15.3
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
Cc: Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Jean Burgat <jeanburgat33@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Alessandro Partesotti <a.partesotti@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Prabhu Sannachi <prabhu.sannachi@collins.com>,
 Denis Bodor <lefinnois@lefinnois.net>,
 James Hilliard <james.hilliard1@gmail.com>, Jianhui Zhao <zhaojh329@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 James Knight <james.knight@collins.com>, Simon Dawson <spdawson@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Michael Vetter <jubalh@iodoru.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed patches which are included in this release.

Switched SITE to github according to http://rtorrent.net/

Both packages need to be bumped together due to version check for
libtorrent by rtorrent:
https://github.com/rakshasa/rtorrent/commit/6f8c1246dc013d1d5c39ecd66373346ac42fe746

Fixes:
https://autobuild.buildroot.net/results/a2e/a2e609caecc26f67134d0fed1c239e8d148e07fd/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  2 --
 ...01-libtorrent.pc.in-add-Libs.Private.patch | 30 ----------------
 package/libtorrent/libtorrent.hash            |  2 +-
 package/libtorrent/libtorrent.mk              |  5 +--
 ...disable-execinfo-option-to-configure.patch | 34 -------------------
 package/rtorrent/rtorrent.hash                |  2 +-
 package/rtorrent/rtorrent.mk                  |  7 ++--
 7 files changed, 8 insertions(+), 74 deletions(-)
 delete mode 100644 package/libtorrent/0001-libtorrent.pc.in-add-Libs.Private.patch
 delete mode 100644 package/rtorrent/0001-Added--disable-execinfo-option-to-configure.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 3b3726bf04..dc70113fd1 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -607,7 +607,6 @@ package/libtalloc/0001-buildtools-wafsamba-add-disable-stack-protector-opti.patc
 package/libtelnet/0001-fix-compilation-without-zlib.patch lib_patch.Upstream
 package/libtomcrypt/0001-fix-CVE-2019-17362.patch lib_patch.Upstream
 package/libtommath/0001-Build-test-bn_mp_set_double-c-on-more-platforms.patch lib_patch.Upstream
-package/libtorrent/0001-libtorrent.pc.in-add-Libs.Private.patch lib_patch.Upstream
 package/libubootenv/0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch lib_patch.Upstream
 package/libuio/0001-configure.ac-set-automake-strictness-to-foreign.patch lib_patch.Upstream
 package/liburcu/0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch lib_patch.Upstream
@@ -909,7 +908,6 @@ package/rpi-userland/0005-dtmerge-add-missing-include-for-va_list.patch lib_patc
 package/rpi-userland/0006-interface-vcos-pthreads-CMakeLists.txt-fix-build-wit.patch lib_patch.Upstream
 package/rpi-userland/0007-GLES2-gl2ext.h-add-GLint64-GLuint64-and-GLsync-typed.patch lib_patch.Upstream
 package/rt-tests/0001-Fix-a-build-issue-with-uClibc-ng.patch lib_patch.Upstream
-package/rtorrent/0001-Added--disable-execinfo-option-to-configure.patch lib_patch.Upstream
 package/rubix/0001-dont-use-legacy-functions.patch lib_patch.Upstream
 package/rubix/0002-misc-fixes.patch lib_patch.Sob lib_patch.Upstream
 package/rygel/S99rygel Shellcheck lib_sysv.Indent lib_sysv.Variables
diff --git a/package/libtorrent/0001-libtorrent.pc.in-add-Libs.Private.patch b/package/libtorrent/0001-libtorrent.pc.in-add-Libs.Private.patch
deleted file mode 100644
index 7d363d2939..0000000000
--- a/package/libtorrent/0001-libtorrent.pc.in-add-Libs.Private.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From a86219e725441eb87321fa3e24531dafa54ee674 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 20 Oct 2019 20:23:19 +0200
-Subject: [PATCH] libtorrent.pc.in: add Libs.Private
-
-Add Libs.Private: -lz so applications that want to link statically with
-libtorrent (such as rtorrent) will know that they must link with -lz
-
-Fixes:
- - http://autobuild.buildroot.org/results/075598e1699c2ac20a4dfbcb5695bbb7343f9a86
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/rakshasa/libtorrent/pull/202]
----
- libtorrent.pc.in | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libtorrent.pc.in b/libtorrent.pc.in
-index cf6612bc..6108f7e9 100644
---- a/libtorrent.pc.in
-+++ b/libtorrent.pc.in
-@@ -7,4 +7,5 @@ Name: libtorrent
- Description: A BitTorrent library
- Version: @VERSION@
- Libs: -L${libdir} -ltorrent
-+Libs.Private: -lz
- Cflags: -I${includedir}
--- 
-2.23.0
-
diff --git a/package/libtorrent/libtorrent.hash b/package/libtorrent/libtorrent.hash
index 5c755c8bef..0895fcd87e 100644
--- a/package/libtorrent/libtorrent.hash
+++ b/package/libtorrent/libtorrent.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ed115a28f4ae8cfcd33b94a597c076ca74fd549867a26e4fac9505c27288e983  libtorrent-0.13.8.tar.gz
+sha256  6a0b01e4c0da817fc06fa0cd0ca539d79a19eaed617e16da9e2d8ba066ea95dd  libtorrent-0.15.3.tar.gz
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/libtorrent/libtorrent.mk b/package/libtorrent/libtorrent.mk
index b966a72788..e4189ba957 100644
--- a/package/libtorrent/libtorrent.mk
+++ b/package/libtorrent/libtorrent.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBTORRENT_VERSION = 0.13.8
-LIBTORRENT_SITE = http://rtorrent.net/downloads
+# When updating the version, please also update rtorrent
+LIBTORRENT_VERSION = 0.15.3
+LIBTORRENT_SITE = https://github.com/rakshasa/rtorrent/releases/download/v$(LIBTORRENT_VERSION)
 LIBTORRENT_DEPENDENCIES = host-pkgconf zlib
 LIBTORRENT_CONF_OPTS = --enable-aligned \
 	--disable-instrumentation \
diff --git a/package/rtorrent/0001-Added--disable-execinfo-option-to-configure.patch b/package/rtorrent/0001-Added--disable-execinfo-option-to-configure.patch
deleted file mode 100644
index 4ff4182b61..0000000000
--- a/package/rtorrent/0001-Added--disable-execinfo-option-to-configure.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 582e4e40256b43d3e5322168f1e1ed71ca70ab64 Mon Sep 17 00:00:00 2001
-From: rakshasa <sundell.software@gmail.com>
-Date: Wed, 16 Jun 2021 23:29:01 +0900
-Subject: [PATCH] Added '--disable-execinfo' option to configure.
-
-[Retrieved (and backported) from:
-https://github.com/rakshasa/rtorrent/commit/582e4e40256b43d3e5322168f1e1ed71ca70ab64]
-Signed-off-by: Fabrice Fontaine <Fontaine.fabrice@gmail.com>
----
- configure.ac | 11 ++++++++++-
- 1 file changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index e3e7d3f1..0f45bc6a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -27,7 +27,15 @@ TORRENT_WITHOUT_VARIABLE_FDSET
- 
- AC_SYS_LARGEFILE
- 
--TORRENT_CHECK_EXECINFO
-+AC_ARG_ENABLE(execinfo,
-+  AC_HELP_STRING([--disable-execinfo], [disable libexecinfo [[default=enable]]]),
-+  [
-+    if test "$enableval" = "yes"; then
-+      TORRENT_CHECK_EXECINFO
-+    fi
-+  ],[
-+    TORRENT_CHECK_EXECINFO
-+  ])
- 
- TORRENT_ENABLE_ARCH
- TORRENT_WITH_SYSROOT
- 
diff --git a/package/rtorrent/rtorrent.hash b/package/rtorrent/rtorrent.hash
index 0403664639..fa3d8da0d1 100644
--- a/package/rtorrent/rtorrent.hash
+++ b/package/rtorrent/rtorrent.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9edf0304bf142215d3bc85a0771446b6a72d0ad8218efbe184b41e4c9c7542af  rtorrent-0.9.8.tar.gz
+sha256  6dfd42c19e6ff2f5ee8b99855314cef4f10bd669663c2670cc85fd6a4e2c4e40  rtorrent-0.15.3.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/rtorrent/rtorrent.mk b/package/rtorrent/rtorrent.mk
index 210b1d34dc..815bf0044b 100644
--- a/package/rtorrent/rtorrent.mk
+++ b/package/rtorrent/rtorrent.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-RTORRENT_VERSION = 0.9.8
-RTORRENT_SITE = http://rtorrent.net/downloads
+# When updating the version, please also update libtorrent
+RTORRENT_VERSION = 0.15.3
+RTORRENT_SITE = https://github.com/rakshasa/rtorrent/releases/download/v$(RTORRENT_VERSION)
 RTORRENT_DEPENDENCIES = host-pkgconf libcurl libtorrent ncurses
 RTORRENT_LICENSE = GPL-2.0
 RTORRENT_LICENSE_FILES = COPYING
-# We're patching configure.ac
-RTORRENT_AUTORECONF = YES
 RTORRENT_CONF_OPTS = --disable-execinfo
 
 $(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
