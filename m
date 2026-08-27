Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B54C61DB9
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 09:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5211480E1B;
	Thu, 27 Aug 2026 09:55:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wIDm5km_Dha5; Thu, 27 Aug 2026 09:55:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787824543;
	bh=nPaj6xrswje+BmiIQ0NgwFco2A3vTLkAkCUEu/Yjg5c=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=s+aEYB6OhM99cAVU4I8ElvOB6pl1oDJEm2zJKM6ed44LpDEynxrDEg3yhLPqUc+02
	 HdS9UkfgojLxcW3FtZZyyKwwakFmVgJ67gUu8FY1Fw/4D6nMaXE6pmVqLW9E0R5UGS
	 jjs3oz8O2Y9fHepoUEdDQ4HvivNa3z76tiiTMuKagoyBw8HzTHOims33CnDu+h1TJ8
	 4x0GtcQGp3+UBjs6xTIDcXWxp2dxyypgkVhzRlVnymFjAwxnuBNjTz3Wz9pr0nCAq6
	 e1/8eP7m8qhHMnOOQ+iDCz3TxctZKEeTGjh3+Bt+54OgcB9eMIE9rTfEi2KP0QL+Pe
	 4hkBRDArZl7ZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFDB280E09;
	Thu, 27 Aug 2026 09:55:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E42AE3A4
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 09:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB04360661
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 09:55:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MFw2kIoA-Lyi for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 09:55:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1415160643
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 09:55:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2FF9C4E413DA
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 09:55:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 014DA602B8
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 09:55:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6008C11C787BC; 
 Thu, 27 Aug 2026 11:55:34 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Aug 2026 11:55:18 +0200
Message-ID: <20260827095520.1049186-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827095520.1049186-1-thomas.petazzoni@bootlin.com>
References: <20260827095520.1049186-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 3/3] support/testing: add bpftrace test
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit adds a simple bpftrace test that ensures that not only it
builds fine, but it also runs properly on a minimal test scenario.

Assisted-by: GPT-5.6
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                    |  2 +
 .../testing/tests/package/test_bpftrace.py    | 66 +++++++++++++++++++
 .../test_bpftrace/linux-bpftrace.fragment     |  4 ++
 3 files changed, 72 insertions(+)
 create mode 100644 support/testing/tests/package/test_bpftrace.py
 create mode 100644 support/testing/tests/package/test_bpftrace/linux-bpftrace.fragment

diff --git a/DEVELOPERS b/DEVELOPERS
index 5eb438906f..080aaac5e0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3297,6 +3297,8 @@ F:	support/testing/tests/package/sample_python_flask_expects_json.py
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
index 0000000000..70ccfe8b20
--- /dev/null
+++ b/support/testing/tests/package/test_bpftrace.py
@@ -0,0 +1,66 @@
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
+                "-M",
+                "virt",
+                "-cpu",
+                "cortex-a57",
+                "-m",
+                "256M",
+                "-drive",
+                f"file={drive},if=virtio,format=raw",
+            ],
+        )
+        self.emulator.login()
+
+        self.assertRunOk("mount -t debugfs none /sys/kernel/debug/")
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
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
