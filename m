Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A68CCD98F2
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 12:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F406B41418;
	Thu, 18 Jun 2026 12:50:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SBUcNSXff8gd; Thu, 18 Jun 2026 12:50:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43E7F4141C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781787018;
	bh=Nnr9Kd04Vu8wez1k9Rj9EIUZkvihEtGQ+a55DvlphhQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=VPB2OTThUBSwlsqNFyRU1HGmPfcz5H24HyL+FDpdvmB87+vu44XCRndxxg7uyAH+x
	 LqAyvMSPC8eHPvIVFBgnl1hWCsZQXEHcRMSdd88HCG9RDghJw1jquthIjb/rrMaiNX
	 g1EgzDqZEkcGoTpWpF5jBHazMo782kut4jrgzNGnRVi4xTNAwQuA6b8w5qGylFE2EJ
	 MFZcThJpucgxjZk2v3UMpzKjy2UWPJztObDmGp0Sofw6pYPmQaIZmvKuMVn1KTeg72
	 Onr0ZKn4Z8Q1iwtCSe34qEI+UBfZeIrvjZ+CSuf6l/Uq8Kng+4kj+xwAFErT8IBdrg
	 NVap2lMmJMjtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43E7F4141C;
	Thu, 18 Jun 2026 12:50:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 47336131
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 432C141424
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L8a9jN-q_o74 for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 12:50:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 313B54141C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 313B54141C
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 313B54141C
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:14 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 786819025; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 12:49:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1waCBo-0000000CJuk-3Qwf;
 Thu, 18 Jun 2026 14:49:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 14:48:02 +0200
Message-ID: <20260618124835.2935850-11-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260618124835.2935850-1-peter@korsgaard.com>
References: <20260618124835.2935850-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=qR0IchkNeUqc3m7ecCHhs7L5HXv5MbK1vlcVdyWvD9PnEtUOGn89aAZBQUxz7JaivbSotEaFfnLlAxYz4Ft8dSnMPshyC8i8mYeMGSVzD+Gd8SwN77NP7vHTakDT9nZcomNnHB1L/0SibpQd9BvZeieDNouO+u+VTvE3E/CRW0wt5IBprSL1j5trcoCuF4IOhP+N5aNB4S8Sh6H2H8H0ItT24Ne8htFlogoIGkvIbY9IwT/C07ijEf7njcLt/vZ7/P4pQaiuC8WhteDq6pGeoL7cHqHQgwMO5mX8f4DIPBckyjXf7R1Q5B8HSgSes2zaDQnrRSrogtpLAEi7uTyJqA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=DNe4GuhoEbbXlWv7M5rA6KMDb36C9S8dUcxqqbxiYOQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=qR0IchkN
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 11/29] support/testing: test_gnupg2.py: use
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
 support/testing/tests/package/test_gnupg2.py | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/support/testing/tests/package/test_gnupg2.py b/support/testing/tests/package/test_gnupg2.py
index 2b18f54fa3..6f862c31ce 100644
--- a/support/testing/tests/package/test_gnupg2.py
+++ b/support/testing/tests/package/test_gnupg2.py
@@ -49,8 +49,7 @@ class TestGnupg2(infra.basetest.BRTest):
         # Test a failed decrypt with a bad password
         cmd = "gpg --batch --decrypt"
         cmd += " --passphrase 'A-Bad-Password' {}".format(gpg_file)
-        _, exit_code = self.emulator.run(cmd)
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk(cmd)
 
         # Test the generation of an asymmetric key
         cmd = "gpg --batch --passphrase ''"
@@ -106,9 +105,7 @@ class TestGnupg2(infra.basetest.BRTest):
         self.assertRunOk(cmd)
 
         cmd = "gpg --verify {}".format(sig_file)
-        _, exit_code = self.emulator.run(cmd)
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk(cmd)
 
         cmd = "gpg --armor --verify {}".format(asc_file)
-        _, exit_code = self.emulator.run(cmd)
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOK(cmd)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
