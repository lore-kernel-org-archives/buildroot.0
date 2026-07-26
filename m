Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F830C531C9
	for <buildroot@archiver.kernel.org>; Sun, 26 Jul 2026 21:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3D23606AA;
	Sun, 26 Jul 2026 21:23:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2FsAiUGRBCI2; Sun, 26 Jul 2026 21:23:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18C82606A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785100989;
	bh=M4wKQocK6lqroOodq0mizkumc4bw6+7T6PkWkVmHPuY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kIcwGkid4iZgd4YQSQZ+8yVLZkGI9hgQRLZ1asNJx2/tHmTnBZCcFHVOwqxAGVcRI
	 Usaoqxc5L5MOfd4N6N9kgRCIHbcEdYmk4z79lkoZhgnZsCeCjbdEMGZE3rXiAw7ONB
	 Ib2NXBxFnFSoyJm/tK80UO/VtevGzrSDF+QgVM+p/Wc3JytgGBLAVQ2gihuDfi6cUs
	 +wuMmyKZM8V47l9loSI/t/fe+sQbfWKekFEon/Xmoi56DdStIy0q7a3p2jy8Lvco12
	 AFHRNq1HM7SVOpq9BhRG3rEmrf4kzP/OCOoSz3UQ9jzqWOi1C3f302KoopOt3dxrEW
	 4vWTUTP8xZjzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18C82606A2;
	Sun, 26 Jul 2026 21:23:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B4FD39E
 for <buildroot@buildroot.org>; Sun, 26 Jul 2026 21:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D4F4606A2
 for <buildroot@buildroot.org>; Sun, 26 Jul 2026 21:23:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7z1SX9ZxxSCx for <buildroot@buildroot.org>;
 Sun, 26 Jul 2026 21:23:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 132A960648
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 132A960648
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 132A960648
 for <buildroot@buildroot.org>; Sun, 26 Jul 2026 21:23:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0445.dip0.t-ipconnect.de [91.58.4.69])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7F8A9A4C41F0;
 Sun, 26 Jul 2026 23:22:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42668)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wo6J7-00000000669-2CKp;
 Sun, 26 Jul 2026 21:22:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Murat Demirten <mdemirten@yh.com.tr>
Date: Sun, 26 Jul 2026 23:22:48 +0200
Message-ID: <20260726212249.155140-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260726212249.155140-1-bernd@kuhls.net>
References: <20260726212249.155140-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1785100969;
 bh=QDp43LYsNyndVrdDISf0/YOwBnmQnxLhQN3AA0c+si0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=jIeHG+7AyKWX/FyQF8+WD5mpK7DWidFfg8E4jrQOsgBnCtUZ+B7mTmhtEy6XYHrVU
 bEF18C5qxByEoXEih79VOGT6G/7bw0U9MK2PQYiK6HGT93TbEkGREZte2zJ01Uhgyb
 FGVQyzDhfe0JuKRTsLmOt5S4w64Sje+uV8co8GUKOIV8BWyp6alIorH7mgb1/AkZ2u
 FO8JkEvABjfOtkcssARKJ/w3PlpoDKUuTVrS2BVbpxYuuQcAYiu5mJ5737WZGCxVoh
 p1fxCAKGkIymv0BdvIR7qaj9bSQUqBgw4knIrIIv42FrMIJ+16VGzIm+EpPIfpgwtP
 xef7u3JrCy/xg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jIeHG+7A
Subject: [Buildroot] [PATCH v2 2/2] package/jpeg-turbo: fix libm linking
 issue
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

Buildroot commit bb38f6f7208497cf5a4df922e833492001170111 bumped the
package to 3.2.0. This version first included upstream commit
https://github.com/libjpeg-turbo/libjpeg-turbo/commit/ed00e0f4b39291e954958b96a8d941ca4a9e03a2
which removed the dependency to libm causing build errors detected by
the autobuilders.

Disabling the build of tests by the previous patch of this series is not
enough because the build will fail on other tools like

[ 98%] Linking C executable djpeg-static
/home/bernd/buildroot/output/per-package/jpeg-turbo/host/bin/../lib/gcc/i686-buildroot-linux-gnu/15.3.0/../../../../i686-buildroot-linux-gnu/bin/ld:
 src/spng/CMakeFiles/spng-static.dir/spng.c.o: in function
 `spng_decode_image':
spng.c:(.text+0x4c62): undefined reference to `__fpclassifyf'

Add upstream commit to fix the problem.

Fixes:
https://autobuild.buildroot.net/results/981/98114d4ea7afe62bb4cef934a06bf289d863ad3f/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: add upstream commit instead of -lm

Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/42f55ce3d2bd3c15b6e8f865676bc17899cbe79c

 ...-Really-remove-gamma-correction-code.patch | 113 ++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100644 package/jpeg-turbo/0001-libspng-Really-remove-gamma-correction-code.patch

diff --git a/package/jpeg-turbo/0001-libspng-Really-remove-gamma-correction-code.patch b/package/jpeg-turbo/0001-libspng-Really-remove-gamma-correction-code.patch
new file mode 100644
index 0000000000..594e28f65c
--- /dev/null
+++ b/package/jpeg-turbo/0001-libspng-Really-remove-gamma-correction-code.patch
@@ -0,0 +1,113 @@
+From 0da22762971551462cfad8f0b11cfb037472a4e8 Mon Sep 17 00:00:00 2001
+From: DRC <information@libjpeg-turbo.org>
+Date: Thu, 16 Jul 2026 12:09:54 -0400
+Subject: [PATCH] libspng: Really remove gamma correction code
+
+We really don't use it, and fpclassify() apparently introduces yet
+another libm dependency in some cases (although I can't reproduce that.)
+
+Fixes #904
+
+Upstream: https://github.com/libjpeg-turbo/libjpeg-turbo/commit/0da22762971551462cfad8f0b11cfb037472a4e8
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/spng/spng.c | 20 ++++++++++++++++++--
+ 1 file changed, 18 insertions(+), 2 deletions(-)
+
+diff --git a/src/spng/spng.c b/src/spng/spng.c
+index 06249d68..aeadb67e 100644
+--- a/src/spng/spng.c
++++ b/src/spng/spng.c
+@@ -353,9 +353,12 @@ struct spng_ctx
+     int widest_pass;
+     int last_pass; /* last non-empty pass */
+ 
++#if 0 /* libjpeg-turbo: Eliminate unused gamma correction code, which
++         introduces an unwanted libm dependency */
+     uint16_t *gamma_lut; /* points to either _lut8 or _lut16 */
+     uint16_t *gamma_lut16;
+     uint16_t gamma_lut8[256];
++#endif
+     unsigned char trns_px[8];
+     union spng__decode_plte decode_plte;
+     struct spng_sbit decode_sb;
+@@ -1742,6 +1745,8 @@ static uint16_t sample_to_target(uint16_t sample, unsigned bit_depth, unsigned s
+     return sample;
+ }
+ 
++#if 0 /* libjpeg-turbo: Eliminate unused gamma correction code, which
++         introduces an unwanted libm dependency */
+ static inline void gamma_correct_row(unsigned char *row, uint32_t pixels, int fmt, const uint16_t *gamma_lut)
+ {
+     uint32_t i;
+@@ -1785,6 +1790,7 @@ static inline void gamma_correct_row(unsigned char *row, uint32_t pixels, int fm
+         }
+     }
+ }
++#endif
+ 
+ /* Apply transparency to output row */
+ static inline void trns_row(unsigned char *row,
+@@ -3302,7 +3308,10 @@ int spng_decode_scanline(spng_ctx *ctx, void *out, size_t len)
+     const struct spng_subimage *sub = ctx->subimage;
+ 
+     const struct spng_ihdr *ihdr = &ctx->ihdr;
++#if 0 /* libjpeg-turbo: Eliminate unused gamma correction code, which
++         introduces an unwanted libm dependency */
+     const uint16_t *gamma_lut = ctx->gamma_lut;
++#endif
+     unsigned char *trns_px = ctx->trns_px;
+     const struct spng_sbit *sb = &ctx->decode_sb;
+     const struct spng_plte_entry *plte = ctx->decode_plte.rgba;
+@@ -3529,7 +3538,10 @@ int spng_decode_scanline(spng_ctx *ctx, void *out, size_t len)
+ 
+     if(f.do_scaling) scale_row(out, width, fmt, processing_depth, sb);
+ 
++#if 0 /* libjpeg-turbo: Eliminate unused gamma correction code, which
++         introduces an unwanted libm dependency */
+     if(f.apply_gamma) gamma_correct_row(out, width, fmt, gamma_lut);
++#endif
+ 
+     /* The previous scanline is always defiltered */
+     void *t = ctx->prev_scanline;
+@@ -3768,6 +3780,8 @@ int spng_decode_image(spng_ctx *ctx, void *out, size_t len, int fmt, int flags)
+ 
+     /*if(f.same_layout && !flags && !f.interlaced) f.zerocopy = 1;*/
+ 
++#if 0 /* libjpeg-turbo: Eliminate unused gamma correction code, which
++         introduces an unwanted libm dependency */
+     uint16_t *gamma_lut = NULL;
+ 
+     if(f.apply_gamma)
+@@ -3807,15 +3821,14 @@ int spng_decode_image(spng_ctx *ctx, void *out, size_t len, int fmt, int flags)
+         unsigned i;
+         for(i=0; i < lut_entries; i++)
+         {
+-#if 0 /* libjpeg-turbo: Eliminate libm dependency */
+             float c = pow((float)i / max, exponent) * max;
+-#endif
+             float c = 0.0f;
+             if(c > max) c = max;
+ 
+             gamma_lut[i] = (uint16_t)c;
+         }
+     }
++#endif
+ 
+     struct spng_sbit *sb = &ctx->decode_sb;
+ 
+@@ -5000,7 +5013,10 @@ void spng_ctx_free(spng_ctx *ctx)
+ 
+     if(!ctx->user_owns_out_png) spng__free(ctx, ctx->out_png);
+ 
++#if 0 /* libjpeg-turbo: Eliminate unused gamma correction code, which
++         introduces an unwanted libm dependency */
+     spng__free(ctx, ctx->gamma_lut16);
++#endif
+ 
+     spng__free(ctx, ctx->row_buf);
+     spng__free(ctx, ctx->scanline_buf);
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
