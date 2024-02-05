Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F699C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07C514177D;
	Mon,  5 Feb 2024 10:32:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07C514177D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gibSDYH9MWGN; Mon,  5 Feb 2024 10:32:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A6104185C;
	Mon,  5 Feb 2024 10:32:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A6104185C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 41F9B1BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B32A60F58
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:32:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B32A60F58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ouGw23yButgW for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:32:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D38F60F31
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:32:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D38F60F31
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E20E86A8F; Mon,  5 Feb 2024 10:32:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 11:31:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0149b50166e11d90c90f603dc488c2b964c019a6
X-Git-Newrev: 988a2115c2fe65c8a2f5cfa049aa8f4e38c149dc
X-Patchwork-Hint: ignore
Message-Id: <20240205103244.2E20E86A8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add strace runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=988a2115c2fe65c8a2f5cfa049aa8f4e38c149dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                   |  1 +
 support/testing/tests/package/test_strace.py | 37 ++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 02b7516a92..8d280eff47 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1818,6 +1818,7 @@ F:	support/testing/tests/package/test_rdma_core.py
 F:	support/testing/tests/package/test_rdma_core/
 F:	support/testing/tests/package/test_screen.py
 F:	support/testing/tests/package/test_sed.py
+F:	support/testing/tests/package/test_strace.py
 F:	support/testing/tests/package/test_stress_ng.py
 F:	support/testing/tests/package/test_tcl.py
 F:	support/testing/tests/package/test_tcl/
diff --git a/support/testing/tests/package/test_strace.py b/support/testing/tests/package/test_strace.py
new file mode 100644
index 0000000000..c1cba2173f
--- /dev/null
+++ b/support/testing/tests/package/test_strace.py
@@ -0,0 +1,37 @@
+import os
+
+import infra.basetest
+
+
+class TestStrace(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_STRACE=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # Check the program can execute.
+        self.assertRunOk("strace --version")
+
+        test_file = "buildroot-strace-test.txt"
+        test_file_mode = "0600"
+        strace_log = "strace.log"
+
+        # Create a test file.
+        self.assertRunOk(f"touch {test_file}")
+
+        # Run strace on a chmod
+        cmd = f"strace -o {strace_log} chmod {test_file_mode} {test_file}"
+        self.assertRunOk(cmd)
+
+        # Check the strace log contain a call to chmod()
+        expected_str = f"chmod(\"{test_file}\", {test_file_mode}) = 0"
+        self.assertRunOk(f"grep -F '{expected_str}' {strace_log}")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
