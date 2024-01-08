Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A593DC3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 17:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3DD440C00;
	Mon,  8 Jan 2024 17:47:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3DD440C00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WFsMYxxQ5yw7; Mon,  8 Jan 2024 17:47:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2C384151F;
	Mon,  8 Jan 2024 17:47:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2C384151F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F3C81BF330
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 17:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E510961031
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 17:47:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E510961031
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UBJsNniaNnES for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 17:47:00 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8ADEC60FAA
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 17:47:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8ADEC60FAA
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40d5a41143fso23855255e9.3
 for <buildroot@buildroot.org>; Mon, 08 Jan 2024 09:47:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704736018; x=1705340818;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J1fkxenxyR10Din4U2OzOklKx2wXIKLrZPUHBxB/Avs=;
 b=tqVuu6g9cEOdfRyQQrXwpkkr9MnB+MAHAekc3zZCF1LQ1JcMGSDvkwHk0YHB/KK7NS
 yYC0JPXiFENg59+cWq7mkzVWcHJJRQMGXDzmHR3XaLboN2BM+2VSMqsfDfIjREVFTCjv
 r1uLlJVeum3onY1corReECajNzQIA3iwSns4lPpNvIzqpC2uzBXlXUtKoNV6Ks3lKiF1
 3Z+xi9COj/+Bfw70lemsTYFagUGInF7ZJ7d1I/LzXwEKuu4WqtSTSHfZF38iUtjADjlW
 KAV8hti3LmTArP9Ia8D4o/HkP3Zl5TlIgl0i77L1I+Aw2jGBun/zaqK5GrlTOXRbqrgm
 4lUQ==
X-Gm-Message-State: AOJu0YyqCvZBJ0LDVlDZK+eMSJMtzS6nXVWvUCHbg9vRaXT5tEtBJfq7
 LaRFTjHoD8OoUduhG8jfMVzvveUs8yI=
X-Google-Smtp-Source: AGHT+IHsfpJKMr8hdytKpxFCyIxU54VbgSP/mbx3gK7GSe962DdiehF6YFDM6QG+NRDh7L3XoC1hIQ==
X-Received: by 2002:a05:600c:c87:b0:40e:4694:38a6 with SMTP id
 fj7-20020a05600c0c8700b0040e469438a6mr1086995wmb.157.1704736017504; 
 Mon, 08 Jan 2024 09:46:57 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 r14-20020a05600c35ce00b0040e48abec33sm2967519wmq.45.2024.01.08.09.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 09:46:57 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Jan 2024 18:46:54 +0100
Message-ID: <20240108174655.229109-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704736018; x=1705340818; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J1fkxenxyR10Din4U2OzOklKx2wXIKLrZPUHBxB/Avs=;
 b=Sehya6xr4khllZq5uLqhGFuK4vm4ZzJ9Av/istxay8lfJ1ySJUWPD4zWSOb75h9cr1
 ZmKny+jpbWyZt33B5TuKa4diqtson6C2lt3aFg1gydzQSR0ZO2eB3fcb97YfRW63CNNJ
 0uYzH3wC7D5C6FzjerhEZwwR0HEoFWZsmvLboY5VK3t5Sc2tjhHyB5IjJsGjpy+9zT5E
 JGcgf7rtQdeAUkeUJCVCcgqeg7QsPSufhadG2vUd/x5OhN2+1InrSVTa38O/+O/2BBzM
 cQbMyLVXTp8WPL0GR2dKi44Eyz3VRyEYIBqaZvO8BcATKRUKiAafRik2BdrQQhsdvjU5
 Dy0A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Sehya6xr
Subject: [Buildroot] [PATCH v2,1/1] package/liquid-dsp: fix x86 builds
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
Changes v1 -> v2:
 - Keep old options (mmx, etc.) as they seem to be still used somewhere
   in the code

 package/liquid-dsp/liquid-dsp.mk | 64 +++++++++++++++++++++++++++-----
 1 file changed, 54 insertions(+), 10 deletions(-)

diff --git a/package/liquid-dsp/liquid-dsp.mk b/package/liquid-dsp/liquid-dsp.mk
index eb4cda67a5..56f02ddb64 100644
--- a/package/liquid-dsp/liquid-dsp.mk
+++ b/package/liquid-dsp/liquid-dsp.mk
@@ -11,19 +11,63 @@ LIQUID_DSP_LICENSE_FILES = LICENSE
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
+ifeq ($(BR2_X86_CPU_HAS_MMX),y)
+LIQUID_DSP_CONF_ENV += ax_cv_have_mmx_ext=yes ax_cv_have_mmx_cpu_ext=yes
+else
+LIQUID_DSP_CONF_ENV += ax_cv_have_mmx_ext=no ax_cv_have_mmx_cpu_ext=no
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_SSE),y)
+LIQUID_DSP_CONF_ENV += ax_cv_have_sse_ext=yes ax_cv_have_sse_cpu_ext=yes
+else
+LIQUID_DSP_CONF_ENV += ax_cv_have_sse_ext=no ax_cv_have_sse_cpu_ext=no
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
+ifeq ($(BR2_X86_CPU_HAS_SSSE3),y)
+LIQUID_DSP_CONF_ENV += ax_cv_have_ssse3_ext=yes ax_cv_have_ssse3_cpu_ext=yes
+else
+LIQUID_DSP_CONF_ENV += ax_cv_have_ssse3_ext=no ax_cv_have_ssse3_cpu_ext=no
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_SSE4),y)
+LIQUID_DSP_CONF_ENV += ax_cv_have_sse41_ext=yes ax_cv_have_sse41_cpu_ext=yes
+else
+LIQUID_DSP_CONF_ENV += ax_cv_have_sse41_ext=no ax_cv_have_sse41_cpu_ext=no
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_SSE42),y)
+LIQUID_DSP_CONF_ENV += ax_cv_have_sse42_ext=yes ax_cv_have_sse42_cpu_ext=yes
+else
+LIQUID_DSP_CONF_ENV += ax_cv_have_sse42_ext=no ax_cv_have_sse42_cpu_ext=no
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
