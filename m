Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFE3C25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 21:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED602820DE;
	Sat,  1 Jun 2024 21:01:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NY_CqE6OXN5R; Sat,  1 Jun 2024 21:01:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22CE58479A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22CE58479A;
	Sat,  1 Jun 2024 21:01:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E6A1E1BF4E5
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 21:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D21BD423FA
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 21:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0W8Ae5cGgvxv for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 21:01:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 70FDA423F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70FDA423F7
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70FDA423F7
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 21:01:14 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 07E6AB004FF;
 Sat,  1 Jun 2024 23:01:10 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat,  1 Jun 2024 23:01:04 +0200
Message-ID: <20240601210104.1160688-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717275672;
 bh=2KLWLqGfPjbnRjLtJgISXwV48r4vCc3OFHx9BxL695E=;
 h=From:To:Cc:Subject:Date:From;
 b=BhDx8mCweA8rraEBrKcWwh5Epr/A4q0/rhCP1rCcxx5wShBsWUNslw+GeIG+1PaWF
 mDONUOLrlAX+6I+kPa795Bf+sxLbYsGhEYscfkEKR5QVbhEeiF5eCci0ryQUZBD0qb
 ElcDr5se0rfEDdFQF0uYNszSjyAlLBIm7g9n3yoVDlaLeXM9yiGfsvW/HY5tZxtxcl
 GBs7rCUCB/OZLvk0b8eHipswAEoQ2xK9JC/BXOj896GMeleyI+U9Xc54LlpWB/601B
 MhkuHfHTrMbcJabyUuZqeLWnYw0VnUoDZDEz3uVIu8EsA4vXzblGpuGrUwqfBEBdKf
 ZP2eYxJRcmMLA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BhDx8mCw
Subject: [Buildroot] [PATCH 1/1] support/testing: add bcc runtime test
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                    |  2 +
 support/testing/tests/package/test_bcc.py     | 84 +++++++++++++++++++
 .../tests/package/test_bcc/linux-bcc.fragment |  4 +
 3 files changed, 90 insertions(+)
 create mode 100644 support/testing/tests/package/test_bcc.py
 create mode 100644 support/testing/tests/package/test_bcc/linux-bcc.fragment

diff --git a/DEVELOPERS b/DEVELOPERS
index b9568ed7c58..cc70a4a6ddd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1799,6 +1799,8 @@ F:	support/testing/tests/package/test_acpica.py
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
index 00000000000..51f175a5b49
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
index 00000000000..35359b08f6a
--- /dev/null
+++ b/support/testing/tests/package/test_bcc/linux-bcc.fragment
@@ -0,0 +1,4 @@
+CONFIG_FTRACE=y
+CONFIG_FTRACE_SYSCALLS=y
+CONFIG_FUNCTION_TRACER=y
+CONFIG_KPROBES=y
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
