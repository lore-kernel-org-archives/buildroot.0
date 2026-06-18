Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EABD3CD98F7
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 12:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3729417DD;
	Thu, 18 Jun 2026 12:50:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eb-4xXE_nl7F; Thu, 18 Jun 2026 12:50:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02F99417C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781787045;
	bh=tXkQBz/CC8E235YfetvfKzMF+0RGQK97qpSgO15z3Sw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JZREhsGYRBo4WECNs/EQIwaE9vLfb6r+DTVGY5AWrXCIEBTcZMWrxHWbvYFPMgex0
	 p+jYJV9mPPIw4k0mTg9dP93xH7mYOBOOSFgWH/MbmiVF7Fe/iCfLMsTXft5XS6CzLr
	 ihFb953BduEc3M2HIF8IHJS5DElZ7BAQ+EZtM1E7rjwFwGqIx69h/iHofXiG8FO6Rj
	 2SZZ6EmMAOi4BeY7g3MkOeidrUVMhuFDMLk1XUPFrPyL77xOr9uPk/aX0fsdGTGOcq
	 Vd3JckBMoEYBp1DOvgYR9prm25Z35A3SG8SAUVhoxcY1d7aLUn3CmZ+mL08y4fsVV5
	 /LWiLM2PQVmLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02F99417C2;
	Thu, 18 Jun 2026 12:50:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E54E1F3
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24EB883C51
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VLoDqAuX9Igy for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 12:50:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 828A283C4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 828A283C4F
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 828A283C4F
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:39 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1014851905; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 12:49:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1waCBx-0000000CJwj-2b90;
 Thu, 18 Jun 2026 14:49:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 14:48:19 +0200
Message-ID: <20260618124835.2935850-28-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260618124835.2935850-1-peter@korsgaard.com>
References: <20260618124835.2935850-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=sDctjrihf894tzxhI9bIlWLyFC/ExGmM1XAi3ZKP8fhFlx1FGDDxxTuPOO0uzYU/OYssUPpzY3WdnNJxSHcN6yhnvJKivIcs+uEimK9zFrk/CxKKm09eTa4rnrGCLFiV8GDiFxAEqiTH8izHOfXlO0dTO9FxtmZJUihIP9JcOHDO8mw20GT0P/AtWpIrVHY/5R6asgrVr6R6dgbvSj+me1EEGVEsUGIH2RvVEIPnMBGbcF1awkccMGhCg9GA3AsVG4rAGWgWhtZU59ZQD+n+7wAaESCzfiEoLsj60r+U4oTLctJO791Qoaj7LyrxsvF5Fx3gf4AqnwpSSAkhpdLcQw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=9oAqAgAJ45VDYOwQN24a6/xkDhj5bHOH2vRfWIsdL3M=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=sDctjrih
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 28/29] support/testing: test_weston.py: use
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
 support/testing/tests/package/test_weston.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_weston.py b/support/testing/tests/package/test_weston.py
index c8b243a6a7..737015f8c4 100644
--- a/support/testing/tests/package/test_weston.py
+++ b/support/testing/tests/package/test_weston.py
@@ -150,5 +150,4 @@ class TestWeston(infra.basetest.BRTest, GraphicsBase):
 
         # Now weston is supposed to be stopped,
         # a simple client is expected to fail.
-        _, exit_code = self.emulator.run("wayland-info")
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk("wayland-info")
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
