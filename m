Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A70C4345F
	for <buildroot@archiver.kernel.org>; Sun, 21 Apr 2024 11:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D2064031B;
	Sun, 21 Apr 2024 11:31:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KTjob0OazOPV; Sun, 21 Apr 2024 11:31:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1005406CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1005406CF;
	Sun, 21 Apr 2024 11:31:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DAAAA1BF41F
 for <buildroot@lists.busybox.net>; Sun, 21 Apr 2024 11:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C300B406E5
 for <buildroot@lists.busybox.net>; Sun, 21 Apr 2024 11:31:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6zSFbajvv36K for <buildroot@lists.busybox.net>;
 Sun, 21 Apr 2024 11:31:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 262BD4031B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 262BD4031B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 262BD4031B
 for <buildroot@buildroot.org>; Sun, 21 Apr 2024 11:31:30 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E480DB00539;
 Sun, 21 Apr 2024 13:31:25 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 21 Apr 2024 13:31:20 +0200
Message-ID: <20240421113120.82861-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1713699087;
 bh=ieVf8OBFORQv1v/nSr4pVTmanQAD70IMOEa2hzdkmaw=;
 h=From:To:Cc:Subject:Date:From;
 b=ol5Ut7GST/bJas+yIc7FJnluC0yn79uRAspigoDfgYta0S+Deuv8eSOQD8eMx7DYx
 Ck1Fpc6YkARRioSYINakBkIuRqolsVtWXEZcx40Aawmr2wBIXdCy3kDJWMsbKm0yH/
 BTwBrRqxskIp9ttqGT3WBt6+GVbYTvhHzp4vb9Lwbs4gx2K9EdKsX+Iv6k9nizkt6b
 hUuw3UcwV2kWB+5z5+EVn5PSB7oqbyacldIV1fq2PHsxTtBABWeyc1Q4EpSD0/IJT7
 8WfBv6x8khcAf3nbsh5pD+i1/lFoVx+srBCA/9TYh0a0qDebZwmzuuZxy1yDrpXUqE
 zfP6dcqtqaydQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ol5Ut7GS
Subject: [Buildroot] [PATCH 1/1] support/testing: add 4th runtime test
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
 DEVELOPERS                                |  1 +
 support/testing/tests/package/test_4th.py | 55 +++++++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 support/testing/tests/package/test_4th.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 399b2931ff3..cabb181d758 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1768,6 +1768,7 @@ F:	support/testing/tests/package/sample_python_midiutil.py
 F:	support/testing/tests/package/sample_python_ml_dtypes.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
 F:	support/testing/tests/package/sample_python_spake2.py
+F:	support/testing/tests/package/test_4th.py
 F:	support/testing/tests/package/test_acl.py
 F:	support/testing/tests/package/test_acpica.py
 F:	support/testing/tests/package/test_acpica/
diff --git a/support/testing/tests/package/test_4th.py b/support/testing/tests/package/test_4th.py
new file mode 100644
index 00000000000..c020c825b31
--- /dev/null
+++ b/support/testing/tests/package/test_4th.py
@@ -0,0 +1,55 @@
+import os
+from math import sqrt
+
+import infra.basetest
+
+
+class Test4th(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_4TH=y
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
+        # We set the DIR4TH variable where 4th demos and libraries are
+        # installed.
+        self.assertRunOk("export DIR4TH=/usr/share/4th/")
+
+        # We run a simple "hello world" demo.
+        out, ret = self.emulator.run("4th cxq demo/hello.4th")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], "Hello world!")
+
+        # We run a demo doing some square root maths.
+        out, ret = self.emulator.run("4th cxq demo/squares.4th")
+        self.assertEqual(ret, 0)
+        self.assertTrue(len(out) > 1)
+        for line in out[1:]:
+            columns = line.split()
+            value = float(columns[0])
+            value_sqrt = float(columns[1])
+            result_check = sqrt(value)
+            self.assertAlmostEqual(value_sqrt, result_check, delta=0.1)
+
+        # We run a word count demo and the 4th source file. We save
+        # the word count for a later check.
+        out, ret = self.emulator.run("4th cxq wc.4th /usr/share/4th/wc.4th")
+        self.assertEqual(ret, 0)
+        wc_out = out[0].split()
+
+        # We run the same command using system "wc" command. We expect
+        # the same numbers.
+        out, ret = self.emulator.run("wc /usr/share/4th/wc.4th")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0].split(), wc_out)
+
+        # We run a slightly more complex computation example.
+        self.assertRunOk("4th cxq fractals.4th")
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
