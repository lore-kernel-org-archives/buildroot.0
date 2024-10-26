Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A64D10BFF
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 16:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07C5F81EA7;
	Sat, 26 Oct 2024 16:22:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MjoMzzKq2oX8; Sat, 26 Oct 2024 16:22:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BE048408A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BE048408A;
	Sat, 26 Oct 2024 16:22:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 75C495C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F6A960ED8
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:22:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hvs77miAfG9q for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 16:22:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95C9E60729
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95C9E60729
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:22:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 826DC83EB4; Sat, 26 Oct 2024 16:22:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 18:22:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 29a5475c9b6d1ffe36ab0d988ad7fef7a622f2f9
X-Git-Newrev: 859c4ea5f74f713777ffa980f1627b46a311bdd4
X-Patchwork-Hint: ignore
Message-Id: <20241026162217.826DC83EB4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: package: bitcoin: fix
 test by increasing timeouts
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=859c4ea5f74f713777ffa980f1627b46a311bdd4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Generating Bitcoins to an address can take longer than the current
timeout, on slow runners. This commit fixes this issue by increasing
the timeout on specific commands. This issue was also observed more
frequently on newer bitcoin-core version 28.0.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/7782083081

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_bitcoin.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_bitcoin.py b/support/testing/tests/package/test_bitcoin.py
index 93aa9383ab..1f00345a12 100644
--- a/support/testing/tests/package/test_bitcoin.py
+++ b/support/testing/tests/package/test_bitcoin.py
@@ -130,7 +130,7 @@ class TestBitcoin(infra.basetest.BRTest):
         # #1. We should receive the 50 BTC reward at this address.
         cmd = self.cli_cmd
         cmd += f" generatetoaddress {req_blk_count} {btc_addr1}"
-        self.assertRunOk(cmd)
+        self.assertRunOk(cmd, timeout=30)
 
         # We should now see the previously created blocks.
         cur_blk_cnt = self.get_block_count()
@@ -169,7 +169,7 @@ class TestBitcoin(infra.basetest.BRTest):
         # the previous transaction (but this will not give the 50 BTC
         # reward).
         cmd = f"{self.cli_cmd} generatetoaddress 1 {btc_addr2}"
-        self.assertRunOk(cmd)
+        self.assertRunOk(cmd, timeout=30)
 
         # We should see one more block.
         cur_blk_cnt = self.get_block_count()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
