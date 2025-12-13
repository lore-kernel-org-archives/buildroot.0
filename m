Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59F4D5B165
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 20:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDB4D816D9;
	Sat, 13 Dec 2025 20:27:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x2Ii9_5F7SUy; Sat, 13 Dec 2025 20:27:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5CA48109C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765657665;
	bh=gkLIbwkwQvd38+O9w0W+Iz1z3C92jZTQ+i3i/a0onpc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PwK2vBwNQZ9AtCr6cOgFWf9gQ3JCOWPm4/MrugUo0f+NHndW3SQQAmzVSbJZcn1Ot
	 3nl2ePTmai/6KKL/HjFyS8j137wnXbjd2Xs/szhi2JAIVMdQvELcVngDF1SUeAJFrK
	 aPk55SZA3Jfv0AB4M6gb2Dl19DiR+1c3xzZEd5iBsm3fHv+owuhtH50yLh0E404gHc
	 nHHSd/ra+W8ux+py3soe+bBsOcnmtEq3HvX8dOXnjH8gkU62Y2wy10BMiym4xbcjYj
	 eAhVJedu93SDpk4GymyfxrHSgglj9JdQH6ladykLXScFupH5JWQLjJ2HPL8n622MWA
	 iwd+lghuFnKVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5CA48109C;
	Sat, 13 Dec 2025 20:27:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 41A5A13D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 20:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33E6D608B5
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 20:27:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G6dQODQ6NjdV for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 20:27:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1DF98608AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DF98608AE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1DF98608AE
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 20:27:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc21.dip0.t-ipconnect.de [79.214.204.33])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 72C89A4C3DC1;
 Sat, 13 Dec 2025 21:25:15 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41122)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUWAr-000000003Sm-2YDc;
 Sat, 13 Dec 2025 20:25:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Gilles Talis <gilles.talis@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>,
 Jianhui Zhao <zhaojh329@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Jan Heylen <jan.heylen@nokia.com>,
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Simon Dawson <spdawson@gmail.com>, Ben Boeckel <mathstuf@gmail.com>
Date: Sat, 13 Dec 2025 21:25:00 +0100
Message-ID: <20251213202503.1348845-14-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251213202503.1348845-1-bernd@kuhls.net>
References: <20251213202503.1348845-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765657515;
 bh=8ah0Z8tSHBDCtaCQQhvpZzyoaLEp6PHHZBUIepHxpt8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=saxHzzWnqkVLInLy5tUtfWmKOjsVT10rsQq4TcQGVgPIjj71awOQ3ltFKaSJx/NUS
 H5PGzpGT3kcPoub/mILneEAsFIKtG/oH96DyAwsG1JwphtJDXzsLp+u1PvKbh4q2jQ
 xlI+a0q5UzZQhcwEjgLoTUsvbE584y3NYSJpVUG/Z4MUvWoPJIXg7WBps0SfXSYLWK
 Cwg/DXZN4wzUI1bHRhmk/qn1d2yo0taV/8rZSydBH+gjlI6Td9GL9a0pw6CwQ7KjM2
 SwZtmHxF+ofCM3khMxZtD/lBWcGOifkz2/A5a3uzldv1xEfIkm0XXC2OhPIrh74jnM
 ZHaIxg3ag1nYQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=saxHzzWn
Subject: [Buildroot] [PATCH v2 14/16] package/sconeserver: remove package
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

Analysis of https://github.com/sconemad/sconeserver:
last non-buildroot related commit: Aug 2019
last bug report: 0 open
last pull request: 1 open (buildroot-related)

The package is broken with cmake 4 and no other package depends on it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                     |  6 ++
 DEVELOPERS                           |  1 -
 package/Config.in                    |  1 -
 package/sconeserver/Config.in        | 96 ----------------------------
 package/sconeserver/sconeserver.hash |  3 -
 package/sconeserver/sconeserver.mk   | 93 ---------------------------
 6 files changed, 6 insertions(+), 194 deletions(-)
 delete mode 100644 package/sconeserver/Config.in
 delete mode 100644 package/sconeserver/sconeserver.hash
 delete mode 100644 package/sconeserver/sconeserver.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 9ab95c32a5..cb6ec4c7de 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_SCONESERVER
+	bool "sconeserver has been removed"
+	select BR2_LEGACY
+	help
+	  sconeserver was deprecated upstream and has been removed
+
 config BR2_PACKAGE_QJSON
 	bool "qjson has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index a9041890f4..952f2ebda1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3054,7 +3054,6 @@ F:	package/neard/
 F:	package/neardal/
 F:	package/owl-linux/
 F:	package/rapidjson/
-F:	package/sconeserver/
 F:	package/sound-theme-borealis/
 F:	package/sound-theme-freedesktop/
 F:	package/vlc/
diff --git a/package/Config.in b/package/Config.in
index ba4efcc8b2..9a771c866b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2627,7 +2627,6 @@ endif
 	source "package/s6-dns/Config.in"
 	source "package/s6-networking/Config.in"
 	source "package/samba4/Config.in"
-	source "package/sconeserver/Config.in"
 	source "package/ser2net/Config.in"
 	source "package/shadowsocks-libev/Config.in"
 	source "package/shairport-sync/Config.in"
diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
deleted file mode 100644
index d1a8a031be..0000000000
--- a/package/sconeserver/Config.in
+++ /dev/null
@@ -1,96 +0,0 @@
-menuconfig BR2_PACKAGE_SCONESERVER
-	bool "sconeserver"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	depends on !BR2_STATIC_LIBS # dlopen()
-	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
-	select BR2_PACKAGE_PCRE
-	select BR2_PACKAGE_ZLIB
-	help
-	  Sconeserver is a modular, object-orientated and extremely
-	  versatile network server framework for GNU/Linux and
-	  UNIX-like platforms.
-
-	  http://www.sconemad.com/sconeserver/
-
-if BR2_PACKAGE_SCONESERVER
-
-comment "Sconeserver modules"
-
-config BR2_PACKAGE_SCONESERVER_BLUETOOTH
-	bool "bluetooth"
-	depends on BR2_USE_WCHAR # bluez5_utils -> libglib2
-	depends on BR2_USE_MMU # bluez5_utils -> dbus
-	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez5_utils -> dbus, libglib2
-	depends on !BR2_STATIC_LIBS # bluez5_utils
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # bluez5_utils
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # bluez5_utils
-	select BR2_PACKAGE_BLUEZ5_UTILS
-	help
-	  Bluetooth module for Sconeserver
-
-comment "bluetooth support needs a toolchain w/ wchar, threads, dynamic library, headers >= 3.4"
-	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
-
-config BR2_PACKAGE_SCONESERVER_EXAMPLES
-	bool "examples"
-	help
-	  Example modules for Sconeserver
-
-config BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE
-	bool "http::sconesite"
-	select BR2_PACKAGE_LIBXML2
-	help
-	  http::sconesite module for Sconeserver
-
-config BR2_PACKAGE_SCONESERVER_LOCATION
-	bool "location"
-	depends on BR2_USE_MMU # gpsd
-	depends on BR2_TOOLCHAIN_HAS_THREADS # gpsd
-	depends on !BR2_STATIC_LIBS # gpsd
-	select BR2_PACKAGE_GPSD
-	help
-	  Location module for Sconeserver
-
-comment "location support needs a toolchain w/ theads, dynamic library"
-	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-
-config BR2_PACKAGE_SCONESERVER_MATHS
-	bool "maths"
-	select BR2_PACKAGE_MPFR
-	help
-	  Mathematics module for Sconeserver
-
-config BR2_PACKAGE_SCONESERVER_MYSQL
-	bool "mysql"
-	depends on BR2_USE_MMU # mysql
-	select BR2_PACKAGE_MARIADB
-	help
-	  MySQL module for Sconeserver
-
-config BR2_PACKAGE_SCONESERVER_RSS
-	bool "rss"
-	select BR2_PACKAGE_LIBXML2
-	help
-	  RSS module for Sconeserver
-
-config BR2_PACKAGE_SCONESERVER_SQLITE
-	bool "sqlite"
-	select BR2_PACKAGE_SQLITE
-	help
-	  SQLite module for Sconeserver
-
-config BR2_PACKAGE_SCONESERVER_TESTBUILDER
-	bool "testbuilder"
-	help
-	  Testbuilder module for Sconeserver
-
-endif # BR2_PACKAGE_SCONESERVER
-
-comment "sconeserver needs a toolchain with dynamic library, C++, NPTL"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
-		|| BR2_STATIC_LIBS
diff --git a/package/sconeserver/sconeserver.hash b/package/sconeserver/sconeserver.hash
deleted file mode 100644
index ba86e44ae7..0000000000
--- a/package/sconeserver/sconeserver.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  47552b20579678e49150abe071d9eb55cf23bd13f7f6e4fa085d0612bf6a3431  sconeserver-8d1935919a2013358993a8e9dfa992cbde56e503.tar.gz
-sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
deleted file mode 100644
index bb0da12d4c..0000000000
--- a/package/sconeserver/sconeserver.mk
+++ /dev/null
@@ -1,93 +0,0 @@
-################################################################################
-#
-# sconeserver
-#
-################################################################################
-
-SCONESERVER_VERSION = 8d1935919a2013358993a8e9dfa992cbde56e503
-SCONESERVER_SITE = $(call github,sconemad,sconeserver,$(SCONESERVER_VERSION))
-SCONESERVER_LICENSE = GPL-2.0+
-SCONESERVER_LICENSE_FILES = COPYING
-SCONESERVER_DEPENDENCIES = \
-	host-pkgconf \
-	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt) \
-	pcre \
-	zlib
-# disable image as it fails to build with ImageMagick
-# disable markdown module because its git submodule cmark
-# https://github.com/sconemad/sconeserver/tree/master/markdown
-# has no cross-compile support provided by the sconeserver build system
-SCONESERVER_CONF_OPTS += \
-	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -std=c++11" \
-	-DWITH_IMAGE=OFF \
-	-DWITH_MARKDOWN=OFF
-
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-SCONESERVER_DEPENDENCIES += openssl
-SCONESERVER_CONF_OPTS += -DWITH_SSL=ON
-else
-SCONESERVER_CONF_OPTS += -DWITH_SSL=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_SCONESERVER_BLUETOOTH),y)
-SCONESERVER_DEPENDENCIES += bluez5_utils
-SCONESERVER_CONF_OPTS += -DWITH_BLUETOOTH=ON
-else
-SCONESERVER_CONF_OPTS += -DWITH_BLUETOOTH=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_SCONESERVER_EXAMPLES),y)
-SCONESERVER_CONF_OPTS += -DWITH_EXAMPLES=ON
-else
-SCONESERVER_CONF_OPTS += -DWITH_EXAMPLES=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE),y)
-SCONESERVER_DEPENDENCIES += libxml2
-SCONESERVER_CONF_OPTS += -DWITH_SCONESITE=ON
-else
-SCONESERVER_CONF_OPTS += -DWITH_SCONESITE=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_SCONESERVER_LOCATION),y)
-SCONESERVER_DEPENDENCIES += gpsd
-SCONESERVER_CONF_OPTS += -DWITH_LOCATION=ON
-else
-SCONESERVER_CONF_OPTS += -DWITH_LOCATION=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_SCONESERVER_MATHS),y)
-SCONESERVER_DEPENDENCIES += mpfr
-SCONESERVER_CONF_OPTS += -DWITH_MATHS=ON
-else
-SCONESERVER_CONF_OPTS += -DWITH_MATHS=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_SCONESERVER_MYSQL),y)
-SCONESERVER_DEPENDENCIES += mariadb
-SCONESERVER_CONF_OPTS += -DWITH_MYSQL=ON
-else
-SCONESERVER_CONF_OPTS += -DWITH_MYSQL=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_SCONESERVER_RSS),y)
-SCONESERVER_DEPENDENCIES += libxml2
-SCONESERVER_CONF_OPTS += -DWITH_RSS=ON
-else
-SCONESERVER_CONF_OPTS += -DWITH_RSS=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_SCONESERVER_SQLITE),y)
-SCONESERVER_DEPENDENCIES += sqlite
-SCONESERVER_CONF_OPTS += -DWITH_SQLITE=ON
-else
-SCONESERVER_CONF_OPTS += -DWITH_SQLITE=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_SCONESERVER_TESTBUILDER),y)
-SCONESERVER_CONF_OPTS += -DWITH_TESTBUILDER=ON
-else
-SCONESERVER_CONF_OPTS += -DWITH_TESTBUILDER=OFF
-endif
-
-$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
