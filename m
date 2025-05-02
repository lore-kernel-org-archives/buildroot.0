Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F4FC3ABAC
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58E0D703A3;
	Fri,  2 May 2025 11:15:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FTZtdNJWp1sp; Fri,  2 May 2025 11:15:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 879CE703A4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 879CE703A4;
	Fri,  2 May 2025 11:15:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DB3EEE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2638241E63
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fjO1QqyTyIew for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:11:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC65841E68
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC65841E68
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA174812BB; Fri,  2 May 2025 11:11:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 May 2025 13:01:22 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 672f99bdcef11fa8cda742293d83649f925c263b
X-Git-Newrev: 901f6e1cb413df12330cd81dcf150d2c4b3ca87a
X-Patchwork-Hint: ignore
Message-Id: <20250502111138.AA174812BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/test: new dust
 runtime test
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=901f6e1cb413df12330cd81dcf150d2c4b3ca87a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Add a runtime test for the 'dust' package to verify that the binary
executes correctly in a minimal buildroot rootfs. The test checks that:
- 'dust --version' runs without error
- 'dust' can analyze a directory structure with files
- The output includes the expected directory names

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 5bca9d741d8dce703c678872b0d61052e23b53a2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
