Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B7FC74A44
	for <buildroot@archiver.kernel.org>; Sat, 11 Mar 2023 08:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E0548124A;
	Sat, 11 Mar 2023 08:57:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E0548124A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zbsnCwt2G3C9; Sat, 11 Mar 2023 08:57:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A3BA82365;
	Sat, 11 Mar 2023 08:57:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A3BA82365
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6570E1BF312
 for <buildroot@lists.busybox.net>; Sat, 11 Mar 2023 08:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F0DF400D2
 for <buildroot@lists.busybox.net>; Sat, 11 Mar 2023 08:57:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F0DF400D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l1WHFiGElpyV for <buildroot@lists.busybox.net>;
 Sat, 11 Mar 2023 08:57:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4643C400C8
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4643C400C8
 for <buildroot@buildroot.org>; Sat, 11 Mar 2023 08:57:28 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.174.13.46])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A417913F86F;
 Sat, 11 Mar 2023 09:57:22 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Mar 2023 09:57:08 +0100
Message-Id: <20230311085708.88937-2-ju.o@free.fr>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230311085708.88937-1-ju.o@free.fr>
References: <20230311085708.88937-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1678525046;
 bh=XR+yzrteywe+R1UfHfV26jpc3dvx3HfDAcA0YdeplDI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B+lWOlAD/ULOhY0KEmc5I/nI+b8q4EP7UC/Bcvr27VasEBwEjNW8KWWnxFWIN6sip
 AAoZiRrTv7q4+5ZvIYXz1gPmqxxwN2MPYLPRNxGV+P+jrZZJwq+7wtD9w7KVr0/wF9
 DTNCUyADbYcBhsONVHf0H5z8KdtDAxnZywzsb/Zj3ZyZnWb3415WovE9TPqAVb1IzA
 woyTjWcxmBGWjfCWMHiGAvCI2qtKzF1rwG7o4vnuLzKQbbJp7/Y0mwO1ZWiC9gLtxQ
 wPjQxj/8cdEik7sD+K+QQFa6eAICWPhZsfSujsuxKnFfhVMIjF/LaV9XCW/mgN+7B5
 4eXov42iGt61Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=B+lWOlAD
Subject: [Buildroot] [PATCH next 2/2]
 support/testing/tests/package/test_dieharder.py: new runtime test
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
Cc: Julien Olivain <ju.o@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch next at commit b793f3a with command:

    python3 -m flake8 support/testing/tests/package/test_dieharder.py
    [no-output]

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_dieharder
    ...
    OK
---
 DEVELOPERS                                    |  1 +
 .../testing/tests/package/test_dieharder.py   | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 support/testing/tests/package/test_dieharder.py

diff --git a/DEVELOPERS b/DEVELOPERS
index d052e59122..84b386aaeb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1715,6 +1715,7 @@ F:	support/testing/tests/package/sample_python_distro.py
 F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
 F:	support/testing/tests/package/sample_python_spake2.py
+F:	support/testing/tests/package/test_dieharder.py
 F:	support/testing/tests/package/test_gnupg2.py
 F:	support/testing/tests/package/test_highway.py
 F:	support/testing/tests/package/test_hwloc.py
diff --git a/support/testing/tests/package/test_dieharder.py b/support/testing/tests/package/test_dieharder.py
new file mode 100644
index 0000000000..d324a34557
--- /dev/null
+++ b/support/testing/tests/package/test_dieharder.py
@@ -0,0 +1,40 @@
+import os
+
+import infra.basetest
+
+
+class TestDieharder(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_DIEHARDER=y
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
+        # Check the program can run (by showing its version)
+        self.assertRunOk("dieharder -V")
+
+        # The birthdays test on small number (1) of sample is expected to fail
+        cmd = "dieharder -g /dev/urandom -d diehard_birthdays -t 1"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertIn("FAILED", '\n'.join(output))
+
+        # The birthdays test on higher number (25) of sample is expected to succeed
+        cmd = "dieharder -g mt19937 -d diehard_birthdays -t 25"
+        output, exit_code = self.emulator.run(cmd, timeout=10)
+        self.assertEqual(exit_code, 0)
+        self.assertIn("PASSED", '\n'.join(output))
+
+        # The birthdays test on file /dev/zero is expected to fail
+        cmd = "dieharder -g file_input_raw -f /dev/zero -d diehard_birthdays -t 25"
+        output, exit_code = self.emulator.run(cmd, timeout=40)
+        self.assertEqual(exit_code, 0)
+        self.assertIn("FAILED", '\n'.join(output))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
