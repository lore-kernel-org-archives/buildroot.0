Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F182E92FCA
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 17:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52EBD80EBC;
	Mon, 29 Dec 2025 17:54:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I7vei7HUUmgA; Mon, 29 Dec 2025 17:54:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DEB3812B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767030871;
	bh=5jgooGlZfdDGQqmiTlYqCH6Uz4KQwOUBTfSQRD9WAqY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sJ3oVMNIRklg6W6+zzSKMFpu3I/amPlwpNhSKFLGsYmFTyEG+C4A/nuwVLaRn9cU1
	 nEy7NuRVHsSz17oTYcysXNLXhPC8Y+5TX80wn6XPhoxA3M5yEDKCipXugzGHfz4Fg6
	 TTXdeOli/G4xhf2pDJEXzvDqr5kwfvECe/kPChJsVKhbxfeXwuSigfbTiwzawGjNZQ
	 fsXDHpJzUTwUIASXI5hKELcG2m9o2Jc6TXs5vph7YM7FXkBOzXxCXt4CRQG1Zl8iKT
	 VJ2SPcx+i74U+qeiI+cYwFV2DwgOj9kvQOd2B8KitZQpiX6KsJMlHNliP7DxOwJ0i3
	 lmonV5MWloIKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DEB3812B9;
	Mon, 29 Dec 2025 17:54:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B2CBDD8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4DC3407CF
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:54:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KD6zLw91MbBM for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 17:54:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 90B3E4074C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90B3E4074C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 90B3E4074C
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:54:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C82E3A4C25A2;
 Mon, 29 Dec 2025 18:52:09 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38202)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vaHPW-0000000012P-0GqV;
 Mon, 29 Dec 2025 17:52:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Romain Naour <romain.naour@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Jianhui Zhao <zhaojh329@gmail.com>
Date: Mon, 29 Dec 2025 18:51:37 +0100
Message-ID: <20251229175158.3548903-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251229175158.3548903-1-bernd@kuhls.net>
References: <20251229175158.3548903-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767030729;
 bh=9RCurTm7Ercm6XeKuML029wqbtGUrUgufSJ3cNvEvvo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=sm1xUkoko+0ExQOqjjoc/pZSnPZDFERGb3oJy+kkdtatU0C9Kp8+rwyRF6p0oIRxK
 YgzqVEtsYMM/yt5mWnrS1yX8WMYKO34ecOQJdWktoUMtlVunq2EBVyHkZOkAWbuNqt
 LCeC3+wgvl3E4xz0xw6WHHpNJTRFBueB0vQgybqnfDH7ugoFHvEYfnhs2VeYnDxJMo
 7grgSjEcZilNpu9gsGjowlJ8OSjUDepBBV45ejEVLoa+E3hNlewaS8rmcfNazA3++V
 mX+n+QbC2iBsfoJVeL4Ak9EV/GbxQmFnDjRW42ZiOrkZOC3lqCPNDkxMBwS/fkbpAS
 /JXqvZTJYhiOA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=sm1xUkok
Subject: [Buildroot] [PATCH v7 09/29] package/libuwsc: remove package
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
development since 2021.

Fixes:
https://autobuild.buildroot.net/results/f6b/f6b0c136703e0cf38c052e6a6a3ef91cdcb797a0/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Jianhui Zhao <zhaojh329@gmail.com>
---
 Config.in.legacy                              |  6 +++
 DEVELOPERS                                    |  1 -
 package/Config.in                             |  1 -
 ...001-CMakeLists.txt-add-BUILD_EXAMPLE.patch | 34 ------------
 .../libuwsc/0002-fix-bad-indentation.patch    | 26 ---------
 .../0003-src-ssl.c-fix-wolfssl-build.patch    | 37 -------------
 package/libuwsc/Config.in                     |  8 ---
 package/libuwsc/libuwsc.hash                  |  3 --
 package/libuwsc/libuwsc.mk                    | 53 -------------------
 9 files changed, 6 insertions(+), 163 deletions(-)
 delete mode 100644 package/libuwsc/0001-CMakeLists.txt-add-BUILD_EXAMPLE.patch
 delete mode 100644 package/libuwsc/0002-fix-bad-indentation.patch
 delete mode 100644 package/libuwsc/0003-src-ssl.c-fix-wolfssl-build.patch
 delete mode 100644 package/libuwsc/Config.in
 delete mode 100644 package/libuwsc/libuwsc.hash
 delete mode 100644 package/libuwsc/libuwsc.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 5987e9777c..7ff34b6801 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_LIBUWSC
+	bool "libuwsc has been removed"
+	select BR2_LEGACY
+	help
+	  libuwsc is unmaintained and has been removed
+
 config BR2_PACKAGE_LIBIQRF
 	bool "libiqrf has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 60efaf33b7..ab68fd2b2c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1633,7 +1633,6 @@ F:	package/qt6/
 
 N:	Jianhui Zhao <zhaojh329@gmail.com>
 F:	package/libuhttpd/
-F:	package/libuwsc/
 F:	package/rtty/
 
 N:	Jiaxun Yang <jiaxun.yang@flygoat.com>
diff --git a/package/Config.in b/package/Config.in
index 22b6b7fab4..bef6ae7b22 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2097,7 +2097,6 @@ menu "Networking"
 	source "package/libupnpp/Config.in"
 	source "package/liburiparser/Config.in"
 	source "package/libutp/Config.in"
-	source "package/libuwsc/Config.in"
 	source "package/libvncserver/Config.in"
 	source "package/libwebsockets/Config.in"
 	source "package/libyang/Config.in"
diff --git a/package/libuwsc/0001-CMakeLists.txt-add-BUILD_EXAMPLE.patch b/package/libuwsc/0001-CMakeLists.txt-add-BUILD_EXAMPLE.patch
deleted file mode 100644
index 87f343a9d9..0000000000
--- a/package/libuwsc/0001-CMakeLists.txt-add-BUILD_EXAMPLE.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From bb71b21eb9407479ad729b3c858b0fc350fae335 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 21 Feb 2021 19:39:59 +0100
-Subject: [PATCH] CMakeLists.txt: add BUILD_EXAMPLE
-
-Allow the user to disable example
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/zhaojh329/libuwsc/commit/bb71b21eb9407479ad729b3c858b0fc350fae335
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- CMakeLists.txt | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 110d933..c52ab79 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -2,7 +2,11 @@ cmake_minimum_required(VERSION 2.8)
- 
- project(libuwsc C)
- 
-+option(BUILD_EXAMPLE "Build example" ON)
-+
- list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/Modules/")
- 
- add_subdirectory(src)
--add_subdirectory(example)
-+if(BUILD_EXAMPLE)
-+    add_subdirectory(example)
-+endif()
--- 
-2.25.1
-
diff --git a/package/libuwsc/0002-fix-bad-indentation.patch b/package/libuwsc/0002-fix-bad-indentation.patch
deleted file mode 100644
index 77cae92cf2..0000000000
--- a/package/libuwsc/0002-fix-bad-indentation.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 8cb416140741a596235b8acc46b2b119b13ebfab Mon Sep 17 00:00:00 2001
-From: Rosen Penev <rosenp@gmail.com>
-Date: Tue, 6 Jul 2021 21:01:52 -0700
-Subject: [PATCH] fix bad indentation
-
-Fixes error with GCC11.
-
-Upstream: https://github.com/zhaojh329/libuwsc/commit/8cb416140741a596235b8acc46b2b119b13ebfab
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/lua/uwsc_lua.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/lua/uwsc_lua.c b/src/lua/uwsc_lua.c
-index de6932e..84689fe 100644
---- a/src/lua/uwsc_lua.c
-+++ b/src/lua/uwsc_lua.c
-@@ -178,7 +178,7 @@ static int uwsc_lua_on(lua_State *L)
-     else
-         luaL_argcheck(L, false, 2, "available event name: open message error close");
- 
--	return 0;
-+    return 0;
- }
- 
- static int __uwsc_lua_send(lua_State *L, int op)
diff --git a/package/libuwsc/0003-src-ssl.c-fix-wolfssl-build.patch b/package/libuwsc/0003-src-ssl.c-fix-wolfssl-build.patch
deleted file mode 100644
index 4c652a63c2..0000000000
--- a/package/libuwsc/0003-src-ssl.c-fix-wolfssl-build.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 1c3579e99163a13d622c3ef44088c23d5eea306d Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 14 Jan 2024 16:44:13 +0100
-Subject: [PATCH] src/ssl.c: fix wolfssl build
-
-wolfssl/options.h must also be included by clients to avoid the
-following build failure because OPENSSL_ALL won't be defined:
-
-/home/autobuild/autobuild/instance-6/output-1/build/libuwsc-3.3.5/src/ssl.c:62:5: error: unknown type name 'SSL_CTX'
-   62 |     SSL_CTX *ctx;
-      |     ^~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/edc49cce5b1f456d980841f4c315e7cd784b1561
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: N/A (already fixed by
-https://github.com/zhaojh329/ssl/commit/c40ebcd7b4277321acbbd4b00b4b10fd363c7a97)
----
- src/ssl.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/ssl.c b/src/ssl.c
-index 3640022..6a3d250 100644
---- a/src/ssl.c
-+++ b/src/ssl.c
-@@ -54,6 +54,7 @@ struct uwsc_ssl_ctx {
- #include <openssl/err.h>
- #elif UWSC_HAVE_WOLFSSL
- #define WC_NO_HARDEN
-+#include <wolfssl/options.h>
- #include <wolfssl/openssl/ssl.h>
- #include <wolfssl/openssl/err.h>
- #endif
--- 
-2.43.0
-
diff --git a/package/libuwsc/Config.in b/package/libuwsc/Config.in
deleted file mode 100644
index ae99b6d2dc..0000000000
--- a/package/libuwsc/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_LIBUWSC
-	bool "libuwsc"
-	select BR2_PACKAGE_LIBEV
-	help
-	  A Lightweight and fully asynchronous WebSocket client
-	  library based on libev.
-
-	  https://github.com/zhaojh329/libuwsc
diff --git a/package/libuwsc/libuwsc.hash b/package/libuwsc/libuwsc.hash
deleted file mode 100644
index f99dfb4c5d..0000000000
--- a/package/libuwsc/libuwsc.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  a06b7324671e181ffe3165e93e6f94c7ac1380f69e32a52e80c8da7016acd60d  libuwsc-3.3.5.tar.gz
-sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/libuwsc/libuwsc.mk b/package/libuwsc/libuwsc.mk
deleted file mode 100644
index 051ea411fa..0000000000
--- a/package/libuwsc/libuwsc.mk
+++ /dev/null
@@ -1,53 +0,0 @@
-################################################################################
-#
-# libuwsc
-#
-################################################################################
-
-LIBUWSC_VERSION = 3.3.5
-LIBUWSC_SITE = https://github.com/zhaojh329/libuwsc/releases/download/v$(LIBUWSC_VERSION)
-LIBUWSC_LICENSE = MIT
-LIBUWSC_LICENSE_FILES = LICENSE
-LIBUWSC_INSTALL_STAGING = YES
-LIBUWSC_DEPENDENCIES = libev
-
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-LIBUWSC_DEPENDENCIES += openssl
-LIBUWSC_CONF_OPTS += \
-	-DUWSC_SSL_SUPPORT=ON \
-	-DUWSC_USE_MBEDTLS=OFF \
-	-DUWSC_USE_OPENSSL=ON \
-	-DUWSC_USE_WOLFSSL=OFF
-else ifeq ($(BR2_PACKAGE_WOLFSSL_ALL),y)
-LIBUWSC_DEPENDENCIES += wolfssl
-LIBUWSC_CONF_OPTS += \
-	-DUWSC_SSL_SUPPORT=ON \
-	-DUWSC_USE_MBEDTLS=OFF \
-	-DUWSC_USE_OPENSSL=OFF \
-	-DUWSC_USE_WOLFSSL=ON
-else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
-LIBUWSC_DEPENDENCIES += mbedtls
-LIBUWSC_CONF_OPTS += \
-	-DUWSC_SSL_SUPPORT=ON \
-	-DUWSC_USE_MBEDTLS=ON \
-	-DUWSC_USE_OPENSSL=OFF \
-	-DUWSC_USE_WOLFSSL=OFF
-else
-LIBUWSC_CONF_OPTS += -DUWSC_SSL_SUPPORT=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_LUA):$(BR2_STATIC_LIBS),y:)
-LIBUWSC_DEPENDENCIES += lua
-LIBUWSC_CONF_OPTS += -DUWSC_LUA_SUPPORT=ON
-else
-LIBUWSC_CONF_OPTS += -DUWSC_LUA_SUPPORT=OFF
-endif
-
-# BUILD_SHARED_LIBS is handled in pkg-cmake.mk as it is a generic cmake variable
-ifeq ($(BR2_SHARED_STATIC_LIBS),y)
-LIBUWSC_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
-else ifeq ($(BR2_SHARED_LIBS),y)
-LIBUWSC_CONF_OPTS += -DBUILD_STATIC_LIBS=OFF
-endif
-
-$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
