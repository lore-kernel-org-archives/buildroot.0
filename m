Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A02E95A79
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 11:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36A7340812;
	Tue, 30 Dec 2025 11:46:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qy-6a482Y_JH; Tue, 30 Dec 2025 11:46:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2ADB44080C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767095211;
	bh=Hu3pp6YTlOgPCsvFg8rpkuE9ltKORiyE/BwUCj9xHUc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pIuVDF1zyrmqAa6mVNKmYa0UZPLdzQyuJX/266aouAeFAz0zQPotpwmhV3/bm1IWT
	 9T30zZLdWc0Jq241aI0q7jsCWB2Ru0zMStOqf/NzLY6PCl23KYcBMMZaZaSEBqAVlH
	 ALYYI1LUpOmfkYX4WegFQoc7U0ZfsQO2qy6+FfwGatyyJikxl9ZWmj1IqmzwO73Q/D
	 IrpbR30CIe0sYHkEPZYG3UgYbTJ02ZzDBmqu9GduO7xw94Jv2i2aQw3PCDE9DJSPel
	 4o2S263Xlf0L20zl7OYtypaenSX0cquh5Ltd1jNh4mcJ2AvWd+LG9CdaVzffktorLB
	 p8HLZQLX4rhhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2ADB44080C;
	Tue, 30 Dec 2025 11:46:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 91BB8D8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F7DB402EA
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:46:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cpwgO76EibIb for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 11:46:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5DD3A400A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DD3A400A1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5DD3A400A1
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:46:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 59E5FA4C2A61;
 Tue, 30 Dec 2025 12:46:31 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54702)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vaYBG-000000003Vt-0FGW;
 Tue, 30 Dec 2025 11:46:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Romain Naour <romain.naour@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Tue, 30 Dec 2025 12:45:25 +0100
Message-ID: <20251230114545.2236640-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251230114545.2236640-1-bernd@kuhls.net>
References: <20251230114545.2236640-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767095191;
 bh=1cOSzY/sE7NSq9JpEmJz7PUOT9ocWvqrUh+Ll+JC+Yo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=PBqu67rsIVra7ApYoGXsuVmTlK0+Cztyf8WcIM+nV4wPPRwrZZcpqleo/snK/dFDX
 wybGjNB9jeuRGY12v8n4wGQ/CRmKBWq9EG/nDGByedjXM+xV8YDeqLoG2IIzyk/Qds
 kNPL8WFT4QweC+06aH2z8LyKYpGoqrK1tW+YSNAtpx1Y/9zsEw61pxRUeuF1ljgRXm
 k5OE7UZwRYV4MhPse/pjNg+55LokVJUgG70fOa8oX89hkVBhiJYgeIR4KaDITwKUZW
 Ujsy2qs/q6lvZq35JNNXCWiyvBWmFEX0aDQpAyZbxBhvZj7WRh8gDbHI2GcI/BUeyC
 +6xMei5bOR8MA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=PBqu67rs
Subject: [Buildroot] [PATCH v9 04/19] package/sconeserver: remove package
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
Cc: Simon Dawson <spdawson@gmail.com>
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
index 3e402e3161..04eb8d62b9 100644
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
index f71fdc7a3a..37b8904751 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3071,7 +3071,6 @@ F:	package/neard/
 F:	package/neardal/
 F:	package/owl-linux/
 F:	package/rapidjson/
-F:	package/sconeserver/
 F:	package/sound-theme-borealis/
 F:	package/sound-theme-freedesktop/
 F:	package/vlc/
diff --git a/package/Config.in b/package/Config.in
index 960b166ae6..7aa3d9e51f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2633,7 +2633,6 @@ endif
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
