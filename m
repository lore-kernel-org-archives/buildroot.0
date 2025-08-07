Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E086AC87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 22:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9442281184;
	Thu,  7 Aug 2025 22:51:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sIlmi2FC7Lb6; Thu,  7 Aug 2025 22:51:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3169A81167
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3169A81167;
	Thu,  7 Aug 2025 22:51:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BF2C810A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 22:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A557781167
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 22:51:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id naOPosILNZex for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 22:51:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 061EA8111A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 061EA8111A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 22:51:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F414886F34; Thu,  7 Aug 2025 22:51:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 8 Aug 2025 00:37:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd5faa8a245ca04492afc4c64e2cea5de0ec26cb
X-Git-Newrev: c897f16a98644c1eb4883cdf3cc2ce38dcff7e73
X-Patchwork-Hint: ignore
Message-Id: <20250807225139.F414886F34@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_gstreamer1: raise
 tesseract-ocr timeout to 15s
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c897f16a98644c1eb4883cdf3cc2ce38dcff7e73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On my laptop (i5-8365U), running cross-tesseract-ocr in QEMU takes
longer than the default timeout (5s), causing the test to fail:

 # time tesseract frame10.png output
 Error in pixReadMemTiff: function not present
 Error in pixReadMem: tiff: no pix returned
 Error in pixaGenerateFontFromString: pix not made
 Error in bmfCreate: font pixa not made
 Estimating resolution as 157
 real    0m 8.17s
 user    0m 5.36s
 sys     0m 2.79s

So extend the assertRunOk() timeout with ~2x that similar to how it is done
for the gst-launch-1.0 pipeline.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_gstreamer1.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_gstreamer1.py b/support/testing/tests/package/test_gstreamer1.py
index ff0302a8a6..82829dab98 100644
--- a/support/testing/tests/package/test_gstreamer1.py
+++ b/support/testing/tests/package/test_gstreamer1.py
@@ -75,7 +75,7 @@ class TestGstreamer1(infra.basetest.BRTest):
         # We extract the text from our last image.
         img_file = f"frame{num_frames}.png"
         cmd = f"tesseract {img_file} output"
-        self.assertRunOk(cmd)
+        self.assertRunOk(cmd, timeout=15)
 
         # We check we have our initial message.
         out, ret = self.emulator.run("cat output.txt")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
