Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1EA1CCD1A5
	for <buildroot@archiver.kernel.org>; Sun, 26 Oct 2025 13:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 427B940F5F;
	Sun, 26 Oct 2025 13:36:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KlY-TDXr8MXh; Sun, 26 Oct 2025 13:36:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DDF840F60
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DDF840F60;
	Sun, 26 Oct 2025 13:36:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CD84315F
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 13:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6659403AD
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 13:36:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xEUYaBqdEB8F for <buildroot@buildroot.org>;
 Sun, 26 Oct 2025 13:36:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A08D240084
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A08D240084
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A08D240084
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 13:36:11 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:7427:ac55:2702:f075])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id EF61C5FFAF;
 Sun, 26 Oct 2025 14:36:06 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	Bernd Kuhls <bernd@kuhls.net>
Date: Sun, 26 Oct 2025 14:35:51 +0100
Message-ID: <20251026133551.583220-1-ju.o@free.fr>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761485769;
 bh=vzxlm4My8oJcUU60vhvLj3mAHMz/UTl8HLhibw/kKL4=;
 h=From:To:Cc:Subject:Date:From;
 b=a8L6C3Yu5FniNICD9P/LCYmVPyoGUz+8ExSPLdJEa5NvY7wUmPVh4BLPtlmspgm3g
 aqx64PNLeOQOzSRhSzRBvVR7CepQlblps5DoqGiJXcwt8Vw6GunRPqYErC8wY+sIti
 Vqx0RLcU05op4IXM8wDo05MUxOEQ0oJg9FSdCC7uLHsPLtj67+p0Tl143jyejRLxZe
 IVM7mCU0M5/+x2L5ZX7YJkhlRKrPVjz+tf9GIJ7Yy/VfNWuDoaqsQO8GoxmFZmUblP
 U+UYbdoLdcpTRRBYsDGKp2lleu31Vf7iRzEzPwDes/Bf9xGYWtmAL6BB3Om2cFoHT1
 D1FNVjtgizfhQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=a8L6C3Yu
Subject: [Buildroot] [PATCH 1/1] support/testing: package: bitcoin: replace
 deprecated wallet rpc calls
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

The getunconfirmedbalance rpc call was marked as deprecated
in [1] (included in v0.19.0, released on 2019-11-08) and removed
in [2] (included in v30.0, released on 2025-10-09).

This commit replaces the old getbalance/getunconfirmedbalance rpc
calls with the new call getbalances (plural) returning a json
object containing all the data.

This commit is needed before updating bitcoin to v30.0.

[1] https://github.com/bitcoin/bitcoin/commit/facfb4111d14a3b06c46690a2cca7ca91cea8a96
[2] https://github.com/bitcoin/bitcoin/commit/c3fe85e2d6dd4f251a62a99fd891b0fa370f9712

Cc: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested with:
bitcoin v28.0, current Buildroot version, in:
https://gitlab.com/jolivain/buildroot/-/jobs/11855409507

bitcoin v30.0, with Bernd patch from:
https://patchwork.ozlabs.org/project/buildroot/patch/20251020200539.2656292-1-bernd@kuhls.net/
in:
https://gitlab.com/jolivain/buildroot/-/jobs/11855410715
---
 support/testing/tests/package/test_bitcoin.py | 25 ++++++++++++-------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/support/testing/tests/package/test_bitcoin.py b/support/testing/tests/package/test_bitcoin.py
index 1f00345a12..a942504af4 100644
--- a/support/testing/tests/package/test_bitcoin.py
+++ b/support/testing/tests/package/test_bitcoin.py
@@ -1,3 +1,4 @@
+import json
 import os
 import time
 
@@ -47,19 +48,25 @@ class TestBitcoin(infra.basetest.BRTest):
         self.create_btc_wallet(wallet_name)
         return self.gen_btc_address(wallet_name)
 
-    def get_wallet_balance(self, wallet):
-        """Return the (confirmed) balance of a wallet."""
-        cmd = f"{self.cli_cmd} -rpcwallet={wallet} getbalance"
+    def get_wallet_balances(self, wallet):
+        """Return the balances of a wallet."""
+        cmd = f"{self.cli_cmd} -rpcwallet={wallet} getbalances"
         out, ret = self.emulator.run(cmd)
         self.assertEqual(ret, 0)
-        return float(out[0])
+        balances = json.loads("".join(out))
+        return balances
+
+    def get_wallet_balance(self, wallet):
+        """Return the (confirmed) balance of a wallet."""
+        balances = self.get_wallet_balances(wallet)
+        balance = balances["mine"]["trusted"]
+        return balance
 
     def get_wallet_unconfirmed_balance(self, wallet):
-        """Return the unconfirmed balance of a wallet."""
-        cmd = f"{self.cli_cmd} -rpcwallet={wallet} getunconfirmedbalance"
-        out, ret = self.emulator.run(cmd)
-        self.assertEqual(ret, 0)
-        return float(out[0])
+        """Return the untrusted pending (unconfirmed) balance of a wallet."""
+        balances = self.get_wallet_balances(wallet)
+        untrusted_balance = balances["mine"]["untrusted_pending"]
+        return untrusted_balance
 
     def get_block_count(self):
         """Returns the height of the most-work fully-validated chain."""
-- 
2.51.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
