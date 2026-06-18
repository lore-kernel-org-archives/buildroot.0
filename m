Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6C8CD98F2
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 12:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 558E1413C3;
	Thu, 18 Jun 2026 12:50:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uTYCd-9ylkK2; Thu, 18 Jun 2026 12:50:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FC7A413C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781787007;
	bh=N4Z7wIyj2xVnSu+qVc5sKBTnElYFaX/wsqU7sXp2ANM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=B2aPe2SbuAnFZ1vZASr11WR1Jz4adFX/ZXrs7CyLhrP8x602yKKnvAHaeQzZO+QNs
	 pcfRY9xm4997zYxNl7tO/ngzOyBWiLiqW6HQIU5AneLPW/IpLjnp0Y2jqfalW3bN2E
	 2R/nSsjfxR2NiZxoL2ze/jb2fJ47iSa9q5wobdVHZHvSZdPhZ0WThQ//csQPmZYXX4
	 CE74daa+3a4mvF/udIIIRjPj65P3tjjJoAqFEZSQD6qW+hptMskVyXrVRiVuscLC/V
	 8xtOVPs0tz5gQ3jSDa92HUuV98tk6wTcU/L+nP/DKdnaVJcjvOt/97whrjQdLACQST
	 vIEvdcdGAa7Hg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FC7A413C2;
	Thu, 18 Jun 2026 12:50:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 885A1358
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68BCA413C2
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2i6snCx8sjQg for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 12:50:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5DDF7413C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DDF7413C8
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5DDF7413C8
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:03 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2075992085; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 12:49:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1waCBl-0000000CJtw-0qYG;
 Thu, 18 Jun 2026 14:49:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 14:47:55 +0200
Message-ID: <20260618124835.2935850-4-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260618124835.2935850-1-peter@korsgaard.com>
References: <20260618124835.2935850-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=odyk9yaxLPl30x/KJwXEhIi/xsmnNg6NMoFV0U+hqxFPLQ8lAuNUQfFjKPgFpWiwF7af5G4bQ5vK2wB4n64PKTY/JRw6cngXU69mTeum1r8Beo3Giecq+GAvHDCTTIE9sfLpgHDq9qeLp+93d7+YqrC6B2na4Rjjd4/olplgBMiq+XC5v0a4KgW8VKUrMGc3HowWC9aKfc28rx5Iuc8DjG2OArsOn9wF+lt1U6jp5TnQ+Y8q0/coTQOkD4L1sySmky6PfzzNA0XLaiX7j1//FX+Cz4/iJNno16Gh/1bOnlFqsADfOM9HS51N2iypE85vXFMuASYUKv8xcf65WRg7UA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=LVFtQELKnl2aiQlJh7OFlnc1ZQU225JLJE2xpX6EEzs=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=odyk9yax
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 04/29] support/testing: test_audit.py: use
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
 support/testing/tests/package/test_audit.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_audit.py b/support/testing/tests/package/test_audit.py
index f68a4b6831..722542a845 100644
--- a/support/testing/tests/package/test_audit.py
+++ b/support/testing/tests/package/test_audit.py
@@ -80,8 +80,7 @@ class TestAudit(infra.basetest.BRTest):
         # normal user. This command is expected to fail (as only root
         # can root is supposed to read this file).
         cmd = f"su - {user} -c 'cat /etc/shadow'"
-        _, ret = self.emulator.run(cmd)
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk(cmd)
 
         # Our last failed read attempt is supposed to have generated
         # an event. We check we can see it in the log.
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
