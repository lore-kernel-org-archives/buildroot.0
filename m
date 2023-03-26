Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41F9C74A5B
	for <buildroot@archiver.kernel.org>; Sun, 26 Mar 2023 21:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59E0660BA4;
	Sun, 26 Mar 2023 21:30:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59E0660BA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nNA92PgQ8u7G; Sun, 26 Mar 2023 21:30:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A3FE60BE0;
	Sun, 26 Mar 2023 21:30:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A3FE60BE0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 84B331BF309
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 21:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BB4760BE0
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 21:30:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BB4760BE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bbMGY-vtm1rm for <buildroot@lists.busybox.net>;
 Sun, 26 Mar 2023 21:30:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B47AB60BA4
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B47AB60BA4
 for <buildroot@buildroot.org>; Sun, 26 Mar 2023 21:30:25 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id r11so6723303wrr.12
 for <buildroot@buildroot.org>; Sun, 26 Mar 2023 14:30:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679866223;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d6PPmzw040X+QMNHLbImIljAB1mTdhixQog+QyYrFFU=;
 b=756a6pWM+CAoc5Q7o1wNlttYEt0AWTCCSQkBzURX5S3E/mSPhJp4I/QxTm3Qb+fe5X
 Sa/i/nalP2rIW7R8eAIc489+ODNSYbXpOY4oCDApRZp3HKDzDZsMXuTDrdBgQs2vMV+4
 Tw8lzXiqGAfDayBqECUBfDCFiefbYc3TZK4yyFOcADJqPKPI6OiUljUG9tQJ2U/H2naK
 74emeTRzcUgMYoaxFgJL6QzbBkida695nTu4VejAy+zRkDPzBzWsg3lMXjboHFD+iyiZ
 AWMcCLHN8pIHdJ7w97P2+i1U0t57a398nssYCNjMEGEAoM2HhpQPsPkiyzhUEVtw4zig
 OUYg==
X-Gm-Message-State: AAQBX9cUr6Jrs2oWmgpTSR5upYuvM+ShEPeL9QQwc3KtT77YFBJF1UG+
 qUbkfAI24r4ziNludy2zgCM9JAKL6iM=
X-Google-Smtp-Source: AKy350bzwFp2heEoLuVojmdlpKhgrr38lH1PmfgKtL5pJfJQn0s8HYRgfpnw9xD7IkDVPuiZ25IxFw==
X-Received: by 2002:adf:e64d:0:b0:2c5:4af3:3d26 with SMTP id
 b13-20020adfe64d000000b002c54af33d26mr8348808wrn.9.1679866223176; 
 Sun, 26 Mar 2023 14:30:23 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 j6-20020a5d5646000000b002d2f0e23acbsm23328012wrw.12.2023.03.26.14.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Mar 2023 14:30:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Mar 2023 23:30:20 +0200
Message-Id: <20230326213020.758457-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679866223;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d6PPmzw040X+QMNHLbImIljAB1mTdhixQog+QyYrFFU=;
 b=Nws4NtwB93DakfPzOkfJcVjfGwf+ksXPUs8xcXNdBkfk8spfQb3SVgQQ2GLwGfiEnt
 GwRO5px2saE2OIHv0zWnLbJJkdBfS2xJwrwT2EI3pgKgTF48V2LMI/iUtEmxWLZ84FEX
 GucsYY8sbr3xP6/iV/0VrImSiXhK9qAF6f03HVJbD1dTUVpltyqCpZEHs9xCPWng/Zo8
 hlilT2DvGDHIwot+YZgLA60dRMNOzG3I0ha8+iPpt9kh7DfbTU5bHXlwCX2HPDChyhNu
 Gqz4eRPtpgVcqdWkX9eE6USGmkSH/5ZAl8oUQ6/GuD/1bcADUYb08aQLcfh7cCCGCkql
 OFSg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Nws4NtwB
Subject: [Buildroot] [PATCH v2,
 1/1] package/libmemcached: bump to version 1.1.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Switch to an active fork
- Switch to cmake-package
- Drop all patches (not needed anymore)
- Use LICENSE file instead of COPYING as COPYING is now a symlink to
  LICENSE
- Handle libevent and openssl dependencies

https://awesomized.github.io/libmemcached/ChangeLog-1.1.html#v-1-1-4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Drop unneeded LIBMEMCACHED_CPE_ID_PRODUCT

 package/libmemcached/0001-disable-tests.patch | 42 -------------------
 .../libmemcached/0002-disable-sanitizer.patch | 25 -----------
 .../0003-move-ac_config_aux_dir.patch         | 25 -----------
 .../0004-disable-doc-and-man.patch            | 37 ----------------
 .../0005-fix-pointer-comparaison.patch        | 30 -------------
 package/libmemcached/Config.in                |  2 +-
 package/libmemcached/libmemcached.hash        |  6 +--
 package/libmemcached/libmemcached.mk          | 38 +++++++++--------
 8 files changed, 24 insertions(+), 181 deletions(-)
 delete mode 100644 package/libmemcached/0001-disable-tests.patch
 delete mode 100644 package/libmemcached/0002-disable-sanitizer.patch
 delete mode 100644 package/libmemcached/0003-move-ac_config_aux_dir.patch
 delete mode 100644 package/libmemcached/0004-disable-doc-and-man.patch
 delete mode 100644 package/libmemcached/0005-fix-pointer-comparaison.patch

diff --git a/package/libmemcached/0001-disable-tests.patch b/package/libmemcached/0001-disable-tests.patch
deleted file mode 100644
index 6128306787..0000000000
--- a/package/libmemcached/0001-disable-tests.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-Disable the tests, cuts build time by half and avoids build issues
-with extra dependencies.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura libmemcached-1.0.18.orig/Makefile.am libmemcached-1.0.18/Makefile.am
---- libmemcached-1.0.18.orig/Makefile.am	2014-07-19 09:24:45.246418899 -0300
-+++ libmemcached-1.0.18/Makefile.am	2014-07-19 09:25:12.701349345 -0300
-@@ -1,6 +1,6 @@
- # vim:ft=automake
- 
--ACLOCAL_AMFLAGS= -I m4 -I libtest/m4
-+ACLOCAL_AMFLAGS= -I m4
- AM_YFLAGS= -d
- 
- # includes append to these:
-@@ -45,8 +45,6 @@
- include libmemcached-1.0/include.am
- else
- 
--include libtest/include.am
--
- include libhashkit-1.0/include.am
- include libmemcached-1.0/include.am
- 
-@@ -76,7 +74,6 @@
- include libmemcachedinternal/util/include.am
- include rpm/include.mk
- include support/include.am
--include tests/include.am
- include util/include.am
- include win32/include.am
- 
-@@ -103,7 +100,7 @@
- 	@echo "Files that need to be either removed or checked in:"
- 	@bzr unknowns
- 
--clean-local: clean-libtest-check clean-docs-check clean-rpm
-+clean-local: clean-docs-check clean-rpm
- 
- 
- lcov: lcov-clean check
diff --git a/package/libmemcached/0002-disable-sanitizer.patch b/package/libmemcached/0002-disable-sanitizer.patch
deleted file mode 100644
index 108da22550..0000000000
--- a/package/libmemcached/0002-disable-sanitizer.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Disable sanitizer checks, they're busted.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura libmemcached-1.0.18.orig/m4/ax_harden_compiler_flags.m4 libmemcached-1.0.18/m4/ax_harden_compiler_flags.m4
---- libmemcached-1.0.18.orig/m4/ax_harden_compiler_flags.m4	2014-11-13 08:07:09.011614311 -0300
-+++ libmemcached-1.0.18/m4/ax_harden_compiler_flags.m4	2014-11-13 08:07:52.406092440 -0300
-@@ -222,8 +222,6 @@
- #         GCC 4.5 removed this.
- #         _APPEND_COMPILE_FLAGS_ERROR([-Wunreachable-code])
- 
--          _SET_SANITIZE_FLAGS
--
-           AS_IF([test "x$ax_enable_debug" = xno],
-             [AS_IF([test "x$ac_cv_vcs_checkout" = xyes],
-               [AS_IF([test "x${host_os}" != "xmingw"],
-@@ -337,8 +335,6 @@
-                 _APPEND_COMPILE_FLAGS_ERROR([-fstack-protector-all])
-                 ])])])])
- 
--          _SET_SANITIZE_FLAGS
--
-           AS_IF([test "x$ac_cv_warnings_as_errors" = xyes],
-                 [AX_APPEND_FLAG([-Werror])])
-           AC_LANG_POP([C++])
diff --git a/package/libmemcached/0003-move-ac_config_aux_dir.patch b/package/libmemcached/0003-move-ac_config_aux_dir.patch
deleted file mode 100644
index 790aa93d29..0000000000
--- a/package/libmemcached/0003-move-ac_config_aux_dir.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Move AC_CONFIG_AUX_DIR up a few lines so the autotools can find it
-
-This patch is based on the same solution adopted by Debian:
-
-  https://lists.debian.org/debian-release/2014/11/msg01231.html
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-diff -rup a/configure.ac b/configure.ac
---- a/configure.ac	2014-02-09 11:52:42.000000000 +0000
-+++ b/configure.ac	2015-01-06 15:07:10.003074775 +0000
-@@ -13,11 +13,12 @@ m4_include([version.m4])
- AC_PREREQ([2.61])
- AC_INIT([libmemcached],VERSION_NUMBER,[http://libmemcached.org/])
- 
-+AC_CONFIG_AUX_DIR([build-aux])
-+
- # Setup the compilers early on
- AC_PROG_CC([cc gcc clang])
- AC_PROG_CXX([c++ g++ clang++])
- 
--AC_CONFIG_AUX_DIR([build-aux])
- AC_CONFIG_MACRO_DIR([m4])
- 
- AC_CANONICAL_HOST
diff --git a/package/libmemcached/0004-disable-doc-and-man.patch b/package/libmemcached/0004-disable-doc-and-man.patch
deleted file mode 100644
index 9605095899..0000000000
--- a/package/libmemcached/0004-disable-doc-and-man.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 6c01bd3562cc18fbafdf950bbeb73a399c1adcdd Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Tue, 12 May 2015 00:00:02 +0200
-Subject: [PATCH] disable doc and man
-
-WARNING: master file /home/naourr/git/buildroot/test/libmemcached-bfin/build/libmemcached-1.0.18/docs/index.rst not found
-
-Exception occurred:
-  File "/usr/lib/python2.7/site-packages/sphinx/environment.py", line 1213, in get_doctree
-    f = open(doctree_filename, 'rb')
-IOError: [Errno 2] No such file or directory: '/home/naourr/buildroot-test/test/libmemcached-bfin/build/libmemcached-1.0.18/man/.doctrees/hashkit_create.doctree'
-The full traceback has been saved in /tmp/sphinx-err-JCIsnB.log, if you want to report the issue to the developers.
-Please also report this if it was a user error, so that a better error message can be provided next time.
-Either send bugs to the mailing list at <http://groups.google.com/group/sphinx-dev/>,
-or report them in the tracker at <http://bitbucket.org/birkenfeld/sphinx/issues/>. Thanks!
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- Makefile.am | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 7f44102..cb7d058 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -55,8 +55,6 @@ endif
- include libmemcachedutil-1.0/include.am
- 
- include clients/include.am
--include docs/include.am
--include man/include.am
- 
- if BUILD_LIBMEMCACHED_PROTOCOL
- include example/include.am
--- 
-1.9.3
-
diff --git a/package/libmemcached/0005-fix-pointer-comparaison.patch b/package/libmemcached/0005-fix-pointer-comparaison.patch
deleted file mode 100644
index c9f8dd19cf..0000000000
--- a/package/libmemcached/0005-fix-pointer-comparaison.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Fix pointer comparaison
-
-opt_servers is a pointer, not a boolean, so testing against false to
-know if the pointer is NULL no longer works with the more strict gcc
-7.x checks.
-
-[Taken from http://pkgs.fedoraproject.org/cgit/rpms/libmemcached.git/plain/libmemcached-build.patch.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-diff -up ./clients/memflush.cc.old ./clients/memflush.cc
---- ./clients/memflush.cc.old	2017-02-12 10:12:59.615209225 +0100
-+++ ./clients/memflush.cc	2017-02-12 10:13:39.998382783 +0100
-@@ -39,7 +39,7 @@ int main(int argc, char *argv[])
- {
-   options_parse(argc, argv);
- 
--  if (opt_servers == false)
-+  if (!opt_servers)
-   {
-     char *temp;
- 
-@@ -48,7 +48,7 @@ int main(int argc, char *argv[])
-       opt_servers= strdup(temp);
-     }
- 
--    if (opt_servers == false)
-+    if (!opt_servers)
-     {
-       std::cerr << "No Servers provided" << std::endl;
-       exit(EXIT_FAILURE);
diff --git a/package/libmemcached/Config.in b/package/libmemcached/Config.in
index 4af2b3b0e7..57c0cb466b 100644
--- a/package/libmemcached/Config.in
+++ b/package/libmemcached/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_LIBMEMCACHED
 	  It has been designed to be light on memory usage, thread safe,
 	  and provide full access to server side methods.
 
-	  http://libmemcached.org/libMemcached.html
+	  https://awesomized.github.io/libmemcached
 
 comment "libmemcached needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libmemcached/libmemcached.hash b/package/libmemcached/libmemcached.hash
index ccc31ee7ed..cb9daa8ae8 100644
--- a/package/libmemcached/libmemcached.hash
+++ b/package/libmemcached/libmemcached.hash
@@ -1,5 +1,5 @@
-# From https://launchpad.net/libmemcached/1.0/1.0.18/+download/libmemcached-1.0.18.tar.gz/+md5
-md5  b3958716b4e53ddc5992e6c49d97e819  libmemcached-1.0.18.tar.gz
+# Locally computed
+sha256  c477e1f6510e1dc698e84f3717ce690a8f65b94c616ecaa62306cce0f5e3116a  libmemcached-1.1.4.tar.gz
 
 # Hash for license file:
-sha256  4e9032d0f539276db05519ee3d09ca6167d2134ec91c556e8c80ef3efe633fd2  COPYING
+sha256  65013ec8b416f28ae838ed3f23ea3ae47e5dbc70fe8492f39338e389a7970fd9  LICENSE
diff --git a/package/libmemcached/libmemcached.mk b/package/libmemcached/libmemcached.mk
index 24955266d3..bd63d78c97 100644
--- a/package/libmemcached/libmemcached.mk
+++ b/package/libmemcached/libmemcached.mk
@@ -4,26 +4,28 @@
 #
 ################################################################################
 
-LIBMEMCACHED_VERSION_MAJOR = 1.0
-LIBMEMCACHED_VERSION = $(LIBMEMCACHED_VERSION_MAJOR).18
-LIBMEMCACHED_SITE = http://launchpad.net/libmemcached/$(LIBMEMCACHED_VERSION_MAJOR)/$(LIBMEMCACHED_VERSION)/+download
-LIBMEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99' \
-	ax_cv_check_cflags__Werror__fmudflapth=no \
-	ax_cv_check_cxxflags__Werror__fmudflapth=no
-LIBMEMCACHED_CONF_OPTS = --disable-dtrace
+LIBMEMCACHED_VERSION = 1.1.4
+LIBMEMCACHED_SITE = \
+	$(call github,awesomized,libmemcached,$(LIBMEMCACHED_VERSION))
+LIBMEMCACHED_CONF_OPTS = -DENABLE_DTRACE=OFF
 LIBMEMCACHED_INSTALL_STAGING = YES
-LIBMEMCACHED_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBEVENT),libevent)
-# For 0001-disable-tests.patch and 0002-disable-sanitizer.patch
-LIBMEMCACHED_AUTORECONF = YES
+LIBMEMCACHED_DEPENDENCIES = host-bison host-flex
 LIBMEMCACHED_LICENSE = BSD-3-Clause
-LIBMEMCACHED_LICENSE_FILES = COPYING
+LIBMEMCACHED_LICENSE_FILES = LICENSE
+LIBMEMCACHED_CPE_ID_VENDOR = awesome
 
-ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
-LIBMEMCACHED_CONF_ENV += \
-	ax_cv_check_cflags__Werror__fPIE=no \
-	ax_cv_check_cflags__Werror__pie=no \
-	ax_cv_check_cxxflags__Werror__fPIE=no \
-	ax_cv_check_cxxflags__Werror__pie=no
+ifeq ($(BR2_PACKAGE_LIBEVENT),y)
+LIBMEMCACHED_DEPENDENCIES += libevent
+LIBMEMCACHED_CONF_OPTS += -DENABLE_MEMASLAP=ON
+else
+LIBMEMCACHED_CONF_OPTS += -DENABLE_MEMASLAP=OFF
 endif
 
-$(eval $(autotools-package))
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBMEMCACHED_DEPENDENCIES += openssl
+LIBMEMCACHED_CONF_OPTS += -DENABLE_OPENSSL_CRYPTO=ON
+else
+LIBMEMCACHED_CONF_OPTS += -DENABLE_OPENSSL_CRYPTO=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
