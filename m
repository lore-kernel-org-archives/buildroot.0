Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD44CA0FF8
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 07:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34FAF41686;
	Sat,  2 Sep 2023 07:44:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34FAF41686
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dLbtIgrzJxYg; Sat,  2 Sep 2023 07:44:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8167C405D1;
	Sat,  2 Sep 2023 07:44:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8167C405D1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6ADCE1BF3CB
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44376410D5
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:44:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44376410D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h7s7U0OiC3jc for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 07:44:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DCC2410CB
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 07:44:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DCC2410CB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A6EE867AD; Sat,  2 Sep 2023 07:44:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 Sep 2023 09:43:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aab82a29bc66ec1ab03c98cfe72112a9d21a1fc6
X-Git-Newrev: d44a888c320bd5fc850bccf5a1e09facb9fdad0d
X-Patchwork-Hint: ignore
Message-Id: <20230902074408.1A6EE867AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: python-magic-wormhole:
 fix random failures
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

commit: https://git.buildroot.net/buildroot/commit/?id=d44a888c320bd5fc850bccf5a1e09facb9fdad0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 support/testing/tests/package/test_python_magic_wormhole.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_python_magic_wormhole.py b/support/testing/tests/package/test_python_magic_wormhole.py
index abd34bca50..5a0f0277b0 100644
--- a/support/testing/tests/package/test_python_magic_wormhole.py
+++ b/support/testing/tests/package/test_python_magic_wormhole.py
@@ -50,7 +50,9 @@ class TestPythonPy3MagicWormhole(TestPythonPackageBase):
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
