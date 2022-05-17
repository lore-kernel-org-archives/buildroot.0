Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D433BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 14:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7982383DF9;
	Tue, 17 May 2022 14:20:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rlnySwGBSr5r; Tue, 17 May 2022 14:20:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9280384018;
	Tue, 17 May 2022 14:19:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B5FB91BF40A
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 14:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E6E484018
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 14:19:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jknbPcswS8us for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 14:19:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.cosmos-ink.net (mail.cosmos-ink.net
 [IPv6:2a01:4f9:4a:25aa::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E020283DF9
 for <buildroot@buildroot.org>; Tue, 17 May 2022 14:19:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 343541C6B2B2; Tue, 17 May 2022 16:19:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cosmos-ink.net;
 s=dkim; t=1652797194; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=tOoP8Q4cUSX9dFHXmsZmfOxaEV92gnkK71vXk/0cqQ8=;
 b=XOSdpqQw+B5A7yhpD9piqnCtBGR1uAvWXWtY7ILAaUkxGJhoJ2o+qvZNrXB1DPFj+/aReR
 B5xiVVfk5Ml0yfIlf/Jd31x4qM//0bJA35uFQUepGT3d4Q4rGCf/aUfB49qRLVcUhA0PNC
 nMj6bMizAp3WDUDnzQVLub+rpQG4VPE0dA+BtosFzkUB2dGubQT52wGn/1KRIA3WCahtG0
 gu92j8rD9CpzfWmt06tb+sxpc056q4CRetu3/InhkhextEMBoMwBY9gsqF5y6y8raIfr78
 nXlnol5fB7zxbwPO9MoJ2XcNt6qir9ED3l+VmkuPMcchd0XIhKZ3QJAuOB1/sw==
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 14:19:38 +0000
Message-Id: <20220517141938.3395-1-linus@cosmos-ink.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 1/1] fs/squashfs: needs more test cases
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
From: Linus Kaschulla via buildroot <buildroot@buildroot.org>
Reply-To: Linus Kaschulla <linus@cosmos-ink.net>
Cc: Linus Kaschulla <linus@cosmos-ink.net>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For the new patch, adding block size options (commit 555f8dfd),
Yann E. MORIN requested updated testcases that specifically ensure
the extreme blocksizes (4K and 1024K) don't cause issues.

This patch splits the current test case in 2, testing with both
block sizes and ensuring the block size was applied in the same
fashion as for the specified compression.

Signed-off-by: Linus Kaschulla <linus@cosmos-ink.net>
---
 support/testing/tests/fs/test_squashfs.py | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/fs/test_squashfs.py b/support/testing/tests/fs/test_squashfs.py
index a914f5aac7..07239fcce2 100644
--- a/support/testing/tests/fs/test_squashfs.py
+++ b/support/testing/tests/fs/test_squashfs.py
@@ -3,13 +3,15 @@ import os
 import infra.basetest
 
 
-class TestSquashfs(infra.basetest.BRTest):
+class TestSquashfsMinBlocksize(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
         BR2_TARGET_ROOTFS_SQUASHFS=y
+        BR2_TARGET_ROOTFS_SQUASHFS_BS_4K=y
         BR2_TARGET_ROOTFS_SQUASHFS4_LZO=y
         # BR2_TARGET_ROOTFS_TAR is not set
         """
+    expected_blocksize_in_bytes = 1024 * 4
 
     def test_run(self):
         unsquashfs_cmd = ["host/bin/unsquashfs", "-s", "images/rootfs.squashfs"]
@@ -18,6 +20,7 @@ class TestSquashfs(infra.basetest.BRTest):
         self.assertEqual(out[0],
                          "Found a valid SQUASHFS 4:0 superblock on images/rootfs.squashfs.")
         self.assertEqual(out[3], "Compression lzo")
+        self.assertEqual(out[4], "Block size {}".format(self.expected_blocksize_in_bytes))
 
         img = os.path.join(self.builddir, "images", "rootfs.squashfs")
         infra.img_round_power2(img)
@@ -31,3 +34,15 @@ class TestSquashfs(infra.basetest.BRTest):
 
         cmd = "mount | grep '/dev/root on / type squashfs'"
         self.assertRunOk(cmd)
+
+# Reusing TestSquashfsMinBlocksize's test_run(), but change
+# blocksize in config the maxium to ensure all extemes work.
+class TestSquashfsMaxBlocksize(TestSquashfsMinBlocksize):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_TARGET_ROOTFS_SQUASHFS=y
+        BR2_TARGET_ROOTFS_SQUASHFS_BS_1024K=y
+        BR2_TARGET_ROOTFS_SQUASHFS4_LZO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    expected_blocksize_in_bytes = 1024 * 1024
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
