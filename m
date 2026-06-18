Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DD3CD98F2
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 12:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3311041477;
	Thu, 18 Jun 2026 12:50:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rUJ5EfGYKPiM; Thu, 18 Jun 2026 12:50:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17E8041457
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781787022;
	bh=LQ4lGizXdIao07E6+jZO8/PXO6/szMXJPoJV1Egi1e0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GhPbo7z+lOZ2g16EjxpvdvT/DvqjmFX8So26o+9YPajkFTCwc0tz29sYiHb6buFDg
	 7b9LpFrkZ9s24tNYrcYMpPMv3DKxUNqdLSo/vJKeo1HKBSA0yNL0Fp33r46g4YM5O/
	 +spT042zhwWw1KCwKrz3R56cQbOs34lgH1sPPKYghuArjUVvWrwKQFzRPd1IdN8CoE
	 F3zd0h3gvZTRL6S/bKrRbQqZGkLKTFIDfkTzuzz/zKvwvStCy9nQ83w3ASPAxmZPZj
	 s/5c2Lt2KO85M7JgU/frgsPVFUZr7WhD+YRo3VZ3uSVl4h5VgqgRlEmep0pnfIx5qi
	 u4yvTYa4s+1pg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17E8041457;
	Thu, 18 Jun 2026 12:50:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B77BB131
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F43183C51
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kAeIAISv5HLp for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 12:50:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7447883C4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7447883C4F
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7447883C4F
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:17 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -992592721; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 12:49:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1waCBq-0000000CJv5-1WoH;
 Thu, 18 Jun 2026 14:49:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 14:48:05 +0200
Message-ID: <20260618124835.2935850-14-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260618124835.2935850-1-peter@korsgaard.com>
References: <20260618124835.2935850-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=FF+YYkCmOQhY4TfFppA9gm8CzjV0gZO+yDiII/8iKf7DaTbKtSFYd4R8RwkMwz+L22LDIAbfcmNjrGMVN9vbcn6ua/zIxm3saxZBMPEOSdBQN1bzmwCoNQxm/+7zPRXC/LxZn+y4drZa0ySxp0UCWdkN6wvv6Cl+O85jVU6MhFGtm/KqXbSvn2JlkP6S3lMOG2tcyCUZI0hx2HZIeJxRENsZLUYuM7wNGpwvHMtWZ3l9pFGN8czERCJr/BklD6WhMJm/Wmt5FefwaASdAMdLhgnkeUiVVHsLd7Ty+o0n65KPJ6eKH/JdtuN15L8nfdpjMDobMHj8XKgeRpwd/4F5CQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=+ZP6lA/HPqlhjDMMjknM6ihPr3Gq+ziajLTgfqR2xQM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=FF+YYkCm
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 14/29] support/testing: test_jq.py: use
 assertRunNotOk()
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_jq.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_jq.py b/support/testing/tests/package/test_jq.py
index 67420abb6b..ffa284ce31 100644
--- a/support/testing/tests/package/test_jq.py
+++ b/support/testing/tests/package/test_jq.py
@@ -34,8 +34,7 @@ class TestJq(infra.basetest.BRTest):
 
         # Check the execution fails on a non JSON file.
         cmd = "jq -M '.' broken.json"
-        _, ret = self.emulator.run(cmd)
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk(cmd)
 
         # Check an execution of a simple query. Note that output is a
         # JSON (quoted) string.
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
