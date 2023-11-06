Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCD5C4167D
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 19:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 301E361288;
	Mon,  6 Nov 2023 19:44:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 301E361288
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CuyKrRhPc613; Mon,  6 Nov 2023 19:44:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F91D61261;
	Mon,  6 Nov 2023 19:44:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F91D61261
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 581681BF29F
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AB94415D0
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AB94415D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0gFBREUK2J_A for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 19:44:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 575CD415D1
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 19:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 575CD415D1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33D6B869A0; Mon,  6 Nov 2023 19:44:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 20:42:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1eb07c1904088b660d8c9b21b44b228cd824bece
X-Git-Newrev: b1d554b9a769657b3a4c3263fc71c8028b33475d
X-Patchwork-Hint: ignore
Message-Id: <20231106194413.33D6B869A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/infra/emulator.py: add a
 timeout argument for the login method
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

commit: https://git.buildroot.net/buildroot/commit/?id=b1d554b9a769657b3a4c3263fc71c8028b33475d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

to override the current value of 60 seconds

As per a suggestion by Thomas, add a timeout argument to override the current
value of 60 seconds for the emulator.login method.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/infra/emulator.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 02cf486128..09f81eca89 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -84,11 +84,11 @@ class Emulator(object):
 
     # Wait for the login prompt to appear, and then login as root with
     # the provided password, or no password if not specified.
-    def login(self, password=None):
+    def login(self, password=None, timeout=60):
         # The login prompt can take some time to appear when running multiple
         # instances in parallel, so set the timeout to a large value
         index = self.qemu.expect(["buildroot login:", pexpect.TIMEOUT],
-                                 timeout=60 * self.timeout_multiplier)
+                                 timeout=timeout * self.timeout_multiplier)
         if index != 0:
             self.logfile.write("==> System does not boot")
             raise SystemError("System does not boot")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
