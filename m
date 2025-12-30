Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 657E3E95A77
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 11:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CB3260ABA;
	Tue, 30 Dec 2025 11:48:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1z2-IdlMFToU; Tue, 30 Dec 2025 11:48:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4ED0A60A3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767095285;
	bh=+2F0JV2n7OdY/VGMqQlrkN3S3xdM5JbxfkDrnXEzjNw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dAjmuemRF4iTZ7za4Oif+DGB4rbFSF0o/fPljfgDZ5+KXwhIYexol4ceJimsfHfXH
	 g4ZiQuM1CmCDpwI4UCCbqptQcRwBKpMmljcZScXzl9k0Pjiv7sI7DFE3ACnM6qIV3h
	 RbyEfVcHT+5XQA4USRooDavHQdXK3e77w0IhgQzddeAmW9W55QD95OAAq1zHsMzshK
	 rK8Efvqd48KS0LiH/i4YTg1RHQFyNFFL2s8nGuPC1P8tYOpNIovMRsrxnFRVnc0Lvp
	 9uFyEk0tXBQjH+Mh2DNw/GrxL6CQDBbZVTS3pj7FTt7UOvnYNX5pdWopKSnZ17qTth
	 DsdSIMMtrXo4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4ED0A60A3D;
	Tue, 30 Dec 2025 11:48:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DFA835B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34EFB40866
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:48:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n5-MGI-5RLeQ for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 11:48:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 019C640844
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 019C640844
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 019C640844
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:48:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 81B9AA4C2A96;
 Tue, 30 Dec 2025 12:46:32 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54702)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vaYBL-000000003Vt-3V4b;
 Tue, 30 Dec 2025 11:46:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Romain Naour <romain.naour@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Tue, 30 Dec 2025 12:45:31 +0100
Message-ID: <20251230114545.2236640-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251230114545.2236640-1-bernd@kuhls.net>
References: <20251230114545.2236640-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767095192;
 bh=NI74VX6dd4z7JTjR+7JciwNXLq2crmY+HJHMcPwXNLk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=nHjmv8A8EyIzXBSonumreCVhSPjX06JEVWeNFuRDTvDDpcoKPSbeWqR4+uscmM5Yd
 p4Ob5pWSjQl+ROM0B7VO7Sg+7YWg9jy4RDj3TnV4QZKFevJcTsAkOiuCQjma3DiKRa
 9Kk11IeKKHzN69pgez20uuEuUpZVc4mGkGbpPEchtn5eQkdSDQqw0sB9fQa++RrYAE
 NAW0D+maoJMnaXQWcbdYyYvPURliVcw1KNwB1UZAbN8W062aYO3oc6RAc9eZoAQsUi
 VysTU2WPmluEXCbfPKN2P4vXZ+pBkSYoXmAMinnN3vSTYwdQDKAxBW7F6M/CTJ8vH+
 rkVIDfRn6YP5Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=nHjmv8A8
Subject: [Buildroot] [PATCH v9 10/19] package/cppdb: remove package
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
index 76ba74d4d6..d5208cb93f 100644
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
