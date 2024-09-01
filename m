Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFC6C54FC6
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 14:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B31A040433;
	Sun,  1 Sep 2024 14:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JuksD7xOLfKZ; Sun,  1 Sep 2024 14:56:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A3F140525
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A3F140525;
	Sun,  1 Sep 2024 14:56:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF60E1BF86B
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 14:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8FB5401C5
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 14:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gDhzzV8buU4A for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 14:56:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D25BC4013C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D25BC4013C
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 14:56:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF2BE868F9; Sun,  1 Sep 2024 14:56:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Sep 2024 16:47:07 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: c38cb8488e9ff19d05833aff5b144f558f325fb0
X-Git-Newrev: d46b2f5feaf3926a47b664188668a812b6662003
X-Patchwork-Hint: ignore
Message-Id: <20240901145644.BF2BE868F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 support/testing/infra/emulator.py: add host load info in run log
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

commit: https://git.buildroot.net/buildroot/commit/?id=d46b2f5feaf3926a47b664188668a812b6662003
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Runtime tests running on test runners are subject to a high
variability in term of performance and timing. Most or the runtime
test commands are executed with a timeout, in pexpect.

Slow or very loaded test runners can use the timeout_multiplier to
globally increase those timeouts.

Some runtime test commands sometimes needs to poll or query a state,
rather than having purely sequential actions. It is sometimes hard to
know, from the test writer point of view, the maximum timeout to set, or
if a retry logic is needed.

In order to help debugging runtime tests failing due very slow
execution, this commit adds extra information on the host test runner
about its load in the run log. Relevant information are: number of
cpus, the load average at the moment the emulator is started and the
current timeout_multiplier.

Note: this change was discussed in:
https://lists.buildroot.org/pipermail/buildroot/2024-July/759119.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7a6edbc7b9166c799b43cf9a9b78422c8e20ccc0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/infra/emulator.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 624740fcb1..2106d0e99b 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -2,6 +2,8 @@ import pexpect
 
 import infra
 
+import os
+
 
 class Emulator(object):
 
@@ -73,6 +75,11 @@ class Emulator(object):
         if kernel_cmdline:
             qemu_cmd += ["-append", " ".join(kernel_cmdline)]
 
+        self.logfile.write(f"> host cpu count: {os.cpu_count()}\n")
+        ldavg = os.getloadavg()
+        ldavg_str = f"{ldavg[0]:.2f}, {ldavg[1]:.2f}, {ldavg[2]:.2f}"
+        self.logfile.write(f"> host loadavg: {ldavg_str}\n")
+        self.logfile.write(f"> timeout multiplier: {self.timeout_multiplier}\n")
         self.logfile.write("> starting qemu with '%s'\n" % " ".join(qemu_cmd))
         self.qemu = pexpect.spawn(qemu_cmd[0], qemu_cmd[1:],
                                   timeout=5 * self.timeout_multiplier,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
