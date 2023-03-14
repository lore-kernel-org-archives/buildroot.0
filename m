Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1456C6FD1D
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 13:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D9CF610D8;
	Tue, 14 Mar 2023 13:47:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D9CF610D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4od1dbA0FQ8c; Tue, 14 Mar 2023 13:47:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58B88610C4;
	Tue, 14 Mar 2023 13:47:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58B88610C4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 44C161BF95E
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 13:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B08640351
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 13:47:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B08640351
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 08_rnqpJ0w8b for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 13:47:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 154534032E
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 13:47:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 154534032E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F1C61872C4; Tue, 14 Mar 2023 13:47:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Mar 2023 12:14:30 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 4521f37f3965917d54120a9cdf2de136e22cc3d8
X-Git-Newrev: 8efb071095b373fe50e6dcf46872641091e2f2fb
X-Patchwork-Hint: ignore
Message-Id: <20230314134716.F1C61872C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/tiff: fix
 CVE-2022-48281
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

commit: https://git.buildroot.net/buildroot/commit/?id=8efb071095b373fe50e6dcf46872641091e2f2fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

processCropSelections in tools/tiffcrop.c in LibTIFF through 4.5.0 has a
heap-based buffer overflow (e.g., "WRITE of size 307203") via a crafted
TIFF image.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d7ae47f0c68607a90e6a65cbfff5bfb3007b019d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...p-Correct-simple-copy-paste-error-Fix-488.patch | 28 ++++++++++++++++++++++
 package/tiff/tiff.mk                               |  3 +++
 2 files changed, 31 insertions(+)

diff --git a/package/tiff/0001-tiffcrop-Correct-simple-copy-paste-error-Fix-488.patch b/package/tiff/0001-tiffcrop-Correct-simple-copy-paste-error-Fix-488.patch
new file mode 100644
index 0000000000..73c0d10ffc
--- /dev/null
+++ b/package/tiff/0001-tiffcrop-Correct-simple-copy-paste-error-Fix-488.patch
@@ -0,0 +1,28 @@
+From 97d65859bc29ee334012e9c73022d8a8e55ed586 Mon Sep 17 00:00:00 2001
+From: Su Laus <sulau@freenet.de>
+Date: Sat, 21 Jan 2023 15:58:10 +0000
+Subject: [PATCH] tiffcrop: Correct simple copy paste error. Fix #488.
+
+[Retrieved from:
+https://gitlab.com/libtiff/libtiff/-/commit/97d65859bc29ee334012e9c73022d8a8e55ed586]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ tools/tiffcrop.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index 14fa18da..7db69883 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -8591,7 +8591,7 @@ static int processCropSelections(struct image_data *image,
+                     cropsize + NUM_BUFF_OVERSIZE_BYTES);
+             else
+             {
+-                prev_cropsize = seg_buffs[0].size;
++                prev_cropsize = seg_buffs[i].size;
+                 if (prev_cropsize < cropsize)
+                 {
+                     next_buff = _TIFFrealloc(
+-- 
+GitLab
+
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index ac34e300a9..9df4e1ce57 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -12,6 +12,9 @@ TIFF_CPE_ID_VENDOR = libtiff
 TIFF_CPE_ID_PRODUCT = libtiff
 TIFF_INSTALL_STAGING = YES
 
+# 0001-tiffcrop-Correct-simple-copy-paste-error-Fix-488.patch
+TIFF_IGNORE_CVES += CVE-2022-48281
+
 # webp has a (optional) dependency on tiff, so we can't have webp
 # support in tiff, or that would create a circular dependency.
 TIFF_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
