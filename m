Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067D3D3B98B
	for <buildroot@archiver.kernel.org>; Tue, 26 Nov 2024 13:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE6946FA42;
	Tue, 26 Nov 2024 13:50:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id abf1sdK-tEZY; Tue, 26 Nov 2024 13:50:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5C0C6FA44
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5C0C6FA44;
	Tue, 26 Nov 2024 13:50:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7204E4961
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6036D6FA41
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:49:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5XFA4A41wBJK for <buildroot@buildroot.org>;
 Tue, 26 Nov 2024 13:49:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CD496FA3E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CD496FA3E
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:49:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82B5786697; Tue, 26 Nov 2024 13:49:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Nov 2024 14:38:43 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 61855e0bc784cbf9dc53b37452b3dcfd26b42118
X-Git-Newrev: 8b83136326502b178886b8d0686e5aa4ddb4d93b
X-Patchwork-Hint: ignore
Message-Id: <20241126134958.82B5786697@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 support/testing/infra/emulator.py: support init=/bin/sh
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=8b83136326502b178886b8d0686e5aa4ddb4d93b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The TestInitSystemNone bypasses the normal init and instead launches
directly into a shell. So it needs to bypass the login code and go
directly to a shell.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 95e10430131fb524a27985b82ee70ae8d0fe71d9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/infra/emulator.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 4be7e9598b..d0f190b924 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -137,6 +137,9 @@ class Emulator(object):
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
