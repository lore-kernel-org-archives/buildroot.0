Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3ACE784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 07:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42843600CA;
	Sun, 28 Dec 2025 07:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZJEU2Wlly_uc; Sun, 28 Dec 2025 07:52:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C03C6083E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766908353;
	bh=91mJ9dc0XXO4fhkWRYTxJfp81cclXW+jZUAjJIcRTGo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rFUtlO7lqfGkUbSGWOuevT3prDz/xONqUZAT2w2glgEIuAynNPXM0yT3RfKnzcFyM
	 6d2zA7JkkpHsq8JghhNbh/TMsAVHAxyOenQuPv0283Z1MZOv4dXPRIL4Z1+e9REBda
	 MTyAOi4BII6Vfc/SzmSMmiWz/lY2Qyn+1w0Uga2vNE7tLGQ20gelqcnB3NGcTQ/sla
	 rCQYJd21Ik4Hjs87T5uLWnmpDveVN7E1iaEvqG3uJy2ZBbAheE8j/KAfjxw/gd9h2k
	 gm3EzpIHVN+70ysQfW4a1BypGURqKBKaFpcZffA6SZYTVhkE+FVEMvWs91OKK6eTy4
	 P1snUebQK2uYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C03C6083E;
	Sun, 28 Dec 2025 07:52:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F4DF1E1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6670D811EE
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:52:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JW8wllQtYcRG for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 07:52:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4BA5581196
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BA5581196
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4BA5581196
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:52:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8630DA4C231C;
 Sun, 28 Dec 2025 08:48:38 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35324)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vZlVr-000000004ex-1dKv;
 Sun, 28 Dec 2025 07:48:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Sun, 28 Dec 2025 08:48:15 +0100
Message-ID: <20251228074822.3370464-21-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251228074822.3370464-1-bernd@kuhls.net>
References: <20251228074822.3370464-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766908118;
 bh=aFSX533GS+M1/6pNc1F0yB9bPlh9tl5XGVIKDCYdhPQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Gncxmo2+yc8U3YsF+BtM8nwHPB3Z0e0chsic55YTQYuG+EkSt+jvDM1csmXmDgily
 bEO7EEH3unKRt4/NwEfi9Qx2pm6n0LDeh/JAIw01tjSvDEBtpyWJONmWR+UVbnz9pY
 FQj5Fh9paSpbXvnYlq94+hw1hBKkTNuxfJ5vyT1qjII4bwL2AF0G1+x8x3iafuLUdU
 APEOIu1rBR2n41KNI3tvYbXA9WVoorDSMvZbLWtKiNjsa5z3olYGhFGhMcyCuxW/gP
 ELzf0U8kF3FRqH+Z1soGS/SJ+4KLikQfH7SGCIDQ9ibNMOrcYbe8ZrVmmKtRcmGeFf
 PzH+QHA6tzMeg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Gncxmo2+
Subject: [Buildroot] [PATCH v6 20/26] package/cppdb: remove package
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
index adb74a1327..c74c58a2d1 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -273,7 +273,6 @@ package/collectd/0001-src-netlink.c-remove-REG_NOERROR.patch lib_patch.Upstream
 package/connman/S45connman lib_sysv.Variables
 package/copas/0001-Do-not-load-coxpcall-for-LuaJIT.patch lib_patch.Upstream
 package/coremark-pro/coremark-pro.sh.in Shellcheck
-package/cppdb/0001-mysql-library-suffix.patch lib_patch.Upstream
 package/cpulimit/0001-Fix-crash-and-compiler-warnings.patch lib_patch.Upstream
 package/cpulimit/0002-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch lib_patch.Upstream
 package/cpulimit/0003-Fix-an-infrequent-crash.patch lib_patch.Upstream
diff --git a/package/Config.in b/package/Config.in
index 8b334d28ce..df0cded97d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1648,7 +1648,6 @@ endmenu
 
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
