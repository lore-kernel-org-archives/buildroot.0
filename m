Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092DEC47077
	for <buildroot@archiver.kernel.org>; Tue, 16 Jan 2024 18:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 508E460AF8;
	Tue, 16 Jan 2024 18:20:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 508E460AF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ep8N9UbePrZF; Tue, 16 Jan 2024 18:20:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9752960BF0;
	Tue, 16 Jan 2024 18:20:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9752960BF0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1D0EE1BF473
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 18:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02B4460BF0
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 18:20:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02B4460BF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4WI1IvDwamPR for <buildroot@lists.busybox.net>;
 Tue, 16 Jan 2024 18:20:38 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04B3B60AF8
 for <buildroot@buildroot.org>; Tue, 16 Jan 2024 18:20:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04B3B60AF8
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id EB24E13F899;
 Tue, 16 Jan 2024 19:20:33 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 16 Jan 2024 19:20:26 +0100
Message-ID: <20240116182026.284510-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705429235;
 bh=6WUGoo+JiFwBynkpeTPyduImA8UcqQPkwjtXW90M9Dk=;
 h=From:To:Cc:Subject:Date:From;
 b=EVBa/knW+JQOMMaFxrRB2+JG4q1wu9Hxlhg+hib2J3HRGMseyfOAZJW41a6Z/ZWD+
 1gr0KE78VzVYTqu6/a/wmJOarou7J/fDDNAhTqEuq+FbB9zwKDAfhwuXBl0UINFuLk
 BWj+DNfhRKLMoKj2FxUnTDME6g++4WldVjfp+8effXf1P5PjD6SHLtTBSgKXDa9Pay
 /UsbH7PbCWr39ptS52Mqz30KGvRAJgz28Wv6LmKshvbFe89CJ2hmz9I8UhvJGElak7
 HIzYfX2207MBNSBozFzehWuGvpwwXBjexdqJVS6xuy9hF75LMsuegPtbrTMox7T3BY
 GweUeBg/aQ7Dg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EVBa/knW
Subject: [Buildroot] [PATCH 1/1] support/testing: new bc runtime test
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
Tested on branch master at commit e07402a with commands:

    make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_bc
    ...
    OK
---
 DEVELOPERS                               |  1 +
 support/testing/tests/package/test_bc.py | 62 ++++++++++++++++++++++++
 2 files changed, 63 insertions(+)
 create mode 100644 support/testing/tests/package/test_bc.py

diff --git a/DEVELOPERS b/DEVELOPERS
index f5b04937b6..b30923f3ba 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1759,6 +1759,7 @@ F:	support/testing/tests/package/sample_python_pyalsa.py
 F:	support/testing/tests/package/sample_python_spake2.py
 F:	support/testing/tests/package/test_acpica.py
 F:	support/testing/tests/package/test_acpica/
+F:	support/testing/tests/package/test_bc.py
 F:	support/testing/tests/package/test_brotli.py
 F:	support/testing/tests/package/test_bzip2.py
 F:	support/testing/tests/package/test_compressor_base.py
diff --git a/support/testing/tests/package/test_bc.py b/support/testing/tests/package/test_bc.py
new file mode 100644
index 0000000000..c31e871339
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
+        hex_str = "DEADBEEF0000ABADC0DE0000CAFEBABE"
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
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
