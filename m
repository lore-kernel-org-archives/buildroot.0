Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54EFFC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 14:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AB27401A1;
	Fri, 12 Jul 2024 14:41:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YJoP2qvPKQ8g; Fri, 12 Jul 2024 14:41:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE47241512
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE47241512;
	Fri, 12 Jul 2024 14:41:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6841C1BF424
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5411C41A15
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:41:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xKgwbpPRaozX for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 14:41:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1ADE241512
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1ADE241512
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 14:41:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1203E85FDA; Fri, 12 Jul 2024 14:41:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 16:40:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ba6f800fdc2435d09aca215ef2e8aefb3165bff
X-Git-Newrev: 4516c6c5d04878874545f32e1ca253505c228ed4
X-Patchwork-Hint: ignore
Message-Id: <20240712144141.1203E85FDA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add bcc runtime test
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4516c6c5d04878874545f32e1ca253505c228ed4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/package/test_bcc.py          | 84 ++++++++++++++++++++++
 .../tests/package/test_bcc/linux-bcc.fragment      |  4 ++
 3 files changed, 90 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index aeae27eb46..b0c5cc02d7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1807,6 +1807,8 @@ F:	support/testing/tests/package/test_acpica.py
 F:	support/testing/tests/package/test_acpica/
 F:	support/testing/tests/package/test_apache.py
 F:	support/testing/tests/package/test_bc.py
+F:	support/testing/tests/package/test_bcc.py
+F:	support/testing/tests/package/test_bcc/
 F:	support/testing/tests/package/test_bitcoin.py
 F:	support/testing/tests/package/test_brotli.py
 F:	support/testing/tests/package/test_bzip2.py
diff --git a/support/testing/tests/package/test_bcc.py b/support/testing/tests/package/test_bcc.py
new file mode 100644
index 0000000000..51f175a5b4
--- /dev/null
+++ b/support/testing/tests/package/test_bcc.py
@@ -0,0 +1,84 @@
+import os
+import time
+
+import infra.basetest
+
+
+class TestBcc(infra.basetest.BRTest):
+    # This test is using a Kernel >= 5.2, so it will use
+    # CONFIG_IKHEADERS. Those Kernel headers are unpacked from
+    # "/sys/kernel/kheaders.tar.xz" with a "tar" invocation. The
+    # Busybox "tar" command invoked by bcc fails to unpack the Kernel
+    # tar archive. We need the GNU Tar package. The Kernel also needs
+    # few extra config options, for running execsnoop.
+    kern_fragment = \
+        infra.filepath("tests/package/test_bcc/linux-bcc.fragment")
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kern_fragment}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_BCC=y
+        BR2_PACKAGE_TAR=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        drive = os.path.join(self.builddir, "images", "rootfs.ext4")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["root=/dev/vda console=ttyAMA0"],
+                           options=["-M", "virt", "-cpu", "cortex-a57", "-m", "256M",
+                                    "-drive", f"file={drive},if=virtio,format=raw"])
+        self.emulator.login()
+
+        log = "/root/execsnoop.log"
+        test_cmd = "/bin/sleep 1"
+
+        # bcc needs debugs to be mounted.
+        self.assertRunOk("mount -t debugfs none /sys/kernel/debug/")
+
+        # Generate some exec()s activity in background. We explicitly
+        # call for "/bin/sleep" rather than just "sleep" to avoid
+        # using any shell builtin and make sure we will exec() the
+        # binary.
+        cmd = f"while true ; do {test_cmd} ; done &"
+        self.assertRunOk(cmd)
+
+        # Run execsnoop, also in background...
+        cmd = f"/usr/share/bcc/tools/execsnoop > {log} &"
+        self.assertRunOk(cmd)
+
+        for attempt in range(3):
+            # Wait a bit, to let execsnoop to start and log some data.
+            time.sleep(40 * self.timeout_multiplier)
+
+            # We check that the log file contains some data.
+            cmd = f"test -s {log}"
+            _, ret = self.emulator.run(cmd)
+            if ret == 0:
+                break
+        else:
+            self.fail(f"Timeout while waiting for data in {log}.")
+
+        # Kill our background execsnoop execution.
+        self.assertRunOk("kill $!")
+
+        # Check we have captured execution occurrences of out test
+        # command.
+        cmd = f"grep -Foc '{test_cmd}' {log}"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertGreater(int(out[0]), 0)
diff --git a/support/testing/tests/package/test_bcc/linux-bcc.fragment b/support/testing/tests/package/test_bcc/linux-bcc.fragment
new file mode 100644
index 0000000000..35359b08f6
--- /dev/null
+++ b/support/testing/tests/package/test_bcc/linux-bcc.fragment
@@ -0,0 +1,4 @@
+CONFIG_FTRACE=y
+CONFIG_FTRACE_SYSCALLS=y
+CONFIG_FUNCTION_TRACER=y
+CONFIG_KPROBES=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
