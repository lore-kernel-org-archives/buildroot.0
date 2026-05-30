Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C574CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 10:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6ED1B84BD7;
	Sat, 30 May 2026 10:40:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id is0xwo7lLsj0; Sat, 30 May 2026 10:40:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7674C84BDD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780137645;
	bh=3lDwL6i31BpRZ0Op5QttmA/OS4SvjFA+waVIlMP2FgA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=J6EtnL4Qgy2TidBPkD85pH1IS0bJYFyMGOIm2QQcnqWJG1nAQGb3EUckj7V+h80dw
	 v7x3ELdTBe1PqqXLe+LECrF3mPUXWntBtQoxlzA8RV/L/MmyV3gj0D+812M6WIAonw
	 oKM/w3GGng3hGwD7OosweZRBg0y9de0Ci4xoENyr5qte4LRgk807aFoE4eVEOEP1f6
	 iCU+8DdoPpOCPz5J+KbFwAt7U1sA7WXKDpyfywgMr0VNWQzUgKvgQck+aN/qKxt5k+
	 DpTb0UxUDQMjNnIr7c+AXSAYZAL3i3yyje7KH2zyWCWwTEHvc5IJGuGdSHpiyMNipV
	 1IGh7qGJllkBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7674C84BDD;
	Sat, 30 May 2026 10:40:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BB6D412F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C1C884BDD
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 33J9qNit_q7g for <buildroot@buildroot.org>;
 Sat, 30 May 2026 10:40:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ADF7684BD7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADF7684BD7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ADF7684BD7
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:40:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bc7.dip0.t-ipconnect.de [91.58.11.199])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B54F6A4C2EC6;
 Sat, 30 May 2026 12:40:41 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55296)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wTH7R-000000005FJ-384q;
 Sat, 30 May 2026 10:40:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 30 May 2026 12:40:41 +0200
Message-ID: <20260530104041.610019-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780137641;
 bh=Cwn+XIZp8p0KzX2jqlbmqobEvOiP7tu8MOVZy/GB0EU=;
 h=From:To:Cc:Subject:Date:From;
 b=YlcQR+dFMWx6ksr8AqmDCDwrfpiPk/rZAr3aqkWABBMce2OrCPaJVA93pS3zQ7IZM
 2/63r6bShggSasedcI3+DYQZZmTglg7aBHkChmNaMd8BwPpCU9Lc+0hszgdP955dM0
 4AQFT94oZ+Zuqey/KokA01NzOCTwaBzQxNl7MkNFcqreqD2HN9jDUMXKjtpVtZt0fh
 HglPv3sGdkMD+3OuYUEZD9DysLxB9elXVEcUXxmGU18k5SHXWos/xal5Aqu5S+UIBe
 rbN6divj1M1SVjcVeYMmW7OgZ7BP6orQqluN+qlzWPf0qgyHyqzqxma+HIz0SzJuFL
 VWTmm30WNUTXQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=YlcQR+dF
Subject: [Buildroot] [PATCH v3 1/1] package/cairo: Fix build
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

Buildroot commit 29888ab35e047099d239f266b7b565cd4023503e bumped cairo
to version 1.18.2.

This version includes commit
https://gitlab.freedesktop.org/cairo/cairo/-/commit/87f7c60bf7c20079c34cfc54e4db05920d14db56
"Add support for C11 atomics"

which causes build errors:

../src/cairo-image-source.c: In function '_pixman_transparent_image':
../src/cairo-image-source.c:89:40: error: passing argument 1 of '_cairo_atomic_ptr_cmpxchg_impl'
 from incompatible pointer type [-Wincompatible-pointer-types]
   89 |         if (_cairo_atomic_ptr_cmpxchg (&__pixman_transparent_image,

Fixes:
1.18.2: https://autobuild.buildroot.net/results/5d4/5d4cd38d71008f385f92577b07f21dcfc3c19b38/
1.18.4: https://autobuild.buildroot.net/results/0e9/0e962c66e1e96b5899e87c13ace824379adc09f9/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v3: Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/fccaeb11d27ac32dadd0807f631c3d03ec637908

v2: updated patch description, git-formatted patch and pointed source
    URL to versioned git tree

 ...ilence-some-Wincompatible-pointer-ty.patch | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/cairo/0001-external-cairo-Silence-some-Wincompatible-pointer-ty.patch

diff --git a/package/cairo/0001-external-cairo-Silence-some-Wincompatible-pointer-ty.patch b/package/cairo/0001-external-cairo-Silence-some-Wincompatible-pointer-ty.patch
new file mode 100644
index 0000000000..95f7924f12
--- /dev/null
+++ b/package/cairo/0001-external-cairo-Silence-some-Wincompatible-pointer-ty.patch
@@ -0,0 +1,49 @@
+From 78258169cf0c380754804b5835203a199ba8efab Mon Sep 17 00:00:00 2001
+From: Stephan Bergmann <stephan.bergmann@collabora.com>
+Date: Mon, 22 Sep 2025 17:08:36 +0200
+Subject: [PATCH] external/cairo: Silence some -Wincompatible-pointer-types
+
+Downloaded from
+https://github.com/LibreOffice/core/blob/36e0812a01ae5b94a1bb7549b0db20812d0f821a/external/cairo/cairo/Wincompatible-pointer-types.patch.0
+
+Upstream: https://gitlab.freedesktop.org/cairo/cairo/-/issues/921
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/cairo-image-source.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/cairo-image-source.c b/src/cairo-image-source.c
+index eaf72e2cc..05ffa5660 100644
+--- a/src/cairo-image-source.c
++++ b/src/cairo-image-source.c
+@@ -86,7 +86,7 @@ _pixman_transparent_image (void)
+ 	if (unlikely (image == NULL))
+ 	    return NULL;
+ 
+-	if (_cairo_atomic_ptr_cmpxchg (&__pixman_transparent_image,
++	if (_cairo_atomic_ptr_cmpxchg ((cairo_atomic_intptr_t *) &__pixman_transparent_image,
+ 				       NULL, image))
+ 	{
+ 	    pixman_image_ref (image);
+@@ -118,7 +118,7 @@ _pixman_black_image (void)
+ 	if (unlikely (image == NULL))
+ 	    return NULL;
+ 
+-	if (_cairo_atomic_ptr_cmpxchg (&__pixman_black_image,
++	if (_cairo_atomic_ptr_cmpxchg ((cairo_atomic_intptr_t *) &__pixman_black_image,
+ 				       NULL, image))
+ 	{
+ 	    pixman_image_ref (image);
+@@ -150,7 +150,7 @@ _pixman_white_image (void)
+ 	if (unlikely (image == NULL))
+ 	    return NULL;
+ 
+-	if (_cairo_atomic_ptr_cmpxchg (&__pixman_white_image,
++	if (_cairo_atomic_ptr_cmpxchg ((cairo_atomic_intptr_t *) &__pixman_white_image,
+ 				       NULL, image))
+ 	{
+ 	    pixman_image_ref (image);
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
