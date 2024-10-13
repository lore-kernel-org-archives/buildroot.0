Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F050CF2579
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 16:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D895681027;
	Sun, 13 Oct 2024 16:48:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dpfGSnWqhkBE; Sun, 13 Oct 2024 16:48:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F20FB81120
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F20FB81120;
	Sun, 13 Oct 2024 16:48:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ACB8F1BF3AF
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 16:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A940180FFB
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 16:48:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5YoqNeRA6W1x for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 16:48:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8547C81027
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8547C81027
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8547C81027
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 16:48:25 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D91C7B00535;
 Sun, 13 Oct 2024 18:48:17 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 13 Oct 2024 18:47:59 +0200
Message-ID: <20241013164759.3729983-2-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241013164759.3729983-1-ju.o@free.fr>
References: <20241013164759.3729983-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1728838103;
 bh=b3lXCSO6fLLd2oOf0MtkTvfCpU1AEpo9+F+gQlvUY5g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=siV8JtIZIzXzoeVvLZosqa3mqgBkDpFp7HXwnU+HEiZxlbfayhWC2rNM5IH14EImG
 DDqXD5bKf7hun9VEewqH6uBvEQ+0TjkXmC//KSiG0yNyECQ0mlbXL3l+qvFTthtY6A
 uNfoRT9F2lUKZC9AdQRgoxal+M/AFjeqzkM+JhGL2/FD8jii71Jmo4vaJKV8APaIjL
 +gMFklCG7518qykho1mj/opUZp2kNzXquxtE57lKTa62esbD0GEQ9GPfHlYF5DVg/m
 yZohQGTE8dDT8a4IRb8tq2ghgC1gfBV1kGkvXjWbXwkGLAMaipDsfVzeHzQAG21Qge
 /1GQTdChy+seg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=siV8JtIZ
Subject: [Buildroot] [PATCH 2/2] support/testing: package: bitcoin: fix test
 by increasing timeouts
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
Cc: Fabio Urquiza <fabiorush@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Generating Bitcoins to an address can take longer than the current
timeout, on slow runners. This commit fixes this issue by increasing
the timeout on specific commands. This issue was also observed more
frequently on newer bitcoin-core version 28.0.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/7782083081

Signed-off-by: Julien Olivain <ju.o@free.fr>
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
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
