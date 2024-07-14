Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E41CC3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 17:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D77934010D;
	Sun, 14 Jul 2024 17:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G60yRhLbt_DM; Sun, 14 Jul 2024 17:06:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 999DA401F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 999DA401F6;
	Sun, 14 Jul 2024 17:06:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 047071BF3F2
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 17:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E683D8102F
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 17:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OeJZpQ7UP4_f for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 17:05:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E52A481006
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E52A481006
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E52A481006
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 17:05:57 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id BAA04B00563;
 Sun, 14 Jul 2024 19:05:54 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 19:05:50 +0200
Message-ID: <20240714170550.2527918-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1720976756;
 bh=MlpH1IWHFxQJ/NGWEEXJbtlGKq27QNO2MBy8Lf8RSf0=;
 h=From:To:Cc:Subject:Date:From;
 b=cy+h+IVPUCJbABreskRtJ9PtgnbLYTrzqkhfYUyqUL9JoIDh2RSeyqrr1PcldwHak
 gKIGsZ7biN2SRE/S+R3TM6VufUBw922U0wnWIYRDBqE0UdFTFTlOEKYN2AVkHIAcha
 EfOGjxMTyKtcorG53LFI43suzMaUkIscV3tF4HItrITwPb1uEvlDGg0R0LphG5WVde
 Oli5hWx6/8wiPRm0618KlQ2FKzmbfBbJbmS0HPTro2DNGETaCS2R4yJgj9Fog1GJpO
 FquAfrHveUS+F++RXEv1deFkLg/E6i8fp0YeZH9w66a8uoasJrOUNAjbM9FFLF2XPa
 /fi74ltjId3/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=cy+h+IVP
Subject: [Buildroot] [PATCH 1/1] support/testing: new dieharder runtime test
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

Note: this test was not working in Buildroot test infrastructure
before commit [1] was merged, because dieharder has the string "# "
in its output.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/0cad947b964be5612a182413da136fcf0dc5a1f2

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                    |  1 +
 .../testing/tests/package/test_dieharder.py   | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 support/testing/tests/package/test_dieharder.py

diff --git a/DEVELOPERS b/DEVELOPERS
index e3804db1cd..83c60405e0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1832,6 +1832,7 @@ F:	support/testing/tests/package/test_cryptsetup.py
 F:	support/testing/tests/package/test_cryptsetup/
 F:	support/testing/tests/package/test_ddrescue.py
 F:	support/testing/tests/package/test_ddrescue/
+F:	support/testing/tests/package/test_dieharder.py
 F:	support/testing/tests/package/test_dos2unix.py
 F:	support/testing/tests/package/test_ed.py
 F:	support/testing/tests/package/test_ethtool.py
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
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
