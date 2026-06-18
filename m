Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A46CD98ED
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 12:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB58841443;
	Thu, 18 Jun 2026 12:50:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uypLX-LOn35o; Thu, 18 Jun 2026 12:50:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5795C413E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781787023;
	bh=Azdqpe7JUiaz0ID80vnT3+2u/Z5GhYQTTCQ1jjdSmi8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Z9DYdJEPESP9gdgeT/y4rOLJrhg73grqSa8se7HQthi5sZ+rWaHYmNQ8U1URoA0n8
	 srwrsL3VXQSRNN1IqxjbE10atFLWdxM5+AL7TZNIhUB3vG8QDq7XmBBNkPP+kSEjcV
	 kS6NcKzFoArvV5MhED1P4PCeRXtoaRW4OLckTlyBBhGsvMemkQHCh8nxj2IrnJTNeP
	 1r4CXvWGRs+sJgZpDy1byoPGupYiD0lR+peZ4pQMlvNPaTIkx4Ktg018UR6tvB09/Y
	 tfGyGTixo+HQf35N6GBq4VaS0qJ4HKJ8O0z7Uo4hI58zvazlVKKMrgwdepBHoKvuv8
	 y5UAEUdP/07Ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5795C413E5;
	Thu, 18 Jun 2026 12:50:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D6F741F3
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C977383C51
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zDUwaN3NtvFE for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 12:50:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C2A9183C4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2A9183C4F
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C2A9183C4F
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:18 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 411807275; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 12:49:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1waCBp-0000000CJuy-3Z90;
 Thu, 18 Jun 2026 14:49:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 14:48:04 +0200
Message-ID: <20260618124835.2935850-13-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260618124835.2935850-1-peter@korsgaard.com>
References: <20260618124835.2935850-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=IViI3C54BD7XN4hbv0QBUkrTLTU53kClmmPcqP0PCvLYq620vWayNd4u997ef9/UGslafY9xg4kkCacYMYutdwL2FR60pvJMOYQRmAY60unvpRC2fHJUKUk0XwLI6aPFP4afP9HSO0fPTLENx937IUdzTF1t8+iom44o+1oJRGvR3YgF/tBocNQos0N9G4M7M//o67fI0p+SzEMWsbRNeUaAsuMCxI07t6NwsDVLIdSQzNWzPOcIZdDqEyK/CeS65QBvhLHNHnVRglN+ZLMNtM5v0J7IKceKuTLqqazxQrM28dM4w4oia9V1yZd7tL7mwaSVqEk9Xb48S7qLTY2tbQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=Ez/teIDCITuGj9DAcbtojilz79ABHyxmoDaOBJV2Tnw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=IViI3C54
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 13/29] support/testing: test_iptables.py: use
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
 support/testing/tests/package/test_iptables.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/package/test_iptables.py b/support/testing/tests/package/test_iptables.py
index 6e4db0ac06..72f2dd71a4 100644
--- a/support/testing/tests/package/test_iptables.py
+++ b/support/testing/tests/package/test_iptables.py
@@ -68,8 +68,7 @@ class TestIptables(infra.basetest.BRTest):
         # A ping to 127.0.0.2 is expected to fail, because our rule is
         # supposed to drop it.
         ping_test_cmd = ping_cmd_prefix + "127.0.0.2"
-        _, exit_code = self.emulator.run(ping_test_cmd)
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk(ping_test_cmd)
 
         # Save the current rules to test the init script later.
         self.assertRunOk("/etc/init.d/S35iptables save")
@@ -85,8 +84,7 @@ class TestIptables(infra.basetest.BRTest):
         self.assertRunOk("/etc/init.d/S35iptables start")
 
         # Ping to 127.0.0.2 is expected to fail again.
-        _, exit_code = self.emulator.run(ping_test_cmd)
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk(ping_test_cmd)
 
         # And flush the rules again.
         self.assertRunOk("/etc/init.d/S35iptables stop")
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
