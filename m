Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACC9C3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 19:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AF1F60597;
	Mon, 22 Jul 2024 19:51:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mQmx8I1E8t07; Mon, 22 Jul 2024 19:51:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA58E60604
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA58E60604;
	Mon, 22 Jul 2024 19:51:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4C52B1BF31D
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 19:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4677860604
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 19:51:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LYkcgk8FS_ks for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 19:51:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79DED60597
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79DED60597
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 19:51:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 67D17870D4; Mon, 22 Jul 2024 19:51:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 21:51:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5ed1fab018db9a001b072fd7bcb3dd3db280aabe
X-Git-Newrev: 95e10430131fb524a27985b82ee70ae8d0fe71d9
X-Patchwork-Hint: ignore
Message-Id: <20240722195114.67D17870D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/infra/emulator.py: support
 init=/bin/sh
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

commit: https://git.buildroot.net/buildroot/commit/?id=95e10430131fb524a27985b82ee70ae8d0fe71d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The TestInitSystemNone bypasses the normal init and instead launches
directly into a shell. So it needs to bypass the login code and go
directly to a shell.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/infra/emulator.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 950843e37d..be26d4caa4 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -133,6 +133,9 @@ class Emulator(object):
             self.qemu.expect("Password:")
             self.qemu.sendline(password)
 
+        self.connect_shell()
+
+    def connect_shell(self):
         extra_init_cmd = " && ".join([
             'export PAGER=cat',
             'dmesg -n 1',
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
