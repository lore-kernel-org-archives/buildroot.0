Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94458C3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 17:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E50E383658;
	Mon,  8 Jan 2024 17:32:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E50E383658
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WPsS2P6BmDPP; Mon,  8 Jan 2024 17:32:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47D3F8361C;
	Mon,  8 Jan 2024 17:32:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47D3F8361C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5421D1BF330
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 17:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B10C60AFF
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 17:32:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B10C60AFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kbMEq6YU3tVZ for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 17:32:55 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 308F36061B
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 17:32:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 308F36061B
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40e4d1e0e5eso367565e9.3
 for <buildroot@buildroot.org>; Mon, 08 Jan 2024 09:32:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704735172; x=1705339972;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2cn1pQf/HOqEXUVUDt5eY9v7ZJPv/df6RPk0mU9BS9s=;
 b=IYzWSLKSmKt63jwo6X2sINKsyXUaa5JrxM727XAsekousMTdmcyIXmf58IXcIC85Zk
 Wq1Ho+K0eM15v2Ccz+jbP4bfq2ddWf4vABOD13GgZU1ZJ/tFJaeQ8lIZ70gECN5vzAFj
 0Z/70Fy0+oibAkiWP9Z0T37rKYVVr/seFb9VAxyH7zB1FcvKtGHwMpgEFjAjpoHJWzbD
 z/sh7YUFh49Y4Xlvfie7ZCEBBBa36QEuB6fs5hvCR7yDYIcV+eAaNkQCXShgRtWLdo64
 RKZ6M/gxRnjhM/ne8WOiwgFkqW7G8MWxThIBUMpb7nmwhdTvN08IOkiFUR0jUpEJCL8v
 3wOQ==
X-Gm-Message-State: AOJu0YwZV1EgCKojKcBNdqYoY52N6i4TEmH+wCl39pXgDlNMsMtDfJYg
 jVkuFje9vH/1KZAIvVmimtoOLWP+wQY=
X-Google-Smtp-Source: AGHT+IGoSRRcQV/lopVpXjkYpY4ZLMhYnBQvunY8pBAq38AJgf9bdZvRIzQIOFZyrCmd/FAEGlgeNQ==
X-Received: by 2002:a1c:7c15:0:b0:40d:5e0e:8648 with SMTP id
 x21-20020a1c7c15000000b0040d5e0e8648mr2120317wmc.159.1704735172027; 
 Mon, 08 Jan 2024 09:32:52 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l17-20020a5d4bd1000000b00336a1f6ce7csm197591wrt.19.2024.01.08.09.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 09:32:51 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Jan 2024 18:32:49 +0100
Message-ID: <20240108173249.12872-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704735172; x=1705339972; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2cn1pQf/HOqEXUVUDt5eY9v7ZJPv/df6RPk0mU9BS9s=;
 b=J1YqtDR3JWTx6Sbu/+lbD2mkD/YzKn+Xr8BZ9piFLmnwGPySoZVlt97hGXyQuV2R8v
 Mz9N6/5Sqc537uXZmBYiLk43nANdKeHwmDzyK8tVmB+Tu5+ia3qlSlg+LZulHLAHtukX
 KQPQPxsyltVVCXmPgwb1LWgYXnt96Bev6qhw3ge844XryeB+tIVywqX05vmek/Vma6Nj
 wDWmsNTNuUgK4g1odEDjGZ7lblO255R2G/Cd++GAkjXEAiGO54sjvRGcBt5QeAMfJWNz
 uTPi2w2UqM33T2smtwhhcChAEu75PRNOLBDrYFWBVSPDab/xC6GBJYeZLnXL/HbL1w7g
 puQg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=J1YqtDR3
Subject: [Buildroot] [PATCH 1/1] package/liquid-dsp: fix x86 builds
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

While at it, add AVX2 support and drop options which had no effect
(MMX, SSE, SSE42 and SSSE3)

Fixes:
 - http://autobuild.buildroot.org/results/738ce9d3dc74ec165391f21256c955e5524f1632
 - http://autobuild.buildroot.org/results/a2d150c724ab6787aeabaf31f65116f802e8584e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/liquid-dsp/liquid-dsp.mk | 40 ++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/package/liquid-dsp/liquid-dsp.mk b/package/liquid-dsp/liquid-dsp.mk
index eb4cda67a5..0e7653cb3f 100644
--- a/package/liquid-dsp/liquid-dsp.mk
+++ b/package/liquid-dsp/liquid-dsp.mk
@@ -11,19 +11,39 @@ LIQUID_DSP_LICENSE_FILES = LICENSE
 LIQUID_DSP_INSTALL_STAGING = YES
 LIQUID_DSP_AUTORECONF = YES
 
-LIQUID_DSP_CONF_ENV = \
-	ax_cv_have_mmx_ext=$(if $(BR2_X86_CPU_HAS_MMX),yes,no) \
-	ax_cv_have_sse_ext=$(if $(BR2_X86_CPU_HAS_SSE),yes,no) \
-	ax_cv_have_sse2_ext=$(if $(BR2_X86_CPU_HAS_SSE2),yes,no) \
-	ax_cv_have_sse3_ext=$(if $(BR2_X86_CPU_HAS_SSE3),yes,no) \
-	ax_cv_have_ssse3_ext=$(if $(BR2_X86_CPU_HAS_SSSE3),yes,no) \
-	ax_cv_have_sse41_ext=$(if $(BR2_X86_CPU_HAS_SSE4),yes,no) \
-	ax_cv_have_sse42_ext=$(if $(BR2_X86_CPU_HAS_SSE42),yes,no) \
-	ax_cv_have_avx_ext=$(if $(BR2_X86_CPU_HAS_AVX),yes,no)
-
 LIQUID_DSP_CFLAGS = $(TARGET_CFLAGS)
 LIQUID_DSP_LDFLAGS = $(TARGET_LDFLAGS)
 
+ifeq ($(BR2_X86_CPU_HAS_AVX),y)
+LIQUID_DSP_CONF_ENV += ax_cv_have_avx_ext=yes ax_cv_have_avx_cpu_ext=yes
+else
+LIQUID_DSP_CONF_ENV += ax_cv_have_avx_ext=no ax_cv_have_avx_cpu_ext=no
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_AVX2),y)
+LIQUID_DSP_CONF_ENV += ax_cv_have_avx2_ext=yes ax_cv_have_avx2_cpu_ext=yes
+else
+LIQUID_DSP_CONF_ENV += ax_cv_have_avx2_ext=no ax_cv_have_avx2_cpu_ext=no
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
+LIQUID_DSP_CONF_ENV += ax_cv_have_sse2_ext=yes ax_cv_have_sse2_cpu_ext=yes
+else
+LIQUID_DSP_CONF_ENV += ax_cv_have_sse2_ext=no ax_cv_have_sse2_cpu_ext=no
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_SSE3),y)
+LIQUID_DSP_CONF_ENV += ax_cv_have_sse3_ext=yes ax_cv_have_sse3_cpu_ext=yes
+else
+LIQUID_DSP_CONF_ENV += ax_cv_have_sse3_ext=no ax_cv_have_sse3_cpu_ext=no
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_SSE4),y)
+LIQUID_DSP_CONF_ENV += ax_cv_have_sse41_ext=yes ax_cv_have_sse41_cpu_ext=yes
+else
+LIQUID_DSP_CONF_ENV += ax_cv_have_sse41_ext=no ax_cv_have_sse41_cpu_ext=no
+endif
+
 # Speed over accuracy trade off
 ifeq ($(BR2_PACKAGE_LIQUID_DSP_FAST),y)
 LIQUID_DSP_CFLAGS += -ffast-math
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
