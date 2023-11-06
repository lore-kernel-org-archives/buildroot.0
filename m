Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED3BC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 20:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05A4241D94;
	Mon,  6 Nov 2023 20:21:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05A4241D94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YgJkeQraGp12; Mon,  6 Nov 2023 20:21:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4F2541EE5;
	Mon,  6 Nov 2023 20:21:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4F2541EE5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 58D5A1BF3A4
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 20:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FC128228E
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 20:21:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FC128228E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qOKHbjzd05hR for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 20:21:04 +0000 (UTC)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5602481EE4
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 20:21:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5602481EE4
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9c603e2354fso976309466b.1
 for <buildroot@buildroot.org>; Mon, 06 Nov 2023 12:21:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699302062; x=1699906862;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YpKStHKn3798FgsTcXJ8hOjkdv5T3JeQ+tf5qZDJx4c=;
 b=mqdbSBd8yjKVI3dQ2WDz3QjSRpSXZgr+tbjAfiaecAoNtdS1bqZqCyc4m6m6V5bEhi
 +EybQ+m/r0hE1NarnlW15mXtB4WhyD9UfWbZV2x5y8vYQNUI+5k2t9b9Q54Zj29KSKtY
 PR1diLjnPU8yyE89bQBXfmkiVB25gqP6S/Zn3n+6o2tTnZOg1n2GogT9b3paoijIzFpy
 iZMu0kyau0iErv5SKH9xc2LMAEYT8U2yQLADRYCnr7NYYLe+5phThW8SbFZt1ofAaGGl
 q0zJjgLvb49g5JsYr+wNnnQG0D9QZjAkfppdQ0qx9c84DgHxPCRHUkdg3tv2dwfMAh2k
 wBJw==
X-Gm-Message-State: AOJu0YxmyHgMwk8RKEnKRHRISqLquujoiVtdQeGnggct55Zy8h2t0a/y
 cn4T9JPa9L/ZTe403pAOG5YpodpRys1BsxPCH/6/aw==
X-Google-Smtp-Source: AGHT+IFXAe8iX214oYM6GeFHzPme5G/n19sYq49XbylmmRhshjVC/SubVZZcQ9H52RnTzIIUv+VttAfWJgVBstT2iz0=
X-Received: by 2002:a17:907:9484:b0:9bd:a5a9:34de with SMTP id
 dm4-20020a170907948400b009bda5a934demr478235ejc.23.1699302062043; Mon, 06 Nov
 2023 12:21:02 -0800 (PST)
MIME-Version: 1.0
References: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
 <6d9e618d-0cfa-4f13-9cfa-bb677fb9c29b@mind.be>
In-Reply-To: <6d9e618d-0cfa-4f13-9cfa-bb677fb9c29b@mind.be>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Mon, 6 Nov 2023 13:20:50 -0700
Message-ID: <CAHDQB6Opc5ZwVXu=iXFHTj3J-2xJAjSq14fkJ23kv597R3tkSQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699302062; x=1699906862;
 darn=buildroot.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YpKStHKn3798FgsTcXJ8hOjkdv5T3JeQ+tf5qZDJx4c=;
 b=kieisgO3n0kSpAEBA7OlAj1IAaX1JovREbC8/5pLAx4RAF+QylBIpnKX1BAImGPS2D
 2p2zrBBOI8Bkh5T+fu7yF/I7xSBsFRd+L2aIWGH67KzT9/vY2uMeWkfIFr3sEoegA3Tt
 np9RnYczabrEFMgk2Y2wqYfkA53d4knhZOI6U=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=kieisgO3
Subject: Re: [Buildroot] [PATCH v2 01/24] package/python3: use upstream
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
 James Hilliard <james.hilliard1@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7816546641579051696=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7816546641579051696==
Content-Type: multipart/alternative; boundary="000000000000c6455b060981974b"

--000000000000c6455b060981974b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ah, I missed that comment.

This would be up to you and Yann to deliberate on. I was told by Yann to
run a `git am` on Bernds patch
series and apply it to the beginning of the series. It's a good idea as it
makes migrating to Python 3.12.0
easier in the case we need to revert, as the series has been
thoroughly tested on 3.11 as well.

Adam Duskett

Senior Embedded Systems Developer

M. +1208-515-8102

adam.duskett@amarulasolutions.com

__________________________________


Amarula Solutions BV

Joop Geesinkweg 125, 1114 AB, Amsterdam, NL

T. +31 (0)85 111 9170
info@amarulasolutions.com

www.amarulasolutions.com



On Sun, Nov 5, 2023 at 2:15=E2=80=AFPM Arnout Vandecappelle <arnout@mind.be=
> wrote:

>   Hi Adam,
>
> On 05/11/2023 21:25, Adam Duskett wrote:
> > From: Bernd Kuhls <bernd@kuhls.net>
> >
> > Backport patch 0018 from python 3.12 to enhance build system.
> >
> > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> > Reviewed-by: Adam Duskett <aduskett@gmail.com>
> > Tested-by: Adam Duskett <aduskett@gmail.com>
> > Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
>
>   I made the comment in v1 that this and all other "use upstream build
> system"
> patches should be squashed with the version bump. Did you miss that
> comment, or
> do you disagree?
>
>   Regards,
>   Arnout
>
> > ---
> >   .checkpackageignore                           |   1 -
> >   ...18-Port-_dbm-module-to-PY_STDLIB_MOD.patch | 293 +++++++++++++++++=
+
> >   ...ion-to-disable-the-berkeleydb-module.patch |  30 --
> >   package/python3/python3.mk                    |   2 +-
> >   4 files changed, 294 insertions(+), 32 deletions(-)
> >   create mode 100644
> package/python3/0018-Port-_dbm-module-to-PY_STDLIB_MOD.patch
> >   delete mode 100644
> package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patch
> >
> > diff --git a/.checkpackageignore b/.checkpackageignore
> > index a126d93901..be46e46c04 100644
> > --- a/.checkpackageignore
> > +++ b/.checkpackageignore
> > @@ -1166,7 +1166,6 @@
> package/python3/0026-python-config.sh-don-t-reassign-prefix.patch Upstrea=
m
> >   package/python3/0027-Add-an-option-to-disable-uuid-module.patch
> Upstream
> >   package/python3/0028-fix-building-on-older-distributions.patch Upstre=
am
> >
>  package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mu=
s.patch
> Upstream
> >
> -package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patc=
h
> Upstream
> >
>  package/python3/0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encrypti=
o.patch
> Upstream
> >   package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch
> Upstream
> >
>  package/qemu/0002-softmmu-qemu-seccomp.c-add-missing-header-for-CLONE_.p=
atch
> Upstream
> > diff --git
> a/package/python3/0018-Port-_dbm-module-to-PY_STDLIB_MOD.patch
> b/package/python3/0018-Port-_dbm-module-to-PY_STDLIB_MOD.patch
> > new file mode 100644
> > index 0000000000..92d2594eef
> > --- /dev/null
> > +++ b/package/python3/0018-Port-_dbm-module-to-PY_STDLIB_MOD.patch
> > @@ -0,0 +1,293 @@
> > +From ec5e253556875640b1ac514e85c545346ac3f1e0 Mon Sep 17 00:00:00 2001
> > +From: Christian Heimes <christian@python.org>
> > +Date: Fri, 1 Jul 2022 21:48:38 +0200
> > +Subject: [PATCH] gh-90005: Port _dbm module to PY_STDLIB_MOD (GH-94433=
)
> > +
> > +Upstream:
> https://github.com/python/cpython/commit/ec5e253556875640b1ac514e85c54534=
6ac3f1e0
> > +
> > +[Bernd: backported to 3.11.4]
> > +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> > +---
> > + ...2-06-30-09-57-39.gh-issue-90005.9-pQyR.rst |   1 +
> > + Modules/Setup.stdlib.in                       |   2 +-
> > + configure                                     | 295 ++++++++++++-----=
-
> > + configure.ac                                  | 100 ++++--
> > + pyconfig.h.in                                 |   6 -
> > + setup.py                                      |  72 +----
> > + 6 files changed, 278 insertions(+), 198 deletions(-)
> > + create mode 100644
> Misc/NEWS.d/next/Build/2022-06-30-09-57-39.gh-issue-90005.9-pQyR.rst
> > +
> > +diff --git
> a/Misc/NEWS.d/next/Build/2022-06-30-09-57-39.gh-issue-90005.9-pQyR.rst
> b/Misc/NEWS.d/next/Build/2022-06-30-09-57-39.gh-issue-90005.9-pQyR.rst
> > +new file mode 100644
> > +index 0000000000000..9b14f767847da
> > +--- /dev/null
> > ++++
> b/Misc/NEWS.d/next/Build/2022-06-30-09-57-39.gh-issue-90005.9-pQyR.rst
> > +@@ -0,0 +1 @@
> > ++``_dbm`` module dependencies are now detected by configure.
> > +diff --git a/Modules/Setup.stdlib.in b/Modules/Setup.stdlib.in
> > +index a199aefc51011..ad34f85e25451 100644
> > +--- a/Modules/Setup.stdlib.in
> > ++++ b/Modules/Setup.stdlib.in
> > +@@ -68,7 +68,7 @@
> > +
> > + # dbm/gdbm
> > + # dbm needs either libndbm, libgdbm_compat, or libdb 5.x
> > +-#@MODULE__DBM_TRUE@_dbm _dbmmodule.c
> > ++@MODULE__DBM_TRUE@_dbm _dbmmodule.c
> > + # gdbm module needs -lgdbm
> > + @MODULE__GDBM_TRUE@_gdbm _gdbmmodule.c
> > +
> > +diff --git a/configure.ac b/configure.ac
> > +index 12ae2ae8d87eb..b03ead3bdefa0 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -3956,17 +3956,30 @@ WITH_SAVE_ENV([
> > +   ], [have_gdbm=3Dno])
> > + ])
> > +
> > +-# check for _dbmmodule.c dependencies
> > ++dnl check for _dbmmodule.c dependencies
> > ++dnl ndbm, gdbm_compat, libdb
> > + AC_CHECK_HEADERS([ndbm.h], [
> > +-  LIBS_SAVE=3D"$LIBS"
> > +-  AC_CHECK_LIB([ndbm], [dbm_open])
> > +-  LIBS=3D"$LIBS_SAVE"
> > +-  AC_CHECK_LIB([gdbm_compat], [dbm_open])
> > +-  LIBS=3D"$LIBS_SAVE"
> > ++  WITH_SAVE_ENV([
> > ++    AC_SEARCH_LIBS([dbm_open], [ndbm gdbm_compat])
> > ++  ])
> > + ])
> > +
> > +-# "gdbm-ndbm.h" and "gdbm/ndbm.h" are both normalized to "gdbm_ndbm_h=
"
> > +-# unset ac_cv_header_gdbm_ndbm_h to prevent false positive cache hits=
.
> > ++AC_MSG_CHECKING([for ndbm presence and linker args])
> > ++AS_CASE([$ac_cv_search_dbm_open],
> > ++  [*ndbm*|*gdbm_compat*], [
> > ++    dbm_ndbm=3D"$ac_cv_search_dbm_open"
> > ++    have_ndbm=3Dyes
> > ++  ],
> > ++  [none*], [
> > ++    dbm_ndbm=3D""
> > ++    have_ndbm=3Dyes
> > ++  ],
> > ++  [no], [have_ndbm=3Dno]
> > ++)
> > ++AC_MSG_RESULT([$have_ndbm ($dbm_ndbm)])
> > ++
> > ++dnl "gdbm-ndbm.h" and "gdbm/ndbm.h" are both normalized to
> "gdbm_ndbm_h"
> > ++dnl unset ac_cv_header_gdbm_ndbm_h to prevent false positive cache
> hits.
> > + AS_UNSET([ac_cv_header_gdbm_ndbm_h])
> > + AC_CACHE_VAL([ac_cv_header_gdbm_slash_ndbm_h], [
> > +   AC_CHECK_HEADER(
> > +@@ -3991,26 +4004,26 @@ AS_VAR_IF([ac_cv_header_gdbm_dash_ndbm_h],
> [yes], [
> > + AS_UNSET([ac_cv_header_gdbm_ndbm_h])
> > +
> > + if test "$ac_cv_header_gdbm_slash_ndbm_h" =3D yes -o
> "$ac_cv_header_gdbm_dash_ndbm_h" =3D yes; then
> > +-  LIBS_SAVE=3D"$LIBS"
> > +-  AC_CHECK_LIB([gdbm_compat], [dbm_open])
> > +-  LIBS=3D"$LIBS_SAVE"
> > ++  WITH_SAVE_ENV([
> > ++    AC_SEARCH_LIBS([dbm_open], [gdbm_compat])
> > ++  ])
> > + fi
> > +
> > + # Check for libdb >=3D 5 with dbm_open()
> > + # db.h re-defines the name of the function
> > + AC_CHECK_HEADERS([db.h], [
> > +   AC_CACHE_CHECK([for libdb], [ac_cv_have_libdb], [
> > +-    LIBS_SAVE=3D"$LIBS"
> > +-    LIBS=3D"$LIBS -ldb"
> > +-    AC_LINK_IFELSE([AC_LANG_PROGRAM([
> > +-      #define DB_DBM_HSEARCH 1
> > +-      #include <db.h>
> > +-      #if DB_VERSION_MAJOR < 5
> > +-        #error "dh.h: DB_VERSION_MAJOR < 5 is not supported."
> > +-      #endif
> > +-      ], [DBM *dbm =3D dbm_open(NULL, 0, 0)])
> > +-    ], [ac_cv_have_libdb=3Dyes], [ac_cv_have_libdb=3Dno])
> > +-    LIBS=3D"$LIBS_SAVE"
> > ++    WITH_SAVE_ENV([
> > ++      LIBS=3D"$LIBS -ldb"
> > ++      AC_LINK_IFELSE([AC_LANG_PROGRAM([
> > ++        #define DB_DBM_HSEARCH 1
> > ++        #include <db.h>
> > ++        #if DB_VERSION_MAJOR < 5
> > ++          #error "dh.h: DB_VERSION_MAJOR < 5 is not supported."
> > ++        #endif
> > ++        ], [DBM *dbm =3D dbm_open(NULL, 0, 0)])
> > ++      ], [ac_cv_have_libdb=3Dyes], [ac_cv_have_libdb=3Dno])
> > ++    ])
> > +   ])
> > +   AS_VAR_IF([ac_cv_have_libdb], [yes], [
> > +     AC_DEFINE([HAVE_LIBDB], [1], [Define to 1 if you have the `db'
> library (-ldb).])
> > +@@ -4018,7 +4031,7 @@ AC_CHECK_HEADERS([db.h], [
> > + ])
> > +
> > + # Check for --with-dbmliborder
> > +-AC_MSG_CHECKING(for --with-dbmliborder)
> > ++AC_MSG_CHECKING([for --with-dbmliborder])
> > + AC_ARG_WITH(dbmliborder,
> > +             AS_HELP_STRING([--with-dbmliborder=3Ddb1:db2:...], [overr=
ide
> order to check db backends for dbm; a valid value is a colon separated
> string with the backend names `ndbm', `gdbm' and `bdb'.]),
> > + [], [with_dbmliborder=3Dgdbm:ndbm:bdb])
> > +@@ -4038,7 +4051,42 @@ IFS=3D$as_save_IFS
> > + AS_VAR_IF([with_dbmliborder], [error], [
> > +   AC_MSG_ERROR([proper usage is --with-dbmliborder=3Ddb1:db2:...
> (gdbm:ndbm:bdb)])
> > + ])
> > +-AC_MSG_RESULT($with_dbmliborder)
> > ++AC_MSG_RESULT([$with_dbmliborder])
> > ++
> > ++AC_MSG_CHECKING([for _dbm module CFLAGS and LIBS])
> > ++have_dbm=3Dno
> > ++as_save_IFS=3D$IFS
> > ++IFS=3D:
> > ++for db in $with_dbmliborder; do
> > ++  case "$db" in
> > ++    ndbm)
> > ++      if test "$have_ndbm" =3D yes; then
> > ++        DBM_CFLAGS=3D"-DUSE_NDBM"
> > ++        DBM_LIBS=3D"$dbm_ndbm"
> > ++        have_dbm=3Dyes
> > ++        break
> > ++      fi
> > ++      ;;
> > ++    gdbm)
> > ++      if test "$have_gdbm_compat" =3D yes; then
> > ++        DBM_CFLAGS=3D"-DUSE_GDBM_COMPAT"
> > ++        DBM_LIBS=3D"-lgdbm_compat"
> > ++        have_dbm=3Dyes
> > ++        break
> > ++      fi
> > ++      ;;
> > ++    bdb)
> > ++      if test "$ac_cv_have_libdb" =3D yes; then
> > ++        DBM_CFLAGS=3D"-DUSE_BERKDB"
> > ++        DBM_LIBS=3D"-ldb"
> > ++        have_dbm=3Dyes
> > ++        break
> > ++      fi
> > ++     ;;
> > ++  esac
> > ++done
> > ++IFS=3D$as_save_IFS
> > ++AC_MSG_RESULT([$DBM_CFLAGS $DBM_LIBS])
> > +
> > + # Templates for things AC_DEFINEd more than once.
> > + # For a single AC_DEFINE, no template is needed.
> > +@@ -6940,7 +6988,9 @@ PY_STDLIB_MOD([_ctypes],
> > + dnl PY_STDLIB_MOD([_curses], [], [], [], [])
> > + dnl PY_STDLIB_MOD([_curses_panel], [], [], [], [])
> > + PY_STDLIB_MOD([_decimal], [], [], [$LIBMPDEC_CFLAGS],
> [$LIBMPDEC_LDFLAGS])
> > +-dnl PY_STDLIB_MOD([_dbm], [], [], [], [])
> > ++PY_STDLIB_MOD([_dbm],
> > ++  [test -n "$with_dbmliborder"], [test "$have_dbm" !=3D "no"],
> > ++  [$DBM_CFLAGS], [$DBM_LIBS])
> > + PY_STDLIB_MOD([_gdbm],
> > +   [test "$have_gdbm_dbmliborder" =3D yes], [test "$have_gdbm" =3D yes=
],
> > +   [$GDBM_CFLAGS], [$GDBM_LIBS])
> > +diff --git a/pyconfig.h.in b/pyconfig.h.in
> > +index 15933e75b1b07..b05ddd41c2bba 100644
> > +--- a/pyconfig.h.in
> > ++++ b/pyconfig.h.in
> > +@@ -640,18 +640,12 @@
> > + /* Define to 1 if you have the `dld' library (-ldld). */
> > + #undef HAVE_LIBDLD
> > +
> > +-/* Define to 1 if you have the `gdbm_compat' library (-lgdbm_compat).
> */
> > +-#undef HAVE_LIBGDBM_COMPAT
> > +-
> > + /* Define to 1 if you have the `ieee' library (-lieee). */
> > + #undef HAVE_LIBIEEE
> > +
> > + /* Define to 1 if you have the <libintl.h> header file. */
> > + #undef HAVE_LIBINTL_H
> > +
> > +-/* Define to 1 if you have the `ndbm' library (-lndbm). */
> > +-#undef HAVE_LIBNDBM
> > +-
> > + /* Define to build the readline module. */
> > + #undef HAVE_LIBREADLINE
> > +
> > +diff --git a/setup.py b/setup.py
> > +index 843ec35effe10..cc11dedee1b2e 100644
> > +--- a/setup.py
> > ++++ b/setup.py
> > +@@ -1163,77 +1163,7 @@ def detect_crypt(self):
> > +         self.addext(Extension('_crypt', ['_cryptmodule.c']))
> > +
> > +     def detect_dbm_gdbm(self):
> > +-        # Modules that provide persistent dictionary-like semantics.
> You will
> > +-        # probably want to arrange for at least one of them to be
> available on
> > +-        # your machine, though none are defined by default because of
> library
> > +-        # dependencies.  The Python module dbm/__init__.py provides a=
n
> > +-        # implementation independent wrapper for these; dbm/dumb.py
> provides
> > +-        # similar functionality (but slower of course) implemented in
> Python.
> > +-
> > +-        dbm_setup_debug =3D False   # verbose debug prints from this
> script?
> > +-        dbm_order =3D ['gdbm']
> > +-
> > +-        # libdb, gdbm and ndbm headers and libraries
> > +-        have_ndbm_h =3D sysconfig.get_config_var("HAVE_NDBM_H")
> > +-        have_gdbm_ndbm_h =3D sysconfig.get_config_var("HAVE_GDBM_NDBM=
_H")
> > +-        have_gdbm_dash_ndbm_h =3D
> sysconfig.get_config_var("HAVE_GDBM_DASH_NDBM_H")
> > +-        have_libndbm =3D sysconfig.get_config_var("HAVE_LIBNDBM")
> > +-        have_libgdbm_compat =3D
> sysconfig.get_config_var("HAVE_LIBGDBM_COMPAT")
> > +-        have_libdb =3D sysconfig.get_config_var("HAVE_LIBDB")
> > +-
> > +-        # The standard Unix dbm module:
> > +-        if not CYGWIN:
> > +-            config_args =3D [arg.strip("'")
> > +-                           for arg in
> sysconfig.get_config_var("CONFIG_ARGS").split()]
> > +-            dbm_args =3D [arg for arg in config_args
> > +-                        if arg.startswith('--with-dbmliborder=3D')]
> > +-            if dbm_args:
> > +-                dbm_order =3D [arg.split('=3D')[-1] for arg in
> dbm_args][-1].split(":")
> > +-            else:
> > +-                dbm_order =3D "gdbm:ndbm:bdb".split(":")
> > +-            dbmext =3D None
> > +-            for cand in dbm_order:
> > +-                if cand =3D=3D "ndbm":
> > +-                    if have_ndbm_h:
> > +-                        # Some systems have -lndbm, others have
> -lgdbm_compat,
> > +-                        # others don't have either
> > +-                        if have_libndbm:
> > +-                            ndbm_libs =3D ['ndbm']
> > +-                        elif have_libgdbm_compat:
> > +-                            ndbm_libs =3D ['gdbm_compat']
> > +-                        else:
> > +-                            ndbm_libs =3D []
> > +-                        if dbm_setup_debug: print("building dbm using
> ndbm")
> > +-                        dbmext =3D Extension(
> > +-                            '_dbm', ['_dbmmodule.c'],
> > +-                            define_macros=3D[('USE_NDBM', None)],
> > +-                            libraries=3Dndbm_libs
> > +-                        )
> > +-                        break
> > +-                elif cand =3D=3D "gdbm":
> > +-                    # dbm_open() is provided by libgdbm_compat, which
> wraps libgdbm
> > +-                    if have_libgdbm_compat and (have_gdbm_ndbm_h or
> have_gdbm_dash_ndbm_h):
> > +-                        if dbm_setup_debug: print("building dbm using
> gdbm")
> > +-                        dbmext =3D Extension(
> > +-                            '_dbm', ['_dbmmodule.c'],
> > +-                            define_macros=3D[('USE_GDBM_COMPAT', None=
)],
> > +-                            libraries=3D['gdbm_compat']
> > +-                        )
> > +-                        break
> > +-                elif cand =3D=3D "bdb":
> > +-                    if have_libdb:
> > +-                        if dbm_setup_debug: print("building dbm using
> bdb")
> > +-                        dbmext =3D Extension(
> > +-                            '_dbm', ['_dbmmodule.c'],
> > +-                            define_macros=3D[('USE_BERKDB', None)],
> > +-                            libraries=3D['db']
> > +-                        )
> > +-                        break
> > +-            if dbmext is not None:
> > +-                self.add(dbmext)
> > +-            else:
> > +-                self.missing.append('_dbm')
> > +-
> > ++        self.addext(Extension('_dbm', ['_dbmmodule.c']))
> > +         # Anthony Baxter's gdbm module.  GNU dbm(3) will require
> -lgdbm:
> > +         self.addext(Extension('_gdbm', ['_gdbmmodule.c']))
> > +
> > diff --git
> a/package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.pat=
ch
> b/package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.pat=
ch
> > deleted file mode 100644
> > index 5fb436db59..0000000000
> > ---
> a/package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.pat=
ch
> > +++ /dev/null
> > @@ -1,30 +0,0 @@
> > -From 67e9793d070ac5c8e83abbe95b9208533ffeadd0 Mon Sep 17 00:00:00 2001
> > -From: Bernd Kuhls <bernd.kuhls@t-online.de>
> > -Date: Sat, 11 Apr 2020 22:01:40 +0200
> > -Subject: [PATCH] Add an option to disable the berkeleydb module
> > -
> > -Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> > ----
> > - configure.ac | 6 ++++++
> > - 1 file changed, 6 insertions(+)
> > -
> > -diff --git a/configure.ac b/configure.ac
> > -index 841fd6732c..06c9a81f95 100644
> > ---- a/configure.ac
> > -+++ b/configure.ac
> > -@@ -4280,6 +4280,12 @@ if test "$UUID" =3D "no"; then
> > -    DISABLED_EXTENSIONS=3D"${DISABLED_EXTENSIONS} _uuid"
> > - fi
> > -
> > -+AC_ARG_ENABLE(berkeleydb,
> > -+    AS_HELP_STRING([--disable-berkeleydb], [disable berkeleydb]),
> > -+    [ if test "$enableval" =3D "no"; then
> > -+         DISABLED_EXTENSIONS=3D"${DISABLED_EXTENSIONS} _dbm"
> > -+      fi])
> > -+
> > - AC_SUBST(PYDOC)
> > -
> > - AC_ARG_ENABLE(pydoc,
> > ---
> > -2.34.1
> > -
> > diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> > index b9c5054a21..8166d306c5 100644
> > --- a/package/python3/python3.mk
> > +++ b/package/python3/python3.mk
> > @@ -72,7 +72,7 @@ endif
> >   ifeq ($(BR2_PACKAGE_PYTHON3_BERKELEYDB),y)
> >   PYTHON3_DEPENDENCIES +=3D berkeleydb
> >   else
> > -PYTHON3_CONF_OPTS +=3D --disable-berkeleydb
> > +PYTHON3_CONF_ENV +=3D py_cv_module__dbm=3Dn/a
> >   endif
> >
> >   ifeq ($(BR2_PACKAGE_PYTHON3_READLINE),y)
>

--000000000000c6455b060981974b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ah, I missed that comment.<div><br></div><div>This would b=
e up to you and Yann to deliberate on. I was told by Yann to run a `git am`=
 on Bernds patch</div><div>series and apply it to the beginning of the seri=
es. It&#39;s a good idea as it makes migrating to Python 3.12.0</div><div>e=
asier in the case we need to revert, as the series has been thoroughly=C2=
=A0tested on 3.11 as well.</div><div><br clear=3D"all"><div><div dir=3D"ltr=
" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"=
ltr"><span><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-to=
p:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:Ubuntu,s=
ans-serif;color:rgb(0,0,0);background-color:transparent;vertical-align:base=
line;white-space:pre-wrap">Adam Duskett</span></p><p dir=3D"ltr" style=3D"l=
ine-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;vertical-align:baseline;white-space:pre=
-wrap">Senior Embedded Systems Developer</span></p><p dir=3D"ltr" style=3D"=
line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><span styl=
e=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb=
(0,0,0);background-color:transparent;vertical-align:baseline;white-space:pr=
e-wrap">M. +1208-515-8102</span></p><p dir=3D"ltr" style=3D"line-height:1.7=
999999999999998;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:=
10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);backgro=
und-color:transparent;vertical-align:baseline;white-space:pre-wrap"><a href=
=3D"mailto:adam.duskett@amarulasolutions.com" target=3D"_blank">adam.dusket=
t@amarulasolutions.com</a></span></p><p dir=3D"ltr" style=3D"line-height:1.=
7999999999999998;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size=
:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);backgr=
ound-color:transparent;vertical-align:baseline;white-space:pre-wrap">______=
____________________________</span></p><p dir=3D"ltr" style=3D"line-height:=
1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-si=
ze:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);back=
ground-color:transparent;vertical-align:baseline;white-space:pre-wrap"><br>=
</span><span style=3D"font-size:10pt;font-family:Ubuntu,sans-serif;color:rg=
b(0,0,0);background-color:transparent;vertical-align:baseline;white-space:p=
re-wrap">Amarula Solutions BV</span></p><p dir=3D"ltr" style=3D"line-height=
:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-s=
ize:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);bac=
kground-color:transparent;vertical-align:baseline;white-space:pre-wrap">Joo=
p Geesinkweg 125, 1114 AB, Amsterdam, NL</span></p><p dir=3D"ltr" style=3D"=
line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><span styl=
e=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb=
(0,0,0);background-color:transparent;vertical-align:baseline;white-space:pr=
e-wrap">T. +31 (0)85 111 9170</span><span style=3D"font-size:10pt;font-fami=
ly:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:tran=
sparent;vertical-align:baseline;white-space:pre-wrap"><br></span><span styl=
e=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb=
(0,0,0);background-color:transparent;vertical-align:baseline;white-space:pr=
e-wrap"><a href=3D"mailto:info@amarulasolutions.com" target=3D"_blank">info=
@amarulasolutions.com</a></span></p><p dir=3D"ltr" style=3D"line-height:1.7=
999999999999998;margin-top:0pt;margin-bottom:0pt"><a href=3D"http://www.ama=
rulasolutions.com/" target=3D"_blank"><span style=3D"font-size:10pt;font-fa=
mily:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:tr=
ansparent;vertical-align:baseline;white-space:pre-wrap">www.amarulasolution=
s.com</span></a></p><div><br></div></span></div></div></div><br></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Su=
n, Nov 5, 2023 at 2:15=E2=80=AFPM Arnout Vandecappelle &lt;<a href=3D"mailt=
o:arnout@mind.be">arnout@mind.be</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">=C2=A0 Hi Adam,<br>
<br>
On 05/11/2023 21:25, Adam Duskett wrote:<br>
&gt; From: Bernd Kuhls &lt;<a href=3D"mailto:bernd@kuhls.net" target=3D"_bl=
ank">bernd@kuhls.net</a>&gt;<br>
&gt; <br>
&gt; Backport patch 0018 from python 3.12 to enhance build system.<br>
&gt; <br>
&gt; Signed-off-by: Bernd Kuhls &lt;<a href=3D"mailto:bernd@kuhls.net" targ=
et=3D"_blank">bernd@kuhls.net</a>&gt;<br>
&gt; Reviewed-by: Adam Duskett &lt;<a href=3D"mailto:aduskett@gmail.com" ta=
rget=3D"_blank">aduskett@gmail.com</a>&gt;<br>
&gt; Tested-by: Adam Duskett &lt;<a href=3D"mailto:aduskett@gmail.com" targ=
et=3D"_blank">aduskett@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Adam Duskett &lt;<a href=3D"mailto:adam.duskett@amarula=
solutions.com" target=3D"_blank">adam.duskett@amarulasolutions.com</a>&gt;<=
br>
<br>
=C2=A0 I made the comment in v1 that this and all other &quot;use upstream =
build system&quot; <br>
patches should be squashed with the version bump. Did you miss that comment=
, or <br>
do you disagree?<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.checkpackageignore=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 =
-<br>
&gt;=C2=A0 =C2=A0...18-Port-_dbm-module-to-PY_STDLIB_MOD.patch | 293 ++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A0...ion-to-disable-the-berkeleydb-module.patch |=C2=A0 30 -=
-<br>
&gt;=C2=A0 =C2=A0package/python3/<a href=3D"http://python3.mk" rel=3D"noref=
errer" target=3D"_blank">python3.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A04 files changed, 294 insertions(+), 32 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 package/python3/0018-Port-_dbm-module-t=
o-PY_STDLIB_MOD.patch<br>
&gt;=C2=A0 =C2=A0delete mode 100644 package/python3/0030-Add-an-option-to-d=
isable-the-berkeleydb-module.patch<br>
&gt; <br>
&gt; diff --git a/.checkpackageignore b/.checkpackageignore<br>
&gt; index a126d93901..be46e46c04 100644<br>
&gt; --- a/.checkpackageignore<br>
&gt; +++ b/.checkpackageignore<br>
&gt; @@ -1166,7 +1166,6 @@ package/python3/0026-python-config.sh-don-t-reas=
sign-prefix.patch Upstream<br>
&gt;=C2=A0 =C2=A0package/python3/0027-Add-an-option-to-disable-uuid-module.=
patch Upstream<br>
&gt;=C2=A0 =C2=A0package/python3/0028-fix-building-on-older-distributions.p=
atch Upstream<br>
&gt;=C2=A0 =C2=A0package/python3/0029-configure.ac-fixup-CC-print-multiarch=
-output-for-mus.patch Upstream<br>
&gt; -package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.p=
atch Upstream<br>
&gt;=C2=A0 =C2=A0package/python3/0031-lib-crypt-uClibc-ng-doesn-t-set-errno=
-when-encryptio.patch Upstream<br>
&gt;=C2=A0 =C2=A0package/qemu/0001-tests-fp-disable-fp-bench-build-by-defau=
lt.patch Upstream<br>
&gt;=C2=A0 =C2=A0package/qemu/0002-softmmu-qemu-seccomp.c-add-missing-heade=
r-for-CLONE_.patch Upstream<br>
&gt; diff --git a/package/python3/0018-Port-_dbm-module-to-PY_STDLIB_MOD.pa=
tch b/package/python3/0018-Port-_dbm-module-to-PY_STDLIB_MOD.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..92d2594eef<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/python3/0018-Port-_dbm-module-to-PY_STDLIB_MOD.patch<br>
&gt; @@ -0,0 +1,293 @@<br>
&gt; +From ec5e253556875640b1ac514e85c545346ac3f1e0 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Christian Heimes &lt;<a href=3D"mailto:christian@python.org" ta=
rget=3D"_blank">christian@python.org</a>&gt;<br>
&gt; +Date: Fri, 1 Jul 2022 21:48:38 +0200<br>
&gt; +Subject: [PATCH] gh-90005: Port _dbm module to PY_STDLIB_MOD (GH-9443=
3)<br>
&gt; +<br>
&gt; +Upstream: <a href=3D"https://github.com/python/cpython/commit/ec5e253=
556875640b1ac514e85c545346ac3f1e0" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/python/cpython/commit/ec5e253556875640b1ac514e85c545346ac3f=
1e0</a><br>
&gt; +<br>
&gt; +[Bernd: backported to 3.11.4]<br>
&gt; +Signed-off-by: Bernd Kuhls &lt;<a href=3D"mailto:bernd@kuhls.net" tar=
get=3D"_blank">bernd@kuhls.net</a>&gt;<br>
&gt; +---<br>
&gt; + ...2-06-30-09-57-39.gh-issue-90005.9-pQyR.rst |=C2=A0 =C2=A01 +<br>
&gt; + Modules/<a href=3D"http://Setup.stdlib.in" rel=3D"noreferrer" target=
=3D"_blank">Setup.stdlib.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt; + configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
295 ++++++++++++------<br>
&gt; + <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 100 ++++--=
<br>
&gt; + <a href=3D"http://pyconfig.h.in" rel=3D"noreferrer" target=3D"_blank=
">pyconfig.h.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A06 -<br>
&gt; + setup.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 72 +----<br>
&gt; + 6 files changed, 278 insertions(+), 198 deletions(-)<br>
&gt; + create mode 100644 Misc/NEWS.d/next/Build/2022-06-30-09-57-39.gh-iss=
ue-90005.9-pQyR.rst<br>
&gt; +<br>
&gt; +diff --git a/Misc/NEWS.d/next/Build/2022-06-30-09-57-39.gh-issue-9000=
5.9-pQyR.rst b/Misc/NEWS.d/next/Build/2022-06-30-09-57-39.gh-issue-90005.9-=
pQyR.rst<br>
&gt; +new file mode 100644<br>
&gt; +index 0000000000000..9b14f767847da<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/Misc/NEWS.d/next/Build/2022-06-30-09-57-39.gh-issue-90005.9-pQy=
R.rst<br>
&gt; +@@ -0,0 +1 @@<br>
&gt; ++``_dbm`` module dependencies are now detected by configure.<br>
&gt; +diff --git a/Modules/<a href=3D"http://Setup.stdlib.in" rel=3D"norefe=
rrer" target=3D"_blank">Setup.stdlib.in</a> b/Modules/<a href=3D"http://Set=
up.stdlib.in" rel=3D"noreferrer" target=3D"_blank">Setup.stdlib.in</a><br>
&gt; +index a199aefc51011..ad34f85e25451 100644<br>
&gt; +--- a/Modules/<a href=3D"http://Setup.stdlib.in" rel=3D"noreferrer" t=
arget=3D"_blank">Setup.stdlib.in</a><br>
&gt; ++++ b/Modules/<a href=3D"http://Setup.stdlib.in" rel=3D"noreferrer" t=
arget=3D"_blank">Setup.stdlib.in</a><br>
&gt; +@@ -68,7 +68,7 @@<br>
&gt; +<br>
&gt; + # dbm/gdbm<br>
&gt; + # dbm needs either libndbm, libgdbm_compat, or libdb 5.x<br>
&gt; +-#@MODULE__DBM_TRUE@_dbm _dbmmodule.c<br>
&gt; ++@MODULE__DBM_TRUE@_dbm _dbmmodule.c<br>
&gt; + # gdbm module needs -lgdbm<br>
&gt; + @MODULE__GDBM_TRUE@_gdbm _gdbmmodule.c<br>
&gt; +<br>
&gt; +diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
&gt; +index 12ae2ae8d87eb..b03ead3bdefa0 100644<br>
&gt; +--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; ++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; +@@ -3956,17 +3956,30 @@ WITH_SAVE_ENV([<br>
&gt; +=C2=A0 =C2=A0], [have_gdbm=3Dno])<br>
&gt; + ])<br>
&gt; +<br>
&gt; +-# check for _dbmmodule.c dependencies<br>
&gt; ++dnl check for _dbmmodule.c dependencies<br>
&gt; ++dnl ndbm, gdbm_compat, libdb<br>
&gt; + AC_CHECK_HEADERS([ndbm.h], [<br>
&gt; +-=C2=A0 LIBS_SAVE=3D&quot;$LIBS&quot;<br>
&gt; +-=C2=A0 AC_CHECK_LIB([ndbm], [dbm_open])<br>
&gt; +-=C2=A0 LIBS=3D&quot;$LIBS_SAVE&quot;<br>
&gt; +-=C2=A0 AC_CHECK_LIB([gdbm_compat], [dbm_open])<br>
&gt; +-=C2=A0 LIBS=3D&quot;$LIBS_SAVE&quot;<br>
&gt; ++=C2=A0 WITH_SAVE_ENV([<br>
&gt; ++=C2=A0 =C2=A0 AC_SEARCH_LIBS([dbm_open], [ndbm gdbm_compat])<br>
&gt; ++=C2=A0 ])<br>
&gt; + ])<br>
&gt; +<br>
&gt; +-# &quot;gdbm-ndbm.h&quot; and &quot;gdbm/ndbm.h&quot; are both norma=
lized to &quot;gdbm_ndbm_h&quot;<br>
&gt; +-# unset ac_cv_header_gdbm_ndbm_h to prevent false positive cache hit=
s.<br>
&gt; ++AC_MSG_CHECKING([for ndbm presence and linker args])<br>
&gt; ++AS_CASE([$ac_cv_search_dbm_open],<br>
&gt; ++=C2=A0 [*ndbm*|*gdbm_compat*], [<br>
&gt; ++=C2=A0 =C2=A0 dbm_ndbm=3D&quot;$ac_cv_search_dbm_open&quot;<br>
&gt; ++=C2=A0 =C2=A0 have_ndbm=3Dyes<br>
&gt; ++=C2=A0 ],<br>
&gt; ++=C2=A0 [none*], [<br>
&gt; ++=C2=A0 =C2=A0 dbm_ndbm=3D&quot;&quot;<br>
&gt; ++=C2=A0 =C2=A0 have_ndbm=3Dyes<br>
&gt; ++=C2=A0 ],<br>
&gt; ++=C2=A0 [no], [have_ndbm=3Dno]<br>
&gt; ++)<br>
&gt; ++AC_MSG_RESULT([$have_ndbm ($dbm_ndbm)])<br>
&gt; ++<br>
&gt; ++dnl &quot;gdbm-ndbm.h&quot; and &quot;gdbm/ndbm.h&quot; are both nor=
malized to &quot;gdbm_ndbm_h&quot;<br>
&gt; ++dnl unset ac_cv_header_gdbm_ndbm_h to prevent false positive cache h=
its.<br>
&gt; + AS_UNSET([ac_cv_header_gdbm_ndbm_h])<br>
&gt; + AC_CACHE_VAL([ac_cv_header_gdbm_slash_ndbm_h], [<br>
&gt; +=C2=A0 =C2=A0AC_CHECK_HEADER(<br>
&gt; +@@ -3991,26 +4004,26 @@ AS_VAR_IF([ac_cv_header_gdbm_dash_ndbm_h], [y=
es], [<br>
&gt; + AS_UNSET([ac_cv_header_gdbm_ndbm_h])<br>
&gt; +<br>
&gt; + if test &quot;$ac_cv_header_gdbm_slash_ndbm_h&quot; =3D yes -o &quot=
;$ac_cv_header_gdbm_dash_ndbm_h&quot; =3D yes; then<br>
&gt; +-=C2=A0 LIBS_SAVE=3D&quot;$LIBS&quot;<br>
&gt; +-=C2=A0 AC_CHECK_LIB([gdbm_compat], [dbm_open])<br>
&gt; +-=C2=A0 LIBS=3D&quot;$LIBS_SAVE&quot;<br>
&gt; ++=C2=A0 WITH_SAVE_ENV([<br>
&gt; ++=C2=A0 =C2=A0 AC_SEARCH_LIBS([dbm_open], [gdbm_compat])<br>
&gt; ++=C2=A0 ])<br>
&gt; + fi<br>
&gt; +<br>
&gt; + # Check for libdb &gt;=3D 5 with dbm_open()<br>
&gt; + # db.h re-defines the name of the function<br>
&gt; + AC_CHECK_HEADERS([db.h], [<br>
&gt; +=C2=A0 =C2=A0AC_CACHE_CHECK([for libdb], [ac_cv_have_libdb], [<br>
&gt; +-=C2=A0 =C2=A0 LIBS_SAVE=3D&quot;$LIBS&quot;<br>
&gt; +-=C2=A0 =C2=A0 LIBS=3D&quot;$LIBS -ldb&quot;<br>
&gt; +-=C2=A0 =C2=A0 AC_LINK_IFELSE([AC_LANG_PROGRAM([<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 #define DB_DBM_HSEARCH 1<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 #include &lt;db.h&gt;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 #if DB_VERSION_MAJOR &lt; 5<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 #error &quot;dh.h: DB_VERSION_MAJOR &lt;=
 5 is not supported.&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 #endif<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 ], [DBM *dbm =3D dbm_open(NULL, 0, 0)])<br>
&gt; +-=C2=A0 =C2=A0 ], [ac_cv_have_libdb=3Dyes], [ac_cv_have_libdb=3Dno])<=
br>
&gt; +-=C2=A0 =C2=A0 LIBS=3D&quot;$LIBS_SAVE&quot;<br>
&gt; ++=C2=A0 =C2=A0 WITH_SAVE_ENV([<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 LIBS=3D&quot;$LIBS -ldb&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 AC_LINK_IFELSE([AC_LANG_PROGRAM([<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 #define DB_DBM_HSEARCH 1<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 #include &lt;db.h&gt;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 #if DB_VERSION_MAJOR &lt; 5<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #error &quot;dh.h: DB_VERSION_MAJ=
OR &lt; 5 is not supported.&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 #endif<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ], [DBM *dbm =3D dbm_open(NULL, 0, 0)])<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ], [ac_cv_have_libdb=3Dyes], [ac_cv_have_libdb=
=3Dno])<br>
&gt; ++=C2=A0 =C2=A0 ])<br>
&gt; +=C2=A0 =C2=A0])<br>
&gt; +=C2=A0 =C2=A0AS_VAR_IF([ac_cv_have_libdb], [yes], [<br>
&gt; +=C2=A0 =C2=A0 =C2=A0AC_DEFINE([HAVE_LIBDB], [1], [Define to 1 if you =
have the `db&#39; library (-ldb).])<br>
&gt; +@@ -4018,7 +4031,7 @@ AC_CHECK_HEADERS([db.h], [<br>
&gt; + ])<br>
&gt; +<br>
&gt; + # Check for --with-dbmliborder<br>
&gt; +-AC_MSG_CHECKING(for --with-dbmliborder)<br>
&gt; ++AC_MSG_CHECKING([for --with-dbmliborder])<br>
&gt; + AC_ARG_WITH(dbmliborder,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AS_HELP_STRING([--wit=
h-dbmliborder=3Ddb1:db2:...], [override order to check db backends for dbm;=
 a valid value is a colon separated string with the backend names `ndbm&#39=
;, `gdbm&#39; and `bdb&#39;.]),<br>
&gt; + [], [with_dbmliborder=3Dgdbm:ndbm:bdb])<br>
&gt; +@@ -4038,7 +4051,42 @@ IFS=3D$as_save_IFS<br>
&gt; + AS_VAR_IF([with_dbmliborder], [error], [<br>
&gt; +=C2=A0 =C2=A0AC_MSG_ERROR([proper usage is --with-dbmliborder=3Ddb1:d=
b2:... (gdbm:ndbm:bdb)])<br>
&gt; + ])<br>
&gt; +-AC_MSG_RESULT($with_dbmliborder)<br>
&gt; ++AC_MSG_RESULT([$with_dbmliborder])<br>
&gt; ++<br>
&gt; ++AC_MSG_CHECKING([for _dbm module CFLAGS and LIBS])<br>
&gt; ++have_dbm=3Dno<br>
&gt; ++as_save_IFS=3D$IFS<br>
&gt; ++IFS=3D:<br>
&gt; ++for db in $with_dbmliborder; do<br>
&gt; ++=C2=A0 case &quot;$db&quot; in<br>
&gt; ++=C2=A0 =C2=A0 ndbm)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if test &quot;$have_ndbm&quot; =3D yes; then<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 DBM_CFLAGS=3D&quot;-DUSE_NDBM&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 DBM_LIBS=3D&quot;$dbm_ndbm&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 have_dbm=3Dyes<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; ++=C2=A0 =C2=A0 gdbm)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if test &quot;$have_gdbm_compat&quot; =3D yes; =
then<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 DBM_CFLAGS=3D&quot;-DUSE_GDBM_COMPAT&quo=
t;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 DBM_LIBS=3D&quot;-lgdbm_compat&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 have_dbm=3Dyes<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; ++=C2=A0 =C2=A0 bdb)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if test &quot;$ac_cv_have_libdb&quot; =3D yes; =
then<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 DBM_CFLAGS=3D&quot;-DUSE_BERKDB&quot;<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 DBM_LIBS=3D&quot;-ldb&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 have_dbm=3Dyes<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0;;<br>
&gt; ++=C2=A0 esac<br>
&gt; ++done<br>
&gt; ++IFS=3D$as_save_IFS<br>
&gt; ++AC_MSG_RESULT([$DBM_CFLAGS $DBM_LIBS])<br>
&gt; +<br>
&gt; + # Templates for things AC_DEFINEd more than once.<br>
&gt; + # For a single AC_DEFINE, no template is needed.<br>
&gt; +@@ -6940,7 +6988,9 @@ PY_STDLIB_MOD([_ctypes],<br>
&gt; + dnl PY_STDLIB_MOD([_curses], [], [], [], [])<br>
&gt; + dnl PY_STDLIB_MOD([_curses_panel], [], [], [], [])<br>
&gt; + PY_STDLIB_MOD([_decimal], [], [], [$LIBMPDEC_CFLAGS], [$LIBMPDEC_LDF=
LAGS])<br>
&gt; +-dnl PY_STDLIB_MOD([_dbm], [], [], [], [])<br>
&gt; ++PY_STDLIB_MOD([_dbm],<br>
&gt; ++=C2=A0 [test -n &quot;$with_dbmliborder&quot;], [test &quot;$have_db=
m&quot; !=3D &quot;no&quot;],<br>
&gt; ++=C2=A0 [$DBM_CFLAGS], [$DBM_LIBS])<br>
&gt; + PY_STDLIB_MOD([_gdbm],<br>
&gt; +=C2=A0 =C2=A0[test &quot;$have_gdbm_dbmliborder&quot; =3D yes], [test=
 &quot;$have_gdbm&quot; =3D yes],<br>
&gt; +=C2=A0 =C2=A0[$GDBM_CFLAGS], [$GDBM_LIBS])<br>
&gt; +diff --git a/<a href=3D"http://pyconfig.h.in" rel=3D"noreferrer" targ=
et=3D"_blank">pyconfig.h.in</a> b/<a href=3D"http://pyconfig.h.in" rel=3D"n=
oreferrer" target=3D"_blank">pyconfig.h.in</a><br>
&gt; +index 15933e75b1b07..b05ddd41c2bba 100644<br>
&gt; +--- a/<a href=3D"http://pyconfig.h.in" rel=3D"noreferrer" target=3D"_=
blank">pyconfig.h.in</a><br>
&gt; ++++ b/<a href=3D"http://pyconfig.h.in" rel=3D"noreferrer" target=3D"_=
blank">pyconfig.h.in</a><br>
&gt; +@@ -640,18 +640,12 @@<br>
&gt; + /* Define to 1 if you have the `dld&#39; library (-ldld). */<br>
&gt; + #undef HAVE_LIBDLD<br>
&gt; +<br>
&gt; +-/* Define to 1 if you have the `gdbm_compat&#39; library (-lgdbm_com=
pat). */<br>
&gt; +-#undef HAVE_LIBGDBM_COMPAT<br>
&gt; +-<br>
&gt; + /* Define to 1 if you have the `ieee&#39; library (-lieee). */<br>
&gt; + #undef HAVE_LIBIEEE<br>
&gt; +<br>
&gt; + /* Define to 1 if you have the &lt;libintl.h&gt; header file. */<br>
&gt; + #undef HAVE_LIBINTL_H<br>
&gt; +<br>
&gt; +-/* Define to 1 if you have the `ndbm&#39; library (-lndbm). */<br>
&gt; +-#undef HAVE_LIBNDBM<br>
&gt; +-<br>
&gt; + /* Define to build the readline module. */<br>
&gt; + #undef HAVE_LIBREADLINE<br>
&gt; +<br>
&gt; +diff --git a/setup.py b/setup.py<br>
&gt; +index 843ec35effe10..cc11dedee1b2e 100644<br>
&gt; +--- a/setup.py<br>
&gt; ++++ b/setup.py<br>
&gt; +@@ -1163,77 +1163,7 @@ def detect_crypt(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.addext(Extension(&#39;_crypt&#=
39;, [&#39;_cryptmodule.c&#39;]))<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0def detect_dbm_gdbm(self):<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Modules that provide persistent dictio=
nary-like semantics.=C2=A0 You will<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # probably want to arrange for at least =
one of them to be available on<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # your machine, though none are defined =
by default because of library<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # dependencies.=C2=A0 The Python module =
dbm/__init__.py provides an<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # implementation independent wrapper for=
 these; dbm/dumb.py provides<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # similar functionality (but slower of c=
ourse) implemented in Python.<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dbm_setup_debug =3D False=C2=A0 =C2=A0# =
verbose debug prints from this script?<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dbm_order =3D [&#39;gdbm&#39;]<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # libdb, gdbm and ndbm headers and libra=
ries<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 have_ndbm_h =3D sysconfig.get_config_var=
(&quot;HAVE_NDBM_H&quot;)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 have_gdbm_ndbm_h =3D sysconfig.get_confi=
g_var(&quot;HAVE_GDBM_NDBM_H&quot;)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 have_gdbm_dash_ndbm_h =3D sysconfig.get_=
config_var(&quot;HAVE_GDBM_DASH_NDBM_H&quot;)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 have_libndbm =3D sysconfig.get_config_va=
r(&quot;HAVE_LIBNDBM&quot;)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 have_libgdbm_compat =3D sysconfig.get_co=
nfig_var(&quot;HAVE_LIBGDBM_COMPAT&quot;)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 have_libdb =3D sysconfig.get_config_var(=
&quot;HAVE_LIBDB&quot;)<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # The standard Unix dbm module:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not CYGWIN:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 config_args =3D [arg.strip=
(&quot;&#39;&quot;)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for arg in sysconfig.get_config_var(&quot;CO=
NFIG_ARGS&quot;).split()]<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbm_args =3D [arg for arg =
in config_args<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if arg.startswith(&#39;--with-dbmliborder=3D&#39;)]<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if dbm_args:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbm_order =
=3D [arg.split(&#39;=3D&#39;)[-1] for arg in dbm_args][-1].split(&quot;:&qu=
ot;)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbm_order =
=3D &quot;gdbm:ndbm:bdb&quot;.split(&quot;:&quot;)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbmext =3D None<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for cand in dbm_order:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if cand =3D=
=3D &quot;ndbm&quot;:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if have_ndbm_h:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 # Some systems have -lndbm, others have -lgdbm_compat,<br=
>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 # others don&#39;t have either<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if have_libndbm:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ndbm_libs =3D [&#39;ndbm&#39;]<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 elif have_libgdbm_compat:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ndbm_libs =3D [&#39;gdbm_compat&#39;]<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 else:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ndbm_libs =3D []<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if dbm_setup_debug: print(&quot;building dbm using ndbm&q=
uot;)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 dbmext =3D Extension(<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;_dbm&#39;, [&#39;_dbmmodule.c&#39;],<b=
r>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 define_macros=3D[(&#39;USE_NDBM&#39;, None)=
],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libraries=3Dndbm_libs<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 )<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 break<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif cand =
=3D=3D &quot;gdbm&quot;:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 # dbm_open() is provided by libgdbm_compat, which wraps libgdbm<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if have_libgdbm_compat and (have_gdbm_ndbm_h or have_gdbm_dash_ndbm_h):=
<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if dbm_setup_debug: print(&quot;building dbm using gdbm&q=
uot;)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 dbmext =3D Extension(<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;_dbm&#39;, [&#39;_dbmmodule.c&#39;],<b=
r>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 define_macros=3D[(&#39;USE_GDBM_COMPAT&#39;=
, None)],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libraries=3D[&#39;gdbm_compat&#39;]<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 )<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 break<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif cand =
=3D=3D &quot;bdb&quot;:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if have_libdb:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if dbm_setup_debug: print(&quot;building dbm using bdb&qu=
ot;)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 dbmext =3D Extension(<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;_dbm&#39;, [&#39;_dbmmodule.c&#39;],<b=
r>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 define_macros=3D[(&#39;USE_BERKDB&#39;, Non=
e)],<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libraries=3D[&#39;db&#39;]<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 )<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 break<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if dbmext is not None:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.add(dbm=
ext)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.missing=
.append(&#39;_dbm&#39;)<br>
&gt; +-<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.addext(Extension(&#39;_dbm&#39;, [&=
#39;_dbmmodule.c&#39;]))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Anthony Baxter&#39;s gdbm module.=
=C2=A0 GNU dbm(3) will require -lgdbm:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.addext(Extension(&#39;_gdbm&#3=
9;, [&#39;_gdbmmodule.c&#39;]))<br>
&gt; +<br>
&gt; diff --git a/package/python3/0030-Add-an-option-to-disable-the-berkele=
ydb-module.patch b/package/python3/0030-Add-an-option-to-disable-the-berkel=
eydb-module.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 5fb436db59..0000000000<br>
&gt; --- a/package/python3/0030-Add-an-option-to-disable-the-berkeleydb-mod=
ule.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,30 +0,0 @@<br>
&gt; -From 67e9793d070ac5c8e83abbe95b9208533ffeadd0 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Bernd Kuhls &lt;<a href=3D"mailto:bernd.kuhls@t-online.de" targ=
et=3D"_blank">bernd.kuhls@t-online.de</a>&gt;<br>
&gt; -Date: Sat, 11 Apr 2020 22:01:40 +0200<br>
&gt; -Subject: [PATCH] Add an option to disable the berkeleydb module<br>
&gt; -<br>
&gt; -Signed-off-by: Bernd Kuhls &lt;<a href=3D"mailto:bernd.kuhls@t-online=
.de" target=3D"_blank">bernd.kuhls@t-online.de</a>&gt;<br>
&gt; ----<br>
&gt; - <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a> | 6 ++++++<br>
&gt; - 1 file changed, 6 insertions(+)<br>
&gt; -<br>
&gt; -diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
&gt; -index 841fd6732c..06c9a81f95 100644<br>
&gt; ---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; -+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; -@@ -4280,6 +4280,12 @@ if test &quot;$UUID&quot; =3D &quot;no&quot;; =
then<br>
&gt; -=C2=A0 =C2=A0 DISABLED_EXTENSIONS=3D&quot;${DISABLED_EXTENSIONS} _uui=
d&quot;<br>
&gt; - fi<br>
&gt; -<br>
&gt; -+AC_ARG_ENABLE(berkeleydb,<br>
&gt; -+=C2=A0 =C2=A0 AS_HELP_STRING([--disable-berkeleydb], [disable berkel=
eydb]),<br>
&gt; -+=C2=A0 =C2=A0 [ if test &quot;$enableval&quot; =3D &quot;no&quot;; t=
hen<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DISABLED_EXTENSIONS=3D&quot;${DISA=
BLED_EXTENSIONS} _dbm&quot;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 fi])<br>
&gt; -+<br>
&gt; - AC_SUBST(PYDOC)<br>
&gt; -<br>
&gt; - AC_ARG_ENABLE(pydoc,<br>
&gt; ---<br>
&gt; -2.34.1<br>
&gt; -<br>
&gt; diff --git a/package/python3/<a href=3D"http://python3.mk" rel=3D"nore=
ferrer" target=3D"_blank">python3.mk</a> b/package/python3/<a href=3D"http:=
//python3.mk" rel=3D"noreferrer" target=3D"_blank">python3.mk</a><br>
&gt; index b9c5054a21..8166d306c5 100644<br>
&gt; --- a/package/python3/<a href=3D"http://python3.mk" rel=3D"noreferrer"=
 target=3D"_blank">python3.mk</a><br>
&gt; +++ b/package/python3/<a href=3D"http://python3.mk" rel=3D"noreferrer"=
 target=3D"_blank">python3.mk</a><br>
&gt; @@ -72,7 +72,7 @@ endif<br>
&gt;=C2=A0 =C2=A0ifeq ($(BR2_PACKAGE_PYTHON3_BERKELEYDB),y)<br>
&gt;=C2=A0 =C2=A0PYTHON3_DEPENDENCIES +=3D berkeleydb<br>
&gt;=C2=A0 =C2=A0else<br>
&gt; -PYTHON3_CONF_OPTS +=3D --disable-berkeleydb<br>
&gt; +PYTHON3_CONF_ENV +=3D py_cv_module__dbm=3Dn/a<br>
&gt;=C2=A0 =C2=A0endif<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0ifeq ($(BR2_PACKAGE_PYTHON3_READLINE),y)<br>
</blockquote></div>

--000000000000c6455b060981974b--

--===============7816546641579051696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7816546641579051696==--
