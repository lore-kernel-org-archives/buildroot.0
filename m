Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FAD7C54E49
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 16:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F25B81FAC;
	Sun,  3 Mar 2024 16:48:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BIQjtNUKNN2D; Sun,  3 Mar 2024 16:48:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E19881FB6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E19881FB6;
	Sun,  3 Mar 2024 16:48:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9198F1BF8B4
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F10781FAC
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 16:48:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id exQSxlsRB_20 for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 16:48:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3CE581FB6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3CE581FB6
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 16:48:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E7E987FD8; Sun,  3 Mar 2024 16:48:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 Mar 2024 17:30:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7781cdca3163035f3f89df90605cde7c5b7cd3c5
X-Git-Newrev: 1140bfd950f3d211306f10b6e40deabd91d55b16
X-Patchwork-Hint: ignore
Message-Id: <20240303164812.8E7E987FD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: mdadm: improve test
 robustness on slow runners
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1140bfd950f3d211306f10b6e40deabd91d55b16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As expected by Peter in [1], the hardcoded 3 seconds for waiting the
RAID array to rebuild are not enough on slow test host runners. This
test already failed at least once for that reason, in [2].

In order to fix those failures, this commit adds extra logic to allow
several attempts, before failing. The timeout is currently set at 10
attempts, waiting 3 seconds between each attempts. To help even more,
those 3 seconds are also scaled with the timeout_multiplier.

Fixes: [2]

[1] https://lists.buildroot.org/pipermail/buildroot/2024-February/685034.html
[2] https://gitlab.com/buildroot.org/buildroot/-/jobs/6137469690

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 support/testing/tests/package/test_mdadm.py | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/support/testing/tests/package/test_mdadm.py b/support/testing/tests/package/test_mdadm.py
index 75385309a6..d5abdb0706 100644
--- a/support/testing/tests/package/test_mdadm.py
+++ b/support/testing/tests/package/test_mdadm.py
@@ -122,13 +122,21 @@ class TestMdadm(infra.basetest.BRTest):
         # We add back this blank drive to the array.
         self.assertRunOk(f"mdadm {md_dev} --add {failing_dev}")
 
-        # We wait few seconds to let the device rebuild.
-        time.sleep(3)
-
-        # The array should no longer be marked as degraded.
-        out, ret = self.emulator.run(monitor_cmd)
-        self.assertEqual(ret, 0)
-        self.assertNotIn("DegradedArray", "\n".join(out))
+        # Device rebuild can take a variable amount of time, depending
+        # on the load of the test controller host. So we will allow
+        # several attempts, before failing.
+        for attempt in range(10):
+            # We wait few seconds to let the device rebuild.
+            time.sleep(3 * self.timeout_multiplier)
+
+            # Once rebuilt, the array should no longer be marked as
+            # degraded.
+            out, ret = self.emulator.run(monitor_cmd)
+            self.assertEqual(ret, 0)
+            if "DegradedArray" not in "\n".join(out):
+                break
+        else:
+            self.fail("Timeout while waiting for the array to rebuild.")
 
         # With all those array manipulations, the data file should not
         # be corrupted. We should be able to recompute the same hash
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
