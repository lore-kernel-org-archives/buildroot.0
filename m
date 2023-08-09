Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1916CEE49A5
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBBED41451;
	Mon, 21 Aug 2023 20:16:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBBED41451
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LN82u_XpElaf; Mon, 21 Aug 2023 20:16:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAA4140C51;
	Mon, 21 Aug 2023 20:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAA4140C51
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 158121BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDF9B409CB
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDF9B409CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cniqm-mZrKfH for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60A2E409E3
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60A2E409E3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 575F986024; Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Aug 2023 19:21:27 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 144cacd07bd613bc4a293b8c0ec7c7304bdf8cc0
X-Git-Newrev: 084cc7df3f0e3f90cef55f5df82ae8320c3609d9
X-Patchwork-Hint: ignore
Message-Id: <20230821200125.575F986024@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/testing:
 TestPolkitSystemd: fix systemctl exit code check on failure
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

commit: https://git.buildroot.net/buildroot/commit/?id=084cc7df3f0e3f90cef55f5df82ae8320c3609d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

As reported by [1] [2], the return code of systemctl command between
systemd 253 and 254 has changed when the polkit authentication is
refused:

/bin/systemctl restart systemd-timesyncd.service

The return code changed from 1 to 4. The Polkit test case
"TestPolkitSystemd" expected 1 as return code [3].

The service log is not the same either:

systemd v253:
Failed to restart systemd-timesyncd.service: Interactive authentication required.

systemd v254:
Failed to restart systemd-timesyncd.service: Access denied

git bisect report this commit:
https://github.com/systemd/systemd/commit/959301cf9f42418314abf027183dc25c08731b82

From the PR (to get more context):
https://github.com/systemd/systemd/pull/26365

Note: systemd doesn't recommend using systemctl exit code to check unit states:
"The mapping of LSB service states to systemd unit states is imperfect, so it is better to
not rely on those return values but to look for specific unit states and substates instead."

Since we only want to check if the command failed, update our test to
check if systemctl returned a non zero code whatever the reason of the
failure.

Thanks to Yann E. MORIN for the brainstorming!

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561464 (TestPolkitSystemd)

[1] http://lists.busybox.net/pipermail/buildroot/2023-August/671900.html
[2] https://lists.freedesktop.org/archives/systemd-devel/2023-August/049362.html
[3] https://git.buildroot.net/buildroot/tree/support/testing/tests/package/test_polkit.py?h=2023.08-rc1#n45
[4] https://github.com/systemd/systemd/blob/v254/man/systemctl.xml#L2612

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_polkit.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_polkit.py b/support/testing/tests/package/test_polkit.py
index 3da63c437b..3414fd5159 100644
--- a/support/testing/tests/package/test_polkit.py
+++ b/support/testing/tests/package/test_polkit.py
@@ -44,7 +44,7 @@ class TestPolkitSystemd(TestPolkitInfra):
         for rule_path in TestPolkitInfra.rule_paths:
             cmd = "su brtest -c '/bin/systemctl restart systemd-timesyncd.service'"
             _, exit_code = self.emulator.run(cmd, 10)
-            self.assertEqual(exit_code, 1)
+            self.assertNotEqual(exit_code, 0)
 
             cmd = "cp /root/{file} {path}".format(file=rule_file, path=rule_path)
             _, exit_code = self.emulator.run(cmd, 10)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
