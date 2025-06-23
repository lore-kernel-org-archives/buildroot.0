Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D75C7115B
	for <buildroot@archiver.kernel.org>; Mon, 23 Jun 2025 16:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C91F807FA;
	Mon, 23 Jun 2025 16:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OdFK4js57sEq; Mon, 23 Jun 2025 16:02:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B87E8080C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B87E8080C;
	Mon, 23 Jun 2025 16:02:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17425154
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 16:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0B34408C8
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 16:02:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dGDgYWorcDyc for <buildroot@buildroot.org>;
 Mon, 23 Jun 2025 16:02:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 81223408A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81223408A1
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 81223408A1
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 16:02:38 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a510432236so3244449f8f.0
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 09:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750694556; x=1751299356;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zYLFyDSk1xUJp0OLYNLxtgufE7+CIkGm46WQBN7LXmY=;
 b=OuVD5z00y81Wccdtfb0lhxY/BXVbHpZ6qujE4YnwU0fda+lZ1DDUsZ5nTn0dRTu1Jl
 JghHh5N4U1rtiXcKRAHbR7NXh60W8hbD1NDcXOpgfwa24QK7EGtIakWNYB0CMtEL3l9G
 hPX3k43mMRJf8Kkh/AOiT3nQMWnY3oXTxgO0ivZ2sWJwaCM9RHky60hw1kWLONdXF7b0
 +NFW+kJKneCqcHDHLgUYum7Yd+skCB8ZBXoaZSvfEvHaETQmT/Nhs4ySMmFUhqDkWwOC
 zZyJFGpzpio0JUCK8Vz9+G3Z/GpE8N9q3wjPyVoqsxXDBjgz1G1PyyfrWCza/2Xwga28
 P05g==
X-Gm-Message-State: AOJu0YynUCNYHxuLgIfXymytK6CY/6VLGu+OwbUr8SOrpCR4krrIt0Nr
 qg76o+eAq3oZrahIbOyHRBJWnfalmQLhvel/86Zg2TshmmADm32uVaQOwCXozN+MlZHHk6U+vG5
 4gGFS
X-Gm-Gg: ASbGncsO8K8BkukhTgDVUvWYUj/DBpkUMMHB4attKPWXkL+R2I2O+QNedlSBW9jRM2l
 DynFsj9Vsx1FlqANCWkkQ3tkdWjz9rtr0xnKPI7UlZZ6HA5qAI1/Mc8f5zt1wAJ1Q5tHtAWsX4p
 pbCBuH7QTx8/rD0y88VJ8C3NLKSWJJzb1kjPpKOPRSj930lvnWUvC/PqrYqbpxJWs1otdQ9G/TI
 MEtrAuaQkYsEciuSurR9bNCscXaG3PC7IMsvug7/0dzgNyJI67BMwgJ8DN2htGTeFh/gS0pqxFJ
 MfCLmU6yK0kiTevE7F+5dMjypYVJVUNsM3hpbddu8KiAIIlv059iu0nJMDBcmjlU1f/lo6DyscX
 pOmo2YAU208LI4FxY2A==
X-Google-Smtp-Source: AGHT+IHXWucsXJrfo3ix42I44SJOhgj1jYA2VcTIYDjMIblfXszmv7ONvPp7b79Q0yaxjSuxwkP6sQ==
X-Received: by 2002:a05:6000:2013:b0:3a5:4b67:5a70 with SMTP id
 ffacd0b85a97d-3a6d12e8d1amr11019823f8f.18.1750694555529; 
 Mon, 23 Jun 2025 09:02:35 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4535eac8bb6sm149550205e9.25.2025.06.23.09.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 09:02:35 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Mon, 23 Jun 2025 18:02:24 +0200
Message-ID: <20250623160224.953975-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750694556; x=1751299356; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zYLFyDSk1xUJp0OLYNLxtgufE7+CIkGm46WQBN7LXmY=;
 b=DRS8WkNAQ+WwiuUJkJINPdC3tY+biWdK5esBuxLRBP/bSCwXCtFJKw8VXxdRsaAw4E
 mIm3fJYjleIh+WCLnx1dIItrfhjOaco++yghNTzEPUFW8uppKfOciLOW/UZx09w24bHv
 /sSpgJ3sQCSqmGZsIOhXKfaUCPe8cG0CNtdJnqUi5pKIKMkCSAfkIBHOrW2+OsEfDl4e
 cl/hyo75RNLlyXe5wlA9IET6o2trAJyPIxh5rWjoiOWl7KW3Q5FGfPDxTGLn6BDPnVER
 m3USRjKh1O+vgkBiMEKDddCFsoDSgoZ/pWen15Mh2JN44k0c+ShpnGNjMgsftejzLUcp
 natA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DRS8WkNA
Subject: [Buildroot] [PATCH] package/libarchive: security bump to v3.8.1
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following CVEs:

- CVE-2025-5914
    Libarchive: double free at archive_read_format_rar_seek_data()
    in archive_read_support_format_rar.c
    https://www.cve.org/CVERecord?id=CVE-2025-5914

- CVE-2025-5915
    Libarchive: heap buffer over read in copy_from_lzss_window()
    at archive_read_support_format_rar.c
    https://www.cve.org/CVERecord?id=CVE-2025-5915

- CVE-2025-5916
    Libarchive: integer overflow while reading warc files
    at archive_read_support_format_warc.c
    https://www.cve.org/CVERecord?id=CVE-2025-5916

- CVE-2025-5917
    Libarchive: off by one error in build_ustar_entry_name()
    at archive_write_set_format_pax.c
    https://www.cve.org/CVERecord?id=CVE-2025-5917

- CVE-2025-5918
    Libarchive: reading past eof may be triggered for piped file streams
    https://www.cve.org/CVERecord?id=CVE-2025-5918

See the release notes:
- https://github.com/libarchive/libarchive/releases/tag/v3.8.0
- https://github.com/libarchive/libarchive/releases/tag/v3.8.1

In addition to the version bump, the following changes are required:
- The COPYING file has been edited upstream because of filename change on a
  sub-licensed component; see
  https://github.com/libarchive/libarchive/commit/c26f0377457db392bd57a640e8fe25506120f810
- The upstream "sha256sums" is currently unavailable, so the archive checksum
  has been computed locally
- Drop patches for libiconv in configure.ac, which has been properly addressed
  upstream in https://github.com/libarchive/libarchive/pull/2611
- Drop mbedtls patch that has been applied upstream

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...iconv-to-the-.pc-file-if-needed-1825.patch |  31 ---
 ...o-not-add-iconv-for-Requires.private.patch |  27 --
 ...mbedtls-version-3-compatibility-2602.patch | 238 ------------------
 package/libarchive/libarchive.hash            |   7 +-
 package/libarchive/libarchive.mk              |   2 +-
 5 files changed, 5 insertions(+), 300 deletions(-)
 delete mode 100644 package/libarchive/0001-Revert-Only-add-iconv-to-the-.pc-file-if-needed-1825.patch
 delete mode 100644 package/libarchive/0002-autotools-do-not-add-iconv-for-Requires.private.patch
 delete mode 100644 package/libarchive/0003-Fix-mbedtls-version-3-compatibility-2602.patch

diff --git a/package/libarchive/0001-Revert-Only-add-iconv-to-the-.pc-file-if-needed-1825.patch b/package/libarchive/0001-Revert-Only-add-iconv-to-the-.pc-file-if-needed-1825.patch
deleted file mode 100644
index 31ac4b0b5a..0000000000
--- a/package/libarchive/0001-Revert-Only-add-iconv-to-the-.pc-file-if-needed-1825.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 3879afd473a256173cc626e16293f3fe8875f2d6 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 6 Jan 2024 09:53:23 +0100
-Subject: [PATCH] Revert "Only add "iconv" to the .pc file if needed (#1825)"
-
-This reverts commit 1f35c466aaa9444335a1b854b0b7223b0d2346c2.
-
-Upstream: no dedicated PR for this revert but there is already plenty of PRs/issues to fix iconv build ...
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 93f7af94..204a4e69 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -455,9 +455,7 @@ if test "x$with_iconv" != "xno"; then
-     AC_CHECK_HEADERS([localcharset.h])
-     am_save_LIBS="$LIBS"
-     LIBS="${LIBS} ${LIBICONV}"
--    if test -n "$LIBICONV"; then
--      LIBSREQUIRED="$LIBSREQUIRED${LIBSREQUIRED:+ }iconv"
--    fi
-+    LIBSREQUIRED="$LIBSREQUIRED${LIBSREQUIRED:+ }iconv"
-     AC_CHECK_FUNCS([locale_charset])
-     LIBS="${am_save_LIBS}"
-     if test "x$ac_cv_func_locale_charset" != "xyes"; then
--- 
-2.43.0
-
diff --git a/package/libarchive/0002-autotools-do-not-add-iconv-for-Requires.private.patch b/package/libarchive/0002-autotools-do-not-add-iconv-for-Requires.private.patch
deleted file mode 100644
index a5b4c86a2f..0000000000
--- a/package/libarchive/0002-autotools-do-not-add-iconv-for-Requires.private.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 619c1be8d38ff79622db8f66f3b02832795315f9 Mon Sep 17 00:00:00 2001
-From: Christian Hesse <mail@eworm.de>
-Date: Wed, 14 Dec 2022 09:04:39 +0100
-Subject: [PATCH] autotools: do not add iconv for Requires.private
-
-There is no pkgconfig file for iconv, thus things break with this
-change. Let's drop iconv from Requires.private.
-
-Fixes: a83f3d32 ("autotools: Fix static linking when openssl is enabled in windows")
-Upstream: https://github.com/libarchive/libarchive/pull/1817/commits/619c1be8d38ff79622db8f66f3b02832795315f9
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 99bff20d1..f245d0c55 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -455,7 +455,6 @@ if test "x$with_iconv" != "xno"; then
-     AC_CHECK_HEADERS([localcharset.h])
-     am_save_LIBS="$LIBS"
-     LIBS="${LIBS} ${LIBICONV}"
--    LIBSREQUIRED="$LIBSREQUIRED${LIBSREQUIRED:+ }iconv"
-     AC_CHECK_FUNCS([locale_charset])
-     LIBS="${am_save_LIBS}"
-     if test "x$ac_cv_func_locale_charset" != "xyes"; then
diff --git a/package/libarchive/0003-Fix-mbedtls-version-3-compatibility-2602.patch b/package/libarchive/0003-Fix-mbedtls-version-3-compatibility-2602.patch
deleted file mode 100644
index 67fb3ff738..0000000000
--- a/package/libarchive/0003-Fix-mbedtls-version-3-compatibility-2602.patch
+++ /dev/null
@@ -1,238 +0,0 @@
-From 26ba5ee5d560d62ad05aa6819608fd21cbb962f9 Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Thu, 15 May 2025 04:56:59 -0600
-Subject: [PATCH] Fix mbedtls version 3 compatibility (#2602)
-
-We need to use the new API for mbedtls 3 compatibility
-
-Fixes #2025
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-Upstream: https://github.com/libarchive/libarchive/commit/63d7c24eeaa108ecc2ef258c0505eefdadaaaf35
----
- libarchive/archive_digest.c | 72 +++++++++++++++++++++++++++++++++++++
- 1 file changed, 72 insertions(+)
-
-diff --git a/libarchive/archive_digest.c b/libarchive/archive_digest.c
-index 33518740..03f0edd6 100644
---- a/libarchive/archive_digest.c
-+++ b/libarchive/archive_digest.c
-@@ -235,7 +235,11 @@ static int
- __archive_md5init(archive_md5_ctx *ctx)
- {
-   mbedtls_md5_init(ctx);
-+#if MBEDTLS_VERSION_NUMBER > 0x03000000
-+  if (mbedtls_md5_starts(ctx) == 0)
-+#else
-   if (mbedtls_md5_starts_ret(ctx) == 0)
-+#endif
-     return (ARCHIVE_OK);
-   else
-     return (ARCHIVE_FATAL);
-@@ -245,7 +249,11 @@ static int
- __archive_md5update(archive_md5_ctx *ctx, const void *indata,
-     size_t insize)
- {
-+#if MBEDTLS_VERSION_NUMBER > 0x03000000
-+  if (mbedtls_md5_update(ctx, indata, insize) == 0)
-+#else
-   if (mbedtls_md5_update_ret(ctx, indata, insize) == 0)
-+#endif
-     return (ARCHIVE_OK);
-   else
-     return (ARCHIVE_FATAL);
-@@ -254,7 +262,11 @@ __archive_md5update(archive_md5_ctx *ctx, const void *indata,
- static int
- __archive_md5final(archive_md5_ctx *ctx, void *md)
- {
-+#if MBEDTLS_VERSION_NUMBER > 0x03000000
-+  if (mbedtls_md5_finish(ctx, md) == 0) {
-+#else
-   if (mbedtls_md5_finish_ret(ctx, md) == 0) {
-+#endif
-     mbedtls_md5_free(ctx);
-     return (ARCHIVE_OK);
-   } else {
-@@ -431,7 +443,11 @@ static int
- __archive_ripemd160init(archive_rmd160_ctx *ctx)
- {
-   mbedtls_ripemd160_init(ctx);
-+#if MBEDTLS_VERSION_NUMBER > 0x03000000
-+  if (mbedtls_ripemd160_starts(ctx) == 0)
-+#else
-   if (mbedtls_ripemd160_starts_ret(ctx) == 0)
-+#endif
-     return (ARCHIVE_OK);
-   else
-     return (ARCHIVE_FATAL);
-@@ -441,7 +457,11 @@ static int
- __archive_ripemd160update(archive_rmd160_ctx *ctx, const void *indata,
-     size_t insize)
- {
-+#if MBEDTLS_VERSION_NUMBER > 0x03000000
-+  if (mbedtls_ripemd160_update(ctx, indata, insize) == 0)
-+#else
-   if (mbedtls_ripemd160_update_ret(ctx, indata, insize) == 0)
-+#endif
-     return (ARCHIVE_OK);
-   else
-     return (ARCHIVE_FATAL);
-@@ -450,7 +470,11 @@ __archive_ripemd160update(archive_rmd160_ctx *ctx, const void *indata,
- static int
- __archive_ripemd160final(archive_rmd160_ctx *ctx, void *md)
- {
-+#if MBEDTLS_VERSION_NUMBER > 0x03000000
-+  if (mbedtls_ripemd160_finish(ctx, md) == 0) {
-+#else
-   if (mbedtls_ripemd160_finish_ret(ctx, md) == 0) {
-+#endif
-     mbedtls_ripemd160_free(ctx);
-     return (ARCHIVE_OK);
-   } else {
-@@ -622,7 +646,11 @@ static int
- __archive_sha1init(archive_sha1_ctx *ctx)
- {
-   mbedtls_sha1_init(ctx);
-+#if MBEDTLS_VERSION_NUMBER > 0x03000000
-+  if (mbedtls_sha1_starts(ctx) == 0)
-+#else
-   if (mbedtls_sha1_starts_ret(ctx) == 0)
-+#endif
-     return (ARCHIVE_OK);
-   else
-     return (ARCHIVE_FATAL);
-@@ -632,7 +660,11 @@ static int
- __archive_sha1update(archive_sha1_ctx *ctx, const void *indata,
-     size_t insize)
- {
-+#if MBEDTLS_VERSION_NUMBER > 0x03000000
-+  if (mbedtls_sha1_update(ctx, indata, insize) == 0)
-+#else
-   if (mbedtls_sha1_update_ret(ctx, indata, insize) == 0)
-+#endif
-     return (ARCHIVE_OK);
-   else
-     return (ARCHIVE_FATAL);
-@@ -641,7 +673,11 @@ __archive_sha1update(archive_sha1_ctx *ctx, const void *indata,
- static int
- __archive_sha1final(archive_sha1_ctx *ctx, void *md)
- {
-+#if MBEDTLS_VERSION_NUMBER > 0x03000000
-+  if (mbedtls_sha1_finish(ctx, md) == 0) {
-+#else
-   if (mbedtls_sha1_finish_ret(ctx, md) == 0) {
-+#endif
-     mbedtls_sha1_free(ctx);
-     return (ARCHIVE_OK);
-   } else {
-@@ -890,7 +926,11 @@ static int
- __archive_sha256init(archive_sha256_ctx *ctx)
- {
-   mbedtls_sha256_init(ctx);
-+#if MBEDTLS_VERSION_NUMBER > 0x03000000
-+  if (mbedtls_sha256_starts(ctx, 0) == 0)
-+#else
-   if (mbedtls_sha256_starts_ret(ctx, 0) == 0)
-+#endif
-     return (ARCHIVE_OK);
-   else
-     return (ARCHIVE_FATAL);
-@@ -900,7 +940,11 @@ static int
- __archive_sha256update(archive_sha256_ctx *ctx, const void *indata,
-     size_t insize)
- {
-+#if MBEDTLS_VERSION_NUMBER > 0x03000000
-+  if (mbedtls_sha256_update(ctx, indata, insize) == 0)
-+#else
-   if (mbedtls_sha256_update_ret(ctx, indata, insize) == 0)
-+#endif
-     return (ARCHIVE_OK);
-   else
-     return (ARCHIVE_FATAL);
-@@ -909,7 +953,11 @@ __archive_sha256update(archive_sha256_ctx *ctx, const void *indata,
- static int
- __archive_sha256final(archive_sha256_ctx *ctx, void *md)
- {
-+#if MBEDTLS_VERSION_NUMBER > 0x03000000
-+  if (mbedtls_sha256_finish(ctx, md) == 0) {
-+#else
-   if (mbedtls_sha256_finish_ret(ctx, md) == 0) {
-+#endif
-     mbedtls_sha256_free(ctx);
-     return (ARCHIVE_OK);
-   } else {
-@@ -1130,7 +1178,11 @@ static int
- __archive_sha384init(archive_sha384_ctx *ctx)
- {
-   mbedtls_sha512_init(ctx);
-+#if MBEDTLS_VERSION_NUMBER > 0x03000000
-+  if (mbedtls_sha512_starts(ctx, 1) == 0)
-+#else
-   if (mbedtls_sha512_starts_ret(ctx, 1) == 0)
-+#endif
-     return (ARCHIVE_OK);
-   else
-     return (ARCHIVE_FATAL);
-@@ -1140,7 +1192,11 @@ static int
- __archive_sha384update(archive_sha384_ctx *ctx, const void *indata,
-     size_t insize)
- {
-+#if MBEDTLS_VERSION_NUMBER > 0x03000000
-+  if (mbedtls_sha512_update(ctx, indata, insize) == 0)
-+#else
-   if (mbedtls_sha512_update_ret(ctx, indata, insize) == 0)
-+#endif
-     return (ARCHIVE_OK);
-   else
-     return (ARCHIVE_FATAL);
-@@ -1149,7 +1205,11 @@ __archive_sha384update(archive_sha384_ctx *ctx, const void *indata,
- static int
- __archive_sha384final(archive_sha384_ctx *ctx, void *md)
- {
-+#if MBEDTLS_VERSION_NUMBER > 0x03000000
-+  if (mbedtls_sha512_finish(ctx, md) == 0) {
-+#else
-   if (mbedtls_sha512_finish_ret(ctx, md) == 0) {
-+#endif
-     mbedtls_sha512_free(ctx);
-     return (ARCHIVE_OK);
-   } else {
-@@ -1394,7 +1454,11 @@ static int
- __archive_sha512init(archive_sha512_ctx *ctx)
- {
-   mbedtls_sha512_init(ctx);
-+#if MBEDTLS_VERSION_NUMBER > 0x03000000
-+  if (mbedtls_sha512_starts(ctx, 0) == 0)
-+#else
-   if (mbedtls_sha512_starts_ret(ctx, 0) == 0)
-+#endif
-     return (ARCHIVE_OK);
-   else
-     return (ARCHIVE_FATAL);
-@@ -1404,7 +1468,11 @@ static int
- __archive_sha512update(archive_sha512_ctx *ctx, const void *indata,
-     size_t insize)
- {
-+#if MBEDTLS_VERSION_NUMBER > 0x03000000
-+  if (mbedtls_sha512_update(ctx, indata, insize) == 0)
-+#else
-   if (mbedtls_sha512_update_ret(ctx, indata, insize) == 0)
-+#endif
-     return (ARCHIVE_OK);
-   else
-     return (ARCHIVE_FATAL);
-@@ -1413,7 +1481,11 @@ __archive_sha512update(archive_sha512_ctx *ctx, const void *indata,
- static int
- __archive_sha512final(archive_sha512_ctx *ctx, void *md)
- {
-+#if MBEDTLS_VERSION_NUMBER > 0x03000000
-+  if (mbedtls_sha512_finish(ctx, md) == 0) {
-+#else
-   if (mbedtls_sha512_finish_ret(ctx, md) == 0) {
-+#endif
-     mbedtls_sha512_free(ctx);
-     return (ARCHIVE_OK);
-   } else {
--- 
-2.34.1
-
diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index d132664e17..b8738e4a99 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,4 +1,5 @@
-# From https://www.libarchive.de/downloads/sha256sums
-sha256  ed8b5732e4cd6e30fae909fb945cad8ff9cb7be5c6cdaa3944ec96e4a200c04c  libarchive-3.7.9.tar.xz
+# Locally computed after verifying the signature from
+# https://www.libarchive.de/downloads/libarchive-3.8.1.tar.xz.asc
+sha256  19f917d42d530f98815ac824d90c7eaf648e9d9a50e4f309c812457ffa5496b5  libarchive-3.8.1.tar.xz
 # Locally computed:
-sha256  b2cdf763345de2de34cebf54394df3c61a105c3b71288603c251f2fa638200ba  COPYING
+sha256  30e556b3959e3985d66efefec5eaac51d4995053caa1d3cffe6eb916f146f229  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 7fec01a040..9afb4e11fa 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.7.9
+LIBARCHIVE_VERSION = 3.8.1
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
