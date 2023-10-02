Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999F5E7849A
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 11:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D2C882F19;
	Mon,  2 Oct 2023 11:23:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D2C882F19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N_bQ16-az9Km; Mon,  2 Oct 2023 11:23:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B96E82EDB;
	Mon,  2 Oct 2023 11:23:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B96E82EDB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C53131BF404
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 11:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A953E41DB1
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 11:23:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A953E41DB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZDjiebSVDNMk for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 11:23:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FAF24049C
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 11:23:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FAF24049C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A05B84094; Mon,  2 Oct 2023 11:23:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Oct 2023 13:22:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6037f9387a108f2dfc0add56a07073ee96f5f240
X-Git-Newrev: 7d4443343aa6ddd8f7eca40ffdcf8decb4c290f0
X-Patchwork-Hint: ignore
Message-Id: <20231002112323.6A05B84094@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnuplot: unbreak !gd builds since
 5.4.9 bump
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

commit: https://git.buildroot.net/buildroot/commit/?id=7d4443343aa6ddd8f7eca40ffdcf8decb4c290f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/5676609b6331b645f2e557aca67afe4c3a087433/

Fix a build failure for --without-gd builds since the bump to 5.4.9 with
commit 6dc3d3c3606 (package/gnuplot: bump version to 5.4.9):

In file included from term.h:298,
                 from term.c:1211:
../term/post.trm:4016:11: error: expected declaration specifiers or '...' before string constant
 4016 |     fputs("%%%%BeginImage\n", gppsfile);

Add a patch fixing that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...t.trm-unbreak-HAVE_DEFLATE_ENCODER-builds.patch | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/package/gnuplot/0002-term-post.trm-unbreak-HAVE_DEFLATE_ENCODER-builds.patch b/package/gnuplot/0002-term-post.trm-unbreak-HAVE_DEFLATE_ENCODER-builds.patch
new file mode 100644
index 0000000000..c3edb39cc6
--- /dev/null
+++ b/package/gnuplot/0002-term-post.trm-unbreak-HAVE_DEFLATE_ENCODER-builds.patch
@@ -0,0 +1,51 @@
+From 84002a5bd7f4cb10e9beffab88ae55b4e982bcea Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Sun, 1 Oct 2023 10:20:31 +0200
+Subject: [PATCH] term/post.trm: unbreak !HAVE_DEFLATE_ENCODER builds
+
+Commit 2f2cf617808 (post: handle RGBA images (only current use is to render
+a pixmap)) added an extra '}' outside the HAVE_DEFLATE_ENCODER (gd support)
+conditional, leading to build breakage:
+
+In file included from term.h:298,
+                 from term.c:1211:
+../term/post.trm:4016:11: error: expected declaration specifiers or '...' before string constant
+ 4016 |     fputs("%%%%BeginImage\n", gppsfile);
+
+http://autobuild.buildroot.net/results/5676609b6331b645f2e557aca67afe4c3a087433/build-end.log
+
+Fix it by dropping the extra { } added by the above commit.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+Upstream: https://sourceforge.net/p/gnuplot/gnuplot-main/merge-requests/28/
+---
+ term/post.trm | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/term/post.trm b/term/post.trm
+index 186eb9d3c..100811b86 100644
+--- a/term/post.trm
++++ b/term/post.trm
+@@ -4000,17 +4000,16 @@ PS_image (unsigned int M, unsigned int N, coordval *image, gpiPoint *corner, t_i
+ 	cscale = 1.0;
+ 
+ #ifdef HAVE_DEFLATE_ENCODER
+-    if (ps_params->level3) {
++    if (ps_params->level3)
+ 	encoded_image = (void *)PS_encode_png_image(M, N, image, color_mode,
+ 					    bits_per_component, max_colors, cscale,
+ 					    &num_encoded_bytes);
+-    } else {
++    else
+ #endif
+ 	encoded_image = PS_encode_image(M, N, image, color_mode,
+ 					bits_per_component, max_colors, cscale,
+ 					(ps_params->level1 ? PS_ASCII_HEX : PS_ASCII85),
+ 					&num_encoded_bytes);
+-    }
+ 
+ 
+     fputs("%%%%BeginImage\n", gppsfile);
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
