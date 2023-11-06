Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDF9C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 19:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3ABDB612B7;
	Mon,  6 Nov 2023 19:45:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3ABDB612B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e-oimks3zZZs; Mon,  6 Nov 2023 19:45:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95C486129C;
	Mon,  6 Nov 2023 19:45:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95C486129C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 27B0F1BF29F
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B66C420AA
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B66C420AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 86U3aOOAa9yc for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 19:44:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5AD50420A7
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 19:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AD50420A7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 49334869A4; Mon,  6 Nov 2023 19:44:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 20:43:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c9316f21c7d07bfabccb1ab297773b7b83e217a0
X-Git-Newrev: 4889ac89b8438cfaba0708338fb52d553110c1a1
X-Patchwork-Hint: ignore
Message-Id: <20231106194413.49334869A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/tests/package/test_lxc.py:
 use timeout argument for emulator.login
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

commit: https://git.buildroot.net/buildroot/commit/?id=4889ac89b8438cfaba0708338fb52d553110c1a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

self.emulator.timeout_multiplier *= 10 is equivilent to 60 * 10 or 600.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_lxc.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/testing/tests/package/test_lxc.py b/support/testing/tests/package/test_lxc.py
index 5be4782e2d..0d03087a2c 100644
--- a/support/testing/tests/package/test_lxc.py
+++ b/support/testing/tests/package/test_lxc.py
@@ -33,9 +33,9 @@ class TestLxc(infra.basetest.BRTest):
         self.assertRunOk(cmd, 120)
 
     def wait_boot(self):
-        # the complete boot with systemd takes more time than what the default multipler permits
-        self.emulator.timeout_multiplier *= 10
-        self.emulator.login()
+        # the complete boot with systemd takes more time than what the
+        # default typically allows
+        self.emulator.login(timeout=600)
 
     def setup_run_test_container(self):
         self.run_ok("lxc-create -n lxc_iperf3 -t none -f /usr/share/lxc/config/minimal-iperf3.conf")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
