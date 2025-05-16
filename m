Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E55C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 16:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE92D61249;
	Fri, 16 May 2025 16:46:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A7Ha-AtSwrkL; Fri, 16 May 2025 16:46:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CEAA60B49
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CEAA60B49;
	Fri, 16 May 2025 16:46:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C11013D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 16:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DCF1400AF
 for <buildroot@buildroot.org>; Fri, 16 May 2025 16:45:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lnRbZ8zSFgxj for <buildroot@buildroot.org>;
 Fri, 16 May 2025 16:45:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40B9B4003A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40B9B4003A
 for <buildroot@buildroot.org>; Fri, 16 May 2025 16:45:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 296AB86AC1; Fri, 16 May 2025 16:45:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 18:44:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a0b51dd088de15ab7a039d7d7476022e826fb4ff
X-Git-Newrev: e9498b4faa28c494c064728d564b43c07b1b0689
X-Patchwork-Hint: ignore
Message-Id: <20250516164558.296AB86AC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: new dieharder runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=e9498b4faa28c494c064728d564b43c07b1b0689
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Note: this test was not working in Buildroot test infrastructure
before commit [1] was merged, because dieharder has the string "# "
in its output.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/0cad947b964be5612a182413da136fcf0dc5a1f2

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 DEVELOPERS                                      |  1 +
 support/testing/tests/package/test_dieharder.py | 36 +++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6528a63a83..c4df675aaf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1885,6 +1885,7 @@ F:	support/testing/tests/package/test_cryptsetup.py
 F:	support/testing/tests/package/test_cryptsetup/
 F:	support/testing/tests/package/test_ddrescue.py
 F:	support/testing/tests/package/test_ddrescue/
+F:	support/testing/tests/package/test_dieharder.py
 F:	support/testing/tests/package/test_dmidecode.py
 F:	support/testing/tests/package/test_dos2unix.py
 F:	support/testing/tests/package/test_dosfstools.py
diff --git a/support/testing/tests/package/test_dieharder.py b/support/testing/tests/package/test_dieharder.py
new file mode 100644
index 0000000000..de09b383b4
--- /dev/null
+++ b/support/testing/tests/package/test_dieharder.py
@@ -0,0 +1,36 @@
+import os
+
+import infra.basetest
+
+
+class TestDieharder(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_DIEHARDER=y
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
+        # Check the program can run (by showing its version)
+        self.assertRunOk("dieharder -V")
+
+        # The birthdays randomness test on the mt19937 random number
+        # generator with 25 sample is expected to always succeed.
+        cmd = "dieharder -g mt19937 -d diehard_birthdays -t 25"
+        output, exit_code = self.emulator.run(cmd, timeout=10)
+        self.assertEqual(exit_code, 0)
+        self.assertIn("PASSED", '\n'.join(output))
+
+        # The birthdays randomness test on file /dev/zero is expected
+        # to always fail.
+        cmd = "dieharder -g file_input_raw -f /dev/zero -d diehard_birthdays -t 25"
+        output, exit_code = self.emulator.run(cmd, timeout=40)
+        self.assertEqual(exit_code, 0)
+        self.assertIn("FAILED", '\n'.join(output))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
