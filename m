Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3348E748E9
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 09:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66B6183DFA;
	Sun,  1 Oct 2023 09:44:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66B6183DFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dkRauSkkW_4b; Sun,  1 Oct 2023 09:44:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF30083DF1;
	Sun,  1 Oct 2023 09:44:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF30083DF1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9082B1BF2EA
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 09:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67F1B41D73
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 09:44:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67F1B41D73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V50AKL0g6DfY for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 09:44:16 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D8B8D41D6D
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 09:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8B8D41D6D
Received: by mail.gandi.net (Postfix) with ESMTPSA id DA8D9FF809;
 Sun,  1 Oct 2023 09:44:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@48ers.dk>)
 id 1qmszi-00GHP6-Nw; Sun, 01 Oct 2023 11:44:10 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 11:44:08 +0200
Message-Id: <20231001094408.3880093-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] [PATCH] package/gnuplot: unbreak !gd builds since 5.4.9
 bump
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
Cc: Michael Fischer <mf@go-sys.de>,
 Anthony Viallard <viallard@syscom-instruments.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
 ...-unbreak-HAVE_DEFLATE_ENCODER-builds.patch | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 package/gnuplot/0002-term-post.trm-unbreak-HAVE_DEFLATE_ENCODER-builds.patch

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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
