Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1767C25B7A
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 13:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CE7B4054B;
	Wed, 22 May 2024 13:06:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wfxT8iCVtj_6; Wed, 22 May 2024 13:06:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E83040338
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E83040338;
	Wed, 22 May 2024 13:06:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7CDCB1BF3D9
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 13:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6992740338
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 13:06:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ptcP-IVrJj70 for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 13:06:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5051340286
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5051340286
 for <buildroot@buildroot.org>; Wed, 22 May 2024 13:06:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD09787515; Wed, 22 May 2024 13:06:22 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 15:04:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1263adf7a97b2cbc943b0c947f24401a59716aa6
X-Git-Newrev: 9a734700d714d799b5d42489071b0f7759552987
X-Patchwork-Hint: ignore
Message-Id: <20240522130622.DD09787515@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: improve
 python-magic-wormhole test reliability
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

commit: https://git.buildroot.net/buildroot/commit/?id=9a734700d714d799b5d42489071b0f7759552987
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The python-magic-wormhole runtime test can randomly fail on slow
runners, see [1].

The issue is that the sending command is started first in background
_without_ redirecting its output to /dev/null. The receiving command
is started after, expecting the message to be printed on the first
standard output line. On slower systems, the sending command still
print messages while the test controller expect output from the
receiving command. The expected string finally appear, but not on the
first line. This makes the test fail.

This commit fixes the issue by redirecting all outputs (stdout, stderr)
of the sending command to /dev/null. To help even more, the sleep time
is moved from the emulator to the test controller. The sleep time is
also multiplied by the timeout_multiplier.

Fixes: [1]

[1] https://gitlab.com/buildroot.org/buildroot/-/jobs/6888691508

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/package/test_python_magic_wormhole.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/support/testing/tests/package/test_python_magic_wormhole.py b/support/testing/tests/package/test_python_magic_wormhole.py
index 5a0f0277b0..180cff2e4a 100644
--- a/support/testing/tests/package/test_python_magic_wormhole.py
+++ b/support/testing/tests/package/test_python_magic_wormhole.py
@@ -1,4 +1,5 @@
 import os
+import time
 
 from tests.package.test_python import TestPythonPackageBase
 
@@ -46,9 +47,12 @@ class TestPythonPy3MagicWormhole(TestPythonPackageBase):
         wormhole_cmd = "wormhole --relay-url={} --transit-helper={}".format(
             relay_url, transit_helper)
 
-        cmd = wormhole_cmd + " send --code={} --text=\"{}\" & ".format(code, text)
-        cmd += "sleep 25"
-        self.assertRunOk(cmd, timeout=30)
+        cmd = wormhole_cmd
+        cmd += f" send --code={code} --text=\"{text}\""
+        cmd += " &> /dev/null &"
+        self.assertRunOk(cmd)
+
+        time.sleep(30 * self.timeout_multiplier)
 
         wormhole_env = "_MAGIC_WORMHOLE_TEST_KEY_TIMER=100 "
         wormhole_env += "_MAGIC_WORMHOLE_TEST_VERIFY_TIMER=100 "
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
