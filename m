Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D0BC624D3
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 11:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92A0A60BFF;
	Fri,  4 Sep 2026 11:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YGy9uWC37qWc; Fri,  4 Sep 2026 11:16:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4D63860BEC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788520610;
	b=Jug7dkkJB5msSb3Nb4EMOTzhrjgP5l1AGv0nYiCY8GfrnMt+ETn6tn4PgO+JnZkUlfcw
	 1x4U9vd5Qnfzg6N04VOUOmz/TXgiIsiYknpLikKyZ09u/w9KvSTSH2vShJW8nzLcX1aTT
	 TgS/c5W0vAC9tWi2efTXWxXMaK6Y/Obo2oIQE9N6w3F2cWpjm09s1RG/QbkzVvHeWBGEy
	 Ut/Xxnn8oUDQUmBG+lfXoCfqq6LGLLMM8sOhRyZY/YwYaBfCLHY+EmCcL1sWfT8R/krxy
	 ypnFDcHUilbVP+ZuxxLXA2r7PgpDBFAEVx9vsJltWPB4hz7WGDAbNZNvi1L9p68IlzA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788520610;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3qVmm6bH7733T4jNQGxSioAVK8ECWXsuZ/ppNHZSlm0=;
	b=DbLCWiKv2Dx5S8rkr8pKf7gqh1CWfyQ6Dx/MD4R6jIdLCzdgYZBLFBPPnM2/Cg505sqK
	 dUkbmWiuETBFG6p/DIiLCRD5dEZ2bjJqosCCVysRLNhR+P8YG4cMzcqB+hzG4NtiUVJe3
	 qJaDoQNiepZ6dbDeMsF/3YWsOsnJV3+FsLUKFgUjULBAQuN+LI/MFNBRe+GWHIaQhlVb1
	 ObLUgu70qI34tFyyjTKzLnWXvZFD47SWltUGkE2Oj4TEOmY5TUFytTJndVUSQ+JYKdPDy
	 VYloBmrPX7zjO8aIH5OoOOXcjCLgNq/prTmQnsJiA8YbaDnYPlYl8HmSDaJRjf+UFRg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788520610;
	bh=3qVmm6bH7733T4jNQGxSioAVK8ECWXsuZ/ppNHZSlm0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=G4i1kmWe1tpUnT3z/3RpJdALyEmMuHTqSjb/qBa9sn5qXrJz5wac3qcX7OkFyk0Ed
	 spHoXUdM7ZGw8zfOQdYFGXLJTVz639GFzlqxMlL0hYSmbrCljugwu+Wbnu/FgWvsQo
	 5lSE2RBHGaGhxfoIGw8MB46d++IcFFSBsiKy08BTonbRiBLhqnr2PbWvfF1oa3vRtE
	 0FSnU1y8S9ipM1OeLkOKAvejcdI9gtzrXAGDczdxd9r7KGrJ0j0LqZgYqfzkQLJoME
	 qQHTzKhZjJdDnLk4bGD3B6FWapRdzs2IqqHg51nZtElK5VqDvcKrF6A5sXtrnhy9wE
	 kTEzq1QkZ3EBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D63860BEC;
	Fri,  4 Sep 2026 11:16:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EFA1A200E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D63BC40B25
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:16:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s9NpfaeFflJT for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 11:16:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1FE6340B48
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788520603;
 b=OO1wvlV2rxfn3kI8mL1/OFE4wNE03iGl3K1HersdzKi4hZx6oEIWrEJc3ljWjhJZ6MQd
 1PA/doKltSw/XLMP35Xl857oUxBjw/jLwoG0ft8aSwLCoV6NBRbzhwTFgP2VaLUPrfL20
 LMlNj0i0d0LEpUCjRbpccFqKOV3rPEmK70/HoXLrzxQ1++++TEc7O6nyVOnRpTToIGX58
 EH+19jD1jf3coZTYOTUsnVx+thcCUi3+9ravvJZ+HZvQibo52qJ6ATM4zAmp8v7csBwk8
 3FZezLTU0b/Oq0E8KlnXGJrf7MIx7lBXFoYbJcvbN5lsSZ3r2KVsW6siUfg30X1k4wA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788520603;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=HwrznS3liH832NmfdnSdtPKITtwUeCYDyOrlj9Sacj0=;
 b=Bqnx+B8NAkvlbvd/rOuIE8H7c51XxbjyKSF++2SCAokg+On7jTtBBtZ7SUtBAYCq6ViL
 QthtDEd4FuRxN/kr0Nj0Qr42gyhWBcqLU+FQ8wDXCN4ZGtlkeutSiwstxhgbsYdv7sP1K
 YlvmEAnA8aFI9CpzRb6HZkhE9DnT46kO7/MU2dxdxdooHqE2dnbVc4zK31NtSgIYL1Xqo
 Nyfc1xuYz+ZyBVmfZyFgc1qrgMDwutWDo59X1Xd1GFXka5/pHfI4R68PkX5vooUXsnHNu
 16jGr4IP/y2kN1+64tgZ3kU5X8PYCaoX9lke5C9YYE8+QlDJCziOZ5X18TnahF7IMHA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FE6340B48
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:16:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8AAB494708; Fri,  4 Sep 2026 11:15:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Sep 2026 09:53:45 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 13726d5e6bedcc561f4d1fd930b3f892436567e9
X-Git-Newrev: b226c11847b90b18b60ff8fcb84a7ac23078f390
X-Patchwork-Hint: ignore
Message-Id: <20260904111542.8AAB494708@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/jpeg-turbo: fix
 libm linking issue
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b226c11847b90b18b60ff8fcb84a7ac23078f390
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c0a51767a0d33b5f8da866a6a0f1f35968311614)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...bspng-Really-remove-gamma-correction-code.patch | 113 +++++++++++++++++++++
 1 file changed, 113 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
