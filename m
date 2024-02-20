Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DAAC54764
	for <buildroot@archiver.kernel.org>; Tue, 20 Feb 2024 16:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 620824064F;
	Tue, 20 Feb 2024 16:45:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XX7tWq-gajzX; Tue, 20 Feb 2024 16:45:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A5BF406A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A5BF406A4;
	Tue, 20 Feb 2024 16:45:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 21E321BF5A6
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 16:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E5604064F
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 16:45:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mJabGsCVPunz for <buildroot@lists.busybox.net>;
 Tue, 20 Feb 2024 16:45:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1212240604
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1212240604
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 16:45:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED86387965; Tue, 20 Feb 2024 16:45:04 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 20 Feb 2024 17:44:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d8ea853b8c923103a32fbc5f5b4ec5e46407cd33
X-Git-Newrev: dc3f1faa8b8339a72da45efeeb3085045002ca28
X-Patchwork-Hint: ignore
Message-Id: <20240220164504.ED86387965@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: remove hardcoded sleep
 from python-django test
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

commit: https://git.buildroot.net/buildroot/commit/?id=dc3f1faa8b8339a72da45efeeb3085045002ca28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of waiting for a hardcoded time of 30s we check periodically every
second if the server is already up. If it isn't up after the full timeout
(which is the same as before) expired the test fails.

We need to redirect all output of the background started task to
/dev/null now as it otherwise confuses the emulator.run() exit code
parsing logic (as it gets out of order messages from the emulator).

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
yann.morin.1998@free.fr: simplify assert test]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/package/test_python_django.py | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/support/testing/tests/package/test_python_django.py b/support/testing/tests/package/test_python_django.py
index e1ca50f6d8..29e8ee0b2e 100644
--- a/support/testing/tests/package/test_python_django.py
+++ b/support/testing/tests/package/test_python_django.py
@@ -1,3 +1,5 @@
+import time
+
 from tests.package.test_python import TestPythonPackageBase
 
 
@@ -16,13 +18,16 @@ class TestPythonDjango(TestPythonPackageBase):
         self.assertIn("Operations to perform:", output[0])
         self.assertEqual(exit_code, 0)
 
-        cmd = "cd /opt/testsite && " + self.interpreter + " ./manage.py runserver 0.0.0.0:1234 & "
-        # give some time to setup the server
-        cmd += "sleep {}".format(str(30 * self.emulator.timeout_multiplier))
+        cmd = "cd /opt/testsite && " + self.interpreter + " ./manage.py runserver 0.0.0.0:1234 > /dev/null 2>&1 & "
         self.assertRunOk(cmd, timeout=timeout)
-
-        cmd = "netstat -ltn 2>/dev/null | grep 0.0.0.0:1234"
-        self.assertRunOk(cmd)
+        # give some time to setup the server
+        for attempt in range(30 * self.emulator.timeout_multiplier):
+            time.sleep(1)
+            cmd = "netstat -ltn 2>/dev/null | grep 0.0.0.0:1234"
+            _, exit_code = self.emulator.run(cmd)
+            if exit_code == 0:
+                break
+        self.assertEqual(exit_code, 0, "Timeout while waiting for django server")
 
 
 class TestPythonPy3Django(TestPythonDjango):
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
