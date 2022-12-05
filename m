Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A4EC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 20:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AF49402DD;
	Mon, 20 Feb 2023 20:58:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AF49402DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uuQ7zOiMKuaJ; Mon, 20 Feb 2023 20:58:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 338714050F;
	Mon, 20 Feb 2023 20:58:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 338714050F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12F661BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 198EF822DD
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 198EF822DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7XWnOg26_lfF for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 513B4822E0
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 513B4822E0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41C2086495; Mon, 20 Feb 2023 20:51:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Dec 2022 15:14:59 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2313f68e4c56faf9d5366bc3c61d03cf814f5a43
X-Git-Newrev: f298729fc3e3d71c01eab9e2939661fb50a7fe5a
X-Patchwork-Hint: ignore
Message-Id: <20230220205156.41C2086495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Revert "package/mupdf: fix
 CVE-2021-4216"
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

commit: https://git.buildroot.net/buildroot/commit/?id=f298729fc3e3d71c01eab9e2939661fb50a7fe5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This reverts commit 3ddca0ccb90967977c2db8c966c205568cf4cb93.

With the merge of next, we are now using mupdf 1.20.3, so this fix is no
longer needed.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-by-zero-for-zero-width-pages-in-muraster.patch | 29 ----------------------
 package/mupdf/mupdf.mk                             |  3 ---
 2 files changed, 32 deletions(-)

diff --git a/package/mupdf/0005-Bug-704834-Fix-division-by-zero-for-zero-width-pages-in-muraster.patch b/package/mupdf/0005-Bug-704834-Fix-division-by-zero-for-zero-width-pages-in-muraster.patch
deleted file mode 100644
index 099a3fdbab..0000000000
--- a/package/mupdf/0005-Bug-704834-Fix-division-by-zero-for-zero-width-pages-in-muraster.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 22c47acbd52949421f8c7cb46ea1556827d0fcbf Mon Sep 17 00:00:00 2001
-From: Sebastian Rasmussen <sebras@gmail.com>
-Date: Tue, 18 Jan 2022 20:33:10 +0100
-Subject: [PATCH] Bug 704834: Fix division by zero for zero width pages in
- muraster.
-
-[Retrieved from:
-https://github.com/ArtifexSoftware/mupdf/commit/22c47acbd52949421f8c7cb46ea1556827d0fcbf]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- source/tools/muraster.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/source/tools/muraster.c b/source/tools/muraster.c
-index c2ceb62f2e..97f4ae2633 100644
---- a/source/tools/muraster.c
-+++ b/source/tools/muraster.c
-@@ -1003,8 +1003,9 @@ initialise_banding(fz_context *ctx, render_details *render, int color)
- 
- 	w = render->ibounds.x1 - render->ibounds.x0;
- 	min_band_mem = (size_t)bpp * w * min_band_height;
--	reps = (int)(max_band_memory / min_band_mem);
--	if (reps < 1)
-+	if (min_band_mem > 0)
-+		reps = (int)(max_band_memory / min_band_mem);
-+	if (min_band_mem == 0 || reps < 1)
- 		reps = 1;
- 
- 	/* Adjust reps to even out the work between threads */
diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
index c333f43957..1fc54b2d35 100644
--- a/package/mupdf/mupdf.mk
+++ b/package/mupdf/mupdf.mk
@@ -28,9 +28,6 @@ MUPDF_IGNORE_CVES += CVE-2021-3407
 # 0003-Bug-703791-Stay-within-hash-table-max-key-size-in-cached-color-converter.patch
 MUPDF_IGNORE_CVES += CVE-2021-37220
 
-# 0005-Bug-704834-Fix-division-by-zero-for-zero-width-pages-in-muraster.patch
-MUPDF_IGNORE_CVES += CVE-2021-4216
-
 # The pkg-config name for gumbo-parser is `gumbo`.
 MUPDF_PKG_CONFIG_PACKAGES = \
 	freetype2 \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
