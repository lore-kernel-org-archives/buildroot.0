Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB47CD98F3
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 12:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3AEB4143F;
	Thu, 18 Jun 2026 12:50:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YuAZCe42bxDl; Thu, 18 Jun 2026 12:50:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5A924178A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781787039;
	bh=nPclzht4tcYVelpGGqUbqaevStDtEgZSlp6W5wj1DGA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=riP9zqqlyWATx8Cg/Po7qpoe5l3xkRPUAM6ip9yoRR6mHoJehydjA63T0f5FNcwO4
	 I+gsvnVMkCeZnOR4Zxrb6S/WtyKOnFVVs/zoB9r5u6PZ8bos7ETM/oiZ4RCkWIkO4j
	 T9skAZstcGZP2LxBXlQGLvk+DES2ZzJEJ5PonF3qvVtIbq0HaxCTJt7NXK4oP/V372
	 54TAOlBnSt9fvR8sFUL6lscGkfyWYJkGQOtsBvxLKiB564gRBiiTy6tM8ISZQUlP9R
	 17kY0IGknv5sElCiYdyfrnPKByWCRFK2FsZkhNMGipwej/qrFJRAibdgIlkLXICAff
	 UtcbLXRnFK5Kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5A924178A;
	Thu, 18 Jun 2026 12:50:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DEAD3131
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4E0084179
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3e9iKjALbqzK for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 12:50:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BB5FD83C4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB5FD83C4F
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB5FD83C4F
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:35 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1909499522; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 12:49:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1waCBw-0000000CJwV-2QXw;
 Thu, 18 Jun 2026 14:49:56 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 14:48:17 +0200
Message-ID: <20260618124835.2935850-26-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260618124835.2935850-1-peter@korsgaard.com>
References: <20260618124835.2935850-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=KHmEkui0EFaUeO40uUcSYyc4rFh+KCLXvQo86okdh7XuynVE6GPh8rUXJTMDuWe9Lyc51IinChpyJiIUVMNALpkTg//BeBIu01rl282gSzk0zJaf8PJPpMTzWC3GpTeK1y91/kMyuXufG5SR2pbOjyp/uB50Kgo22eA29CTu4FnwO3g5/FX4jWbDkhL/N5ggAYR2/SVLWOEMQ0eLEi1NsDS1lRT/D9UPqFCSerMw5+T1rEXnIZMl/LCeuWU2QcddKXsYlwZmDa48x/kLSNIu1eVH4kIrOmLPXfGPRbFLreCo9rv5ovR9Yz+1X57tOscl6AoR5u65gguKoqIKSBz9MA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=tMUREgFtYRAsCaHOccgMUdSJ1+4oVxU8hLYmVvCfpEo=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=KHmEkui0
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 26/29] support/testing: test_swipl.py: use
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
 support/testing/tests/package/test_swipl.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_swipl.py b/support/testing/tests/package/test_swipl.py
index 0f317bb617..4005e02e5b 100644
--- a/support/testing/tests/package/test_swipl.py
+++ b/support/testing/tests/package/test_swipl.py
@@ -27,8 +27,7 @@ class TestSWIPL(infra.basetest.BRTest):
 
         # Check swipl fails when goal is false.
         cmd = "swipl -g false"
-        _, exit_code = self.emulator.run(cmd)
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk(cmd)
 
         # Test output.
         string = "Hello Buildroot !"
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
