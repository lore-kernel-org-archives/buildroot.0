Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F646D68BDA
	for <buildroot@archiver.kernel.org>; Fri, 15 Nov 2024 22:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD46E605F9;
	Fri, 15 Nov 2024 22:48:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pEsh4TcCY5q8; Fri, 15 Nov 2024 22:48:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2E52606FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2E52606FA;
	Fri, 15 Nov 2024 22:48:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 90045BF
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 22:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71371846B9
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 22:48:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XfyJGHZUpcWn for <buildroot@buildroot.org>;
 Fri, 15 Nov 2024 22:48:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 61F43845BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61F43845BD
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 61F43845BD
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 22:48:12 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4735AB0053D;
 Fri, 15 Nov 2024 23:48:09 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Fri, 15 Nov 2024 23:47:53 +0100
Message-ID: <20241115224753.1074295-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731710890;
 bh=EsMNQp+sfP1hFSNOCv1apfboVuFYFAKHyKJ3VytJROQ=;
 h=From:To:Cc:Subject:Date:From;
 b=G13NJo4RsUZ7rlNtBPYJFHZw3iAFNJZWZC5GL6R+s3ZZWUtow2AqFCHOSvD++eTqT
 eN93d0RHjKuvXhfbQ3QFCvmFW+eEe9SvJMZjlKnMEppJ1MKs4XB6zAQwnN00ALvduH
 AIBt2DA8aJsKMNqRNvW09jQJHKeS4KACNBTF7W9ZaQ5gAFB72oRJKRHx4Nd3Amjzqt
 5WGwZzsUj2rWIGPhOAWrVXu251V5H9rZE9P1dv0yTBA38iNehCubkebsJNHHfKAGNX
 AAbnlj2/5k5aG9b56vm5uXBu72hyWUjwQt9s4t6cY8nrqPwl2tijrTy5/k3zr1TezW
 2PQt5Wx6luHNQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=G13NJo4R
Subject: [Buildroot] [PATCH 1/1] support/testing: new ltp-testsuite runtime
 test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/8388435290
---
 DEVELOPERS                                    |  1 +
 .../tests/package/test_ltp_testsuite.py       | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 support/testing/tests/package/test_ltp_testsuite.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 3945803d53..1ff269b362 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1931,6 +1931,7 @@ F:	support/testing/tests/package/test_links.py
 F:	support/testing/tests/package/test_links/
 F:	support/testing/tests/package/test_lrzip.py
 F:	support/testing/tests/package/test_lrzsz.py
+F:	support/testing/tests/package/test_ltp_testsuite.py
 F:	support/testing/tests/package/test_ltrace.py
 F:	support/testing/tests/package/test_lvm2.py
 F:	support/testing/tests/package/test_lzip.py
diff --git a/support/testing/tests/package/test_ltp_testsuite.py b/support/testing/tests/package/test_ltp_testsuite.py
new file mode 100644
index 0000000000..a85ceb35a6
--- /dev/null
+++ b/support/testing/tests/package/test_ltp_testsuite.py
@@ -0,0 +1,39 @@
+import os
+
+import infra.basetest
+
+
+class TestLtpTestsuite(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_LTP_TESTSUITE=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="600M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        drive = os.path.join(self.builddir, "images", "rootfs.ext4")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           kernel_cmdline=["rootwait", "root=/dev/sda"],
+                           options=["-drive", f"file={drive},if=scsi,format=raw"])
+        self.emulator.login()
+
+        # We run a reduced number of tests (read syscall tests) for a
+        # fast execution. See "runltp --help" for option details.
+        cmd = "/usr/lib/ltp-testsuite/runltp"
+        cmd += " -p -q"
+        cmd += " -s ^read0[0-9]*"
+        cmd += " -l /tmp/ltp.log"
+        cmd += " -o /tmp/ltp.output"
+        cmd += " -C /tmp/ltp.failed"
+        cmd += " -T /tmp/ltp.tconf"
+        self.assertRunOk(cmd)
+
+        # We print the LTP run log and check there was zero failure in
+        # our test selection.
+        out, ret = self.emulator.run("cat /tmp/ltp.log")
+        self.assertEqual(ret, 0)
+        self.assertIn("Total Failures: 0", out)
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
