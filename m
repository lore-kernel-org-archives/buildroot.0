Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA4DC3DA64
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 19:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4DB5401AD;
	Sun, 28 Jul 2024 19:52:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Uz_cVUEafCX; Sun, 28 Jul 2024 19:52:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B36F403BF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B36F403BF;
	Sun, 28 Jul 2024 19:52:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CDF8E1BF577
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 19:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC853606D3
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 19:52:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6xol1xhQfjHc for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 19:52:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA37D60628
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA37D60628
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 19:52:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DFD3982860; Sun, 28 Jul 2024 19:52:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Jul 2024 21:51:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e6816ece5b425fce6fc3e080178ff04060b8ef08
X-Git-Newrev: 7a6edbc7b9166c799b43cf9a9b78422c8e20ccc0
X-Patchwork-Hint: ignore
Message-Id: <20240728195211.DFD3982860@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/infra/emulator.py: add
 host load info in run log
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

commit: https://git.buildroot.net/buildroot/commit/?id=7a6edbc7b9166c799b43cf9a9b78422c8e20ccc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 support/testing/infra/emulator.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index be26d4caa4..5318577cda 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -1,6 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 # SPDX-License-Identifier: ISC
 
+import os
+
 import pexpect
 import pexpect.replwrap
 
@@ -108,6 +110,11 @@ class Emulator(object):
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
