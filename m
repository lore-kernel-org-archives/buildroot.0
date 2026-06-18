Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D28CD98F2
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 12:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F66E41426;
	Thu, 18 Jun 2026 12:50:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PNZrWu6EsfSv; Thu, 18 Jun 2026 12:50:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD492413C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781787012;
	bh=yfIG6cVQNkJArMmmvg0/7DP2o5KycQjHUn8j7J+35VI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V/TS+MTk6smmROg1ibPvHFMcl2g+z3kn+KKNSmvChajspCTpt2DOX6Tjy8yRzxQE6
	 tkPhNRjRXwZQdguDVbjItL7zwcmt/x0h5lyTBc4Yl7d6Ggo/IogxGk8hC0MD7HfRW3
	 qd+0j54Roup9lJUdX7KMlJ14Dju6ufaO3JEveBtkbsSENoi1EQPWxyA7upBlz99o4N
	 EfbWvNTHum2E1xwV58DSKu3sOAi+WNYpV8hWpatK6NExO5YwdhSUYMYsDlrpWplSlM
	 9whf2kVcditqo7QsNG8Mfgti0O2sGE9CH9FgdhqLciqPE6XcG22eUl8RFSpOvj9j9J
	 jdM15guEOefVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD492413C8;
	Thu, 18 Jun 2026 12:50:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 950A5131
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B52740DA1
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Ruq3HeFV7Je for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 12:50:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6A0684063F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A0684063F
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6A0684063F
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:09 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1830702408; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 12:49:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1waCBn-0000000CJuP-15DR;
 Thu, 18 Jun 2026 14:49:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 14:47:59 +0200
Message-ID: <20260618124835.2935850-8-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260618124835.2935850-1-peter@korsgaard.com>
References: <20260618124835.2935850-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=n5F8gdxuP9ija+fmIZ22CI4ovg0HWa4FaUOUua5gJdFDf6/7BKX5QiiLOpIF89dYsGtkjDOne0hL9eAoGOr0Qs+U1h8Bl0Pw5QoRhOqY1EQcLB+ymXZJAv1AC/7oEm4gWXNlRZ5R7kjvzFV0Kd36BN54+L4SbyprCg9VNrZY3lLytUomOrB4pD4cKDMtueoBS6IvCHrVDdCtbMWQgJx6FYbpNm8luFRdpLvuDfH/R6m46IaXvzAsK9UFLf1cBmqbAAI24ZKjzoTSbID3Nc9wear1HISHESoJGmg9N3TGYnZy9XGxVd7djmjfYFg6ucMeuE8DIAi0JwH0vb6mXHF0FA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=yhO9575uZVsQV+keMqtib+peyGz13feA0gh01OEcNmQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=n5F8gdxu
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 08/29] support/testing: test_ddrescue.py: use
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_ddrescue.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_ddrescue.py b/support/testing/tests/package/test_ddrescue.py
index bd34694737..e7e71fefda 100644
--- a/support/testing/tests/package/test_ddrescue.py
+++ b/support/testing/tests/package/test_ddrescue.py
@@ -70,8 +70,7 @@ class TestDdrescue(infra.basetest.BRTest):
 
         # A normal 'dd' is expected to fail with I/O error
         cmd = f"dd if={dm_dev} of=/dev/null bs=512"
-        _, exit_code = self.emulator.run(cmd)
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk(cmd)
 
         # Where a normal 'dd' fails, 'ddrescue' is expected to succeed
         self.assertRunOk(f"ddrescue {dm_dev} {ddrescue_img}")
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
