Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE73CAC59A
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 18:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A06484256;
	Wed, 17 Sep 2025 18:55:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hYYvaYOs_h5C; Wed, 17 Sep 2025 18:55:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F2D18425A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F2D18425A;
	Wed, 17 Sep 2025 18:55:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AFF4199
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 18:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67E4C84256
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 18:55:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HwXrS8tbN5df for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 18:55:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3019184254
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3019184254
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3019184254
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 18:55:13 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-625e1dfc43dso128759a12.1
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 11:55:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758135311; x=1758740111;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hAhW3Y8XIrXWJIn64mLlw2e8PoOi6Hg0jOknI8D1uAA=;
 b=pPHFpFe63GfvxnijLSyAdM4dOEKztCGeanM0j179LrimxZ1GI0xgHNQFz069PU4zGx
 SGsZ51QCmD/xK8SFUuhtk5xMTgjXlKwByeAFoOLF9pIZ7Nc7+FH/fvIKqZtveSwxjhLq
 rCxRhBDmlTz3UL9Jzk5L8zYa2i+21irGGwWTjee/Js1K448rZqfuVue3O5Dtm4h/3D5C
 3L/CGu6F8cQ4ZW1cB104mKbFWzVPDKB+NKpnSiN7OdNmpjIXmWzRxrPAbrlfOWoUVw7W
 4tFi2grKtE1JODwwTc78kHtirHgQB/su2BwE1/k499ujPqAtwkcAxamM6lScXhGPL1B8
 zvyA==
X-Gm-Message-State: AOJu0YzNojLQOrwZHD1uWzM6mQ6+UYmVOaT937NbmDAi4GoBa2fEOw6D
 naclull5wEzQZLdO02CTMtbt7r5lrqU5Vo0eZsVw+ZJi0jmA5TfpIhah1l1WpVZrd7rltAgGnZH
 04TYmzaM=
X-Gm-Gg: ASbGncvAZyI0Vlcn+7ewWnsvxiJlnlfctKlgSAYHagS3FJk9v+OcJILFBKnnqMauYfX
 EsU1CLvYOCct/15a1OFpN8jds19NI8OvTaocDaKwajcRSPHYAsgiLPwR5Wk4mhB4RFh6gcl5VW3
 4UT/mtEFMBC8TBpIcXD5ofxR2PPJpT7VzHia14CDoKjqUEZ6sFjyNvwVgIMwo0p/nPYkMTjgBQj
 70SEv3KviMdeV6lFEz10YoLB1up3hcfG/elaDsopZNewd3v3aSdgki9+Xo0f+vlNmpEzHv/y11N
 kJpj4TrLAGIkEfMnigf5oLGfBDS1CiRvxRzTglvCrNuNTtk9UGKWowzXwrHm9Gtii+kqJkhGxWs
 ldwjH89R6QnhugB1gN6s0zgHLjAYiD5sg8en7
X-Google-Smtp-Source: AGHT+IEIZiJpFCJcdxvDOn3Av9SpaTY1DAc5S/jiqCitEeyBweXH41KjOGqG6/JsYNkwrqvASCFYzw==
X-Received: by 2002:a17:906:f591:b0:af9:6bfb:58b7 with SMTP id
 a640c23a62f3a-b1bb433821amr330218966b.5.1758135310769; 
 Wed, 17 Sep 2025 11:55:10 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.79])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b1fc5f43884sm28402666b.3.2025.09.17.11.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 11:55:08 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Michael Vetter <jubalh@iodoru.org>
Date: Wed, 17 Sep 2025 20:54:43 +0200
Message-Id: <20250917185443.2881784-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250917185443.2881784-1-thomas.perale@mind.be>
References: <20250917185443.2881784-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758135311; x=1758740111; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hAhW3Y8XIrXWJIn64mLlw2e8PoOi6Hg0jOknI8D1uAA=;
 b=QyOl092ObX/MGfSvl5tVTF2p5Qi6B6Dkzv0CpeYwN93c8uMtXSe8+ssAQVjTBO8sGU
 FKt3sJAZSZBpmiVzZZc8ev0lEIJvRf9u42DxE+muXSbF7Zuuk5IuxWxHJ4cy38ZcaW+X
 3m8gv53RLz0Ie+vl36xEwp1nsUkC5Ji691ngdOJAgGwk/hhipsRU3m98L7OZgIg2YcTb
 9pCH2si7IfZkYBJXwYV4y7gwHaadEUW9Vbh2m5P4XaE091z+1ClOBqn38j70R5wPEaje
 LAIbJ9LKnjhtiii6iury4I4GGt7NGePB+fLXlruegUf987l8VJe3zAmpdS1rcC2SF/hd
 2Buw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QyOl092O
Subject: [Buildroot] [PATCH 2/2] package/jasper: add patch for CVE-2025-8835
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

This fixes the following vulnerability:

- CVE-2025-8835:

A vulnerability was found in JasPer up to 4.2.5. Affected by this
vulnerability is the function jas_image_chclrspc of the file
src/libjasper/base/jas_image.c of the component Image Color Space
Conversion Handler. The manipulation leads to null pointer dereference.
It is possible to launch the attack on the local host. The exploit has
been disclosed to the public and may be used. The identifier of the
patch is bb7d62bd0a2a8e0e1fdb4d603f3305f955158c52. It is recommended to
apply a patch to fix this issue.

For more information see:
  - https://nvd.nist.gov//vuln/detail/CVE-2025-8835
  - https://github.com/jasper-software/jasper/commit/bb7d62bd0a2a8e0e1fdb4d603f3305f955158c52

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/jasper/0002-Fixes-400.patch | 169 ++++++++++++++++++++++++++++
 package/jasper/jasper.mk            |   3 +
 2 files changed, 172 insertions(+)
 create mode 100644 package/jasper/0002-Fixes-400.patch

diff --git a/package/jasper/0002-Fixes-400.patch b/package/jasper/0002-Fixes-400.patch
new file mode 100644
index 0000000000..b663f1e72e
--- /dev/null
+++ b/package/jasper/0002-Fixes-400.patch
@@ -0,0 +1,169 @@
+From bb7d62bd0a2a8e0e1fdb4d603f3305f955158c52 Mon Sep 17 00:00:00 2001
+From: Michael Adams <mdadams@ece.uvic.ca>
+Date: Tue, 29 Jul 2025 20:16:35 -0700
+Subject: [PATCH] Fixes #400.
+
+Added a check for a missing color component in the jas_image_chclrspc
+function.
+
+CVE: CVE-2025-8835
+Upstream: https://github.com/jasper-software/jasper/commit/bb7d62bd0a2a8e0e1fdb4d603f3305f955158c52
+[thomas: backport to v2.0.33]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/libjasper/base/jas_image.c | 71 ++++++++++++++++++++++++++++------
+ 1 file changed, 59 insertions(+), 12 deletions(-)
+
+diff --git a/src/libjasper/base/jas_image.c b/src/libjasper/base/jas_image.c
+index 68a94e1..cd99ba2 100644
+--- a/src/libjasper/base/jas_image.c
++++ b/src/libjasper/base/jas_image.c
+@@ -112,6 +112,8 @@ static long convert(long val, bool oldsgnd, unsigned oldprec, bool newsgnd,
+   unsigned newprec);
+ static void jas_image_calcbbox2(const jas_image_t *image, jas_image_coord_t *tlx,
+   jas_image_coord_t *tly, jas_image_coord_t *brx, jas_image_coord_t *bry);
++static jas_cmcmptfmt_t* jas_cmcmptfmt_array_create(int n);
++static void jas_cmcmptfmt_array_destroy(jas_cmcmptfmt_t* cmptfmts, int n);
+ 
+ /******************************************************************************\
+ * Global data.
+@@ -409,6 +411,31 @@ static void jas_image_cmpt_destroy(jas_image_cmpt_t *cmpt)
+ 	jas_free(cmpt);
+ }
+ 
++static jas_cmcmptfmt_t* jas_cmcmptfmt_array_create(int n)
++{
++	jas_cmcmptfmt_t* cmptfmts;
++	if (!(cmptfmts = jas_alloc2(n, sizeof(jas_cmcmptfmt_t)))) {
++		return 0;
++	}
++	for (int i = 0; i < n; ++i) {
++		cmptfmts[i].buf = 0;
++	}
++	return cmptfmts;
++}
++
++static void jas_cmcmptfmt_array_destroy(jas_cmcmptfmt_t* cmptfmts, int n)
++{
++	assert(cmptfmts);
++	assert(n > 0);
++	for (int i = 0; i < n; ++i) {
++		if (cmptfmts[i].buf) {
++			jas_free(cmptfmts[i].buf);
++		}
++		cmptfmts[i].buf = 0;
++	}
++	jas_free(cmptfmts);
++}
++
+ /******************************************************************************\
+ * Load and save operations.
+ \******************************************************************************/
+@@ -1470,19 +1497,25 @@ jas_image_t *jas_image_chclrspc(jas_image_t *image, const jas_cmprof_t *outprof,
+ 	jas_cmcmptfmt_t *incmptfmts;
+ 	jas_cmcmptfmt_t *outcmptfmts;
+ 
++	assert(image);
++	assert(outprof);
++
+ #if 0
+ jas_eprintf("IMAGE\n");
+ jas_image_dump(image, stderr);
+ #endif
+ 
+-	if (image->numcmpts_ == 0)
++	if (!jas_image_numcmpts(image)) {
+ 		/* can't work with a file with no components;
+ 		   continuing would crash because we'd attempt to
+ 		   obtain information about the first component */
+ 		return NULL;
++	}
+ 
+ 	outimage = 0;
+ 	xform = 0;
++	incmptfmts = 0;
++	outcmptfmts = 0;
+ 	if (!(inimage = jas_image_copy(image)))
+ 		goto error;
+ 	image = 0;
+@@ -1565,15 +1598,21 @@ jas_image_dump(image, stderr);
+ 	}
+ 
+ 	inpixmap.numcmpts = numinclrchans;
+-	if (!(incmptfmts = jas_alloc2(numinclrchans, sizeof(jas_cmcmptfmt_t)))) {
++	assert(numinclrchans != 0);
++	if (!(incmptfmts = jas_cmcmptfmt_array_create(numinclrchans))) {
+ 		abort();
+ 	}
+ 	inpixmap.cmptfmts = incmptfmts;
+ 	for (unsigned i = 0; i < numinclrchans; ++i) {
+ 		const int j = jas_image_getcmptbytype(inimage, JAS_IMAGE_CT_COLOR(i));
++		if (j < 0) {
++			jas_eprintf("missing color component %d\n", i);
++			goto error;
++		}
+ 		if (!(incmptfmts[i].buf = jas_alloc2(width, sizeof(long)))) {
+ 			goto error;
+ 		}
++		assert(j >= 0 && j < jas_image_numcmpts(inimage));
+ 		incmptfmts[i].prec = jas_image_cmptprec(inimage, j);
+ 		incmptfmts[i].sgnd = jas_image_cmptsgnd(inimage, j);
+ 		incmptfmts[i].width = width;
+@@ -1581,15 +1620,21 @@ jas_image_dump(image, stderr);
+ 	}
+ 
+ 	outpixmap.numcmpts = numoutclrchans;
+-	if (!(outcmptfmts = jas_alloc2(numoutclrchans, sizeof(jas_cmcmptfmt_t)))) {
++	if (!(outcmptfmts = jas_cmcmptfmt_array_create(numoutclrchans))) {
+ 		abort();
+ 	}
+ 	outpixmap.cmptfmts = outcmptfmts;
+ 
+ 	for (unsigned i = 0; i < numoutclrchans; ++i) {
+ 		const int j = jas_image_getcmptbytype(outimage, JAS_IMAGE_CT_COLOR(i));
+-		if (!(outcmptfmts[i].buf = jas_alloc2(width, sizeof(long))))
++		if (j < 0) {
++			jas_eprintf("missing color component %d\n", i);
+ 			goto error;
++		}
++		if (!(outcmptfmts[i].buf = jas_alloc2(width, sizeof(long)))) {
++			goto error;
++		}
++		assert(j >= 0 && j < jas_image_numcmpts(outimage));
+ 		outcmptfmts[i].prec = jas_image_cmptprec(outimage, j);
+ 		outcmptfmts[i].sgnd = jas_image_cmptsgnd(outimage, j);
+ 		outcmptfmts[i].width = width;
+@@ -1612,14 +1657,8 @@ jas_image_dump(image, stderr);
+ 		}
+ 	}
+ 
+-	for (unsigned i = 0; i < numoutclrchans; ++i) {
+-		jas_free(outcmptfmts[i].buf);
+-	}
+-	jas_free(outcmptfmts);
+-	for (unsigned i = 0; i < numinclrchans; ++i) {
+-		jas_free(incmptfmts[i].buf);
+-	}
+-	jas_free(incmptfmts);
++	jas_cmcmptfmt_array_destroy(outcmptfmts, numoutclrchans);
++	jas_cmcmptfmt_array_destroy(incmptfmts, numinclrchans);
+ 	jas_cmxform_destroy(xform);
+ 	jas_image_destroy(inimage);
+ 
+@@ -1631,6 +1670,14 @@ jas_image_dump(outimage, stderr);
+ #endif
+ 	return outimage;
+ error:
++	if (incmptfmts) {
++		assert(numinclrchans);
++		jas_cmcmptfmt_array_destroy(incmptfmts, numinclrchans);
++	}
++	if (outcmptfmts) {
++		assert(numoutclrchans);
++		jas_cmcmptfmt_array_destroy(outcmptfmts, numoutclrchans);
++	}
+ 	if (xform)
+ 		jas_cmxform_destroy(xform);
+ 	if (inimage)
+-- 
+2.39.5
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index dd0badbc8f..527ad6fa8c 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -18,6 +18,9 @@ JASPER_CONF_OPTS = \
 # 0001-Fixes-367.patch
 JASPER_IGNORE_CVES += CVE-2023-51257
 
+# 0002-Fixes-400.patch
+JASPER_IGNORE_CVES += CVE-2025-8835
+
 ifeq ($(BR2_STATIC_LIBS),y)
 JASPER_CONF_OPTS += -DJAS_ENABLE_SHARED=OFF
 endif
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
