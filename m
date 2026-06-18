Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07810CD98F2
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 12:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2B464143C;
	Thu, 18 Jun 2026 12:50:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JvIIcePFHCiL; Thu, 18 Jun 2026 12:50:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3764417B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781787043;
	bh=kUUAXFhj38Uuq5eeazduZB0RK29pjSu/2CDst9TUvFY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jmapSDuszx/+NPPiyngg6mhGob8mOUnJOv3fi23zvXCU9TqIYf7CgHOeWjkFhcZ5Y
	 iuqxF+2+iY0JpRX+SmTb1V84WgEgcUXPhLcVY5pmEnxtNSC98qelw5/vtg2JJe9CPR
	 JCwNjkmFY8i3P9jK5ONqpRfegL7qi3surqDzP1HvwT9zaihDa1VGMC/3C8wb1fsySF
	 mICl/bpqza4Y84Git2jxfBizTpjVS/QZezKNC8sCt2xguX2v0n5HLYPraRQ3LEp5Uq
	 IRA1gfnCesXPt+57r8sVZql0L5kfMruee10lcyVRqXYrI9xrhUIhWi9Yds4f6guQPn
	 di31EY46gxXlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3764417B9;
	Thu, 18 Jun 2026 12:50:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 78DC6131
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DE5D41789
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M_ej7yKbtlnG for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 12:50:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4457F4177C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4457F4177C
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4457F4177C
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:38 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1867122570; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 12:49:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1waCBx-0000000CJwc-0PZ4;
 Thu, 18 Jun 2026 14:49:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 14:48:18 +0200
Message-ID: <20260618124835.2935850-27-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260618124835.2935850-1-peter@korsgaard.com>
References: <20260618124835.2935850-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=byfnl5phhDjHkzN87TppRHjFTke7w5Zgc+kCRJZalAfChIhRBCdAGzpVn5OM6n3JQSO/IiTAUz6kKKotDhCtYMinH/4SAtbVksbiy8kRySwUtzVdp1DawjuiDVghFHR5wOXHGraArQ4YZwkbMLw8GW0tqMN3rL/h7owu/5RwgRoQ7yG4vR/J/DC3v8/2i5SSarqkKgouhGDJbuqa54/0XKSQpjZoe1L20DMhTxziJ65XqbyOE+ZgIEm0Y3PehZHO1uT41j9XJ5SKHTSzZCWufXxTp7ZUxQKd0YMxrsLuVgZ5I0nO+yyAys/IgoiQzGPmNlcsHYOxVl9QyCWcVcBCBA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=1Jg7lGkD0f4jCfnNfuNe2sAYJ3qNS4w8vjZhVVVvDTY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=byfnl5ph
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 27/29] support/testing: test_usbip.py: use
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
 support/testing/tests/package/test_usbip.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_usbip.py b/support/testing/tests/package/test_usbip.py
index da94d6f92c..2fae8f7f6a 100644
--- a/support/testing/tests/package/test_usbip.py
+++ b/support/testing/tests/package/test_usbip.py
@@ -56,8 +56,7 @@ class TestUsbIp(infra.basetest.BRTest):
 
         # The daemon is not running yet. Listing remote devices is
         # expected to fail.
-        _, ret = self.emulator.run("usbip list --remote=127.0.0.1")
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk("usbip list --remote=127.0.0.1")
 
         # We start the USBIP daemon.
         self.assertRunOk("usbipd -D")
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
