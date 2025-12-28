Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C099EE784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 07:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92FC1608C6;
	Sun, 28 Dec 2025 07:50:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XBrrrLqlQtMZ; Sun, 28 Dec 2025 07:50:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EE8A606E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766908232;
	bh=POi3UR+UzWUArC6yR0TKv7wgM7eHtHQ5XOytH9vcW2w=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=exdRLmeSnDvDHWx1SsOyc9BSUpyI75Y19Iz1IigjejOdk2PJ2Bw/qYEq24g09ZiNN
	 FDc9nZWDK8h5chUe468uBfIavH1DLa3tCplgXcNG/ldbu6lDAJdfuy2f+46Dilv8YZ
	 T2HVQ/bcxlW9gUI4R94ugoL5ZGiE4pQPQ5AxAqEFt0e5WHk4fUOjFSCY+JWDJxzaGS
	 p0StB3YSGdC3MgqwrRLsujm4oalOAXXGpl+4Vxs3Hql4UccyxQca4AJH6lTznhbVqm
	 ZKhUfF/ZJjzAPF+sKqa3GaCvG+OdCDp+3YcTBKQkfj+gRaojCrAAHAg9qTnTYxPkyL
	 n4yhLWmCFus+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EE8A606E9;
	Sun, 28 Dec 2025 07:50:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 208311E1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1240260844
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yke7fGQlpMUf for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 07:50:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AE155606E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE155606E9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE155606E9
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:50:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 59236A4C2229;
 Sun, 28 Dec 2025 08:48:36 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35324)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vZlVp-000000004ex-0dF3;
 Sun, 28 Dec 2025 07:48:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Jianhui Zhao <zhaojh329@gmail.com>
Date: Sun, 28 Dec 2025 08:48:04 +0100
Message-ID: <20251228074822.3370464-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251228074822.3370464-1-bernd@kuhls.net>
References: <20251228074822.3370464-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766908116;
 bh=bSiKqRKgAhuclAiFJgyXKLmHQPZ/estKUzpUll472bw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ij4ddIAHEr5rbvNrJf2l2I0zGdbjNgUbcpaPMA2v02SD/xImyrcEkCsORVvidsiRL
 XNgn/AbJaGlck4pim45/mf8QoXC049rXAxYIBIij/sw/xJPfkImrcCTuou+UdfhLYa
 NMt2REHTouPjvWlTW5U6D+PnngQieSbZjDnqH+HXABsDgI3N1m5Lz8gjKCy5+YyOZJ
 o7/IPReU/YPZv+rrEYhhr6sShyZZR6fWoVpVy3sj/GhDxMUbhAI7ChDjnXstSTf/Nn
 Iu0i46JoEIVdZJCbxuLtwJdLKLe9HXoLNCcXXe/O49k0WHOwAQF7rGd+63NPTroWMZ
 zEU5BLADbNZSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ij4ddIAH
Subject: [Buildroot] [PATCH v6 09/26] package/libuwsc: remove package
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
index 87ef1b7424..3087a04789 100644
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
index 9da9957d33..c18b901f9d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1629,7 +1629,6 @@ F:	package/qt6/
 
 N:	Jianhui Zhao <zhaojh329@gmail.com>
 F:	package/libuhttpd/
-F:	package/libuwsc/
 F:	package/rtty/
 
 N:	Jiaxun Yang <jiaxun.yang@flygoat.com>
diff --git a/package/Config.in b/package/Config.in
index 6874d8a0ee..3c1ba3e6be 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2095,7 +2095,6 @@ menu "Networking"
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
