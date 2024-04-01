Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E15A5CD128A
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 17:21:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 900CF81E30;
	Mon,  1 Apr 2024 17:21:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KQHvzkUTuvJy; Mon,  1 Apr 2024 17:21:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CF2081DCA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CF2081DCA;
	Mon,  1 Apr 2024 17:21:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DFE741BF3A6
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 17:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA844404C1
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 17:21:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KUjt1PmIr5Is for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 17:21:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E7128400FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7128400FC
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E7128400FC
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 17:21:02 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id CC031B00572;
 Mon,  1 Apr 2024 19:20:59 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon,  1 Apr 2024 19:20:51 +0200
Message-ID: <20240401172051.68246-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711992061;
 bh=v6GKInVxdohYZn0ObqMhgtg/ptlbsFJ5tmzLAXQyndI=;
 h=From:To:Cc:Subject:Date:From;
 b=eOllssDJADXnuBBwT0gK0sMlRXov2pCeD+MS86z6wj+02SGSxRF0jmb7UbLmIf0Nu
 Eh78gYZbT53eGTLh1gSeyGJ71R9uAR9hFMj2+xO3sAx6bmk0YHbBPOod1EbbbJ/6cL
 1eT1My1EUrhGHg3op/6I0p88mcG6NtQIN0aJ8Vp6aJ1fIwKdqK8gVnQADfBxzjF9Zk
 dg4ralxG3FmMQkNbdt6RJl9R9D0dZArZuKNYmvDX27sEOajZ0CkXWqxEV3AIuV8+oH
 InjNnnfYRMyj39emwPzKDs6z/easBYw8tf1Tqay6f2ovAY+WHCyOlH8CQNB/C3eEK2
 fcwSKg82/5fzw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eOllssDJ
Subject: [Buildroot] [PATCH 1/1] support/testing: fix trace-cmd runtime test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

The trace-cmd runtime test has a typo and fails with output:

    Traceback (most recent call last):
      File "/build/buildroot/support/testing/tests/package/test_trace_cmd.py", line 53, in test_run
        self.assertEquals(exit_code, 0)
        ^^^^^^^^^^^^^^^^^
    AttributeError: 'TestTraceCmd' object has no attribute 'assertEquals'. Did you mean: 'assertEqual'?

The issue can be reproduced with the command:

    support/testing/run-tests \
        -d dl -o output_test \
        tests.package.test_trace_cmd

This commit fixes the issue by removing the extra 's'.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_trace_cmd.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_trace_cmd.py b/support/testing/tests/package/test_trace_cmd.py
index e7d5e13bce8..5d37aef375f 100644
--- a/support/testing/tests/package/test_trace_cmd.py
+++ b/support/testing/tests/package/test_trace_cmd.py
@@ -50,5 +50,5 @@ class TestTraceCmd(infra.basetest.BRTest):
         # Check we have occurrences of "kmalloc:" in the trace report.
         cmd = "grep -Fc kmalloc: trace.txt"
         output, exit_code = self.emulator.run(cmd)
-        self.assertEquals(exit_code, 0)
+        self.assertEqual(exit_code, 0)
         self.assertTrue(int(output[0]) > 0)
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
