Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D4AC7EE25
	for <buildroot@archiver.kernel.org>; Fri,  9 Jun 2023 09:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56EDE84170;
	Fri,  9 Jun 2023 09:10:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56EDE84170
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 951FsmzyNM7n; Fri,  9 Jun 2023 09:10:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9210E83FE7;
	Fri,  9 Jun 2023 09:10:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9210E83FE7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D7D61BF334
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 09:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DA4E61564
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 09:10:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DA4E61564
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 15ufalG_WnOq for <buildroot@lists.busybox.net>;
 Fri,  9 Jun 2023 09:10:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A76B60F49
 for <buildroot@buildroot.org>; Fri,  9 Jun 2023 09:10:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A76B60F49
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 63E4A8256E; Fri,  9 Jun 2023 09:10:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 9 Jun 2023 10:12:23 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: d9f2fa8e63c35bdd79412902546f46a825d01305
X-Git-Newrev: a5ce02522a7c0c2ced03cd1b0350db68c1b28f6d
X-Patchwork-Hint: ignore
Message-Id: <20230609091042.63E4A8256E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] support/testing: new
 runtime test for bash
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

commit: https://git.buildroot.net/buildroot/commit/?id=a5ce02522a7c0c2ced03cd1b0350db68c1b28f6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Commit 2dff6e93ca2a (package/readline: add upstream patch to fix crash
with invalid locale specification) fixed a regression in readline 8.2
[0], that could have been caught with a runtime test. readline is a
library, so we need an executable that exercises readline.

Since readline and bash are developped in tandem [1], it is only logical
to use bash to test readline.

Add a new runtime test for bash, that checks that we can indeed run an
interactive shell, and that an non-existing locale does not cause the
dreaded segfault. We do not use the default configuration, because it
uses a uclibc toolchain, and we want to reproduce against a glibc one.

[0] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1021109
[1] https://tiswww.case.edu/php/chet/readline/rltop.html#Bugs

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 511f28ae5ca0fbd3c997f5c460747a5d3e0ca24b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_bash.py | 47 ++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/support/testing/tests/package/test_bash.py b/support/testing/tests/package/test_bash.py
new file mode 100644
index 0000000000..f0ee8cadc1
--- /dev/null
+++ b/support/testing/tests/package/test_bash.py
@@ -0,0 +1,47 @@
+import os
+
+import infra.basetest
+
+
+class TestBash(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_ENABLE_LOCALE_WHITELIST=""
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_BASH=y
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
+        # Check that we are indeed not (yet) running bash
+        out, _ = self.emulator.run('echo "${BASH}"')
+        self.assertEqual(out[0], "", "Already running bash instead of busybox' sh")
+
+        self.assertRunOk("bash -il")
+        # Twist! The above command is still runing, it's just that
+        # bash did display the prompt we expect. Check we are indeed
+        # actually bash
+        out, _ = self.emulator.run('echo "${BASH}"')
+        self.assertEqual(out[0], "/bin/bash", "Not running bash")
+        # Exit bash, back to busybox' shell
+        self.emulator.run("exit 0")
+
+        # Check that we are indeed no longer running bash
+        out, _ = self.emulator.run('echo "${BASH}"')
+        self.assertEqual(out[0], "", "Still running bash instead of busybox' sh")
+
+        # Try to run with a non-available locale
+        self.assertRunOk("LC_ALL=en_US bash -il")
+        out, _ = self.emulator.run('echo "${BASH}"')
+        self.assertEqual(out[0], "/bin/bash", "Not running bash")
+        self.emulator.run("exit 0")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
