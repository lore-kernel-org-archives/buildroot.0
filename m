Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E3FC2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB85E8450B;
	Mon, 19 May 2025 10:56:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tgXGELqBscRq; Mon, 19 May 2025 10:56:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86BDF84505
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86BDF84505;
	Mon, 19 May 2025 10:56:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11653D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D53D040E48
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7puOJRjuUZgc for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 558BD40F4B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 558BD40F4B
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5386982A2E; Mon, 19 May 2025 10:39:57 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 25 Apr 2025 18:09:37 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: dacf8e3c39652c595519ab6d424009962d8ae9ba
X-Git-Newrev: 5bca9d741d8dce703c678872b0d61052e23b53a2
X-Patchwork-Hint: ignore
Message-Id: <20250519103957.5386982A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/test: new dust runtime
 test
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

commit: https://git.buildroot.net/buildroot/commit/?id=5bca9d741d8dce703c678872b0d61052e23b53a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add a runtime test for the 'dust' package to verify that the binary
executes correctly in a minimal buildroot rootfs. The test checks that:
- 'dust --version' runs without error
- 'dust' can analyze a directory structure with files
- The output includes the expected directory names

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_dust.py | 32 ++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/support/testing/tests/package/test_dust.py b/support/testing/tests/package/test_dust.py
new file mode 100644
index 0000000000..8243024981
--- /dev/null
+++ b/support/testing/tests/package/test_dust.py
@@ -0,0 +1,32 @@
+import os
+import infra.basetest
+
+
+class TestDust(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_DUST=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # Check that dust is installed and can be executed
+        self.assertRunOk("dust --version")
+
+        # Create a test directory structure with some files
+        self.assertRunOk("mkdir -p testdir/subdir")
+        self.assertRunOk("dd if=/dev/zero of=testdir/a bs=1K count=10")
+        self.assertRunOk("dd if=/dev/zero of=testdir/subdir/b bs=1K count=5")
+
+        # Run dust on the test directory and capture the output
+        output, exit_code = self.emulator.run("dust testdir", timeout=10)
+        self.assertEqual(exit_code, 0)
+        self.assertIn("testdir", "\n".join(output))
+        self.assertIn("subdir", "\n".join(output))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
