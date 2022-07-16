Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED49C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Jul 2022 22:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E95784794;
	Sat, 16 Jul 2022 22:00:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E95784794
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i5b30-vdMNR1; Sat, 16 Jul 2022 22:00:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07CA28478A;
	Sat, 16 Jul 2022 22:00:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07CA28478A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C6E321BF487
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 22:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1A3F404ED
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 22:00:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1A3F404ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kv11AhhQO9PS for <buildroot@lists.busybox.net>;
 Sat, 16 Jul 2022 22:00:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 701D4403E5
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 22:00:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 701D4403E5
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id A308E8392A; Sat, 16 Jul 2022 21:46:54 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Jul 2022 23:48:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 49fde7057ed98bee28e12560760fac2edd75945c
X-Git-Newrev: 019d4b312d3cb4f8b1ae89e154bd6fa9cb9fb2ff
X-Patchwork-Hint: ignore
Message-Id: <20220716214654.A308E8392A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add test for msr-tools
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
Content-Type: multipart/mixed; boundary="===============0854580792892843325=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0854580792892843325==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=019d4b312d3cb4f8b1ae89e154bd6fa9cb9fb2ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a simple test to verify that msr-tools are working.

The test needs to build a custom x86_64 kernel with support for CPUID and
MSR.

As the TSC_AUX MSR is emulated on qemu we can use it to test that a value
written with wrmsr can indeed be read back with rdmsr.

Signed-off-by: Vincent Stehlé <vincent.stehle@laposte.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                         |  1 +
 support/testing/tests/package/test_msr_tools.py    | 50 ++++++++++++++++++++++
 .../tests/package/test_msr_tools/linux.config      |  2 +
 3 files changed, 53 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9a740d650d..71dd7d3d6c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2917,6 +2917,7 @@ F:	configs/uevm5432_defconfig
 F:	package/i7z/
 F:	package/msr-tools/
 F:	package/pixz/
+F:	support/testing/tests/package/test_msr_tools*
 F:	support/testing/tests/package/test_pixz.py
 
 N:	Vinicius Tinti <viniciustinti@gmail.com>
diff --git a/support/testing/tests/package/test_msr_tools.py b/support/testing/tests/package/test_msr_tools.py
new file mode 100644
index 0000000000..4d62742a5f
--- /dev/null
+++ b/support/testing/tests/package/test_msr_tools.py
@@ -0,0 +1,50 @@
+import os
+
+import infra.basetest
+
+
+class TestMsrTools(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_x86_64=y
+        BR2_x86_corei7=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.55"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
+        BR2_PACKAGE_MSR_TOOLS=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(
+              infra.filepath("tests/package/test_msr_tools/linux.config"))
+
+    def test_run(self):
+        kernel = os.path.join(self.builddir, "images", "bzImage")
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(
+            arch="x86_64",
+            kernel=kernel, kernel_cmdline=["console=ttyS0"],
+            options=["-cpu", "Nehalem", "-m", "320", "-initrd", cpio_file]
+        )
+        self.emulator.login()
+
+        # CPU ID.
+        cmd = "cpuid"
+        self.assertRunOk(cmd)
+
+        # Write MSR.
+        # We write to TSC_AUX.
+        cmd = "wrmsr 0xc0000103 0x1234567812345678"
+        self.assertRunOk(cmd)
+
+        # Read MSR.
+        # We read back the TSC_AUX and we verify that we read back the correct
+        # value.
+        cmd = "rdmsr 0xc0000103"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], "1234567812345678")
diff --git a/support/testing/tests/package/test_msr_tools/linux.config b/support/testing/tests/package/test_msr_tools/linux.config
new file mode 100644
index 0000000000..8fe09db87b
--- /dev/null
+++ b/support/testing/tests/package/test_msr_tools/linux.config
@@ -0,0 +1,2 @@
+CONFIG_X86_CPUID=y
+CONFIG_X86_MSR=y

--===============0854580792892843325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0854580792892843325==--
