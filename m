Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0245C4829A
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 22:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 585D3835EF;
	Sun, 11 Feb 2024 22:30:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jh3rdp1aJ2Qj; Sun, 11 Feb 2024 22:30:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A40C83A15
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A40C83A15;
	Sun, 11 Feb 2024 22:30:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 394231BF44A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 22:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 340FC416F6
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 22:30:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eqyj1oZu9zh8 for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 22:30:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 422CA416A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 422CA416A2
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 422CA416A2
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 22:30:54 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D3BA313F88D;
 Sun, 11 Feb 2024 23:30:50 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 23:30:46 +0100
Message-ID: <20240211223046.1768519-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707690652;
 bh=FTy+mXDcISNJf1HzzLxxSbSN0m+OzXqmAfGxrpuggi8=;
 h=From:To:Cc:Subject:Date:From;
 b=NE6OynVx+Cdesrsj7V5FwnONTsGbhg1IXsaVduTUbi7v6Fni44JzpcY42nndAcRY1
 Q821ZTv+Tcpy/oWcWMMiYO0UzvMW7ozC7ounKHWmVCM4fKkkcM5cG8IvoD8NB3jQUp
 jdXZtp5hBPNDtc0tEC5H6bHkSP99FaJMk3b4FszgIRTIQ20n7jtCM+jLJdX4aZTjtV
 BGmO0wlEoH6KEtd9SLpsDSbfhi3+ZJfpsG0y1pHa4SEjsPVo0Y9+wYtaPA0ouYwMhd
 Jp4JpFIhOuKBLgGJPhAdWtr5W75ZFD5BhK6pKVpL/Bs7j2tzjghdm0o/hRWAhlg/DC
 bHRduGur21ygg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NE6OynVx
Subject: [Buildroot] [PATCH 1/1] support/testing: mdadm: improve test
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 support/testing/tests/package/test_mdadm.py | 22 ++++++++++++++-------
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
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
