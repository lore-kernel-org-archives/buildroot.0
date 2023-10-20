Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2F6CDB474
	for <buildroot@archiver.kernel.org>; Fri, 20 Oct 2023 12:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0F6E60BAA;
	Fri, 20 Oct 2023 12:22:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0F6E60BAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id orR95_yzMOMl; Fri, 20 Oct 2023 12:22:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 882D770517;
	Fri, 20 Oct 2023 12:22:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 882D770517
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 67F701BF271
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 12:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2632A7051B
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 12:22:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2632A7051B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tob_IS-t0nAe for <buildroot@lists.busybox.net>;
 Fri, 20 Oct 2023 12:22:37 +0000 (UTC)
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9C9B560F48
 for <buildroot@buildroot.org>; Fri, 20 Oct 2023 12:22:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C9B560F48
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-5a7fb84f6ceso8222087b3.1
 for <buildroot@buildroot.org>; Fri, 20 Oct 2023 05:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697804556; x=1698409356;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YDiG8fhTRjwXLMpytCbcQfWnnkj4D3H7oU15HKEL8AU=;
 b=M7nQ+gGr6Amm+3f9Mb6D/bIyEtiq3RRHCIIF2EsnN6RlOdW9FFES/9d5O2LsjovsQN
 Ky4nc75DhdDzkdBj1ZpbuWk+TumVaKi3ZQSPjlg00kkmmvcAw5/RkG8gTev/Fho3/qkc
 AjqvrMgiuCfGsL/5PEn50gD7jGLREPK9dPYq9fuLYvVOC9Zhnx4Z66+eFHAojeRKffHa
 fqVtvJYZoWHvr7FSymXBVQMkDmCAc2++8fwXwa//XqKkIYv7X3KBgEhV0Q2v6XT3+cQ+
 B43uqXfHQJWPOpZAxj0mKKabwA4G6pIau8ucpbWJjv0jqcTJLdRDdk6PCUXyYBGwUCqy
 Z25A==
X-Gm-Message-State: AOJu0YxkIhC6VZwM+ONc4yzn1brf3TCmYKV7IFQPJEXVuC6qd61pk86y
 i5cUkuP0uc1c8ib3EUKxpNafszd9kFwj1M8aBKs=
X-Google-Smtp-Source: AGHT+IEFYsoYaoZek++zAUtNylZdUDDdJBHGf29UfVth98c3G6EsaFd5iFMIRjq7lSw2wLhu6plS65+N55GptWfTbq8=
X-Received: by 2002:a0d:eb4c:0:b0:56d:43cb:da98 with SMTP id
 u73-20020a0deb4c000000b0056d43cbda98mr1769841ywe.29.1697804556335; Fri, 20
 Oct 2023 05:22:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230809211401.3587177-1-bernd@kuhls.net>
 <20230809211401.3587177-2-bernd@kuhls.net>
In-Reply-To: <20230809211401.3587177-2-bernd@kuhls.net>
From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 20 Oct 2023 14:22:25 +0200
Message-ID: <CAFSsvmqwtvpwWBRg60_qtuiGNBzq_J=MG3bkv4mcNeUhh_ONCQ@mail.gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697804556; x=1698409356; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YDiG8fhTRjwXLMpytCbcQfWnnkj4D3H7oU15HKEL8AU=;
 b=HK9Ztw9zFUrVmXw+WSdZaype1fNBLeW+Lllez2z3FdD+I3yR9rejpMoBwPRJFonlim
 zhkHZILjW3xumrWkGcrSvZRVvfrA7wpZoGuRRmaY9oOWKxk5U7ljBbwAwISFeODUWePM
 ZMEYfnX/lOQdK7gANQys+1BYC1nmQMg38cQTmjwBqb/oCy05VhX0UQQ3MIfcfv9jzAfq
 t2+4T/wAUSurAGXsQuN/QUZVd2BOyHQ3+WYGZHGC8CiFAJEpV1aKMm3ZqYodDWwf++ir
 p3ZvIkUm2RmmMurASRWNP/mpGlkqVpkQ4ci9fmb33q7pmx6GbyciXX7c8/veRf2cqdOJ
 YUxw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HK9Ztw9z
Subject: Re: [Buildroot] [PATCH/next v3 01/14] package/python3: use upstream
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2849473781700267050=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2849473781700267050==
Content-Type: multipart/alternative; boundary="0000000000007a8355060824edf7"

--0000000000007a8355060824edf7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bernd;

Thanks for your incredibly talented hard work on this! Removing patches is
always fantastic!

Reviewed-by: Adam Duskett <aduskett@gmail.com>
Tested-by: Adam Duskett <aduskett@gmail.com>

On Wed, Aug 9, 2023 at 11:15=E2=80=AFPM Bernd Kuhls <bernd@kuhls.net> wrote=
:

> Backport patch 0018 from python 3.12 to enhance build system.
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .checkpackageignore                           |   1 -
>  ...18-Port-_dbm-module-to-PY_STDLIB_MOD.patch | 293 ++++++++++++++++++
>  ...ion-to-disable-the-berkeleydb-module.patch |  30 --
>  package/python3/python3.mk                    |   2 +-
>  4 files changed, 294 insertions(+), 32 deletions(-)
>  create mode 100644
> package/python3/0018-Port-_dbm-module-to-PY_STDLIB_MOD.patch
>  delete mode 100644
> package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patch
>
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 0954f22b4b..303eb4ccad 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -1238,7 +1238,6 @@
> package/python3/0026-python-config.sh-don-t-reassign-prefix.patch Upstrea=
m
>  package/python3/0027-Add-an-option-to-disable-uuid-module.patch Upstream
>  package/python3/0028-fix-building-on-older-distributions.patch Upstream
>  package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mu=
s.patch
> Upstream
> -package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patc=
h
> Upstream
>  package/python3/0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encrypti=
o.patch
> Upstream
>  package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch
> Upstream
>  package/qemu/0002-softmmu-qemu-seccomp.c-add-missing-header-for-CLONE_.p=
atch
> Upstream
> diff --git a/package/python3/0018-Port-_dbm-module-to-PY_STDLIB_MOD.patch
> b/package/python3/0018-Port-_dbm-module-to-PY_STDLIB_MOD.patch
> new file mode 100644
> index 0000000000..92d2594eef
> --- /dev/null
> +++ b/package/python3/0018-Port-_dbm-module-to-PY_STDLIB_MOD.patch
> @@ -0,0 +1,293 @@
> +From ec5e253556875640b1ac514e85c545346ac3f1e0 Mon Sep 17 00:00:00 2001
> +From: Christian Heimes <christian@python.org>
> +Date: Fri, 1 Jul 2022 21:48:38 +0200
> +Subject: [PATCH] gh-90005: Port _dbm module to PY_STDLIB_MOD (GH-94433)
> +
> +Upstream:
> https://github.com/python/cpython/commit/ec5e253556875640b1ac514e85c54534=
6ac3f1e0
> +
> +[Bernd: backported to 3.11.4]
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + ...2-06-30-09-57-39.gh-issue-90005.9-pQyR.rst |   1 +
> + Modules/Setup.stdlib.in                       |   2 +-
> + configure                                     | 295 ++++++++++++------
> + configure.ac                                  | 100 ++++--
> + pyconfig.h.in                                 |   6 -
> + setup.py                                      |  72 +----
> + 6 files changed, 278 insertions(+), 198 deletions(-)
> + create mode 100644
> Misc/NEWS.d/next/Build/2022-06-30-09-57-39.gh-issue-90005.9-pQyR.rst
> +
> +diff --git
> a/Misc/NEWS.d/next/Build/2022-06-30-09-57-39.gh-issue-90005.9-pQyR.rst
> b/Misc/NEWS.d/next/Build/2022-06-30-09-57-39.gh-issue-90005.9-pQyR.rst
> +new file mode 100644
> +index 0000000000000..9b14f767847da
> +--- /dev/null
> ++++ b/Misc/NEWS.d/next/Build/2022-06-30-09-57-39.gh-issue-90005.9-pQyR.r=
st
> +@@ -0,0 +1 @@
> ++``_dbm`` module dependencies are now detected by configure.
> +diff --git a/Modules/Setup.stdlib.in b/Modules/Setup.stdlib.in
> +index a199aefc51011..ad34f85e25451 100644
> +--- a/Modules/Setup.stdlib.in
> ++++ b/Modules/Setup.stdlib.in
> +@@ -68,7 +68,7 @@
> +
> + # dbm/gdbm
> + # dbm needs either libndbm, libgdbm_compat, or libdb 5.x
> +-#@MODULE__DBM_TRUE@_dbm _dbmmodule.c
> ++@MODULE__DBM_TRUE@_dbm _dbmmodule.c
> + # gdbm module needs -lgdbm
> + @MODULE__GDBM_TRUE@_gdbm _gdbmmodule.c
> +
> +diff --git a/configure.ac b/configure.ac
> +index 12ae2ae8d87eb..b03ead3bdefa0 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -3956,17 +3956,30 @@ WITH_SAVE_ENV([
> +   ], [have_gdbm=3Dno])
> + ])
> +
> +-# check for _dbmmodule.c dependencies
> ++dnl check for _dbmmodule.c dependencies
> ++dnl ndbm, gdbm_compat, libdb
> + AC_CHECK_HEADERS([ndbm.h], [
> +-  LIBS_SAVE=3D"$LIBS"
> +-  AC_CHECK_LIB([ndbm], [dbm_open])
> +-  LIBS=3D"$LIBS_SAVE"
> +-  AC_CHECK_LIB([gdbm_compat], [dbm_open])
> +-  LIBS=3D"$LIBS_SAVE"
> ++  WITH_SAVE_ENV([
> ++    AC_SEARCH_LIBS([dbm_open], [ndbm gdbm_compat])
> ++  ])
> + ])
> +
> +-# "gdbm-ndbm.h" and "gdbm/ndbm.h" are both normalized to "gdbm_ndbm_h"
> +-# unset ac_cv_header_gdbm_ndbm_h to prevent false positive cache hits.
> ++AC_MSG_CHECKING([for ndbm presence and linker args])
> ++AS_CASE([$ac_cv_search_dbm_open],
> ++  [*ndbm*|*gdbm_compat*], [
> ++    dbm_ndbm=3D"$ac_cv_search_dbm_open"
> ++    have_ndbm=3Dyes
> ++  ],
> ++  [none*], [
> ++    dbm_ndbm=3D""
> ++    have_ndbm=3Dyes
> ++  ],
> ++  [no], [have_ndbm=3Dno]
> ++)
> ++AC_MSG_RESULT([$have_ndbm ($dbm_ndbm)])
> ++
> ++dnl "gdbm-ndbm.h" and "gdbm/ndbm.h" are both normalized to "gdbm_ndbm_h=
"
> ++dnl unset ac_cv_header_gdbm_ndbm_h to prevent false positive cache hits=
.
> + AS_UNSET([ac_cv_header_gdbm_ndbm_h])
> + AC_CACHE_VAL([ac_cv_header_gdbm_slash_ndbm_h], [
> +   AC_CHECK_HEADER(
> +@@ -3991,26 +4004,26 @@ AS_VAR_IF([ac_cv_header_gdbm_dash_ndbm_h], [yes]=
,
> [
> + AS_UNSET([ac_cv_header_gdbm_ndbm_h])
> +
> + if test "$ac_cv_header_gdbm_slash_ndbm_h" =3D yes -o
> "$ac_cv_header_gdbm_dash_ndbm_h" =3D yes; then
> +-  LIBS_SAVE=3D"$LIBS"
> +-  AC_CHECK_LIB([gdbm_compat], [dbm_open])
> +-  LIBS=3D"$LIBS_SAVE"
> ++  WITH_SAVE_ENV([
> ++    AC_SEARCH_LIBS([dbm_open], [gdbm_compat])
> ++  ])
> + fi
> +
> + # Check for libdb >=3D 5 with dbm_open()
> + # db.h re-defines the name of the function
> + AC_CHECK_HEADERS([db.h], [
> +   AC_CACHE_CHECK([for libdb], [ac_cv_have_libdb], [
> +-    LIBS_SAVE=3D"$LIBS"
> +-    LIBS=3D"$LIBS -ldb"
> +-    AC_LINK_IFELSE([AC_LANG_PROGRAM([
> +-      #define DB_DBM_HSEARCH 1
> +-      #include <db.h>
> +-      #if DB_VERSION_MAJOR < 5
> +-        #error "dh.h: DB_VERSION_MAJOR < 5 is not supported."
> +-      #endif
> +-      ], [DBM *dbm =3D dbm_open(NULL, 0, 0)])
> +-    ], [ac_cv_have_libdb=3Dyes], [ac_cv_have_libdb=3Dno])
> +-    LIBS=3D"$LIBS_SAVE"
> ++    WITH_SAVE_ENV([
> ++      LIBS=3D"$LIBS -ldb"
> ++      AC_LINK_IFELSE([AC_LANG_PROGRAM([
> ++        #define DB_DBM_HSEARCH 1
> ++        #include <db.h>
> ++        #if DB_VERSION_MAJOR < 5
> ++          #error "dh.h: DB_VERSION_MAJOR < 5 is not supported."
> ++        #endif
> ++        ], [DBM *dbm =3D dbm_open(NULL, 0, 0)])
> ++      ], [ac_cv_have_libdb=3Dyes], [ac_cv_have_libdb=3Dno])
> ++    ])
> +   ])
> +   AS_VAR_IF([ac_cv_have_libdb], [yes], [
> +     AC_DEFINE([HAVE_LIBDB], [1], [Define to 1 if you have the `db'
> library (-ldb).])
> +@@ -4018,7 +4031,7 @@ AC_CHECK_HEADERS([db.h], [
> + ])
> +
> + # Check for --with-dbmliborder
> +-AC_MSG_CHECKING(for --with-dbmliborder)
> ++AC_MSG_CHECKING([for --with-dbmliborder])
> + AC_ARG_WITH(dbmliborder,
> +             AS_HELP_STRING([--with-dbmliborder=3Ddb1:db2:...], [overrid=
e
> order to check db backends for dbm; a valid value is a colon separated
> string with the backend names `ndbm', `gdbm' and `bdb'.]),
> + [], [with_dbmliborder=3Dgdbm:ndbm:bdb])
> +@@ -4038,7 +4051,42 @@ IFS=3D$as_save_IFS
> + AS_VAR_IF([with_dbmliborder], [error], [
> +   AC_MSG_ERROR([proper usage is --with-dbmliborder=3Ddb1:db2:...
> (gdbm:ndbm:bdb)])
> + ])
> +-AC_MSG_RESULT($with_dbmliborder)
> ++AC_MSG_RESULT([$with_dbmliborder])
> ++
> ++AC_MSG_CHECKING([for _dbm module CFLAGS and LIBS])
> ++have_dbm=3Dno
> ++as_save_IFS=3D$IFS
> ++IFS=3D:
> ++for db in $with_dbmliborder; do
> ++  case "$db" in
> ++    ndbm)
> ++      if test "$have_ndbm" =3D yes; then
> ++        DBM_CFLAGS=3D"-DUSE_NDBM"
> ++        DBM_LIBS=3D"$dbm_ndbm"
> ++        have_dbm=3Dyes
> ++        break
> ++      fi
> ++      ;;
> ++    gdbm)
> ++      if test "$have_gdbm_compat" =3D yes; then
> ++        DBM_CFLAGS=3D"-DUSE_GDBM_COMPAT"
> ++        DBM_LIBS=3D"-lgdbm_compat"
> ++        have_dbm=3Dyes
> ++        break
> ++      fi
> ++      ;;
> ++    bdb)
> ++      if test "$ac_cv_have_libdb" =3D yes; then
> ++        DBM_CFLAGS=3D"-DUSE_BERKDB"
> ++        DBM_LIBS=3D"-ldb"
> ++        have_dbm=3Dyes
> ++        break
> ++      fi
> ++     ;;
> ++  esac
> ++done
> ++IFS=3D$as_save_IFS
> ++AC_MSG_RESULT([$DBM_CFLAGS $DBM_LIBS])
> +
> + # Templates for things AC_DEFINEd more than once.
> + # For a single AC_DEFINE, no template is needed.
> +@@ -6940,7 +6988,9 @@ PY_STDLIB_MOD([_ctypes],
> + dnl PY_STDLIB_MOD([_curses], [], [], [], [])
> + dnl PY_STDLIB_MOD([_curses_panel], [], [], [], [])
> + PY_STDLIB_MOD([_decimal], [], [], [$LIBMPDEC_CFLAGS],
> [$LIBMPDEC_LDFLAGS])
> +-dnl PY_STDLIB_MOD([_dbm], [], [], [], [])
> ++PY_STDLIB_MOD([_dbm],
> ++  [test -n "$with_dbmliborder"], [test "$have_dbm" !=3D "no"],
> ++  [$DBM_CFLAGS], [$DBM_LIBS])
> + PY_STDLIB_MOD([_gdbm],
> +   [test "$have_gdbm_dbmliborder" =3D yes], [test "$have_gdbm" =3D yes],
> +   [$GDBM_CFLAGS], [$GDBM_LIBS])
> +diff --git a/pyconfig.h.in b/pyconfig.h.in
> +index 15933e75b1b07..b05ddd41c2bba 100644
> +--- a/pyconfig.h.in
> ++++ b/pyconfig.h.in
> +@@ -640,18 +640,12 @@
> + /* Define to 1 if you have the `dld' library (-ldld). */
> + #undef HAVE_LIBDLD
> +
> +-/* Define to 1 if you have the `gdbm_compat' library (-lgdbm_compat). *=
/
> +-#undef HAVE_LIBGDBM_COMPAT
> +-
> + /* Define to 1 if you have the `ieee' library (-lieee). */
> + #undef HAVE_LIBIEEE
> +
> + /* Define to 1 if you have the <libintl.h> header file. */
> + #undef HAVE_LIBINTL_H
> +
> +-/* Define to 1 if you have the `ndbm' library (-lndbm). */
> +-#undef HAVE_LIBNDBM
> +-
> + /* Define to build the readline module. */
> + #undef HAVE_LIBREADLINE
> +
> +diff --git a/setup.py b/setup.py
> +index 843ec35effe10..cc11dedee1b2e 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -1163,77 +1163,7 @@ def detect_crypt(self):
> +         self.addext(Extension('_crypt', ['_cryptmodule.c']))
> +
> +     def detect_dbm_gdbm(self):
> +-        # Modules that provide persistent dictionary-like semantics.
> You will
> +-        # probably want to arrange for at least one of them to be
> available on
> +-        # your machine, though none are defined by default because of
> library
> +-        # dependencies.  The Python module dbm/__init__.py provides an
> +-        # implementation independent wrapper for these; dbm/dumb.py
> provides
> +-        # similar functionality (but slower of course) implemented in
> Python.
> +-
> +-        dbm_setup_debug =3D False   # verbose debug prints from this
> script?
> +-        dbm_order =3D ['gdbm']
> +-
> +-        # libdb, gdbm and ndbm headers and libraries
> +-        have_ndbm_h =3D sysconfig.get_config_var("HAVE_NDBM_H")
> +-        have_gdbm_ndbm_h =3D sysconfig.get_config_var("HAVE_GDBM_NDBM_H=
")
> +-        have_gdbm_dash_ndbm_h =3D
> sysconfig.get_config_var("HAVE_GDBM_DASH_NDBM_H")
> +-        have_libndbm =3D sysconfig.get_config_var("HAVE_LIBNDBM")
> +-        have_libgdbm_compat =3D
> sysconfig.get_config_var("HAVE_LIBGDBM_COMPAT")
> +-        have_libdb =3D sysconfig.get_config_var("HAVE_LIBDB")
> +-
> +-        # The standard Unix dbm module:
> +-        if not CYGWIN:
> +-            config_args =3D [arg.strip("'")
> +-                           for arg in
> sysconfig.get_config_var("CONFIG_ARGS").split()]
> +-            dbm_args =3D [arg for arg in config_args
> +-                        if arg.startswith('--with-dbmliborder=3D')]
> +-            if dbm_args:
> +-                dbm_order =3D [arg.split('=3D')[-1] for arg in
> dbm_args][-1].split(":")
> +-            else:
> +-                dbm_order =3D "gdbm:ndbm:bdb".split(":")
> +-            dbmext =3D None
> +-            for cand in dbm_order:
> +-                if cand =3D=3D "ndbm":
> +-                    if have_ndbm_h:
> +-                        # Some systems have -lndbm, others have
> -lgdbm_compat,
> +-                        # others don't have either
> +-                        if have_libndbm:
> +-                            ndbm_libs =3D ['ndbm']
> +-                        elif have_libgdbm_compat:
> +-                            ndbm_libs =3D ['gdbm_compat']
> +-                        else:
> +-                            ndbm_libs =3D []
> +-                        if dbm_setup_debug: print("building dbm using
> ndbm")
> +-                        dbmext =3D Extension(
> +-                            '_dbm', ['_dbmmodule.c'],
> +-                            define_macros=3D[('USE_NDBM', None)],
> +-                            libraries=3Dndbm_libs
> +-                        )
> +-                        break
> +-                elif cand =3D=3D "gdbm":
> +-                    # dbm_open() is provided by libgdbm_compat, which
> wraps libgdbm
> +-                    if have_libgdbm_compat and (have_gdbm_ndbm_h or
> have_gdbm_dash_ndbm_h):
> +-                        if dbm_setup_debug: print("building dbm using
> gdbm")
> +-                        dbmext =3D Extension(
> +-                            '_dbm', ['_dbmmodule.c'],
> +-                            define_macros=3D[('USE_GDBM_COMPAT', None)]=
,
> +-                            libraries=3D['gdbm_compat']
> +-                        )
> +-                        break
> +-                elif cand =3D=3D "bdb":
> +-                    if have_libdb:
> +-                        if dbm_setup_debug: print("building dbm using
> bdb")
> +-                        dbmext =3D Extension(
> +-                            '_dbm', ['_dbmmodule.c'],
> +-                            define_macros=3D[('USE_BERKDB', None)],
> +-                            libraries=3D['db']
> +-                        )
> +-                        break
> +-            if dbmext is not None:
> +-                self.add(dbmext)
> +-            else:
> +-                self.missing.append('_dbm')
> +-
> ++        self.addext(Extension('_dbm', ['_dbmmodule.c']))
> +         # Anthony Baxter's gdbm module.  GNU dbm(3) will require -lgdbm=
:
> +         self.addext(Extension('_gdbm', ['_gdbmmodule.c']))
> +
> diff --git
> a/package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.pat=
ch
> b/package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.pat=
ch
> deleted file mode 100644
> index 5fb436db59..0000000000
> ---
> a/package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.pat=
ch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 67e9793d070ac5c8e83abbe95b9208533ffeadd0 Mon Sep 17 00:00:00 2001
> -From: Bernd Kuhls <bernd.kuhls@t-online.de>
> -Date: Sat, 11 Apr 2020 22:01:40 +0200
> -Subject: [PATCH] Add an option to disable the berkeleydb module
> -
> -Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ----
> - configure.ac | 6 ++++++
> - 1 file changed, 6 insertions(+)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 841fd6732c..06c9a81f95 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -4280,6 +4280,12 @@ if test "$UUID" =3D "no"; then
> -    DISABLED_EXTENSIONS=3D"${DISABLED_EXTENSIONS} _uuid"
> - fi
> -
> -+AC_ARG_ENABLE(berkeleydb,
> -+      AS_HELP_STRING([--disable-berkeleydb], [disable berkeleydb]),
> -+      [ if test "$enableval" =3D "no"; then
> -+           DISABLED_EXTENSIONS=3D"${DISABLED_EXTENSIONS} _dbm"
> -+        fi])
> -+
> - AC_SUBST(PYDOC)
> -
> - AC_ARG_ENABLE(pydoc,
> ---
> -2.34.1
> -
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index bdb7cfd22f..494c66c0b1 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -75,7 +75,7 @@ endif
>  ifeq ($(BR2_PACKAGE_PYTHON3_BERKELEYDB),y)
>  PYTHON3_DEPENDENCIES +=3D berkeleydb
>  else
> -PYTHON3_CONF_OPTS +=3D --disable-berkeleydb
> +PYTHON3_CONF_ENV +=3D py_cv_module__dbm=3Dn/a
>  endif
>
>  ifeq ($(BR2_PACKAGE_PYTHON3_READLINE),y)
> --
> 2.39.2
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--0000000000007a8355060824edf7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Bernd;<div><br></div><div>Thanks for your incredibly talen=
ted hard work on this! Removing patches is always fantastic!</div><div><br>=
</div><div>Reviewed-by: Adam Duskett &lt;<a href=3D"mailto:aduskett@gmail.c=
om" target=3D"_blank">aduskett@gmail.com</a>&gt;</div><div>Tested-by: Adam =
Duskett &lt;<a href=3D"mailto:aduskett@gmail.com" target=3D"_blank">adusket=
t@gmail.com</a>&gt;=C2=A0</div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Wed, Aug 9, 2023 at 11:15=E2=80=AFPM Bern=
d Kuhls &lt;<a href=3D"mailto:bernd@kuhls.net">bernd@kuhls.net</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Backport patc=
h 0018 from python 3.12 to enhance build system.<br>
<br>
Signed-off-by: Bernd Kuhls &lt;<a href=3D"mailto:bernd@kuhls.net" target=3D=
"_blank">bernd@kuhls.net</a>&gt;<br>
---<br>
=C2=A0.checkpackageignore=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 -<br>
=C2=A0...18-Port-_dbm-module-to-PY_STDLIB_MOD.patch | 293 +++++++++++++++++=
+<br>
=C2=A0...ion-to-disable-the-berkeleydb-module.patch |=C2=A0 30 --<br>
=C2=A0package/python3/<a href=3D"http://python3.mk" rel=3D"noreferrer" targ=
et=3D"_blank">python3.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A04 files changed, 294 insertions(+), 32 deletions(-)<br>
=C2=A0create mode 100644 package/python3/0018-Port-_dbm-module-to-PY_STDLIB=
_MOD.patch<br>
=C2=A0delete mode 100644 package/python3/0030-Add-an-option-to-disable-the-=
berkeleydb-module.patch<br>
<br>
diff --git a/.checkpackageignore b/.checkpackageignore<br>
index 0954f22b4b..303eb4ccad 100644<br>
--- a/.checkpackageignore<br>
+++ b/.checkpackageignore<br>
@@ -1238,7 +1238,6 @@ package/python3/0026-python-config.sh-don-t-reassign-=
prefix.patch Upstream<br>
=C2=A0package/python3/0027-Add-an-option-to-disable-uuid-module.patch Upstr=
eam<br>
=C2=A0package/python3/0028-fix-building-on-older-distributions.patch Upstre=
am<br>
=C2=A0package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for=
-mus.patch Upstream<br>
-package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patch =
Upstream<br>
=C2=A0package/python3/0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encry=
ptio.patch Upstream<br>
=C2=A0package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch Up=
stream<br>
=C2=A0package/qemu/0002-softmmu-qemu-seccomp.c-add-missing-header-for-CLONE=
_.patch Upstream<br>
diff --git a/package/python3/0018-Port-_dbm-module-to-PY_STDLIB_MOD.patch b=
/package/python3/0018-Port-_dbm-module-to-PY_STDLIB_MOD.patch<br>
new file mode 100644<br>
index 0000000000..92d2594eef<br>
--- /dev/null<br>
+++ b/package/python3/0018-Port-_dbm-module-to-PY_STDLIB_MOD.patch<br>
@@ -0,0 +1,293 @@<br>
+From ec5e253556875640b1ac514e85c545346ac3f1e0 Mon Sep 17 00:00:00 2001<br>
+From: Christian Heimes &lt;<a href=3D"mailto:christian@python.org" target=
=3D"_blank">christian@python.org</a>&gt;<br>
+Date: Fri, 1 Jul 2022 21:48:38 +0200<br>
+Subject: [PATCH] gh-90005: Port _dbm module to PY_STDLIB_MOD (GH-94433)<br=
>
+<br>
+Upstream: <a href=3D"https://github.com/python/cpython/commit/ec5e25355687=
5640b1ac514e85c545346ac3f1e0" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/python/cpython/commit/ec5e253556875640b1ac514e85c545346ac3f1e0</=
a><br>
+<br>
+[Bernd: backported to 3.11.4]<br>
+Signed-off-by: Bernd Kuhls &lt;<a href=3D"mailto:bernd@kuhls.net" target=
=3D"_blank">bernd@kuhls.net</a>&gt;<br>
+---<br>
+ ...2-06-30-09-57-39.gh-issue-90005.9-pQyR.rst |=C2=A0 =C2=A01 +<br>
+ Modules/<a href=3D"http://Setup.stdlib.in" rel=3D"noreferrer" target=3D"_=
blank">Setup.stdlib.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
+ configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 295 =
++++++++++++------<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 100 ++++--<br>
+ <a href=3D"http://pyconfig.h.in" rel=3D"noreferrer" target=3D"_blank">pyc=
onfig.h.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 =
-<br>
+ setup.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 72 +----<br>
+ 6 files changed, 278 insertions(+), 198 deletions(-)<br>
+ create mode 100644 Misc/NEWS.d/next/Build/2022-06-30-09-57-39.gh-issue-90=
005.9-pQyR.rst<br>
+<br>
+diff --git a/Misc/NEWS.d/next/Build/2022-06-30-09-57-39.gh-issue-90005.9-p=
QyR.rst b/Misc/NEWS.d/next/Build/2022-06-30-09-57-39.gh-issue-90005.9-pQyR.=
rst<br>
+new file mode 100644<br>
+index 0000000000000..9b14f767847da<br>
+--- /dev/null<br>
++++ b/Misc/NEWS.d/next/Build/2022-06-30-09-57-39.gh-issue-90005.9-pQyR.rst=
<br>
+@@ -0,0 +1 @@<br>
++``_dbm`` module dependencies are now detected by configure.<br>
+diff --git a/Modules/<a href=3D"http://Setup.stdlib.in" rel=3D"noreferrer"=
 target=3D"_blank">Setup.stdlib.in</a> b/Modules/<a href=3D"http://Setup.st=
dlib.in" rel=3D"noreferrer" target=3D"_blank">Setup.stdlib.in</a><br>
+index a199aefc51011..ad34f85e25451 100644<br>
+--- a/Modules/<a href=3D"http://Setup.stdlib.in" rel=3D"noreferrer" target=
=3D"_blank">Setup.stdlib.in</a><br>
++++ b/Modules/<a href=3D"http://Setup.stdlib.in" rel=3D"noreferrer" target=
=3D"_blank">Setup.stdlib.in</a><br>
+@@ -68,7 +68,7 @@<br>
+ <br>
+ # dbm/gdbm<br>
+ # dbm needs either libndbm, libgdbm_compat, or libdb 5.x<br>
+-#@MODULE__DBM_TRUE@_dbm _dbmmodule.c<br>
++@MODULE__DBM_TRUE@_dbm _dbmmodule.c<br>
+ # gdbm module needs -lgdbm<br>
+ @MODULE__GDBM_TRUE@_gdbm _gdbmmodule.c<br>
+ <br>
+diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
+index 12ae2ae8d87eb..b03ead3bdefa0 100644<br>
+--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
+@@ -3956,17 +3956,30 @@ WITH_SAVE_ENV([<br>
+=C2=A0 =C2=A0], [have_gdbm=3Dno])<br>
+ ])<br>
+ <br>
+-# check for _dbmmodule.c dependencies<br>
++dnl check for _dbmmodule.c dependencies<br>
++dnl ndbm, gdbm_compat, libdb<br>
+ AC_CHECK_HEADERS([ndbm.h], [<br>
+-=C2=A0 LIBS_SAVE=3D&quot;$LIBS&quot;<br>
+-=C2=A0 AC_CHECK_LIB([ndbm], [dbm_open])<br>
+-=C2=A0 LIBS=3D&quot;$LIBS_SAVE&quot;<br>
+-=C2=A0 AC_CHECK_LIB([gdbm_compat], [dbm_open])<br>
+-=C2=A0 LIBS=3D&quot;$LIBS_SAVE&quot;<br>
++=C2=A0 WITH_SAVE_ENV([<br>
++=C2=A0 =C2=A0 AC_SEARCH_LIBS([dbm_open], [ndbm gdbm_compat])<br>
++=C2=A0 ])<br>
+ ])<br>
+ <br>
+-# &quot;gdbm-ndbm.h&quot; and &quot;gdbm/ndbm.h&quot; are both normalized=
 to &quot;gdbm_ndbm_h&quot;<br>
+-# unset ac_cv_header_gdbm_ndbm_h to prevent false positive cache hits.<br=
>
++AC_MSG_CHECKING([for ndbm presence and linker args])<br>
++AS_CASE([$ac_cv_search_dbm_open],<br>
++=C2=A0 [*ndbm*|*gdbm_compat*], [<br>
++=C2=A0 =C2=A0 dbm_ndbm=3D&quot;$ac_cv_search_dbm_open&quot;<br>
++=C2=A0 =C2=A0 have_ndbm=3Dyes<br>
++=C2=A0 ],<br>
++=C2=A0 [none*], [<br>
++=C2=A0 =C2=A0 dbm_ndbm=3D&quot;&quot;<br>
++=C2=A0 =C2=A0 have_ndbm=3Dyes<br>
++=C2=A0 ],<br>
++=C2=A0 [no], [have_ndbm=3Dno]<br>
++)<br>
++AC_MSG_RESULT([$have_ndbm ($dbm_ndbm)])<br>
++<br>
++dnl &quot;gdbm-ndbm.h&quot; and &quot;gdbm/ndbm.h&quot; are both normaliz=
ed to &quot;gdbm_ndbm_h&quot;<br>
++dnl unset ac_cv_header_gdbm_ndbm_h to prevent false positive cache hits.<=
br>
+ AS_UNSET([ac_cv_header_gdbm_ndbm_h])<br>
+ AC_CACHE_VAL([ac_cv_header_gdbm_slash_ndbm_h], [<br>
+=C2=A0 =C2=A0AC_CHECK_HEADER(<br>
+@@ -3991,26 +4004,26 @@ AS_VAR_IF([ac_cv_header_gdbm_dash_ndbm_h], [yes], =
[<br>
+ AS_UNSET([ac_cv_header_gdbm_ndbm_h])<br>
+ <br>
+ if test &quot;$ac_cv_header_gdbm_slash_ndbm_h&quot; =3D yes -o &quot;$ac_=
cv_header_gdbm_dash_ndbm_h&quot; =3D yes; then<br>
+-=C2=A0 LIBS_SAVE=3D&quot;$LIBS&quot;<br>
+-=C2=A0 AC_CHECK_LIB([gdbm_compat], [dbm_open])<br>
+-=C2=A0 LIBS=3D&quot;$LIBS_SAVE&quot;<br>
++=C2=A0 WITH_SAVE_ENV([<br>
++=C2=A0 =C2=A0 AC_SEARCH_LIBS([dbm_open], [gdbm_compat])<br>
++=C2=A0 ])<br>
+ fi<br>
+ <br>
+ # Check for libdb &gt;=3D 5 with dbm_open()<br>
+ # db.h re-defines the name of the function<br>
+ AC_CHECK_HEADERS([db.h], [<br>
+=C2=A0 =C2=A0AC_CACHE_CHECK([for libdb], [ac_cv_have_libdb], [<br>
+-=C2=A0 =C2=A0 LIBS_SAVE=3D&quot;$LIBS&quot;<br>
+-=C2=A0 =C2=A0 LIBS=3D&quot;$LIBS -ldb&quot;<br>
+-=C2=A0 =C2=A0 AC_LINK_IFELSE([AC_LANG_PROGRAM([<br>
+-=C2=A0 =C2=A0 =C2=A0 #define DB_DBM_HSEARCH 1<br>
+-=C2=A0 =C2=A0 =C2=A0 #include &lt;db.h&gt;<br>
+-=C2=A0 =C2=A0 =C2=A0 #if DB_VERSION_MAJOR &lt; 5<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 #error &quot;dh.h: DB_VERSION_MAJOR &lt; 5 is=
 not supported.&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 #endif<br>
+-=C2=A0 =C2=A0 =C2=A0 ], [DBM *dbm =3D dbm_open(NULL, 0, 0)])<br>
+-=C2=A0 =C2=A0 ], [ac_cv_have_libdb=3Dyes], [ac_cv_have_libdb=3Dno])<br>
+-=C2=A0 =C2=A0 LIBS=3D&quot;$LIBS_SAVE&quot;<br>
++=C2=A0 =C2=A0 WITH_SAVE_ENV([<br>
++=C2=A0 =C2=A0 =C2=A0 LIBS=3D&quot;$LIBS -ldb&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 AC_LINK_IFELSE([AC_LANG_PROGRAM([<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 #define DB_DBM_HSEARCH 1<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 #include &lt;db.h&gt;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 #if DB_VERSION_MAJOR &lt; 5<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #error &quot;dh.h: DB_VERSION_MAJOR &l=
t; 5 is not supported.&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 #endif<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ], [DBM *dbm =3D dbm_open(NULL, 0, 0)])<br>
++=C2=A0 =C2=A0 =C2=A0 ], [ac_cv_have_libdb=3Dyes], [ac_cv_have_libdb=3Dno]=
)<br>
++=C2=A0 =C2=A0 ])<br>
+=C2=A0 =C2=A0])<br>
+=C2=A0 =C2=A0AS_VAR_IF([ac_cv_have_libdb], [yes], [<br>
+=C2=A0 =C2=A0 =C2=A0AC_DEFINE([HAVE_LIBDB], [1], [Define to 1 if you have =
the `db&#39; library (-ldb).])<br>
+@@ -4018,7 +4031,7 @@ AC_CHECK_HEADERS([db.h], [<br>
+ ])<br>
+ <br>
+ # Check for --with-dbmliborder<br>
+-AC_MSG_CHECKING(for --with-dbmliborder)<br>
++AC_MSG_CHECKING([for --with-dbmliborder])<br>
+ AC_ARG_WITH(dbmliborder,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AS_HELP_STRING([--with-dbm=
liborder=3Ddb1:db2:...], [override order to check db backends for dbm; a va=
lid value is a colon separated string with the backend names `ndbm&#39;, `g=
dbm&#39; and `bdb&#39;.]),<br>
+ [], [with_dbmliborder=3Dgdbm:ndbm:bdb])<br>
+@@ -4038,7 +4051,42 @@ IFS=3D$as_save_IFS<br>
+ AS_VAR_IF([with_dbmliborder], [error], [<br>
+=C2=A0 =C2=A0AC_MSG_ERROR([proper usage is --with-dbmliborder=3Ddb1:db2:..=
. (gdbm:ndbm:bdb)])<br>
+ ])<br>
+-AC_MSG_RESULT($with_dbmliborder)<br>
++AC_MSG_RESULT([$with_dbmliborder])<br>
++<br>
++AC_MSG_CHECKING([for _dbm module CFLAGS and LIBS])<br>
++have_dbm=3Dno<br>
++as_save_IFS=3D$IFS<br>
++IFS=3D:<br>
++for db in $with_dbmliborder; do<br>
++=C2=A0 case &quot;$db&quot; in<br>
++=C2=A0 =C2=A0 ndbm)<br>
++=C2=A0 =C2=A0 =C2=A0 if test &quot;$have_ndbm&quot; =3D yes; then<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 DBM_CFLAGS=3D&quot;-DUSE_NDBM&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 DBM_LIBS=3D&quot;$dbm_ndbm&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 have_dbm=3Dyes<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
++=C2=A0 =C2=A0 =C2=A0 fi<br>
++=C2=A0 =C2=A0 =C2=A0 ;;<br>
++=C2=A0 =C2=A0 gdbm)<br>
++=C2=A0 =C2=A0 =C2=A0 if test &quot;$have_gdbm_compat&quot; =3D yes; then<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 DBM_CFLAGS=3D&quot;-DUSE_GDBM_COMPAT&quot;<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 DBM_LIBS=3D&quot;-lgdbm_compat&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 have_dbm=3Dyes<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
++=C2=A0 =C2=A0 =C2=A0 fi<br>
++=C2=A0 =C2=A0 =C2=A0 ;;<br>
++=C2=A0 =C2=A0 bdb)<br>
++=C2=A0 =C2=A0 =C2=A0 if test &quot;$ac_cv_have_libdb&quot; =3D yes; then<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 DBM_CFLAGS=3D&quot;-DUSE_BERKDB&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 DBM_LIBS=3D&quot;-ldb&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 have_dbm=3Dyes<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
++=C2=A0 =C2=A0 =C2=A0 fi<br>
++=C2=A0 =C2=A0 =C2=A0;;<br>
++=C2=A0 esac<br>
++done<br>
++IFS=3D$as_save_IFS<br>
++AC_MSG_RESULT([$DBM_CFLAGS $DBM_LIBS])<br>
+ <br>
+ # Templates for things AC_DEFINEd more than once.<br>
+ # For a single AC_DEFINE, no template is needed.<br>
+@@ -6940,7 +6988,9 @@ PY_STDLIB_MOD([_ctypes],<br>
+ dnl PY_STDLIB_MOD([_curses], [], [], [], [])<br>
+ dnl PY_STDLIB_MOD([_curses_panel], [], [], [], [])<br>
+ PY_STDLIB_MOD([_decimal], [], [], [$LIBMPDEC_CFLAGS], [$LIBMPDEC_LDFLAGS]=
)<br>
+-dnl PY_STDLIB_MOD([_dbm], [], [], [], [])<br>
++PY_STDLIB_MOD([_dbm],<br>
++=C2=A0 [test -n &quot;$with_dbmliborder&quot;], [test &quot;$have_dbm&quo=
t; !=3D &quot;no&quot;],<br>
++=C2=A0 [$DBM_CFLAGS], [$DBM_LIBS])<br>
+ PY_STDLIB_MOD([_gdbm],<br>
+=C2=A0 =C2=A0[test &quot;$have_gdbm_dbmliborder&quot; =3D yes], [test &quo=
t;$have_gdbm&quot; =3D yes],<br>
+=C2=A0 =C2=A0[$GDBM_CFLAGS], [$GDBM_LIBS])<br>
+diff --git a/<a href=3D"http://pyconfig.h.in" rel=3D"noreferrer" target=3D=
"_blank">pyconfig.h.in</a> b/<a href=3D"http://pyconfig.h.in" rel=3D"norefe=
rrer" target=3D"_blank">pyconfig.h.in</a><br>
+index 15933e75b1b07..b05ddd41c2bba 100644<br>
+--- a/<a href=3D"http://pyconfig.h.in" rel=3D"noreferrer" target=3D"_blank=
">pyconfig.h.in</a><br>
++++ b/<a href=3D"http://pyconfig.h.in" rel=3D"noreferrer" target=3D"_blank=
">pyconfig.h.in</a><br>
+@@ -640,18 +640,12 @@<br>
+ /* Define to 1 if you have the `dld&#39; library (-ldld). */<br>
+ #undef HAVE_LIBDLD<br>
+ <br>
+-/* Define to 1 if you have the `gdbm_compat&#39; library (-lgdbm_compat).=
 */<br>
+-#undef HAVE_LIBGDBM_COMPAT<br>
+-<br>
+ /* Define to 1 if you have the `ieee&#39; library (-lieee). */<br>
+ #undef HAVE_LIBIEEE<br>
+ <br>
+ /* Define to 1 if you have the &lt;libintl.h&gt; header file. */<br>
+ #undef HAVE_LIBINTL_H<br>
+ <br>
+-/* Define to 1 if you have the `ndbm&#39; library (-lndbm). */<br>
+-#undef HAVE_LIBNDBM<br>
+-<br>
+ /* Define to build the readline module. */<br>
+ #undef HAVE_LIBREADLINE<br>
+ <br>
+diff --git a/setup.py b/setup.py<br>
+index 843ec35effe10..cc11dedee1b2e 100644<br>
+--- a/setup.py<br>
++++ b/setup.py<br>
+@@ -1163,77 +1163,7 @@ def detect_crypt(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.addext(Extension(&#39;_crypt&#39;, =
[&#39;_cryptmodule.c&#39;]))<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0def detect_dbm_gdbm(self):<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Modules that provide persistent dictionary-=
like semantics.=C2=A0 You will<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # probably want to arrange for at least one o=
f them to be available on<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # your machine, though none are defined by de=
fault because of library<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # dependencies.=C2=A0 The Python module dbm/_=
_init__.py provides an<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # implementation independent wrapper for thes=
e; dbm/dumb.py provides<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # similar functionality (but slower of course=
) implemented in Python.<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dbm_setup_debug =3D False=C2=A0 =C2=A0# verbo=
se debug prints from this script?<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dbm_order =3D [&#39;gdbm&#39;]<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # libdb, gdbm and ndbm headers and libraries<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 have_ndbm_h =3D sysconfig.get_config_var(&quo=
t;HAVE_NDBM_H&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 have_gdbm_ndbm_h =3D sysconfig.get_config_var=
(&quot;HAVE_GDBM_NDBM_H&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 have_gdbm_dash_ndbm_h =3D sysconfig.get_confi=
g_var(&quot;HAVE_GDBM_DASH_NDBM_H&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 have_libndbm =3D sysconfig.get_config_var(&qu=
ot;HAVE_LIBNDBM&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 have_libgdbm_compat =3D sysconfig.get_config_=
var(&quot;HAVE_LIBGDBM_COMPAT&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 have_libdb =3D sysconfig.get_config_var(&quot=
;HAVE_LIBDB&quot;)<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # The standard Unix dbm module:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not CYGWIN:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 config_args =3D [arg.strip(&quo=
t;&#39;&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0for arg in sysconfig.get_config_var(&quot;CONFIG_AR=
GS&quot;).split()]<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbm_args =3D [arg for arg in co=
nfig_args<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if arg.startswith(&#39;--with-dbmliborder=3D&#39;)]<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if dbm_args:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbm_order =3D [ar=
g.split(&#39;=3D&#39;)[-1] for arg in dbm_args][-1].split(&quot;:&quot;)<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbm_order =3D &qu=
ot;gdbm:ndbm:bdb&quot;.split(&quot;:&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbmext =3D None<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for cand in dbm_order:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if cand =3D=3D &q=
uot;ndbm&quot;:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if =
have_ndbm_h:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 # Some systems have -lndbm, others have -lgdbm_compat,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 # others don&#39;t have either<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if have_libndbm:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ndbm_libs =3D [&#39;ndbm&#39;]<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 elif have_libgdbm_compat:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ndbm_libs =3D [&#39;gdbm_compat&#39;]<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 else:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ndbm_libs =3D []<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if dbm_setup_debug: print(&quot;building dbm using ndbm&quot;)<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dbmext =3D Extension(<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &#39;_dbm&#39;, [&#39;_dbmmodule.c&#39;],<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 define_macros=3D[(&#39;USE_NDBM&#39;, None)],<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 libraries=3Dndbm_libs<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 )<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif cand =3D=3D =
&quot;gdbm&quot;:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # d=
bm_open() is provided by libgdbm_compat, which wraps libgdbm<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if =
have_libgdbm_compat and (have_gdbm_ndbm_h or have_gdbm_dash_ndbm_h):<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if dbm_setup_debug: print(&quot;building dbm using gdbm&quot;)<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dbmext =3D Extension(<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &#39;_dbm&#39;, [&#39;_dbmmodule.c&#39;],<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 define_macros=3D[(&#39;USE_GDBM_COMPAT&#39;, None)=
],<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 libraries=3D[&#39;gdbm_compat&#39;]<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 )<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif cand =3D=3D =
&quot;bdb&quot;:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if =
have_libdb:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if dbm_setup_debug: print(&quot;building dbm using bdb&quot;)<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dbmext =3D Extension(<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &#39;_dbm&#39;, [&#39;_dbmmodule.c&#39;],<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 define_macros=3D[(&#39;USE_BERKDB&#39;, None)],<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 libraries=3D[&#39;db&#39;]<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 )<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if dbmext is not None:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.add(dbmext)<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.missing.appe=
nd(&#39;_dbm&#39;)<br>
+-<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.addext(Extension(&#39;_dbm&#39;, [&#39;_=
dbmmodule.c&#39;]))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Anthony Baxter&#39;s gdbm module.=C2=
=A0 GNU dbm(3) will require -lgdbm:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.addext(Extension(&#39;_gdbm&#39;, [=
&#39;_gdbmmodule.c&#39;]))<br>
+ <br>
diff --git a/package/python3/0030-Add-an-option-to-disable-the-berkeleydb-m=
odule.patch b/package/python3/0030-Add-an-option-to-disable-the-berkeleydb-=
module.patch<br>
deleted file mode 100644<br>
index 5fb436db59..0000000000<br>
--- a/package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.p=
atch<br>
+++ /dev/null<br>
@@ -1,30 +0,0 @@<br>
-From 67e9793d070ac5c8e83abbe95b9208533ffeadd0 Mon Sep 17 00:00:00 2001<br>
-From: Bernd Kuhls &lt;<a href=3D"mailto:bernd.kuhls@t-online.de" target=3D=
"_blank">bernd.kuhls@t-online.de</a>&gt;<br>
-Date: Sat, 11 Apr 2020 22:01:40 +0200<br>
-Subject: [PATCH] Add an option to disable the berkeleydb module<br>
-<br>
-Signed-off-by: Bernd Kuhls &lt;<a href=3D"mailto:bernd.kuhls@t-online.de" =
target=3D"_blank">bernd.kuhls@t-online.de</a>&gt;<br>
----<br>
- <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 6 ++++++<br>
- 1 file changed, 6 insertions(+)<br>
-<br>
-diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
-index 841fd6732c..06c9a81f95 100644<br>
---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-@@ -4280,6 +4280,12 @@ if test &quot;$UUID&quot; =3D &quot;no&quot;; then<=
br>
-=C2=A0 =C2=A0 DISABLED_EXTENSIONS=3D&quot;${DISABLED_EXTENSIONS} _uuid&quo=
t;<br>
- fi<br>
- <br>
-+AC_ARG_ENABLE(berkeleydb,<br>
-+=C2=A0 =C2=A0 =C2=A0 AS_HELP_STRING([--disable-berkeleydb], [disable berk=
eleydb]),<br>
-+=C2=A0 =C2=A0 =C2=A0 [ if test &quot;$enableval&quot; =3D &quot;no&quot;;=
 then<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DISABLED_EXTENSIONS=3D&quot;${DI=
SABLED_EXTENSIONS} _dbm&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi])<br>
-+<br>
- AC_SUBST(PYDOC)<br>
- <br>
- AC_ARG_ENABLE(pydoc,<br>
--- <br>
-2.34.1<br>
-<br>
diff --git a/package/python3/<a href=3D"http://python3.mk" rel=3D"noreferre=
r" target=3D"_blank">python3.mk</a> b/package/python3/<a href=3D"http://pyt=
hon3.mk" rel=3D"noreferrer" target=3D"_blank">python3.mk</a><br>
index bdb7cfd22f..494c66c0b1 100644<br>
--- a/package/python3/<a href=3D"http://python3.mk" rel=3D"noreferrer" targ=
et=3D"_blank">python3.mk</a><br>
+++ b/package/python3/<a href=3D"http://python3.mk" rel=3D"noreferrer" targ=
et=3D"_blank">python3.mk</a><br>
@@ -75,7 +75,7 @@ endif<br>
=C2=A0ifeq ($(BR2_PACKAGE_PYTHON3_BERKELEYDB),y)<br>
=C2=A0PYTHON3_DEPENDENCIES +=3D berkeleydb<br>
=C2=A0else<br>
-PYTHON3_CONF_OPTS +=3D --disable-berkeleydb<br>
+PYTHON3_CONF_ENV +=3D py_cv_module__dbm=3Dn/a<br>
=C2=A0endif<br>
<br>
=C2=A0ifeq ($(BR2_PACKAGE_PYTHON3_READLINE),y)<br>
-- <br>
2.39.2<br>
<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div>

--0000000000007a8355060824edf7--


--===============2849473781700267050==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2849473781700267050==--


