Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06771C4167B
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 20:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84BF24081F;
	Tue, 27 Dec 2022 20:45:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84BF24081F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Y0hZ1UNE5rq; Tue, 27 Dec 2022 20:45:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99140402BB;
	Tue, 27 Dec 2022 20:45:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99140402BB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F3BE11BF37A
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 20:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCA758140F
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 20:45:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCA758140F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id crqJsz0WBjx3 for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 20:45:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A40580F50
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 20:45:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A40580F50
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E6F4286EA0; Tue, 27 Dec 2022 20:45:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Dec 2022 21:40:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 319c56dfe3309dbf24be01fed3afff6259a2c5dd
X-Git-Newrev: 44161560dd52ebe9a41ee6e5ec8cacb2a9fe48ec
X-Patchwork-Hint: ignore
Message-Id: <20221227204552.E6F4286EA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/tests: print failed command and
 output on assertRunOK error
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=44161560dd52ebe9a41ee6e5ec8cacb2a9fe48ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, when asserting that a command succeeded, we just capture the
return code of the command. If that is not zero, the assertion fails,
but the error message is not very splicit:
    AssertionError: 1 != 0

Replace the error message with an explicit message that dumps the failed
command, the error code, and the resulting output.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
