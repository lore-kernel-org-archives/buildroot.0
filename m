Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D14C4167B
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 18:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3642C4071B;
	Sun,  1 Jan 2023 18:36:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3642C4071B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MZBkZsArog69; Sun,  1 Jan 2023 18:36:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EA67405CE;
	Sun,  1 Jan 2023 18:36:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EA67405CE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD2EE1BF41A
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 18:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C645B813B2
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 18:36:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C645B813B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id doM9WeocrUeM for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 18:36:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1174D81391
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 18:36:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1174D81391
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 01413870A0; Sun,  1 Jan 2023 18:36:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Jan 2023 19:34:23 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 35fa0316c9f1d60c6202c93b6d17ce396474ed68
X-Git-Newrev: d475cb6056adb7607bcc7768b41ff3c81f92ce93
X-Patchwork-Hint: ignore
Message-Id: <20230101183645.01413870A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] support/tests: print
 failed command and output on assertRunOK error
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

commit: https://git.buildroot.net/buildroot/commit/?id=d475cb6056adb7607bcc7768b41ff3c81f92ce93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Currently, when asserting that a command succeeded, we just capture the
return code of the command. If that is not zero, the assertion fails,
but the error message is not very splicit:
    AssertionError: 1 != 0

Replace the error message with an explicit message that dumps the failed
command, the error code, and the resulting output.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 44161560dd52ebe9a41ee6e5ec8cacb2a9fe48ec)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/infra/basetest.py | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 96c6848dfc..45bcd4c2e2 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -88,7 +88,12 @@ class BRTest(BRConfigTest):
         super(BRTest, self).tearDown()
 
     # Run the given 'cmd' with a 'timeout' on the target and
-    # assert that the command succeeded
+    # assert that the command succeeded; on error, print the
+    # faulty command and its output
     def assertRunOk(self, cmd, timeout=-1):
-        _, exit_code = self.emulator.run(cmd, timeout)
-        self.assertEqual(exit_code, 0)
+        out, exit_code = self.emulator.run(cmd, timeout)
+        self.assertEqual(
+            exit_code,
+            0,
+            "\nFailed to run: {}\noutput was:\n{}".format(cmd, '  '+'\n  '.join(out))
+        )
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
