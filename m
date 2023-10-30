Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21DE0C4332F
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 12:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB61185592;
	Mon, 30 Oct 2023 12:42:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB61185592
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KxddVe9GAvgO; Mon, 30 Oct 2023 12:42:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E692385593;
	Mon, 30 Oct 2023 12:42:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E692385593
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 054961BF5A5
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 12:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE8284311A
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 12:41:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE8284311A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qDBcB99BNzgi for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 12:41:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DFBA430C4
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 12:41:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DFBA430C4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0BC2E86187; Mon, 30 Oct 2023 12:41:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 30 Oct 2023 13:15:20 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 1f684243a8991c7f458e66ad9eac3b9afac54ead
X-Git-Newrev: e4ee3423836b8e977005d022ea5b664e4669dfed
X-Patchwork-Hint: ignore
Message-Id: <20231030124156.0BC2E86187@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/minizip-zlib: fix
 CVE-2023-45853
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

commit: https://git.buildroot.net/buildroot/commit/?id=e4ee3423836b8e977005d022ea5b664e4669dfed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

MiniZip in zlib through 1.3 has an integer overflow and resultant
heap-based buffer overflow in zipOpenNewFileInZip4_64 via a long
filename, comment, or extra field. NOTE: MiniZip is not a supported part
of the zlib product.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit de7bc4ada2ab5ef2e4094934acd5271c0aca19a1)
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
