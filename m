Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4EBC36010
	for <buildroot@archiver.kernel.org>; Mon,  7 Apr 2025 15:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41CEC81FBA;
	Mon,  7 Apr 2025 15:49:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p1_AwW3zEV49; Mon,  7 Apr 2025 15:49:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F6F681FB9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F6F681FB9;
	Mon,  7 Apr 2025 15:49:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A9A1DA
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 15:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3062640320
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 15:49:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yMZqZFlgpKzk for <buildroot@buildroot.org>;
 Mon,  7 Apr 2025 15:49:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D7F7640217
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7F7640217
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D7F7640217
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 15:49:33 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43edb40f357so21680585e9.0
 for <buildroot@buildroot.org>; Mon, 07 Apr 2025 08:49:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744040971; x=1744645771;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=diEPgktqV2gabSutUH6KV2Bo3GfStt63eDZFVyzFtPY=;
 b=BBQlRrueGGgOAuIHvCVfJZFGvBgCPSJ+oT6zvQP18PJZmF5xW+RH4Ucg1FuKE38Ucu
 SDV4mvBD6Fy7dtTmH0DfmJF4JVrZjtIV1kfbWZkfQkszDWdLoUUTuG7IXM+pLTWUc53A
 MkSYU/NNtplVHovPwo+cuEy27D404Py1OxdIhw3vINfbxDlQqSXkGnughotFSAPrMskN
 vEfvcGxKlco62Nf6IyyvtoeOqwQyfOz4E1HQll+h2579lGVSFtPwzINYvGSKo5HmOBsz
 4CGX5cn+xaxR1AyskM18eR1Lk7EDPBdNP14L4Dw6YVF+yFFPxTheY5YHCP4nDe1Al4yp
 FBuQ==
X-Gm-Message-State: AOJu0YyznwWd7CnocC63XNMcCS9zHCP4y42ee1Sfl4KKdMaIbuWrjTy+
 l9arxj594dF4iqAX40R7SfdiTPZNZE8gD/CUYBVjyVzmmcfoUOdSJZHok4HfVgGmKq5LM9/Rygg
 +
X-Gm-Gg: ASbGnctBWrfGjjVLE5SyAjVe1dd3GxJTs8FaefzG10J01Uyu/kizuQBtM75LYIdemv1
 5uVlaypwzCEvowoJb6E4Oq97pgNFu+Xrm8TvNNpY9E/zilO9GQXOEVQpVC3IXAZaSOs4GlFG4mm
 4LaMfaVFDizvVSTXb+/i/9MYMjAK/EN6z7XkUrCM0riYX5pNANWBrOHWXuyV/wYra1cSAN43A6i
 PwGQgwUKcmp6XVx5c6y4DIYUqUZdxA5XoP9Mn45I4KPXvFdlt7mQQ2e2fSXtl4Ti3sOfpcw+iu0
 qzPBo+bREPtVJpyKQyE/vrPCPnYbpzxnBnM8IjgvKK8XHEdB7wPw7/zpBzzWDkv7UFgPv39rYPD
 nK/42y7N9Et1uwUvwMWoAsSfSt9uXX+URq/dbeU0kML3qjQ==
X-Google-Smtp-Source: AGHT+IFzS3IBiGnU5sgvuudWa6VpK1w++XcGLt2QWn2viuek8MtO2mtfjc4LU1rXR2Zv5x1rbh6ylQ==
X-Received: by 2002:a05:6000:40c9:b0:39c:dcc:6451 with SMTP id
 ffacd0b85a97d-39d6fce0e99mr7536173f8f.43.1744040971557; 
 Mon, 07 Apr 2025 08:49:31 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.42.133])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ea8d1673dsm154843435e9.0.2025.04.07.08.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 08:49:31 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon,  7 Apr 2025 17:49:28 +0200
Message-ID: <20250407154928.1511637-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1744040971; x=1744645771;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=diEPgktqV2gabSutUH6KV2Bo3GfStt63eDZFVyzFtPY=;
 b=FQcCqKlBlG2d8ebKo8Gh46Q4Bx78Z5TAtSy6jQTCdg9yq89ng1OX4EYZqxXPd5S6+S
 E7rtLe5K1kCF2GBwWvhPA8r9YtVrjSCoE7t/iHhPCszze4qmQ0mdL263th8IdutbHi4H
 gytBJfoo8K16bdxE2zFjXS/yo8ddGa20Fd/T8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=FQcCqKlB
Subject: [Buildroot] [PATCH v2] package/apr: bump to version 1.7.5
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

Note: the upstream release note mention v1.7.5 is a security update.
The package patch 0004-Merge-r1920082-from-1.8.x.patch in Buildroot
was already fixing this security issue. This is why this commit is
not marked as a security bump.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes v1 -> v2:
- Add 0003-Revert-Add-the-ability-to-cross-compile-APR.patch. It had
  been mistakenly removed and was causing test failures.

 ...Add-the-ability-to-cross-compile-APR.patch | 52 +++++++-------
 .../apr/0004-Merge-r1920082-from-1.8.x.patch  | 71 -------------------
 package/apr/apr.hash                          |  4 +-
 package/apr/apr.mk                            |  5 +-
 4 files changed, 30 insertions(+), 102 deletions(-)
 delete mode 100644 package/apr/0004-Merge-r1920082-from-1.8.x.patch

diff --git a/package/apr/0003-Revert-Add-the-ability-to-cross-compile-APR.patch b/package/apr/0003-Revert-Add-the-ability-to-cross-compile-APR.patch
index ad250d44279f..9d8fad13627c 100644
--- a/package/apr/0003-Revert-Add-the-ability-to-cross-compile-APR.patch
+++ b/package/apr/0003-Revert-Add-the-ability-to-cross-compile-APR.patch
@@ -1,4 +1,4 @@
-From ed1daed074fba0dabff825e63525d751b6bb7b8d Mon Sep 17 00:00:00 2001
+From a8fd928dfab693278205e73286e3a6b622624aeb Mon Sep 17 00:00:00 2001
 From: Graham Leggett <minfrin@apache.org>
 Date: Tue, 31 Dec 2019 21:26:02 +0000
 Subject: [PATCH] Revert: Add the ability to cross compile APR.
@@ -7,16 +7,18 @@ git-svn-id: https://svn.apache.org/repos/asf/apr/apr/branches/1.7.x@1872147 13f7
 
 [Revert upstream commit https://github.com/apache/apr/commit/b6dbbc77da35a7b46754c99f465827f2a583e23c]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+[Dario: adapt to 1.7.5]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  CHANGES       |  2 --
  apr-config.in | 22 ----------------------
  2 files changed, 24 deletions(-)
 
 diff --git a/CHANGES b/CHANGES
-index 71b2f0e..e751c90 100644
+index 793b0b6a46a4..4705b8476ff3 100644
 --- a/CHANGES
 +++ b/CHANGES
-@@ -56,8 +56,6 @@ Changes for APR 1.7.1
+@@ -119,8 +119,6 @@ Changes for APR 1.7.5
    *) Don't try to use PROC_PTHREAD by default when cross compiling.
       [Yann Ylavic]
  
@@ -26,25 +28,25 @@ index 71b2f0e..e751c90 100644
       be executed at build time, use AX_PROG_CC_FOR_BUILD to
       build native tools/gen_test_char
 diff --git a/apr-config.in b/apr-config.in
-index 4873fc0..84b4073 100644
+index 1203d9a0d38e..bcd4a0c10399 100644
 --- a/apr-config.in
 +++ b/apr-config.in
-@@ -48,14 +48,6 @@ APR_LIBNAME="@APR_LIBNAME@"
- # NOTE: the following line is modified during 'make install': alter with care!
- location=@APR_CONFIG_LOCATION@
+@@ -61,14 +61,6 @@ if test "$cross_compiling" != "no"; then
+     # Remove trailing '/'
+     normalized_bindir=${normalized_bindir%/}
+ 
+-    # absolute path, but not installed path - we're cross compiling
+-    case "$normalized_command" in
+-      "${normalized_bindir}/"*) ;;
+-      "/"*)                     location=crosscompile;
+-                                APR_TARGET_DIR=${normalized_command%${normalized_bindir}/apr-${APR_MAJOR_VERSION}-config};
+-                                ;;
+-      *)                        ;;
+-    esac
+ fi
  
--# absolute path, but not installed path - we're cross compiling
--case "$0" in
--  "${bindir}/"*) ;;
--  "/"*)         location=crosscompile;
--                APR_TARGET_DIR=${0%${bindir}/apr-${APR_MAJOR_VERSION}-config} ;;
--  *)            ;;
--esac
--
  show_usage()
- {
-     cat << EOF
-@@ -101,8 +93,6 @@ fi
+@@ -116,8 +108,6 @@ fi
  
  if test "$location" = "installed"; then
      LA_FILE="$libdir/lib${APR_LIBNAME}.la"
@@ -53,7 +55,7 @@ index 4873fc0..84b4073 100644
  else
      LA_FILE="$APR_BUILD_DIR/lib${APR_LIBNAME}.la"
  fi
-@@ -132,8 +122,6 @@ while test $# -gt 0; do
+@@ -147,8 +137,6 @@ while test $# -gt 0; do
      --includedir)
      if test "$location" = "installed"; then
          flags="$includedir"
@@ -62,7 +64,7 @@ index 4873fc0..84b4073 100644
      elif test "$location" = "source"; then
          flags="$APR_SOURCE_DIR/include"
      else
-@@ -166,8 +154,6 @@ while test $# -gt 0; do
+@@ -181,8 +169,6 @@ while test $# -gt 0; do
      --includes)
      if test "$location" = "installed"; then
          flags="$flags -I$includedir $EXTRA_INCLUDES"
@@ -71,7 +73,7 @@ index 4873fc0..84b4073 100644
      elif test "$location" = "source"; then
          flags="$flags -I$APR_SOURCE_DIR/include $EXTRA_INCLUDES"
      else
-@@ -182,8 +168,6 @@ while test $# -gt 0; do
+@@ -197,8 +183,6 @@ while test $# -gt 0; do
      --installbuilddir)
      if test "$location" = "installed"; then
          echo "${installbuilddir}"
@@ -80,7 +82,7 @@ index 4873fc0..84b4073 100644
      elif test "$location" = "source"; then
          echo "$APR_SOURCE_DIR/build"
      else
-@@ -200,8 +184,6 @@ while test $# -gt 0; do
+@@ -215,8 +199,6 @@ while test $# -gt 0; do
      if test "$location" = "installed"; then
          ### avoid using -L if libdir is a "standard" location like /usr/lib
          flags="$flags -L$libdir -l${APR_LIBNAME}"
@@ -89,7 +91,7 @@ index 4873fc0..84b4073 100644
      else
          ### this surely can't work since the library is in .libs?
          flags="$flags -L$APR_BUILD_DIR -l${APR_LIBNAME}"
-@@ -219,8 +201,6 @@ while test $# -gt 0; do
+@@ -234,8 +216,6 @@ while test $# -gt 0; do
          # Since the user is specifying they are linking with libtool, we
          # *know* that -R will be recognized by libtool.
          flags="$flags -L$libdir -R$libdir -l${APR_LIBNAME}"
@@ -98,7 +100,7 @@ index 4873fc0..84b4073 100644
      else
          flags="$flags $LA_FILE"
      fi
-@@ -245,8 +225,6 @@ while test $# -gt 0; do
+@@ -260,8 +240,6 @@ while test $# -gt 0; do
      --apr-libtool)
      if test "$location" = "installed"; then
          echo "${installbuilddir}/libtool"
@@ -108,5 +110,5 @@ index 4873fc0..84b4073 100644
          echo "$APR_BUILD_DIR/libtool"
      fi
 -- 
-2.39.2
+2.43.0
 
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
