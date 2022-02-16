Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53296C433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 21:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A77060B12;
	Wed, 16 Feb 2022 21:06:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RX0gRmMetmSv; Wed, 16 Feb 2022 21:06:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4710161C37;
	Wed, 16 Feb 2022 21:06:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ACB351BF425
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8AA44177F
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:02:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fj2wDLK-ZRjp for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 21:02:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C02BF416DA
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 21:02:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0CD22836CA; Wed, 16 Feb 2022 20:55:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 22:01:24 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 257b355bba4750c84e8b4ccf4e590f1b18f0bbfb
X-Git-Newrev: 1e25ae6943e9d62819f690bee46ccba24081f8b8
X-Patchwork-Hint: ignore
Message-Id: <20220216205502.0CD22836CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/tiff: fix
 CVE-2022-22844
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

commit: https://git.buildroot.net/buildroot/commit/?id=1e25ae6943e9d62819f690bee46ccba24081f8b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

LibTIFF 4.3.0 has an out-of-bounds read in _TIFFmemcpy in tif_unix.c in
certain situations involving a custom tag and 0x0200 as the second word
of the DE field.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7ec5f99b3a00a1ec4dd6677a0ee6418267ffba25)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...fix-global-buffer-overflow-for-ASCII-tags.patch | 43 ++++++++++++++++++++++
 package/tiff/tiff.mk                               |  4 ++
 2 files changed, 47 insertions(+)

diff --git a/package/tiff/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags.patch b/package/tiff/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags.patch
new file mode 100644
index 0000000000..ba1487782e
--- /dev/null
+++ b/package/tiff/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags.patch
@@ -0,0 +1,43 @@
+From 03047a26952a82daaa0792957ce211e0aa51bc64 Mon Sep 17 00:00:00 2001
+From: 4ugustus <wangdw.augustus@qq.com>
+Date: Tue, 25 Jan 2022 16:25:28 +0000
+Subject: [PATCH] tiffset: fix global-buffer-overflow for ASCII tags where
+ count is required (fixes #355)
+
+[Retrieved from:
+https://gitlab.com/libtiff/libtiff/-/commit/03047a26952a82daaa0792957ce211e0aa51bc64]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ tools/tiffset.c | 16 +++++++++++++---
+ 1 file changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/tools/tiffset.c b/tools/tiffset.c
+index 8c9e23c5..e7a88c09 100644
+--- a/tools/tiffset.c
++++ b/tools/tiffset.c
+@@ -146,9 +146,19 @@ main(int argc, char* argv[])
+ 
+             arg_index++;
+             if (TIFFFieldDataType(fip) == TIFF_ASCII) {
+-                if (TIFFSetField(tiff, TIFFFieldTag(fip), argv[arg_index]) != 1)
+-                    fprintf( stderr, "Failed to set %s=%s\n",
+-                             TIFFFieldName(fip), argv[arg_index] );
++                if(TIFFFieldPassCount( fip )) {
++                    size_t len;
++                    len = strlen(argv[arg_index]) + 1;
++                    if (len > UINT16_MAX || TIFFSetField(tiff, TIFFFieldTag(fip),
++                            (uint16_t)len, argv[arg_index]) != 1)
++                        fprintf( stderr, "Failed to set %s=%s\n",
++                            TIFFFieldName(fip), argv[arg_index] );
++                } else {
++                    if (TIFFSetField(tiff, TIFFFieldTag(fip),
++                            argv[arg_index]) != 1)
++                        fprintf( stderr, "Failed to set %s=%s\n",
++                            TIFFFieldName(fip), argv[arg_index] );
++                }
+             } else if (TIFFFieldWriteCount(fip) > 0
+ 		       || TIFFFieldWriteCount(fip) == TIFF_VARIABLE) {
+                 int     ret = 1;
+-- 
+GitLab
+
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index f6c6de12c5..f80ab7ac55 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -11,6 +11,10 @@ TIFF_LICENSE_FILES = COPYRIGHT
 TIFF_CPE_ID_VENDOR = libtiff
 TIFF_CPE_ID_PRODUCT = libtiff
 TIFF_INSTALL_STAGING = YES
+
+# 0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags.patch
+TIFF_IGNORE_CVES += CVE-2022-22844
+
 TIFF_CONF_OPTS = \
 	--disable-cxx \
 	--without-x
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
