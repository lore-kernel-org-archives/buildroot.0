Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF81C27C44
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 19:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 824F68421B;
	Sat,  1 Jun 2024 19:37:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WNFtEl-57EYU; Sat,  1 Jun 2024 19:37:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8207984231
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8207984231;
	Sat,  1 Jun 2024 19:37:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9084E1BF2C2
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 19:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89D0740490
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 19:37:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cIavC0BE5s3S for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 19:37:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 662924013D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 662924013D
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 19:37:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 417DB875EB; Sat,  1 Jun 2024 19:37:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Jun 2024 21:35:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a6784999b23cbe156d63177bf283b844d76aa4e6
X-Git-Newrev: 5806419b9150e7d019a2a8fe13f184c6943cc171
X-Patchwork-Hint: ignore
Message-Id: <20240601193707.417DB875EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add mtd test
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

commit: https://git.buildroot.net/buildroot/commit/?id=5806419b9150e7d019a2a8fe13f184c6943cc171
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
[yann.morin.1998@free.fr:
  - don't set an empty BR2_ENABLE_LOCALE_WHITELIST
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
