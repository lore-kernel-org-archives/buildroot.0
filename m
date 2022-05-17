Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 274E9C433F5
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 20:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D155940D33;
	Tue, 17 May 2022 20:40:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pJDjLgXvCdLN; Tue, 17 May 2022 20:40:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF56840CE6;
	Tue, 17 May 2022 20:40:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8489B1BF83C
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FC7684054
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:40:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 07qT-BEcXH_Z for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 20:40:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B37EF84026
 for <buildroot@buildroot.org>; Tue, 17 May 2022 20:40:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 81E3985F81; Tue, 17 May 2022 20:29:47 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 22:40:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e8fb79c8664234d0eb4ce73feb848a63f4d35543
X-Git-Newrev: 001e0aab23c832579b6a5c046db8f5b0716cea61
X-Patchwork-Hint: ignore
Message-Id: <20220517202947.81E3985F81@busybox.osuosl.org>
Subject: [Buildroot] [git commit] fs/squashfs: needs more test cases
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

commit: https://git.buildroot.net/buildroot/commit/?id=001e0aab23c832579b6a5c046db8f5b0716cea61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For the new patch, adding block size options (commit 555f8dfd),
Yann E. MORIN requested updated testcases that specifically ensure
the extreme blocksizes (4K and 1024K) don't cause issues.

This patch splits the current test case in 2, testing with both
block sizes and ensuring the block size was applied in the same
fashion as for the specified compression.

Signed-off-by: Linus Kaschulla <linus@cosmos-ink.net>
[yann.morin.1998@free.fr: keep exisitng test with default size]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/fs/test_squashfs.py | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/support/testing/tests/fs/test_squashfs.py b/support/testing/tests/fs/test_squashfs.py
index a914f5aac7..0ceb4cab58 100644
--- a/support/testing/tests/fs/test_squashfs.py
+++ b/support/testing/tests/fs/test_squashfs.py
@@ -10,6 +10,7 @@ class TestSquashfs(infra.basetest.BRTest):
         BR2_TARGET_ROOTFS_SQUASHFS4_LZO=y
         # BR2_TARGET_ROOTFS_TAR is not set
         """
+    expected_blocksize_in_bytes = 128*1024
 
     def test_run(self):
         unsquashfs_cmd = ["host/bin/unsquashfs", "-s", "images/rootfs.squashfs"]
@@ -18,6 +19,7 @@ class TestSquashfs(infra.basetest.BRTest):
         self.assertEqual(out[0],
                          "Found a valid SQUASHFS 4:0 superblock on images/rootfs.squashfs.")
         self.assertEqual(out[3], "Compression lzo")
+        self.assertEqual(out[4], "Block size {}".format(self.expected_blocksize_in_bytes))
 
         img = os.path.join(self.builddir, "images", "rootfs.squashfs")
         infra.img_round_power2(img)
@@ -31,3 +33,25 @@ class TestSquashfs(infra.basetest.BRTest):
 
         cmd = "mount | grep '/dev/root on / type squashfs'"
         self.assertRunOk(cmd)
+
+
+class TestSquashfsMinBlocksize(TestSquashfs):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_TARGET_ROOTFS_SQUASHFS=y
+        BR2_TARGET_ROOTFS_SQUASHFS_BS_4K=y
+        BR2_TARGET_ROOTFS_SQUASHFS4_LZO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    expected_blocksize_in_bytes = 4*1024
+
+
+class TestSquashfsMaxBlocksize(TestSquashfs):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_TARGET_ROOTFS_SQUASHFS=y
+        BR2_TARGET_ROOTFS_SQUASHFS_BS_1024K=y
+        BR2_TARGET_ROOTFS_SQUASHFS4_LZO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    expected_blocksize_in_bytes = 1024*1024
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
