Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2066CC3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 17:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2432409BD;
	Mon, 15 Jul 2024 17:39:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fc79Ug3vxpXj; Mon, 15 Jul 2024 17:39:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 566B8408DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 566B8408DC;
	Mon, 15 Jul 2024 17:39:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4032D1BF408
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 17:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BB0140395
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 17:39:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id icjoYrUClYaS for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 17:39:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B144A40363
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B144A40363
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B144A40363
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 17:39:26 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 8D508B00592;
 Mon, 15 Jul 2024 19:39:22 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 19:38:22 +0200
Message-ID: <20240715173822.95475-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1721065163;
 bh=wQm1xoQ71UNPFnZOBYaz9XBfGDeIGJ+9Lg9sOuSy/dY=;
 h=From:To:Cc:Subject:Date:From;
 b=NTAbAx7zRj/xkLFPWVW8znS/uxV46Ji3GGbbaGSLWYsz8V0Y8bxOnONIVOLXc2EN1
 BSPKGee5GRBo/oHSNKeOdXiYntCXlUehotEQbIddG3DD83JETrCgD6a7QXcjgeiTd9
 7hJVpqlDMYWuzcfduoDyDE5eFEdIIsEmNw1z/JfJuc+S2ljKJHc4BThFVORc1x5Vqd
 Fj49VX1Z7qTEwJ4AO3DW7K4NLiJVYgBXmaJ5jGianMB1OIlJQIid0B1AEWWbKwIO3A
 M8f1yuTjqw5LlG0Y4AouU1W7Ce0Z/vqgaHEbhmRMhaRpFAl1rsFqyRnWLwMOFY11kC
 NurUum+jsSEnw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=NTAbAx7z
Subject: [Buildroot] [PATCH v2 1/1] support/testing: new dieharder runtime
 test
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
Changes v1 -> v2:
Included comments from Arnout:
https://lists.buildroot.org/pipermail/buildroot/2024-July/758014.html
- Removed a test case (the other two are sufficient)
- Reworded comments to clarify that other test cases are expected
  to always succeed/fail.
---
 DEVELOPERS                                    |  1 +
 .../testing/tests/package/test_dieharder.py   | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 support/testing/tests/package/test_dieharder.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 4a22b74779..7455a6e0c7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1839,6 +1839,7 @@ F:	support/testing/tests/package/test_cryptsetup.py
 F:	support/testing/tests/package/test_cryptsetup/
 F:	support/testing/tests/package/test_ddrescue.py
 F:	support/testing/tests/package/test_ddrescue/
+F:	support/testing/tests/package/test_dieharder.py
 F:	support/testing/tests/package/test_dmidecode.py
 F:	support/testing/tests/package/test_dos2unix.py
 F:	support/testing/tests/package/test_ed.py
diff --git a/support/testing/tests/package/test_dieharder.py b/support/testing/tests/package/test_dieharder.py
new file mode 100644
index 0000000000..de09b383b4
--- /dev/null
+++ b/support/testing/tests/package/test_dieharder.py
@@ -0,0 +1,36 @@
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
+        # The birthdays randomness test on the mt19937 random number
+        # generator with 25 sample is expected to always succeed.
+        cmd = "dieharder -g mt19937 -d diehard_birthdays -t 25"
+        output, exit_code = self.emulator.run(cmd, timeout=10)
+        self.assertEqual(exit_code, 0)
+        self.assertIn("PASSED", '\n'.join(output))
+
+        # The birthdays randomness test on file /dev/zero is expected
+        # to always fail.
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
