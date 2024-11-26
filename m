Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C09CD3B98F
	for <buildroot@archiver.kernel.org>; Tue, 26 Nov 2024 13:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55F4F6FA54;
	Tue, 26 Nov 2024 13:50:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uUFKb_EAp8YS; Tue, 26 Nov 2024 13:50:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CCA36FA4E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CCA36FA4E;
	Tue, 26 Nov 2024 13:50:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AD7EF4961
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BDA7434F3
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:49:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f25zZhLm-sAF for <buildroot@buildroot.org>;
 Tue, 26 Nov 2024 13:49:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9800F434CC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9800F434CC
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:49:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E9408669A; Tue, 26 Nov 2024 13:49:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Nov 2024 14:39:44 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 8b83136326502b178886b8d0686e5aa4ddb4d93b
X-Git-Newrev: a210062ce2fd3c9c85cf21d0a8cd55da093fa816
X-Patchwork-Hint: ignore
Message-Id: <20241126134958.8E9408669A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/testing: fix
 TestInitSystemNone for non-login shell
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a210062ce2fd3c9c85cf21d0a8cd55da093fa816
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
(cherry picked from commit 5ed1fab018db9a001b072fd7bcb3dd3db280aabe)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
