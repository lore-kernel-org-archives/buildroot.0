Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5D0C433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 09:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCEAA40C6D;
	Sat, 14 May 2022 09:53:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gk8DxYMUTJz4; Sat, 14 May 2022 09:53:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E36B340C5D;
	Sat, 14 May 2022 09:53:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C9AC91BF947
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85E1E415F5
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:50:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jwG4phbjFe2D for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 09:50:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B946F41624
 for <buildroot@buildroot.org>; Sat, 14 May 2022 09:50:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 710068376C; Sat, 14 May 2022 09:39:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 11:44:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b980be3c5d4d1566fba8e20866bd88172084df5b
X-Git-Newrev: e66cac7631dd6c9e83c82af3f19b9cc0d3f15ab7
X-Patchwork-Hint: ignore
Message-Id: <20220514093944.710068376C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_zfs: don't run
 TestZfsBase as a test
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
Content-Type: multipart/mixed; boundary="===============6324580267818971362=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6324580267818971362==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e66cac7631dd6c9e83c82af3f19b9cc0d3f15ab7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The commit [1] introcuded TestZfsBase as a common function
between all Zfs tests. But TestZfsBase test is executed
as a test itself.

Rename test_run() to base_test_run() to avoid this issue.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/2429014006

[1] 593e8cb71f8f2ac69889424bbef5ab09c0dbb06e

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/tests/package/test_zfs.py | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_zfs.py b/support/testing/tests/package/test_zfs.py
index 8911dcfd9e..e3784f7d7d 100644
--- a/support/testing/tests/package/test_zfs.py
+++ b/support/testing/tests/package/test_zfs.py
@@ -25,7 +25,7 @@ class TestZfsBase(infra.basetest.BRTest):
         # BR2_TARGET_ROOTFS_TAR is not set
         """
 
-    def test_run(self):
+    def base_test_run(self):
         kernel = os.path.join(self.builddir, "images", "bzImage")
         cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
         self.emulator.boot(
@@ -65,6 +65,9 @@ class TestZfsGlibc(TestZfsBase):
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_STABLE=y
         """
 
+    def test_run(self):
+        TestZfsBase.base_test_run(self)
+
 
 class TestZfsUclibc(TestZfsBase):
     config = TestZfsBase.config + \
@@ -72,9 +75,15 @@ class TestZfsUclibc(TestZfsBase):
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_UCLIBC_STABLE=y
         """
 
+    def test_run(self):
+        TestZfsBase.base_test_run(self)
+
 
 class TestZfsMusl(TestZfsBase):
     config = TestZfsBase.config + \
         """
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_STABLE=y
         """
+
+    def test_run(self):
+        TestZfsBase.base_test_run(self)

--===============6324580267818971362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6324580267818971362==--
