Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28CECC2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 22:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C676A8212C;
	Sat, 17 May 2025 22:24:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IDxRCULrV9di; Sat, 17 May 2025 22:24:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7B4982125
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7B4982125;
	Sat, 17 May 2025 22:24:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B3343E4
 for <buildroot@buildroot.org>; Sat, 17 May 2025 22:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A44EA40481
 for <buildroot@buildroot.org>; Sat, 17 May 2025 22:24:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lif2_GFsvwVM for <buildroot@buildroot.org>;
 Sat, 17 May 2025 22:24:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B8ADA40027
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8ADA40027
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B8ADA40027
 for <buildroot@buildroot.org>; Sat, 17 May 2025 22:24:20 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-85d9a87660fso357809239f.1
 for <buildroot@buildroot.org>; Sat, 17 May 2025 15:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747520659; x=1748125459;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GtG4TWhSbqnmgXQRnfXnktnBYdbhzY4fIU47gda7IJk=;
 b=a6qvH6dc906JXtzlTe+kDrHtj5q1cbGNaCyTWJryV/upLP5IjFxm1PtXpalfQVufFi
 Jg61ANhm0rfJZ00kvXyakV8qjsPo0ZwLosDcyHkphLiPN3/oQ3L/uSYvHeP8Y9rlUKGQ
 ZUAtFHt7/4lE2YVY6O4ivv7jKeb2/CQQqBMcwhvnvvCfc8/jdHEtI8YpcxQ4C2LWgiAT
 9Nk7EGk3U54rqLuyyYNnrEf8SQreHnQxch/vUqg1q1S/fbjWM1E0ulTpasT/tQtVcDCg
 VSA1aTagLyLNCm4HcyEa4gQkKNmYY6HKwGUu8/c37uuObTHWz4S0BeMefpHwr+WZAhJf
 4FnQ==
X-Gm-Message-State: AOJu0YxybBgPpEBKrZXWPssa/Bw6e+VB12KkZTLIwiUgSsIu7yiGINBK
 TqOu4ZspfmkGQar982OXGReJpSohc1ldbthhRpLf59gWGBX0S9Xq8R6WvBKdl9h2
X-Gm-Gg: ASbGncuZg3Cpmj89jmrdMYjRQy3/l7J1YMsXHmOs52CyJ2xrw1Fnv4JgvWqJoZf9Pjr
 46dhrLLkPYzjcBALk+Jnj6uIJh9Y7wHvcN1lzYW1mukpjSdwg4H/cfKoERTIChbw4ui5V66MzVa
 hYoj/Hz7Uh85fRGwJpEIdl3BpFlkFGt0WiejSUlCrTzwO9Aa18FhAMdPRI4x2hgoWhMmT2vLrNn
 ZxcvjyZc5sMZMTN2dxzr4dK4O3moubKGhSv/iiIvQzGD8BZmC65dyTaRWHRecTnt0IF68+azTDS
 3JiWOwQo0kAnB8kkgCzAik91RuxCFDs6nETRJn8jP78MB5Sb4UO7H8MLlL/NHcK4McUVFIvXdir
 Uuf6qDCJaMUdsLoYiPmsoP2cxBmxOfg==
X-Google-Smtp-Source: AGHT+IFmLYazBSt1bpsb9G+ps9uKzIq72tO62yFpEXHEtRB5jdxceNeUDEOUNgWwuXVJwvPjemrl8Q==
X-Received: by 2002:a05:6602:b85:b0:867:667d:18dd with SMTP id
 ca18e2360f4ac-86a24bb2330mr832344539f.1.1747520659206; 
 Sat, 17 May 2025 15:24:19 -0700 (PDT)
Received: from james-x399.localdomain (71-218-120-130.hlrn.qwest.net.
 [71.218.120.130]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-86a235be4f1sm104013739f.5.2025.05.17.15.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 May 2025 15:24:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 17 May 2025 16:24:12 -0600
Message-Id: <20250517222412.4177167-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747520659; x=1748125459; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GtG4TWhSbqnmgXQRnfXnktnBYdbhzY4fIU47gda7IJk=;
 b=DrY10EsUjvN3blIzeqm3uSrQXoeBGui1slu/R7nfOhBwYls/PEM1r7oC0aSj2K4yi8
 8WkHG3xLguhUzvAkCb5r/A9fVJbCpWOnR9+keczRi/GiVg4+tf1f60g3i1c6Xs7XcpsM
 TfxT4hXmUJy0C6PwlLKwaqfawEwbNFo4IztOwBKH6ZGe8Y3ScTWCU65We7BXylPLDCY3
 fR8XeATgg1Smzz3bEiks6ti3pNEEumZDmDlxj20r7oHsSGPyC51xnmODulz3J3qSELCK
 75DaWGwHMtr4MufHCoLVjhxzSYvAHg/KJ+B9zS53ENxOIYlxB7aJX2m9UBzBqiqgAgOm
 ZmVw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DrY10EsU
Subject: [Buildroot] [PATCH 1/1] package/libarchive: fix mbedtls 3
 compatibility
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

Backport a patch fixing mbedtls 3 compatibility.

This broke in buildroot when mbedtls was bumped to 3.6.3.1 in
3481a9643fc7223e400ed877f08ade34d44e6b78.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...mbedtls-version-3-compatibility-2602.patch | 238 ++++++++++++++++++
 1 file changed, 238 insertions(+)
 create mode 100644 package/libarchive/0003-Fix-mbedtls-version-3-compatibility-2602.patch

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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
