Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D34EC4829A
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 22:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23DEF85010;
	Sun, 11 Feb 2024 22:12:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1NdJEMkS2H3J; Sun, 11 Feb 2024 22:12:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C76E784F98
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C76E784F98;
	Sun, 11 Feb 2024 22:12:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CDDD21BF861
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 22:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C26B340B3E
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 22:12:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dWNEp3FXRynw for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 22:12:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9DF740BAE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9DF740BAE
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 22:12:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B0A888781C; Sun, 11 Feb 2024 22:12:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 23:12:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 687b96db4d3518eadd16f74f7defdc05b1cfb736
X-Git-Newrev: cbe0f4de67aef0f4695073c2047ba65cc420c83a
X-Patchwork-Hint: ignore
Message-Id: <20240211221213.B0A888781C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: remove hardcoded sleep
 from python-flask test
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

commit: https://git.buildroot.net/buildroot/commit/?id=cbe0f4de67aef0f4695073c2047ba65cc420c83a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to the new fastapi test, instead of waiting for a hard coded
amount of time we can retry every second until the server is available
and abort if after the timeout we still didn't manage to connect.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_python_flask.py | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/support/testing/tests/package/test_python_flask.py b/support/testing/tests/package/test_python_flask.py
index 9d8587e918..32d9da34a5 100644
--- a/support/testing/tests/package/test_python_flask.py
+++ b/support/testing/tests/package/test_python_flask.py
@@ -21,9 +21,13 @@ class TestPythonPy3Flask(TestPythonPackageBase):
         _, exit_code = self.emulator.run(cmd, timeout=self.timeout)
 
         # Give enough time for the flask server to start up
-        time.sleep(30)
+        for attempt in range(30):
+            time.sleep(1)
 
-        cmd = "wget -q -O - http://127.0.0.1:5000/"
-        output, exit_code = self.emulator.run(cmd, timeout=self.timeout)
-        self.assertEqual(exit_code, 0)
-        self.assertEqual(output[0], "Hello, World!")
+            cmd = "wget -q -O - http://127.0.0.1:5000/"
+            output, exit_code = self.emulator.run(cmd, timeout=self.timeout)
+            if exit_code == 0:
+                self.assertEqual(output[0], 'Hello, World!')
+                break
+        else:
+            self.assertTrue(False, "Timeout while waiting for flask server")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
