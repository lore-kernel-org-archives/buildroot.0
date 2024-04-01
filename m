Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70DECD128A
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 20:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D9E981E59;
	Mon,  1 Apr 2024 20:07:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ym_1Hze8qbbF; Mon,  1 Apr 2024 20:07:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7904981E38
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7904981E38;
	Mon,  1 Apr 2024 20:07:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A30D1BF3BF
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 20:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8471440399
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 20:07:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fxU0xWJg6-eC for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 20:07:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F3B8400CB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F3B8400CB
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 20:07:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 476088455F; Mon,  1 Apr 2024 20:07:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 1 Apr 2024 22:05:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ccb4e5db5cbfe91dfd00e173ef481de313c828b8
X-Git-Newrev: 2f507f1da564cce807b809c893fcf2408ca26bfe
X-Patchwork-Hint: ignore
Message-Id: <20240401200713.476088455F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: fix trace-cmd runtime test
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2f507f1da564cce807b809c893fcf2408ca26bfe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/package/test_trace_cmd.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_trace_cmd.py b/support/testing/tests/package/test_trace_cmd.py
index e7d5e13bce..5d37aef375 100644
--- a/support/testing/tests/package/test_trace_cmd.py
+++ b/support/testing/tests/package/test_trace_cmd.py
@@ -50,5 +50,5 @@ class TestTraceCmd(infra.basetest.BRTest):
         # Check we have occurrences of "kmalloc:" in the trace report.
         cmd = "grep -Fc kmalloc: trace.txt"
         output, exit_code = self.emulator.run(cmd)
-        self.assertEquals(exit_code, 0)
+        self.assertEqual(exit_code, 0)
         self.assertTrue(int(output[0]) > 0)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
