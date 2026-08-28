Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77AB9C61DCB
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 10:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E6AC40848;
	Fri, 28 Aug 2026 10:59:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AS_oViy5LC3V; Fri, 28 Aug 2026 10:59:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787914798;
	bh=Az9asGjNb1JtKaFzwrQyOMEOeG2jNcpK/17pSoNRe7o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WKPBhN1HPLJkCHZaiKHVeL0a4knnaD00rufXSAAWQoxwExemUTBLO8Z74/C81BJKI
	 S3aRa1bF8cJH8MX2USEXm4rsC4h+SfytwlCoRGk4XRwX1ufPCCYp3rwa4ha26ew71S
	 Aim40Fcds/E4FjLVizoyB+pr5ag8YfYhS8R0lT45NCjd7F24xAT44aa/awpgJ4su/m
	 S6yPEhueZiE7tNIl5jqH2kO9taqt7Ui83O0wBrxEKEz5QtN/vgVRDA6xUImBrJ88dX
	 wTYIvCyuqfmro+vP7Cs8RdqjYs6il5dzHPgjuDNrvxNQHZs6h0EKOmMQ0nEOwZnTDd
	 Lujry1YvrryGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 409A840838;
	Fri, 28 Aug 2026 10:59:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BEB2D465
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 10:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC6A980EB6
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 10:59:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k9n5xKlAdxlJ for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 10:59:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C5E480EA3
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 10:59:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2CE87921DA; Fri, 28 Aug 2026 10:58:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 11:47:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc25888c889c82c15829c16f6ad0974d03f5ab5b
X-Git-Newrev: e06cfae9cb61e049076fa47585f44a9b569a1949
X-Patchwork-Hint: ignore
Message-Id: <20260828105859.2CE87921DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add bpftrace test
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e06cfae9cb61e049076fa47585f44a9b569a1949
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This commit adds a simple bpftrace test that ensures that not only it
builds fine, but it also runs properly on a minimal test scenario.

Assisted-by: GPT-5.6
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Julien:
 - reindent emulator.boot() options
 - add a call to "bpftrace --version"
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/package/test_bpftrace.py     | 65 ++++++++++++++++++++++
 .../package/test_bpftrace/linux-bpftrace.fragment  |  4 ++
 3 files changed, 71 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 49a72bb69a..53104cc60b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3304,6 +3304,8 @@ F:	support/testing/tests/package/sample_python_flask_expects_json.py
 F:	support/testing/tests/package/sample_python_git.py
 F:	support/testing/tests/package/sample_python_pyudev.py
 F:	support/testing/tests/package/sample_python_unittest_xml_reporting.py
+F:	support/testing/tests/package/test_bpftrace.py
+F:	support/testing/tests/package/test_bpftrace/linux-bpftrace.fragment
 F:	support/testing/tests/package/test_nodejs.py
 F:	support/testing/tests/package/test_python_augeas.py
 F:	support/testing/tests/package/test_python_crccheck.py
diff --git a/support/testing/tests/package/test_bpftrace.py b/support/testing/tests/package/test_bpftrace.py
new file mode 100644
index 0000000000..83410eea60
--- /dev/null
+++ b/support/testing/tests/package/test_bpftrace.py
@@ -0,0 +1,65 @@
+import os
+
+import infra.basetest
+
+
+# gitlab-runner: 2xlarge
+class TestBpftrace(infra.basetest.BRTest):
+    kern_fragment = infra.filepath(
+        "tests/package/test_bpftrace/linux-bpftrace.fragment"
+    )
+    config = f"""
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
+        BR2_PACKAGE_BPFTRACE=y
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
+        self.emulator.boot(
+            arch="aarch64",
+            kernel=kern,
+            kernel_cmdline=["root=/dev/vda console=ttyAMA0"],
+            options=[
+                "-M", "virt",
+                "-cpu", "cortex-a57",
+                "-m", "256M",
+                "-drive", f"file={drive},if=virtio,format=raw"
+            ]
+        )
+        self.emulator.login()
+
+        self.assertRunOk("mount -t debugfs none /sys/kernel/debug/")
+
+        # Check the program can run.
+        self.assertRunOk("bpftrace --version")
+
+        # Check that bpftrace can find a syscall tracepoint.
+        self.assertRunOk("bpftrace -l 'tracepoint:syscalls:sys_enter_execve'")
+
+        # Compile and attach a tracepoint program, then trigger it with the
+        # command executed by bpftrace. The marker avoids matching volatile
+        # fields such as PIDs or command names.
+        cmd = (
+            "bpftrace -e 'tracepoint:syscalls:sys_enter_execve "
+            '{ printf("buildroot-bpftrace-test\\n"); exit(); }\' '
+            "-c /bin/true"
+        )
+        output, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertIn("buildroot-bpftrace-test", "\n".join(output))
diff --git a/support/testing/tests/package/test_bpftrace/linux-bpftrace.fragment b/support/testing/tests/package/test_bpftrace/linux-bpftrace.fragment
new file mode 100644
index 0000000000..35359b08f6
--- /dev/null
+++ b/support/testing/tests/package/test_bpftrace/linux-bpftrace.fragment
@@ -0,0 +1,4 @@
+CONFIG_FTRACE=y
+CONFIG_FTRACE_SYSCALLS=y
+CONFIG_FUNCTION_TRACER=y
+CONFIG_KPROBES=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
