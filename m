Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54ED7C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 19:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22D4284711;
	Sat,  8 Jun 2024 19:15:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zgmd5ZbaHLaL; Sat,  8 Jun 2024 19:15:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D340B84764
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D340B84764;
	Sat,  8 Jun 2024 19:15:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1AF441BF407
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B63DF403C0
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p66SH9-HmhMx for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 19:14:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4B9540364
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4B9540364
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 19:14:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A08B6814F1; Sat,  8 Jun 2024 19:14:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 18:54:51 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 6c2a12f96d4c94c69f191e32124250b5deb3e2bb
X-Git-Newrev: bb0164a6d27d6513033f41c6418164b887430174
X-Patchwork-Hint: ignore
Message-Id: <20240608191459.A08B6814F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/testing: add mtd
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bb0164a6d27d6513033f41c6418164b887430174
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
[yann.morin.1998@free.fr:
  - don't set an empty BR2_ENABLE_LOCALE_WHITELIST
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5806419b9150e7d019a2a8fe13f184c6943cc171)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_mtd.py | 47 +++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/support/testing/tests/package/test_mtd.py b/support/testing/tests/package/test_mtd.py
new file mode 100644
index 0000000000..bdb09c39ec
--- /dev/null
+++ b/support/testing/tests/package/test_mtd.py
@@ -0,0 +1,47 @@
+import os
+
+import infra.basetest
+
+
+class TestMtd(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_MTD=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_TARGET_ROOTFS_CPIO=y
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+
+        self.emulator.login()
+
+        mtd = "/dev/mtd0"
+        erasesize = 256 * 1024
+        test_sectors = 4
+        test_size = erasesize * test_sectors
+
+        output, exit_code = self.emulator.run(f"mtd_debug info {mtd}")
+        output = [x.strip() for x in output if x.strip()]
+        self.assertEqual(output, [
+            "mtd.type = MTD_NORFLASH",
+            "mtd.flags = MTD_CAP_NORFLASH",
+            "mtd.size = 134217728 (128M)",
+            "mtd.erasesize = 262144 (256K)",
+            "mtd.writesize = 1",
+            "mtd.oobsize = 0",
+            "regions = 0",
+        ])
+
+        # Test flashcp
+        self.assertRunOk(f"dd if=/dev/urandom of=random.bin bs={test_size} count=1")
+        self.assertRunOk(f"flashcp random.bin {mtd}")
+        self.assertRunOk(f"cmp -s -n {test_size} random.bin {mtd}")
+
+        # Test flash_erase
+        self.assertRunOk(f"dd if=/dev/zero bs={test_size} count=1 | tr '\\000' '\\377' >nor-erase.bin")
+        self.assertRunOk(f"flash_erase {mtd} 0 {test_sectors}")
+        self.assertRunOk(f"cmp -s -n {test_size} nor-erase.bin {mtd}")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
