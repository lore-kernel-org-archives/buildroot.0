Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14CDCC4167B
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 20:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 837E640993;
	Sun,  5 Nov 2023 20:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 837E640993
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MKHxq_kdoKNS; Sun,  5 Nov 2023 20:26:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01F2240A62;
	Sun,  5 Nov 2023 20:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01F2240A62
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 805481BF48C
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65AB1418A7
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65AB1418A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y_crjb18XchZ for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 20:26:01 +0000 (UTC)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 06950418A6
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 20:26:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06950418A6
Received: by mail-pl1-x644.google.com with SMTP id
 d9443c01a7336-1cc68c1fac2so34964345ad.0
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 12:26:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699215959; x=1699820759;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1V7INW06i2MBhwUByf0h7ajMhH6TcQaEmPycYfSOQ9w=;
 b=NnZ9a2j9wjUzGsTtUvEVP7HnStGVskgbPUarr1+efUq3dfwNe/ftcE5fimay2osS2Y
 hBnQc1JEP77b0bMloKjDQ65aMVvJdArBwc5pLkjeAl0SPGkrTtJdTTvDiFQC1GPVBaw1
 p2UjEvKcrx8N7fMk2yqB3ycVDefRNSIfagrdZRX5BkZTT0MVQB6zwxXIFFc/O7lmDFbI
 id3a/4u/fxj2RAWNhuZ4NEFL3oIqYbDZyDR/FWtdZSZyTVbc/ImZomD3O8nmmyK9Um1P
 iDq6at8W+z3JBWKAzaXZ56SMxFHsfLh/XczijoWRKtNjgfKYb+itx/DgaVnnSAzpGF8W
 kOyw==
X-Gm-Message-State: AOJu0Yx5cdh8NRV6XfB+cJdB+fV8gVHtAoBzzcixh/2RncPVGDkJq1wq
 w2RQ4sCDfa2zNUna7gQ7j160gWXjJiIakf4bmEVaK/GsWUg=
X-Google-Smtp-Source: AGHT+IE3LAJDD9/zet/WSykdvxw5nydFDLIMg3n2GaeEovFWs3addu9GSPVqyI2dA+TcwQKMqRIYlw==
X-Received: by 2002:a17:902:904a:b0:1c3:c687:478c with SMTP id
 w10-20020a170902904a00b001c3c687478cmr27863193plz.8.1699215959362; 
 Sun, 05 Nov 2023 12:25:59 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 z20-20020a170902ee1400b001c735421215sm4478175plb.216.2023.11.05.12.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 12:25:58 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 13:25:32 -0700
Message-ID: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699215959; x=1699820759;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1V7INW06i2MBhwUByf0h7ajMhH6TcQaEmPycYfSOQ9w=;
 b=NxiSqxDKET0wHMNCXmo/eagT6jOh8BVYXdrWqKR6Ehwk0Dx9xCwRCHX1WCDGGo+bWG
 +a4CxVaIHyVygs9zGDNNG/MA0SHPHHd6KpmazLIDkXOibLHMk3F0Hi15QHf0fCV40KML
 y9ty8mC5Hl++M81GFnOcTSLwKGHahTWUwHurk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=NxiSqxDK
Subject: [Buildroot] [PATCH v2 01/24] package/python3: use upstream build
 system to disable berkeleydb module
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
Cc: Adam Duskett <aduskett@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Bernd Kuhls <bernd@kuhls.net>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Bernd Kuhls <bernd@kuhls.net>

Backport patch 0018 from python 3.12 to enhance build system.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Adam Duskett <aduskett@gmail.com>
Tested-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .checkpackageignore                           |   1 -
 ...18-Port-_dbm-module-to-PY_STDLIB_MOD.patch | 293 ++++++++++++++++++
 ...ion-to-disable-the-berkeleydb-module.patch |  30 --
 package/python3/python3.mk                    |   2 +-
 4 files changed, 294 insertions(+), 32 deletions(-)
 create mode 100644 package/python3/0018-Port-_dbm-module-to-PY_STDLIB_MOD.patch
 delete mode 100644 package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index a126d93901..be46e46c04 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1166,7 +1166,6 @@ package/python3/0026-python-config.sh-don-t-reassign-prefix.patch Upstream
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
index b9c5054a21..8166d306c5 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -72,7 +72,7 @@ endif
 ifeq ($(BR2_PACKAGE_PYTHON3_BERKELEYDB),y)
 PYTHON3_DEPENDENCIES += berkeleydb
 else
-PYTHON3_CONF_OPTS += --disable-berkeleydb
+PYTHON3_CONF_ENV += py_cv_module__dbm=n/a
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_READLINE),y)
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
