Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7332E67482
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 18:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 336A560790;
	Sun, 21 Dec 2025 18:08:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EN-iqsKooLUP; Sun, 21 Dec 2025 18:08:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 566816089B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766340511;
	bh=AkLfiOR9xdwvFDCyRLrRg/sqpETLlWOFfvlqrN9QFM0=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Gl141/k+u5M4Xo0439A1szue2BHNdXJHnGedd47MgUGy+/H5/P9hcnKaKlKH6VLnR
	 Dr1Txrvx54k0IKJFX4MCZF9fC/p3R1GQBCWLUR99bUK7FqSX7ObbZEjQClLj4glHsQ
	 MvmqtSKxCHtURkUQnknQuHnCMi1rclXvtCO0ZvmojZXvdPRhOI8J6EJXu9Or+Qpw1V
	 pgh+Nq9P8ckUBmDdb81N+ZyVMZwDcjaCWtB/w3JhH9QRqN6vdPL0jsa0KYUyuf1XQf
	 md2iIOBkkpSWxwNBW0wIrr4eoYAlLJ2+TS2lmk119Imsmel/bjRVEnf7L5D/qxdUVR
	 LBi2ykNnvC4ag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 566816089B;
	Sun, 21 Dec 2025 18:08:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 05BA7BC
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 18:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFFAF6089B
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 18:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BI2hEpg4KuyA for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 18:08:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AC4F060790
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC4F060790
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AC4F060790
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 18:08:28 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a0d:e487:412e:ace1:8cb:5573:7181:a54f])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 4BFA860136;
 Sun, 21 Dec 2025 19:08:21 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	Petr Vorel <petr.vorel@gmail.com>
Date: Sun, 21 Dec 2025 19:08:10 +0100
Message-ID: <20251221180810.3770181-1-ju.o@free.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766340505;
 bh=NQ/N6Fpdcxt3xEUO8L91s9J4kwn8iuU7H07Xr/Ne//8=;
 h=From:To:Cc:Subject:Date:From;
 b=HTq0RFltNAsp58eq6QtIfx1LX3xcsKipVQHnz9ZYDFOynwv8RPcPgdg4gi9LskXbf
 RT8edod7oCIIVD9n+aFJ1JcY3h0O/Ga7s/W1gt8OUyfvihkj/xymo+Ykzxyd0HqjDh
 jH2VnGwEIMWhzyzGJwHxNnmDoQ0GyKi5gtTp8QCEkbQWXt6bkxfe4I+aQ8jFzcny78
 j2HcpQMy+XyfnHFvv5WXYj3ZgoU9kb7ne4qX3445iWF7NcNE5kUp3tWV7FmpU1udMs
 2SEpPDHaA0BWOnCYdkkYiztbdI19tvgCYRWdNFIaz5cLIlB3JGyKSCS9RXhdJNjIbJ
 kuJXN5iyfhS6g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HTq0RFlt
Subject: [Buildroot] [PATCH 1/1] support/testing: ltp-testsuite: replace
 runltp by kirk
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

The run log of this ltp-testsuite test shows:

    INFO: runltp script is deprecated, try kirk
    https://github.com/linux-test-project/kirk

This commit updates this test to replace this deprecated runltp
shell script with the newer kirk Python script.

The logic of this runtime test remains the same: it runs a small number
of 'read' system call tests, and checks there is no failures and at
least one test succeed.

Cc: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/12510635102
---
 .../tests/package/test_ltp_testsuite.py       | 33 +++++++++++--------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/support/testing/tests/package/test_ltp_testsuite.py b/support/testing/tests/package/test_ltp_testsuite.py
index a85ceb35a6..6ff59b9700 100644
--- a/support/testing/tests/package/test_ltp_testsuite.py
+++ b/support/testing/tests/package/test_ltp_testsuite.py
@@ -1,3 +1,4 @@
+import json
 import os
 
 import infra.basetest
@@ -7,6 +8,7 @@ class TestLtpTestsuite(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
         BR2_PACKAGE_LTP_TESTSUITE=y
+        BR2_PACKAGE_PYTHON3=y
         BR2_TARGET_ROOTFS_EXT2=y
         BR2_TARGET_ROOTFS_EXT2_4=y
         BR2_TARGET_ROOTFS_EXT2_SIZE="600M"
@@ -21,19 +23,24 @@ class TestLtpTestsuite(infra.basetest.BRTest):
                            options=["-drive", f"file={drive},if=scsi,format=raw"])
         self.emulator.login()
 
+        ltp_root = "/usr/lib/ltp-testsuite"
+        report_file = "/tmp/ltp-report.json"
+
         # We run a reduced number of tests (read syscall tests) for a
-        # fast execution. See "runltp --help" for option details.
-        cmd = "/usr/lib/ltp-testsuite/runltp"
-        cmd += " -p -q"
-        cmd += " -s ^read0[0-9]*"
-        cmd += " -l /tmp/ltp.log"
-        cmd += " -o /tmp/ltp.output"
-        cmd += " -C /tmp/ltp.failed"
-        cmd += " -T /tmp/ltp.tconf"
-        self.assertRunOk(cmd)
+        # fast execution. See "kirk --help" for option details.
+        cmd = f"LTPROOT={ltp_root}"
+        cmd += f" {ltp_root}/kirk"
+        cmd += " --sut host"
+        cmd += " --framework ltp"
+        cmd += " --run-suite syscalls"
+        cmd += " --run-pattern '^read0[0-9]*'"
+        cmd += f" --json-report {report_file}"
+        self.assertRunOk(cmd, timeout=30)
 
-        # We print the LTP run log and check there was zero failure in
-        # our test selection.
-        out, ret = self.emulator.run("cat /tmp/ltp.log")
+        # We print the LTP report and check there was at least one
+        # passed test and zero failure in our selection.
+        out, ret = self.emulator.run(f"cat {report_file} && echo")
         self.assertEqual(ret, 0)
-        self.assertIn("Total Failures: 0", out)
+        report = json.loads("".join(out))
+        self.assertEqual(report['stats']['failed'], 0)
+        self.assertGreater(report['stats']['passed'], 0)
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
