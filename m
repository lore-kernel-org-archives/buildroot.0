Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E9BC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 09:20:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A30660E53
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 09:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A30660E53
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3592C838C0;
	Thu,  5 Aug 2021 09:20:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w8A59osOPerz; Thu,  5 Aug 2021 09:20:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CD5283837;
	Thu,  5 Aug 2021 09:20:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7B96C1BF852
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 09:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B3004023C
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 09:19:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nrLrgZr5RR0m for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 09:19:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9BD8D40222
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 09:19:52 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id d8so5592720wrm.4
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 02:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AKKc3PTQ7ktzfTbRDu6hnhgc0D5tYlfYZ8rNEesfffE=;
 b=gVnDQqyBC+6YIK1YKF8EcOZ3VwAsrAiC7z8gpOaADyGYfbYF9SqBHcEIduCBKPAqqn
 t36DYNBVZupi8aQHQqGbRSlJtkqrcgMcPruaQu6WQfOK3Q7QbO9fRPYmB8qqbPS8a/s3
 31JCFChhZd2L26Wo51BC4CyPm/+3gKcFuRVtXbUM2IYGwEQk5CatC4K59bd8zUq+C5jI
 Te+FuJ5yin61yafYrB5FCvoZiKrjGk0oh434TBb9W4DixvfsBzS+rJi0+90frUa3xH5B
 WQ8X/MP475AlwlDgDSGXb9yCWSB6wwmmryBfw+PTPPondsLF5Zkfn6Uv3M+bbfwwuRnY
 7H+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AKKc3PTQ7ktzfTbRDu6hnhgc0D5tYlfYZ8rNEesfffE=;
 b=apI4ueHP/eO4orYY6e1JJNop/0weHYbLx/l8YM4F0407+IJrgfIdylYo+SsUxkmOOh
 JB1HLmt2eNxvSjSa9hHbvTvA+UazjNqkpbftwdyPxGPcsOUhIXj63KiddMtjJ/8zCLlV
 WVh584VsSB6FnR0j7pvW2RTEbn3e/irI5AITGMyxwCOg8Eo3gOqmtY7LhH9X8/5fJtsf
 T0BQ+2ilpik5dRizrqBK/FFqdbHP0A3HRGCpEMkM31rrBlEz8A0PqdjxYVsR6Vl/FMqZ
 c947n03CAnONEOBg92vk5K/HHE+r5gJ4eU4YjI3TcN56cotblNd0mzG/Sk9v3UtzLrLM
 hchw==
X-Gm-Message-State: AOAM533Ts0kELep9rK4sBiCGZWxwrumS2pDAkM2HsZHAE7WFeDwY7Lgh
 zaQz3tNl1IqyBMjI0NDDUhdvd9M/DkmwEQ==
X-Google-Smtp-Source: ABdhPJwGA8G3u68LeRnSvtXXNh+el5qDAAXuAERB3O4Z3wzfHzMSN1y1bGGpFHBiZ294OaJ4XsaBpw==
X-Received: by 2002:a5d:424d:: with SMTP id s13mr4047485wrr.356.1628155190419; 
 Thu, 05 Aug 2021 02:19:50 -0700 (PDT)
Received: from kali.home (pop.92-184-97-192.mobile.abo.orange.fr.
 [92.184.97.192])
 by smtp.gmail.com with ESMTPSA id f15sm5383412wrp.12.2021.08.05.02.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 02:19:50 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  5 Aug 2021 11:19:38 +0200
Message-Id: <20210805091938.2110379-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210805091938.2110379-1-fontaine.fabrice@gmail.com>
References: <20210805091938.2110379-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/mupdf: fix CVE-2021-37220
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

MuPDF through 1.18.1 has an out-of-bounds write because the cached color
converter does not properly consider the maximum key size of a hash
table. This can, for example, be seen with crafted "mutool draw" input.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...x-key-size-in-cached-color-converter.patch | 116 ++++++++++++++++++
 package/mupdf/mupdf.mk                        |   3 +
 2 files changed, 119 insertions(+)
 create mode 100644 package/mupdf/0003-Bug-703791-Stay-within-hash-table-max-key-size-in-cached-color-converter.patch

diff --git a/package/mupdf/0003-Bug-703791-Stay-within-hash-table-max-key-size-in-cached-color-converter.patch b/package/mupdf/0003-Bug-703791-Stay-within-hash-table-max-key-size-in-cached-color-converter.patch
new file mode 100644
index 0000000000..8a8008d59d
--- /dev/null
+++ b/package/mupdf/0003-Bug-703791-Stay-within-hash-table-max-key-size-in-cached-color-converter.patch
@@ -0,0 +1,116 @@
+From f5712c9949d026e4b891b25837edd2edc166151f Mon Sep 17 00:00:00 2001
+From: Tor Andersson <tor.andersson@artifex.com>
+Date: Tue, 20 Apr 2021 14:46:48 +0200
+Subject: [PATCH] Bug 703791: Stay within hash table max key size in cached
+ color converter.
+
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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
