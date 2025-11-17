Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FB5CE8D6B
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 21:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF6AA4141C;
	Mon, 17 Nov 2025 21:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pnJfc_Inmx76; Mon, 17 Nov 2025 21:42:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B90E40AFF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B90E40AFF;
	Mon, 17 Nov 2025 21:42:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AD01158
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 21:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30EB583E36
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 21:42:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X6l87XPI_-Ys for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 21:42:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B603783E27
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B603783E27
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B603783E27
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 21:42:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b06c.dip0.t-ipconnect.de [84.161.176.108])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9F83DA4C70A1;
 Mon, 17 Nov 2025 22:42:35 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51058)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vL6zb-000000002du-0Jf3;
 Mon, 17 Nov 2025 21:42:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 17 Nov 2025 22:42:34 +0100
Message-ID: <20251117214234.1115937-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251117214234.1115937-1-bernd@kuhls.net>
References: <20251117214234.1115937-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763415755;
 bh=dVZtg94VlnzBAaQfqi/wSMA+wwWm6M1fXrqbRO3QnQs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=gIkLcl7Y8u02i17i4OzTCMi23ojdxaM4OROlUrPFhbaqQFoTly3Q+VExTc5IJsAva
 8PmBGBxG6QID0JnnZxDl+/OmIJ3ylugOwo6eSDemFKOTEOZ2SlOzM72/nX5drxN15y
 BDCZwGkMszqPedBlXlbDEQtU7kPc0MdhAI/wXgsXmLpPD3pXEI2ElOUacYLuE/7RyD
 dLTpsMJyMijadDV/S9/q5+FHOsdkEtgsPIJcmfE5cq8PdUJcSBMFw5T3vnq5XnPJ32
 yxW8IKXmNxJUGNOkRGKMvJtWe/NPayYQepI9tUVObMaE8A2JUeSWI9HyhZL9y71pT4
 VvRqj3JClG09Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=gIkLcl7Y
Subject: [Buildroot] [PATCH 2/2] package/postgresql: bump version to 18.1
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
Cc: Alexey Lukyanchuk <skif@skif-web.ru>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 James Hilliard <james.hilliard1@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, Nathaniel Roach <nroach44@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://www.postgresql.org/docs/release/18.0/
https://www.postgresql.org/docs/release/18.1/

Please note that upgrading a PostgreSQL server to a newer major version
requires a manual upgrade not provided by buildroot:
https://www.postgresql.org/docs/18/upgrading.html

Removed configure options for spinlocks:
https://git.postgresql.org/gitweb/?p=postgresql.git;a=commit;h=e25626677f8076eb3ce94586136c5464ee154381

Upstream removed support for toolchains not providing atomics support:
https://git.postgresql.org/gitweb/?p=postgresql.git;a=commit;h=81385261362962deb9861b39b509aeffe213721d

Added dependency to !BR2_sparc to disable build with defconfig
bootlin-sparc-uclibc to fix a build error:

../src/include/port/atomics.h:99:2: error:
 #error "could not find an implementation of pg_atomic_uint32"

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/bandwidthd/Config.in       | 3 +++
 package/collectd/Config.in         | 2 ++
 package/lighttpd/Config.in         | 2 ++
 package/php/Config.ext             | 2 ++
 package/poco/Config.in             | 1 +
 package/postgresql/Config.in       | 2 ++
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 8 +-------
 package/python-psycopg2/Config.in  | 2 ++
 package/qt5/qt5base/Config.in      | 2 ++
 package/qt6/qt6base/Config.in      | 2 ++
 package/zabbix/Config.in           | 1 +
 12 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/package/bandwidthd/Config.in b/package/bandwidthd/Config.in
index b0485ef957..5c2e507737 100644
--- a/package/bandwidthd/Config.in
+++ b/package/bandwidthd/Config.in
@@ -35,6 +35,7 @@ if BR2_PACKAGE_BANDWIDTHD
 config BR2_PACKAGE_BANDWIDTHD_POSTGRESQL
 	bool "enable postgresql log target support"
 	depends on BR2_USE_MMU # postgresql
+	depends on !BR2_sparc # postgresql
 	depends on BR2_USE_WCHAR # postgresql
 	depends on BR2_ENABLE_LOCALE # postgresql
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
@@ -48,9 +49,11 @@ config BR2_PACKAGE_BANDWIDTHD_POSTGRESQL
 	  (github.com/nroach44/bandwidthd) for more information.
 
 comment "postgresql support needs a toolchain w/ dynamic library, wchar"
+	depends on !BR2_sparc
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 comment "postgresql support can't be built with Optimize for fast"
+	depends on !BR2_sparc
 	depends on BR2_OPTIMIZE_FAST
 
 config BR2_PACKAGE_BANDWIDTHD_SQLITE3
diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 6568aa1d7b..127bcace6d 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -476,6 +476,7 @@ config BR2_PACKAGE_COLLECTD_PING
 config BR2_PACKAGE_COLLECTD_POSTGRESQL
 	bool "postgresql"
 	depends on BR2_USE_MMU # postgresql
+	depends on !BR2_sparc # postgresql
 	depends on BR2_USE_WCHAR # postgresql
 	depends on BR2_ENABLE_LOCALE # postgresql
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
@@ -489,6 +490,7 @@ config BR2_PACKAGE_COLLECTD_POSTGRESQL
 	  collectd 'value lists'.
 
 comment "postgresql support needs a toolchain w/ wchar"
+	depends on !BR2_sparc
 	depends on !BR2_USE_WCHAR
 
 comment "postgresql support can't be built with Optimize for fast"
diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index fe2c7a2815..0168f1d83c 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -122,6 +122,7 @@ config BR2_PACKAGE_LIGHTTPD_PCRE
 config BR2_PACKAGE_LIGHTTPD_PGSQL
 	bool "pgsql support"
 	depends on BR2_USE_MMU # postgresql
+	depends on !BR2_sparc # postgresql
 	depends on BR2_USE_WCHAR # postgresql
 	depends on BR2_ENABLE_LOCALE # postgresql
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
@@ -133,6 +134,7 @@ config BR2_PACKAGE_LIGHTTPD_PGSQL
 
 comment "pgsql support needs a toolchain w/ wchar"
 	depends on BR2_USE_MMU
+	depends on !BR2_sparc
 	depends on !BR2_USE_WCHAR
 
 comment "pgsql support can't be built with Optimize for fast"
diff --git a/package/php/Config.ext b/package/php/Config.ext
index 609cf17016..8cf4a7d160 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -139,6 +139,7 @@ config BR2_PACKAGE_PHP_EXT_MYSQLI
 config BR2_PACKAGE_PHP_EXT_PGSQL
 	bool "PostgreSQL"
 	depends on BR2_USE_MMU # postgresql
+	depends on !BR2_sparc # postgresql
 	depends on BR2_USE_WCHAR # postgresql
 	depends on BR2_ENABLE_LOCALE # postgresql
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
@@ -150,6 +151,7 @@ config BR2_PACKAGE_PHP_EXT_PGSQL
 
 comment "PostgreSQL extension needs a toolchain w/ dynamic library, wchar"
 	depends on BR2_USE_MMU
+	depends on !BR2_sparc
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 comment "PostgreSQL extension can't be built with Optimize for fast"
diff --git a/package/poco/Config.in b/package/poco/Config.in
index fa23e6aa59..4801b36a24 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -53,6 +53,7 @@ config BR2_PACKAGE_POCO_DATA_MYSQL
 config BR2_PACKAGE_POCO_DATA_PGSQL
 	bool "Data/PostgreSQL"
 	depends on BR2_USE_MMU # postgresql
+	depends on !BR2_sparc
 	depends on BR2_USE_WCHAR # postgresql
 	depends on BR2_ENABLE_LOCALE # postgresql
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
index 06e8646119..ebf310a6a1 100644
--- a/package/postgresql/Config.in
+++ b/package/postgresql/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_POSTGRESQL
 	bool "postgresql"
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_sparc # atomic.h
 	depends on BR2_USE_WCHAR
 	depends on BR2_ENABLE_LOCALE # locale_t
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -36,6 +37,7 @@ endif
 
 comment "postgresql needs a toolchain w/ dynamic library, wchar, locale"
 	depends on BR2_USE_MMU
+	depends on !BR2_sparc
 	depends on !BR2_USE_WCHAR
 	depends on !BR2_ENABLE_LOCALE
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index efa1b5e751..524066c61e 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v17.7/postgresql-17.7.tar.bz2.sha256
-sha256  ef9e343302eccd33112f1b2f0247be493cb5768313adeb558b02de8797a2e9b5  postgresql-17.7.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v18.1/postgresql-18.1.tar.bz2.sha256
+sha256  ff86675c336c46e98ac991ebb306d1b67621ece1d06787beaade312c2c915d54  postgresql-18.1.tar.bz2
 # License file, Locally calculated
 sha256  5ed3ce5c9373dff7f98b1fae7a6c7ccd98df7d734d46d24c1bcebf1240be8307  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 86761bf939..78d7cef4f6 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 17.7
+POSTGRESQL_VERSION = 18.1
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
@@ -38,12 +38,6 @@ POSTGRESQL_INSTALL_TARGET_OPTS += DESTDIR=$(TARGET_DIR) install-world
 POSTGRESQL_INSTALL_STAGING_OPTS += DESTDIR=$(STAGING_DIR) install-world
 endif
 
-ifeq ($(BR2_arcle)$(BR2_arceb)$(BR2_microblazeel)$(BR2_microblazebe)$(BR2_or1k)$(BR2_riscv)$(BR2_xtensa),y)
-POSTGRESQL_CONF_OPTS += -Dspinlocks=false
-else
-POSTGRESQL_CONF_OPTS += -Dspinlocks=true
-endif
-
 ifeq ($(BR2_PACKAGE_READLINE),y)
 POSTGRESQL_DEPENDENCIES += readline
 POSTGRESQL_CONF_OPTS += -Dreadline=enabled
diff --git a/package/python-psycopg2/Config.in b/package/python-psycopg2/Config.in
index 8eeeb42692..24eaea6d9c 100644
--- a/package/python-psycopg2/Config.in
+++ b/package/python-psycopg2/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_PSYCOPG2
 	bool "python-psycopg2"
 	depends on BR2_USE_MMU # postgresql
+	depends on !BR2_sparc # postgresql
 	depends on BR2_USE_WCHAR # postgresql
 	depends on BR2_ENABLE_LOCALE # postgresql
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
@@ -29,6 +30,7 @@ config BR2_PACKAGE_PYTHON_PSYCOPG2
 
 comment "python-psycopg2 needs a toolchain w/ dynamic library, wchar"
 	depends on BR2_USE_MMU
+	depends on !BR2_sparc
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 comment "python-psycopg2 can't be built with Optimize for fast"
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index c45b8c1591..8f14540eb4 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -72,6 +72,7 @@ config BR2_PACKAGE_QT5BASE_MYSQL
 config BR2_PACKAGE_QT5BASE_PSQL
 	bool "PostgreSQL Plugin"
 	depends on BR2_USE_MMU # postgresql
+	depends on !BR2_sparc # postgresql
 	depends on BR2_USE_WCHAR # postgresql
 	depends on BR2_ENABLE_LOCALE # postgresql
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
@@ -84,6 +85,7 @@ config BR2_PACKAGE_QT5BASE_PSQL
 
 comment "PostgreSQL plugin needs a toolchain w/ wchar, dynamic library"
 	depends on BR2_USE_MMU
+	depends on !BR2_sparc
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 comment "PostgreSQL plugin can't be built with Optimize for fast"
diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 7f3948ec27..e6bb99de28 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -202,6 +202,7 @@ comment "MySQL plugin needs a toolchain w/ C++, threads"
 config BR2_PACKAGE_QT6BASE_PSQL
 	bool "PostgreSQL Plugin"
 	depends on BR2_USE_MMU # postgresql
+	depends on !BR2_sparc # postgresql
 	depends on BR2_USE_WCHAR # postgresql
 	depends on BR2_ENABLE_LOCALE # postgresql
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
@@ -213,6 +214,7 @@ config BR2_PACKAGE_QT6BASE_PSQL
 
 comment "PostgreSQL plugin needs a toolchain w/ wchar, dynamic library"
 	depends on BR2_USE_MMU
+	depends on !BR2_sparc
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 comment "PostgreSQL plugin can't be built with optimize for fast"
diff --git a/package/zabbix/Config.in b/package/zabbix/Config.in
index 226bce51ba..c1e8ad62f3 100644
--- a/package/zabbix/Config.in
+++ b/package/zabbix/Config.in
@@ -41,6 +41,7 @@ config BR2_PACKAGE_ZABBIX_SERVER_MYSQL
 config BR2_PACKAGE_ZABBIX_SERVER_POSTGRESQL
 	bool "postgresql"
 	depends on BR2_USE_MMU # postgresql
+	depends on !BR2_sparc # postgresql
 	depends on BR2_USE_WCHAR # postgresql
 	depends on BR2_ENABLE_LOCALE # postgresql
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # postgresql
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
