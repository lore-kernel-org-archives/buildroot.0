Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB39C531F9
	for <buildroot@archiver.kernel.org>; Sat, 25 Jul 2026 23:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E5B36065D;
	Sat, 25 Jul 2026 23:59:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rJdPrCa0QX1n; Sat, 25 Jul 2026 23:59:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF4F46066B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785023953;
	bh=5bB8JFwIGfP0OLdRHnmlmDab3PzfmyZA+cm6eED0Lwk=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=nTaC54yruv2D9ed2ncf+HobaxG8O/Zio+qD/Apuu5q9wMjrHz+dyglYKY0jSb/JTj
	 Lo/ei+XHJsN9GquagTfNeBgFib1mkMRnUWb2eT1i3vBnYbbMiDtMt7jKrRrABDl8V+
	 i25nqyO/oO6XbyLvRFVyKou60a4+S4xZa6TqJrXWIFihPp3OCezGID2dapT87MV1Lf
	 xKLQjNPB+dn1xbSsqdg3Z0dG1sXA6YQko3hhSjeLTExOgpZc7yn7p9alu9I2CKoFar
	 ZGOitabFLXaocsCBPJF4180OUTIypbWZBzZ/H7Poi2nHRepkNokvd323oR2fa7nkGm
	 ixJZRpzLeDwOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF4F46066B;
	Sat, 25 Jul 2026 23:59:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F01E977
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 23:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7016A80D98
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 23:59:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j_uOt5-L6v07 for <buildroot@buildroot.org>;
 Sat, 25 Jul 2026 23:59:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 36E1D80D60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36E1D80D60
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 36E1D80D60
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 23:59:09 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id BAA715FF88;
 Sun, 26 Jul 2026 01:59:05 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sun, 26 Jul 2026 01:58:57 +0200
Message-ID: <20260725235857.2053672-1-ju.o@free.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785023946;
 bh=+W4SkfOfjVkrQfU5sD7iJKxzy5j+b/9vWnY3KwrstCY=;
 h=From:To:Cc:Subject:Date:From;
 b=FSAnJpG8GDCDKXvMZYsGWIN5tx9ybo43CozD1Mf3lGJeBhPbkNqFdn5oTECfN/Loh
 ru4+4QZ2SlQi56Uy/vb4i/wZf2vQ5yl4/SCSGkNs5KptCPc0COBML2kMhDbvdVdORT
 efdjjdwSH1EINHS9m6GGEv1tWzTL2kP2yvCPCPTsOOXIclk8a/huK003cuHbhI8Ty2
 aZ0aRJGuUzV3Iiqh8gdpgfSQgsDjCLGsC425UBrXDommyszo3fbnPO2+tll4QpqwYo
 6jRHFBpxl3MUJtL/LCn7N8I0HTMrHJNiauTb+7Iv7uwNzGoTOIeronRyJJrUV2q6C0
 jzEkQ0bVIuNCw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FSAnJpG8
Subject: [Buildroot] [PATCH 1/1] support/testing: guile: new runtime test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/15535258777
---
 DEVELOPERS                                    |  2 +
 support/testing/tests/package/test_guile.py   | 76 +++++++++++++++++++
 .../test_guile/rootfs-overlay/root/fact.scm   | 13 ++++
 3 files changed, 91 insertions(+)
 create mode 100644 support/testing/tests/package/test_guile.py
 create mode 100755 support/testing/tests/package/test_guile/rootfs-overlay/root/fact.scm

diff --git a/DEVELOPERS b/DEVELOPERS
index f2713c7239..f475c4701d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1915,6 +1915,8 @@ F:	support/testing/tests/package/test_gnuradio/
 F:	support/testing/tests/package/test_gpsd.py
 F:	support/testing/tests/package/test_gpsd/
 F:	support/testing/tests/package/test_gstreamer1.py
+F:	support/testing/tests/package/test_guile.py
+F:	support/testing/tests/package/test_guile/
 F:	support/testing/tests/package/test_gzip.py
 F:	support/testing/tests/package/test_highway.py
 F:	support/testing/tests/package/test_hwloc.py
diff --git a/support/testing/tests/package/test_guile.py b/support/testing/tests/package/test_guile.py
new file mode 100644
index 0000000000..0af4a3f65c
--- /dev/null
+++ b/support/testing/tests/package/test_guile.py
@@ -0,0 +1,76 @@
+import os
+from math import factorial
+
+import infra.basetest
+
+
+class TestGuile(infra.basetest.BRTest):
+    rootfs_overlay = \
+        infra.filepath("tests/package/test_guile/rootfs-overlay")
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_GENERATE_LOCALE="en_US.UTF-8"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.40"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_SYSTEM_ENABLE_NLS=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_PACKAGE_GUILE=y
+        """
+
+    def guile_cmd(self, guile_expr):
+        return f"guile -q -c '{guile_expr}'"
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           options=["-M", "virt", "-cpu", "cortex-a57", "-m", "512M", "-initrd", img])
+        self.emulator.login()
+
+        # Guile needs a locale configured to work properly.
+        self.assertRunOk("export LANG=en_US.UTF-8")
+
+        # Check the program works.
+        self.assertRunOk("guile --version")
+
+        # Check a string output.
+        string = "Hello Buildroot!"
+        cmd = self.guile_cmd(f'(display "{string}")(newline)')
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], string)
+
+        # Check the exit status works.
+        code = 123
+        cmd = self.guile_cmd(f"(exit {code})")
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, code)
+
+        # Check basic artihmetic works.
+        val1 = 123
+        val2 = 456
+        guile_expr = f'(display (* {val1} {val2}))(newline)'
+        cmd = self.guile_cmd(guile_expr)
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        expected_result = val1 * val2
+        self.assertEqual(int(output[0]), expected_result)
+
+        # Check we can call a Guile script. We disable auto
+        # compilation to suppress compilation and cache messages.
+        val = 12
+        cmd = f"GUILE_AUTO_COMPILE=0 /root/fact.scm {val}"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        expected_result = factorial(val)
+        self.assertEqual(int(output[0]), expected_result)
diff --git a/support/testing/tests/package/test_guile/rootfs-overlay/root/fact.scm b/support/testing/tests/package/test_guile/rootfs-overlay/root/fact.scm
new file mode 100755
index 0000000000..a937ff4041
--- /dev/null
+++ b/support/testing/tests/package/test_guile/rootfs-overlay/root/fact.scm
@@ -0,0 +1,13 @@
+#! /usr/bin/env guile
+!#
+
+; Adapted from "The Guile Reference Manual"
+; Section 4.3.4 Scripting Examples
+; https://doc.guix.gnu.org/guile/latest/en/html_node/Scripting-Examples.html
+
+(define (fact n)
+  (if (zero? n) 1
+    (* n (fact (- n 1)))))
+
+(display (fact (string->number (cadr (command-line)))))
+(newline)
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
