Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78951C07545
	for <buildroot@archiver.kernel.org>; Wed, 25 Oct 2023 19:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 245CE81BA9;
	Wed, 25 Oct 2023 19:20:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 245CE81BA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Rk4FByVIYIM; Wed, 25 Oct 2023 19:20:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F75380E7B;
	Wed, 25 Oct 2023 19:20:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F75380E7B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EFE951BF97D
 for <buildroot@lists.busybox.net>; Wed, 25 Oct 2023 19:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C988660B6F
 for <buildroot@lists.busybox.net>; Wed, 25 Oct 2023 19:19:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C988660B6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 17RXkmKSCfow for <buildroot@lists.busybox.net>;
 Wed, 25 Oct 2023 19:19:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 079BE60B6E
 for <buildroot@buildroot.org>; Wed, 25 Oct 2023 19:19:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 079BE60B6E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D021C85E19; Wed, 25 Oct 2023 19:19:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 25 Oct 2023 21:16:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 17ffb91551cc7c76427fd9675bc5e5a01d683afe
X-Git-Newrev: de7bc4ada2ab5ef2e4094934acd5271c0aca19a1
X-Patchwork-Hint: ignore
Message-Id: <20231025191932.D021C85E19@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/minizip-zlib: fix CVE-2023-45853
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

commit: https://git.buildroot.net/buildroot/commit/?id=de7bc4ada2ab5ef2e4094934acd5271c0aca19a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

MiniZip in zlib through 1.3 has an integer overflow and resultant
heap-based buffer overflow in zipOpenNewFileInZip4_64 via a long
filename, comment, or extra field. NOTE: MiniZip is not a supported part
of the zlib product.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...overflows-of-zip-header-fields-in-minizip.patch | 39 ++++++++++++++++++++++
 package/minizip-zlib/minizip-zlib.mk               |  2 ++
 2 files changed, 41 insertions(+)

diff --git a/package/minizip-zlib/0001-Reject-overflows-of-zip-header-fields-in-minizip.patch b/package/minizip-zlib/0001-Reject-overflows-of-zip-header-fields-in-minizip.patch
new file mode 100644
index 0000000000..f4eacc7fdc
--- /dev/null
+++ b/package/minizip-zlib/0001-Reject-overflows-of-zip-header-fields-in-minizip.patch
@@ -0,0 +1,39 @@
+From 73331a6a0481067628f065ffe87bb1d8f787d10c Mon Sep 17 00:00:00 2001
+From: Hans Wennborg <hans@chromium.org>
+Date: Fri, 18 Aug 2023 11:05:33 +0200
+Subject: [PATCH] Reject overflows of zip header fields in minizip.
+
+This checks the lengths of the file name, extra field, and comment
+that would be put in the zip headers, and rejects them if they are
+too long. They are each limited to 65535 bytes in length by the zip
+format. This also avoids possible buffer overflows if the provided
+fields are too long.
+
+Upstream: https://github.com/madler/zlib/commit/73331a6a0481067628f065ffe87bb1d8f787d10c
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ contrib/minizip/zip.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/contrib/minizip/zip.c b/contrib/minizip/zip.c
+index 3d3d4cadd..0446109b2 100644
+--- a/contrib/minizip/zip.c
++++ b/contrib/minizip/zip.c
+@@ -1043,6 +1043,17 @@ extern int ZEXPORT zipOpenNewFileInZip4_64(zipFile file, const char* filename, c
+       return ZIP_PARAMERROR;
+ #endif
+ 
++    // The filename and comment length must fit in 16 bits.
++    if ((filename!=NULL) && (strlen(filename)>0xffff))
++        return ZIP_PARAMERROR;
++    if ((comment!=NULL) && (strlen(comment)>0xffff))
++        return ZIP_PARAMERROR;
++    // The extra field length must fit in 16 bits. If the member also requires
++    // a Zip64 extra block, that will also need to fit within that 16-bit
++    // length, but that will be checked for later.
++    if ((size_extrafield_local>0xffff) || (size_extrafield_global>0xffff))
++        return ZIP_PARAMERROR;
++
+     zi = (zip64_internal*)file;
+ 
+     if (zi->in_opened_file_inzip == 1)
diff --git a/package/minizip-zlib/minizip-zlib.mk b/package/minizip-zlib/minizip-zlib.mk
index 259570f75c..81fee3c687 100644
--- a/package/minizip-zlib/minizip-zlib.mk
+++ b/package/minizip-zlib/minizip-zlib.mk
@@ -16,5 +16,7 @@ MINIZIP_ZLIB_AUTORECONF = YES
 MINIZIP_ZLIB_DEPENDENCIES = zlib
 # demos must be disabled to avoid a conflict with BR2_PACKAGE_MINIZIP_DEMOS
 MINIZIP_ZLIB_CONF_OPTS = --disable-demos
+# 0001-Reject-overflows-of-zip-header-fields-in-minizip.patch
+MINIZIP_ZLIB_IGNORE_CVES += CVE-2023-45853
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
