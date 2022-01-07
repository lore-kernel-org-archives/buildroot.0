Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A855C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 18:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37C6681761;
	Fri,  7 Jan 2022 18:05:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E7TbiHHmCISs; Fri,  7 Jan 2022 18:05:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72BAD81763;
	Fri,  7 Jan 2022 18:05:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2FD171BF5E9
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E79A60A88
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:05:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ruZMmewNT784 for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 18:05:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CD0960A80
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 18:05:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D80247F903; Fri,  7 Jan 2022 17:59:40 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 19:05:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 97daba5781bf58a6476c76a2910254bd9cbd329e
X-Git-Newrev: bc91d35da7a04d8d28b20ba4ca32672a2dd1c736
X-Patchwork-Hint: ignore
Message-Id: <20220107175940.D80247F903@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add package/test_mender.py
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

commit: https://git.buildroot.net/buildroot/commit/?id=bc91d35da7a04d8d28b20ba4ca32672a2dd1c736
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Create a test to check Mender client at runtime.

The aim of this test is:
  - to check the correct execution of simple Mender commands,
    in a minimal environment;
  - to validate there is no missing dependencies for runtime.

This test is not a board integration test for Mender,
including well-configured bootloader, partitioning, ...

Check:
  - the daemon is started;
  - the current 'artifact name' (name of the image or update) of the active
    partition is read, without error.

For that, we need to fake (see the 'overlay' directory):
  - some bootloader environment variables;
  - the name of an update.

Signed-off-by: Mikael Bourhis-Cloarec <mikael.bourhis@smile.fr>
[Romain: remove single hyphen command (Mender 3.0.0)]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_mender.py       | 32 ++++++++++++++++++++++
 .../rootfs-overlay/etc/mender/artifact_info        |  1 +
 .../test_mender/rootfs-overlay/usr/bin/fw_printenv |  6 ++++
 3 files changed, 39 insertions(+)

diff --git a/support/testing/tests/package/test_mender.py b/support/testing/tests/package/test_mender.py
new file mode 100644
index 0000000000..fdf55ed616
--- /dev/null
+++ b/support/testing/tests/package/test_mender.py
@@ -0,0 +1,32 @@
+import os
+
+import infra.basetest
+
+
+class TestMender(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_MENDER=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_ROOTFS_OVERLAY="{}"
+        """.format(
+           # overlay to add a fake 'fw_printenv', used by Mender
+           infra.filepath("tests/package/test_mender/rootfs-overlay"))
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # Check if the Daemon is running
+        self.assertRunOk("ls /var/run/mender.pid")
+        self.assertRunOk("ps aux | egrep [m]ender")
+
+        # Check if a simple Mender command is correctly executed
+        self.assertRunOk("mender -log-level debug show-artifact")
+        self.assertRunOk("mender -log-level debug show-artifact | grep 'RUNTIME_TEST_ARTIFACT_NAME'")
+        cmd = "mender show-artifact 2>&1 | grep -i 'err'"  # Check if no 'error' among the traces
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 1)
diff --git a/support/testing/tests/package/test_mender/rootfs-overlay/etc/mender/artifact_info b/support/testing/tests/package/test_mender/rootfs-overlay/etc/mender/artifact_info
new file mode 100644
index 0000000000..4d54b8f89c
--- /dev/null
+++ b/support/testing/tests/package/test_mender/rootfs-overlay/etc/mender/artifact_info
@@ -0,0 +1 @@
+artifact_name=RUNTIME_TEST_ARTIFACT_NAME
diff --git a/support/testing/tests/package/test_mender/rootfs-overlay/usr/bin/fw_printenv b/support/testing/tests/package/test_mender/rootfs-overlay/usr/bin/fw_printenv
new file mode 100755
index 0000000000..c002a0f2b8
--- /dev/null
+++ b/support/testing/tests/package/test_mender/rootfs-overlay/usr/bin/fw_printenv
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+# Fake 'fw_printenv' because UBoot is not installed: print some plausible 'key-value'
+echo "bootcount=0"
+echo "mender_boot_part=rootfs"
+echo "upgrade_available=0"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
