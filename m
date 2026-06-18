Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8F4CD98F3
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 12:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16D28417D0;
	Thu, 18 Jun 2026 12:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nJ7LLxx9JMbZ; Thu, 18 Jun 2026 12:50:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FA05413D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781787046;
	bh=l7SvOl4pc5eCWwXQSdQBhptksbyxEm9ezt6Mwysa9Y4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=RR1dF/0VVlSvHeWXInrIQK1ih5tQHn8yAHdiUttP2W0Qsy0mF9IUt1Vt5L1yyS65L
	 iKamBSTCCoELJ7nWOD8qb+7g9WoDHsXHEBnnNvf4E3FYfEBoPhr4DyXtMgeW36giW9
	 S3bVnA4+46N5CFx084bo7yFuXyASpLOSVKx2JDo0AwU8jWnj3pZFevw0aa5USH8SJW
	 lbQstvxQjX7QwJdsE9sHHRIevrrnlz6AtAGVx92/0AmbBVN5haM/uJPernqZnDnTgq
	 fCmEkdzcdTEBKI+Cb4zNeU8BBfDXBvscKCaXOAVU0bjlWRfrTJDYyQPV7pHrJ8zMLE
	 tTsTO/askbQrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FA05413D8;
	Thu, 18 Jun 2026 12:50:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E23121F3
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D473940DA1
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J_CDh7Z4RNQb for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 12:50:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C25C44063F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C25C44063F
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C25C44063F
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:40 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 485276365; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 12:49:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1waCBy-0000000CJwq-0YgU;
 Thu, 18 Jun 2026 14:49:58 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 14:48:20 +0200
Message-ID: <20260618124835.2935850-29-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260618124835.2935850-1-peter@korsgaard.com>
References: <20260618124835.2935850-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=HdwihFo/rj2+Oa2HKPediqZxBcsqd+51bYY7zLchnqt+NVm+1L2/abEdudUnZcfq0CxnEwS50PSIQfjCT1INB+qzWQMiytCw7qMq5fdtJZTdxTwP3I0t0trKMtf6qPcv2wG8cEh7LjZTJO6V16RB/jSJQqraX38PhTHZYlWSzY8sKvOAYhmI6fEr6C2uKiySWm8h6tTHwrrvVbV3lUBE4bfjnpf9p0LfkrBtdSafmf1+ECkS3uyTt4bIH5JSO7Ghnmzb0nv5c+zFS56rwogv1Xxwfo1zmniFpr9ldNzhXftUmVsfco6uoMhjq7NgVITYvgj48drOuUdyiGPhPUhcww==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=qEz8xYJpgdhRKSPltibm7JdfAJ7dc7VFaDcriBJcW6Q=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=HdwihFo/
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 29/29] support/testing: test_which.py: use
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
 support/testing/tests/package/test_which.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_which.py b/support/testing/tests/package/test_which.py
index 38f528aa7f..05ed56ccb4 100644
--- a/support/testing/tests/package/test_which.py
+++ b/support/testing/tests/package/test_which.py
@@ -33,8 +33,7 @@ class TestWhich(infra.basetest.BRTest):
 
         # We check "which" returns an error when the program is not
         # found.
-        _, ret = self.emulator.run(f"which {alias_name}")
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk(f"which {alias_name}")
 
         # We define a shell alias.
         alias_cmd = "/bin/true"
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
