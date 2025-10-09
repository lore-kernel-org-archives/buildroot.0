Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F909CCD185
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 14:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 362F6410BB;
	Thu,  9 Oct 2025 14:54:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cTv7doH4qBTU; Thu,  9 Oct 2025 14:54:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0F4141068
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0F4141068;
	Thu,  9 Oct 2025 14:54:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CC8121B
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61EEE612DF
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xucHWVLsGKgL for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 14:54:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BC47F60EDC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC47F60EDC
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC47F60EDC
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:50 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-46e37d10ed2so8800375e9.2
 for <buildroot@buildroot.org>; Thu, 09 Oct 2025 07:54:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760021689; x=1760626489;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sjX4gk8bTaGmF+j0RVFcuYQFKuHYqChiy+aKlkzNGJo=;
 b=w6PU05T7YeozaAgqs6qekqd1xA9UOaN+bQ1w6jOR3ts/kcCJHk2rFRwz9S/1wx6otO
 9OYB+7p2jSdOcWK7Ln/o/tS17tJ9PZyAyqBJZkLDKsQGHdnT6VWCq+tktRHOLrl3BJo2
 ccAKNeb0GQLatsyfJwli1ogdm7zqLdAtggI3V9dCuJBokkUsqGWcWfIwKAzQspUp18f4
 0pSXE3+zRAG4UBaPlGVDVx99KkvQAXtVwHQnRjtFg1W2HHHaPw5Q6UBops9QhDOTaD4I
 kuRdYAlmHLi6bVl1GECxJU2w1gyxwcKuU5oZXv3OkvAKlHVxOMOcbedpGKMVuD7l3oy9
 VMIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjUjfcL9tghuJqeZvhnRip0PJEgZnKGVatMMfSbbSj6O9bxP2bZ5J/rI8KOQvKuv3NyFa4KexcW/k=@buildroot.org
X-Gm-Message-State: AOJu0YyF0HtB5TFDnKlJVqt4X87eCdMpFl1aknI2MbtZ3yCA5SSefXg8
 sGx/D0Af7nYSPuTpqk9I1o+e+yPrVxQO6Gz/wJyD0lUb9SY9ipF9qcWLM6S8tsHY1M4=
X-Gm-Gg: ASbGnct2tF431nPtUbIC1NcEn7Dc8Wlm1X79Nuu6EaBTqC4M/UrSVdn7jBTJbA93G2C
 yQA/YKD95zrlzrtABGb/mzaQ4wcrSljJ2MT9si4bBtcMwWO50tWt9jmcw0TALoionWoq9B5Eo2R
 tT6I/6us3YMZEnnZ6PCDwnc7GBw7mbuPeE6Zd603Cr2DOiyqMtcmPM21TfbQatJKhLO/L3oFNyh
 gGf5TP751rTPQwY8CDLL1K9t6bAHEKExx7zQGF/S94UbnQXNKgwzD6G/1yyC4pYjxsSjs6gCj/a
 SYOe7maWcgKe+cOOP2Qnk9YyQscmfW0epMBeNXvMqd+jpjZUy4uwOGt7dQm/stBqQVVyV6z7YT4
 iXR4nvhPhXQ6t/tlT3Ci68Zeni371FM4lQv/XCallFy7PLjMn2yg=
X-Google-Smtp-Source: AGHT+IGQ+OjQ5Ss3f0uEY6oQB0tVHm8IEBIweNl5nvPVW1fNhbOqh0M4sx55Vo+tlrgI0nOBWOBbTQ==
X-Received: by 2002:a05:600c:1d1b:b0:46f:b32e:4f3e with SMTP id
 5b1f17b1804b1-46fb32e4fa5mr13976335e9.37.1760021688520; 
 Thu, 09 Oct 2025 07:54:48 -0700 (PDT)
Received: from arch ([79.132.232.153]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb4830559sm1292575e9.11.2025.10.09.07.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 07:54:48 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  9 Oct 2025 16:54:47 +0200
Message-ID: <20251009145447.482627-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251003125438.76030-1-titouan.christophe@mind.be>
References: <20251003125438.76030-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1760021689; x=1760626489; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sjX4gk8bTaGmF+j0RVFcuYQFKuHYqChiy+aKlkzNGJo=;
 b=JZHPM2SDMiT8cJsXW69BF3c1dbCRf+5wIImZaTA5mcGGz9Iyx3hXF2v1Z2OBDBW+wH
 Vsj65xUiy9kj6TnyBGz5KLBMvxyMb2JibwpRAwxrdPPu3iXU3uS96rbJUt/LS9dez60S
 A4gsku1YAMUkXpQRZnw8qCpeE7o0MZ3D6TkmJ+eHX2NYRT8icWEQpAjnmmUCZF0NoJip
 BP1leniAuveyDijPnsgUvPysoBF6fEr4nbatihawsnMuiD71WLL84y4clmPHL85KHysm
 KT8/QT+7dJoSF49jRhpE00TFmGKzfWNc2B4/dbqCKN2RRrVsS9FywAv2AisASZi/hoS+
 Lc7w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JZHPM2SD
Subject: Re: [Buildroot] [PATCH v2] package/ghostscript: security bump to
 v10.06.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> This fixes the following vulnerabilities:
> - CVE-2025-59798:
>     Artifex Ghostscript through 10.05.1 has a stack-based buffer overflow
>     in pdf_write_cmap in devices/vector/gdevpdtw.c.
>     https://www.cve.org/CVERecord?id=CVE-2025-59798
> 
> - CVE-2025-59799:
>     Artifex Ghostscript through 10.05.1 has a stack-based buffer overflow
>     in pdfmark_coerce_dest in devices/vector/gdevpdfm.c via a large size
>     value.
>     https://www.cve.org/CVERecord?id=CVE-2025-59799
> 
> - CVE-2025-59800:
>     In Artifex Ghostscript through 10.05.1, ocr_begin_page in
>     devices/gdevpdfocr.c has an integer overflow that leads to a heap-
>     based buffer overflow in ocr_line8.
>     https://www.cve.org/CVERecord?id=CVE-2025-59800
> 
> - CVE-2025-59801:
>     In Artifex GhostXPS before 10.06.0, there is a stack-based buffer
>     overflow in xps_unpredict_tiff in xpstiff.c because the
>     samplesperpixel value is not checked.
>     https://www.cve.org/CVERecord?id=CVE-2025-59801
> 
> Also remove patch that is now applied upstream, and add new patch from
> upstream to fix a compilation issue on 32bits platforms
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
> Changes v1->v2:
> - Add patch to fix 32bits build
> ---
>  .../ghostscript/0001-Fix-32-bit-build.patch   | 63 +++++++++++++++++++
>  ...Fix-compatibility-with-C23-compilers.patch | 36 -----------
>  package/ghostscript/ghostscript.hash          |  2 +-
>  package/ghostscript/ghostscript.mk            |  2 +-
>  4 files changed, 65 insertions(+), 38 deletions(-)
>  create mode 100644 package/ghostscript/0001-Fix-32-bit-build.patch
>  delete mode 100644 package/ghostscript/0001-Fix-compatibility-with-C23-compilers.patch
> 
> diff --git a/package/ghostscript/0001-Fix-32-bit-build.patch b/package/ghostscript/0001-Fix-32-bit-build.patch
> new file mode 100644
> index 0000000000..648e235d3b
> --- /dev/null
> +++ b/package/ghostscript/0001-Fix-32-bit-build.patch
> @@ -0,0 +1,63 @@
> +From 3c0be6e4fcffa63e4a5a1b0aec057cebc4d2562f Mon Sep 17 00:00:00 2001
> +From: Ken Sharp <Ken.Sharp@artifex.com>
> +Date: Wed, 10 Sep 2025 08:55:30 +0100
> +Subject: [PATCH] Fix 32-bit build
> +
> +Bug #708824 "ghostscript 10.06.0 compilation failure on 32-bit archs"
> +
> +nbytes shiouldn't be an intptr_t, it doesn't get used for pointer
> +arithmetic. Previously it was a uint, should be a int64_t, to fit with
> +all the other devices.
> +
> +Checked other warnings, and found a (very minor) one in gdevdbit.c, fix
> +that while we're here (signed/unsigned mismatch, we don't really care).
> +
> +Upstream: https://github.com/ArtifexSoftware/ghostpdl/commit/3c0be6e4fcffa63e4a5a1b0aec057cebc4d2562f
> +
> +Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> +---
> + base/gdevdbit.c | 2 +-
> + base/gdevmpla.c | 6 +++---
> + 2 files changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/base/gdevdbit.c b/base/gdevdbit.c
> +index e07cc3f3b8..1b5c69325b 100644
> +--- a/base/gdevdbit.c
> ++++ b/base/gdevdbit.c
> +@@ -191,7 +191,7 @@ gx_default_copy_alpha_hl_color(gx_device * dev, const byte * data, int data_x,
> +     fit_copy(dev, data, data_x, raster, id, x, y, width, height);
> +     row_alpha = data;
> +     out_raster = bitmap_raster(width * (size_t)byte_depth);
> +-    if (check_64bit_multiply(out_raster, ncomps, &product) != 0)
> ++    if (check_64bit_multiply(out_raster, ncomps, (int64_t *) &product) != 0)
> +         return gs_note_error(gs_error_undefinedresult);
> +     gb_buff = gs_alloc_bytes(mem, product, "copy_alpha_hl_color(gb_buff)");
> +     if (gb_buff == 0) {
> +diff --git a/base/gdevmpla.c b/base/gdevmpla.c
> +index 2f0d522561..ffc5ff42e6 100644
> +--- a/base/gdevmpla.c
> ++++ b/base/gdevmpla.c
> +@@ -1954,12 +1954,12 @@ mem_planar_strip_copy_rop2(gx_device * dev,
> +         int i;
> +         int j;
> +         intptr_t chunky_sraster;
> +-        intptr_t nbytes;
> ++        int64_t nbytes;
> +         byte **line_ptrs;
> +         byte *sbuf, *buf;
> + 
> +         chunky_sraster = sraster * (intptr_t)mdev->num_planar_planes;
> +-        if (check_64bit_multiply(height, chunky_sraster, (size_t *)&nbytes) != 0)
> ++        if (check_64bit_multiply(height, chunky_sraster, &nbytes) != 0)
> +             return gs_note_error(gs_error_undefinedresult);
> +         buf = gs_alloc_bytes(mdev->memory, nbytes, "mem_planar_strip_copy_rop(buf)");
> +         if (buf == NULL) {
> +@@ -2003,7 +2003,7 @@ mem_planar_strip_copy_rop2(gx_device * dev,
> +         intptr_t i;
> +         intptr_t chunky_t_raster;
> +         int chunky_t_height;
> +-        intptr_t nbytes;
> ++        int64_t nbytes;
> +         byte **line_ptrs;
> +         byte *tbuf, *buf;
> +         gx_strip_bitmap newtex;
> diff --git a/package/ghostscript/0001-Fix-compatibility-with-C23-compilers.patch b/package/ghostscript/0001-Fix-compatibility-with-C23-compilers.patch
> deleted file mode 100644
> index 0dfca9cfa2..0000000000
> --- a/package/ghostscript/0001-Fix-compatibility-with-C23-compilers.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From ae940946473ceb8c5353bc6e7f04673c6e60502d Mon Sep 17 00:00:00 2001
> -From: Alex Cherepanov <alex@coscript.biz>
> -Date: Thu, 3 Apr 2025 17:19:41 +0100
> -Subject: Bug 708160: Fix compatibility with C23 compilers
> -
> -Upstream: https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=ae940946473ceb8c5353bc6e7f04673c6e60502d
> -[thomas: Only backport the bool typedef condition]
> -Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ----
> - base/stdpre.h              |  6 ++++--
> - 1 files changed, 4 insertions(+), 2 deletions(-)
> -
> -diff --git a/base/stdpre.h b/base/stdpre.h
> -index dda30b6a4..2f9c84e0d 100644
> ---- a/base/stdpre.h
> -+++ b/base/stdpre.h
> -@@ -1,4 +1,4 @@
> --/* Copyright (C) 2001-2023 Artifex Software, Inc.
> -+/* Copyright (C) 2001-2025 Artifex Software, Inc.
> -    All Rights Reserved.
> -
> -    This software is provided AS-IS with no warranty, either express or
> -@@ -341,7 +341,9 @@ typedef signed char schar;
> -  * and the MetroWerks C++ compiler insists that bool be equivalent to
> -  * unsigned char.
> -  */
> --#ifndef __cplusplus
> -+
> -+/* C23 has bool as a builtin type. */
> -+#if !defined(__cplusplus) && (!defined(__STDC_VERSION__) || __STDC_VERSION__ < 202311L)
> - #ifdef __BEOS__
> - typedef unsigned char bool;
> - #else
> ---
> -cgit v1.2.3
> -
> diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
> index c434ac1f3a..9b6ead7cfb 100644
> --- a/package/ghostscript/ghostscript.hash
> +++ b/package/ghostscript/ghostscript.hash
> @@ -1,5 +1,5 @@
>  # From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10051/SHA512SUMS
> -sha512  1a3f2b0f53db9a00a245df19ce8fdce0fbccc6fad47b64d14fc9058b494ab07c77e21bb073df8d4a2522b3ccb0df26735f8224a9e36c07367031ed2262fb26af  ghostscript-10.05.1.tar.xz
> +sha512  e9efa6a334cf34703f565f5043dd794452270415b34c2bea260e9dac6c72ebbcbedfa2e4cb9029841f8f582bbce91be8160e135a190081f3262bcf04417f80f1  ghostscript-10.06.0.tar.xz
>  
>  # Hash for license file:
>  sha256  8ce064f423b7c24a011b6ebf9431b8bf9861a5255e47c84bfb23fc526d030a8b  LICENSE
> diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
> index c9d13f5545..1fc850ad20 100644
> --- a/package/ghostscript/ghostscript.mk
> +++ b/package/ghostscript/ghostscript.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GHOSTSCRIPT_VERSION = 10.05.1
> +GHOSTSCRIPT_VERSION = 10.06.0
>  GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
>  GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$(subst .,,$(GHOSTSCRIPT_VERSION))
>  GHOSTSCRIPT_LICENSE = AGPL-3.0
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
