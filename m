Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6A9C47DB7
	for <buildroot@archiver.kernel.org>; Sun, 21 Jan 2024 10:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B30340494;
	Sun, 21 Jan 2024 10:18:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B30340494
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TG9dTrzEMaIX; Sun, 21 Jan 2024 10:18:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C010240518;
	Sun, 21 Jan 2024 10:18:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C010240518
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E0291BF37C
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 10:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 257F46072A
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 10:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 257F46072A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ml6-tIx_HkWb for <buildroot@lists.busybox.net>;
 Sun, 21 Jan 2024 10:18:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3590460093
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 10:18:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3590460093
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1436B8639A; Sun, 21 Jan 2024 10:18:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 21 Jan 2024 11:17:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ad40b23f2bb9301ba35cf1b42fae12d5919f7407
X-Git-Newrev: fb007c98ea0aadce3bf91e99f77ab10273df5dd8
X-Patchwork-Hint: ignore
Message-Id: <20240121101814.1436B8639A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: new bc runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=fb007c98ea0aadce3bf91e99f77ab10273df5dd8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
[yann.morin.1998@free.fr: tweak hex number]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                               |  1 +
 support/testing/tests/package/test_bc.py | 62 ++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index aa0815b9a1..a6e4b7cdb7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1760,6 +1760,7 @@ F:	support/testing/tests/package/sample_python_spake2.py
 F:	support/testing/tests/package/test_acpica.py
 F:	support/testing/tests/package/test_acpica/
 F:	support/testing/tests/package/test_apache.py
+F:	support/testing/tests/package/test_bc.py
 F:	support/testing/tests/package/test_brotli.py
 F:	support/testing/tests/package/test_bzip2.py
 F:	support/testing/tests/package/test_compressor_base.py
diff --git a/support/testing/tests/package/test_bc.py b/support/testing/tests/package/test_bc.py
new file mode 100644
index 0000000000..46e2612b93
--- /dev/null
+++ b/support/testing/tests/package/test_bc.py
@@ -0,0 +1,62 @@
+import math
+import os
+
+import infra.basetest
+
+
+class TestBc(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_BC=y
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
+        # Check the program executes.
+        self.assertRunOk("bc --version")
+
+        # We check a square root function of a number slightly larger
+        # than 32 bits.
+        value = 123456
+        squared_value = value ** 2
+        bc_expr = f"sqrt({squared_value})"
+        cmd = f"echo '{bc_expr}' | bc"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(int(output[0]), value)
+
+        # Perform an integer exponentiation producing a large number.
+        base = 3
+        exponent = 4567
+        expected_value = base ** exponent
+        bc_expr = f"{base} ^ {exponent}"
+        cmd = f"echo '{bc_expr}' | BC_LINE_LENGTH=0 bc"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(int(output[0]), expected_value)
+
+        # Test a basic output base conversion of a large number.
+        hex_str = "DEADBEEF0000ABADC0DE00008BADF00D"
+        hex_base = 16
+        value = int(hex_str, base=hex_base)
+        bc_expr = f"obase={hex_base} ; {value}"
+        cmd = f"echo '{bc_expr}' | bc"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], hex_str)
+
+        # Test a floating point computation by estimating Pi. Since we
+        # use the bc arc-tangent a() function, we need the '-l'
+        # option.
+        bc_expr = "4 * a(1)"
+        cmd = f"echo '{bc_expr}' | bc -l"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertAlmostEqual(float(output[0]), math.pi, places=16)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
