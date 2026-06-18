Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD987CD98F3
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 12:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A01D41456;
	Thu, 18 Jun 2026 12:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DbGXXOq4niro; Thu, 18 Jun 2026 12:50:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32E33410EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781787020;
	bh=CxoysVLFEdKNAtrIfENgYCTPV0a7TRDL5re/RJsqgqY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=p1BN/IcNmcjXQnwU7vBNCv2l9uvLVQqMkU7dmwyRm11J/2FGKzhCVcxt4mdb6hPxG
	 47c+JfTwbTXM0YVNlqOl13sSthsLTAQvvVWMVYIo/16Y1a8B0gmbfHiH1BT9r6h7qU
	 Be44wxEAryLnP66nLICbOPtjnuBo5d3DAOD8N9gIKFw1hDyMlvACwmkBwmh74XNKZt
	 TZ7vKDsS/ArN2svg5WrvUB88n2nh1NNkToPxS2Q8D0MBAmEeCRgyYco7/Jx55r3BJS
	 VEEJNYnsGEEyYPvKaNUHjiYz4HvsutkAMISwzNyq/hrArd1ZKP4anojzDgjZhGqfQX
	 V6sZs4pXGd7cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32E33410EE;
	Thu, 18 Jun 2026 12:50:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 87BC61F3
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D6814142A
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1xSyYn7aYS5R for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 12:50:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E51A141421
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E51A141421
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E51A141421
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:14 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 758002752; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 12:49:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1waCBp-0000000CJur-1Np9;
 Thu, 18 Jun 2026 14:49:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 14:48:03 +0200
Message-ID: <20260618124835.2935850-12-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260618124835.2935850-1-peter@korsgaard.com>
References: <20260618124835.2935850-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=TBSvVfxjopRMltK3bUC6DHLK1xHntUmJBxh/IQPt/dXP74mQnuSUhKhY2vor3EEdciCoUmeN7VNm+6FcWL6kZnPX8xjiig2L7dsDrEW/aKEitNup6Y50f2A89phw6/hYIRRyi11WXBa5UEqMM0pMFpSsz6gJCi8gYRIxrebxczw6iOdgcPCsClkowkUTm5Y4FD5mFeENbmEf7km4ni56DVhT+zBnCCNBPO3TYzsOSLn4FgEDyWcAs3Exuw4gcDdBIce40oa4iQgatIGf0Ig2YOt7Z2Sx4QuYoyx3zT/qVpfkP8tm91AU52LDGRqFOYYuMRYH3RaXUBbda6rlaK3zWg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=FVNeJUKU8+157mNRWLmA5UQO3hxSBP6WVLX+zpdFz2A=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=TBSvVfxj
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 12/29] support/testing: test_iproute2.py: use
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
 support/testing/tests/package/test_iproute2.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/package/test_iproute2.py b/support/testing/tests/package/test_iproute2.py
index 91d9006e23..78f8dc291e 100644
--- a/support/testing/tests/package/test_iproute2.py
+++ b/support/testing/tests/package/test_iproute2.py
@@ -46,8 +46,7 @@ class TestIpRoute2(infra.basetest.BRTest):
         for addr in addrs:
             self.assertRunOk(f"{ping_cmd} {addr}")
         # ...but the IP outside is supposed to fail.
-        _, ret = self.emulator.run(f"{ping_cmd} 127.1.2.3")
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk(f"{ping_cmd} 127.1.2.3")
 
         # We add a prohibited route.
         self.assertRunOk("ip route add prohibit 127.0.1.0/24")
@@ -57,8 +56,7 @@ class TestIpRoute2(infra.basetest.BRTest):
         # ...while the other IPs expected to fail.
         addrs = ["127.0.1.2", "127.1.2.3"]
         for addr in addrs:
-            _, ret = self.emulator.run(f"{ping_cmd} {addr}")
-            self.assertNotEqual(ret, 0)
+            self.assertRunNotOk(f"{ping_cmd} {addr}")
 
         # We should be able to see our prohibited route.
         out, ret = self.emulator.run("ip route list")
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
