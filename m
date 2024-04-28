Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A82C4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 20:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B7D9605C9;
	Sun, 28 Apr 2024 20:14:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WcmCGJ789LHZ; Sun, 28 Apr 2024 20:14:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B851605D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B851605D5;
	Sun, 28 Apr 2024 20:14:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8E3071BF370
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 20:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87DAB40433
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 20:14:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bZwLlqweyPv6 for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 20:14:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD0FB4016F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD0FB4016F
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 20:14:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B6C218623B; Sun, 28 Apr 2024 20:14:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 28 Apr 2024 22:11:41 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 4a27953e8b679a461713e86bc51a8564ca4aed56
X-Git-Newrev: a2ade71578a978926bb47985594cc2d2ce5432f2
X-Patchwork-Hint: ignore
Message-Id: <20240428201444.B6C218623B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/testing: fix
 trace-cmd runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=a2ade71578a978926bb47985594cc2d2ce5432f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
(cherry picked from commit 2f507f1da564cce807b809c893fcf2408ca26bfe)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
