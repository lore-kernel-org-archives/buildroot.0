Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DFDC47074
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 16:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A886840424;
	Sun,  7 Jan 2024 16:25:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A886840424
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eT2fyu6pL-fy; Sun,  7 Jan 2024 16:25:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B2E5403E5;
	Sun,  7 Jan 2024 16:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B2E5403E5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E29211BF38B
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 16:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B706A81357
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 16:23:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B706A81357
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ROpx1saaubny for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 16:23:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF7138132B
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 16:23:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF7138132B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE670847B4; Sun,  7 Jan 2024 16:23:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Jan 2024 10:28:35 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: c307cd9595c5889e5593b705e098fdebac44ff2f
X-Git-Newrev: cc3a88b9eca3fb9cdc458c1423bb02a73c020a0c
X-Patchwork-Hint: ignore
Message-Id: <20240107162341.CE670847B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch: New
 security patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc3a88b9eca3fb9cdc458c1423bb02a73c020a0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit df04f179761614f3bccaf208d688ec4e2f64e38d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ix-several-defects-found-by-Coverity-scan.patch | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch b/package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch
new file mode 100644
index 0000000000..1719769872
--- /dev/null
+++ b/package/giflib/0004-Fix-several-defects-found-by-Coverity-scan.patch
@@ -0,0 +1,61 @@
+From a1c48b91cd1cf1e9bf7077709b69f4bfd4c4abc7 Mon Sep 17 00:00:00 2001
+From: Sandro Mani <manisandro@gmail.com>
+Date: Tue, 5 Dec 2023 16:38:48 -0700
+Subject: [PATCH] Fix several defects found by Coverity scan
+
+From: giflib-5.2.1-17.fc39.src.rpm
+Upstream: Not submitted
+
+Signed-off-by: Sandro Mani <manisandro@gmail.com>
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ gif2rgb.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/gif2rgb.c b/gif2rgb.c
+index d9a469f..02cea41 100644
+--- a/gif2rgb.c
++++ b/gif2rgb.c
+@@ -170,6 +170,8 @@ static void SaveGif(GifByteType *OutputBuffer,
+     /* Open stdout for the output file: */
+     if ((GifFile = EGifOpenFileHandle(1, &Error)) == NULL) {
+ 	PrintGifError(Error);
++	free(OutputBuffer);
++	GifFreeMapObject(OutputColorMap);
+ 	exit(EXIT_FAILURE);
+     }
+ 
+@@ -179,6 +181,8 @@ static void SaveGif(GifByteType *OutputBuffer,
+ 	EGifPutImageDesc(GifFile,
+ 			 0, 0, Width, Height, false, NULL) == GIF_ERROR) {
+ 	PrintGifError(Error);
++	free(OutputBuffer);
++	GifFreeMapObject(OutputColorMap);
+ 	exit(EXIT_FAILURE);
+     }
+ 
+@@ -187,8 +191,11 @@ static void SaveGif(GifByteType *OutputBuffer,
+ 	       GifFile->Image.Width, GifFile->Image.Height);
+ 
+     for (i = 0; i < Height; i++) {
+-	if (EGifPutLine(GifFile, Ptr, Width) == GIF_ERROR)
++	if (EGifPutLine(GifFile, Ptr, Width) == GIF_ERROR) {
++	    free(OutputBuffer);
++	    GifFreeMapObject(OutputColorMap);
+ 	    exit(EXIT_FAILURE);
++        }
+ 	GifQprintf("\b\b\b\b%-4d", Height - i - 1);
+ 
+ 	Ptr += Width;
+@@ -196,6 +203,8 @@ static void SaveGif(GifByteType *OutputBuffer,
+ 
+     if (EGifCloseFile(GifFile, &Error) == GIF_ERROR) {
+ 	PrintGifError(Error);
++	free(OutputBuffer);
++	GifFreeMapObject(OutputColorMap);
+ 	exit(EXIT_FAILURE);
+     }
+ }
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
