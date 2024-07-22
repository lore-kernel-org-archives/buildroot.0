Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E053CC3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 19:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71C8060666;
	Mon, 22 Jul 2024 19:50:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JzK1X_8WWBxz; Mon, 22 Jul 2024 19:50:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7226160604
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7226160604;
	Mon, 22 Jul 2024 19:50:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 068B11BF31D
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 19:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00AB3401AF
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 19:50:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QrzbMgsdFkWL for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 19:50:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A28740424
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A28740424
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 19:50:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E45CE870CC; Mon, 22 Jul 2024 19:49:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 21:49:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a1a2f498d7ecdd643b5c057f1c737e082a105384
X-Git-Newrev: 5ed1fab018db9a001b072fd7bcb3dd3db280aabe
X-Patchwork-Hint: ignore
Message-Id: <20240722194959.E45CE870CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: fix TestInitSystemNone
 for non-login shell
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

commit: https://git.buildroot.net/buildroot/commit/?id=5ed1fab018db9a001b072fd7bcb3dd3db280aabe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This test started failing at commit
0cad947b964be5612a182413da136fcf0dc5a1f2
"support/testing/infra/emulator.py: fix qemu prompt detection" with the
error message

  AttributeError: 'NoneType' object has no attribute 'run_command'

This is because we changed emulator.run() so that emulator.login() must
be called first. But this test skips the login and goes directly to a
shell. Use the new emulator.connect_shell() function which prepares the
shell without logging in.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/init/test_none.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/init/test_none.py b/support/testing/tests/init/test_none.py
index fc4a46efd9..5bfcc3d5c9 100644
--- a/support/testing/tests/init/test_none.py
+++ b/support/testing/tests/init/test_none.py
@@ -18,10 +18,8 @@ class TestInitSystemNone(InitSystemBase):
         if index != 0:
             self.emulator.logfile.write("==> System does not boot")
             raise SystemError("System does not boot")
-        index = self.emulator.qemu.expect(["#", pexpect.TIMEOUT], timeout=60)
-        if index != 0:
-            self.emulator.logfile.write("==> System does not boot")
-            raise SystemError("System does not boot")
+
+        self.emulator.connect_shell()
 
         out, exit_code = self.emulator.run("sh -c 'echo $PPID'")
         self.assertEqual(exit_code, 0)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
