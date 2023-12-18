Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D09C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 16:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 179BB405E6;
	Mon, 18 Dec 2023 16:45:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 179BB405E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f5so-M7_1RFf; Mon, 18 Dec 2023 16:45:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DF2A40637;
	Mon, 18 Dec 2023 16:45:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DF2A40637
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 45FC31BF2B3
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 16:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 811CA60EFD
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 16:44:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 811CA60EFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CTbDj-Hv_Hjf for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 16:44:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A88360746
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 16:44:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A88360746
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 62DBA87BD1; Mon, 18 Dec 2023 16:44:51 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 17:42:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e779df7dc9f49ab5643266ab6b53db0ab19bb051
X-Git-Newrev: 4a93a8319637ebb8be33c126da28242201d6fa70
X-Patchwork-Hint: ignore
Message-Id: <20231218164451.62DBA87BD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
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

commit: https://git.buildroot.net/buildroot/commit/?id=4a93a8319637ebb8be33c126da28242201d6fa70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[yann.morin.1998@free.fr: add GIFLIB_IGNORE_CVES]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
