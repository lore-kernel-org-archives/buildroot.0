Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDC6C02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 13:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B117560EA4;
	Tue,  4 Feb 2025 13:07:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MNTQeXTE1rLv; Tue,  4 Feb 2025 13:07:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71A7160D56
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71A7160D56;
	Tue,  4 Feb 2025 13:07:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B12512A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 13:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72985403DC
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 13:07:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G3J4FVVvwnld for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 13:07:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7498D40393
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7498D40393
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 13:07:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 608FE86D0A; Tue,  4 Feb 2025 13:07:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 13:19:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9320989053e72e3554a0ec4ccdade1ef641cf97e
X-Git-Newrev: 5389f9b1a2deb8bcbb0475a6ef853011208c00b0
X-Patchwork-Hint: ignore
Message-Id: <20250204130738.608FE86D0A@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_mender.py: Add RO fs test
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5389f9b1a2deb8bcbb0475a6ef853011208c00b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a test for read-only file systems.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 support/testing/tests/package/test_mender.py | 40 ++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/support/testing/tests/package/test_mender.py b/support/testing/tests/package/test_mender.py
index fdf55ed616..0938cb77e1 100644
--- a/support/testing/tests/package/test_mender.py
+++ b/support/testing/tests/package/test_mender.py
@@ -3,23 +3,23 @@ import os
 import infra.basetest
 
 
-class TestMender(infra.basetest.BRTest):
+class TestMenderInfra(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
-        """
-        BR2_PACKAGE_MENDER=y
-        BR2_TARGET_ROOTFS_CPIO=y
-        BR2_ROOTFS_OVERLAY="{}"
-        """.format(
-           # overlay to add a fake 'fw_printenv', used by Mender
-           infra.filepath("tests/package/test_mender/rootfs-overlay"))
+             """
+             BR2_PACKAGE_MENDER=y
+             BR2_TARGET_ROOTFS_CPIO=y
+             BR2_ROOTFS_OVERLAY="{}"
+             """.format(
+                 # overlay to add a fake 'fw_printenv', used by Mender
+                 infra.filepath("tests/package/test_mender/rootfs-overlay"))
 
-    def test_run(self):
+    def base_test_run(self):
         cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
-        self.emulator.boot(arch="armv5",
-                           kernel="builtin",
+        self.emulator.boot(arch="armv5", kernel="builtin",
                            options=["-initrd", cpio_file])
         self.emulator.login()
 
+    def run_mender_test(self):
         # Check if the Daemon is running
         self.assertRunOk("ls /var/run/mender.pid")
         self.assertRunOk("ps aux | egrep [m]ender")
@@ -30,3 +30,21 @@ class TestMender(infra.basetest.BRTest):
         cmd = "mender show-artifact 2>&1 | grep -i 'err'"  # Check if no 'error' among the traces
         _, exit_code = self.emulator.run(cmd)
         self.assertEqual(exit_code, 1)
+
+
+class TestMenderRW(TestMenderInfra):
+    def test_run(self):
+        TestMenderInfra.base_test_run(self)
+        self.run_mender_test()
+
+
+class TestMenderRO(TestMenderInfra):
+    config = \
+        """
+        {}
+        # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
+        """.format(TestMenderInfra.config)
+
+    def test_run(self):
+        TestMenderInfra.base_test_run(self)
+        self.run_mender_test()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
