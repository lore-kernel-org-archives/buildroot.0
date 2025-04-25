Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF69C369D3
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 16:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA037419E5;
	Fri, 25 Apr 2025 16:10:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CzLwxHJbKEYW; Fri, 25 Apr 2025 16:10:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31AF541A03
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31AF541A03;
	Fri, 25 Apr 2025 16:10:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 08A87127
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EDFE3419E5
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:10:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f7LoDBUY0uC6 for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 16:10:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58855419DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58855419DC
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:10:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 539138634C; Fri, 25 Apr 2025 16:10:46 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 25 Apr 2025 18:09:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dacf8e3c39652c595519ab6d424009962d8ae9ba
X-Git-Newrev: 5bca9d741d8dce703c678872b0d61052e23b53a2
X-Patchwork-Hint: ignore
Message-Id: <20250425161046.539138634C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/test: new dust runtime test
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
