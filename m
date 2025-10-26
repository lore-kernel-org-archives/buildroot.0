Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02713CCF9E5
	for <buildroot@archiver.kernel.org>; Sun, 26 Oct 2025 16:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B404E405C0;
	Sun, 26 Oct 2025 16:22:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GaI5lTpJZCST; Sun, 26 Oct 2025 16:22:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFE164065B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFE164065B;
	Sun, 26 Oct 2025 16:22:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A312CD7
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 16:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89AA5606D9
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 16:22:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qt25bHxhV7CK for <buildroot@buildroot.org>;
 Sun, 26 Oct 2025 16:22:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C71B1606AF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C71B1606AF
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 16:22:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B28B987943; Sun, 26 Oct 2025 16:22:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 26 Oct 2025 17:03:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 724bed5d4d032cd3e9371669d41dc3435652ed68
X-Git-Newrev: 632aade2c5830b2d07df7d81f978ffa17a06a0f4
X-Patchwork-Hint: ignore
Message-Id: <20251026162236.B28B987943@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: package: bitcoin: replace
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=632aade2c5830b2d07df7d81f978ffa17a06a0f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
 support/testing/tests/package/test_bitcoin.py | 25 ++++++++++++++++---------
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
