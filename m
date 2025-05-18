Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD9CC3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 409EA8497A;
	Mon, 19 May 2025 11:04:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0HfyzQqRfnM8; Mon, 19 May 2025 11:04:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 451578497C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 451578497C;
	Mon, 19 May 2025 11:04:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4519C193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7774E41E5C
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eer83e062P_U for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3E8041EA9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3E8041EA9
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F26C4872E7; Mon, 19 May 2025 10:40:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 08:42:53 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 57eb26837b971e969a37e07b87e57bf4e9df9f34
X-Git-Newrev: 0b0662f02a0e779f72a6f3ed5f024c6c065d9aa7
X-Patchwork-Hint: ignore
Message-Id: <20250519104008.F26C4872E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libarchive: fix
 mbedtls 3 compatibility
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0b0662f02a0e779f72a6f3ed5f024c6c065d9aa7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Backport a patch fixing mbedtls 3 compatibility.

This broke in buildroot when mbedtls was bumped to 3.6.3.1 in
3481a9643fc7223e400ed877f08ade34d44e6b78.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-Fix-mbedtls-version-3-compatibility-2602.patch | 238 +++++++++++++++++++++
 1 file changed, 238 insertions(+)

diff --git a/package/libarchive/0003-Fix-mbedtls-version-3-compatibility-2602.patch b/package/libarchive/0003-Fix-mbedtls-version-3-compatibility-2602.patch
new file mode 100644
index 0000000000..67fb3ff738
--- /dev/null
+++ b/package/libarchive/0003-Fix-mbedtls-version-3-compatibility-2602.patch
@@ -0,0 +1,238 @@
+From 26ba5ee5d560d62ad05aa6819608fd21cbb962f9 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Thu, 15 May 2025 04:56:59 -0600
+Subject: [PATCH] Fix mbedtls version 3 compatibility (#2602)
+
+We need to use the new API for mbedtls 3 compatibility
+
+Fixes #2025
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://github.com/libarchive/libarchive/commit/63d7c24eeaa108ecc2ef258c0505eefdadaaaf35
+---
+ libarchive/archive_digest.c | 72 +++++++++++++++++++++++++++++++++++++
+ 1 file changed, 72 insertions(+)
+
+diff --git a/libarchive/archive_digest.c b/libarchive/archive_digest.c
+index 33518740..03f0edd6 100644
+--- a/libarchive/archive_digest.c
++++ b/libarchive/archive_digest.c
+@@ -235,7 +235,11 @@ static int
+ __archive_md5init(archive_md5_ctx *ctx)
+ {
+   mbedtls_md5_init(ctx);
++#if MBEDTLS_VERSION_NUMBER > 0x03000000
++  if (mbedtls_md5_starts(ctx) == 0)
++#else
+   if (mbedtls_md5_starts_ret(ctx) == 0)
++#endif
+     return (ARCHIVE_OK);
+   else
+     return (ARCHIVE_FATAL);
+@@ -245,7 +249,11 @@ static int
+ __archive_md5update(archive_md5_ctx *ctx, const void *indata,
+     size_t insize)
+ {
++#if MBEDTLS_VERSION_NUMBER > 0x03000000
++  if (mbedtls_md5_update(ctx, indata, insize) == 0)
++#else
+   if (mbedtls_md5_update_ret(ctx, indata, insize) == 0)
++#endif
+     return (ARCHIVE_OK);
+   else
+     return (ARCHIVE_FATAL);
+@@ -254,7 +262,11 @@ __archive_md5update(archive_md5_ctx *ctx, const void *indata,
+ static int
+ __archive_md5final(archive_md5_ctx *ctx, void *md)
+ {
++#if MBEDTLS_VERSION_NUMBER > 0x03000000
++  if (mbedtls_md5_finish(ctx, md) == 0) {
++#else
+   if (mbedtls_md5_finish_ret(ctx, md) == 0) {
++#endif
+     mbedtls_md5_free(ctx);
+     return (ARCHIVE_OK);
+   } else {
+@@ -431,7 +443,11 @@ static int
+ __archive_ripemd160init(archive_rmd160_ctx *ctx)
+ {
+   mbedtls_ripemd160_init(ctx);
++#if MBEDTLS_VERSION_NUMBER > 0x03000000
++  if (mbedtls_ripemd160_starts(ctx) == 0)
++#else
+   if (mbedtls_ripemd160_starts_ret(ctx) == 0)
++#endif
+     return (ARCHIVE_OK);
+   else
+     return (ARCHIVE_FATAL);
+@@ -441,7 +457,11 @@ static int
+ __archive_ripemd160update(archive_rmd160_ctx *ctx, const void *indata,
+     size_t insize)
+ {
++#if MBEDTLS_VERSION_NUMBER > 0x03000000
++  if (mbedtls_ripemd160_update(ctx, indata, insize) == 0)
++#else
+   if (mbedtls_ripemd160_update_ret(ctx, indata, insize) == 0)
++#endif
+     return (ARCHIVE_OK);
+   else
+     return (ARCHIVE_FATAL);
+@@ -450,7 +470,11 @@ __archive_ripemd160update(archive_rmd160_ctx *ctx, const void *indata,
+ static int
+ __archive_ripemd160final(archive_rmd160_ctx *ctx, void *md)
+ {
++#if MBEDTLS_VERSION_NUMBER > 0x03000000
++  if (mbedtls_ripemd160_finish(ctx, md) == 0) {
++#else
+   if (mbedtls_ripemd160_finish_ret(ctx, md) == 0) {
++#endif
+     mbedtls_ripemd160_free(ctx);
+     return (ARCHIVE_OK);
+   } else {
+@@ -622,7 +646,11 @@ static int
+ __archive_sha1init(archive_sha1_ctx *ctx)
+ {
+   mbedtls_sha1_init(ctx);
++#if MBEDTLS_VERSION_NUMBER > 0x03000000
++  if (mbedtls_sha1_starts(ctx) == 0)
++#else
+   if (mbedtls_sha1_starts_ret(ctx) == 0)
++#endif
+     return (ARCHIVE_OK);
+   else
+     return (ARCHIVE_FATAL);
+@@ -632,7 +660,11 @@ static int
+ __archive_sha1update(archive_sha1_ctx *ctx, const void *indata,
+     size_t insize)
+ {
++#if MBEDTLS_VERSION_NUMBER > 0x03000000
++  if (mbedtls_sha1_update(ctx, indata, insize) == 0)
++#else
+   if (mbedtls_sha1_update_ret(ctx, indata, insize) == 0)
++#endif
+     return (ARCHIVE_OK);
+   else
+     return (ARCHIVE_FATAL);
+@@ -641,7 +673,11 @@ __archive_sha1update(archive_sha1_ctx *ctx, const void *indata,
+ static int
+ __archive_sha1final(archive_sha1_ctx *ctx, void *md)
+ {
++#if MBEDTLS_VERSION_NUMBER > 0x03000000
++  if (mbedtls_sha1_finish(ctx, md) == 0) {
++#else
+   if (mbedtls_sha1_finish_ret(ctx, md) == 0) {
++#endif
+     mbedtls_sha1_free(ctx);
+     return (ARCHIVE_OK);
+   } else {
+@@ -890,7 +926,11 @@ static int
+ __archive_sha256init(archive_sha256_ctx *ctx)
+ {
+   mbedtls_sha256_init(ctx);
++#if MBEDTLS_VERSION_NUMBER > 0x03000000
++  if (mbedtls_sha256_starts(ctx, 0) == 0)
++#else
+   if (mbedtls_sha256_starts_ret(ctx, 0) == 0)
++#endif
+     return (ARCHIVE_OK);
+   else
+     return (ARCHIVE_FATAL);
+@@ -900,7 +940,11 @@ static int
+ __archive_sha256update(archive_sha256_ctx *ctx, const void *indata,
+     size_t insize)
+ {
++#if MBEDTLS_VERSION_NUMBER > 0x03000000
++  if (mbedtls_sha256_update(ctx, indata, insize) == 0)
++#else
+   if (mbedtls_sha256_update_ret(ctx, indata, insize) == 0)
++#endif
+     return (ARCHIVE_OK);
+   else
+     return (ARCHIVE_FATAL);
+@@ -909,7 +953,11 @@ __archive_sha256update(archive_sha256_ctx *ctx, const void *indata,
+ static int
+ __archive_sha256final(archive_sha256_ctx *ctx, void *md)
+ {
++#if MBEDTLS_VERSION_NUMBER > 0x03000000
++  if (mbedtls_sha256_finish(ctx, md) == 0) {
++#else
+   if (mbedtls_sha256_finish_ret(ctx, md) == 0) {
++#endif
+     mbedtls_sha256_free(ctx);
+     return (ARCHIVE_OK);
+   } else {
+@@ -1130,7 +1178,11 @@ static int
+ __archive_sha384init(archive_sha384_ctx *ctx)
+ {
+   mbedtls_sha512_init(ctx);
++#if MBEDTLS_VERSION_NUMBER > 0x03000000
++  if (mbedtls_sha512_starts(ctx, 1) == 0)
++#else
+   if (mbedtls_sha512_starts_ret(ctx, 1) == 0)
++#endif
+     return (ARCHIVE_OK);
+   else
+     return (ARCHIVE_FATAL);
+@@ -1140,7 +1192,11 @@ static int
+ __archive_sha384update(archive_sha384_ctx *ctx, const void *indata,
+     size_t insize)
+ {
++#if MBEDTLS_VERSION_NUMBER > 0x03000000
++  if (mbedtls_sha512_update(ctx, indata, insize) == 0)
++#else
+   if (mbedtls_sha512_update_ret(ctx, indata, insize) == 0)
++#endif
+     return (ARCHIVE_OK);
+   else
+     return (ARCHIVE_FATAL);
+@@ -1149,7 +1205,11 @@ __archive_sha384update(archive_sha384_ctx *ctx, const void *indata,
+ static int
+ __archive_sha384final(archive_sha384_ctx *ctx, void *md)
+ {
++#if MBEDTLS_VERSION_NUMBER > 0x03000000
++  if (mbedtls_sha512_finish(ctx, md) == 0) {
++#else
+   if (mbedtls_sha512_finish_ret(ctx, md) == 0) {
++#endif
+     mbedtls_sha512_free(ctx);
+     return (ARCHIVE_OK);
+   } else {
+@@ -1394,7 +1454,11 @@ static int
+ __archive_sha512init(archive_sha512_ctx *ctx)
+ {
+   mbedtls_sha512_init(ctx);
++#if MBEDTLS_VERSION_NUMBER > 0x03000000
++  if (mbedtls_sha512_starts(ctx, 0) == 0)
++#else
+   if (mbedtls_sha512_starts_ret(ctx, 0) == 0)
++#endif
+     return (ARCHIVE_OK);
+   else
+     return (ARCHIVE_FATAL);
+@@ -1404,7 +1468,11 @@ static int
+ __archive_sha512update(archive_sha512_ctx *ctx, const void *indata,
+     size_t insize)
+ {
++#if MBEDTLS_VERSION_NUMBER > 0x03000000
++  if (mbedtls_sha512_update(ctx, indata, insize) == 0)
++#else
+   if (mbedtls_sha512_update_ret(ctx, indata, insize) == 0)
++#endif
+     return (ARCHIVE_OK);
+   else
+     return (ARCHIVE_FATAL);
+@@ -1413,7 +1481,11 @@ __archive_sha512update(archive_sha512_ctx *ctx, const void *indata,
+ static int
+ __archive_sha512final(archive_sha512_ctx *ctx, void *md)
+ {
++#if MBEDTLS_VERSION_NUMBER > 0x03000000
++  if (mbedtls_sha512_finish(ctx, md) == 0) {
++#else
+   if (mbedtls_sha512_finish_ret(ctx, md) == 0) {
++#endif
+     mbedtls_sha512_free(ctx);
+     return (ARCHIVE_OK);
+   } else {
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
