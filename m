Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808D1C36002
	for <buildroot@archiver.kernel.org>; Sun,  6 Apr 2025 15:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B39C1406D7;
	Sun,  6 Apr 2025 15:09:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hN17vtriQQFI; Sun,  6 Apr 2025 15:09:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABF78406DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABF78406DF;
	Sun,  6 Apr 2025 15:09:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A37D31F1
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 15:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95243406E7
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 15:09:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xns0hwkCWZAn for <buildroot@buildroot.org>;
 Sun,  6 Apr 2025 15:09:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3F2D6406D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F2D6406D7
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F2D6406D7
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 15:09:34 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ab78e6edb99so515843366b.2
 for <buildroot@buildroot.org>; Sun, 06 Apr 2025 08:09:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743952173; x=1744556973;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sviwo2sgd7Pc8Un5AlX0UEmbAj9ratKuPJ7+nfPsp28=;
 b=dziwDJteMCDL1wTCsChdtpLPrs12ydruV5XTGEPsmAlBLydTwuabH47ItSrX2XVrNy
 dA8ZCMdEMAXrVTdqXnpBk5uLpqtXSNDkT2NxxRhe1PIAVxJeeS8kIzQiz/22a7n7GXZZ
 M9iwLCsW6sCyDwb7CkLW+tiiwYznZ5O46cn+IOYr6D5maP2zh3tvbD2kCaQ1YvPXuiS2
 TNnuG+H/ZJNY9MnSV3l+PZai1V9T0pXJaEM40u6mCgdnywZGx8QqOLPxNTLvJ9U68eco
 XGnot/BZ4PhZ8s+yFjVve6arAiYugQitG79WQtNQCd8iz4tmC67OdhYcMw56Qb9XXESY
 TGBQ==
X-Gm-Message-State: AOJu0YwPi6gFLLIKZEhhFhF4y+Jk4O8d8wj2BNOJJ4EJCDC6uFI3SJ2H
 V+Bnjm8AKmbovetvwwnUSB4KmmdK6OmPNBA6Bx6hq4ZbMPvLMXSmkKpx1emBVx5p8GrOJq/FPxP
 J
X-Gm-Gg: ASbGncu9EUP6QD8WOsSew2yBm35+MtNwckseAJxuJ4sL+PSedmCAHBVslwHiLco5a14
 mEVleWd5mYYNFbZWBrpODm3SJFMvqgjOygsJkjYC13+9OhqVKbcM5Ivkzo9k2gO4rhXo5DU2Q/o
 3nGPTzZHy7pJMyj3K+E4cqWNLnrcJze24i3w1PAz1TSXoe0RdGGNCR2WqDXpGlKrnAVaIC3zKoH
 NbDT8kuyzp0S67PWgTLMeLG1L109/bzWRZvZqacMKCxJ9iY/6XO9UrXWf/N4EUFUf0ACszg8QOy
 lETi71AZ7NbF77BmEVYEhwYH6653TJdvLVhqACfHlF1wbRSmlXX1N2YhU1IBVo7Bw8+cniua74G
 kwenPmbyn8wT6zmsszNYQt4QcDGJ6JDmg+RaelgJWaFltabKz7erMyIPyh1dMfhRAh5zZtyVbUB
 N2qygR9A/RWgA=
X-Google-Smtp-Source: AGHT+IGq6nZJ8jRfCH3CfPo+zjmyFCeqAPEKIf0EXWiLh7Qytm2EWKtwKJd/RN1gvlwRVHu2Xc99fQ==
X-Received: by 2002:a17:907:6d0f:b0:ac1:e1e1:1f30 with SMTP id
 a640c23a62f3a-ac7d6e06422mr611052966b.38.1743952172528; 
 Sun, 06 Apr 2025 08:09:32 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-25-86-232.retail.telecomitalia.it. [79.25.86.232])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7bfeed008sm589425666b.85.2025.04.06.08.09.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Apr 2025 08:09:32 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun,  6 Apr 2025 17:09:29 +0200
Message-ID: <20250406150929.691964-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1743952173; x=1744556973;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sviwo2sgd7Pc8Un5AlX0UEmbAj9ratKuPJ7+nfPsp28=;
 b=dMMc7lxtMFdH5pJKdDFj0rKaxmh/MHlVrTHGPzya4PAVgz+tvaxlHxQkKZHMNjDkGq
 gzu9FvIRWRVRf9AS7+zeHYxHqrROa6oteMn+vo7NGZ0URg6hUbK57LShqMJLBEEQDGpu
 qj63rbyg9mWZUvJxhKIbdCBbUxHlJ/gYysGvc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=dMMc7lxt
Subject: [Buildroot] [PATCH 1/1] package/apr: bump to version 1.7.5
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

Release notes:
https://downloads.apache.org/apr/CHANGES-APR-1.7

The removal of patches:

- 0003-Revert-Add-the-ability-to-cross-compile-APR.patch
- 0004-Merge-r1920082-from-1.8.x.patch

is respectively related to commits [1] and [2] included in the new
release.

[1] https://github.com/apache/apr/commit/6ab04292969c5d85f0b51f3c9eba9aabf4c44ab0
[2] https://github.com/apache/apr/commit/36ea6d5a2bfc480dd8032cc8651e6793552bc2aa
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .checkpackageignore                           |   1 -
 ...Add-the-ability-to-cross-compile-APR.patch | 112 ------------------
 .../apr/0004-Merge-r1920082-from-1.8.x.patch  |  71 -----------
 package/apr/apr.hash                          |   4 +-
 package/apr/apr.mk                            |   5 +-
 5 files changed, 3 insertions(+), 190 deletions(-)
 delete mode 100644 package/apr/0003-Revert-Add-the-ability-to-cross-compile-APR.patch
 delete mode 100644 package/apr/0004-Merge-r1920082-from-1.8.x.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 1a61aa1ac016..d8929cf83688 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -269,7 +269,6 @@ package/apitrace/0002-gltrace-Avoid-__libc_dlsym-and-__libc_dlopen_mode-on-GLIBC
 package/apr-util/0001-remove-checkapr.patch lib_patch.Upstream
 package/apr/0001-sys-param-h.patch lib_patch.Upstream
 package/apr/0002-Revert-Backport-r1872164.-Fix-the-name-of-libtool-wh.patch lib_patch.Upstream
-package/apr/0003-Revert-Add-the-ability-to-cross-compile-APR.patch lib_patch.Upstream
 package/arptables/0001-Fix-musl-build-issue.patch lib_patch.Upstream
 package/arptables/0002-libarptc-libarptc_incl.c-fix-build-with-O0.patch lib_patch.Upstream
 package/asterisk/0001-sounds-do-not-download-and-check-sha1s.patch lib_patch.Upstream
diff --git a/package/apr/0003-Revert-Add-the-ability-to-cross-compile-APR.patch b/package/apr/0003-Revert-Add-the-ability-to-cross-compile-APR.patch
deleted file mode 100644
index ad250d44279f..000000000000
--- a/package/apr/0003-Revert-Add-the-ability-to-cross-compile-APR.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-From ed1daed074fba0dabff825e63525d751b6bb7b8d Mon Sep 17 00:00:00 2001
-From: Graham Leggett <minfrin@apache.org>
-Date: Tue, 31 Dec 2019 21:26:02 +0000
-Subject: [PATCH] Revert: Add the ability to cross compile APR.
-
-git-svn-id: https://svn.apache.org/repos/asf/apr/apr/branches/1.7.x@1872147 13f79535-47bb-0310-9956-ffa450edef68
-
-[Revert upstream commit https://github.com/apache/apr/commit/b6dbbc77da35a7b46754c99f465827f2a583e23c]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- CHANGES       |  2 --
- apr-config.in | 22 ----------------------
- 2 files changed, 24 deletions(-)
-
-diff --git a/CHANGES b/CHANGES
-index 71b2f0e..e751c90 100644
---- a/CHANGES
-+++ b/CHANGES
-@@ -56,8 +56,6 @@ Changes for APR 1.7.1
-   *) Don't try to use PROC_PTHREAD by default when cross compiling.
-      [Yann Ylavic]
- 
--  *) Add the ability to cross compile APR. [Graham Leggett]
--
-   *) While cross-compiling, the tools/gen_test_char could not
-      be executed at build time, use AX_PROG_CC_FOR_BUILD to
-      build native tools/gen_test_char
-diff --git a/apr-config.in b/apr-config.in
-index 4873fc0..84b4073 100644
---- a/apr-config.in
-+++ b/apr-config.in
-@@ -48,14 +48,6 @@ APR_LIBNAME="@APR_LIBNAME@"
- # NOTE: the following line is modified during 'make install': alter with care!
- location=@APR_CONFIG_LOCATION@
- 
--# absolute path, but not installed path - we're cross compiling
--case "$0" in
--  "${bindir}/"*) ;;
--  "/"*)         location=crosscompile;
--                APR_TARGET_DIR=${0%${bindir}/apr-${APR_MAJOR_VERSION}-config} ;;
--  *)            ;;
--esac
--
- show_usage()
- {
-     cat << EOF
-@@ -101,8 +93,6 @@ fi
- 
- if test "$location" = "installed"; then
-     LA_FILE="$libdir/lib${APR_LIBNAME}.la"
--elif test "$location" = "crosscompile"; then
--    LA_FILE="$APR_TARGET_DIR/$libdir/lib${APR_LIBNAME}.la"
- else
-     LA_FILE="$APR_BUILD_DIR/lib${APR_LIBNAME}.la"
- fi
-@@ -132,8 +122,6 @@ while test $# -gt 0; do
-     --includedir)
-     if test "$location" = "installed"; then
-         flags="$includedir"
--    elif test "$location" = "crosscompile"; then
--        flags="$APR_TARGET_DIR/$includedir"
-     elif test "$location" = "source"; then
-         flags="$APR_SOURCE_DIR/include"
-     else
-@@ -166,8 +154,6 @@ while test $# -gt 0; do
-     --includes)
-     if test "$location" = "installed"; then
-         flags="$flags -I$includedir $EXTRA_INCLUDES"
--    elif test "$location" = "crosscompile"; then
--        flags="$flags -I$APR_TARGET_DIR/$includedir $EXTRA_INCLUDES"
-     elif test "$location" = "source"; then
-         flags="$flags -I$APR_SOURCE_DIR/include $EXTRA_INCLUDES"
-     else
-@@ -182,8 +168,6 @@ while test $# -gt 0; do
-     --installbuilddir)
-     if test "$location" = "installed"; then
-         echo "${installbuilddir}"
--    elif test "$location" = "crosscompile"; then
--        echo "$APR_TARGET_DIR/${installbuilddir}"
-     elif test "$location" = "source"; then
-         echo "$APR_SOURCE_DIR/build"
-     else
-@@ -200,8 +184,6 @@ while test $# -gt 0; do
-     if test "$location" = "installed"; then
-         ### avoid using -L if libdir is a "standard" location like /usr/lib
-         flags="$flags -L$libdir -l${APR_LIBNAME}"
--    elif test "$location" = "crosscompile"; then
--        flags="$flags -L$APR_TARGET_DIR/$libdir -l${APR_LIBNAME}"
-     else
-         ### this surely can't work since the library is in .libs?
-         flags="$flags -L$APR_BUILD_DIR -l${APR_LIBNAME}"
-@@ -219,8 +201,6 @@ while test $# -gt 0; do
-         # Since the user is specifying they are linking with libtool, we
-         # *know* that -R will be recognized by libtool.
-         flags="$flags -L$libdir -R$libdir -l${APR_LIBNAME}"
--    elif test "$location" = "crosscompile"; then
--        flags="$flags  -L${APR_TARGET_DIR}/$libdir  -l${APR_LIBNAME}"
-     else
-         flags="$flags $LA_FILE"
-     fi
-@@ -245,8 +225,6 @@ while test $# -gt 0; do
-     --apr-libtool)
-     if test "$location" = "installed"; then
-         echo "${installbuilddir}/libtool"
--    elif test "$location" = "crosscompile"; then
--        echo "$APR_TARGET_DIR/${installbuilddir}/build"
-     else
-         echo "$APR_BUILD_DIR/libtool"
-     fi
--- 
-2.39.2
-
diff --git a/package/apr/0004-Merge-r1920082-from-1.8.x.patch b/package/apr/0004-Merge-r1920082-from-1.8.x.patch
deleted file mode 100644
index 5d198def34cc..000000000000
--- a/package/apr/0004-Merge-r1920082-from-1.8.x.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 36ea6d5a2bfc480dd8032cc8651e6793552bc2aa Mon Sep 17 00:00:00 2001
-From: Eric Covener <covener@apache.org>
-Date: Tue, 20 Aug 2024 21:50:42 +0000
-Subject: [PATCH] Merge r1920082 from 1.8.x:
-
-use 0600 perms for named shared mem consistently
-
-
-
-
-git-svn-id: https://svn.apache.org/repos/asf/apr/apr/branches/1.7.x@1920083 13f79535-47bb-0310-9956-ffa450edef68
-Upstream: https://github.com/apache/apr/commit/36ea6d5a2bfc480dd8032cc8651e6793552bc2aa
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- shmem/unix/shm.c | 18 +++++++-----------
- 1 file changed, 7 insertions(+), 11 deletions(-)
-
-diff --git a/shmem/unix/shm.c b/shmem/unix/shm.c
-index 096884d99..ea9b94277 100644
---- a/shmem/unix/shm.c
-+++ b/shmem/unix/shm.c
-@@ -287,10 +287,9 @@ APR_DECLARE(apr_status_t) apr_shm_create(apr_shm_t **m,
-         status = APR_SUCCESS;
-     
- #if APR_USE_SHMEM_MMAP_TMP
--        /* FIXME: Is APR_OS_DEFAULT sufficient? */
--        status = apr_file_open(&file, filename, 
--                               APR_READ | APR_WRITE | APR_CREATE | APR_EXCL,
--                               APR_OS_DEFAULT, pool);
-+        status = apr_file_open(&file, filename,
-+                               APR_FOPEN_READ | APR_FOPEN_WRITE | APR_FOPEN_CREATE | APR_FOPEN_EXCL,
-+                               APR_FPROT_UREAD | APR_FPROT_UWRITE, pool);
-         if (status != APR_SUCCESS) {
-             return status;
-         }
-@@ -319,8 +318,7 @@ APR_DECLARE(apr_status_t) apr_shm_create(apr_shm_t **m,
-         }
- #endif /* APR_USE_SHMEM_MMAP_TMP */
- #if APR_USE_SHMEM_MMAP_SHM
--        /* FIXME: SysV uses 0600... should we? */
--        tmpfd = shm_open(shm_name, O_RDWR | O_CREAT | O_EXCL, 0644);
-+        tmpfd = shm_open(shm_name, O_RDWR | O_CREAT | O_EXCL, 0600);
-         if (tmpfd == -1) {
-             return errno;
-         }
-@@ -361,10 +359,9 @@ APR_DECLARE(apr_status_t) apr_shm_create(apr_shm_t **m,
- #elif APR_USE_SHMEM_SHMGET
-         new_m->realsize = reqsize;
- 
--        /* FIXME: APR_OS_DEFAULT is too permissive, switch to 600 I think. */
--        status = apr_file_open(&file, filename, 
-+        status = apr_file_open(&file, filename,
-                                APR_FOPEN_WRITE | APR_FOPEN_CREATE | APR_FOPEN_EXCL,
--                               APR_OS_DEFAULT, pool);
-+                               APR_FPROT_UREAD | APR_FPROT_UWRITE, pool);
-         if (status != APR_SUCCESS) {
-             return status;
-         }
-@@ -555,8 +552,7 @@ APR_DECLARE(apr_status_t) apr_shm_attach(apr_shm_t **m,
- #if APR_USE_SHMEM_MMAP_SHM
-         const char *shm_name = make_shm_open_safe_name(filename, pool);
- 
--        /* FIXME: SysV uses 0600... should we? */
--        tmpfd = shm_open(shm_name, O_RDWR, 0644);
-+        tmpfd = shm_open(shm_name, O_RDWR, 0600);
-         if (tmpfd == -1) {
-             return errno;
-         }
--- 
-2.39.5
-
diff --git a/package/apr/apr.hash b/package/apr/apr.hash
index 96f43d371002..7d231ee7cc57 100644
--- a/package/apr/apr.hash
+++ b/package/apr/apr.hash
@@ -1,4 +1,4 @@
-# From https://archive.apache.org/dist/apr/apr-1.7.2.tar.bz2.sha256
-sha256  75e77cc86776c030c0a5c408dfbd0bf2a0b75eed5351e52d5439fa1e5509a43e  apr-1.7.2.tar.bz2
+# From https://archive.apache.org/dist/apr/apr-1.7.5.tar.bz2.sha256
+sha256  cd0f5d52b9ab1704c72160c5ee3ed5d3d4ca2df4a7f8ab564e3cb352b67232f2  apr-1.7.5.tar.bz2
 # Locally calculated
 sha256  f854aeef66ecd55a126226e82b3f26793fc3b1c584647f6a0edc5639974c38ad  LICENSE
diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index 5a41891cef7c..d5b132658a1e 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APR_VERSION = 1.7.2
+APR_VERSION = 1.7.5
 APR_SOURCE = apr-$(APR_VERSION).tar.bz2
 APR_SITE = https://archive.apache.org/dist/apr
 APR_LICENSE = Apache-2.0
@@ -16,9 +16,6 @@ APR_INSTALL_STAGING = YES
 # so we need to autoreconf:
 APR_AUTORECONF = YES
 
-# 0004-Merge-r1920082-from-1.8.x.patch
-APR_IGNORE_CVES += CVE-2023-49582
-
 APR_CONF_OPTS = --disable-sctp
 
 # avoid apr_hints.m4 by setting apr_preload_done=yes and set
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
