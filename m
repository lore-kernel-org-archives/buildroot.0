Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C164C6FD1C
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 13:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4A79610E9;
	Tue, 14 Mar 2023 13:47:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4A79610E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f5ElO4WRy6J4; Tue, 14 Mar 2023 13:47:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EDE8610E3;
	Tue, 14 Mar 2023 13:47:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EDE8610E3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 69B801BF95E
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 13:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4428260AB1
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 13:47:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4428260AB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6PMUmeLy-7pT for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 13:47:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F95660A68
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 13:47:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F95660A68
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 50160872C4; Tue, 14 Mar 2023 13:47:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Mar 2023 12:14:10 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: b91fd4ed1ea9916465a48bdcc4072423446abba0
X-Git-Newrev: 2ae95aff0fa3f0fa2dce2abb5efb45ee21ffea01
X-Patchwork-Hint: ignore
Message-Id: <20230314134718.50160872C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/tiff: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ae95aff0fa3f0fa2dce2abb5efb45ee21ffea01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

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
index 7aa042c43a..d013cfa880 100644
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
