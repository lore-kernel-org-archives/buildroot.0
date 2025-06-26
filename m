Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3047BC7EE32
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 08:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D343581233;
	Thu, 26 Jun 2025 08:55:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7CRdniYjlKYd; Thu, 26 Jun 2025 08:55:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FD258123F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FD258123F;
	Thu, 26 Jun 2025 08:55:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 955A111A
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 08:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73F5440176
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 08:55:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HMIxpkADwkW0 for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 08:55:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E035E40069
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E035E40069
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E035E40069
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 08:55:07 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a4ef2c2ef3so618851f8f.2
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 01:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750928105; x=1751532905;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fZfpv/qREP4vWPXFk+ydEzGBaAp54edmP9xM85HXxP0=;
 b=HEycbtmk/yci8nQwY9gqIUZ2rWD4+zDM4fQ5BXHLba5LiyboH/KYdxxi+C4ZRfPW7M
 2awC2c4aKRfoU7jlILO/trozmPQJln1tCVRnYee37MvWxZfmm7xK25ndPIPCoYULNU3l
 8ITXYx0w8ubkgGz1/9xKkQ6j9Sbs+VEwIk6AsHru8NVBPtAYuDqwrjpXcNrRXQlmH1Gx
 /jumy6J10Arj2vGhqOJlZbiuWGlv6eYaBHZCY7pkTZN3foe6K/dZA0naL1fVkZMB3fWc
 GqQ+wj4JBl1Np0G+GFTK4e4csPpEjGKXmZD86UbJlcEFiBbo1rZzk+1eC7IJRZWsVkad
 PIDw==
X-Gm-Message-State: AOJu0YwkIXcYw9WTMh4p98c54+inbGEBcdXtiepmU5nxV0FEX9p+u7mh
 UuIEd/RH6zGv5mctuieJMlEThMe7RjW+2ex4JQP9ScctSnlqYiwyFeXfLPu8uTnyDOHIGFaYIcQ
 aAGsl
X-Gm-Gg: ASbGnctntu7e2NiQAOfVHQTYnPsDzhUzL0ffaOBbEUY7H4cGcxTk9FVyCr0gwmT6Cc6
 sKGaaunX4cysuccttc3T9MUL2IpqXuEgn1NpqvbdYtFp7v5TUEwTz80t8tyzzBPPWTkji+QQQCv
 VqvZGXV6TCgBbr0yuLoa3JpA3PjkaHN8SnN2BIiPSv8ys+TgkRlsalRiCK/k4KQYsLclFfdkWp9
 4eLSJCldDNsZHErqGe9AT6OVwLKQB8rY2mks+UYriVZr4U6NF21RewYk81zigpFjRyPbc/v8w/v
 b3Vay5+tD4AMdI1o+062Tr2kllvK9lYcLkuUUUrbK3yCOY5ic6f7W89Rmtu7lZVtOv92TKPeWhM
 mwtp8URF6NWfKv4IQ2Q==
X-Google-Smtp-Source: AGHT+IHoyiifTHxb2e5hnwkqa2DRgIes/z7ogDdYNSbzzp8UZRdMdrNFcRZFBQ2j3qLjQf1/t/Jfdg==
X-Received: by 2002:a05:6000:4a0d:b0:3a4:cfbf:519b with SMTP id
 ffacd0b85a97d-3a6ed64bfa0mr5288454f8f.44.1750928105157; 
 Thu, 26 Jun 2025 01:55:05 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e805e828sm6927913f8f.32.2025.06.26.01.55.04
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 01:55:04 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 26 Jun 2025 10:54:44 +0200
Message-ID: <20250626085444.568020-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250623160224.953975-1-titouan.christophe@mind.be>
References: <20250623160224.953975-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750928105; x=1751532905; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fZfpv/qREP4vWPXFk+ydEzGBaAp54edmP9xM85HXxP0=;
 b=OpzenLkbwt6eK660gExpJyI5py6CQlhaiLthjvlhTiuLTCLN/XuAsQ0MCB1AYNMrZ6
 SpwT2ktOkaef0MP/yMbXM5TurUR/4sH6giM8itkx/41xDxNWkYDvr+tjLx89abF2MaqY
 o93SB/ZbqFrp0JVGAGSeT9uCBTc0LfT4X2B3yb+Fy7YZq7xE7QxxuQAxrFQz+AbpF1D7
 kusD2kSQ5U1UEBtP7m7vg0Th/EllVudSaEHsVqmsM5HRAbeGpIdMHsNp8lBYCHxfyK5F
 V/E5k/a7V2ncTQRPSv0zEaO46zRcFiXy8twyggv50em/2LRAsedgIYgnSrcXL4d1MDDX
 FhRg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OpzenLkb
Subject: [Buildroot] [PATCH v2] package/libarchive: security bump to v3.8.1
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
- Following the above, AUTORECONF is not needed any longer
- Drop mbedtls patch that has been applied upstream

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
Changes v1->v2:
- Drop AUTORECONF
---
 ...iconv-to-the-.pc-file-if-needed-1825.patch |  31 ---
 ...o-not-add-iconv-for-Requires.private.patch |  27 --
 ...mbedtls-version-3-compatibility-2602.patch | 238 ------------------
 package/libarchive/libarchive.hash            |   7 +-
 package/libarchive/libarchive.mk              |   6 +-
 5 files changed, 5 insertions(+), 304 deletions(-)
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
index 7fec01a040..1dafec726b 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,17 +4,13 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.7.9
+LIBARCHIVE_VERSION = 3.8.1
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
 LIBARCHIVE_LICENSE = BSD-2-Clause, BSD-3-Clause, CC0-1.0, OpenSSL, Apache-2.0
 LIBARCHIVE_LICENSE_FILES = COPYING
 LIBARCHIVE_CPE_ID_VENDOR = libarchive
-# We're patching configure.ac
-LIBARCHIVE_AUTORECONF = YES
-# needed for autoreconf
-LIBARCHIVE_DEPENDENCIES += host-pkgconf
 
 ifeq ($(BR2_PACKAGE_LIBARCHIVE_BSDTAR),y)
 ifeq ($(BR2_STATIC_LIBS),y)
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
