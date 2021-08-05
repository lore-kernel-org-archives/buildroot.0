Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8AA1C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:54:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B9ED60720
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:54:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B9ED60720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38E244053F;
	Thu,  5 Aug 2021 19:54:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6VNSRLsw5A1U; Thu,  5 Aug 2021 19:54:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4DA040531;
	Thu,  5 Aug 2021 19:54:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 271031BF361
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8C7060600
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:49:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LnKm8PA0waFy for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:49:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D244D60A6C
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:49:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8FD2585C25; Thu,  5 Aug 2021 19:49:40 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 21:09:00 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1d64fe9d58e5d34795afc15d84b961c93ed8f3c1
X-Git-Newrev: 69143ccce0e6def08e10460b4d2ad68e8aa07062
X-Patchwork-Hint: ignore
Message-Id: <20210805194940.8FD2585C25@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mupdf: fix
 CVE-2021-37220
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=69143ccce0e6def08e10460b4d2ad68e8aa07062
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

MuPDF through 1.18.1 has an out-of-bounds write because the cached color
converter does not properly consider the maximum key size of a hash
table. This can, for example, be seen with crafted "mutool draw" input.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...le-max-key-size-in-cached-color-converter.patch | 119 +++++++++++++++++++++
 package/mupdf/mupdf.mk                             |   3 +
 2 files changed, 122 insertions(+)

diff --git a/package/mupdf/0003-Bug-703791-Stay-within-hash-table-max-key-size-in-cached-color-converter.patch b/package/mupdf/0003-Bug-703791-Stay-within-hash-table-max-key-size-in-cached-color-converter.patch
new file mode 100644
index 0000000000..5335f140d6
--- /dev/null
+++ b/package/mupdf/0003-Bug-703791-Stay-within-hash-table-max-key-size-in-cached-color-converter.patch
@@ -0,0 +1,119 @@
+From f5712c9949d026e4b891b25837edd2edc166151f Mon Sep 17 00:00:00 2001
+From: Tor Andersson <tor.andersson@artifex.com>
+Date: Tue, 20 Apr 2021 14:46:48 +0200
+Subject: [PATCH] Bug 703791: Stay within hash table max key size in cached
+ color converter.
+
+[Retrieved from:
+http://git.ghostscript.com/?p=mupdf.git;h=f5712c9949d026e4b891b25837edd2edc166151f]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/mupdf/fitz/hash.h |  2 ++
+ source/fitz/colorspace.c  | 40 ++++++++++++++++++++++++---------------
+ source/fitz/hash.c        |  7 +++----
+ 3 files changed, 30 insertions(+), 19 deletions(-)
+
+diff --git a/include/mupdf/fitz/hash.h b/include/mupdf/fitz/hash.h
+index e92eb0458..feb37a5e4 100644
+--- a/include/mupdf/fitz/hash.h
++++ b/include/mupdf/fitz/hash.h
+@@ -5,6 +5,8 @@
+ #include "mupdf/fitz/context.h"
+ #include "mupdf/fitz/output.h"
+ 
++#define FZ_HASH_TABLE_KEY_LENGTH 48
++
+ /**
+ 	Generic hash-table with fixed-length keys.
+ 
+diff --git a/source/fitz/colorspace.c b/source/fitz/colorspace.c
+index af454caf1..f4db9d3d2 100644
+--- a/source/fitz/colorspace.c
++++ b/source/fitz/colorspace.c
+@@ -1025,23 +1025,30 @@ typedef struct fz_cached_color_converter
+ static void fz_cached_color_convert(fz_context *ctx, fz_color_converter *cc_, const float *ss, float *ds)
+ {
+ 	fz_cached_color_converter *cc = cc_->opaque;
+-	float *val = fz_hash_find(ctx, cc->hash, ss);
+-	int n = cc->base.ds->n * sizeof(float);
+-
+-	if (val)
++	if (cc->hash)
+ 	{
+-		memcpy(ds, val, n);
+-		return;
+-	}
++		float *val = fz_hash_find(ctx, cc->hash, ss);
++		int n = cc->base.ds->n * sizeof(float);
+ 
+-	cc->base.convert(ctx, &cc->base, ss, ds);
++		if (val)
++		{
++			memcpy(ds, val, n);
++			return;
++		}
+ 
+-	val = Memento_label(fz_malloc_array(ctx, cc->base.ds->n, float), "cached_color_convert");
+-	memcpy(val, ds, n);
+-	fz_try(ctx)
+-		fz_hash_insert(ctx, cc->hash, ss, val);
+-	fz_catch(ctx)
+-		fz_free(ctx, val);
++		cc->base.convert(ctx, &cc->base, ss, ds);
++
++		val = Memento_label(fz_malloc_array(ctx, cc->base.ds->n, float), "cached_color_convert");
++		memcpy(val, ds, n);
++		fz_try(ctx)
++			fz_hash_insert(ctx, cc->hash, ss, val);
++		fz_catch(ctx)
++			fz_free(ctx, val);
++	}
++	else
++	{
++		cc->base.convert(ctx, &cc->base, ss, ds);
++	}
+ }
+ 
+ void fz_init_cached_color_converter(fz_context *ctx, fz_color_converter *cc, fz_colorspace *ss, fz_colorspace *ds, fz_colorspace *is, fz_color_params params)
+@@ -1060,7 +1067,10 @@ void fz_init_cached_color_converter(fz_context *ctx, fz_color_converter *cc, fz_
+ 	fz_try(ctx)
+ 	{
+ 		fz_find_color_converter(ctx, &cached->base, ss, ds, is, params);
+-		cached->hash = fz_new_hash_table(ctx, 256, n * sizeof(float), -1, fz_free);
++		if (n * sizeof(float) <= FZ_HASH_TABLE_KEY_LENGTH)
++			cached->hash = fz_new_hash_table(ctx, 256, n * sizeof(float), -1, fz_free);
++		else
++			fz_warn(ctx, "colorspace has too many components to be cached");
+ 	}
+ 	fz_catch(ctx)
+ 	{
+diff --git a/source/fitz/hash.c b/source/fitz/hash.c
+index 882b886c9..287d43f03 100644
+--- a/source/fitz/hash.c
++++ b/source/fitz/hash.c
+@@ -11,11 +11,9 @@
+ 	and removed frequently.
+ */
+ 
+-enum { MAX_KEY_LEN = 48 };
+-
+ typedef struct
+ {
+-	unsigned char key[MAX_KEY_LEN];
++	unsigned char key[FZ_HASH_TABLE_KEY_LENGTH];
+ 	void *val;
+ } fz_hash_entry;
+ 
+@@ -50,7 +48,8 @@ fz_new_hash_table(fz_context *ctx, int initialsize, int keylen, int lock, fz_has
+ {
+ 	fz_hash_table *table;
+ 
+-	assert(keylen <= MAX_KEY_LEN);
++	if (keylen > FZ_HASH_TABLE_KEY_LENGTH)
++		fz_throw(ctx, FZ_ERROR_GENERIC, "hash table key length too large");
+ 
+ 	table = fz_malloc_struct(ctx, fz_hash_table);
+ 	table->keylen = keylen;
+-- 
+2.17.1
+
diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
index d3d9d3b101..c9d5b4a162 100644
--- a/package/mupdf/mupdf.mk
+++ b/package/mupdf/mupdf.mk
@@ -25,6 +25,9 @@ MUPDF_DEPENDENCIES = \
 # 0002-Bug-703366-Fix-double-free-of-object-during-linearization.patch
 MUPDF_IGNORE_CVES += CVE-2021-3407
 
+# 0003-Bug-703791-Stay-within-hash-table-max-key-size-in-cached-color-converter.patch
+MUPDF_IGNORE_CVES += CVE-2021-37220
+
 # The pkg-config name for gumbo-parser is `gumbo`.
 MUPDF_PKG_CONFIG_PACKAGES = \
 	freetype2 \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
