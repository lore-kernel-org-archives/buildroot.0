Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48E0CAC5B5
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B5246153A;
	Thu, 25 Sep 2025 20:17:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NCpc0rJ5sB3R; Thu, 25 Sep 2025 20:17:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5256761556
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5256761556;
	Thu, 25 Sep 2025 20:17:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CE58F177
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E05D40066
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i2mm8IdrdiFo for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:16:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 55B6E41275
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55B6E41275
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 55B6E41275
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:53 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-46cb53c5900so15260125e9.3
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 13:16:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758831411; x=1759436211;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CevqXFrL5LA/M6h+CSEuYFF0GjsxBh+BJ9OastP8kgo=;
 b=sJNWTgc9V4iJxWrA9zb6lPle0tqGWj8JVFcIb5N9fYlg5YHOzPfG8UA3l5+uug9uaB
 KJi9TLi90YDlVESHrZGhfQd89nMqFiqQSqVdgO+A0va3wySGF/ZYR/8xtOJSdHzhxHvR
 ZqyZvjbf/W2MfCHGu0lKXPvAecg3TyLXgPlsikt0o5hTpjD7AXer5bgqsIHXJ6UxKtHo
 rzbzFSl7UXmEw06B0If6l11Jd+yWgv58Gz8lqkJuvtLnSq0L9sCcRVSHLpUe3cR4dHFm
 05EIT3ISZWft0xrSV+hxfwhTSst/M7O8Yaik5n/aBEn27DYSQWdWBNXojmz9simJaUff
 Nidw==
X-Gm-Message-State: AOJu0YxHZvGKB3SuG1KkSvialygUgtZJZQNIet2Uwjf/qAwploUWcTjl
 /IYtBzqXzFzdSx+A6IMi2T/Uha6qDKIY8edGchwLg/8zYRC8a0stzGYNRbJRtXOM26giis4lYrq
 BDSFFr4Q=
X-Gm-Gg: ASbGncu210Keu9gz5rolKchRVXWnwd7y1tqohZkbj1Ccs8U9Y1c+rAqdYsKHUUGk0DL
 sQ8ZxDqJi4M1yX4RK4W/M0r1C5V+UARw+d7brUFVL2Z/EbhuU4GOHQKN6jVmhV1vxD20Je68KXC
 BdfPVlYN/rvbViCsiVSedo9+xskXbXz3UpUoO4QNdKHgLX/c7gltE86VkvMRZ2eu4qtSZDThjl/
 vyRC9irtauIInwZFTPW0GPf2z+IZ1/vULzIShg7zoGFNmBX6rqd6CUN1156NUky8DSh+LtMNH8/
 KK61+isq/FTtKb3CScXqpROYv9NXoCqTdFf+b4Fg3nX/FF7Oz4AiWPuN2QzfjATeTJZJJJv+DnJ
 4LCYD+uJ1RwGO7ko=
X-Google-Smtp-Source: AGHT+IEqw2FNSMPyW6uR2uCvaFmovVJTzh5Lwa43qrZ8Dv4JgYn07raElute8h75cZnC8rRQupj71w==
X-Received: by 2002:a05:6000:40e0:b0:402:4142:c7a7 with SMTP id
 ffacd0b85a97d-40e4745ea1fmr4465755f8f.16.1758831411305; 
 Thu, 25 Sep 2025 13:16:51 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e33be363esm46316775e9.15.2025.09.25.13.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 13:16:50 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:16:50 +0200
Message-ID: <20250925201650.43756-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250917185443.2881784-2-thomas.perale@mind.be>
References: <20250917185443.2881784-2-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758831411; x=1759436211; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CevqXFrL5LA/M6h+CSEuYFF0GjsxBh+BJ9OastP8kgo=;
 b=CTY3V6aknXQRqBge0T2IE26RrHdQyR4JoyWs9+P0s+WiIrN4tU3R4YXiiUNolxQDPI
 BbDHYQNlTzc7KFtN+U7voeUtrqKhbO+KjUEV2E6poXAA+mw/MCoejRkk0Qu+aSeWzo5h
 3M/UBhbEiOgfXntB6vdvAKlRBgqhxtZhhVkk4rO264YbvQIu+mQusK+HyH6GXO+B2+ju
 W1tiR/stBP9g6d7YDmQPia2ezAMS+GV55FIkdGZnUNoo3VGNnev9xEymzEaioz1aEW1H
 gl0yiU57KU3PhWiaTWp9hGdRyycDApUsjPKW9nN+JTbR1vw7zcUIB50a/zxbWlhr2ty8
 izhg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CTY3V6ak
Subject: Re: [Buildroot] [PATCH 2/2] package/jasper: add patch for
 CVE-2025-8835
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
> This fixes the following vulnerability:
> 
> - CVE-2025-8835:
> 
> A vulnerability was found in JasPer up to 4.2.5. Affected by this
> vulnerability is the function jas_image_chclrspc of the file
> src/libjasper/base/jas_image.c of the component Image Color Space
> Conversion Handler. The manipulation leads to null pointer dereference.
> It is possible to launch the attack on the local host. The exploit has
> been disclosed to the public and may be used. The identifier of the
> patch is bb7d62bd0a2a8e0e1fdb4d603f3305f955158c52. It is recommended to
> apply a patch to fix this issue.
> 
> For more information see:
>   - https://nvd.nist.gov//vuln/detail/CVE-2025-8835
>   - https://github.com/jasper-software/jasper/commit/bb7d62bd0a2a8e0e1fdb4d603f3305f955158c52
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  package/jasper/0002-Fixes-400.patch | 169 ++++++++++++++++++++++++++++
>  package/jasper/jasper.mk            |   3 +
>  2 files changed, 172 insertions(+)
>  create mode 100644 package/jasper/0002-Fixes-400.patch
> 
> diff --git a/package/jasper/0002-Fixes-400.patch b/package/jasper/0002-Fixes-400.patch
> new file mode 100644
> index 0000000000..b663f1e72e
> --- /dev/null
> +++ b/package/jasper/0002-Fixes-400.patch
> @@ -0,0 +1,169 @@
> +From bb7d62bd0a2a8e0e1fdb4d603f3305f955158c52 Mon Sep 17 00:00:00 2001
> +From: Michael Adams <mdadams@ece.uvic.ca>
> +Date: Tue, 29 Jul 2025 20:16:35 -0700
> +Subject: [PATCH] Fixes #400.
> +
> +Added a check for a missing color component in the jas_image_chclrspc
> +function.
> +
> +CVE: CVE-2025-8835
> +Upstream: https://github.com/jasper-software/jasper/commit/bb7d62bd0a2a8e0e1fdb4d603f3305f955158c52
> +[thomas: backport to v2.0.33]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/libjasper/base/jas_image.c | 71 ++++++++++++++++++++++++++++------
> + 1 file changed, 59 insertions(+), 12 deletions(-)
> +
> +diff --git a/src/libjasper/base/jas_image.c b/src/libjasper/base/jas_image.c
> +index 68a94e1..cd99ba2 100644
> +--- a/src/libjasper/base/jas_image.c
> ++++ b/src/libjasper/base/jas_image.c
> +@@ -112,6 +112,8 @@ static long convert(long val, bool oldsgnd, unsigned oldprec, bool newsgnd,
> +   unsigned newprec);
> + static void jas_image_calcbbox2(const jas_image_t *image, jas_image_coord_t *tlx,
> +   jas_image_coord_t *tly, jas_image_coord_t *brx, jas_image_coord_t *bry);
> ++static jas_cmcmptfmt_t* jas_cmcmptfmt_array_create(int n);
> ++static void jas_cmcmptfmt_array_destroy(jas_cmcmptfmt_t* cmptfmts, int n);
> + 
> + /******************************************************************************\
> + * Global data.
> +@@ -409,6 +411,31 @@ static void jas_image_cmpt_destroy(jas_image_cmpt_t *cmpt)
> + 	jas_free(cmpt);
> + }
> + 
> ++static jas_cmcmptfmt_t* jas_cmcmptfmt_array_create(int n)
> ++{
> ++	jas_cmcmptfmt_t* cmptfmts;
> ++	if (!(cmptfmts = jas_alloc2(n, sizeof(jas_cmcmptfmt_t)))) {
> ++		return 0;
> ++	}
> ++	for (int i = 0; i < n; ++i) {
> ++		cmptfmts[i].buf = 0;
> ++	}
> ++	return cmptfmts;
> ++}
> ++
> ++static void jas_cmcmptfmt_array_destroy(jas_cmcmptfmt_t* cmptfmts, int n)
> ++{
> ++	assert(cmptfmts);
> ++	assert(n > 0);
> ++	for (int i = 0; i < n; ++i) {
> ++		if (cmptfmts[i].buf) {
> ++			jas_free(cmptfmts[i].buf);
> ++		}
> ++		cmptfmts[i].buf = 0;
> ++	}
> ++	jas_free(cmptfmts);
> ++}
> ++
> + /******************************************************************************\
> + * Load and save operations.
> + \******************************************************************************/
> +@@ -1470,19 +1497,25 @@ jas_image_t *jas_image_chclrspc(jas_image_t *image, const jas_cmprof_t *outprof,
> + 	jas_cmcmptfmt_t *incmptfmts;
> + 	jas_cmcmptfmt_t *outcmptfmts;
> + 
> ++	assert(image);
> ++	assert(outprof);
> ++
> + #if 0
> + jas_eprintf("IMAGE\n");
> + jas_image_dump(image, stderr);
> + #endif
> + 
> +-	if (image->numcmpts_ == 0)
> ++	if (!jas_image_numcmpts(image)) {
> + 		/* can't work with a file with no components;
> + 		   continuing would crash because we'd attempt to
> + 		   obtain information about the first component */
> + 		return NULL;
> ++	}
> + 
> + 	outimage = 0;
> + 	xform = 0;
> ++	incmptfmts = 0;
> ++	outcmptfmts = 0;
> + 	if (!(inimage = jas_image_copy(image)))
> + 		goto error;
> + 	image = 0;
> +@@ -1565,15 +1598,21 @@ jas_image_dump(image, stderr);
> + 	}
> + 
> + 	inpixmap.numcmpts = numinclrchans;
> +-	if (!(incmptfmts = jas_alloc2(numinclrchans, sizeof(jas_cmcmptfmt_t)))) {
> ++	assert(numinclrchans != 0);
> ++	if (!(incmptfmts = jas_cmcmptfmt_array_create(numinclrchans))) {
> + 		abort();
> + 	}
> + 	inpixmap.cmptfmts = incmptfmts;
> + 	for (unsigned i = 0; i < numinclrchans; ++i) {
> + 		const int j = jas_image_getcmptbytype(inimage, JAS_IMAGE_CT_COLOR(i));
> ++		if (j < 0) {
> ++			jas_eprintf("missing color component %d\n", i);
> ++			goto error;
> ++		}
> + 		if (!(incmptfmts[i].buf = jas_alloc2(width, sizeof(long)))) {
> + 			goto error;
> + 		}
> ++		assert(j >= 0 && j < jas_image_numcmpts(inimage));
> + 		incmptfmts[i].prec = jas_image_cmptprec(inimage, j);
> + 		incmptfmts[i].sgnd = jas_image_cmptsgnd(inimage, j);
> + 		incmptfmts[i].width = width;
> +@@ -1581,15 +1620,21 @@ jas_image_dump(image, stderr);
> + 	}
> + 
> + 	outpixmap.numcmpts = numoutclrchans;
> +-	if (!(outcmptfmts = jas_alloc2(numoutclrchans, sizeof(jas_cmcmptfmt_t)))) {
> ++	if (!(outcmptfmts = jas_cmcmptfmt_array_create(numoutclrchans))) {
> + 		abort();
> + 	}
> + 	outpixmap.cmptfmts = outcmptfmts;
> + 
> + 	for (unsigned i = 0; i < numoutclrchans; ++i) {
> + 		const int j = jas_image_getcmptbytype(outimage, JAS_IMAGE_CT_COLOR(i));
> +-		if (!(outcmptfmts[i].buf = jas_alloc2(width, sizeof(long))))
> ++		if (j < 0) {
> ++			jas_eprintf("missing color component %d\n", i);
> + 			goto error;
> ++		}
> ++		if (!(outcmptfmts[i].buf = jas_alloc2(width, sizeof(long)))) {
> ++			goto error;
> ++		}
> ++		assert(j >= 0 && j < jas_image_numcmpts(outimage));
> + 		outcmptfmts[i].prec = jas_image_cmptprec(outimage, j);
> + 		outcmptfmts[i].sgnd = jas_image_cmptsgnd(outimage, j);
> + 		outcmptfmts[i].width = width;
> +@@ -1612,14 +1657,8 @@ jas_image_dump(image, stderr);
> + 		}
> + 	}
> + 
> +-	for (unsigned i = 0; i < numoutclrchans; ++i) {
> +-		jas_free(outcmptfmts[i].buf);
> +-	}
> +-	jas_free(outcmptfmts);
> +-	for (unsigned i = 0; i < numinclrchans; ++i) {
> +-		jas_free(incmptfmts[i].buf);
> +-	}
> +-	jas_free(incmptfmts);
> ++	jas_cmcmptfmt_array_destroy(outcmptfmts, numoutclrchans);
> ++	jas_cmcmptfmt_array_destroy(incmptfmts, numinclrchans);
> + 	jas_cmxform_destroy(xform);
> + 	jas_image_destroy(inimage);
> + 
> +@@ -1631,6 +1670,14 @@ jas_image_dump(outimage, stderr);
> + #endif
> + 	return outimage;
> + error:
> ++	if (incmptfmts) {
> ++		assert(numinclrchans);
> ++		jas_cmcmptfmt_array_destroy(incmptfmts, numinclrchans);
> ++	}
> ++	if (outcmptfmts) {
> ++		assert(numoutclrchans);
> ++		jas_cmcmptfmt_array_destroy(outcmptfmts, numoutclrchans);
> ++	}
> + 	if (xform)
> + 		jas_cmxform_destroy(xform);
> + 	if (inimage)
> +-- 
> +2.39.5
> diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
> index dd0badbc8f..527ad6fa8c 100644
> --- a/package/jasper/jasper.mk
> +++ b/package/jasper/jasper.mk
> @@ -18,6 +18,9 @@ JASPER_CONF_OPTS = \
>  # 0001-Fixes-367.patch
>  JASPER_IGNORE_CVES += CVE-2023-51257
>  
> +# 0002-Fixes-400.patch
> +JASPER_IGNORE_CVES += CVE-2025-8835
> +
>  ifeq ($(BR2_STATIC_LIBS),y)
>  JASPER_CONF_OPTS += -DJAS_ENABLE_SHARED=OFF
>  endif
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
