Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBEDC4332F
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 13:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D178840159;
	Sun,  6 Nov 2022 13:38:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D178840159
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 65tMO06vX2Gg; Sun,  6 Nov 2022 13:38:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0BA340136;
	Sun,  6 Nov 2022 13:38:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0BA340136
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 547031BF314
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 13:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 350DD403AC
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 13:38:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 350DD403AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M6ywhiIeYhSp for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 13:38:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D862A4035C
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D862A4035C
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 13:38:25 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id o30so5458903wms.2
 for <buildroot@buildroot.org>; Sun, 06 Nov 2022 05:38:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ojKHhfdXi/JCoa5zSCsb6Asyb8vALU7LB8+sfRh+HFo=;
 b=58PKOryWsyAWl/nk+yUiRvULjR1ii2hmXsYn3VWyrGYnJPRvTcnPKqby2Af1I+PVfL
 A1CF2mvurY1qrIXRkYJMywtdCgzQWbz6ThSFYnD+xeAw6FJzbkWxmdJyt/LZPo+snc14
 5rV8NLxOqgurIf6y6XqmsSwdjSJmn31Cf+72xE8UMVKmJ/+BZsyELog399ym+2LYtivJ
 vOZGkZWmdRGhS3mRqXxmCA/TzB5z0WkHQYhR5C+/DGIvjKX1B6ljKTxX0bofRHLmxIfW
 2Poy6iEZzV2a1C5W0hvygnC7JgTTXN36aqoSSub5w/gyNP6Ik0+/wwRecMxeMkyUvPyA
 nVhA==
X-Gm-Message-State: ACrzQf2zF164hw9SGyHBTrfDL9yvMtigeA4N32SRW1lkSUKARHvtbHtd
 K+xyhlc8wpXe8tVFhZoHrmiTEQl03W4=
X-Google-Smtp-Source: AMsMyM4a1wbFIfndm4Qg5J9y14bi+juvp3f2tqweHR1xTSBKPe6ADzuQu5vcrcEBPEJcFcmFRIgrHA==
X-Received: by 2002:a1c:7405:0:b0:3cf:5d41:be8b with SMTP id
 p5-20020a1c7405000000b003cf5d41be8bmr33397640wmc.1.1667741903627; 
 Sun, 06 Nov 2022 05:38:23 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 az2-20020adfe182000000b00226dba960b4sm4872235wrb.3.2022.11.06.05.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 05:38:23 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Nov 2022 14:38:21 +0100
Message-Id: <20221106133821.677548-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ojKHhfdXi/JCoa5zSCsb6Asyb8vALU7LB8+sfRh+HFo=;
 b=WomCXJ+M1C0Nmpn83feuN39HkNtOWvsJRiUj60Yq7GEvgSYP75hH4PNSVDotWQ3PLX
 eAK/6cxawFi4+OOLoXpg8rypj699NsPkVaJslf0JxbTsUSgse2PeB6ebbcBPnFzirMJa
 NlfgLyOli3nBb8HD7Z6wxlKbfNfhEAWaiVwrdQzXqHCin1w0OGrpW5YWndTMGSZzHeON
 20i8ZDgjNYE4+hazH68dKntfEp2Um1lnmJN05LlCIT7d6MjrFHSy6dxGWwqmap2dXtul
 CbEQZJFkXcR+Hw0WyAXa3K6wGX9ldy0F0YxE8NsoyK5fjjymQF1wRL5xrfyU1hn85JEZ
 RHjw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WomCXJ+M
Subject: [Buildroot] [PATCH 1/1] package/mupdf: fix CVE-2021-4216
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A Floating point exception (division-by-zero) flaw was found in Mupdf
for zero width pages in muraster.c. It is fixed in Mupdf-1.20.0-rc1
upstream.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ero-for-zero-width-pages-in-muraster.patch | 29 +++++++++++++++++++
 package/mupdf/mupdf.mk                        |  3 ++
 2 files changed, 32 insertions(+)
 create mode 100644 package/mupdf/0005-Bug-704834-Fix-division-by-zero-for-zero-width-pages-in-muraster.patch

diff --git a/package/mupdf/0005-Bug-704834-Fix-division-by-zero-for-zero-width-pages-in-muraster.patch b/package/mupdf/0005-Bug-704834-Fix-division-by-zero-for-zero-width-pages-in-muraster.patch
new file mode 100644
index 0000000000..099a3fdbab
--- /dev/null
+++ b/package/mupdf/0005-Bug-704834-Fix-division-by-zero-for-zero-width-pages-in-muraster.patch
@@ -0,0 +1,29 @@
+From 22c47acbd52949421f8c7cb46ea1556827d0fcbf Mon Sep 17 00:00:00 2001
+From: Sebastian Rasmussen <sebras@gmail.com>
+Date: Tue, 18 Jan 2022 20:33:10 +0100
+Subject: [PATCH] Bug 704834: Fix division by zero for zero width pages in
+ muraster.
+
+[Retrieved from:
+https://github.com/ArtifexSoftware/mupdf/commit/22c47acbd52949421f8c7cb46ea1556827d0fcbf]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ source/tools/muraster.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/source/tools/muraster.c b/source/tools/muraster.c
+index c2ceb62f2e..97f4ae2633 100644
+--- a/source/tools/muraster.c
++++ b/source/tools/muraster.c
+@@ -1003,8 +1003,9 @@ initialise_banding(fz_context *ctx, render_details *render, int color)
+ 
+ 	w = render->ibounds.x1 - render->ibounds.x0;
+ 	min_band_mem = (size_t)bpp * w * min_band_height;
+-	reps = (int)(max_band_memory / min_band_mem);
+-	if (reps < 1)
++	if (min_band_mem > 0)
++		reps = (int)(max_band_memory / min_band_mem);
++	if (min_band_mem == 0 || reps < 1)
+ 		reps = 1;
+ 
+ 	/* Adjust reps to even out the work between threads */
diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
index 56ea7cc507..e86ba1e73f 100644
--- a/package/mupdf/mupdf.mk
+++ b/package/mupdf/mupdf.mk
@@ -28,6 +28,9 @@ MUPDF_IGNORE_CVES += CVE-2021-3407
 # 0003-Bug-703791-Stay-within-hash-table-max-key-size-in-cached-color-converter.patch
 MUPDF_IGNORE_CVES += CVE-2021-37220
 
+# 0005-Bug-704834-Fix-division-by-zero-for-zero-width-pages-in-muraster.patch
+MUPDF_IGNORE_CVES += CVE-2021-4216
+
 # The pkg-config name for gumbo-parser is `gumbo`.
 MUPDF_PKG_CONFIG_PACKAGES = \
 	freetype2 \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
