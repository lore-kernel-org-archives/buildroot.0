Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51822C3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 21:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DF5682F0F;
	Mon,  8 Jan 2024 21:14:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DF5682F0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DvVZq0wGMrxX; Mon,  8 Jan 2024 21:14:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 490D582A3B;
	Mon,  8 Jan 2024 21:14:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 490D582A3B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 86C341BF3AA
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 21:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D94C418E2
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 21:14:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D94C418E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9jAlUU0VSmjo for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 21:14:27 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E882D41860
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 21:14:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E882D41860
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40e45504006so9778525e9.1
 for <buildroot@buildroot.org>; Mon, 08 Jan 2024 13:14:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704748464; x=1705353264;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pSQCxW4ZqEzQhHhXzHvj5NPMnHQIMRxKfRwSQ1/9oWA=;
 b=vBEPS7R5nYBmtZxMY7wVMl2uQRrFh96mhy9NgdDQ5ktnFMlQrh5o6ODvX8ApOMi0x3
 LR8lbtrs+R5Pctfp0a5mpuC2nb0VagqBzz9hpgEz9APKIPbI7lkYXvieHvyG7XATyKqJ
 Z8gm4i9TIhLy8Nbm8lKi07IzxwyMPXhZ9nbbiGgqwiFSQaoC/ppGlPU647hEHILVb+QV
 Jp/E7rCgEUJwnf+ghXGRPLbhnLkjpvSKj8lw3v1QV3H1WPWT2ILINpuQJMFG6Vk3o7NE
 aHxU+Ds9YwEnxamRw/5jQ6O3T2smxWwhvbG/GW+Al/upkCkkAJzN/4Bi6nPg47FiS6X2
 zijQ==
X-Gm-Message-State: AOJu0YwOg/qqJycPUKPpVpsdO8aqTo4DEArWS0bXoSkbuWGJ2fq67Ejx
 vs2bHQ2LlHwsxEVi15WPgTSbvqqO0HE=
X-Google-Smtp-Source: AGHT+IHmCjQb43SGA7P0kuSEeyJg8sa4Lj4SgqBd6heornAiUtH+FOPwtU1wra3UVhSGS2/qyPLNSA==
X-Received: by 2002:a05:600c:2609:b0:40e:4a77:2a3c with SMTP id
 h9-20020a05600c260900b0040e4a772a3cmr172291wma.94.1704748464126; 
 Mon, 08 Jan 2024 13:14:24 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p6-20020a05600c1d8600b0040e4c1dade4sm1044071wms.36.2024.01.08.13.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 13:14:23 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Jan 2024 22:14:20 +0100
Message-ID: <20240108211420.360412-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704748464; x=1705353264; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pSQCxW4ZqEzQhHhXzHvj5NPMnHQIMRxKfRwSQ1/9oWA=;
 b=Fy/fCh3Mqm9oBN+mlqAF/Li9RFP8dESz1QQlO8zozTY+2Vps0fmuiZPsAuy6iisrUL
 aNiulQyFqiUCu9OVUeuAodmP2p9qxgG9cUz4TzUgX6uJxeahBp3Up1rJut+EIEN6Ai/F
 ukPGQW2Sf/uayFnT6xk087JfpFkgX9I57qSrGvEddZTnA3R959QaJjW4yjPGfby/S6Qq
 srny3sJpOSpJV6G5PjLnLGW0Ksuc0g8P//W1JojtlmiwjgmznyiUC1Pxeuu+A+V0P18I
 O4evk3sleyjJ9HNX6E3LQPoIrk8ZGZ2uTgZUW2F4UMFHePBpJmPQmE2hLyqmHLPouysy
 NuoQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Fy/fCh3M
Subject: [Buildroot] [PATCH v3,1/1] package/liquid-dsp: fix x86 builds
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

HAVE_{MMX,SSE2,...} are not defined if ax_cv_have_{i}_cpu_ext is not set
resulting in the following build failure raised since bump to version
1.5.0 in commit c2aaa0fbe2fdf6e599c68169aa7b2e55237190c7 and
https://github.com/jgaeddert/liquid-dsp/commit/02c4e8b99b11d9f1615b8840f243b08a85b86563:

src/dotprod/src/dotprod_cccf.sse.c: In function 'dotprod_cccf_execute_sse':
src/dotprod/src/dotprod_cccf.sse.c:258:5: error: unknown type name '__m128'; did you mean '__int128'?
  258 |     __m128 v;   // input vector
      |     ^~~~~~
      |     __int128

or

src/dotprod/src/dotprod_cccf.mmx.c: In function 'dotprod_cccf_execute_mmx':
src/dotprod/src/dotprod_cccf.mmx.c:262:5: error: unknown type name '__m128'; did you mean '__int128'?
  262 |     __m128 v;   // input vector
      |     ^~~~~~
      |     __int128

While at it, add AVX2 support

Fixes:
 - http://autobuild.buildroot.org/results/738ce9d3dc74ec165391f21256c955e5524f1632
 - http://autobuild.buildroot.org/results/a2d150c724ab6787aeabaf31f65116f802e8584e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v2 -> v3 (after review of Yann E. Morin):
 - Keep current list format

Changes v1 -> v2:
 - Keep old options (mmx, etc.) as they seem to be still used somewhere
   in the code

 package/liquid-dsp/liquid-dsp.mk | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/liquid-dsp/liquid-dsp.mk b/package/liquid-dsp/liquid-dsp.mk
index eb4cda67a5..ce4cd5a7a7 100644
--- a/package/liquid-dsp/liquid-dsp.mk
+++ b/package/liquid-dsp/liquid-dsp.mk
@@ -13,13 +13,23 @@ LIQUID_DSP_AUTORECONF = YES
 
 LIQUID_DSP_CONF_ENV = \
 	ax_cv_have_mmx_ext=$(if $(BR2_X86_CPU_HAS_MMX),yes,no) \
+	ax_cv_have_mmx_cpu_ext=$(if $(BR2_X86_CPU_HAS_MMX),yes,no) \
 	ax_cv_have_sse_ext=$(if $(BR2_X86_CPU_HAS_SSE),yes,no) \
+	ax_cv_have_sse_cpu_ext=$(if $(BR2_X86_CPU_HAS_SSE),yes,no) \
 	ax_cv_have_sse2_ext=$(if $(BR2_X86_CPU_HAS_SSE2),yes,no) \
+	ax_cv_have_sse2_cpu_ext=$(if $(BR2_X86_CPU_HAS_SSE2),yes,no) \
 	ax_cv_have_sse3_ext=$(if $(BR2_X86_CPU_HAS_SSE3),yes,no) \
+	ax_cv_have_sse3_cpu_ext=$(if $(BR2_X86_CPU_HAS_SSE3),yes,no) \
 	ax_cv_have_ssse3_ext=$(if $(BR2_X86_CPU_HAS_SSSE3),yes,no) \
+	ax_cv_have_ssse3_cpu_ext=$(if $(BR2_X86_CPU_HAS_SSSE3),yes,no) \
 	ax_cv_have_sse41_ext=$(if $(BR2_X86_CPU_HAS_SSE4),yes,no) \
+	ax_cv_have_sse41_cpu_ext=$(if $(BR2_X86_CPU_HAS_SSE4),yes,no) \
 	ax_cv_have_sse42_ext=$(if $(BR2_X86_CPU_HAS_SSE42),yes,no) \
-	ax_cv_have_avx_ext=$(if $(BR2_X86_CPU_HAS_AVX),yes,no)
+	ax_cv_have_sse42_cpu_ext=$(if $(BR2_X86_CPU_HAS_SSE42),yes,no) \
+	ax_cv_have_avx_ext=$(if $(BR2_X86_CPU_HAS_AVX),yes,no) \
+	ax_cv_have_avx_cpu_ext=$(if $(BR2_X86_CPU_HAS_AVX),yes,no) \
+	ax_cv_have_avx2_ext=$(if $(BR2_X86_CPU_HAS_AVX2),yes,no) \
+	ax_cv_have_avx2_cpu_ext=$(if $(BR2_X86_CPU_HAS_AVX2),yes,no)
 
 LIQUID_DSP_CFLAGS = $(TARGET_CFLAGS)
 LIQUID_DSP_LDFLAGS = $(TARGET_LDFLAGS)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
