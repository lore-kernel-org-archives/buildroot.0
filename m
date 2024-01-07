Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C124FC47073
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 16:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75476400D0;
	Sun,  7 Jan 2024 16:22:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75476400D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZurxaSm86ZVT; Sun,  7 Jan 2024 16:22:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CB95400CF;
	Sun,  7 Jan 2024 16:22:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CB95400CF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 04C341BF38B
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 16:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF48B82532
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 16:22:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF48B82532
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u4RObBWYR0r5 for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 16:22:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE07D82446
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 16:21:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE07D82446
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D592184758; Sun,  7 Jan 2024 16:21:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Jan 2024 10:22:54 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 3873fd438d8bf21d8b686560b3651eb92f3e8607
X-Git-Newrev: 3a23349e8cc2f27018367617bedac3daecb27a99
X-Patchwork-Hint: ignore
Message-Id: <20240107162159.D592184758@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x]
 package/giflib/0002-Fix-CVE-2022-28506.patch: New security patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=3a23349e8cc2f27018367617bedac3daecb27a99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[yann.morin.1998@free.fr: add GIFLIB_IGNORE_CVES]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4a93a8319637ebb8be33c126da28242201d6fa70)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/giflib/0002-Fix-CVE-2022-28506.patch | 34 ++++++++++++++++++++++++++++
 package/giflib/giflib.mk                     |  3 +++
 2 files changed, 37 insertions(+)

diff --git a/package/giflib/0002-Fix-CVE-2022-28506.patch b/package/giflib/0002-Fix-CVE-2022-28506.patch
new file mode 100644
index 0000000000..35d5f60a95
--- /dev/null
+++ b/package/giflib/0002-Fix-CVE-2022-28506.patch
@@ -0,0 +1,34 @@
+From c0cca041fc4fb6748d8dff3675fe7a839253d668 Mon Sep 17 00:00:00 2001
+From: Sandro Mani <manisandro@gmail.com>
+Date: Tue, 5 Dec 2023 16:24:32 -0700
+Subject: [PATCH] Fix CVE-2022-28506
+
+From: giflib-5.2.1-17.fc39.src.rpm
+Fixes https://nvd.nist.gov/vuln/detail/CVE-2022-28506
+Upstream: https://sourceforge.net/p/giflib/bugs/159/
+
+Signed-off-by: Sandro Mani <manisandro@gmail.com>
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ gif2rgb.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/gif2rgb.c b/gif2rgb.c
+index 8d7c0ff..d9a469f 100644
+--- a/gif2rgb.c
++++ b/gif2rgb.c
+@@ -294,6 +294,11 @@ static void DumpScreen2RGB(char *FileName, int OneFileFlag,
+             GifRow = ScreenBuffer[i];
+             GifQprintf("\b\b\b\b%-4d", ScreenHeight - i);
+             for (j = 0, BufferP = Buffer; j < ScreenWidth; j++) {
++                /* Check if color is within color palete */
++                if (GifRow[j] >= ColorMap->ColorCount)
++                {
++                   GIF_EXIT(GifErrorString(D_GIF_ERR_IMAGE_DEFECT));
++                }
+                 ColorMapEntry = &ColorMap->Colors[GifRow[j]];
+                 *BufferP++ = ColorMapEntry->Red;
+                 *BufferP++ = ColorMapEntry->Green;
+-- 
+2.43.0
+
diff --git a/package/giflib/giflib.mk b/package/giflib/giflib.mk
index d47edfaa8b..1207eafa16 100644
--- a/package/giflib/giflib.mk
+++ b/package/giflib/giflib.mk
@@ -11,6 +11,9 @@ GIFLIB_LICENSE = MIT
 GIFLIB_LICENSE_FILES = COPYING
 GIFLIB_CPE_ID_VENDOR = giflib_project
 
+# 0002-Fix-CVE-2022-28506.patch
+GIFLIB_IGNORE_CVES = CVE-2022-28506
+
 ifeq ($(BR2_STATIC_LIBS),y)
 GIFLIB_BUILD_LIBS = static-lib
 GIFLIB_INSTALL_LIBS = install-static-lib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
