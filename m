Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B5E2C3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 04:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5DDF605E4;
	Wed,  7 Aug 2024 04:54:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uvBzs7VcqS10; Wed,  7 Aug 2024 04:54:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25973605F8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25973605F8;
	Wed,  7 Aug 2024 04:54:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 03B201BF21A
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 04:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E495D404E3
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 04:54:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mxHgHrW5X40d for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 04:54:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com;
 envelope-from=softwarej@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 522DE404D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 522DE404D2
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 522DE404D2
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 04:54:15 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-699d8dc6744so236387b3.0
 for <buildroot@buildroot.org>; Tue, 06 Aug 2024 21:54:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723006454; x=1723611254;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oj7kzAaCJIHU3WCnOVhnNponE9/3DJSvNTHJvufDBUQ=;
 b=HtpaW5EVP+tNw5xm8L57h3gXu7o4DkQZW/xRojd5Qq8+n8sn7YC0/rbjjYbO9wFEpX
 mYskW/L9+aHrzuk+qrnDYLbXAHBy2jAp2Ytl8qe0zVnO3ihIwDJlrqDVLZFPLxb6zXww
 6LiYMPJ6BJgtj84YnnslptOmvG9SLzlpPdUqsJdvpSaJY7S/yeDoBKbFR9MAjTPJqU40
 PejNSu9RdlDwGx7fkiMnIX+/NDLj6wxHzHY9xzV7sXOqjUQ7QjRmjMGDiv6SDZ+gS8E3
 xI9Yn7E54XhA9rg3psoawHbaXVKn6WnWSmGZJSLmmdVSStFrdb13I+NM5MqUcjPczZ6r
 dQaw==
X-Gm-Message-State: AOJu0YwrFB4kY2k86nBxtAxpCz34zqHm9zJyPEvHYFLbSxJNXW7tMkRk
 KXmVxWvvBAhkwFA3gQ/g87W7643//nON25pYxhnegUTKQU+kviDBimd0l8UGxx7B02YljvcsqEj
 Bz+9STcnh551d1Kg/LvoCnk4BhOafYw==
X-Google-Smtp-Source: AGHT+IGnVUxso5cNWAHa1gVqXZXTurv2uQTip9GQ3StRMpBOs4P95pWaerbMDZoWGm2e/xxIIMGBvYTz0+CxzQEcJ8I=
X-Received: by 2002:a25:8487:0:b0:e0b:a699:bc9a with SMTP id
 3f1490d57ef6-e0e877882f7mr841148276.16.1723006454179; Tue, 06 Aug 2024
 21:54:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240807013442.1514937-2-salvador.joseluis@gmail.com>
 <874j7x2c1k.fsf@tarshish>
In-Reply-To: <874j7x2c1k.fsf@tarshish>
From: =?UTF-8?Q?Jos=C3=A9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>
Date: Wed, 7 Aug 2024 06:54:02 +0200
Message-ID: <CAH+XeQbv57h775JFt00UgzsUPMD7LNC9h3Rk9W9Zq=bD1g7y0w@mail.gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723006454; x=1723611254; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oj7kzAaCJIHU3WCnOVhnNponE9/3DJSvNTHJvufDBUQ=;
 b=aekENqgWq2IERLxwgUTqEP1PuGlNwK/hxv+Uvz9FWUs1NZDLlu1DtG1ggMHDzdKk0b
 VP0aUoGqQRgczmldlVpVV2B3A2AtniKQBUJGOCJ73DGPBMA/XKP5YbgIaPZplHn9Lwnx
 D754bYaxhcS+uGMAIGPnQNMUuZucYY7Xva7qlLOkQbqL+SSkDN8wn/t5kBheMd8RDYbz
 laZiF0eKUg/4k4lIlv8FJUHZyJEnam/XqIk35r2OVvhUZQxfHoBg84aW2mbouNcSzkpX
 XAg+WfZV6ojckFIBrEAUnoBmfUSXXlDA33CmBCY81TXaBhsRF2PHiFJRWrnyW2uBSKkJ
 mRFg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=aekENqgW
Subject: Re: [Buildroot] [PATCH 1/2] package/zfs: replace wip patch by
 upstream patch
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
Cc: Alexander Mukhin <alexander.i.mukhin@gmail.com>,
 Baruch Siach via buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============1890840529826583478=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1890840529826583478==
Content-Type: multipart/alternative; boundary="000000000000a5b3df061f10b375"

--000000000000a5b3df061f10b375
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Baruch,

You are right, AUTORECONF is not required.

I'm going to send a V2 PATCH with this fix. Thank you Baruch.

El mi=C3=A9, 7 ago 2024, 6:26, Baruch Siach <baruch@tkos.co.il> escribi=C3=
=B3:

> Hi Jos=C3=A9,
>
> On Wed, Aug 07 2024, Jos=C3=A9 Luis Salvador Rufo wrote:
> > Signed-off-by: Jos=C3=A9 Luis Salvador Rufo <salvador.joseluis@gmail.co=
m>
> > ---
> >  ...ll-fix-for-SEEK_DATA-SEEK_HOLE-tests.patch |  69 ++++++++
> >  ...s-ignore-if-SEEK_DATA-is-not-defined.patch | 162 ------------------
> >  package/zfs/zfs.mk                            |   2 +-
> >  3 files changed, 70 insertions(+), 163 deletions(-)
> >  create mode 100644
> package/zfs/0001-ZTS-small-fix-for-SEEK_DATA-SEEK_HOLE-tests.patch
> >  delete mode 100644
> package/zfs/0001-tests-cp_files-ignore-if-SEEK_DATA-is-not-defined.patch
> >
> > diff --git
> > a/package/zfs/0001-ZTS-small-fix-for-SEEK_DATA-SEEK_HOLE-tests.patch
> > b/package/zfs/0001-ZTS-small-fix-for-SEEK_DATA-SEEK_HOLE-tests.patch
> > new file mode 100644
> > index 0000000000..9a7a139a9e
> > --- /dev/null
> > +++ b/package/zfs/0001-ZTS-small-fix-for-SEEK_DATA-SEEK_HOLE-tests.patc=
h
> > @@ -0,0 +1,69 @@
> > +From 2ccefd4aff98cf355c7d13b3f92bb4d390dfa522 Mon Sep 17 00:00:00 2001
> > +From: Tino Reichardt <milky-zfs@mcmilk.de>
> > +Date: Sun, 4 Aug 2024 11:58:13 +0200
> > +Subject: [PATCH] ZTS: small fix for SEEK_DATA/SEEK_HOLE tests
> > +
> > +Some libc's like uClibc lag the proper definition of SEEK_DATA
> > +and SEEK_HOLE. Since we have only two files in ZTS which use
> > +these definitons, let's define them by hand:
> > +
> > +```
> > +#ifndef SEEK_DATA
> > +#define SEEK_DATA 3
> > +#endif
> > +#ifndef SEEK_HOLE
> > +#define SEEK_HOLE 4
> > +#endif
> > +```
> > +
> > +There should be no failures, because:
> > +- FreeBSD has support for SEEK_DATA/SEEK_HOLE since FreeBSD 8
> > +- Linux has it since Linux 3.1
> > +- the libc will submit the parameters unchanged to the kernel
> > +
> > +Signed-off-by: Tino Reichardt <milky-zfs@mcmilk.de>
> > +Upstream: https://github.com/openzfs/zfs/pull/16413
> > +---
> > + tests/zfs-tests/cmd/mmap_seek.c                       | 10 ++++++++++
> > + tests/zfs-tests/tests/functional/cp_files/seekflood.c |  7 +++++++
> > + 2 files changed, 17 insertions(+)
> > +
> > +diff --git a/tests/zfs-tests/cmd/mmap_seek.c
> b/tests/zfs-tests/cmd/mmap_seek.c
> > +index 7be92d109565..2d250554a13f 100644
> > +--- a/tests/zfs-tests/cmd/mmap_seek.c
> > ++++ b/tests/zfs-tests/cmd/mmap_seek.c
> > +@@ -35,6 +35,16 @@
> > + #include <linux/fs.h>
> > + #endif
> > +
> > ++/* some older uClibc's lack the defines, so we'll manually define the=
m
> */
> > ++#ifdef      __UCLIBC__
> > ++#ifndef     SEEK_DATA
> > ++#define     SEEK_DATA 3
> > ++#endif
> > ++#ifndef     SEEK_HOLE
> > ++#define     SEEK_HOLE 4
> > ++#endif
> > ++#endif
> > ++
> > + static void
> > + seek_data(int fd, off_t offset, off_t expected)
> > + {
> > +diff --git a/tests/zfs-tests/tests/functional/cp_files/seekflood.c
> > b/tests/zfs-tests/tests/functional/cp_files/seekflood.c
> > +index 02c2c8e6eca5..f832db85970d 100644
> > +--- a/tests/zfs-tests/tests/functional/cp_files/seekflood.c
> > ++++ b/tests/zfs-tests/tests/functional/cp_files/seekflood.c
> > +@@ -36,6 +36,13 @@
> > + #include <sys/stat.h>
> > + #include <sys/wait.h>
> > +
> > ++/* some older uClibc's lack the defines, so we'll manually define the=
m
> */
> > ++#ifdef      __UCLIBC__
> > ++#ifndef     SEEK_DATA
> > ++#define     SEEK_DATA 3
> > ++#endif
> > ++#endif
> > ++
> > + #define     DATASIZE        (4096)
> > + char data[DATASIZE];
> > +
> > diff --git
> >
> a/package/zfs/0001-tests-cp_files-ignore-if-SEEK_DATA-is-not-defined.patc=
h
> >
> b/package/zfs/0001-tests-cp_files-ignore-if-SEEK_DATA-is-not-defined.patc=
h
> > deleted file mode 100644
> > index f47c615d10..0000000000
> > ---
> a/package/zfs/0001-tests-cp_files-ignore-if-SEEK_DATA-is-not-defined.patc=
h
> > +++ /dev/null
> > @@ -1,162 +0,0 @@
> > -From 93e7f8889072047276da11fe6a525d3f0ea16205 Mon Sep 17 00:00:00 2001
> > -From: =3D?UTF-8?q?Jos=3DC3=3DA9=3D20Luis=3D20Salvador=3D20Rufo?=3D
> > - <salvador.joseluis@gmail.com>
> > -Date: Sat, 11 May 2024 22:40:12 +0200
> > -Subject: [PATCH] tests/cp_files: ignore if SEEK_DATA is not defined
> > -MIME-Version: 1.0
> > -Content-Type: text/plain; charset=3DUTF-8
> > -Content-Transfer-Encoding: 8bit
> > -
> > -Not all C libraries support SEEK_DATA (e.g., uClibc). Skip the test ca=
se
> > -cp_files if SEEK_DATA is not defined.
> > -
> > -Signed-off-by: Jos=C3=A9 Luis Salvador Rufo <salvador.joseluis@gmail.c=
om>
> > -Upstream: https://github.com/openzfs/zfs/pull/16169
> > ----
> > - config/user-unistd.m4                  | 24 ++++++++++++++++++++++++
> > - config/user.m4                         |  1 +
> > - config/zfs-build.m4                    |  1 +
> > - tests/test-runner/bin/zts-report.py.in |  1 +
> > - tests/zfs-tests/Makefile.am            |  2 ++
> > - tests/zfs-tests/cmd/Makefile.am        |  6 +++++-
> > - tests/zfs-tests/tests/Makefile.am      | 14 +++++++++-----
> > - 7 files changed, 43 insertions(+), 6 deletions(-)
> > - create mode 100644 config/user-unistd.m4
> > -
> > -diff --git a/config/user-unistd.m4 b/config/user-unistd.m4
> > -new file mode 100644
> > -index 000000000..302bc0bde
> > ---- /dev/null
> > -+++ b/config/user-unistd.m4
> > -@@ -0,0 +1,24 @@
> > -+dnl #
> > -+dnl # Check for SEEK_DATA - only used for cp_files/seekflood test cas=
e.
> > -+dnl #
> > -+AC_DEFUN([ZFS_AC_CONFIG_USER_UNISTD_SEEK_DATA], [
> > -+    AC_MSG_CHECKING(whether host toolchain supports SEEK_DATA)
> > -+
> > -+    AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
> > -+            #ifndef _GNU_SOURCE
> > -+            #define _GNU_SOURCE
> > -+            #endif
> > -+            #include <unistd.h>
> > -+            #if defined(SEEK_DATA)
> > -+                    int ok;
> > -+            #else
> > -+                    error fail
> > -+            #endif
> > -+    ]])], [
> > -+            user_unistd_seek_data=3Dyes
> > -+            AC_MSG_RESULT([yes])
> > -+    ], [
> > -+            user_unistd_seek_data=3Dno
> > -+            AC_MSG_RESULT([no])
> > -+    ])
> > -+])
> > -diff --git a/config/user.m4 b/config/user.m4
> > -index 6ec27a5b2..2326a44be 100644
> > ---- a/config/user.m4
> > -+++ b/config/user.m4
> > -@@ -23,6 +23,7 @@ AC_DEFUN([ZFS_AC_CONFIG_USER], [
> > -     ZFS_AC_CONFIG_USER_LIBAIO
> > -     ZFS_AC_CONFIG_USER_LIBATOMIC
> > -     ZFS_AC_CONFIG_USER_LIBFETCH
> > -+    ZFS_AC_CONFIG_USER_UNISTD_SEEK_DATA
> > -     ZFS_AC_CONFIG_USER_AIO_H
> > -     ZFS_AC_CONFIG_USER_CLOCK_GETTIME
> > -     ZFS_AC_CONFIG_USER_PAM
> > -diff --git a/config/zfs-build.m4 b/config/zfs-build.m4
> > -index bb5a85d81..578692676 100644
> > ---- a/config/zfs-build.m4
> > -+++ b/config/zfs-build.m4
> > -@@ -294,6 +294,7 @@ AC_DEFUN([ZFS_AC_CONFIG], [
> > -         [test "x$qatsrc" !=3D x ])
> > -     AM_CONDITIONAL([WANT_DEVNAME2DEVID], [test "x$user_libudev" =3D x=
yes
> ])
> > -     AM_CONDITIONAL([WANT_MMAP_LIBAIO], [test "x$user_libaio" =3D xyes=
 ])
> > -+    AM_CONDITIONAL([WANT_UNISTD_SEEK_DATA], [test
> "x$user_unistd_seek_data" =3D xyes ])
> > -     AM_CONDITIONAL([PAM_ZFS_ENABLED], [test "x$enable_pam" =3D xyes])
> > - ])
> > -
> > -diff --git a/tests/test-runner/bin/zts-report.py.in
> b/tests/test-runner/bin/zts-report.py.in
> > -index ecc50f487..3a00345ed 100755
> > ---- a/tests/test-runner/bin/zts-report.py.in
> > -+++ b/tests/test-runner/bin/zts-report.py.in
> > -@@ -162,6 +162,7 @@ known =3D {
> > -         ['FAIL', rewind_reason],
> > -     'cli_user/misc/zfs_share_001_neg': ['SKIP', na_reason],
> > -     'cli_user/misc/zfs_unshare_001_neg': ['SKIP', na_reason],
> > -+    'cp_files/cp_stress': ['SKIP', 16169],
> > -     'pool_checkpoint/checkpoint_discard_busy': ['SKIP', 12053],
> > -     'privilege/setup': ['SKIP', na_reason],
> > -     'refreserv/refreserv_004_pos': ['FAIL', known_reason],
> > -diff --git a/tests/zfs-tests/Makefile.am b/tests/zfs-tests/Makefile.am
> > -index 3dd1a6452..8ae790057 100644
> > ---- a/tests/zfs-tests/Makefile.am
> > -+++ b/tests/zfs-tests/Makefile.am
> > -@@ -13,8 +13,10 @@ scripts_zfs_tests_functional_hkdf_PROGRAMS =3D
> %D%/tests/functional/hkdf/hkdf_test
> > - %C%_tests_functional_hkdf_hkdf_test_LDADD =3D \
> > -     libzpool.la
> > -
> > -+if WANT_UNISTD_SEEK_DATA
> > - scripts_zfs_tests_functional_cp_filesdir =3D
> $(datadir)/$(PACKAGE)/zfs-tests/tests/functional/cp_files
> > - scripts_zfs_tests_functional_cp_files_PROGRAMS =3D
> %D%/tests/functional/cp_files/seekflood
> > -+endif
> > -
> > - if BUILD_LINUX
> > - scripts_zfs_tests_functional_tmpfiledir =3D
> $(datadir)/$(PACKAGE)/zfs-tests/tests/functional/tmpfile
> > -diff --git a/tests/zfs-tests/cmd/Makefile.am
> b/tests/zfs-tests/cmd/Makefile.am
> > -index 23848a82f..69bba3039 100644
> > ---- a/tests/zfs-tests/cmd/Makefile.am
> > -+++ b/tests/zfs-tests/cmd/Makefile.am
> > -@@ -5,7 +5,6 @@ scripts_zfs_tests_bin_PROGRAMS  =3D %D%/chg_usr_exec
> > - scripts_zfs_tests_bin_PROGRAMS +=3D %D%/clonefile
> > - scripts_zfs_tests_bin_PROGRAMS +=3D %D%/clone_mmap_cached
> > - scripts_zfs_tests_bin_PROGRAMS +=3D %D%/clone_mmap_write
> > --scripts_zfs_tests_bin_PROGRAMS +=3D %D%/cp_files
> > - scripts_zfs_tests_bin_PROGRAMS +=3D %D%/ctime
> > - scripts_zfs_tests_bin_PROGRAMS +=3D %D%/dir_rd_update
> > - scripts_zfs_tests_bin_PROGRAMS +=3D %D%/dosmode_readonly_write
> > -@@ -16,6 +15,11 @@ scripts_zfs_tests_bin_PROGRAMS +=3D %D%/truncate_te=
st
> > - scripts_zfs_tests_bin_PROGRAMS +=3D %D%/zfs_diff-socket
> > -
> > -
> > -+if WANT_UNISTD_SEEK_DATA
> > -+scripts_zfs_tests_bin_PROGRAMS +=3D %D%/cp_files
> > -+endif
> > -+
> > -+
> > - scripts_zfs_tests_bin_PROGRAMS +=3D %D%/badsend
> > - %C%_badsend_LDADD =3D \
> > -     libzfs_core.la \
> > -diff --git a/tests/zfs-tests/tests/Makefile.am
> b/tests/zfs-tests/tests/Makefile.am
> > -index cc66d762f..1e9f06a7e 100644
> > ---- a/tests/zfs-tests/tests/Makefile.am
> > -+++ b/tests/zfs-tests/tests/Makefile.am
> > -@@ -1394,11 +1394,6 @@ nobase_dist_datadir_zfs_tests_tests_SCRIPTS +=
=3D \
> > -     functional/compression/l2arc_encrypted.ksh \
> > -     functional/compression/l2arc_encrypted_no_compressed_arc.ksh \
> > -     functional/compression/setup.ksh \
> > --    functional/cp_files/cleanup.ksh \
> > --    functional/cp_files/cp_files_001_pos.ksh \
> > --    functional/cp_files/cp_files_002_pos.ksh \
> > --    functional/cp_files/cp_stress.ksh \
> > --    functional/cp_files/setup.ksh \
> > -     functional/crtime/cleanup.ksh \
> > -     functional/crtime/crtime_001_pos.ksh \
> > -     functional/crtime/setup.ksh \
> > -@@ -2108,3 +2103,12 @@ nobase_dist_datadir_zfs_tests_tests_SCRIPTS +=
=3D \
> > -     functional/idmap_mount/idmap_mount_003.ksh \
> > -     functional/idmap_mount/idmap_mount_004.ksh \
> > -     functional/idmap_mount/idmap_mount_005.ksh
> > -+
> > -+if WANT_UNISTD_SEEK_DATA
> > -+nobase_dist_datadir_zfs_tests_tests_SCRIPTS +=3D \
> > -+    functional/cp_files/cleanup.ksh \
> > -+    functional/cp_files/cp_files_001_pos.ksh \
> > -+    functional/cp_files/cp_files_002_pos.ksh \
> > -+    functional/cp_files/cp_stress.ksh \
> > -+    functional/cp_files/setup.ksh
> > -+endif
> > ---
> > -2.45.2
> > -
> > diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
> > index e0fa392670..32c4c07838 100644
> > --- a/package/zfs/zfs.mk
> > +++ b/package/zfs/zfs.mk
> > @@ -12,7 +12,7 @@ ZFS_LICENSE_FILES =3D LICENSE COPYRIGHT
> >  ZFS_CPE_ID_VENDOR =3D openzfs
> >  ZFS_CPE_ID_PRODUCT =3D openzfs
> >
> > -# 0001-tests-cp_files-ignore-if-SEEK_DATA-is-not-defined.patch
> > +# 0001-ZTS-small-fix-for-SEEK_DATA-SEEK_HOLE-tests.patch
> >  ZFS_AUTORECONF =3D YES
>
> The new patch doesn't touch .m4 or .am files. Can we just drop
> AUTORECONF?
>
> baruch
>
> >
> >  ZFS_DEPENDENCIES =3D libaio openssl udev util-linux zlib libcurl linux
>
> --
>                                                      ~. .~   Tk Open
> Systems
> =3D}------------------------------------------------ooO--U--Ooo----------=
--{=3D
>    - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
>

--000000000000a5b3df061f10b375
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><p dir=3D"ltr">Hi Baruch,</p>
<p dir=3D"ltr">You are right, AUTORECONF is not required.</p>
<p dir=3D"ltr">I&#39;m going to send a V2 PATCH with this fix. Thank you Ba=
ruch.</p></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">El mi=C3=A9, 7 ago 2024, 6:26, Baruch Siach &lt;<a href=3D"mailto:=
baruch@tkos.co.il">baruch@tkos.co.il</a>&gt; escribi=C3=B3:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi Jos=C3=A9,<br>
<br>
On Wed, Aug 07 2024, Jos=C3=A9 Luis Salvador Rufo wrote:<br>
&gt; Signed-off-by: Jos=C3=A9 Luis Salvador Rufo &lt;<a href=3D"mailto:salv=
ador.joseluis@gmail.com" target=3D"_blank" rel=3D"noreferrer">salvador.jose=
luis@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...ll-fix-for-SEEK_DATA-SEEK_HOLE-tests.patch |=C2=A0 69 +++++++=
+<br>
&gt;=C2=A0 ...s-ignore-if-SEEK_DATA-is-not-defined.patch | 162 ------------=
------<br>
&gt;=C2=A0 package/zfs/<a href=3D"http://zfs.mk" rel=3D"noreferrer noreferr=
er" target=3D"_blank">zfs.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<=
br>
&gt;=C2=A0 3 files changed, 70 insertions(+), 163 deletions(-)<br>
&gt;=C2=A0 create mode 100644 package/zfs/0001-ZTS-small-fix-for-SEEK_DATA-=
SEEK_HOLE-tests.patch<br>
&gt;=C2=A0 delete mode 100644 package/zfs/0001-tests-cp_files-ignore-if-SEE=
K_DATA-is-not-defined.patch<br>
&gt;<br>
&gt; diff --git<br>
&gt; a/package/zfs/0001-ZTS-small-fix-for-SEEK_DATA-SEEK_HOLE-tests.patch<b=
r>
&gt; b/package/zfs/0001-ZTS-small-fix-for-SEEK_DATA-SEEK_HOLE-tests.patch<b=
r>
&gt; new file mode 100644<br>
&gt; index 0000000000..9a7a139a9e<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/zfs/0001-ZTS-small-fix-for-SEEK_DATA-SEEK_HOLE-tests.pat=
ch<br>
&gt; @@ -0,0 +1,69 @@<br>
&gt; +From 2ccefd4aff98cf355c7d13b3f92bb4d390dfa522 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Tino Reichardt &lt;<a href=3D"mailto:milky-zfs@mcmilk.de" targe=
t=3D"_blank" rel=3D"noreferrer">milky-zfs@mcmilk.de</a>&gt;<br>
&gt; +Date: Sun, 4 Aug 2024 11:58:13 +0200<br>
&gt; +Subject: [PATCH] ZTS: small fix for SEEK_DATA/SEEK_HOLE tests<br>
&gt; +<br>
&gt; +Some libc&#39;s like uClibc lag the proper definition of SEEK_DATA<br=
>
&gt; +and SEEK_HOLE. Since we have only two files in ZTS which use<br>
&gt; +these definitons, let&#39;s define them by hand:<br>
&gt; +<br>
&gt; +```<br>
&gt; +#ifndef SEEK_DATA<br>
&gt; +#define SEEK_DATA 3<br>
&gt; +#endif<br>
&gt; +#ifndef SEEK_HOLE<br>
&gt; +#define SEEK_HOLE 4<br>
&gt; +#endif<br>
&gt; +```<br>
&gt; +<br>
&gt; +There should be no failures, because:<br>
&gt; +- FreeBSD has support for SEEK_DATA/SEEK_HOLE since FreeBSD 8<br>
&gt; +- Linux has it since Linux 3.1<br>
&gt; +- the libc will submit the parameters unchanged to the kernel<br>
&gt; +<br>
&gt; +Signed-off-by: Tino Reichardt &lt;<a href=3D"mailto:milky-zfs@mcmilk.=
de" target=3D"_blank" rel=3D"noreferrer">milky-zfs@mcmilk.de</a>&gt;<br>
&gt; +Upstream: <a href=3D"https://github.com/openzfs/zfs/pull/16413" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/openzfs/zfs=
/pull/16413</a><br>
&gt; +---<br>
&gt; + tests/zfs-tests/cmd/mmap_seek.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 ++++++++++<br>
&gt; + tests/zfs-tests/tests/functional/cp_files/seekflood.c |=C2=A0 7 ++++=
+++<br>
&gt; + 2 files changed, 17 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/tests/zfs-tests/cmd/mmap_seek.c b/tests/zfs-tests/cmd/mm=
ap_seek.c<br>
&gt; +index 7be92d109565..2d250554a13f 100644<br>
&gt; +--- a/tests/zfs-tests/cmd/mmap_seek.c<br>
&gt; ++++ b/tests/zfs-tests/cmd/mmap_seek.c<br>
&gt; +@@ -35,6 +35,16 @@<br>
&gt; + #include &lt;linux/fs.h&gt;<br>
&gt; + #endif<br>
&gt; + <br>
&gt; ++/* some older uClibc&#39;s lack the defines, so we&#39;ll manually d=
efine them */<br>
&gt; ++#ifdef=C2=A0 =C2=A0 =C2=A0 __UCLIBC__<br>
&gt; ++#ifndef=C2=A0 =C2=A0 =C2=A0SEEK_DATA<br>
&gt; ++#define=C2=A0 =C2=A0 =C2=A0SEEK_DATA 3<br>
&gt; ++#endif<br>
&gt; ++#ifndef=C2=A0 =C2=A0 =C2=A0SEEK_HOLE<br>
&gt; ++#define=C2=A0 =C2=A0 =C2=A0SEEK_HOLE 4<br>
&gt; ++#endif<br>
&gt; ++#endif<br>
&gt; ++<br>
&gt; + static void<br>
&gt; + seek_data(int fd, off_t offset, off_t expected)<br>
&gt; + {<br>
&gt; +diff --git a/tests/zfs-tests/tests/functional/cp_files/seekflood.c<br=
>
&gt; b/tests/zfs-tests/tests/functional/cp_files/seekflood.c<br>
&gt; +index 02c2c8e6eca5..f832db85970d 100644<br>
&gt; +--- a/tests/zfs-tests/tests/functional/cp_files/seekflood.c<br>
&gt; ++++ b/tests/zfs-tests/tests/functional/cp_files/seekflood.c<br>
&gt; +@@ -36,6 +36,13 @@<br>
&gt; + #include &lt;sys/stat.h&gt;<br>
&gt; + #include &lt;sys/wait.h&gt;<br>
&gt; + <br>
&gt; ++/* some older uClibc&#39;s lack the defines, so we&#39;ll manually d=
efine them */<br>
&gt; ++#ifdef=C2=A0 =C2=A0 =C2=A0 __UCLIBC__<br>
&gt; ++#ifndef=C2=A0 =C2=A0 =C2=A0SEEK_DATA<br>
&gt; ++#define=C2=A0 =C2=A0 =C2=A0SEEK_DATA 3<br>
&gt; ++#endif<br>
&gt; ++#endif<br>
&gt; ++<br>
&gt; + #define=C2=A0 =C2=A0 =C2=A0DATASIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 (4096=
)<br>
&gt; + char data[DATASIZE];<br>
&gt; + <br>
&gt; diff --git<br>
&gt; a/package/zfs/0001-tests-cp_files-ignore-if-SEEK_DATA-is-not-defined.p=
atch<br>
&gt; b/package/zfs/0001-tests-cp_files-ignore-if-SEEK_DATA-is-not-defined.p=
atch<br>
&gt; deleted file mode 100644<br>
&gt; index f47c615d10..0000000000<br>
&gt; --- a/package/zfs/0001-tests-cp_files-ignore-if-SEEK_DATA-is-not-defin=
ed.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,162 +0,0 @@<br>
&gt; -From 93e7f8889072047276da11fe6a525d3f0ea16205 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: =3D?UTF-8?q?Jos=3DC3=3DA9=3D20Luis=3D20Salvador=3D20Rufo?=3D<br=
>
&gt; - &lt;<a href=3D"mailto:salvador.joseluis@gmail.com" target=3D"_blank"=
 rel=3D"noreferrer">salvador.joseluis@gmail.com</a>&gt;<br>
&gt; -Date: Sat, 11 May 2024 22:40:12 +0200<br>
&gt; -Subject: [PATCH] tests/cp_files: ignore if SEEK_DATA is not defined<b=
r>
&gt; -MIME-Version: 1.0<br>
&gt; -Content-Type: text/plain; charset=3DUTF-8<br>
&gt; -Content-Transfer-Encoding: 8bit<br>
&gt; -<br>
&gt; -Not all C libraries support SEEK_DATA (e.g., uClibc). Skip the test c=
ase<br>
&gt; -cp_files if SEEK_DATA is not defined.<br>
&gt; -<br>
&gt; -Signed-off-by: Jos=C3=A9 Luis Salvador Rufo &lt;<a href=3D"mailto:sal=
vador.joseluis@gmail.com" target=3D"_blank" rel=3D"noreferrer">salvador.jos=
eluis@gmail.com</a>&gt;<br>
&gt; -Upstream: <a href=3D"https://github.com/openzfs/zfs/pull/16169" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/openzfs/zfs=
/pull/16169</a><br>
&gt; ----<br>
&gt; - config/user-unistd.m4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 24 ++++++++++++++++++++++++<br>
&gt; - config/user.m4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; - config/zfs-build.m4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; - tests/test-runner/bin/<a href=3D"http://zts-report.py.in" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">zts-report.py.in</a> |=C2=A0 1 +<br>
&gt; - tests/zfs-tests/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 2 ++<br>
&gt; - tests/zfs-tests/cmd/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6=
 +++++-<br>
&gt; - tests/zfs-tests/tests/Makefile.am=C2=A0 =C2=A0 =C2=A0 | 14 +++++++++=
-----<br>
&gt; - 7 files changed, 43 insertions(+), 6 deletions(-)<br>
&gt; - create mode 100644 config/user-unistd.m4<br>
&gt; -<br>
&gt; -diff --git a/config/user-unistd.m4 b/config/user-unistd.m4<br>
&gt; -new file mode 100644<br>
&gt; -index 000000000..302bc0bde<br>
&gt; ---- /dev/null<br>
&gt; -+++ b/config/user-unistd.m4<br>
&gt; -@@ -0,0 +1,24 @@<br>
&gt; -+dnl #<br>
&gt; -+dnl # Check for SEEK_DATA - only used for cp_files/seekflood test ca=
se.<br>
&gt; -+dnl #<br>
&gt; -+AC_DEFUN([ZFS_AC_CONFIG_USER_UNISTD_SEEK_DATA], [<br>
&gt; -+=C2=A0 =C2=A0 AC_MSG_CHECKING(whether host toolchain supports SEEK_D=
ATA)<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 AC_COMPILE_IFELSE([AC_LANG_SOURCE([[<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #ifndef _GNU_SOURCE<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #define _GNU_SOURCE<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #endif<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #include &lt;unistd.h&gt;<=
br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #if defined(SEEK_DATA)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 int ok;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #else<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 error fail<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #endif<br>
&gt; -+=C2=A0 =C2=A0 ]])], [<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 user_unistd_seek_data=3Dye=
s<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT([yes])<br>
&gt; -+=C2=A0 =C2=A0 ], [<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 user_unistd_seek_data=3Dno=
<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT([no])<br>
&gt; -+=C2=A0 =C2=A0 ])<br>
&gt; -+])<br>
&gt; -diff --git a/config/user.m4 b/config/user.m4<br>
&gt; -index 6ec27a5b2..2326a44be 100644<br>
&gt; ---- a/config/user.m4<br>
&gt; -+++ b/config/user.m4<br>
&gt; -@@ -23,6 +23,7 @@ AC_DEFUN([ZFS_AC_CONFIG_USER], [<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ZFS_AC_CONFIG_USER_LIBAIO<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ZFS_AC_CONFIG_USER_LIBATOMIC<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ZFS_AC_CONFIG_USER_LIBFETCH<br>
&gt; -+=C2=A0 =C2=A0 ZFS_AC_CONFIG_USER_UNISTD_SEEK_DATA<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ZFS_AC_CONFIG_USER_AIO_H<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ZFS_AC_CONFIG_USER_CLOCK_GETTIME<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ZFS_AC_CONFIG_USER_PAM<br>
&gt; -diff --git a/config/zfs-build.m4 b/config/zfs-build.m4<br>
&gt; -index bb5a85d81..578692676 100644<br>
&gt; ---- a/config/zfs-build.m4<br>
&gt; -+++ b/config/zfs-build.m4<br>
&gt; -@@ -294,6 +294,7 @@ AC_DEFUN([ZFS_AC_CONFIG], [<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[test &quot;x$qatsrc&quot; !=3D x ]=
)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0AM_CONDITIONAL([WANT_DEVNAME2DEVID], [test &quot;=
x$user_libudev&quot; =3D xyes ])<br>
&gt; -=C2=A0 =C2=A0 =C2=A0AM_CONDITIONAL([WANT_MMAP_LIBAIO], [test &quot;x$=
user_libaio&quot; =3D xyes ])<br>
&gt; -+=C2=A0 =C2=A0 AM_CONDITIONAL([WANT_UNISTD_SEEK_DATA], [test &quot;x$=
user_unistd_seek_data&quot; =3D xyes ])<br>
&gt; -=C2=A0 =C2=A0 =C2=A0AM_CONDITIONAL([PAM_ZFS_ENABLED], [test &quot;x$e=
nable_pam&quot; =3D xyes])<br>
&gt; - ])<br>
&gt; - <br>
&gt; -diff --git a/tests/test-runner/bin/<a href=3D"http://zts-report.py.in=
" rel=3D"noreferrer noreferrer" target=3D"_blank">zts-report.py.in</a> b/te=
sts/test-runner/bin/<a href=3D"http://zts-report.py.in" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">zts-report.py.in</a><br>
&gt; -index ecc50f487..3a00345ed 100755<br>
&gt; ---- a/tests/test-runner/bin/<a href=3D"http://zts-report.py.in" rel=
=3D"noreferrer noreferrer" target=3D"_blank">zts-report.py.in</a><br>
&gt; -+++ b/tests/test-runner/bin/<a href=3D"http://zts-report.py.in" rel=
=3D"noreferrer noreferrer" target=3D"_blank">zts-report.py.in</a><br>
&gt; -@@ -162,6 +162,7 @@ known =3D {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;FAIL&#39;, rewind_reason],<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0&#39;cli_user/misc/zfs_share_001_neg&#39;: [&#39;=
SKIP&#39;, na_reason],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0&#39;cli_user/misc/zfs_unshare_001_neg&#39;: [&#3=
9;SKIP&#39;, na_reason],<br>
&gt; -+=C2=A0 =C2=A0 &#39;cp_files/cp_stress&#39;: [&#39;SKIP&#39;, 16169],=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0&#39;pool_checkpoint/checkpoint_discard_busy&#39;=
: [&#39;SKIP&#39;, 12053],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0&#39;privilege/setup&#39;: [&#39;SKIP&#39;, na_re=
ason],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0&#39;refreserv/refreserv_004_pos&#39;: [&#39;FAIL=
&#39;, known_reason],<br>
&gt; -diff --git a/tests/zfs-tests/Makefile.am b/tests/zfs-tests/Makefile.a=
m<br>
&gt; -index 3dd1a6452..8ae790057 100644<br>
&gt; ---- a/tests/zfs-tests/Makefile.am<br>
&gt; -+++ b/tests/zfs-tests/Makefile.am<br>
&gt; -@@ -13,8 +13,10 @@ scripts_zfs_tests_functional_hkdf_PROGRAMS =3D %D%=
/tests/functional/hkdf/hkdf_test<br>
&gt; - %C%_tests_functional_hkdf_hkdf_test_LDADD =3D \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0<a href=3D"http://libzpool.la" rel=3D"noreferrer =
noreferrer" target=3D"_blank">libzpool.la</a><br>
&gt; - <br>
&gt; -+if WANT_UNISTD_SEEK_DATA<br>
&gt; - scripts_zfs_tests_functional_cp_filesdir =3D $(datadir)/$(PACKAGE)/z=
fs-tests/tests/functional/cp_files<br>
&gt; - scripts_zfs_tests_functional_cp_files_PROGRAMS =3D %D%/tests/functio=
nal/cp_files/seekflood<br>
&gt; -+endif<br>
&gt; - <br>
&gt; - if BUILD_LINUX<br>
&gt; - scripts_zfs_tests_functional_tmpfiledir =3D $(datadir)/$(PACKAGE)/zf=
s-tests/tests/functional/tmpfile<br>
&gt; -diff --git a/tests/zfs-tests/cmd/Makefile.am b/tests/zfs-tests/cmd/Ma=
kefile.am<br>
&gt; -index 23848a82f..69bba3039 100644<br>
&gt; ---- a/tests/zfs-tests/cmd/Makefile.am<br>
&gt; -+++ b/tests/zfs-tests/cmd/Makefile.am<br>
&gt; -@@ -5,7 +5,6 @@ scripts_zfs_tests_bin_PROGRAMS=C2=A0 =3D %D%/chg_usr_=
exec<br>
&gt; - scripts_zfs_tests_bin_PROGRAMS +=3D %D%/clonefile<br>
&gt; - scripts_zfs_tests_bin_PROGRAMS +=3D %D%/clone_mmap_cached<br>
&gt; - scripts_zfs_tests_bin_PROGRAMS +=3D %D%/clone_mmap_write<br>
&gt; --scripts_zfs_tests_bin_PROGRAMS +=3D %D%/cp_files<br>
&gt; - scripts_zfs_tests_bin_PROGRAMS +=3D %D%/ctime<br>
&gt; - scripts_zfs_tests_bin_PROGRAMS +=3D %D%/dir_rd_update<br>
&gt; - scripts_zfs_tests_bin_PROGRAMS +=3D %D%/dosmode_readonly_write<br>
&gt; -@@ -16,6 +15,11 @@ scripts_zfs_tests_bin_PROGRAMS +=3D %D%/truncate_t=
est<br>
&gt; - scripts_zfs_tests_bin_PROGRAMS +=3D %D%/zfs_diff-socket<br>
&gt; - <br>
&gt; - <br>
&gt; -+if WANT_UNISTD_SEEK_DATA<br>
&gt; -+scripts_zfs_tests_bin_PROGRAMS +=3D %D%/cp_files<br>
&gt; -+endif<br>
&gt; -+<br>
&gt; -+<br>
&gt; - scripts_zfs_tests_bin_PROGRAMS +=3D %D%/badsend<br>
&gt; - %C%_badsend_LDADD =3D \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0<a href=3D"http://libzfs_core.la" rel=3D"noreferr=
er noreferrer" target=3D"_blank">libzfs_core.la</a> \<br>
&gt; -diff --git a/tests/zfs-tests/tests/Makefile.am b/tests/zfs-tests/test=
s/Makefile.am<br>
&gt; -index cc66d762f..1e9f06a7e 100644<br>
&gt; ---- a/tests/zfs-tests/tests/Makefile.am<br>
&gt; -+++ b/tests/zfs-tests/tests/Makefile.am<br>
&gt; -@@ -1394,11 +1394,6 @@ nobase_dist_datadir_zfs_tests_tests_SCRIPTS +=
=3D \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0functional/compression/l2arc_encrypted.ksh \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0functional/compression/l2arc_encrypted_no_compres=
sed_arc.ksh \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0functional/compression/setup.ksh \<br>
&gt; --=C2=A0 =C2=A0 functional/cp_files/cleanup.ksh \<br>
&gt; --=C2=A0 =C2=A0 functional/cp_files/cp_files_001_pos.ksh \<br>
&gt; --=C2=A0 =C2=A0 functional/cp_files/cp_files_002_pos.ksh \<br>
&gt; --=C2=A0 =C2=A0 functional/cp_files/cp_stress.ksh \<br>
&gt; --=C2=A0 =C2=A0 functional/cp_files/setup.ksh \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0functional/crtime/cleanup.ksh \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0functional/crtime/crtime_001_pos.ksh \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0functional/crtime/setup.ksh \<br>
&gt; -@@ -2108,3 +2103,12 @@ nobase_dist_datadir_zfs_tests_tests_SCRIPTS +=
=3D \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0functional/idmap_mount/idmap_mount_003.ksh \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0functional/idmap_mount/idmap_mount_004.ksh \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0functional/idmap_mount/idmap_mount_005.ksh<br>
&gt; -+<br>
&gt; -+if WANT_UNISTD_SEEK_DATA<br>
&gt; -+nobase_dist_datadir_zfs_tests_tests_SCRIPTS +=3D \<br>
&gt; -+=C2=A0 =C2=A0 functional/cp_files/cleanup.ksh \<br>
&gt; -+=C2=A0 =C2=A0 functional/cp_files/cp_files_001_pos.ksh \<br>
&gt; -+=C2=A0 =C2=A0 functional/cp_files/cp_files_002_pos.ksh \<br>
&gt; -+=C2=A0 =C2=A0 functional/cp_files/cp_stress.ksh \<br>
&gt; -+=C2=A0 =C2=A0 functional/cp_files/setup.ksh<br>
&gt; -+endif<br>
&gt; --- <br>
&gt; -2.45.2<br>
&gt; -<br>
&gt; diff --git a/package/zfs/<a href=3D"http://zfs.mk" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">zfs.mk</a> b/package/zfs/<a href=3D"http://zfs=
.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">zfs.mk</a><br>
&gt; index e0fa392670..32c4c07838 100644<br>
&gt; --- a/package/zfs/<a href=3D"http://zfs.mk" rel=3D"noreferrer noreferr=
er" target=3D"_blank">zfs.mk</a><br>
&gt; +++ b/package/zfs/<a href=3D"http://zfs.mk" rel=3D"noreferrer noreferr=
er" target=3D"_blank">zfs.mk</a><br>
&gt; @@ -12,7 +12,7 @@ ZFS_LICENSE_FILES =3D LICENSE COPYRIGHT<br>
&gt;=C2=A0 ZFS_CPE_ID_VENDOR =3D openzfs<br>
&gt;=C2=A0 ZFS_CPE_ID_PRODUCT =3D openzfs<br>
&gt;=C2=A0 <br>
&gt; -# 0001-tests-cp_files-ignore-if-SEEK_DATA-is-not-defined.patch<br>
&gt; +# 0001-ZTS-small-fix-for-SEEK_DATA-SEEK_HOLE-tests.patch<br>
&gt;=C2=A0 ZFS_AUTORECONF =3D YES<br>
<br>
The new patch doesn&#39;t touch .m4 or .am files. Can we just drop<br>
AUTORECONF?<br>
<br>
baruch<br>
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 ZFS_DEPENDENCIES =3D libaio openssl udev util-linux zlib libcurl=
 linux<br>
<br>
-- <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~. .~=C2=A0 =C2=A0Tk Open Systems<=
br>
=3D}------------------------------------------------ooO--U--Ooo------------=
{=3D<br>
=C2=A0 =C2=A0- <a href=3D"mailto:baruch@tkos.co.il" target=3D"_blank" rel=
=3D"noreferrer">baruch@tkos.co.il</a> - tel: +972.52.368.4656, <a href=3D"h=
ttp://www.tkos.co.il" rel=3D"noreferrer noreferrer" target=3D"_blank">http:=
//www.tkos.co.il</a> -<br>
</blockquote></div>

--000000000000a5b3df061f10b375--

--===============1890840529826583478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1890840529826583478==--
