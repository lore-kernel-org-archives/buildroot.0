Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2682EC433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 21:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D924141791;
	Wed, 16 Feb 2022 21:06:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vneQVboWC00e; Wed, 16 Feb 2022 21:06:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1901B4178E;
	Wed, 16 Feb 2022 21:06:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 63E021BF9BA
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51F4183E3E
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:02:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oP4m0sMCEtdW for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 21:02:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91F2A82C33
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 21:02:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D2118836BA; Wed, 16 Feb 2022 20:54:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 22:02:11 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 33169da5d5b81da72a4eccd23fa6b1a2b5955895
X-Git-Newrev: faa5ad2c438c63245f4e01830388b27e99c3bc0e
X-Patchwork-Hint: ignore
Message-Id: <20220216205448.D2118836BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/tiff: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=faa5ad2c438c63245f4e01830388b27e99c3bc0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
