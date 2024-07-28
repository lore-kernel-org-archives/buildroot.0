Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C830C3DA64
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 15:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 204ED4030F;
	Sun, 28 Jul 2024 15:46:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C-2Kww7GRyv0; Sun, 28 Jul 2024 15:46:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E238040312
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E238040312;
	Sun, 28 Jul 2024 15:46:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 341C41BF4DB
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 15:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F6458101C
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 15:46:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4v59oNZIK-B7 for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 15:46:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D4DAE80EF2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4DAE80EF2
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D4DAE80EF2
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 15:46:32 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C543EB0059A;
 Sun, 28 Jul 2024 17:46:26 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 28 Jul 2024 17:46:17 +0200
Message-ID: <20240728154617.41716-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1722181589;
 bh=owsbf6hodixVImzOKAepphjt6mq8AITeaGzVWWHHKgI=;
 h=From:To:Cc:Subject:Date:From;
 b=TiBIYEzqAqQdFILdqFelrpTscEz6fMVTJKp5zyyLZbwxjYfd8kCC2OJcEEj+UfjUx
 +hjS01wX8tl0YcRa1UZUTNUnXUjnW4WGNRsdnpYXqBywVQ5vjT0t6MK9H61aW/mQLe
 mFwEKjj8EKt5NOCJi7D8YP7pElrjilzGsLgXCHy6FTKvSWJKcZ0TKJC7LioIGS62X+
 lYjRK+NIVPJb6uAoP+B4Q6DaHj8GuMvd+Fv755wPnkELO+5lkDvqTzRPlYGtm2hQM9
 elB5xa6hLEN5F81uH1a4rrBKoEN59XAG/Mu3HQuaMqOhg4mx9lJYyXeR74nYdZKiqe
 Go8MsI0wFYPZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=TiBIYEzq
Subject: [Buildroot] [PATCH 1/1] support/testing/infra/emulator.py: add host
 load info in run log
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
Cc: Julien Olivain <ju.o@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
