Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC8EC369C2
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 16:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67A03607A7;
	Fri, 25 Apr 2025 16:10:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s0SoRRIiwsZY; Fri, 25 Apr 2025 16:10:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A3BF608EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A3BF608EA;
	Fri, 25 Apr 2025 16:10:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2190EC1
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08DD5608EA
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:10:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4_IbERXsSc4K for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 16:10:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52824607A7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52824607A7
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:10:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 490F28634A; Fri, 25 Apr 2025 16:10:46 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 25 Apr 2025 18:09:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3672945a8da3d5f464448f9c5abdb6dba09085c5
X-Git-Newrev: dacf8e3c39652c595519ab6d424009962d8ae9ba
X-Patchwork-Hint: ignore
Message-Id: <20250425161046.490F28634A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/test: new bat runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=dacf8e3c39652c595519ab6d424009962d8ae9ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a runtime test for the 'bat' package to verify that the binary executes
correctly in a minimal Buildroot rootfs.The test cheks that:
- 'bat --version' runs without error
- 'bat' can read and display a text file
- the displayed content matches the expected string

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_bat.py | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/support/testing/tests/package/test_bat.py b/support/testing/tests/package/test_bat.py
new file mode 100644
index 0000000000..018d0e002f
--- /dev/null
+++ b/support/testing/tests/package/test_bat.py
@@ -0,0 +1,27 @@
+import os
+import infra.basetest
+
+
+class TestBat(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+            """
+            BR2_PACKAGE_BAT=y
+            BR2_TARGET_ROOTFS_CPIO=y
+            # BR2_TARGET_ROOTFS_TAR is not set
+            """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # Check the programs can execute
+        self.assertRunOk("bat --version")
+        self.assertRunOk("echo 'hello test' > test.txt")
+
+        # Run bat and capture output
+        output, exit_code = self.emulator.run("bat test.txt", timeout=10)
+        self.assertEqual(exit_code, 0)
+        self.assertIn("hello test", "\n".join(output))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
