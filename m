Return-Path: <SRS0=vgbW=OF=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB97C433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 09:53:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07C41610A4
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 09:53:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 07C41610A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFF5F400EE;
	Wed, 15 Sep 2021 09:53:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Czlcdqfdvi6; Wed, 15 Sep 2021 09:52:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6562400F0;
	Wed, 15 Sep 2021 09:52:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 17A411BF3F6
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 09:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06EAE60731
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 09:52:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JirD-gvaQiNR for <buildroot@lists.busybox.net>;
 Wed, 15 Sep 2021 09:52:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F0346063D
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 09:52:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4B4FF8B3D7; Wed, 15 Sep 2021 09:50:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 Sep 2021 11:51:48 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 6434e5910f7c83ebca9c15bd577efc688a03cfb1
X-Git-Newrev: f4f344e66025c5f99685c37697fc8995a94fa7b8
X-Patchwork-Hint: ignore
Message-Id: <20210915095044.4B4FF8B3D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/libexif: fix
 build with gcc 4.8
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f4f344e66025c5f99685c37697fc8995a94fa7b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Fix the following build failure with gcc 4.8 raised since bump to
version 0.6.23 in commit e2f805097611b4828d2cba6168472aac6dedeafe:

exif-gps-ifd.c: In function 'exif_get_gps_tag_info':
exif-gps-ifd.c:62:3: error: 'for' loop initial declarations are only allowed in C99 mode
   for (int i = 0; i < sizeof(exif_gps_ifd_tags) / sizeof(ExifGPSIfdTagInfo); ++i) {
   ^
exif-gps-ifd.c:62:3: note: use option -std=c99 or -std=gnu99 to compile your code

Fixes:
 - http://autobuild.buildroot.org/results/7dd222e06d1e6611449fb8fe7516817c9ad43d65

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 039de9a291a9d77bc6d07ef2a3e1a51899a2d7db)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...xif-exif-gps-ifd.c-fix-build-with-gcc-4.8.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/libexif/0001-libexif-exif-gps-ifd.c-fix-build-with-gcc-4.8.patch b/package/libexif/0001-libexif-exif-gps-ifd.c-fix-build-with-gcc-4.8.patch
new file mode 100644
index 0000000000..7bbf3b3e4d
--- /dev/null
+++ b/package/libexif/0001-libexif-exif-gps-ifd.c-fix-build-with-gcc-4.8.patch
@@ -0,0 +1,40 @@
+From 0c925491dea995ca96770159158bb8d57a48d84b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 15 Sep 2021 07:56:32 +0200
+Subject: [PATCH] libexif/exif-gps-ifd.c: fix build with gcc 4.8
+
+Fix the following build failure with gcc 4.8 raised since version 0.6.23 and
+https://github.com/libexif/libexif/commit/e12c3529813cd16d50bf0a1c759093e1039dffec:
+
+exif-gps-ifd.c: In function 'exif_get_gps_tag_info':
+exif-gps-ifd.c:62:3: error: 'for' loop initial declarations are only allowed in C99 mode
+   for (int i = 0; i < sizeof(exif_gps_ifd_tags) / sizeof(ExifGPSIfdTagInfo); ++i) {
+   ^
+exif-gps-ifd.c:62:3: note: use option -std=c99 or -std=gnu99 to compile your code
+
+Fixes:
+ - http://autobuild.buildroot.org/results/7dd222e06d1e6611449fb8fe7516817c9ad43d65
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/libexif/libexif/pull/72]
+---
+ libexif/exif-gps-ifd.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libexif/exif-gps-ifd.c b/libexif/exif-gps-ifd.c
+index 9c9ba70..de5f950 100644
+--- a/libexif/exif-gps-ifd.c
++++ b/libexif/exif-gps-ifd.c
+@@ -59,7 +59,8 @@ const static struct ExifGPSIfdTagInfo exif_gps_ifd_tags[] = {
+ };
+ 
+ const ExifGPSIfdTagInfo *exif_get_gps_tag_info(ExifTag tag) {
+-  for (int i = 0; i < sizeof(exif_gps_ifd_tags) / sizeof(ExifGPSIfdTagInfo); ++i) {
++  int i;
++  for (i = 0; i < sizeof(exif_gps_ifd_tags) / sizeof(ExifGPSIfdTagInfo); ++i) {
+     if (tag==exif_gps_ifd_tags[i].tag)
+       return &exif_gps_ifd_tags[i];
+   }
+-- 
+2.33.0
+
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
