Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47235CAC5B0
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 12:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CDC340DF9;
	Fri,  3 Oct 2025 12:54:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3xszPW6Gyp-D; Fri,  3 Oct 2025 12:54:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E872140DFA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E872140DFA;
	Fri,  3 Oct 2025 12:54:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B887F226
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 12:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA43440DF2
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 12:54:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OtW56TKm_Qge for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 12:54:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6832640DF1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6832640DF1
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6832640DF1
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 12:54:47 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-634b774f135so3906771a12.2
 for <buildroot@buildroot.org>; Fri, 03 Oct 2025 05:54:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759496085; x=1760100885;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PUnFV6VYCcMRGIa02sdb3Z6cLJ8086PzWGCNfuDgKqo=;
 b=sdmvRyJTfeMS2lVr8+nBFU1lbjta8ks+MqWEDnQ3hfJ09BVCd6VujPNWK/fjNaWre0
 gr8F3CgVaJVWOjiB/IRuB1wHQY7ji4aPbh5J6y5pXaQftqJaB6Iw/Pq2CPKf5FoKkoAc
 JhM7xjoF9ICwpQQKSRq7CA2pTXLrh0j+8OW27qZ4CPgFeLM8jv3geYyNvVdz5w3nrAMt
 vTZs4Wj5sto8R6iYyAl/5/mGMLycKG2l9VuyyP4wRbHLLlb24E/W2ojgErIJ41Eddq+3
 tzRy+eMzLqhYtJXc6P1OHecW7vJ/UrPe91Nm9iII6CUut3+4DYrlht4mBD1nEayyR1RQ
 VY+Q==
X-Gm-Message-State: AOJu0YwSDO6z+0y6oM8t9mnoqCMNXrgiJ4/ct4L8XRkOHvRPM8VZMZiP
 KYjWVmkclfvfqGGVf+P/JpCgtw439FFal22NaZ0vjnMSRy6Hac8gLgUAUEvptijmqkjfJSqQzAB
 7sXP4
X-Gm-Gg: ASbGnctMcW9V+sQnuaI3bd1rfxJzar3mZ+1RmUWB9bK83dYqpTNkKdlaRXKkfPzPjbr
 xeeJrhuOv1XfXv3CLZnRshhYAksMgOvbqQLYtgX852NNzyAQiBM2+cAHUcFMDv6kawRFMsu2T4N
 EKEyI6+u9rThnB32eEUowISIxK7YpHsvLbP002KNX6d0U8M82dpUAUQvxKfAHIVc5HX71r3EN3f
 vPub4ILivjamE8/kx0SBG6UneL6+fRCtfeo5rMGv9Dhz1+rbnhMQ5Dbdl5UGmM4GZQ34vTQ/WPQ
 W1E7BLc1mOgmgRQI2iBmjcIlLB2vxvWrapODwh9m3waJYnPiiK/OGaR7RoVVLRSXeSHotw8UJJW
 JfC4DZkcdftdJopJfuy1NfzXKNlC2ZIeaERZKzDyoWMIpNWtJhlPtccugu3XS
X-Google-Smtp-Source: AGHT+IEge6cyDdw7xTl1o3iQVlYJTRXCzwGnZNZmJMmc4DgosDecIKwNNdOb+dxMsKp3WUafPGqm5g==
X-Received: by 2002:a05:6402:2792:b0:61c:cf8d:e51d with SMTP id
 4fb4d7f45d1cf-63939c296bcmr3012831a12.22.1759496084283; 
 Fri, 03 Oct 2025 05:54:44 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:73a7:c001:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6376b3b74f1sm4019232a12.12.2025.10.03.05.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 05:54:44 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
Date: Fri,  3 Oct 2025 14:54:38 +0200
Message-ID: <20251003125438.76030-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1759496085; x=1760100885; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PUnFV6VYCcMRGIa02sdb3Z6cLJ8086PzWGCNfuDgKqo=;
 b=Gi/CK6hG+jdJ1p4blZT63muCt7cMJ2mEcrgQEn6PpVAap83IBGfs2mjdgbhAv/9e/V
 E+Cm5Ar43ZhV7/oscvf7aPkGW0XRm8gBqwzazAEG1Q14nV8gJEng8iLu5AcIoZoLCBwt
 NiYxEEg24QluTrz4xzZrk9osHLdaB6lkV7erMGIzvHuXr4FatTGEPYvjaAMi6qTUTc1z
 ntq3S1jFa4fJJLYriIIvrLOZXVZJj+V1pR/lxobLAy3b1MAawa3093hjnilSMXZ7ZXoc
 /cWLsswlH5IBEFzdIkmYL8x7owfW3CWoR7HD4hrLbQHG2cPFTMyXkoLLiTTjwpPeeDWv
 DiNw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Gi/CK6hG
Subject: [Buildroot] [PATCH v2] package/ghostscript: security bump to
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following vulnerabilities:
- CVE-2025-59798:
    Artifex Ghostscript through 10.05.1 has a stack-based buffer overflow
    in pdf_write_cmap in devices/vector/gdevpdtw.c.
    https://www.cve.org/CVERecord?id=CVE-2025-59798

- CVE-2025-59799:
    Artifex Ghostscript through 10.05.1 has a stack-based buffer overflow
    in pdfmark_coerce_dest in devices/vector/gdevpdfm.c via a large size
    value.
    https://www.cve.org/CVERecord?id=CVE-2025-59799

- CVE-2025-59800:
    In Artifex Ghostscript through 10.05.1, ocr_begin_page in
    devices/gdevpdfocr.c has an integer overflow that leads to a heap-
    based buffer overflow in ocr_line8.
    https://www.cve.org/CVERecord?id=CVE-2025-59800

- CVE-2025-59801:
    In Artifex GhostXPS before 10.06.0, there is a stack-based buffer
    overflow in xps_unpredict_tiff in xpstiff.c because the
    samplesperpixel value is not checked.
    https://www.cve.org/CVERecord?id=CVE-2025-59801

Also remove patch that is now applied upstream, and add new patch from
upstream to fix a compilation issue on 32bits platforms

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
Changes v1->v2:
- Add patch to fix 32bits build
---
 .../ghostscript/0001-Fix-32-bit-build.patch   | 63 +++++++++++++++++++
 ...Fix-compatibility-with-C23-compilers.patch | 36 -----------
 package/ghostscript/ghostscript.hash          |  2 +-
 package/ghostscript/ghostscript.mk            |  2 +-
 4 files changed, 65 insertions(+), 38 deletions(-)
 create mode 100644 package/ghostscript/0001-Fix-32-bit-build.patch
 delete mode 100644 package/ghostscript/0001-Fix-compatibility-with-C23-compilers.patch

diff --git a/package/ghostscript/0001-Fix-32-bit-build.patch b/package/ghostscript/0001-Fix-32-bit-build.patch
new file mode 100644
index 0000000000..648e235d3b
--- /dev/null
+++ b/package/ghostscript/0001-Fix-32-bit-build.patch
@@ -0,0 +1,63 @@
+From 3c0be6e4fcffa63e4a5a1b0aec057cebc4d2562f Mon Sep 17 00:00:00 2001
+From: Ken Sharp <Ken.Sharp@artifex.com>
+Date: Wed, 10 Sep 2025 08:55:30 +0100
+Subject: [PATCH] Fix 32-bit build
+
+Bug #708824 "ghostscript 10.06.0 compilation failure on 32-bit archs"
+
+nbytes shiouldn't be an intptr_t, it doesn't get used for pointer
+arithmetic. Previously it was a uint, should be a int64_t, to fit with
+all the other devices.
+
+Checked other warnings, and found a (very minor) one in gdevdbit.c, fix
+that while we're here (signed/unsigned mismatch, we don't really care).
+
+Upstream: https://github.com/ArtifexSoftware/ghostpdl/commit/3c0be6e4fcffa63e4a5a1b0aec057cebc4d2562f
+
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ base/gdevdbit.c | 2 +-
+ base/gdevmpla.c | 6 +++---
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/base/gdevdbit.c b/base/gdevdbit.c
+index e07cc3f3b8..1b5c69325b 100644
+--- a/base/gdevdbit.c
++++ b/base/gdevdbit.c
+@@ -191,7 +191,7 @@ gx_default_copy_alpha_hl_color(gx_device * dev, const byte * data, int data_x,
+     fit_copy(dev, data, data_x, raster, id, x, y, width, height);
+     row_alpha = data;
+     out_raster = bitmap_raster(width * (size_t)byte_depth);
+-    if (check_64bit_multiply(out_raster, ncomps, &product) != 0)
++    if (check_64bit_multiply(out_raster, ncomps, (int64_t *) &product) != 0)
+         return gs_note_error(gs_error_undefinedresult);
+     gb_buff = gs_alloc_bytes(mem, product, "copy_alpha_hl_color(gb_buff)");
+     if (gb_buff == 0) {
+diff --git a/base/gdevmpla.c b/base/gdevmpla.c
+index 2f0d522561..ffc5ff42e6 100644
+--- a/base/gdevmpla.c
++++ b/base/gdevmpla.c
+@@ -1954,12 +1954,12 @@ mem_planar_strip_copy_rop2(gx_device * dev,
+         int i;
+         int j;
+         intptr_t chunky_sraster;
+-        intptr_t nbytes;
++        int64_t nbytes;
+         byte **line_ptrs;
+         byte *sbuf, *buf;
+ 
+         chunky_sraster = sraster * (intptr_t)mdev->num_planar_planes;
+-        if (check_64bit_multiply(height, chunky_sraster, (size_t *)&nbytes) != 0)
++        if (check_64bit_multiply(height, chunky_sraster, &nbytes) != 0)
+             return gs_note_error(gs_error_undefinedresult);
+         buf = gs_alloc_bytes(mdev->memory, nbytes, "mem_planar_strip_copy_rop(buf)");
+         if (buf == NULL) {
+@@ -2003,7 +2003,7 @@ mem_planar_strip_copy_rop2(gx_device * dev,
+         intptr_t i;
+         intptr_t chunky_t_raster;
+         int chunky_t_height;
+-        intptr_t nbytes;
++        int64_t nbytes;
+         byte **line_ptrs;
+         byte *tbuf, *buf;
+         gx_strip_bitmap newtex;
diff --git a/package/ghostscript/0001-Fix-compatibility-with-C23-compilers.patch b/package/ghostscript/0001-Fix-compatibility-with-C23-compilers.patch
deleted file mode 100644
index 0dfca9cfa2..0000000000
--- a/package/ghostscript/0001-Fix-compatibility-with-C23-compilers.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From ae940946473ceb8c5353bc6e7f04673c6e60502d Mon Sep 17 00:00:00 2001
-From: Alex Cherepanov <alex@coscript.biz>
-Date: Thu, 3 Apr 2025 17:19:41 +0100
-Subject: Bug 708160: Fix compatibility with C23 compilers
-
-Upstream: https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=ae940946473ceb8c5353bc6e7f04673c6e60502d
-[thomas: Only backport the bool typedef condition]
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- base/stdpre.h              |  6 ++++--
- 1 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/base/stdpre.h b/base/stdpre.h
-index dda30b6a4..2f9c84e0d 100644
---- a/base/stdpre.h
-+++ b/base/stdpre.h
-@@ -1,4 +1,4 @@
--/* Copyright (C) 2001-2023 Artifex Software, Inc.
-+/* Copyright (C) 2001-2025 Artifex Software, Inc.
-    All Rights Reserved.
-
-    This software is provided AS-IS with no warranty, either express or
-@@ -341,7 +341,9 @@ typedef signed char schar;
-  * and the MetroWerks C++ compiler insists that bool be equivalent to
-  * unsigned char.
-  */
--#ifndef __cplusplus
-+
-+/* C23 has bool as a builtin type. */
-+#if !defined(__cplusplus) && (!defined(__STDC_VERSION__) || __STDC_VERSION__ < 202311L)
- #ifdef __BEOS__
- typedef unsigned char bool;
- #else
---
-cgit v1.2.3
-
diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
index c434ac1f3a..9b6ead7cfb 100644
--- a/package/ghostscript/ghostscript.hash
+++ b/package/ghostscript/ghostscript.hash
@@ -1,5 +1,5 @@
 # From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10051/SHA512SUMS
-sha512  1a3f2b0f53db9a00a245df19ce8fdce0fbccc6fad47b64d14fc9058b494ab07c77e21bb073df8d4a2522b3ccb0df26735f8224a9e36c07367031ed2262fb26af  ghostscript-10.05.1.tar.xz
+sha512  e9efa6a334cf34703f565f5043dd794452270415b34c2bea260e9dac6c72ebbcbedfa2e4cb9029841f8f582bbce91be8160e135a190081f3262bcf04417f80f1  ghostscript-10.06.0.tar.xz
 
 # Hash for license file:
 sha256  8ce064f423b7c24a011b6ebf9431b8bf9861a5255e47c84bfb23fc526d030a8b  LICENSE
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index c9d13f5545..1fc850ad20 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GHOSTSCRIPT_VERSION = 10.05.1
+GHOSTSCRIPT_VERSION = 10.06.0
 GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
 GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$(subst .,,$(GHOSTSCRIPT_VERSION))
 GHOSTSCRIPT_LICENSE = AGPL-3.0
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
