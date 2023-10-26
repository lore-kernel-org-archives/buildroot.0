Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F1CC25B48
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 09:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C31541725;
	Thu, 26 Oct 2023 09:29:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C31541725
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fuPmv5WExzoP; Thu, 26 Oct 2023 09:29:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C06254170A;
	Thu, 26 Oct 2023 09:29:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C06254170A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 04C021BF2B8
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D294E41F77
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D294E41F77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HWFTcErzX86W for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 09:27:11 +0000 (UTC)
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5565540911
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 09:27:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5565540911
Received: by mail-ej1-x642.google.com with SMTP id
 a640c23a62f3a-9adb9fa7200so138288866b.0
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 02:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698312429; x=1698917229;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZMgxEwT9wIASAeetYtkoFUutknGPRYw7XOPj3CRmCFU=;
 b=sp4wZFYL0+Jlsj6GLUuHfQ+TPYwkS1PtoXPn/4w9N6sy+Y6Cx9lyD0wu7Dt6Rb09ft
 2i3vGoRG3rMk6TiCGvjZUByWNbHbU12Adu1PNiBqo3SennEh0DbvByyLtzv7XZesnKQj
 h7pqY89YmEfttVBXQKtBbSjpflBVgLTLtJ5bXB2ipbZBWnYNoecv6tubu6nqIdfFG3t4
 R1rdHYRV/qIJya6oOyHLCfTaExsMjds3ChgnyqLE4WNNNTmZl2IgkXHkeirwFCotODDu
 kHo93pzEnR3E42VSyOeXGEtsKXONt5duh9iXz5opup5oXMPdCnQT8J7ijlIo4EaZdzq5
 pxGw==
X-Gm-Message-State: AOJu0YxuV1WzhXxSRjcSrUcv7Diy1XtktPDEQQEtHp8DeJPdLuLXeivl
 SyPwWHeXo2mI6AeJnHu1zZOcr1FY3JZoe6UY/mA16m1shyqlPzXj
X-Google-Smtp-Source: AGHT+IFPH876JFEiEmSKNX1c9FOSVjNLXKu7SNM/3cAm/SJbZd2Xf8OtycIyk0SIj67e/2/EtIra1w==
X-Received: by 2002:a17:907:608a:b0:9b8:df8e:cbd0 with SMTP id
 ht10-20020a170907608a00b009b8df8ecbd0mr1930119ejc.37.1698312428226; 
 Thu, 26 Oct 2023 02:27:08 -0700 (PDT)
Received: from fedora.. ([77.241.232.0]) by smtp.gmail.com with ESMTPSA id
 mb8-20020a170906eb0800b009b947f81c4asm11268438ejb.155.2023.10.26.02.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 02:27:07 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 11:26:35 +0200
Message-ID: <20231026092701.12345-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
References: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698312429; x=1698917229;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZMgxEwT9wIASAeetYtkoFUutknGPRYw7XOPj3CRmCFU=;
 b=XJ7MD3SN0AiOu1ZCJuvgzr7u/t7OYMp3Z9fEijkD+3cmBT/kk1ruNYIIs1ZrJu+wSG
 ZVu+8kiH8z+GvgT0TRGNUHia/AAnjrQbNGvOkVLQkilmaUnDY3xK8Ah+PrnHySfpv9ya
 JTwMmEOBh7X3y7A6PtZULN2SxxzMy4e4VTd48=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=XJ7MD3SN
Subject: [Buildroot] [PATCH 04/30] package/python3: use upstream build
 system to disable curses/readline modules
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Julien Olivain <ju.o@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Bernd Kuhls <bernd@kuhls.net>

Backported patch 0020 from python 3.12 to enhance build system, for
easier backporting backported patch 0019 as well which was applied
upstream before patch 0020.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .checkpackageignore                           |   2 -
 ...-option-to-disable-the-curses-module.patch |  61 --
 .../0019-Port-_ctypes-to-PY_STDLIB_MOD.patch  | 441 +++++++++++
 ...readline-and-curses-to-PY_STDLIB_MOD.patch | 718 ++++++++++++++++++
 ...ption-to-disable-the-readline-module.patch |  30 -
 package/python3/python3.mk                    |  10 +-
 6 files changed, 1166 insertions(+), 96 deletions(-)
 delete mode 100644 package/python3/0015-Add-an-option-to-disable-the-curses-module.patch
 create mode 100644 package/python3/0019-Port-_ctypes-to-PY_STDLIB_MOD.patch
 create mode 100644 package/python3/0020-Port-readline-and-curses-to-PY_STDLIB_MOD.patch
 delete mode 100644 package/python3/0024-Add-an-option-to-disable-the-readline-module.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index f8216dd255..ee67e9a3bf 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1165,7 +1165,6 @@ package/python3/0011-Add-an-option-to-disable-pydoc.patch Upstream
 package/python3/0012-Add-an-option-to-disable-lib2to3.patch Upstream
 package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch Upstream
 package/python3/0014-Add-an-option-to-disable-the-tk-module.patch Upstream
-package/python3/0015-Add-an-option-to-disable-the-curses-module.patch Upstream
 package/python3/0016-Add-an-option-to-disable-expat.patch Upstream
 package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch Upstream
 package/python3/0018-Add-an-option-to-disable-NIS.patch Upstream
@@ -1174,7 +1173,6 @@ package/python3/0020-Add-an-option-to-disable-IDLE.patch Upstream
 package/python3/0021-Add-an-option-to-disable-decimal.patch Upstream
 package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patch Upstream
 package/python3/0023-Add-an-option-to-disable-openssl-support.patch Upstream
-package/python3/0024-Add-an-option-to-disable-the-readline-module.patch Upstream
 package/python3/0026-python-config.sh-don-t-reassign-prefix.patch Upstream
 package/python3/0028-fix-building-on-older-distributions.patch Upstream
 package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch Upstream
diff --git a/package/python3/0015-Add-an-option-to-disable-the-curses-module.patch b/package/python3/0015-Add-an-option-to-disable-the-curses-module.patch
deleted file mode 100644
index da6f891104..0000000000
--- a/package/python3/0015-Add-an-option-to-disable-the-curses-module.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 03e28cdd46dac1b7e4e9c8bbd2ea44b09e514205 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 22 Feb 2017 17:31:51 -0800
-Subject: [PATCH] Add an option to disable the curses module
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-[ Andrey Smirnov: ported to Python 3.6 ]
-Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
-[ Adam Duskett: ported to Python 3.10.0 ]
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- Makefile.pre.in | 4 +++-
- configure.ac    | 9 +++++++++
- 2 files changed, 12 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 4f83911200..8e879b35c6 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -1905,7 +1905,6 @@ LIBSUBDIRS=	asyncio \
- 		concurrent concurrent/futures \
- 		csv \
- 		ctypes ctypes/macholib \
--		curses \
- 		dbm \
- 		distutils distutils/command \
- 		email email/mime \
-@@ -2024,6 +2023,9 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
- 	tkinter/test/test_ttk
- endif
- 
-+ifeq (@CURSES@,yes)
-+LIBSUBDIRS += curses
-+endif
- 
- TEST_MODULES=@TEST_MODULES@
- libinstall:	all $(srcdir)/Modules/xxmodule.c
-diff --git a/configure.ac b/configure.ac
-index f4ce506801..0ae9863cd6 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4189,6 +4189,15 @@ if test "$TK" = "no"; then
-    DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
- fi
- 
-+AC_SUBST(CURSES)
-+AC_ARG_ENABLE(curses,
-+	AS_HELP_STRING([--disable-curses], [disable curses]),
-+	[ CURSES="${enableval}" ], [ CURSES=yes ])
-+
-+if test "$CURSES" = "no"; then
-+   DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _curses _curses_panel"
-+fi
-+
- AC_SUBST(PYDOC)
- 
- AC_ARG_ENABLE(pydoc,
--- 
-2.34.1
-
diff --git a/package/python3/0019-Port-_ctypes-to-PY_STDLIB_MOD.patch b/package/python3/0019-Port-_ctypes-to-PY_STDLIB_MOD.patch
new file mode 100644
index 0000000000..f8e3e43927
--- /dev/null
+++ b/package/python3/0019-Port-_ctypes-to-PY_STDLIB_MOD.patch
@@ -0,0 +1,441 @@
+From bb8b931385ba9df4e01f7dd3ce4575d49f60efdf Mon Sep 17 00:00:00 2001
+From: Christian Heimes <christian@python.org>
+Date: Sun, 26 Jun 2022 13:04:43 +0200
+Subject: [PATCH] gh-90005: Port _ctypes to PY_STDLIB_MOD (GH-32229)
+
+Co-authored-by: Erlend Egeberg Aasland <erlend.aasland@innova.no>
+
+Automerge-Triggered-By: GH:tiran
+
+Upstream: https://github.com/python/cpython/commit/bb8b931385ba9df4e01f7dd3ce4575d49f60efdf
+
+[Bernd: backported to 3.11.4]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Makefile.pre.in                               |   9 +-
+ ...2-04-01-12-35-44.gh-issue-90005.pvaLHQ.rst |   1 +
+ Modules/Setup.stdlib.in                       |   2 +-
+ Modules/_ctypes/callproc.c                    |   3 +
+ Modules/_ctypes/malloc_closure.c              |   3 +
+ configure                                     | 540 +++++++++++++++++-
+ configure.ac                                  | 125 +++-
+ pyconfig.h.in                                 |   9 +
+ setup.py                                      | 115 +---
+ 9 files changed, 660 insertions(+), 147 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Library/2022-04-01-12-35-44.gh-issue-90005.pvaLHQ.rst
+
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index 102cd752c39cd..c0333cea48cd7 100644
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -340,10 +340,6 @@ IO_OBJS=	\
+ 		Modules/_io/bytesio.o \
+ 		Modules/_io/stringio.o
+ 
+-##########################################################################
+-
+-LIBFFI_INCLUDEDIR=	@LIBFFI_INCLUDEDIR@
+-
+ ##########################################################################
+ # Parser
+ 
+@@ -2595,7 +2595,8 @@
+ MODULE_PYEXPAT_DEPS=@LIBEXPAT_INTERNAL@
+ MODULE_UNICODEDATA_DEPS=$(srcdir)/Modules/unicodedata_db.h $(srcdir)/Modules/unicodename_db.h
+ MODULE__BLAKE2_DEPS=$(srcdir)/Modules/_blake2/impl/blake2-config.h $(srcdir)/Modules/_blake2/impl/blake2-impl.h $(srcdir)/Modules/_blake2/impl/blake2.h $(srcdir)/Modules/_blake2/impl/blake2b-load-sse2.h $(srcdir)/Modules/_blake2/impl/blake2b-load-sse41.h $(srcdir)/Modules/_blake2/impl/blake2b-ref.c $(srcdir)/Modules/_blake2/impl/blake2b-round.h $(srcdir)/Modules/_blake2/impl/blake2b.c $(srcdir)/Modules/_blake2/impl/blake2s-load-sse2.h $(srcdir)/Modules/_blake2/impl/blake2s-load-sse41.h $(srcdir)/Modules/_blake2/impl/blake2s-load-xop.h $(srcdir)/Modules/_blake2/impl/blake2s-ref.c $(srcdir)/Modules/_blake2/impl/blake2s-round.h $(srcdir)/Modules/_blake2/impl/blake2s.c $(srcdir)/Modules/_blake2/blake2module.h $(srcdir)/Modules/hashlib.h
+-MODULE__CTYPES_DEPS=$(srcdir)/Modules/_ctypes/ctypes.h
++MODULE__CTYPES_DEPS=$(srcdir)/Modules/_ctypes/ctypes.h $(srcdir)/Modules/_ctypes/darwin/dlfcn.h
++MODULE__CTYPES_MALLOC_CLOSURE=@MODULE__CTYPES_MALLOC_CLOSURE@
+ MODULE__DECIMAL_DEPS=$(srcdir)/Modules/_decimal/docstrings.h @LIBMPDEC_INTERNAL@
+ MODULE__ELEMENTTREE_DEPS=$(srcdir)/Modules/pyexpat.c @LIBEXPAT_INTERNAL@
+ MODULE__HASHLIB_DEPS=$(srcdir)/Modules/hashlib.h
+diff --git a/Misc/NEWS.d/next/Library/2022-04-01-12-35-44.gh-issue-90005.pvaLHQ.rst b/Misc/NEWS.d/next/Library/2022-04-01-12-35-44.gh-issue-90005.pvaLHQ.rst
+new file mode 100644
+index 0000000000000..ef6a881a4d094
+--- /dev/null
++++ b/Misc/NEWS.d/next/Library/2022-04-01-12-35-44.gh-issue-90005.pvaLHQ.rst
+@@ -0,0 +1 @@
++:mod:`ctypes` dependency ``libffi`` is now detected with ``pkg-config``.
+diff --git a/Modules/Setup.stdlib.in b/Modules/Setup.stdlib.in
+index 2730030a15650..a199aefc51011 100644
+--- a/Modules/Setup.stdlib.in
++++ b/Modules/Setup.stdlib.in
+@@ -136,7 +136,7 @@
+ #
+ 
+ # needs -lffi and -ldl
+-#@MODULE__CTYPES_TRUE@_ctypes _ctypes/_ctypes.c _ctypes/callbacks.c _ctypes/callproc.c _ctypes/stgdict.c _ctypes/cfield.c
++@MODULE__CTYPES_TRUE@_ctypes _ctypes/_ctypes.c _ctypes/callbacks.c _ctypes/callproc.c _ctypes/stgdict.c _ctypes/cfield.c @MODULE__CTYPES_MALLOC_CLOSURE@
+ 
+ # needs -lncurses, -lncursesw or -lcurses, sometimes -ltermcap
+ #@MODULE__CURSES_TRUE@_curses _cursesmodule.c
+diff --git a/Modules/_ctypes/callproc.c b/Modules/_ctypes/callproc.c
+index 3fab9ad0c1e7b..fa1dfac6c7d94 100644
+--- a/Modules/_ctypes/callproc.c
++++ b/Modules/_ctypes/callproc.c
+@@ -54,6 +54,9 @@
+ 
+  */
+ 
++#ifndef Py_BUILD_CORE_BUILTIN
++#  define Py_BUILD_CORE_MODULE 1
++#endif
+ #define NEEDS_PY_IDENTIFIER
+ 
+ #include "Python.h"
+diff --git a/Modules/_ctypes/malloc_closure.c b/Modules/_ctypes/malloc_closure.c
+index 38edc90e70763..d47153f1d7f3e 100644
+--- a/Modules/_ctypes/malloc_closure.c
++++ b/Modules/_ctypes/malloc_closure.c
+@@ -1,3 +1,6 @@
++#ifndef Py_BUILD_CORE_BUILTIN
++#  define Py_BUILD_CORE_MODULE 1
++#endif
+ #include <Python.h>
+ #include <ffi.h>
+ #ifdef MS_WIN32
+diff --git a/configure.ac b/configure.ac
+index f9abd851ea5cb..6a8a0a963afa2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -49,6 +49,26 @@ AC_DEFUN([WITH_SAVE_ENV],
+ [RESTORE_ENV]
+ )dnl
+ 
++dnl PY_CHECK_FUNC(FUNCTION, [INCLUDES], [AC_DEFINE-VAR])
++AC_DEFUN([PY_CHECK_FUNC],
++[ AS_VAR_PUSHDEF([py_var], [ac_cv_func_$1])
++  AS_VAR_PUSHDEF([py_define], m4_ifblank([$3], [[HAVE_]m4_toupper($1)], [$3]))
++  AC_CACHE_CHECK(
++    [for $1],
++    [py_var],
++    [AC_COMPILE_IFELSE(
++      [AC_LANG_PROGRAM([$2], [void *x=$1])],
++      [AS_VAR_SET([py_var], [yes])],
++      [AS_VAR_SET([py_var], [no])])]
++  )
++  AS_VAR_IF(
++    [py_var],
++    [yes],
++    [AC_DEFINE([py_define], [1], [Define if you have the '$1' function.])])
++  AS_VAR_POPDEF([py_var])
++  AS_VAR_POPDEF([py_define])
++])
++
+ AC_SUBST(BASECPPFLAGS)
+ if test "$srcdir" != . -a "$srcdir" != "$(pwd)"; then
+     # If we're building out-of-tree, we need to make sure the following
+@@ -713,6 +733,21 @@ fi
+ 
+ if test "$ac_sys_system" = "Darwin"
+ then
++  dnl look for SDKROOT
++  AC_CHECK_PROG([HAS_XCRUN], [xcrun], [yes], [missing])
++  AC_MSG_CHECKING([macOS SDKROOT])
++  if test -z "$SDKROOT"; then
++    dnl SDKROOT not set
++    if test "$HAS_XCRUN" = "yes"; then
++      dnl detect with Xcode
++      SDKROOT=$(xcrun --show-sdk-path)
++    else
++      dnl default to root
++      SDKROOT="/"
++    fi
++  fi
++  AC_MSG_RESULT([$SDKROOT])
++
+ 	# Compiler selection on MacOSX is more complicated than
+ 	# AC_PROG_CC can handle, see Mac/README for more
+ 	# information
+@@ -1101,7 +1136,7 @@ AC_DEFINE_UNQUOTED([PY_SUPPORT_TIER], [$PY_SUPPORT_TIER], [PEP 11 Support tier (
+ 
+ AC_CACHE_CHECK([for -Wl,--no-as-needed], [ac_cv_wl_no_as_needed], [
+   save_LDFLAGS="$LDFLAGS"
+-  AS_VAR_APPEND([LDFLAGS], [-Wl,--no-as-needed])
++  AS_VAR_APPEND([LDFLAGS], [" -Wl,--no-as-needed"])
+   AC_LINK_IFELSE([AC_LANG_PROGRAM([[]], [[]])],
+     [NO_AS_NEEDED="-Wl,--no-as-needed"
+      ac_cv_wl_no_as_needed=yes],
+@@ -3564,12 +3599,60 @@ else
+     with_system_ffi="yes"
+ fi
+ 
+-if test "$with_system_ffi" = "yes" && test -n "$PKG_CONFIG"; then
+-    LIBFFI_INCLUDEDIR="`"$PKG_CONFIG" libffi --cflags-only-I 2>/dev/null | sed -e 's/^-I//;s/ *$//'`"
+-else
+-    LIBFFI_INCLUDEDIR=""
+-fi
+-AC_SUBST(LIBFFI_INCLUDEDIR)
++dnl detect libffi
++have_libffi=missing
++AS_VAR_IF([with_system_ffi], [yes], [
++  PKG_CHECK_MODULES([LIBFFI], [libffi], [have_libffi=yes], [
++    AC_CHECK_HEADER([ffi.h], [
++      WITH_SAVE_ENV([
++        AC_CHECK_LIB([ffi], [ffi_call], [have_libffi=yes], [have_libffi=no])
++      ])
++    ])
++  ])
++], [
++  AS_VAR_IF([ac_sys_system], [Darwin], [
++    WITH_SAVE_ENV([
++      CFLAGS="-I${SDKROOT}/usr/include/ffi $CFLAGS"
++      AC_CHECK_HEADER([ffi.h], [
++        AC_CHECK_LIB([ffi], [ffi_call], [
++          dnl use ffi from SDK root
++          have_libffi=yes
++          LIBFFI_CFLAGS="-I${SDKROOT}/usr/include/ffi -DUSING_APPLE_OS_LIBFFI=1"
++          LIBFFI_LIBS="-lffi"
++        ], [have_libffi=no])
++      ])
++    ])
++  ])
++])
++
++AS_VAR_IF([have_libffi], [yes], [
++  ctypes_malloc_closure=no
++  AS_CASE([$ac_sys_system],
++    [Darwin], [
++      dnl when do we need USING_APPLE_OS_LIBFFI?
++      AS_VAR_APPEND([LIBFFI_CFLAGS], [" -I\$(srcdir)/Modules/_ctypes/darwin -DMACOSX"])
++      ctypes_malloc_closure=yes
++    ],
++    [sunos5], [AS_VAR_APPEND([LIBFFI_LIBS], [" -mimpure-text"])]
++  )
++  AS_VAR_IF([ctypes_malloc_closure], [yes], [
++    MODULE__CTYPES_MALLOC_CLOSURE=_ctypes/malloc_closure.c
++    AS_VAR_APPEND([LIBFFI_CFLAGS], [" -DUSING_MALLOC_CLOSURE_DOT_C=1"])
++  ])
++  AC_SUBST([MODULE__CTYPES_MALLOC_CLOSURE])
++
++  dnl HAVE_LIBDL: for dlopen, see gh-76828
++  AS_VAR_IF([ac_cv_lib_dl_dlopen], [yes], [AS_VAR_APPEND([LIBFFI_LIBS], [" -ldl"])])
++
++  WITH_SAVE_ENV([
++    CFLAGS="$LIBFFI_CFLAGS $CFLAGS"
++    LDFLAGS="$LIBFFI_LIBS $LDFLAGS"
++
++    PY_CHECK_FUNC([ffi_prep_cif_var], [#include <ffi.h>])
++    PY_CHECK_FUNC([ffi_prep_closure_loc], [#include <ffi.h>])
++    PY_CHECK_FUNC([ffi_closure_alloc], [#include <ffi.h>])
++  ])
++])
+ 
+ # Check for use of the system libmpdec library
+ AC_MSG_CHECKING(for --with-system-libmpdec)
+@@ -4526,26 +4609,6 @@ AC_CHECK_DECL(dirfd,
+       [#include <sys/types.h>
+        #include <dirent.h>])
+ 
+-dnl PY_CHECK_FUNC(FUNCTION, [INCLUDES], [AC_DEFINE-VAR])
+-AC_DEFUN([PY_CHECK_FUNC],
+-[ AS_VAR_PUSHDEF([py_var], [ac_cv_func_$1])
+-  AS_VAR_PUSHDEF([py_define], m4_ifblank([$3], [[HAVE_]m4_toupper($1)], [$3]))
+-  AC_CACHE_CHECK(
+-    [for $1],
+-    [py_var],
+-    [AC_COMPILE_IFELSE(
+-      [AC_LANG_PROGRAM([$2], [void *x=$1])],
+-      [AS_VAR_SET([py_var], [yes])],
+-      [AS_VAR_SET([py_var], [no])])]
+-  )
+-  AS_VAR_IF(
+-    [py_var],
+-    [yes],
+-    [AC_DEFINE([py_define], [1], [Define if you have the '$1' function.])])
+-  AS_VAR_POPDEF([py_var])
+-  AS_VAR_POPDEF([py_define])
+-])
+-
+ # For some functions, having a definition is not sufficient, since
+ # we want to take their address.
+ PY_CHECK_FUNC([chroot], [#include <unistd.h>])
+@@ -6868,7 +6931,9 @@ PY_STDLIB_MOD([_blake2],
+ PY_STDLIB_MOD([_crypt],
+   [], [test "$ac_cv_crypt_crypt" = yes],
+   [$LIBCRYPT_CFLAGS], [$LIBCRYPT_LIBS])
+-dnl PY_STDLIB_MOD([_ctypes], [], [], [], [])
++PY_STDLIB_MOD([_ctypes],
++  [], [test "$have_libffi" = yes],
++  [$LIBFFI_CFLAGS], [$LIBFFI_LIBS])
+ dnl PY_STDLIB_MOD([_curses], [], [], [], [])
+ dnl PY_STDLIB_MOD([_curses_panel], [], [], [], [])
+ PY_STDLIB_MOD([_decimal], [], [], [$LIBMPDEC_CFLAGS], [$LIBMPDEC_LDFLAGS])
+@@ -6914,7 +6979,9 @@ PY_STDLIB_MOD([_testbuffer], [test "$TEST_MODULES" = yes])
+ PY_STDLIB_MOD([_testimportmultiple], [test "$TEST_MODULES" = yes], [test "$ac_cv_func_dlopen" = yes])
+ PY_STDLIB_MOD([_testmultiphase], [test "$TEST_MODULES" = yes], [test "$ac_cv_func_dlopen" = yes])
+ PY_STDLIB_MOD([_xxtestfuzz], [test "$TEST_MODULES" = yes])
+-PY_STDLIB_MOD([_ctypes_test], [test "$TEST_MODULES" = yes], [test "$ac_cv_func_dlopen" = yes], [], [-lm])
++PY_STDLIB_MOD([_ctypes_test],
++  [test "$TEST_MODULES" = yes], [test "$have_libffi" = yes -a "$ac_cv_func_dlopen" = yes],
++  [], [$LIBM])
+ 
+ dnl Limited API template modules.
+ dnl The limited C API is not compatible with the Py_TRACE_REFS macro.
+diff --git a/pyconfig.h.in b/pyconfig.h.in
+index a09652ec15e53..15933e75b1b07 100644
+--- a/pyconfig.h.in
++++ b/pyconfig.h.in
+@@ -356,6 +356,15 @@
+ /* Define to 1 if you have the `fexecve' function. */
+ #undef HAVE_FEXECVE
+ 
++/* Define if you have the 'ffi_closure_alloc' function. */
++#undef HAVE_FFI_CLOSURE_ALLOC
++
++/* Define if you have the 'ffi_prep_cif_var' function. */
++#undef HAVE_FFI_PREP_CIF_VAR
++
++/* Define if you have the 'ffi_prep_closure_loc' function. */
++#undef HAVE_FFI_PREP_CLOSURE_LOC
++
+ /* Define to 1 if you have the `flock' function. */
+ #undef HAVE_FLOCK
+ 
+diff --git a/setup.py b/setup.py
+index bba344c3af07c..af2800744091c 100644
+--- a/setup.py
++++ b/setup.py
+@@ -395,11 +395,6 @@ def remove_disabled(self):
+         # Remove modules that are present on the disabled list
+         extensions = [ext for ext in self.extensions
+                       if ext.name not in DISABLED_MODULE_LIST]
+-        # move ctypes to the end, it depends on other modules
+-        ext_map = dict((ext.name, i) for i, ext in enumerate(extensions))
+-        if "_ctypes" in ext_map:
+-            ctypes = extensions.pop(ext_map["_ctypes"])
+-            extensions.append(ctypes)
+         self.extensions = extensions
+ 
+     def update_sources_depends(self):
+@@ -600,12 +595,6 @@ def print_three_column(lst):
+             raise RuntimeError("Failed to build some stdlib modules")
+ 
+     def build_extension(self, ext):
+-
+-        if ext.name == '_ctypes':
+-            if not self.configure_ctypes(ext):
+-                self.failed.append(ext.name)
+-                return
+-
+         try:
+             build_ext.build_extension(self, ext)
+         except (CCompilerError, DistutilsError) as why:
+@@ -1370,102 +1359,24 @@ def detect_modules(self):
+     def detect_tkinter(self):
+         self.addext(Extension('_tkinter', ['_tkinter.c', 'tkappinit.c']))
+ 
+-    def configure_ctypes(self, ext):
+-        return True
+-
+     def detect_ctypes(self):
+         # Thomas Heller's _ctypes module
++        src = [
++            '_ctypes/_ctypes.c',
++            '_ctypes/callbacks.c',
++            '_ctypes/callproc.c',
++            '_ctypes/stgdict.c',
++            '_ctypes/cfield.c',
++        ]
++        malloc_closure = sysconfig.get_config_var(
++            "MODULE__CTYPES_MALLOC_CLOSURE"
++        )
++        if malloc_closure:
++            src.append(malloc_closure)
+ 
+-        if (not sysconfig.get_config_var("LIBFFI_INCLUDEDIR") and MACOS):
+-            self.use_system_libffi = True
+-        else:
+-            self.use_system_libffi = '--with-system-ffi' in sysconfig.get_config_var("CONFIG_ARGS")
+-
+-        include_dirs = []
+-        extra_compile_args = []
+-        extra_link_args = []
+-        sources = ['_ctypes/_ctypes.c',
+-                   '_ctypes/callbacks.c',
+-                   '_ctypes/callproc.c',
+-                   '_ctypes/stgdict.c',
+-                   '_ctypes/cfield.c']
+-
+-        if MACOS:
+-            sources.append('_ctypes/malloc_closure.c')
+-            extra_compile_args.append('-DUSING_MALLOC_CLOSURE_DOT_C=1')
+-            extra_compile_args.append('-DMACOSX')
+-            include_dirs.append('_ctypes/darwin')
+-
+-        elif HOST_PLATFORM == 'sunos5':
+-            # XXX This shouldn't be necessary; it appears that some
+-            # of the assembler code is non-PIC (i.e. it has relocations
+-            # when it shouldn't. The proper fix would be to rewrite
+-            # the assembler code to be PIC.
+-            # This only works with GCC; the Sun compiler likely refuses
+-            # this option. If you want to compile ctypes with the Sun
+-            # compiler, please research a proper solution, instead of
+-            # finding some -z option for the Sun compiler.
+-            extra_link_args.append('-mimpure-text')
+-
+-        ext = Extension('_ctypes',
+-                        include_dirs=include_dirs,
+-                        extra_compile_args=extra_compile_args,
+-                        extra_link_args=extra_link_args,
+-                        libraries=[],
+-                        sources=sources)
+-        self.add(ext)
+-        # function my_sqrt() needs libm for sqrt()
++        self.addext(Extension('_ctypes', src))
+         self.addext(Extension('_ctypes_test', ['_ctypes/_ctypes_test.c']))
+ 
+-        ffi_inc = sysconfig.get_config_var("LIBFFI_INCLUDEDIR")
+-        ffi_lib = None
+-
+-        ffi_inc_dirs = self.inc_dirs.copy()
+-        if MACOS:
+-            ffi_in_sdk = os.path.join(macosx_sdk_root(), "usr/include/ffi")
+-
+-            if not ffi_inc:
+-                if os.path.exists(ffi_in_sdk):
+-                    ext.extra_compile_args.append("-DUSING_APPLE_OS_LIBFFI=1")
+-                    ffi_inc = ffi_in_sdk
+-                    ffi_lib = 'ffi'
+-                else:
+-                    # OS X 10.5 comes with libffi.dylib; the include files are
+-                    # in /usr/include/ffi
+-                    ffi_inc_dirs.append('/usr/include/ffi')
+-
+-        if not ffi_inc:
+-            found = find_file('ffi.h', [], ffi_inc_dirs)
+-            if found:
+-                ffi_inc = found[0]
+-        if ffi_inc:
+-            ffi_h = ffi_inc + '/ffi.h'
+-            if not os.path.exists(ffi_h):
+-                ffi_inc = None
+-                print('Header file {} does not exist'.format(ffi_h))
+-        if ffi_lib is None and ffi_inc:
+-            for lib_name in ('ffi', 'ffi_pic'):
+-                if (self.compiler.find_library_file(self.lib_dirs, lib_name)):
+-                    ffi_lib = lib_name
+-                    break
+-
+-        if ffi_inc and ffi_lib:
+-            ffi_headers = glob(os.path.join(ffi_inc, '*.h'))
+-            if grep_headers_for('ffi_prep_cif_var', ffi_headers):
+-                ext.extra_compile_args.append("-DHAVE_FFI_PREP_CIF_VAR=1")
+-            if grep_headers_for('ffi_prep_closure_loc', ffi_headers):
+-                ext.extra_compile_args.append("-DHAVE_FFI_PREP_CLOSURE_LOC=1")
+-            if grep_headers_for('ffi_closure_alloc', ffi_headers):
+-                ext.extra_compile_args.append("-DHAVE_FFI_CLOSURE_ALLOC=1")
+-
+-            ext.include_dirs.append(ffi_inc)
+-            ext.libraries.append(ffi_lib)
+-            self.use_system_libffi = True
+-
+-        if sysconfig.get_config_var('HAVE_LIBDL'):
+-            # for dlopen, see bpo-32647
+-            ext.libraries.append('dl')
+-
+     def detect_decimal(self):
+         # Stefan Krah's _decimal module
+         self.addext(
+--- Makefile.pre.in.orig	2023-08-07 20:50:54.600398448 +0200
++++ Makefile.pre.in	2023-08-07 20:53:37.130317846 +0200
diff --git a/package/python3/0020-Port-readline-and-curses-to-PY_STDLIB_MOD.patch b/package/python3/0020-Port-readline-and-curses-to-PY_STDLIB_MOD.patch
new file mode 100644
index 0000000000..43a5eb07ef
--- /dev/null
+++ b/package/python3/0020-Port-readline-and-curses-to-PY_STDLIB_MOD.patch
@@ -0,0 +1,718 @@
+From e925241d95d8095adf67f492042f97254ff82ec1 Mon Sep 17 00:00:00 2001
+From: Christian Heimes <christian@python.org>
+Date: Wed, 6 Jul 2022 11:56:25 +0200
+Subject: [PATCH] gh-90005: Port readline and curses to PY_STDLIB_MOD
+ (GH-94452)
+
+Co-authored-by: Erlend Egeberg Aasland <erlend.aasland@protonmail.com>
+
+Upstream: https://github.com/python/cpython/commit/e925241d95d8095adf67f492042f97254ff82ec1
+
+[Bernd: backported to 3.11.4]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ ...2-06-30-17-18-23.gh-issue-90005.EIOOla.rst |    5 +
+ Modules/Setup.stdlib.in                       |   12 +-
+ configure                                     | 1977 ++++++++++++++---
+ configure.ac                                  |  388 +++-
+ pyconfig.h.in                                 |   17 +-
+ setup.py                                      |  146 +-
+ 6 files changed, 2015 insertions(+), 530 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Build/2022-06-30-17-18-23.gh-issue-90005.EIOOla.rst
+
+diff --git a/Misc/NEWS.d/next/Build/2022-06-30-17-18-23.gh-issue-90005.EIOOla.rst b/Misc/NEWS.d/next/Build/2022-06-30-17-18-23.gh-issue-90005.EIOOla.rst
+new file mode 100644
+index 0000000000000..90a2dd486c195
+--- /dev/null
++++ b/Misc/NEWS.d/next/Build/2022-06-30-17-18-23.gh-issue-90005.EIOOla.rst
+@@ -0,0 +1,5 @@
++Dependencies of :mod:`readline` and :mod:`curses` module are now detected in
++``configure`` script with ``pkg-config``. Only ``ncurses`` / ``ncursesw``
++are detected automatically. The old ``curses`` library is not configured
++automatically. Workaround for missing ``termcap`` or ``tinfo`` library
++has been removed.
+diff --git a/Modules/Setup.stdlib.in b/Modules/Setup.stdlib.in
+index ad34f85e25451..7357aacd7267a 100644
+--- a/Modules/Setup.stdlib.in
++++ b/Modules/Setup.stdlib.in
+@@ -72,8 +72,8 @@
+ # gdbm module needs -lgdbm
+ @MODULE__GDBM_TRUE@_gdbm _gdbmmodule.c
+ 
+-# needs -lreadline or -leditline, sometimes termcap, termlib, or tinfo
+-#@MODULE_READLINE_TRUE@readline readline.c
++# needs -lreadline or -ledit, sometimes termcap, termlib, or tinfo
++@MODULE_READLINE_TRUE@readline readline.c
+ 
+ # hashing builtins, can be disabled with --without-builtin-hashlib-hashes
+ @MODULE__MD5_TRUE@_md5 md5module.c
+@@ -138,10 +138,10 @@
+ # needs -lffi and -ldl
+ @MODULE__CTYPES_TRUE@_ctypes _ctypes/_ctypes.c _ctypes/callbacks.c _ctypes/callproc.c _ctypes/stgdict.c _ctypes/cfield.c @MODULE__CTYPES_MALLOC_CLOSURE@
+ 
+-# needs -lncurses, -lncursesw or -lcurses, sometimes -ltermcap
+-#@MODULE__CURSES_TRUE@_curses _cursesmodule.c
+-# needs -lncurses and -lpanel
+-#@MODULE__CURSES_PANEL_TRUE@_curses_panel _curses_panel.c
++# needs -lncurses[w], sometimes -ltermcap/tinfo
++@MODULE__CURSES_TRUE@_curses _cursesmodule.c
++# needs -lncurses[w] and -lpanel[w]
++@MODULE__CURSES_PANEL_TRUE@_curses_panel _curses_panel.c
+ 
+ @MODULE__SQLITE3_TRUE@_sqlite3 _sqlite/blob.c _sqlite/connection.c _sqlite/cursor.c _sqlite/microprotocols.c _sqlite/module.c _sqlite/prepare_protocol.c _sqlite/row.c _sqlite/statement.c _sqlite/util.c
+ 
+diff --git a/configure.ac b/configure.ac
+index b03ead3bdefa0..42e181bca9dac 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -5780,127 +5780,169 @@ then
+   [Define this if you have flockfile(), getc_unlocked(), and funlockfile()])
+ fi
+ 
+-AC_ARG_WITH([readline],
+-  [AS_HELP_STRING([--with(out)-readline@<:@=editline@:>@],
+-    [use Editline for backend or disable readline module])],
+-    [],
+-    [with_readline=yes])
++dnl Check for libreadline and libedit
++dnl - libreadline provides "readline/readline.h" header and "libreadline"
++dnl   shared library. pkg-config file is readline.pc
++dnl - libedit provides "editline/readline.h" header and "libedit" shared
++dnl   library. pkg-config file ins libedit.pc
++dnl - editline is not supported ("readline.h" and "libeditline" shared library)
++dnl
++dnl NOTE: In the past we checked if readline needs an additional termcap
++dnl library (tinfo ncursesw ncurses termcap). We now assume that libreadline
++dnl or readline.pc provide correct linker information.
+ 
+-# check where readline lives
+-py_cv_lib_readline=no
+-# save the value of LIBS so we don't actually link Python with readline
+-LIBS_no_readline=$LIBS
++AH_TEMPLATE([WITH_EDITLINE], [Define to build the readline module against libedit.])
+ 
+-if test "$with_readline" != no; then
+-  case "$with_readline" in
+-  editline|edit)
+-    LIBREADLINE=edit
+-    AC_DEFINE(WITH_EDITLINE, 1,
+-      [Define to build the readline module against Editline.])
+-    ;;
+-  yes|readline)
++AC_ARG_WITH(
++  [readline],
++  [AS_HELP_STRING([--with(out)-readline@<:@=editline|readline|no@:>@],
++                  [use libedit for backend or disable readline module])],
++  [
++    AS_CASE([$with_readline],
++      [editline|edit], [with_readline=edit],
++      [yes|readline], [with_readline=readline],
++      [no], [],
++      [AC_MSG_ERROR([proper usage is --with(out)-readline@<:@=editline|readline|no@:>@])]
++    )
++  ],
++  [with_readline=readline]
++)
++
++AS_VAR_IF([with_readline], [readline], [
++  PKG_CHECK_MODULES([LIBREADLINE], [readline], [
+     LIBREADLINE=readline
+-    ;;
+-  *)
+-    AC_MSG_ERROR([proper usage is --with(out)-readline@<:@=editline@:>@])
+-    ;;
+-  esac
++    READLINE_CFLAGS=$LIBREADLINE_CFLAGS
++    READLINE_LIBS=$LIBREADLINE_LIBS
++  ], [
++    AC_CHECK_HEADERS([readline/readline.h], [
++      WITH_SAVE_ENV([
++        AC_CHECK_LIB([readline], [readline], [
++          LIBREADLINE=readline
++          READLINE_CFLAGS=${LIBREADLINE_CFLAGS-""}
++          READLINE_LIBS=${LIBREADLINE_LIBS-"-lreadline"}
++        ], [
++          with_readline=no
++        ])
++      ])
++    ], [with_readline=no])
++  ])
++])
+ 
+-  # On some systems we need to link readline to a termcap compatible
+-  # library.  NOTE: Keep the precedence of listed libraries synchronised
+-  # with setup.py.
+-  AC_MSG_CHECKING([how to link readline libs])
+-  for py_libtermcap in "" tinfo ncursesw ncurses curses termcap; do
+-    if test -z "$py_libtermcap"; then
+-      READLINE_LIBS="-l$LIBREADLINE"
+-    else
+-      READLINE_LIBS="-l$LIBREADLINE -l$py_libtermcap"
+-    fi
+-    LIBS="$READLINE_LIBS $LIBS_no_readline"
+-    AC_LINK_IFELSE(
+-      [AC_LANG_CALL([],[readline])],
+-      [py_cv_lib_readline=yes])
+-    if test $py_cv_lib_readline = yes; then
+-      break
+-    fi
+-  done
++AS_VAR_IF([with_readline], [edit], [
++  PKG_CHECK_MODULES([LIBEDIT], [libedit], [
++    AC_DEFINE([WITH_EDITLINE], [1])
++    LIBREADLINE=edit
++    READLINE_CFLAGS=$LIBEDIT_CFLAGS
++    READLINE_LIBS=$LIBEDIT_LIBS
++  ], [
++    AC_CHECK_HEADERS([editline/readline.h], [
++      WITH_SAVE_ENV([
++        AC_CHECK_LIB([edit], [readline], [
++          LIBREADLINE=edit
++          AC_DEFINE([WITH_EDITLINE], [1])
++          READLINE_CFLAGS=${LIBEDIT_CFLAGS-""}
++          READLINE_LIBS=${LIBEDIT_LIBS-"-ledit"}
++        ], [
++          with_readline=no
++        ])
++      ])
++    ], [with_readline=no])
++  ])
++])
+ 
+-  # Uncomment this line if you want to use READLINE_LIBS in Makefile or scripts
+-  #AC_SUBST([READLINE_LIBS])
+-  if test $py_cv_lib_readline = no; then
+-    AC_MSG_RESULT([none])
+-  else
+-    AC_MSG_RESULT([$READLINE_LIBS])
+-    AC_DEFINE(HAVE_LIBREADLINE, 1,
+-      [Define to build the readline module.])
+-  fi
+-fi
+ 
+-if test "$py_cv_lib_readline" = yes; then
+-  # check for readline 2.2
+-  AC_CHECK_DECL(rl_completion_append_character,
+-    AC_DEFINE(HAVE_RL_COMPLETION_APPEND_CHARACTER, 1,
+-      [Define if you have readline 2.2]),,
+-    [
+-#include <stdio.h> /* Must be first for Gnu Readline */
+-#ifdef WITH_EDITLINE
+-# include <editline/readline.h>
+-#else
+-# include <readline/readline.h>
+-#endif
++AC_MSG_CHECKING([how to link readline])
++AS_VAR_IF([with_readline], [no], [
++  AC_MSG_RESULT([no])
++], [
++  AC_MSG_RESULT([$with_readline (CFLAGS: $READLINE_CFLAGS, LIBS: $READLINE_LIBS)])
++
++  WITH_SAVE_ENV([
++    CPPFLAGS="$READLINE_CFLAGS $CFLAGS"
++    LIBS="$READLINE_LIBS $LIBS"
++    LIBS_SAVE=$LIBS
++
++    m4_define([readline_includes], [
++      #include <stdio.h> /* Must be first for Gnu Readline */
++      #ifdef WITH_EDITLINE
++      # include <editline/readline.h>
++      #else
++      # include <readline/readline.h>
++      # include <readline/history.h>
++      #endif
+     ])
+-  AC_CHECK_DECL(rl_completion_suppress_append,
+-    AC_DEFINE(HAVE_RL_COMPLETION_SUPPRESS_APPEND, 1,
+-      [Define if you have rl_completion_suppress_append]),,
+-    [
+-#include <stdio.h> /* Must be first for Gnu Readline */
+-#ifdef WITH_EDITLINE
+-# include <editline/readline.h>
+-#else
+-# include <readline/readline.h>
+-#endif
++
++    # check for readline 2.2
++    AC_CHECK_DECL([rl_completion_append_character], [
++      AC_DEFINE([HAVE_RL_COMPLETION_APPEND_CHARACTER], [1], [Define if you have readline 2.2])
++    ], [], [readline_includes])
++
++    AC_CHECK_DECL([rl_completion_suppress_append], [
++      AC_DEFINE([HAVE_RL_COMPLETION_SUPPRESS_APPEND], [1], [Define if you have rl_completion_suppress_append])
++    ], [], [readline_includes])
++
++    # check for readline 4.0
++    AC_CACHE_CHECK([for rl_pre_input_hook in -l$LIBREADLINE], [ac_cv_readline_rl_pre_input_hook], [
++      AC_LINK_IFELSE(
++        [AC_LANG_PROGRAM([readline_includes], [void *x = rl_pre_input_hook])],
++        [ac_cv_readline_rl_pre_input_hook=yes], [ac_cv_readline_rl_pre_input_hook=no]
++      )
++    ])
++    AS_VAR_IF([ac_cv_readline_rl_pre_input_hook], [yes], [
++      AC_DEFINE([HAVE_RL_PRE_INPUT_HOOK], [1], [Define if you have readline 4.0])
+     ])
+ 
+-  # check for readline 4.0
+-  AC_CHECK_LIB($LIBREADLINE, rl_pre_input_hook,
+-    AC_DEFINE(HAVE_RL_PRE_INPUT_HOOK, 1,
+-      [Define if you have readline 4.0]),,$READLINE_LIBS)
+-
+-  # also in 4.0
+-  AC_CHECK_LIB($LIBREADLINE, rl_completion_display_matches_hook,
+-    AC_DEFINE(HAVE_RL_COMPLETION_DISPLAY_MATCHES_HOOK, 1,
+-      [Define if you have readline 4.0]),,$READLINE_LIBS)
+-
+-  # also in 4.0, but not in editline
+-  AC_CHECK_LIB($LIBREADLINE, rl_resize_terminal,
+-    AC_DEFINE(HAVE_RL_RESIZE_TERMINAL, 1,
+-      [Define if you have readline 4.0]),,$READLINE_LIBS)
+-
+-  # check for readline 4.2
+-  AC_CHECK_LIB($LIBREADLINE, rl_completion_matches,
+-    AC_DEFINE(HAVE_RL_COMPLETION_MATCHES, 1,
+-      [Define if you have readline 4.2]),,$READLINE_LIBS)
+-
+-  # also in readline 4.2
+-  AC_CHECK_DECL(rl_catch_signals,
+-    AC_DEFINE(HAVE_RL_CATCH_SIGNAL, 1,
+-      [Define if you can turn off readline's signal handling.]),,
+-    [
+-#include <stdio.h> /* Must be first for Gnu Readline */
+-#ifdef WITH_EDITLINE
+-# include <editline/readline.h>
+-#else
+-# include <readline/readline.h>
+-#endif
++    # also in 4.0
++    AC_CACHE_CHECK([for rl_completion_display_matches_hook in -l$LIBREADLINE], [ac_cv_readline_rl_completion_display_matches_hook], [
++      AC_LINK_IFELSE(
++        [AC_LANG_PROGRAM([readline_includes], [void *x = rl_completion_display_matches_hook])],
++        [ac_cv_readline_rl_completion_display_matches_hook=yes], [ac_cv_readline_rl_completion_display_matches_hook=no]
++      )
++    ])
++    AS_VAR_IF([ac_cv_readline_rl_completion_display_matches_hook], [yes], [
++      AC_DEFINE([HAVE_RL_COMPLETION_DISPLAY_MATCHES_HOOK], [1], [Define if you have readline 4.0])
+     ])
+ 
+-  AC_CHECK_LIB($LIBREADLINE, append_history,
+-    AC_DEFINE(HAVE_RL_APPEND_HISTORY, 1,
+-      [Define if readline supports append_history]),,$READLINE_LIBS)
+-fi
++    # also in 4.0, but not in editline
++      AC_CACHE_CHECK([for rl_resize_terminal in -l$LIBREADLINE], [ac_cv_readline_rl_resize_terminal], [
++      AC_LINK_IFELSE(
++        [AC_LANG_PROGRAM([readline_includes], [void *x = rl_resize_terminal])],
++        [ac_cv_readline_rl_resize_terminal=yes], [ac_cv_readline_rl_resize_terminal=no]
++      )
++    ])
++    AS_VAR_IF([ac_cv_readline_rl_resize_terminal], [yes], [
++      AC_DEFINE([HAVE_RL_RESIZE_TERMINAL], [1], [Define if you have readline 4.0])
++    ])
+ 
+-# End of readline checks: restore LIBS
+-LIBS=$LIBS_no_readline
++    # check for readline 4.2
++    AC_CACHE_CHECK([for rl_completion_matches in -l$LIBREADLINE], [ac_cv_readline_rl_completion_matches], [
++      AC_LINK_IFELSE(
++        [AC_LANG_PROGRAM([readline_includes], [void *x = rl_completion_matches])],
++        [ac_cv_readline_rl_completion_matches=yes], [ac_cv_readline_rl_completion_matches=no]
++      )
++    ])
++    AS_VAR_IF([ac_cv_readline_rl_completion_matches], [yes], [
++      AC_DEFINE([HAVE_RL_COMPLETION_MATCHES], [1], [Define if you have readline 4.2])
++    ])
++
++    # also in readline 4.2
++    AC_CHECK_DECL([rl_catch_signals], [
++      AC_DEFINE([HAVE_RL_CATCH_SIGNAL], [1], [Define if you can turn off readline's signal handling.])
++    ], [], [readline_includes])
++
++    AC_CACHE_CHECK([for append_history in -l$LIBREADLINE], [ac_cv_readline_append_history], [
++      AC_LINK_IFELSE(
++        [AC_LANG_PROGRAM([readline_includes], [void *x = append_history])],
++        [ac_cv_readline_append_history=yes], [ac_cv_readline_append_history=no]
++      )
++    ])
++    AS_VAR_IF([ac_cv_readline_append_history], [yes], [
++      AC_DEFINE([HAVE_RL_APPEND_HISTORY], [1], [Define if readline supports append_history])
++    ])
++
++    m4_undefine([readline_includes])
++  ])dnl WITH_SAVE_ENV()
++])
+ 
+ AC_CACHE_CHECK([for broken nice()], [ac_cv_broken_nice], [
+ AC_RUN_IFELSE([AC_LANG_SOURCE([[
+@@ -6056,14 +6098,124 @@ then
+   [Define if you have struct stat.st_mtimensec])
+ fi
+ 
++dnl check for ncurses/ncursesw and panel/panelw
++dnl NOTE: old curses is not detected.
++dnl have_curses=[no, ncursesw, ncurses]
++dnl have_panel=[no, panelw, panel]
++have_curses=no
++have_panel=no
++
++AH_TEMPLATE([HAVE_NCURSESW], [Define to 1 if you have the `ncursesw' library.])
++AC_CHECK_HEADERS([curses.h ncurses.h])
++
++AS_VAR_IF([ac_cv_header_ncurses_h], [yes], [
++  if test "$ac_sys_system" != "Darwin"; then
++    dnl On macOS, there is no separate /usr/lib/libncursesw nor libpanelw.
++    PKG_CHECK_MODULES([CURSES], [ncursesw], [
++      have_curses=ncursesw
++    ], [
++      WITH_SAVE_ENV([
++        AC_CHECK_LIB([ncursesw], [initscr], [
++          AC_DEFINE([HAVE_NCURSESW], [1])
++          have_curses=ncursesw
++          CURSES_CFLAGS=${CURSES_CFLAGS-""}
++          CURSES_LIBS=${CURSES_LIBS-"-lncursesw"}
++        ])
++      ])
++    ])
++  fi
++
++  AS_VAR_IF([have_curses], [no], [
++    PKG_CHECK_MODULES([CURSES], [ncurses], [
++      have_curses=ncurses
++    ], [
++      WITH_SAVE_ENV([
++        AC_CHECK_LIB([ncurses], [initscr], [
++          have_curses=ncurses
++          CURSES_CFLAGS=${CURSES_CFLAGS-""}
++          CURSES_LIBS=${CURSES_LIBS-"-lncurses"}
++        ])
++      ])
++    ])
++  ])
++
++])dnl ac_cv_header_ncurses_h = yes
++
++dnl remove _XOPEN_SOURCE macro from curses cflags. pyconfig.h sets
++dnl the macro to 700.
++CURSES_CFLAGS=$(echo $CURSES_CFLAGS | sed 's/-D_XOPEN_SOURCE=600//')
++
++if test "$have_curses" = no -a "$ac_sys_system" = "Darwin"; then
++  dnl On macOS, there is no separate /usr/lib/libncursesw nor libpanelw.
++  dnl If we are here, we found a locally-supplied version of libncursesw.
++  dnl There should also be a libpanelw.
++  dnl _XOPEN_SOURCE defines are usually excluded for macOS, but we need
++  dnl _XOPEN_SOURCE_EXTENDED here for ncurses wide char support.
++
++  AS_VAR_APPEND([CURSES_CFLAGS], [" -D_XOPEN_SOURCE_EXTENDED=1"])
++  AC_DEFINE([HAVE_NCURSESW], [1])
++fi
++
++dnl TODO: detect "curses" and special cases tinfo, terminfo, or termcap
++
++AC_MSG_CHECKING([curses module flags])
++AS_VAR_IF([have_curses], [no], [
++  AC_MSG_RESULT([no])  
++], [
++  AC_MSG_RESULT([$have_curses (CFLAGS: $CURSES_CFLAGS, LIBS: $CURSES_LIBS)])
++])
++
++dnl check for ncurses' panel/panelw library
++AC_CHECK_HEADERS([panel.h])
++
++AS_VAR_IF([ac_cv_header_panel_h], [yes], [
++
++  if test "$ac_sys_system" != "Darwin"; then
++    dnl On macOS, there is no separate /usr/lib/libncursesw nor libpanelw.
++    AS_VAR_IF([have_curses], [ncursesw], [
++      PKG_CHECK_MODULES([PANEL], [panelw], [
++        have_panel=panelw
++      ], [
++        WITH_SAVE_ENV([
++          AC_CHECK_LIB([panelw], [update_panels], [
++            have_panel=panelw
++            PANEL_CFLAGS=${PANEL_CFLAGS-""}
++            PANEL_LIBS=${PANEL_LIBS-"-lpanelw"}
++          ])
++        ])
++      ])
++    ])
++  fi
++
++  AS_VAR_IF([have_curses], [ncurses], [
++    PKG_CHECK_MODULES([PANEL], [panel], [
++      have_panel=panel
++    ], [
++      WITH_SAVE_ENV([
++        AC_CHECK_LIB([panel], [update_panels], [
++          have_panel=panel
++          PANEL_CFLAGS=${PANEL_CFLAGS-""}
++          PANEL_LIBS=${PANEL_LIBS-"-lpanel"}
++        ])
++      ])
++    ])
++  ])
++
++])dnl ac_cv_header_panel_h = yes
++
++AC_MSG_CHECKING([panel flags])
++AS_VAR_IF([have_panel], [no], [
++  AC_MSG_RESULT([no])  
++], [
++  AC_MSG_RESULT([$have_panel (CFLAGS: $PANEL_CFLAGS, LIBS: $PANEL_LIBS)])
++])
++
+ # first curses header check
+ ac_save_cppflags="$CPPFLAGS"
+ if test "$cross_compiling" = no; then
+   CPPFLAGS="$CPPFLAGS -I/usr/include/ncursesw"
+ fi
+ 
+-AC_CHECK_HEADERS(curses.h ncurses.h)
+-
+ # On Solaris, term.h requires curses.h
+ AC_CHECK_HEADERS(term.h,,,[
+ #ifdef HAVE_CURSES_H
+@@ -6985,8 +7137,14 @@ PY_STDLIB_MOD([_crypt],
+ PY_STDLIB_MOD([_ctypes],
+   [], [test "$have_libffi" = yes],
+   [$LIBFFI_CFLAGS], [$LIBFFI_LIBS])
+-dnl PY_STDLIB_MOD([_curses], [], [], [], [])
+-dnl PY_STDLIB_MOD([_curses_panel], [], [], [], [])
++PY_STDLIB_MOD([_curses],
++  [], [test "$have_curses" != "no"],
++  [$CURSES_CFLAGS], [$CURSES_LIBS]
++)
++PY_STDLIB_MOD([_curses_panel],
++  [], [test "$have_panel" != "no"],
++  [$PANEL_CFLAGS $CURSES_CFLAGS], [$PANEL_LIBS $CURSES_LIBS]
++)
+ PY_STDLIB_MOD([_decimal], [], [], [$LIBMPDEC_CFLAGS], [$LIBMPDEC_LDFLAGS])
+ PY_STDLIB_MOD([_dbm],
+   [test -n "$with_dbmliborder"], [test "$have_dbm" != "no"],
+@@ -6997,7 +7155,9 @@ PY_STDLIB_MOD([_gdbm],
+ PY_STDLIB_MOD([nis],
+   [], [test "$have_nis" = yes -a "$ac_cv_header_rpc_rpc_h" = yes],
+   [$LIBNSL_CFLAGS], [$LIBNSL_LIBS])
+-dnl PY_STDLIB_MOD([readline], [], [], [], [])
++ PY_STDLIB_MOD([readline],
++  [], [test "$with_readline" != "no"],
++  [$READLINE_CFLAGS], [$READLINE_LIBS])
+ PY_STDLIB_MOD([_sqlite3],
+   [test "$have_sqlite3" = "yes"],
+   [test "$have_supported_sqlite3" = "yes"],
+diff --git a/pyconfig.h.in b/pyconfig.h.in
+index b05ddd41c2bba..aa9fc559fa251 100644
+--- a/pyconfig.h.in
++++ b/pyconfig.h.in
+@@ -290,6 +290,9 @@
+ /* Defined when any dynamic module loading is enabled. */
+ #undef HAVE_DYNAMIC_LOADING
+ 
++/* Define to 1 if you have the <editline/readline.h> header file. */
++#undef HAVE_EDITLINE_READLINE_H
++
+ /* Define to 1 if you have the <endian.h> header file. */
+ #undef HAVE_ENDIAN_H
+ 
+@@ -646,9 +649,6 @@
+ /* Define to 1 if you have the <libintl.h> header file. */
+ #undef HAVE_LIBINTL_H
+ 
+-/* Define to build the readline module. */
+-#undef HAVE_LIBREADLINE
+-
+ /* Define to 1 if you have the `resolv' library (-lresolv). */
+ #undef HAVE_LIBRESOLV
+ 
+@@ -784,6 +784,9 @@
+ /* Define to 1 if you have the `nanosleep' function. */
+ #undef HAVE_NANOSLEEP
+ 
++/* Define to 1 if you have the `ncursesw' library. */
++#undef HAVE_NCURSESW
++
+ /* Define to 1 if you have the <ncurses.h> header file. */
+ #undef HAVE_NCURSES_H
+ 
+@@ -821,6 +824,9 @@
+ /* Define to 1 if you have the `openpty' function. */
+ #undef HAVE_OPENPTY
+ 
++/* Define to 1 if you have the <panel.h> header file. */
++#undef HAVE_PANEL_H
++
+ /* Define to 1 if you have the `pathconf' function. */
+ #undef HAVE_PATHCONF
+ 
+@@ -905,6 +911,9 @@
+ /* Define to 1 if you have the `pwritev2' function. */
+ #undef HAVE_PWRITEV2
+ 
++/* Define to 1 if you have the <readline/readline.h> header file. */
++#undef HAVE_READLINE_READLINE_H
++
+ /* Define to 1 if you have the `readlink' function. */
+ #undef HAVE_READLINK
+ 
+@@ -1662,7 +1671,7 @@
+    Dyld is necessary to support frameworks. */
+ #undef WITH_DYLD
+ 
+-/* Define to build the readline module against Editline. */
++/* Define to build the readline module against libedit. */
+ #undef WITH_EDITLINE
+ 
+ /* Define if you want to compile in object freelists optimization */
+diff --git a/setup.py b/setup.py
+index cc11dedee1b2e..2edcb08b4fd7f 100644
+--- a/setup.py
++++ b/setup.py
+@@ -1027,146 +1027,9 @@
+         ))
+ 
+     def detect_readline_curses(self):
+-        # readline
+-        readline_termcap_library = ""
+-        curses_library = ""
+-        # Cannot use os.popen here in py3k.
+-        tmpfile = os.path.join(self.build_temp, 'readline_termcap_lib')
+-        if not os.path.exists(self.build_temp):
+-            os.makedirs(self.build_temp)
+-        # Determine if readline is already linked against curses or tinfo.
+-        if sysconfig.get_config_var('HAVE_LIBREADLINE'):
+-            if sysconfig.get_config_var('WITH_EDITLINE'):
+-                readline_lib = 'edit'
+-            else:
+-                readline_lib = 'readline'
+-            do_readline = self.compiler.find_library_file(self.lib_dirs,
+-                readline_lib)
+-            if CROSS_COMPILING:
+-                ret = run_command("%s -d %s | grep '(NEEDED)' > %s"
+-                                % (sysconfig.get_config_var('READELF'),
+-                                   do_readline, tmpfile))
+-            elif find_executable('ldd'):
+-                ret = run_command("ldd %s > %s" % (do_readline, tmpfile))
+-            else:
+-                ret = 1
+-            if ret == 0:
+-                with open(tmpfile) as fp:
+-                    for ln in fp:
+-                        if 'curses' in ln:
+-                            readline_termcap_library = re.sub(
+-                                r'.*lib(n?cursesw?)\.so.*', r'\1', ln
+-                            ).rstrip()
+-                            break
+-                        # termcap interface split out from ncurses
+-                        if 'tinfo' in ln:
+-                            readline_termcap_library = 'tinfo'
+-                            break
+-            if os.path.exists(tmpfile):
+-                os.unlink(tmpfile)
+-        else:
+-            do_readline = False
+-        # Issue 7384: If readline is already linked against curses,
+-        # use the same library for the readline and curses modules.
+-        if 'curses' in readline_termcap_library:
+-            curses_library = readline_termcap_library
+-        elif self.compiler.find_library_file(self.lib_dirs, 'ncursesw'):
+-            curses_library = 'ncursesw'
+-        # Issue 36210: OSS provided ncurses does not link on AIX
+-        # Use IBM supplied 'curses' for successful build of _curses
+-        elif AIX and self.compiler.find_library_file(self.lib_dirs, 'curses'):
+-            curses_library = 'curses'
+-        elif self.compiler.find_library_file(self.lib_dirs, 'ncurses'):
+-            curses_library = 'ncurses'
+-        elif self.compiler.find_library_file(self.lib_dirs, 'curses'):
+-            curses_library = 'curses'
+-
+-        if MACOS:
+-            os_release = int(os.uname()[2].split('.')[0])
+-            dep_target = sysconfig.get_config_var('MACOSX_DEPLOYMENT_TARGET')
+-            if (dep_target and
+-                    (tuple(int(n) for n in dep_target.split('.')[0:2])
+-                        < (10, 5) ) ):
+-                os_release = 8
+-            if os_release < 9:
+-                # MacOSX 10.4 has a broken readline. Don't try to build
+-                # the readline module unless the user has installed a fixed
+-                # readline package
+-                if find_file('readline/rlconf.h', self.inc_dirs, []) is None:
+-                    do_readline = False
+-        if do_readline:
+-            readline_libs = [readline_lib]
+-            if readline_termcap_library:
+-                pass # Issue 7384: Already linked against curses or tinfo.
+-            elif curses_library:
+-                readline_libs.append(curses_library)
+-            elif self.compiler.find_library_file(self.lib_dirs, 'termcap'):
+-                readline_libs.append('termcap')
+-            self.add(Extension('readline', ['readline.c'],
+-                               libraries=readline_libs))
+-        else:
+-            self.missing.append('readline')
+-
+-        # Curses support, requiring the System V version of curses, often
+-        # provided by the ncurses library.
+-        curses_defines = []
+-        curses_includes = []
+-        panel_library = 'panel'
+-        if curses_library == 'ncursesw':
+-            curses_defines.append(('HAVE_NCURSESW', '1'))
+-            if not CROSS_COMPILING:
+-                curses_includes.append('/usr/include/ncursesw')
+-            # Bug 1464056: If _curses.so links with ncursesw,
+-            # _curses_panel.so must link with panelw.
+-            panel_library = 'panelw'
+-            if MACOS:
+-                # On OS X, there is no separate /usr/lib/libncursesw nor
+-                # libpanelw.  If we are here, we found a locally-supplied
+-                # version of libncursesw.  There should also be a
+-                # libpanelw.  _XOPEN_SOURCE defines are usually excluded
+-                # for OS X but we need _XOPEN_SOURCE_EXTENDED here for
+-                # ncurses wide char support
+-                curses_defines.append(('_XOPEN_SOURCE_EXTENDED', '1'))
+-        elif MACOS and curses_library == 'ncurses':
+-            # Building with the system-suppied combined libncurses/libpanel
+-            curses_defines.append(('HAVE_NCURSESW', '1'))
+-            curses_defines.append(('_XOPEN_SOURCE_EXTENDED', '1'))
+-
+-        curses_enabled = True
+-        if curses_library.startswith('ncurses'):
+-            curses_libs = [curses_library]
+-            self.add(Extension('_curses', ['_cursesmodule.c'],
+-                               include_dirs=curses_includes,
+-                               define_macros=curses_defines,
+-                               libraries=curses_libs))
+-        elif curses_library == 'curses' and not MACOS:
+-                # OSX has an old Berkeley curses, not good enough for
+-                # the _curses module.
+-            if (self.compiler.find_library_file(self.lib_dirs, 'terminfo')):
+-                curses_libs = ['curses', 'terminfo']
+-            elif (self.compiler.find_library_file(self.lib_dirs, 'termcap')):
+-                curses_libs = ['curses', 'termcap']
+-            else:
+-                curses_libs = ['curses']
+-
+-            self.add(Extension('_curses', ['_cursesmodule.c'],
+-                               define_macros=curses_defines,
+-                               libraries=curses_libs))
+-        else:
+-            curses_enabled = False
+-            self.missing.append('_curses')
+-
+-        # If the curses module is enabled, check for the panel module
+-        # _curses_panel needs some form of ncurses
+-        skip_curses_panel = True if AIX else False
+-        if (curses_enabled and not skip_curses_panel and
+-                self.compiler.find_library_file(self.lib_dirs, panel_library)):
+-            self.add(Extension('_curses_panel', ['_curses_panel.c'],
+-                           include_dirs=curses_includes,
+-                           define_macros=curses_defines,
+-                           libraries=[panel_library, *curses_libs]))
+-        elif not skip_curses_panel:
+-            self.missing.append('_curses_panel')
++        self.addext(Extension('readline', ['readline.c']))
++        self.addext(Extension('_curses', ['_cursesmodule.c']))
++        self.addext(Extension('_curses_panel', ['_curses_panel.c']))
+ 
+     def detect_crypt(self):
+         self.addext(Extension('_crypt', ['_cryptmodule.c']))
diff --git a/package/python3/0024-Add-an-option-to-disable-the-readline-module.patch b/package/python3/0024-Add-an-option-to-disable-the-readline-module.patch
deleted file mode 100644
index 9250007dae..0000000000
--- a/package/python3/0024-Add-an-option-to-disable-the-readline-module.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 9082468ca620db77b670ccf568a96bbabb865f80 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 7 Mar 2017 23:29:05 +0100
-Subject: [PATCH] Add an option to disable the readline module
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 42fe6c8f5a..19875d7d30 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4225,6 +4225,12 @@ AC_ARG_ENABLE(openssl,
- 	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ssl _ssl _hashlib"
- 	  fi])
- 
-+AC_ARG_ENABLE(readline,
-+	AS_HELP_STRING([--disable-readline], [disable readline]),
-+	[ if test "$enableval" = "no"; then
-+	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} readline"
-+	  fi])
-+
- AC_SUBST(TK)
- AC_ARG_ENABLE(tk,
- 	AS_HELP_STRING([--disable-tk], [disable tk]),
--- 
-2.34.1
-
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 555afdab4f..3843131662 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -22,7 +22,6 @@ HOST_PYTHON3_CONF_OPTS += \
 	--disable-sqlite3 \
 	--disable-tk \
 	--with-expat=system \
-	--disable-curses \
 	--disable-codecs-cjk \
 	--disable-nis \
 	--enable-unicodedata \
@@ -37,6 +36,8 @@ HOST_PYTHON3_CONF_OPTS += \
 # communicate over the network during the build.
 HOST_PYTHON3_CONF_ENV += \
 	LDFLAGS="$(HOST_LDFLAGS) -Wl,--enable-new-dtags" \
+	py_cv_module__curses=n/a \
+	py_cv_module__curses_panel=n/a \
 	py_cv_module__uuid=n/a \
 	ac_cv_prog_HAS_HG=/bin/false
 
@@ -76,15 +77,18 @@ PYTHON3_CONF_ENV += py_cv_module__dbm=n/a
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_READLINE),y)
+PYTHON3_CONF_OPTS += --with-readline
 PYTHON3_DEPENDENCIES += readline
 else
-PYTHON3_CONF_OPTS += --disable-readline
+PYTHON3_CONF_OPTS += --without-readline
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_CURSES),y)
 PYTHON3_DEPENDENCIES += ncurses
 else
-PYTHON3_CONF_OPTS += --disable-curses
+PYTHON3_CONF_ENV += \
+	py_cv_module__curses=n/a \
+	py_cv_module__curses_panel=n/a
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3_DECIMAL),y)
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
