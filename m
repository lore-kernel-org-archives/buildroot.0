Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7534AC3DA59
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 11:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82FE581440;
	Sat, 20 Jul 2024 11:46:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z0Y1JRK0Qx8q; Sat, 20 Jul 2024 11:46:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4341C813D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4341C813D5;
	Sat, 20 Jul 2024 11:46:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA4FD1BF30A
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 11:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B36344049F
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 11:46:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AN1JkvLHenRt for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 11:46:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0DCCB40471
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DCCB40471
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0DCCB40471
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 11:46:11 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 39348B00583;
 Sat, 20 Jul 2024 13:46:07 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 13:45:57 +0200
Message-ID: <20240720114557.100691-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1721475968;
 bh=0xHgAIGXdMdMKFnAnRt4agiqgc5McpvUFC1oB2WuifU=;
 h=From:To:Cc:Subject:Date:From;
 b=Nkaq7nuwns3QlsmC1QpML9W41h8U1DcxmqYVRl+ZijxUWtyzHEyR/uRB6iv2JbJbf
 TeS59F5KvfiI8tV2FFLCVqfoe7fgln8z4RRUxOtFiT99V92qYVKqMjxI252/Ng/ZWS
 MUzhpRA8cARsLf6wNPlRs8ZpTrZ88IaIXtggnHz9ubebKK9Nq3JxX0aqE4AoRnWgEi
 w31GPIpOcnBcVDKarsVVWqPWNj7+Jf61LIPX7cZyer9Sp/tQ2vpTtWVCQeVLEjKMQu
 phvREwUXdFWU6vt8tvEbNYvHfWQyEQLDLa1pWtgYyju8ZIlox7KB7UFqp+R9Mu4/l5
 cbCqjdbDBsDFg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Nkaq7nuw
Subject: [Buildroot] [PATCH 1/1] support/testing: add mawk runtime test
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
 DEVELOPERS                                 |   1 +
 support/testing/tests/package/test_mawk.py | 114 +++++++++++++++++++++
 2 files changed, 115 insertions(+)
 create mode 100644 support/testing/tests/package/test_mawk.py

diff --git a/DEVELOPERS b/DEVELOPERS
index c4f1565edd..06eef3740f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1901,6 +1901,7 @@ F:	support/testing/tests/package/test_lzip.py
 F:	support/testing/tests/package/test_lsof.py
 F:	support/testing/tests/package/test_lz4.py
 F:	support/testing/tests/package/test_lzop.py
+F:	support/testing/tests/package/test_mawk.py
 F:	support/testing/tests/package/test_mdadm.py
 F:	support/testing/tests/package/test_mdadm/
 F:	support/testing/tests/package/test_micropython.py
diff --git a/support/testing/tests/package/test_mawk.py b/support/testing/tests/package/test_mawk.py
new file mode 100644
index 0000000000..5caf77c116
--- /dev/null
+++ b/support/testing/tests/package/test_mawk.py
@@ -0,0 +1,114 @@
+import os
+
+import infra.basetest
+
+
+class TestMawk(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_MAWK=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def basic_mawk_tests(self):
+        # Check the program can execute
+        self.assertRunOk("mawk --version")
+
+        # Check "mawk" can return a specific exit code
+        code = 123
+        cmd = "mawk 'BEGIN { exit(" + str(code) + "); }'"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, code)
+
+        # Run a basic print program
+        test_string = "Hello Buildroot"
+        cmd = "mawk 'BEGIN {print \"" + test_string + "\"; }'"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(output[0], test_string)
+
+    def create_test_data(self):
+        # Create some test data
+        entries = ["one", "two", "three", "four"]
+        for entry in entries:
+            self.assertRunOk(f"echo {entry} >> data1.txt")
+
+    def add_line_numbers(self):
+        # Add line numbers with mawk
+        cmd = "mawk '{ print NR \"\\t\" $1; }' data1.txt > data2.txt"
+        self.assertRunOk(cmd)
+
+    def sum_column(self):
+        # Check the sum of the first column is 1+2+3+4 == 10
+        awk_prg = "BEGIN { SUM = 0; } { SUM = SUM + $1; } END { print SUM; }"
+        cmd = f"mawk '{awk_prg}' data2.txt"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(int(output[0]), 10)
+
+    def uppercase_column(self):
+        # Extract only column 2 and convert it to upper case
+        cmd = "mawk '{ print toupper($2); }' data2.txt > data3.txt"
+        self.assertRunOk(cmd)
+
+        # Prepare the same output using "data1.txt" and the "tr" command,
+        # for verification
+        cmd = "tr a-z A-Z < data1.txt > data3-tr.txt"
+        self.assertRunOk(cmd)
+
+        # "mawk" and "tr" output are expected to be the same
+        self.assertRunOk("cmp data3.txt data3-tr.txt")
+
+    def mawk_head(self):
+        # Show the first 2 lines of a file
+        cmd = "mawk 'NR <= 2 { print $0; }' data2.txt > data4.txt"
+        self.assertRunOk(cmd)
+
+        # Prepare the same output using the "head" command
+        cmd = "head -2 data2.txt > data4-head.txt"
+        self.assertRunOk(cmd)
+
+        # "mawk" and "tr" output are expected to be the same
+        self.assertRunOk("cmp data4.txt data4-head.txt")
+
+    def mawk_specific(self):
+        # Use the "-W dump" mawk specific option.
+        # See: https://invisible-island.net/mawk/manpage/mawk.html
+        # We create an arbitrary awk program with an integer and
+        # string constant. We then check those constants are in the
+        # mawk "assembler" output.
+        awk_int = 12345
+        awk_str = "Buildroot"
+        awk_expr = f"print ($1 + {awk_int}) \"{awk_str}\";"
+        awk_prg = "BEGIN { " + awk_expr + " }"
+        cmd = f"mawk -W dump '{awk_prg}'"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        out_str = "\n".join(output)
+        self.assertIn(str(awk_int), out_str)
+        self.assertIn(awk_str, out_str)
+
+    def mawk_numeric(self):
+        value = 1234
+        squared_value = value * value
+        cmd = "mawk 'BEGIN { print sqrt(" + str(squared_value) + "); }'"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(int(output[0]), value)
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        self.basic_mawk_tests()
+        self.create_test_data()
+        self.add_line_numbers()
+        self.sum_column()
+        self.uppercase_column()
+        self.mawk_head()
+        self.mawk_specific()
+        self.mawk_numeric()
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
