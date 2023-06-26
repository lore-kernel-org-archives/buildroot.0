Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9433C0015E
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 20:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A757410E0;
	Mon, 26 Jun 2023 20:00:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A757410E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MJEIFqRDXEQS; Mon, 26 Jun 2023 20:00:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56AD5409EA;
	Mon, 26 Jun 2023 20:00:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56AD5409EA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 21EE61BF378
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 20:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07B83607B5
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 20:00:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07B83607B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JtQxbR4Y4cmV for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 20:00:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F71B607D6
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F71B607D6
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 20:00:54 +0000 (UTC)
Received: from home.juju.sh (unknown [37.171.207.173])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id C9A52200589;
 Mon, 26 Jun 2023 22:00:49 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 26 Jun 2023 22:00:40 +0200
Message-ID: <20230626200040.12432-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230611104518.337528-1-ju.o@free.fr>
References: <20230611104518.337528-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687809651;
 bh=Mlefe1/yMM48OkdMdWK0M3KChBa9SOmXhlPvmRcSWvs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fArcjubuaEIVIT/AF3YpdI34faEw5SFrlf5NTzX7Yzh1Bbqr1S13xeTIQOh7fdCYA
 HeJYwOq0qyvmWuWB2LAk75w4h9YCgJfpyjB9Gg/ECTaQPrNOTWGGNarGgBQeHruIsp
 8JwequzRZo9h41Diej3h3oIJbVIzKcwjWpo6g8Wgx3heh69SL3IRtNE4JdTKOSGKdk
 H1SxnuXyBnEtiUMGLXxm83GWTX7gNwLvchMnyGKCY2ewaYPYyfFQV05haYdLEgnjYE
 UfThUmHmgGdYuQ4S2cSBSMtwCUkX27pO8+s2LHZY7C9aLruYEnSdCjWKBTlIfsl+I/
 fJWMI4GIcanJg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fArcjubu
Subject: [Buildroot] [PATCH v2 2/3]
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                    |  1 +
 .../testing/tests/package/test_dieharder.py   | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 support/testing/tests/package/test_dieharder.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 7aa5980df7..1bf1969ac6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1737,6 +1737,7 @@ F:	support/testing/tests/package/sample_python_pyalsa.py
 F:	support/testing/tests/package/sample_python_spake2.py
 F:	support/testing/tests/package/test_ddrescue.py
 F:	support/testing/tests/package/test_ddrescue/
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
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
