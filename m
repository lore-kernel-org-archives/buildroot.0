Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD137CA0EE4
	for <buildroot@archiver.kernel.org>; Wed, 20 Aug 2025 14:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89C2A837D2;
	Wed, 20 Aug 2025 14:46:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BSpWn_xu6gv1; Wed, 20 Aug 2025 14:46:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CFF88386E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CFF88386E;
	Wed, 20 Aug 2025 14:46:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BB21CDE6
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 14:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7B7740B7A
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 14:46:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VMYkmxCc1UBA for <buildroot@buildroot.org>;
 Wed, 20 Aug 2025 14:46:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 039AB40B62
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 039AB40B62
 for <buildroot@buildroot.org>; Wed, 20 Aug 2025 14:46:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E221987715; Wed, 20 Aug 2025 14:46:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 20 Aug 2025 16:44:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe94b611fde271d40c299365a4966a3dbf71cdcc
X-Git-Newrev: c46fb3c8b3d13875fd22846dd3cf0ca20f480559
X-Patchwork-Hint: ignore
Message-Id: <20250820144616.E221987715@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openjpeg: add patch to fix
 CVE-2025-54874
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c46fb3c8b3d13875fd22846dd3cf0ca20f480559
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following vulnerability:

- CVE-2025-54874

    OpenJPEG is an open-source JPEG 2000 codec. In OpenJPEG 2.5.3 and
    earlier, a call to opj_jp2_read_header may lead to OOB heap memory
    write when the data stream p_stream is too short and p_image is not
    initialized.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-54874
  - https://github.com/uclouvain/openjpeg/commit/f809b80c67717c152a5ad30bf06774f00da4fd2d

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0001-check-for-error-after-parsing-header.patch | 41 ++++++++++++++++++++++
 package/openjpeg/openjpeg.mk                       |  3 ++
 2 files changed, 44 insertions(+)

diff --git a/package/openjpeg/0001-check-for-error-after-parsing-header.patch b/package/openjpeg/0001-check-for-error-after-parsing-header.patch
new file mode 100644
index 0000000000..9a02fbf3d4
--- /dev/null
+++ b/package/openjpeg/0001-check-for-error-after-parsing-header.patch
@@ -0,0 +1,41 @@
+From f809b80c67717c152a5ad30bf06774f00da4fd2d Mon Sep 17 00:00:00 2001
+From: Sebastian Rasmussen <sebras@gmail.com>
+Date: Thu, 16 Jan 2025 02:13:43 +0100
+Subject: [PATCH] opj_jp2_read_header: Check for error after parsing header.
+
+Consider the case where the caller has not set the p_image
+pointer to NULL before calling opj_read_header().
+
+If opj_j2k_read_header_procedure() fails while obtaining the rest
+of the marker segment when calling opj_stream_read_data() because
+the data stream is too short, then opj_j2k_read_header() will
+never have the chance to initialize p_image, leaving it
+uninitialized.
+
+opj_jp2_read_header() will check the p_image value whether
+opj_j2k_read_header() suceeded or failed. This may be detected as
+an error in valgrind or ASAN.
+
+The fix is to check whether opj_j2k_read_header() suceeded before
+using the output argument p_image.
+
+Upstream: https://github.com/uclouvain/openjpeg/commit/f809b80c67717c152a5ad30bf06774f00da4fd2d
+CVE: CVE-2025-54874
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/lib/openjp2/jp2.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/lib/openjp2/jp2.c b/src/lib/openjp2/jp2.c
+index 4df055a54..da5063186 100644
+--- a/src/lib/openjp2/jp2.c
++++ b/src/lib/openjp2/jp2.c
+@@ -2873,7 +2873,7 @@ OPJ_BOOL opj_jp2_read_header(opj_stream_private_t *p_stream,
+                               p_image,
+                               p_manager);
+ 
+-    if (p_image && *p_image) {
++    if (ret && p_image && *p_image) {
+         /* Set Image Color Space */
+         if (jp2->enumcs == 16) {
+             (*p_image)->color_space = OPJ_CLRSPC_SRGB;
diff --git a/package/openjpeg/openjpeg.mk b/package/openjpeg/openjpeg.mk
index 275659cd3c..7b1352c222 100644
--- a/package/openjpeg/openjpeg.mk
+++ b/package/openjpeg/openjpeg.mk
@@ -11,6 +11,9 @@ OPENJPEG_LICENSE_FILES = LICENSE
 OPENJPEG_CPE_ID_VENDOR = uclouvain
 OPENJPEG_INSTALL_STAGING = YES
 
+# 0001-check-for-error-after-parsing-header.patch
+OPENJPEG_IGNORE_CVES += CVE-2025-54874
+
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBPNG),libpng)
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_TIFF),tiff)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
