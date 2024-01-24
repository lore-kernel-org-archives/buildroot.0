Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52250C47422
	for <buildroot@archiver.kernel.org>; Wed, 24 Jan 2024 22:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF8AC41BB4;
	Wed, 24 Jan 2024 22:24:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF8AC41BB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gCzMEkrVJuhc; Wed, 24 Jan 2024 22:24:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FF484168C;
	Wed, 24 Jan 2024 22:24:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FF484168C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 238591BF831
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 22:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0829240129
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 22:24:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0829240129
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xV7ybS04cKMp for <buildroot@lists.busybox.net>;
 Wed, 24 Jan 2024 22:24:12 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1D9E40119
 for <buildroot@buildroot.org>; Wed, 24 Jan 2024 22:24:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1D9E40119
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0343213F8A7;
 Wed, 24 Jan 2024 23:24:08 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 24 Jan 2024 23:24:03 +0100
Message-ID: <20240124222403.16360-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1706135050;
 bh=fhCFf/Crl5rQPAtfhNjRA/tzOhYm7d1cskzVaYHsxdM=;
 h=From:To:Cc:Subject:Date:From;
 b=VFNoawPvBnvxUZpChB99ekAyuPCOGyVpQyhZj06vRXRa4DfzekAB4j2b1efXCIir0
 dpIVpEWaulNYTSYclrsRFPf/But8t5K1CgTbw/S3D7M1+AZGzv8qBQD5exrrFesigF
 9C/9JAacBA0mbcvKHphKkHHRrC2vbhrPnqFVfTyEXgYdXlGWIzG8U12VD1S5BM0/sV
 GWz/YTZPsN9sEbO/gI/Dy4Z2N6nMclGi2LGS4ucch4uZAoWCU+ybzdpnvdNcjH/Qp8
 BayG/yRaaR0xKmjEWDmizP/hMR5NDqZ8xTb++sl6Y5fBXtpw5pTxNOcY8g75VnpWlq
 SgEeRB/jVBbUQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VFNoawPv
Subject: [Buildroot] [PATCH 1/1] support/testing: add trace-cmd runtime test
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
Patch tested on branch master at commit bc680b5 with commands:

    make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_trace_cmd
    ...
    OK
---
 DEVELOPERS                                    |  2 +
 .../testing/tests/package/test_trace_cmd.py   | 54 +++++++++++++++++++
 .../test_trace_cmd/linux-ftrace.fragment      |  1 +
 3 files changed, 57 insertions(+)
 create mode 100644 support/testing/tests/package/test_trace_cmd.py
 create mode 100644 support/testing/tests/package/test_trace_cmd/linux-ftrace.fragment

diff --git a/DEVELOPERS b/DEVELOPERS
index 9528837dd0..94febf5a75 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1822,6 +1822,8 @@ F:	support/testing/tests/package/test_sed.py
 F:	support/testing/tests/package/test_stress_ng.py
 F:	support/testing/tests/package/test_tcl.py
 F:	support/testing/tests/package/test_tcl/
+F:	support/testing/tests/package/test_trace_cmd.py
+F:	support/testing/tests/package/test_trace_cmd/
 F:	support/testing/tests/package/test_weston.py
 F:	support/testing/tests/package/test_weston/
 F:	support/testing/tests/package/test_xz.py
diff --git a/support/testing/tests/package/test_trace_cmd.py b/support/testing/tests/package/test_trace_cmd.py
new file mode 100644
index 0000000000..e7d5e13bce
--- /dev/null
+++ b/support/testing/tests/package/test_trace_cmd.py
@@ -0,0 +1,54 @@
+import os
+
+import infra.basetest
+
+
+class TestTraceCmd(infra.basetest.BRTest):
+    # A specific configuration is needed for testing trace-cmd.
+    # The function tracer need to be enabled in the Kernel.
+    kern_fragment = \
+        infra.filepath("tests/package/test_trace_cmd/linux-ftrace.fragment")
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.74"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kern_fragment}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_TRACE_CMD=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt",
+                                    "-cpu", "cortex-a57",
+                                    "-m", "256M",
+                                    "-initrd", img])
+        self.emulator.login()
+
+        # Record calls to kmalloc() from a simple command.
+        self.assertRunOk("trace-cmd record -e kmalloc ls -l /")
+
+        # Show information about the trace.dat file.
+        self.assertRunOk("trace-cmd dump")
+
+        # Generate a text report of the trace.
+        self.assertRunOk("trace-cmd report > trace.txt")
+
+        # Check we have occurrences of "kmalloc:" in the trace report.
+        cmd = "grep -Fc kmalloc: trace.txt"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEquals(exit_code, 0)
+        self.assertTrue(int(output[0]) > 0)
diff --git a/support/testing/tests/package/test_trace_cmd/linux-ftrace.fragment b/support/testing/tests/package/test_trace_cmd/linux-ftrace.fragment
new file mode 100644
index 0000000000..ef82146616
--- /dev/null
+++ b/support/testing/tests/package/test_trace_cmd/linux-ftrace.fragment
@@ -0,0 +1 @@
+CONFIG_FTRACE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
