Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F2AC001DE
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 21:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C33AA60E44;
	Wed,  9 Aug 2023 21:15:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C33AA60E44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GOP0GkL0I57W; Wed,  9 Aug 2023 21:15:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D21860EA7;
	Wed,  9 Aug 2023 21:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D21860EA7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 01FF71BF28A
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB40660EA7
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:14:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB40660EA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6gc61-CM0hJ6 for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 21:14:57 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1487560E4E
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 21:14:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1487560E4E
Received: from fli4l.lan.fli4l (p4fd6c449.dip0.t-ipconnect.de [79.214.196.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8EC08A4C110F;
 Wed,  9 Aug 2023 23:14:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57460)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qTqVF-0001EZ-1v;
 Wed, 09 Aug 2023 23:14:01 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 23:13:48 +0200
Message-Id: <20230809211401.3587177-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230809211401.3587177-1-bernd@kuhls.net>
References: <20230809211401.3587177-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691615643;
 bh=hzN7eiBYS3CfLbp16OzEuZzcnQlJq8eAFTZY7EkgNCU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eD8ZWjZ+pFe/mFjeWhdhlKqUsuvi6DYgw/TFkoN0Czcp8tPVTSEVA6YBT5xSDT5Yn
 pXc7KnVWa2M53sSgVT0m8e4yqtSKXXXoX1x/lpAXnFeMcMqzM2T2bRqFw5NKFHeaov
 i52Vzd56C/zJF4+JUGdC6DiVizj74Q49FY6H+YwxYdhuFB7IH4QWn1toKDtsbKMYt7
 eIGyGujL614Bk/hrsnoLtVlCtaB7IRolSDpZFQZyafI6pfJ3MiYn+DiHknEQGrUybb
 PtXk92VcU7eZQxgYmJJwFBRvCxPPaa+HI0G9zue5J1dZQYy81dtCQoKsqmhXsKxl4g
 kLwKpKVr5vjiQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=eD8ZWjZ+
Subject: [Buildroot] [PATCH/next v3 01/14] package/python3: use upstream
 build system to disable berkeleydb module
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Backport patch 0018 from python 3.12 to enhance build system.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |   1 -
 ...18-Port-_dbm-module-to-PY_STDLIB_MOD.patch | 293 ++++++++++++++++++
 ...ion-to-disable-the-berkeleydb-module.patch |  30 --
 package/python3/python3.mk                    |   2 +-
 4 files changed, 294 insertions(+), 32 deletions(-)
 create mode 100644 package/python3/0018-Port-_dbm-module-to-PY_STDLIB_MOD.patch
 delete mode 100644 package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 0954f22b4b..303eb4ccad 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1238,7 +1238,6 @@ package/python3/0026-python-config.sh-don-t-reassign-prefix.patch Upstream
 package/python3/0027-Add-an-option-to-disable-uuid-module.patch Upstream
 package/python3/0028-fix-building-on-older-distributions.patch Upstream
 package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch Upstream
-package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patch Upstream
 package/python3/0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch Upstream
 package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch Upstream
 package/qemu/0002-softmmu-qemu-seccomp.c-add-missing-header-for-CLONE_.patch Upstream
diff --git a/package/python3/0018-Port-_dbm-module-to-PY_STDLIB_MOD.patch b/package/python3/0018-Port-_dbm-module-to-PY_STDLIB_MOD.patch
new file mode 100644
index 0000000000..92d2594eef
--- /dev/null
+++ b/package/python3/0018-Port-_dbm-module-to-PY_STDLIB_MOD.patch
@@ -0,0 +1,293 @@
+From ec5e253556875640b1ac514e85c545346ac3f1e0 Mon Sep 17 00:00:00 2001
+From: Christian Heimes <christian@python.org>
+Date: Fri, 1 Jul 2022 21:48:38 +0200
+Subject: [PATCH] gh-90005: Port _dbm module to PY_STDLIB_MOD (GH-94433)
+
+Upstream: https://github.com/python/cpython/commit/ec5e253556875640b1ac514e85c545346ac3f1e0
+
+[Bernd: backported to 3.11.4]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ ...2-06-30-09-57-39.gh-issue-90005.9-pQyR.rst |   1 +
+ Modules/Setup.stdlib.in                       |   2 +-
+ configure                                     | 295 ++++++++++++------
+ configure.ac                                  | 100 ++++--
+ pyconfig.h.in                                 |   6 -
+ setup.py                                      |  72 +----
+ 6 files changed, 278 insertions(+), 198 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Build/2022-06-30-09-57-39.gh-issue-90005.9-pQyR.rst
+
+diff --git a/Misc/NEWS.d/next/Build/2022-06-30-09-57-39.gh-issue-90005.9-pQyR.rst b/Misc/NEWS.d/next/Build/2022-06-30-09-57-39.gh-issue-90005.9-pQyR.rst
+new file mode 100644
+index 0000000000000..9b14f767847da
+--- /dev/null
++++ b/Misc/NEWS.d/next/Build/2022-06-30-09-57-39.gh-issue-90005.9-pQyR.rst
+@@ -0,0 +1 @@
++``_dbm`` module dependencies are now detected by configure.
+diff --git a/Modules/Setup.stdlib.in b/Modules/Setup.stdlib.in
+index a199aefc51011..ad34f85e25451 100644
+--- a/Modules/Setup.stdlib.in
++++ b/Modules/Setup.stdlib.in
+@@ -68,7 +68,7 @@
+ 
+ # dbm/gdbm
+ # dbm needs either libndbm, libgdbm_compat, or libdb 5.x
+-#@MODULE__DBM_TRUE@_dbm _dbmmodule.c
++@MODULE__DBM_TRUE@_dbm _dbmmodule.c
+ # gdbm module needs -lgdbm
+ @MODULE__GDBM_TRUE@_gdbm _gdbmmodule.c
+ 
+diff --git a/configure.ac b/configure.ac
+index 12ae2ae8d87eb..b03ead3bdefa0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3956,17 +3956,30 @@ WITH_SAVE_ENV([
+   ], [have_gdbm=no])
+ ])
+ 
+-# check for _dbmmodule.c dependencies
++dnl check for _dbmmodule.c dependencies
++dnl ndbm, gdbm_compat, libdb
+ AC_CHECK_HEADERS([ndbm.h], [
+-  LIBS_SAVE="$LIBS"
+-  AC_CHECK_LIB([ndbm], [dbm_open])
+-  LIBS="$LIBS_SAVE"
+-  AC_CHECK_LIB([gdbm_compat], [dbm_open])
+-  LIBS="$LIBS_SAVE"
++  WITH_SAVE_ENV([
++    AC_SEARCH_LIBS([dbm_open], [ndbm gdbm_compat])
++  ])
+ ])
+ 
+-# "gdbm-ndbm.h" and "gdbm/ndbm.h" are both normalized to "gdbm_ndbm_h"
+-# unset ac_cv_header_gdbm_ndbm_h to prevent false positive cache hits.
++AC_MSG_CHECKING([for ndbm presence and linker args])
++AS_CASE([$ac_cv_search_dbm_open],
++  [*ndbm*|*gdbm_compat*], [
++    dbm_ndbm="$ac_cv_search_dbm_open"
++    have_ndbm=yes
++  ],
++  [none*], [
++    dbm_ndbm=""
++    have_ndbm=yes
++  ],
++  [no], [have_ndbm=no]
++)
++AC_MSG_RESULT([$have_ndbm ($dbm_ndbm)])
++
++dnl "gdbm-ndbm.h" and "gdbm/ndbm.h" are both normalized to "gdbm_ndbm_h"
++dnl unset ac_cv_header_gdbm_ndbm_h to prevent false positive cache hits.
+ AS_UNSET([ac_cv_header_gdbm_ndbm_h])
+ AC_CACHE_VAL([ac_cv_header_gdbm_slash_ndbm_h], [
+   AC_CHECK_HEADER(
+@@ -3991,26 +4004,26 @@ AS_VAR_IF([ac_cv_header_gdbm_dash_ndbm_h], [yes], [
+ AS_UNSET([ac_cv_header_gdbm_ndbm_h])
+ 
+ if test "$ac_cv_header_gdbm_slash_ndbm_h" = yes -o "$ac_cv_header_gdbm_dash_ndbm_h" = yes; then
+-  LIBS_SAVE="$LIBS"
+-  AC_CHECK_LIB([gdbm_compat], [dbm_open])
+-  LIBS="$LIBS_SAVE"
++  WITH_SAVE_ENV([
++    AC_SEARCH_LIBS([dbm_open], [gdbm_compat])
++  ])
+ fi
+ 
+ # Check for libdb >= 5 with dbm_open()
+ # db.h re-defines the name of the function
+ AC_CHECK_HEADERS([db.h], [
+   AC_CACHE_CHECK([for libdb], [ac_cv_have_libdb], [
+-    LIBS_SAVE="$LIBS"
+-    LIBS="$LIBS -ldb"
+-    AC_LINK_IFELSE([AC_LANG_PROGRAM([
+-      #define DB_DBM_HSEARCH 1
+-      #include <db.h>
+-      #if DB_VERSION_MAJOR < 5
+-        #error "dh.h: DB_VERSION_MAJOR < 5 is not supported."
+-      #endif
+-      ], [DBM *dbm = dbm_open(NULL, 0, 0)])
+-    ], [ac_cv_have_libdb=yes], [ac_cv_have_libdb=no])
+-    LIBS="$LIBS_SAVE"
++    WITH_SAVE_ENV([
++      LIBS="$LIBS -ldb"
++      AC_LINK_IFELSE([AC_LANG_PROGRAM([
++        #define DB_DBM_HSEARCH 1
++        #include <db.h>
++        #if DB_VERSION_MAJOR < 5
++          #error "dh.h: DB_VERSION_MAJOR < 5 is not supported."
++        #endif
++        ], [DBM *dbm = dbm_open(NULL, 0, 0)])
++      ], [ac_cv_have_libdb=yes], [ac_cv_have_libdb=no])
++    ])
+   ])
+   AS_VAR_IF([ac_cv_have_libdb], [yes], [
+     AC_DEFINE([HAVE_LIBDB], [1], [Define to 1 if you have the `db' library (-ldb).])
+@@ -4018,7 +4031,7 @@ AC_CHECK_HEADERS([db.h], [
+ ])
+ 
+ # Check for --with-dbmliborder
+-AC_MSG_CHECKING(for --with-dbmliborder)
++AC_MSG_CHECKING([for --with-dbmliborder])
+ AC_ARG_WITH(dbmliborder,
+             AS_HELP_STRING([--with-dbmliborder=db1:db2:...], [override order to check db backends for dbm; a valid value is a colon separated string with the backend names `ndbm', `gdbm' and `bdb'.]),
+ [], [with_dbmliborder=gdbm:ndbm:bdb])
+@@ -4038,7 +4051,42 @@ IFS=$as_save_IFS
+ AS_VAR_IF([with_dbmliborder], [error], [
+   AC_MSG_ERROR([proper usage is --with-dbmliborder=db1:db2:... (gdbm:ndbm:bdb)])
+ ])
+-AC_MSG_RESULT($with_dbmliborder)
++AC_MSG_RESULT([$with_dbmliborder])
++
++AC_MSG_CHECKING([for _dbm module CFLAGS and LIBS])
++have_dbm=no
++as_save_IFS=$IFS
++IFS=:
++for db in $with_dbmliborder; do
++  case "$db" in
++    ndbm)
++      if test "$have_ndbm" = yes; then
++        DBM_CFLAGS="-DUSE_NDBM"
++        DBM_LIBS="$dbm_ndbm"
++        have_dbm=yes
++        break
++      fi
++      ;;
++    gdbm)
++      if test "$have_gdbm_compat" = yes; then
++        DBM_CFLAGS="-DUSE_GDBM_COMPAT"
++        DBM_LIBS="-lgdbm_compat"
++        have_dbm=yes
++        break
++      fi
++      ;;
++    bdb)
++      if test "$ac_cv_have_libdb" = yes; then
++        DBM_CFLAGS="-DUSE_BERKDB"
++        DBM_LIBS="-ldb"
++        have_dbm=yes
++        break
++      fi
++     ;;
++  esac
++done
++IFS=$as_save_IFS
++AC_MSG_RESULT([$DBM_CFLAGS $DBM_LIBS])
+ 
+ # Templates for things AC_DEFINEd more than once.
+ # For a single AC_DEFINE, no template is needed.
+@@ -6940,7 +6988,9 @@ PY_STDLIB_MOD([_ctypes],
+ dnl PY_STDLIB_MOD([_curses], [], [], [], [])
+ dnl PY_STDLIB_MOD([_curses_panel], [], [], [], [])
+ PY_STDLIB_MOD([_decimal], [], [], [$LIBMPDEC_CFLAGS], [$LIBMPDEC_LDFLAGS])
+-dnl PY_STDLIB_MOD([_dbm], [], [], [], [])
++PY_STDLIB_MOD([_dbm],
++  [test -n "$with_dbmliborder"], [test "$have_dbm" != "no"],
++  [$DBM_CFLAGS], [$DBM_LIBS])
+ PY_STDLIB_MOD([_gdbm],
+   [test "$have_gdbm_dbmliborder" = yes], [test "$have_gdbm" = yes],
+   [$GDBM_CFLAGS], [$GDBM_LIBS])
+diff --git a/pyconfig.h.in b/pyconfig.h.in
+index 15933e75b1b07..b05ddd41c2bba 100644
+--- a/pyconfig.h.in
++++ b/pyconfig.h.in
+@@ -640,18 +640,12 @@
+ /* Define to 1 if you have the `dld' library (-ldld). */
+ #undef HAVE_LIBDLD
+ 
+-/* Define to 1 if you have the `gdbm_compat' library (-lgdbm_compat). */
+-#undef HAVE_LIBGDBM_COMPAT
+-
+ /* Define to 1 if you have the `ieee' library (-lieee). */
+ #undef HAVE_LIBIEEE
+ 
+ /* Define to 1 if you have the <libintl.h> header file. */
+ #undef HAVE_LIBINTL_H
+ 
+-/* Define to 1 if you have the `ndbm' library (-lndbm). */
+-#undef HAVE_LIBNDBM
+-
+ /* Define to build the readline module. */
+ #undef HAVE_LIBREADLINE
+ 
+diff --git a/setup.py b/setup.py
+index 843ec35effe10..cc11dedee1b2e 100644
+--- a/setup.py
++++ b/setup.py
+@@ -1163,77 +1163,7 @@ def detect_crypt(self):
+         self.addext(Extension('_crypt', ['_cryptmodule.c']))
+ 
+     def detect_dbm_gdbm(self):
+-        # Modules that provide persistent dictionary-like semantics.  You will
+-        # probably want to arrange for at least one of them to be available on
+-        # your machine, though none are defined by default because of library
+-        # dependencies.  The Python module dbm/__init__.py provides an
+-        # implementation independent wrapper for these; dbm/dumb.py provides
+-        # similar functionality (but slower of course) implemented in Python.
+-
+-        dbm_setup_debug = False   # verbose debug prints from this script?
+-        dbm_order = ['gdbm']
+-
+-        # libdb, gdbm and ndbm headers and libraries
+-        have_ndbm_h = sysconfig.get_config_var("HAVE_NDBM_H")
+-        have_gdbm_ndbm_h = sysconfig.get_config_var("HAVE_GDBM_NDBM_H")
+-        have_gdbm_dash_ndbm_h = sysconfig.get_config_var("HAVE_GDBM_DASH_NDBM_H")
+-        have_libndbm = sysconfig.get_config_var("HAVE_LIBNDBM")
+-        have_libgdbm_compat = sysconfig.get_config_var("HAVE_LIBGDBM_COMPAT")
+-        have_libdb = sysconfig.get_config_var("HAVE_LIBDB")
+-
+-        # The standard Unix dbm module:
+-        if not CYGWIN:
+-            config_args = [arg.strip("'")
+-                           for arg in sysconfig.get_config_var("CONFIG_ARGS").split()]
+-            dbm_args = [arg for arg in config_args
+-                        if arg.startswith('--with-dbmliborder=')]
+-            if dbm_args:
+-                dbm_order = [arg.split('=')[-1] for arg in dbm_args][-1].split(":")
+-            else:
+-                dbm_order = "gdbm:ndbm:bdb".split(":")
+-            dbmext = None
+-            for cand in dbm_order:
+-                if cand == "ndbm":
+-                    if have_ndbm_h:
+-                        # Some systems have -lndbm, others have -lgdbm_compat,
+-                        # others don't have either
+-                        if have_libndbm:
+-                            ndbm_libs = ['ndbm']
+-                        elif have_libgdbm_compat:
+-                            ndbm_libs = ['gdbm_compat']
+-                        else:
+-                            ndbm_libs = []
+-                        if dbm_setup_debug: print("building dbm using ndbm")
+-                        dbmext = Extension(
+-                            '_dbm', ['_dbmmodule.c'],
+-                            define_macros=[('USE_NDBM', None)],
+-                            libraries=ndbm_libs
+-                        )
+-                        break
+-                elif cand == "gdbm":
+-                    # dbm_open() is provided by libgdbm_compat, which wraps libgdbm
+-                    if have_libgdbm_compat and (have_gdbm_ndbm_h or have_gdbm_dash_ndbm_h):
+-                        if dbm_setup_debug: print("building dbm using gdbm")
+-                        dbmext = Extension(
+-                            '_dbm', ['_dbmmodule.c'],
+-                            define_macros=[('USE_GDBM_COMPAT', None)],
+-                            libraries=['gdbm_compat']
+-                        )
+-                        break
+-                elif cand == "bdb":
+-                    if have_libdb:
+-                        if dbm_setup_debug: print("building dbm using bdb")
+-                        dbmext = Extension(
+-                            '_dbm', ['_dbmmodule.c'],
+-                            define_macros=[('USE_BERKDB', None)],
+-                            libraries=['db']
+-                        )
+-                        break
+-            if dbmext is not None:
+-                self.add(dbmext)
+-            else:
+-                self.missing.append('_dbm')
+-
++        self.addext(Extension('_dbm', ['_dbmmodule.c']))
+         # Anthony Baxter's gdbm module.  GNU dbm(3) will require -lgdbm:
+         self.addext(Extension('_gdbm', ['_gdbmmodule.c']))
+ 
diff --git a/package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patch b/package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patch
deleted file mode 100644
index 5fb436db59..0000000000
--- a/package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 67e9793d070ac5c8e83abbe95b9208533ffeadd0 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sat, 11 Apr 2020 22:01:40 +0200
-Subject: [PATCH] Add an option to disable the berkeleydb module
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 841fd6732c..06c9a81f95 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4280,6 +4280,12 @@ if test "$UUID" = "no"; then
-    DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _uuid"
- fi
- 
-+AC_ARG_ENABLE(berkeleydb,
-+	AS_HELP_STRING([--disable-berkeleydb], [disable berkeleydb]),
-+	[ if test "$enableval" = "no"; then
-+	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _dbm"
-+	  fi])
-+
- AC_SUBST(PYDOC)
- 
- AC_ARG_ENABLE(pydoc,
--- 
-2.34.1
-
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index bdb7cfd22f..494c66c0b1 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -75,7 +75,7 @@ endif
 ifeq ($(BR2_PACKAGE_PYTHON3_BERKELEYDB),y)
 PYTHON3_DEPENDENCIES += berkeleydb
 else
-PYTHON3_CONF_OPTS += --disable-berkeleydb
+PYTHON3_CONF_ENV += py_cv_module__dbm=n/a
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_READLINE),y)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
