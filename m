Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEB1C54E58
	for <buildroot@archiver.kernel.org>; Fri, 15 Mar 2024 21:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB7B8417C6;
	Fri, 15 Mar 2024 21:05:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fe7GI9cSwMEe; Fri, 15 Mar 2024 21:05:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A06F417D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A06F417D1;
	Fri, 15 Mar 2024 21:05:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9F7B11BF389
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 21:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A76F608F7
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 21:05:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pjwkk5Q4nrpu for <buildroot@lists.busybox.net>;
 Fri, 15 Mar 2024 21:05:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 20A8560637
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20A8560637
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 20A8560637
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 21:05:22 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D2822B00548;
 Fri, 15 Mar 2024 22:05:17 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 15 Mar 2024 22:05:01 +0100
Message-ID: <20240315210501.807023-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1710536719;
 bh=wfLTDDw6iyozrjrkvsCBu6woWuSPjCcVDVrS26iDK4c=;
 h=From:To:Cc:Subject:Date:From;
 b=AM6ZSG5Ryf4uzhteZfITCmPTkiCduReXNh5BJa5eVCkzxnhbxlVoHF/v5H3r+6Z2p
 F13tGC3xE/IivQOmF+73qNJTAV2CJJy3iihBOHPbplDZiMkFA24YUGd1r5yzo89uXk
 7GLWUYb1XiLiIl3rcGgzm078QHvQGhRx9DtTVxwkiZmd6QfzFumYmpnZravFFFxIO4
 duaTAWUvpcT4Frhm8BRWhPzV2dXU78Y8HFYQ7mcpuTvy7aaniTRmzAoRl+wt/on3Br
 zdlMwNK5CXSaD5B+lYla9IesI359snepdsJMOypQwTSiTidydiwsjHmM7DKgf2sJd0
 w4j7s0KbJMQwA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=AM6ZSG5R
Subject: [Buildroot] [PATCH 1/1] support/testing: add bitcoin runtime test
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
Note:
In order to work, this patch needs the bitcoin wallet support
proposed in:
https://patchwork.ozlabs.org/project/buildroot/patch/20240312183836.411083-1-ju.o@free.fr/
---
 DEVELOPERS                                    |   1 +
 support/testing/tests/package/test_bitcoin.py | 184 ++++++++++++++++++
 2 files changed, 185 insertions(+)
 create mode 100644 support/testing/tests/package/test_bitcoin.py

diff --git a/DEVELOPERS b/DEVELOPERS
index a6364cdd441..3f6a3ccf4f2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1770,6 +1770,7 @@ F:	support/testing/tests/package/test_acpica.py
 F:	support/testing/tests/package/test_acpica/
 F:	support/testing/tests/package/test_apache.py
 F:	support/testing/tests/package/test_bc.py
+F:	support/testing/tests/package/test_bitcoin.py
 F:	support/testing/tests/package/test_brotli.py
 F:	support/testing/tests/package/test_bzip2.py
 F:	support/testing/tests/package/test_compressor_base.py
diff --git a/support/testing/tests/package/test_bitcoin.py b/support/testing/tests/package/test_bitcoin.py
new file mode 100644
index 00000000000..93aa9383ab6
--- /dev/null
+++ b/support/testing/tests/package/test_bitcoin.py
@@ -0,0 +1,184 @@
+import os
+import time
+
+import infra.basetest
+
+
+class TestBitcoin(infra.basetest.BRTest):
+    # infra.basetest.BASIC_TOOLCHAIN_CONFIG cannot be used as it does
+    # not include BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+    # needed by bitcoin. This config also uses an ext4 rootfs as
+    # bitcoind needs some free disk space to start (so we avoid having
+    # a larger initrd in RAM).
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.81"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_PACKAGE_BITCOIN=y
+        BR2_PACKAGE_BITCOIN_WALLET=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+    # Command prefix for the bitcoin command line interface.
+    cli_cmd = "bitcoin-cli -regtest"
+
+    def create_btc_wallet(self, wallet_name):
+        """Create an empty wallet."""
+        cmd = f"{self.cli_cmd} -named createwallet wallet_name={wallet_name}"
+        self.assertRunOk(cmd)
+
+    def gen_btc_address(self, wallet_name):
+        """Generate an address in a wallet."""
+        cmd = f"{self.cli_cmd} -rpcwallet={wallet_name} getnewaddress"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        return out[0]
+
+    def init_wallet(self, wallet_name):
+        """Create a wallet and generate an address in it."""
+        self.create_btc_wallet(wallet_name)
+        return self.gen_btc_address(wallet_name)
+
+    def get_wallet_balance(self, wallet):
+        """Return the (confirmed) balance of a wallet."""
+        cmd = f"{self.cli_cmd} -rpcwallet={wallet} getbalance"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        return float(out[0])
+
+    def get_wallet_unconfirmed_balance(self, wallet):
+        """Return the unconfirmed balance of a wallet."""
+        cmd = f"{self.cli_cmd} -rpcwallet={wallet} getunconfirmedbalance"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        return float(out[0])
+
+    def get_block_count(self):
+        """Returns the height of the most-work fully-validated chain."""
+        cmd = f"{self.cli_cmd} getblockcount"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        return int(out[0])
+
+    def test_run(self):
+        drive = os.path.join(self.builddir, "images", "rootfs.ext4")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["root=/dev/vda console=ttyAMA0"],
+                           options=["-M", "virt",
+                                    "-cpu", "cortex-a53",
+                                    "-m", "256M",
+                                    "-drive", f"file={drive},if=virtio,format=raw"])
+        self.emulator.login()
+
+        # Values for the test.
+        wallet1 = "AliceWallet"
+        wallet2 = "BobWallet"
+        btc_test_amount = 10
+        btc_fee = 0.00001
+        req_blk_count = 101
+
+        # Check the binary can execute.
+        self.assertRunOk("bitcoind --version")
+
+        # This cleanup is useful when run-test -k is used. It makes
+        # this test idempotent. Since the drive storage is preserved
+        # between reboots, this cleanup will make sure the test always
+        # starts from a clean state.
+        cmd = "rm -rf ~/.bitcoin"
+        self.assertRunOk(cmd)
+
+        # The bitcoin daemon is not started. A client ping is expected
+        # to fail.
+        ping_cmd = f"{self.cli_cmd} ping"
+        _, ret = self.emulator.run(ping_cmd)
+        self.assertNotEqual(ret, 0)
+
+        # Start the daemon.
+        cmd = f"bitcoind -regtest -daemonwait -fallbackfee={btc_fee:f}"
+        self.assertRunOk(cmd)
+
+        time.sleep(2 * self.timeout_multiplier)
+
+        # Now the daemon is started, the ping is expected to succeed.
+        self.assertRunOk(ping_cmd)
+
+        # We create two wallets and addresses.
+        btc_addr1 = self.init_wallet(wallet1)
+        btc_addr2 = self.init_wallet(wallet2)
+
+        # Since the regression test block chain is at its genesis
+        # block, we expect a height of zero.
+        cur_blk_cnt = self.get_block_count()
+        self.assertEqual(cur_blk_cnt, 0)
+
+        # We also expect our wallets to be empty.
+        for wallet in [wallet1, wallet2]:
+            balance = self.get_wallet_balance(wallet)
+            self.assertAlmostEqual(balance, 0.0)
+
+        # We request the generation of several blocks for address
+        # #1. We should receive the 50 BTC reward at this address.
+        cmd = self.cli_cmd
+        cmd += f" generatetoaddress {req_blk_count} {btc_addr1}"
+        self.assertRunOk(cmd)
+
+        # We should now see the previously created blocks.
+        cur_blk_cnt = self.get_block_count()
+        self.assertEqual(cur_blk_cnt, req_blk_count)
+
+        # We should also see the 50 BTC reward in the wallet #1.
+        balance = self.get_wallet_balance(wallet1)
+        self.assertAlmostEqual(balance, 50.0)
+
+        # The wallet #2 should still be empty.
+        balance = self.get_wallet_balance(wallet2)
+        self.assertAlmostEqual(balance, 0.0)
+
+        # We send an amount from wallet #1 to #2.
+        cmd = f"{self.cli_cmd} -rpcwallet={wallet1}"
+        cmd += f" sendtoaddress {btc_addr2} {btc_test_amount}"
+        self.assertRunOk(cmd)
+
+        # The wallet #1 balance is expected to be subtracted by the
+        # spent amount and the transaction fees.
+        expected_balance = 50 - btc_test_amount - btc_fee
+        balance = self.get_wallet_balance(wallet1)
+        self.assertAlmostEqual(balance, expected_balance, places=4)
+
+        # The transaction is sent, but not confirmed yet. So we should
+        # still see a (confirmed) balance of zero.
+        balance = self.get_wallet_balance(wallet2)
+        self.assertAlmostEqual(balance, 0.0)
+
+        # We should see the transferred amount in the unconfirmed
+        # balance.
+        balance = self.get_wallet_unconfirmed_balance(wallet2)
+        self.assertAlmostEqual(balance, btc_test_amount)
+
+        # We generate 1 block to address #2. This action will confirm
+        # the previous transaction (but this will not give the 50 BTC
+        # reward).
+        cmd = f"{self.cli_cmd} generatetoaddress 1 {btc_addr2}"
+        self.assertRunOk(cmd)
+
+        # We should see one more block.
+        cur_blk_cnt = self.get_block_count()
+        self.assertEqual(cur_blk_cnt, req_blk_count + 1)
+
+        # We should now see the amount in the confirmed balance.
+        balance = self.get_wallet_balance(wallet2)
+        self.assertAlmostEqual(balance, btc_test_amount)
+
+        # The unconfirmed balance should now be zero.
+        balance = self.get_wallet_unconfirmed_balance(wallet2)
+        self.assertAlmostEqual(balance, 0.0)
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
