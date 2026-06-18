Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF72CD98F9
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 12:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF420413EF;
	Thu, 18 Jun 2026 12:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sOIly4N_nY2p; Thu, 18 Jun 2026 12:50:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0D504141C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781787017;
	bh=sGrie8WNTTeCPMcB6cksMkglBWt9crJVIRsnMUdHiKk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ChZKzCvc2oyR4eMy6mesH9tLl1+Tsu84zWfFvUllMj8MH3yp5ueenrNgUUbhqnTM+
	 eQWrN9nE7Jj3DkVJtXix2XKP8eQ9GBSJLp4mXajZM48HRlWRBFDP62+NaMxWAowO4I
	 IlFBalIqY81qnL4AJZinmgcGTRrZAs68V0vvXHrf5EKrSn62W1DQG20CfjUxvrRPtI
	 qjYI457U4LaMfg2CZrqt1vPJgYE3KQFCmhsW3wqfxmgSxLXSoyaMvqSP3zPSHJjnCM
	 SEdUL+0d67/LWvsR75s78kE0EIAR21PrGUHgWRw2abl6lZuJS82ENtdDQHIQ2V80fG
	 Zy4eg4HyHi16w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0D504141C;
	Thu, 18 Jun 2026 12:50:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 77A55131
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D53041417
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O8IoVksAFRCL for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 12:50:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 48BCB41415
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48BCB41415
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 48BCB41415
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:12 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1986216859; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 12:49:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1waCBo-0000000CJud-1FGG;
 Thu, 18 Jun 2026 14:49:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 14:48:01 +0200
Message-ID: <20260618124835.2935850-10-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260618124835.2935850-1-peter@korsgaard.com>
References: <20260618124835.2935850-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=K3mY7WxOlnRRLe2p2MYS5gafw2BfBHpgSJpv62FRQh6zbVnb2UZinryStpI24FJf2NQFrl6eoLmYzUf1dW8I7NM2esNlLOwLslo26SAVF1cg/Sh4BmpS21GiiknEnwCWfNm3gkxQrZByGKCvtqvrWTai4S4ZmaiStGYJ7NTZb2XBf5n3mSi8A4f5Yr6GELgcEtGSkxEqHhBNUaDGkP/zJ9ZONI08CidhKE7YRjQ6FQBCJgt6cfQ6trm2ZvorD/roRPSGeaOWzojQW9tc4QYrkoH9kmbfBG+g0Xc/1TSLQBQaqIQL0KCc5tytKLJA6OcKoHzxWAtsxUpgFZTsp5G/NQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=e73gs+69RxdtAJkzLDq0rjP3/564gnkiDzIgiTCQDYw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=K3mY7WxO
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 10/29] support/testing: test_fping.py: use
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
 support/testing/tests/package/test_fping.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_fping.py b/support/testing/tests/package/test_fping.py
index 507c4ce73b..e8aba653f1 100644
--- a/support/testing/tests/package/test_fping.py
+++ b/support/testing/tests/package/test_fping.py
@@ -41,5 +41,4 @@ class TestFping(infra.basetest.BRTest):
         self.assertRunOk("ip route add to prohibit 192.168.12.0/24")
 
         # We expect fping to fail when pinging the prohibited network.
-        _, ret = self.emulator.run("fping 192.168.12.34")
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk("fping 192.168.12.34")
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
