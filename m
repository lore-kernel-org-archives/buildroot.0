Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F10EDE99E
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 09:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABAA161257;
	Thu, 14 Sep 2023 09:54:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABAA161257
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Twyhq1AmdZkd; Thu, 14 Sep 2023 09:54:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E38386126A;
	Thu, 14 Sep 2023 09:54:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E38386126A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 780481BF42E
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 09:53:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61204608A6
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 09:53:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61204608A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x8x2kOUyQ4es for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 09:53:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 785CB60F32
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 09:53:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 785CB60F32
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 689ED86F59; Thu, 14 Sep 2023 09:53:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 11:07:01 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 78c498be21a7ae7396f4e58b582cd647d4d83481
X-Git-Newrev: 7817b9c2a6b4c117895b53accdaca541fa4af06a
X-Patchwork-Hint: ignore
Message-Id: <20230914095340.689ED86F59@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] support/testing:
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

commit: https://git.buildroot.net/buildroot/commit/?id=7817b9c2a6b4c117895b53accdaca541fa4af06a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

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
