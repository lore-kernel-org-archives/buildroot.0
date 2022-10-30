Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD85C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 10:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F80B40374;
	Sun, 30 Oct 2022 10:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F80B40374
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wp-yx2ZQZJAX; Sun, 30 Oct 2022 10:51:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6C2F4036F;
	Sun, 30 Oct 2022 10:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6C2F4036F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D387E1BF2B7
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 10:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF615606EC
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 10:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF615606EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WE4SNP6QYf75 for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 10:51:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E15BB600CB
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 10:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E15BB600CB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CFF6B8745B; Sun, 30 Oct 2022 10:51:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 11:51:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 952fa08764acc8d78985d2cc91d37112324b67cb
X-Git-Newrev: c999e540dd233f8cb52eee4c35373cd6603aea97
X-Patchwork-Hint: ignore
Message-Id: <20221030105150.CFF6B8745B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/f2fs-tools: fix build with lz4
 1.9.4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c999e540dd233f8cb52eee4c35373cd6603aea97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of lz4 to version
1.9.4 in commit 1f54af8c4f814bfc0993756b82575ad581ce5318:

compress.c: In function 'lz4_compress_init':
compress.c:36:42: error: 'LZ4_STREAMSIZE_U64' undeclared (first use in this function); did you mean 'LZ4_STREAMSIZE'?
   36 | #define LZ4_STREAMSIZE                  (LZ4_STREAMSIZE_U64 * sizeof(long long))
      |                                          ^~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/ca8b6646322a4cb911fad5fb9cb38046743609bf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...2-f2fs-tools-fix-build-error-on-lz4-1-9-4.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/f2fs-tools/0002-f2fs-tools-fix-build-error-on-lz4-1-9-4.patch b/package/f2fs-tools/0002-f2fs-tools-fix-build-error-on-lz4-1-9-4.patch
new file mode 100644
index 0000000000..b43def6bb7
--- /dev/null
+++ b/package/f2fs-tools/0002-f2fs-tools-fix-build-error-on-lz4-1-9-4.patch
@@ -0,0 +1,34 @@
+From 19f77c6f6277a274434d6d8883f50e7955c6a8db Mon Sep 17 00:00:00 2001
+From: Jaegeuk Kim <jaegeuk@kernel.org>
+Date: Mon, 29 Aug 2022 11:03:35 -0700
+Subject: f2fs-tools: fix build error on lz4-1.9.4
+
+LZ4_STREAMSIZE_U64 is undefined in new lz4 lib.
+
+Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
+[Retrieved from:
+https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/commit/?id=19f77c6f6277a274434d6d8883f50e7955c6a8db]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ fsck/compress.c | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/fsck/compress.c b/fsck/compress.c
+index b413492..b15f0a4 100644
+--- a/fsck/compress.c
++++ b/fsck/compress.c
+@@ -32,10 +32,7 @@
+ #ifdef HAVE_LIBLZ4
+ #define LZ4_MEMORY_USAGE		14
+ #define LZ4_MAX_INPUT_SIZE		0x7E000000 /* 2 113 929 216 bytes */
+-#ifndef LZ4_STREAMSIZE
+-#define LZ4_STREAMSIZE			(LZ4_STREAMSIZE_U64 * sizeof(long long))
+-#endif
+-#define LZ4_MEM_COMPRESS		LZ4_STREAMSIZE
++#define LZ4_MEM_COMPRESS		sizeof(LZ4_stream_t)
+ #define LZ4_ACCELERATION_DEFAULT	1
+ #define LZ4_WORK_SIZE			ALIGN_UP(LZ4_MEM_COMPRESS, 8)
+ #endif
+-- 
+cgit 
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
