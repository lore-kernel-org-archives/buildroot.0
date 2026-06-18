Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613C3CD98F2
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 12:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E47D4177B;
	Thu, 18 Jun 2026 12:50:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f2mKXs3JIqDx; Thu, 18 Jun 2026 12:50:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14BED41461
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781787037;
	bh=iDTw1yEXWbdjE5hjCYWQ75rG9cbcN60i4CPp7AYPujY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QFjIPeMHLuvPRlr4S2c7AMzeKDKEoFadKBqN8/KeOLvODKzOgezvEO1fGb8t6ddGA
	 fej9zisBjIiIoPA4Pa3n95ksj2WWt6kPlJ6aQYDBuHDSR0Q5lJwwBZ36PnfHBo+gez
	 MjB/B8tDwwr+Al6PTokoV2H/jndatEAmaSy/y/6aAK1BZ+jEXW6Os0InD+OmlRq+GC
	 aj9bPHyuzY3mdrJTpyVCYjk3BKQtc4BCXmxdtfgT3wjnH8oSeSdSCmIAOYFZUx/cxd
	 VOsIeTtdGWZDnbuZWpUJRVYqNzEaGl321pp2nGUGxfeMo8q6kqAOsoR/K7xOPzeCB7
	 I006x9kQcxe/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14BED41461;
	Thu, 18 Jun 2026 12:50:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CBFD51F3
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA00840DA9
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BileI-oli0WY for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 12:50:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C57E34063F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C57E34063F
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C57E34063F
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:32 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1220131942; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 12:49:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1waCBv-0000000CJwA-08n8;
 Thu, 18 Jun 2026 14:49:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 14:48:14 +0200
Message-ID: <20260618124835.2935850-23-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260618124835.2935850-1-peter@korsgaard.com>
References: <20260618124835.2935850-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=o0R7Vcms1EFRHz/eplcusGRlVp6AzbzQrEKR7pHH4C97oyCSLrqB6ZuwGoV9Hd3SVhYgX1T5mTDsXLwVCT4mjJMMDHvmtC47LxE3NuD4w0YujmK9l3+Tk2jBOHGhgs2ugnEJJKXo7LNIuCdoNU/AGyBWBIEV1O1YGsHsqxF/5wLI2l6lLC8ilut+a+IFA3fT8TFU2IN6njSyOnFFdKJbiu/kpOhZoAZ2xkiN8UA7PzJeFdGqr7pFwDcfIYqFL5O5rBag/IolYle+5Xxp6Wig2MjYvFZFGkAHqSjjHzv16zatqgu3WJUvho7LA+N+fejmqr8NMKMsE7Xw5PfcksMjeA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=AsEqBUEr3V0HCfJRu9a4M+UnCKmwNigKq+syVP5KtJI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=o0R7Vcms
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 23/29] support/testing: test_postgresql.py: use
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
 support/testing/tests/package/test_postgresql.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_postgresql.py b/support/testing/tests/package/test_postgresql.py
index bd41fc3f1b..08926b0ffc 100644
--- a/support/testing/tests/package/test_postgresql.py
+++ b/support/testing/tests/package/test_postgresql.py
@@ -180,8 +180,7 @@ class TestPostgreSQL(infra.basetest.BRTest):
         self.assertRunOk(cmd)
 
         # Check the server is no longer ready.
-        _, exit_code = self.emulator.run("pg_isready")
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk("pg_isready")
 
         # Restart the server.
         cmd = f"su - {self.db_admin} -c 'pg_ctl start -D {self.pgdata_dir}'"
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
