Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C174C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 11:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16B0382383;
	Fri, 10 Nov 2023 11:55:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16B0382383
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hHLdqcK04i6y; Fri, 10 Nov 2023 11:54:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60BE5818AC;
	Fri, 10 Nov 2023 11:54:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60BE5818AC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 16DFF1BF997
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 11:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFC45418D2
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 11:54:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFC45418D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1xyJm5vx9XLI for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 11:54:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F36E9400CE
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 11:54:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F36E9400CE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E310686EFC; Fri, 10 Nov 2023 11:54:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 12:48:32 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: cf635737ede4b1db7bdcb396a49f0abd0b62cd66
X-Git-Newrev: 682e55ce9abd43aafe234ba8d23df02e75377136
X-Patchwork-Hint: ignore
Message-Id: <20231110115442.E310686EFC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x]
 support/testing/infra/emulator.py: add a timeout argument for the login
 method
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

commit: https://git.buildroot.net/buildroot/commit/?id=682e55ce9abd43aafe234ba8d23df02e75377136
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

to override the current value of 60 seconds

As per a suggestion by Thomas, add a timeout argument to override the current
value of 60 seconds for the emulator.login method.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b1d554b9a769657b3a4c3263fc71c8028b33475d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
