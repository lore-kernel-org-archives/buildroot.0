Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62FC5C02188
	for <buildroot@archiver.kernel.org>; Sat, 18 Jan 2025 13:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF6B6607D2;
	Sat, 18 Jan 2025 13:20:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FaEzCcqRUntl; Sat, 18 Jan 2025 13:20:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68F0B6078A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68F0B6078A;
	Sat, 18 Jan 2025 13:20:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DFFE52F6D
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 13:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A92B240131
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 13:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XA7LkHIFsZgI for <buildroot@buildroot.org>;
 Sat, 18 Jan 2025 13:19:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.47;
 helo=mail-wr1-f47.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3AA36404DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AA36404DB
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3AA36404DB
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 13:19:58 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-385de59c1a0so1684049f8f.2
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 05:19:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737206396; x=1737811196;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MEivbC9f/Gz01fE2CO1lqslkDOBOEgkn0tAmOE3fupI=;
 b=YYAcr7QJ+v6SuiYIDckOE2yT27dWjj8sWq7yXZIz8q5SwB0Qa7jK+9+XYtrl8dYz2o
 eZw6oqqWv1MD/Rav/D/pb82Y4nOR4nHzF9rdzZkUnCKIDUV+xUT6LL3RwjY73rqXFogd
 3wCUpr9xe/HCIYX4tPFYW86n2FyBod10lBGNm9Cqa7hCymOrF0TQMS92dSOWt7lW/JlV
 +qnK4jWhVuSLwWizQ1f0B7CA8iuUxLrl/q7Dvh9D3lwvwSnY6XTJONKkh5V98M3Vs/8t
 TGJm2RkO3+J981pii1pJSUn73U9QXxkV6sgK3tRwa5KZkp87S52zct11LjMLVcAO481E
 DpGw==
X-Gm-Message-State: AOJu0YxP/9rnmgX3fCoveyYp50DnIwylwIFYm6JR+AXXBM9gVDTKG7BI
 Z4jBHUq9FH88uvWqr0dXW9lscudADB8u6R1q/Yk+jb47bZMW6jMWIYKkAg==
X-Gm-Gg: ASbGncv8UJ8j+PYIn2m6HYHCpJyOAoCZIsPl3de6T1UNaOGbqTm9Ukr06+AcbOgJTVP
 sZwDGQoRuVG3vbkNoJaJeoZHAwAYpP6HpVR80obWbptHWEoe4EfP9UoUsR1IxsREHnBKPW8etco
 OstU9nAkmi87EQ9X4wviF8oixg6WiDlLJ2Qu6BwjG8S3pqoQqh3az5HEJxxMoAJfoyvK2+MMRGy
 jZOMRv3lUpfzLBcrh9k23GuoWNPmUa3XDUqSrRpBaCMKStW93AqURQ1lHkIpgm3gn16qO/Ptsx2
 PSJ29TD6gMgMb/z+BdpFvKw=
X-Google-Smtp-Source: AGHT+IFfJhhGuSPrbOFt0K4qWsV6Pm1yeUeGzIyTTmmtHSliTC9us4jAnH14JpSnIilu3FJDuqbZbQ==
X-Received: by 2002:a05:6000:402a:b0:38a:a047:6c0b with SMTP id
 ffacd0b85a97d-38bf57a97e0mr7283611f8f.35.1737206395559; 
 Sat, 18 Jan 2025 05:19:55 -0800 (PST)
Received: from thomas-Precision-7670.barco.com
 ([2a02:a03f:eb68:2f00:b22c:3bd:8c8e:f7ef])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c74bf061sm127033465e9.17.2025.01.18.05.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jan 2025 05:19:55 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Date: Sat, 18 Jan 2025 14:19:11 +0100
Message-ID: <20250118131911.1954770-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250118131911.1954770-1-thomas@devoogdt.com>
References: <20250118131911.1954770-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH 2/2] package/lighttpd: add more compile options
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

Added dbi, gnutls, libev, libunwind, mbedtls, nettle, and wolfssl.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
$ cat lighttpd.config
BR2_PACKAGE_LIGHTTPD=y
BR2_PACKAGE_LIGHTTPD_BROTLI=y
BR2_PACKAGE_LIGHTTPD_BZIP2=y
BR2_PACKAGE_LIGHTTPD_DBI=y
BR2_PACKAGE_LIGHTTPD_GNUTLS=y
BR2_PACKAGE_LIGHTTPD_KRB5=y
BR2_PACKAGE_LIGHTTPD_LDAP=y
BR2_PACKAGE_LIGHTTPD_LIBEV=y
BR2_PACKAGE_LIGHTTPD_LUA=y
BR2_PACKAGE_LIGHTTPD_MAXMINDDB=y
BR2_PACKAGE_LIGHTTPD_MBEDTLS=y
BR2_PACKAGE_LIGHTTPD_MYSQL=y
BR2_PACKAGE_LIGHTTPD_NETTLE=y
BR2_PACKAGE_LIGHTTPD_OPENSSL=y
BR2_PACKAGE_LIGHTTPD_PAM=y
BR2_PACKAGE_LIGHTTPD_PCRE=y
BR2_PACKAGE_LIGHTTPD_PGSQL=y
BR2_PACKAGE_LIGHTTPD_WEBDAV=y
BR2_PACKAGE_LIGHTTPD_WOLFSSL=y
BR2_PACKAGE_LIGHTTPD_ZLIB=y
BR2_PACKAGE_LIGHTTPD_ZSTD=y
BR2_PACKAGE_MARIADB=y
BR2_PACKAGE_LINUX_PAM=y
BR2_PACKAGE_LUA=y
$ ./utils/test-pkg -c lighttpd.config -p lighttpd
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: SKIPPED
                             arm-aarch64 [6/6]: OK
6 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
---
 package/lighttpd/Config.in   | 46 +++++++++++++++++++++++++++++
 package/lighttpd/lighttpd.mk | 56 +++++++++++++++++++++++++++++++-----
 2 files changed, 95 insertions(+), 7 deletions(-)

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index 5311f37ae1..1a9a9a277d 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -34,6 +34,23 @@ config BR2_PACKAGE_LIGHTTPD_BZIP2
 	help
 	  Enable bzip2 support for lighttpd mod_deflate.
 
+config BR2_PACKAGE_LIGHTTPD_DBI
+	bool "dbi support"
+	select BR2_PACKAGE_LIBDBI
+	help
+	  Enable dbi support for lighttpd mod_auth mod_vhostdb_dbi.
+
+config BR2_PACKAGE_LIGHTTPD_GNUTLS
+	bool "gnutls support"
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_GNUTLS
+	help
+	  Enable gnutls support for lighttpd mod_auth.
+
+comment "gnutls support needs a toolchain w/ wchar, dynamic library"
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
+
 config BR2_PACKAGE_LIGHTTPD_KRB5
 	bool "krb5 support"
 	select BR2_PACKAGE_LIBKRB5
@@ -50,6 +67,12 @@ config BR2_PACKAGE_LIGHTTPD_LDAP
 comment "ldap support needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
 
+config BR2_PACKAGE_LIGHTTPD_LIBEV
+	bool "libev support"
+	select BR2_PACKAGE_LIBEV
+	help
+	  Enable libev support for lighttpd fdevent handlers.
+
 config BR2_PACKAGE_LIGHTTPD_LUA
 	bool "lua support"
 	depends on BR2_PACKAGE_LUA
@@ -62,6 +85,12 @@ config BR2_PACKAGE_LIGHTTPD_MAXMINDDB
 	help
 	  Enable MaxMind GeoIP2 support. Needed to support mod_maxminddb
 
+config BR2_PACKAGE_LIGHTTPD_MBEDTLS
+	bool "mbedtls support"
+	select BR2_PACKAGE_MBEDTLS
+	help
+	  Enable mbedtls support for lighttpd mod_auth.
+
 config BR2_PACKAGE_LIGHTTPD_MYSQL
 	bool "mysql support"
 	depends on BR2_PACKAGE_MARIADB
@@ -71,6 +100,12 @@ config BR2_PACKAGE_LIGHTTPD_MYSQL
 comment "mysql support needs mariadb"
 	depends on !BR2_PACKAGE_MARIADB
 
+config BR2_PACKAGE_LIGHTTPD_NETTLE
+	bool "nettle support"
+	select BR2_PACKAGE_NETTLE
+	help
+	  Enable nettle support for lighttpd.
+
 config BR2_PACKAGE_LIGHTTPD_OPENSSL
 	bool "openssl support"
 	select BR2_PACKAGE_OPENSSL
@@ -116,6 +151,17 @@ config BR2_PACKAGE_LIGHTTPD_WEBDAV
 	help
 	  Enable webdav support. Needed to support mod_webdav
 
+config BR2_PACKAGE_LIGHTTPD_WOLFSSL
+	bool "wolfssl support"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_WOLFSSL
+	select BR2_PACKAGE_WOLFSSL_ALL
+	help
+	  Enable wolfssl support for lighttpd mod_auth.
+
+comment "wolfssl support needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_LIGHTTPD_ZLIB
 	bool "zlib support"
 	select BR2_PACKAGE_ZLIB
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 3f97e84585..985b9ca513 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -13,17 +13,10 @@ LIGHTTPD_LICENSE_FILES = COPYING
 LIGHTTPD_CPE_ID_VENDOR = lighttpd
 LIGHTTPD_DEPENDENCIES = host-pkgconf xxhash
 LIGHTTPD_CONF_OPTS = \
-	-Dwith_dbi=disabled \
 	-Dwith_fam=disabled \
-	-Dwith_gnutls=false \
-	-Dwith_libev=disabled \
-	-Dwith_libunwind=disabled \
-	-Dwith_mbedtls=false \
-	-Dwith_nettle=false \
 	-Dwith_nss=false \
 	-Dwith_pcre=disabled \
 	-Dwith_sasl=disabled \
-	-Dwith_wolfssl=false \
 	-Dwith_xattr=false \
 	-Dwith_xxhash=enabled \
 	-Dbuild_extra_warnings=false \
@@ -34,6 +27,13 @@ ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
 LIGHTTPD_DEPENDENCIES += libxcrypt
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
+LIGHTTPD_DEPENDENCIES += libunwind
+LIGHTTPD_CONF_OPTS += -Dwith_libunwind=enabled
+else
+LIGHTTPD_CONF_OPTS += -Dwith_libunwind=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_LIGHTTPD_BROTLI),y)
 LIGHTTPD_DEPENDENCIES += brotli
 LIGHTTPD_CONF_OPTS += -Dwith_brotli=enabled
@@ -48,6 +48,20 @@ else
 LIGHTTPD_CONF_OPTS += -Dwith_bzip=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIGHTTPD_DBI),y)
+LIGHTTPD_DEPENDENCIES += libdbi
+LIGHTTPD_CONF_OPTS += -Dwith_dbi=enabled
+else
+LIGHTTPD_CONF_OPTS += -Dwith_dbi=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_LIGHTTPD_GNUTLS),y)
+LIGHTTPD_DEPENDENCIES += gnutls
+LIGHTTPD_CONF_OPTS += -Dwith_gnutls=true
+else
+LIGHTTPD_CONF_OPTS += -Dwith_gnutls=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIGHTTPD_KRB5),y)
 LIGHTTPD_DEPENDENCIES += libkrb5
 LIGHTTPD_CONF_OPTS += -Dwith_krb5=enabled
@@ -62,6 +76,13 @@ else
 LIGHTTPD_CONF_OPTS += -Dwith_ldap=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIGHTTPD_LIBEV),y)
+LIGHTTPD_DEPENDENCIES += libev
+LIGHTTPD_CONF_OPTS += -Dwith_libev=enabled
+else
+LIGHTTPD_CONF_OPTS += -Dwith_libev=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_LIGHTTPD_LUA),y)
 LIGHTTPD_DEPENDENCIES += lua
 LIGHTTPD_CONF_OPTS += -Dwith_lua=true
@@ -76,6 +97,13 @@ else
 LIGHTTPD_CONF_OPTS += -Dwith_maxminddb=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIGHTTPD_MBEDTLS),y)
+LIGHTTPD_DEPENDENCIES += mbedtls
+LIGHTTPD_CONF_OPTS += -Dwith_mbedtls=true
+else
+LIGHTTPD_CONF_OPTS += -Dwith_mbedtls=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIGHTTPD_MYSQL),y)
 LIGHTTPD_DEPENDENCIES += mariadb
 LIGHTTPD_CONF_OPTS += -Dwith_mysql=enabled
@@ -83,6 +111,13 @@ else
 LIGHTTPD_CONF_OPTS += -Dwith_mysql=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIGHTTPD_NETTLE),y)
+LIGHTTPD_DEPENDENCIES += nettle
+LIGHTTPD_CONF_OPTS += -Dwith_nettle=true
+else
+LIGHTTPD_CONF_OPTS += -Dwith_nettle=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIGHTTPD_OPENSSL),y)
 LIGHTTPD_DEPENDENCIES += openssl
 LIGHTTPD_CONF_OPTS += -Dwith_openssl=true
@@ -124,6 +159,13 @@ else
 LIGHTTPD_CONF_OPTS += -Dwith_webdav_props=disabled -Dwith_webdav_locks=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIGHTTPD_WOLFSSL),y)
+LIGHTTPD_DEPENDENCIES += wolfssl
+LIGHTTPD_CONF_OPTS += -Dwith_wolfssl=true
+else
+LIGHTTPD_CONF_OPTS += -Dwith_wolfssl=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIGHTTPD_ZLIB),y)
 LIGHTTPD_DEPENDENCIES += zlib
 LIGHTTPD_CONF_OPTS += -Dwith_zlib=enabled
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
