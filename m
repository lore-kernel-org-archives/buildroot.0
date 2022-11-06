Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB3AC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5138142A82;
	Mon, 20 Feb 2023 21:07:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5138142A82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UFm3g2T6iTG6; Mon, 20 Feb 2023 21:07:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3908142A8D;
	Mon, 20 Feb 2023 21:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3908142A8D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B75E1BF94D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7561B610A2
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7561B610A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jZ2FGX_57snl for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9C1D6108D
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9C1D6108D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D76B2828C8; Mon, 20 Feb 2023 20:51:47 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 6 Nov 2022 15:06:13 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 88d2135a7ad7ed899ef1f2fec070407810f8055d
X-Git-Newrev: 3ddca0ccb90967977c2db8c966c205568cf4cb93
X-Patchwork-Hint: ignore
Message-Id: <20230220205147.D76B2828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mupdf: fix
 CVE-2021-4216
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3ddca0ccb90967977c2db8c966c205568cf4cb93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

A Floating point exception (division-by-zero) flaw was found in Mupdf
for zero width pages in muraster.c. It is fixed in Mupdf-1.20.0-rc1
upstream.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-by-zero-for-zero-width-pages-in-muraster.patch | 29 ++++++++++++++++++++++
 package/mupdf/mupdf.mk                             |  3 +++
 2 files changed, 32 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
