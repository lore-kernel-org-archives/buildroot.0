Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0836EDE9A0
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 09:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70E2F61240;
	Thu, 14 Sep 2023 09:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70E2F61240
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7icGoG5ueA5U; Thu, 14 Sep 2023 09:52:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B04D96123D;
	Thu, 14 Sep 2023 09:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B04D96123D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BE8151BF995
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 09:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9AE5360D72
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 09:52:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AE5360D72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5JUBZvFhmd_2 for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 09:52:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3C8961206
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 09:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3C8961206
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C2E686F2A; Thu, 14 Sep 2023 09:52:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 11:07:12 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 181793bb3ddfbc3b0ad35d26017e0dab46c71ece
X-Git-Newrev: 316eedb5e144370e255f6949e89ad1503490c1ec
X-Patchwork-Hint: ignore
Message-Id: <20230914095229.8C2E686F2A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] support/testing:
 python-magic-wormhole: fix random failures
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

commit: https://git.buildroot.net/buildroot/commit/?id=316eedb5e144370e255f6949e89ad1503490c1ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

The magic-wormhole "receive" command can output "waiting" messages
when key receival or verification are longer than a predefined
timeout:
https://github.com/magic-wormhole/magic-wormhole/blob/0.13.0/src/wormhole/cli/cmd_receive.py#L135

The intent is to have an interactive user experience.

This behavior makes the runtime test unreliable as the test always
expect the sent message as the exact output. When the test execution
is slower, it sometimes get the "waiting" message instead of the
expected message.

Some test jobs are succeeding:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4968059737
while some other are failing.

magic-wormhole can override those timers with environment variables.
See:
https://github.com/magic-wormhole/magic-wormhole/blob/0.13.0/src/wormhole/cli/cmd_receive.py#L26

This commit sets those environment variable to larger values
(100 seconds instread of 1 by default), to make sure the test will
always pass.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4962923235

Reported-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Tested-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d44a888c320bd5fc850bccf5a1e09facb9fdad0d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_python_magic_wormhole.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_python_magic_wormhole.py b/support/testing/tests/package/test_python_magic_wormhole.py
index d6541a2480..d1a37acbc6 100644
--- a/support/testing/tests/package/test_python_magic_wormhole.py
+++ b/support/testing/tests/package/test_python_magic_wormhole.py
@@ -56,7 +56,9 @@ class TestPythonPy3MagicWormhole(TestPythonPackageBase):
         cmd += "sleep 25"
         self.assertRunOk(cmd, timeout=30)
 
-        cmd = wormhole_cmd + " receive {}".format(code)
+        wormhole_env = "_MAGIC_WORMHOLE_TEST_KEY_TIMER=100 "
+        wormhole_env += "_MAGIC_WORMHOLE_TEST_VERIFY_TIMER=100 "
+        cmd = wormhole_env + wormhole_cmd + " receive {}".format(code)
         output, exit_code = self.emulator.run(cmd, timeout=35)
         self.assertEqual(exit_code, 0)
         self.assertEqual(output[0], text)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
