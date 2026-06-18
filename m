Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38339CD98F7
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 12:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDC4A41400;
	Thu, 18 Jun 2026 12:50:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cUqgzIWU25i7; Thu, 18 Jun 2026 12:50:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF728413F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781787009;
	bh=DI6g9LKah50Y0kyHDWb5y9dP8EIIapLq6UwoJwa2Zek=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Ftsn8yWX2rIDfuRf8nfA1/sOZ9ye/fO11FbHGPV1XDeaTGvaMZZkHscxVsxePBt9y
	 FtKo/ZcRhxUThgb7BCjW4JxTwGkwondPSIdqnJLQP7fVphEiP2HdSf03I/VVv2YImb
	 qUtvty9yXvNM267uay3NuZR0UeCiVC89y5i209x4C5ZmPsgB5kr8mVXe11XDSa4O9X
	 Le/3zb/Xk45E92e0rMSaX3Lnhx7QfeCE5fiwLejDUMRFNyBBuRVvUp664i4l/FX0jx
	 Jrm+K7eGFqkqsa0necDkEhjuBkLSpZbHT6APh7db2nXq/+mSUxUqN1EV3c+zYdW91b
	 cHQU2qSVmekLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF728413F4;
	Thu, 18 Jun 2026 12:50:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 804A31F3
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E0D740DA1
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bs2hOa2lPa1a for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 12:50:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 75E3D4063F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75E3D4063F
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75E3D4063F
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:06 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2021711152; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 12:49:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1waCBm-0000000CJuB-0yC7;
 Thu, 18 Jun 2026 14:49:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 14:47:57 +0200
Message-ID: <20260618124835.2935850-6-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260618124835.2935850-1-peter@korsgaard.com>
References: <20260618124835.2935850-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=EYQ8JUVyeFz1OjYrRGe3+B6NojoNqw1GmbVsk3HIxtvQpVdVy91Uj/ZOP2rsEznbJDjlzNzCiMDytPvvcyJOK9pDF0MBmwUM7rcSn+zwKYd342olNXMDqTmqgSJp6Gt6ZqG0VFrXRSL2KXw/teTBgmu0Rc05PWO+y1i8cdNhL2jtIlfnOdZdwtSjtFbGmt2nz446gj40T7+GnOkA2NBXi6GnMhH7LBO7APD7Wla03cozhQhEpRHU0mpLJC/Pq/OwuPRT/+cpczV3Ih/7JLCBlHYZop2PsiDYVXzhhwHdwO3Ol3BBhk6zH+Yf1m2yMCwfqRBQ7BaTv96xFCsLtcZj7Q==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=1Pt/JcG2o+Lgl11A+7PWlqbhXFCBY3/9l4WLsY1VEw4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=EYQ8JUVy
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 06/29] support/testing: test_connman.py: use
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
 support/testing/tests/package/test_connman.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_connman.py b/support/testing/tests/package/test_connman.py
index 6fef95104c..2e53135208 100644
--- a/support/testing/tests/package/test_connman.py
+++ b/support/testing/tests/package/test_connman.py
@@ -47,8 +47,7 @@ class TestConnMan(infra.basetest.BRTest):
 
         # If we try to ping again the qemu gateway,
         # it should now fail.
-        _, ret = self.emulator.run(ping_cmd)
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk(ping_cmd)
 
         # We ask connman to re-enable Ethernet.
         self.assertRunOk("connmanctl enable ethernet")
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
