Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518D0EB64DA
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 06:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 087A281BA8;
	Sun, 16 Jul 2023 06:22:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 087A281BA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i-RMrkfVE6ce; Sun, 16 Jul 2023 06:22:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E407481DF9;
	Sun, 16 Jul 2023 06:22:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E407481DF9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A7291BF322
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 06:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C302A60B27
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 06:21:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C302A60B27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AUcg-dGqYQdl for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 06:21:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FECB60AFD
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 06:21:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FECB60AFD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E88787031; Sun, 16 Jul 2023 06:21:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 08:19:37 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 9153c6283bc84cb3f64688469a0e5b718516cdeb
X-Git-Newrev: bf495325c1e3d2ab0184ebafeceac07b4797be39
X-Patchwork-Hint: ignore
Message-Id: <20230716062109.1E88787031@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/tiff: security
 bump to version 4.5.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf495325c1e3d2ab0184ebafeceac07b4797be39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Fixes the following security issues:

- CVE-2023-1916: A flaw was found in tiffcrop, a program distributed by the
  libtiff package.  A specially crafted tiff file can lead to an
  out-of-bounds read in the extractImageSection function in
  tools/tiffcrop.c, resulting in a denial of service and limited information
  disclosure.  This issue affects libtiff versions 4.x.

- CVE-2023-25434: libtiff 4.5.0 is vulnerable to Buffer Overflow via
  extractContigSamplesBytes() at /libtiff/tools/tiffcrop.c:3215.

- CVE-2023-26965: loadImage() in tools/tiffcrop.c in LibTIFF through 4.5.0
  has a heap-based use after free via a crafted TIFF image

Drop the now upstream
0001-tiffcrop-Correct-simple-copy-paste-error-Fix-488.patch.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit cb496970c0c7117f9f00d8495e234871f2bae4c1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  1 -
 ...p-Correct-simple-copy-paste-error-Fix-488.patch | 28 ----------------------
 package/tiff/tiff.hash                             |  2 +-
 package/tiff/tiff.mk                               |  5 +---
 4 files changed, 2 insertions(+), 34 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 2d838e7ff3..48c5b27d59 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1515,7 +1515,6 @@ package/ti-gfx/esrev.sh Shellcheck
 package/ti-sgx-um/0001-Makefile-do-not-install-init-script.patch Upstream
 package/ti-sgx-um/S80ti-sgx Variables
 package/ti-utils/0001-plt.h-fix-build-with-gcc-10.patch Upstream
-package/tiff/0001-tiffcrop-Correct-simple-copy-paste-error-Fix-488.patch Upstream
 package/tinyalsa/0001-include-time.h-before-asound.h.patch Upstream
 package/tinycbor/0001-Makefile-add-DISABLE_WERROR.patch Upstream
 package/tinycompress/0001-wave-add-time.h-missing-header-inclusion.patch Upstream
diff --git a/package/tiff/0001-tiffcrop-Correct-simple-copy-paste-error-Fix-488.patch b/package/tiff/0001-tiffcrop-Correct-simple-copy-paste-error-Fix-488.patch
deleted file mode 100644
index 73c0d10ffc..0000000000
--- a/package/tiff/0001-tiffcrop-Correct-simple-copy-paste-error-Fix-488.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 97d65859bc29ee334012e9c73022d8a8e55ed586 Mon Sep 17 00:00:00 2001
-From: Su Laus <sulau@freenet.de>
-Date: Sat, 21 Jan 2023 15:58:10 +0000
-Subject: [PATCH] tiffcrop: Correct simple copy paste error. Fix #488.
-
-[Retrieved from:
-https://gitlab.com/libtiff/libtiff/-/commit/97d65859bc29ee334012e9c73022d8a8e55ed586]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- tools/tiffcrop.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
-index 14fa18da..7db69883 100644
---- a/tools/tiffcrop.c
-+++ b/tools/tiffcrop.c
-@@ -8591,7 +8591,7 @@ static int processCropSelections(struct image_data *image,
-                     cropsize + NUM_BUFF_OVERSIZE_BYTES);
-             else
-             {
--                prev_cropsize = seg_buffs[0].size;
-+                prev_cropsize = seg_buffs[i].size;
-                 if (prev_cropsize < cropsize)
-                 {
-                     next_buff = _TIFFrealloc(
--- 
-GitLab
-
diff --git a/package/tiff/tiff.hash b/package/tiff/tiff.hash
index 73732892a5..0fa503a02a 100644
--- a/package/tiff/tiff.hash
+++ b/package/tiff/tiff.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c7a1d9296649233979fa3eacffef3fa024d73d05d589cb622727b5b08c423464  tiff-4.5.0.tar.gz
+sha256  d7f38b6788e4a8f5da7940c5ac9424f494d8a79eba53d555f4a507167dca5e2b  tiff-4.5.1.tar.gz
 sha256  0780558a8bfba0af1160ec1ff11ade4f41c0d7deafd6ecfc796b492a788e380d  LICENSE.md
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index f9754a4b49..0006f461a0 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIFF_VERSION = 4.5.0
+TIFF_VERSION = 4.5.1
 TIFF_SITE = http://download.osgeo.org/libtiff
 TIFF_LICENSE = tiff license
 TIFF_LICENSE_FILES = LICENSE.md
@@ -12,9 +12,6 @@ TIFF_CPE_ID_VENDOR = libtiff
 TIFF_CPE_ID_PRODUCT = libtiff
 TIFF_INSTALL_STAGING = YES
 
-# 0001-tiffcrop-Correct-simple-copy-paste-error-Fix-488.patch
-TIFF_IGNORE_CVES += CVE-2022-48281
-
 # webp has a (optional) dependency on tiff, so we can't have webp
 # support in tiff, or that would create a circular dependency.
 TIFF_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
