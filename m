Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C65E92FCA
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 17:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3F8D81BB0;
	Mon, 29 Dec 2025 17:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BY3mLKYlfkBg; Mon, 29 Dec 2025 17:56:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4163812A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767031007;
	bh=S0o8HrUBvoHWB4mMu+XdHxjNpmKYfNA4Sm8/RaettOU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OURA0Mxd7vnDJDF+t/QTbXj5SkebneuzKN0vG38BLMWvTS2RDjW5THNlljD9/vBPJ
	 yJIUI8scweKsucJ4s6CEDN77UJRznToK21IoGW0/OG/f4i0uSoa24g+qvigoPQGJif
	 x1/QeNsXYfzgJAknYCRRRpoFgQc8KEUL+sy3nFei5etvVWy0fQy0KGvJQbmlxL5F3P
	 AG9Ke3t5sHeQHhXSHmr7NTeZsuRGK0b0PrHAB0d5p7Efbg2SxhHc8JqXWLjNoTcuCg
	 +kFSCDe88cqN0NriM8frb7nnegj3uZDVPrJdN4qAYIMIt3G9nvjS5eehqatOxBANSJ
	 ut8/y4XiEKAZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4163812A9;
	Mon, 29 Dec 2025 17:56:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C6A4BD8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD831812A9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EI48b9sv_7H0 for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 17:56:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7412B809EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7412B809EB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7412B809EB
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 17:56:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 38A15A4C25E3;
 Mon, 29 Dec 2025 18:52:12 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38202)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vaHPY-0000000012P-1Bd4;
 Mon, 29 Dec 2025 17:52:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Romain Naour <romain.naour@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Mon, 29 Dec 2025 18:51:48 +0100
Message-ID: <20251229175158.3548903-21-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251229175158.3548903-1-bernd@kuhls.net>
References: <20251229175158.3548903-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767030732;
 bh=vYzJWJnTZbxNvbde8RPETznATAs/ngzmzqy0z5sJm+M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Hhv9LeJf8Ciwdwy22JPhn4BPcvOoNaYPyQizL4gf+ROdW2whMZYCOLXni8UJnGoLs
 1/FinUv/RdlPSBWHJWHcz/nstkfrvTMJJMPqv+iPR3Vp1sYrhNxB2A1Npz5hYQNLfL
 t5Ft2rQXgwU7/OCC262dnTVjAzpEKc2xMIwfL98aReU7NlSkqxNnC/6sS25TywhnmK
 vtN6SqIc9FnOwXbZJVj1aLGUWmsTZurIGkqS6kwRWdD0yDMB2DIJDr4oxSwzt4GhXy
 DM+q/ULgoeG5y4FdKqqYbIZvPgIyFv4JE/qgUdFI0EjcnE38qLDrJP3Xpr5fua4tal
 2LyCVT5ZyruvA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Hhv9LeJf
Subject: [Buildroot] [PATCH v7 20/29] package/cppdb: remove package
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

Analysis of https://sourceforge.net/projects/cppcms/files/cppdb:
last release: Jun 2012
last bug report: 2015
last patch: 2022

The package is broken with cmake 4 and no other package depends on it.

There are no known autobuilder failures for this issue.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  1 -
 package/Config.in                             |  1 -
 package/cppdb/0001-mysql-library-suffix.patch | 23 --------------
 package/cppdb/Config.in                       | 20 ------------
 package/cppdb/cppdb.hash                      |  6 ----
 package/cppdb/cppdb.mk                        | 31 -------------------
 6 files changed, 82 deletions(-)
 delete mode 100644 package/cppdb/0001-mysql-library-suffix.patch
 delete mode 100644 package/cppdb/Config.in
 delete mode 100644 package/cppdb/cppdb.hash
 delete mode 100644 package/cppdb/cppdb.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index 3b808cef0b..ea8be71c05 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -272,7 +272,6 @@ package/collectd/0001-src-netlink.c-remove-REG_NOERROR.patch lib_patch.Upstream
 package/connman/S45connman lib_sysv.Variables
 package/copas/0001-Do-not-load-coxpcall-for-LuaJIT.patch lib_patch.Upstream
 package/coremark-pro/coremark-pro.sh.in Shellcheck
-package/cppdb/0001-mysql-library-suffix.patch lib_patch.Upstream
 package/cpulimit/0001-Fix-crash-and-compiler-warnings.patch lib_patch.Upstream
 package/cpulimit/0002-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch lib_patch.Upstream
 package/cpulimit/0003-Fix-an-infrequent-crash.patch lib_patch.Upstream
diff --git a/package/Config.in b/package/Config.in
index 0764388842..18ed512a93 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1650,7 +1650,6 @@ endmenu
 
 menu "Database"
 	source "package/berkeleydb/Config.in"
-	source "package/cppdb/Config.in"
 	source "package/gdbm/Config.in"
 	source "package/hiredis/Config.in"
 	source "package/kompexsqlite/Config.in"
diff --git a/package/cppdb/0001-mysql-library-suffix.patch b/package/cppdb/0001-mysql-library-suffix.patch
deleted file mode 100644
index e65e3e26b6..0000000000
--- a/package/cppdb/0001-mysql-library-suffix.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Add mysql/ to PATH_SUFFIXES for the library search for mysql.
-
-On common distros libmysqlclient* is installed and/or symlinked
-into /usr/lib.
-Since we install the libraries into /usr/lib/mysql alone cppdb
-fails to properly link to it giving runtime errors.
-
-Status: https://sourceforge.net/p/cppcms/bugs/135/
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura cppdb-0.3.1.orig/CMakeLists.txt cppdb-0.3.1/CMakeLists.txt
---- cppdb-0.3.1.orig/CMakeLists.txt	2014-10-17 11:05:57.875429748 -0300
-+++ cppdb-0.3.1/CMakeLists.txt	2014-10-17 11:12:57.486775484 -0300
-@@ -196,7 +196,7 @@
- endif()
- 
- if(NOT DISABLE_MYSQL)
--	find_library(MYSQL_LIB mysqlclient)
-+	find_library(MYSQL_LIB mysqlclient PATH_SUFFIXES mysql)
- 	find_path(MYSQL_PATH mysql.h PATH_SUFFIXES mysql)
- 	if(MYSQL_LIB AND MYSQL_PATH)
- 		include_directories(${MYSQL_PATH})
diff --git a/package/cppdb/Config.in b/package/cppdb/Config.in
deleted file mode 100644
index 1394c1efd8..0000000000
--- a/package/cppdb/Config.in
+++ /dev/null
@@ -1,20 +0,0 @@
-config BR2_PACKAGE_CPPDB
-	bool "cppdb"
-	# dlfcn.h
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	# Can be built without them but it's useless
-	depends on BR2_PACKAGE_MARIADB || BR2_PACKAGE_POSTGRESQL || BR2_PACKAGE_SQLITE
-	help
-	  CppDB is an SQL connectivity library that is designed to
-	  provide platform and Database independent connectivity API
-	  similarly to what JDBC, ODBC and other connectivity libraries
-	  do.
-
-	  http://cppcms.com/sql/cppdb/
-
-comment "cppdb needs a toolchain w/ C++, threads, dynamic library"
-	depends on BR2_PACKAGE_MARIADB || BR2_PACKAGE_POSTGRESQL || BR2_PACKAGE_SQLITE
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
diff --git a/package/cppdb/cppdb.hash b/package/cppdb/cppdb.hash
deleted file mode 100644
index bca9f55959..0000000000
--- a/package/cppdb/cppdb.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# From http://sourceforge.net/projects/cppcms/files/cppdb/0.3.1/
-md5  129f1d75f46114b79160b93807d5223f  cppdb-0.3.1.tar.bz2
-sha1  c0410dcc482d71696ac9206044b3a3ac03d31f96  cppdb-0.3.1.tar.bz2
-# locally computed
-sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
-sha256  503ed52ef942d44bb26bd47dd5c6765927b198624e4f375e32cc660dfc2a0981  MIT.txt
diff --git a/package/cppdb/cppdb.mk b/package/cppdb/cppdb.mk
deleted file mode 100644
index d2a901d28b..0000000000
--- a/package/cppdb/cppdb.mk
+++ /dev/null
@@ -1,31 +0,0 @@
-################################################################################
-#
-# cppdb
-#
-################################################################################
-
-CPPDB_VERSION = 0.3.1
-CPPDB_SOURCE = cppdb-$(CPPDB_VERSION).tar.bz2
-CPPDB_SITE = http://downloads.sourceforge.net/project/cppcms/cppdb/$(CPPDB_VERSION)
-CPPDB_INSTALL_STAGING = YES
-CPPDB_DEPENDENCIES = $(if $(BR2_PACKAGE_SQLITE),sqlite)
-CPPDB_LICENSE = BSL-1.0 or MIT
-CPPDB_LICENSE_FILES = LICENSE_1_0.txt MIT.txt
-
-ifeq ($(BR2_PACKAGE_MARIADB),y)
-CPPDB_DEPENDENCIES += mariadb
-else
-CPPDB_CONF_OPTS += -DDISABLE_MYSQL=ON
-endif
-
-ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
-CPPDB_DEPENDENCIES += postgresql
-else
-CPPDB_CONF_OPTS += -DDISABLE_PQ=ON
-endif
-
-ifeq ($(BR2_PACKAGE_SQLITE),)
-CPPDB_CONF_OPTS += -DDISABLE_SQLITE=ON
-endif
-
-$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
