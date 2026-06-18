Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C13CD98F3
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 12:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 622CC41725;
	Thu, 18 Jun 2026 12:50:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qXQlmIwvbuWn; Thu, 18 Jun 2026 12:50:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D65841688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781787035;
	bh=10pWTUAEwBdFQuhFn+X788mTemk1X1sHFR3zUhbaQ+E=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K7C12Owd/TmBV9BGM7dzbS0/iZ/4A7yhgLAufZN3SmyOn4Skrd3a6ojDMQtRvjukP
	 e/9gnLATuFa4u0qPBhLmLYzhWX0UCvElD7nqFRr0DCwxHX9qpdqITu9nb8LUTyV+Bp
	 +frZSHzHL9//E+eO3PkC9UpUC5pmydo+lW05nY9MfrbJlzBm5Gi3U0QOyR2hXCtJlh
	 qvEGWczICurZWTXts+bs5URIJcPUmYqsUTpyZRrkAgZTFDj0IGEPIDy8zwLoCfoXQ5
	 VsfFfJBAyF8HBgVHzFaTOsVP94LxshKULXfQ3ElZVwIIHeff7zXORMKLLj2ogxCMQ6
	 J2axXpgggzTDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D65841688;
	Thu, 18 Jun 2026 12:50:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A28BB131
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 949ED83C51
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MDK8HC1RTCbw for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 12:50:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8E03583C4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E03583C4F
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E03583C4F
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:31 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 327604267; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 12:49:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1waCBu-0000000CJw3-29ds;
 Thu, 18 Jun 2026 14:49:54 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 14:48:13 +0200
Message-ID: <20260618124835.2935850-22-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260618124835.2935850-1-peter@korsgaard.com>
References: <20260618124835.2935850-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=YgZ9X2JrOY95ZxEYXyiiJ5uTwjrymcc+8pcRkYL+syarBelntvbW986kcjlxzUW0YZ1RXgpiOOCJjKVSEYKqrAyZWh7P0n1UKjSNfLimsu4mLMmhgUZr4zuWe5fT2AV8qhjsXrxOY7kGPRzz4gjXSQeWuQFN4lfnn8EEGB2c9BdLuVlqyPPQocUE5PepOA8XHtES77SESmCXFggiaILkOrWRNuVag52OfsSFE5ls7LTRIA3YxmeJYJv6Q6irFyDsZKrETYdGe5U+vNAHQSdhJjAU5s3ISrGePQMAXiTpD95H2RMYEYsMAPFF126xMkb1fekuSsVFPppwP2CAbMBwtg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=gB2JmxzbAJ8hFO0qy0hTbJjCyoEpJTR1K9EDuz67YV8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=YgZ9X2Jr
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 22/29] support/testing: test_polkit.py: use
 assertRun{, Not}Ok()
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

Use the helpers to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_polkit.py | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/support/testing/tests/package/test_polkit.py b/support/testing/tests/package/test_polkit.py
index 3414fd5159..8ff02d91df 100644
--- a/support/testing/tests/package/test_polkit.py
+++ b/support/testing/tests/package/test_polkit.py
@@ -43,20 +43,16 @@ class TestPolkitSystemd(TestPolkitInfra):
         rule_file = "systemd-timesyncd-restart.rules"
         for rule_path in TestPolkitInfra.rule_paths:
             cmd = "su brtest -c '/bin/systemctl restart systemd-timesyncd.service'"
-            _, exit_code = self.emulator.run(cmd, 10)
-            self.assertNotEqual(exit_code, 0)
+            self.assertRunNotOk(cmd, 10)
 
             cmd = "cp /root/{file} {path}".format(file=rule_file, path=rule_path)
-            _, exit_code = self.emulator.run(cmd, 10)
-            self.assertEqual(exit_code, 0)
+            self.assertRunOk(cmd, 10)
 
             cmd = "su brtest -c '/bin/systemctl restart systemd-timesyncd.service'"
-            _, exit_code = self.emulator.run(cmd, 10)
-            self.assertEqual(exit_code, 0)
+            self.assertRunOk(cmd, 10)
 
             cmd = "rm {path}/{file}".format(file=rule_file, path=rule_path)
-            _, exit_code = self.emulator.run(cmd, 10)
-            self.assertEqual(exit_code, 0)
+            self.assertRunOk(cmd, 10)
 
 
 class TestPolkitInitd(TestPolkitInfra):
@@ -73,8 +69,7 @@ class TestPolkitInitd(TestPolkitInfra):
             self.assertEqual(output[0], "Error executing command as another user: Not authorized")
 
             cmd = "cp /root/{file} {path}/{file}".format(file=rule_file, path=rule_path)
-            _, exit_code = self.emulator.run(cmd, 10)
-            self.assertEqual(exit_code, 0)
+            self.assertRunOk(cmd, 10)
 
             cmd = "su brtest -c 'pkexec hello-polkit'"
             output, exit_code = self.emulator.run(cmd, 10)
@@ -82,5 +77,4 @@ class TestPolkitInitd(TestPolkitInfra):
             self.assertEqual(output[0], "Hello polkit!")
 
             cmd = "rm {path}/{file}".format(file=rule_file, path=rule_path)
-            _, exit_code = self.emulator.run(cmd, 10)
-            self.assertEqual(exit_code, 0)
+            self.assertRunOk(cmd, 10)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
