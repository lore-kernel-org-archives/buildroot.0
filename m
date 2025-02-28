Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8851CC282C5
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 22:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 172F5707F0;
	Fri, 28 Feb 2025 22:05:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7WJMSngfT2YT; Fri, 28 Feb 2025 22:05:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2996F76264
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2996F76264;
	Fri, 28 Feb 2025 21:50:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4697F1CB
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 21:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91F817253D
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 21:08:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dXWzxsEz8jTO for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 21:08:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 979C2713EF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 979C2713EF
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 21:01:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9227A87CF3; Fri, 28 Feb 2025 21:01:04 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 28 Feb 2025 21:10:58 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1af307504a4f1e7ed9704ae14cae49ce82fa8a00
X-Git-Newrev: 1b9bba85999b5840e5804a2f5d672c7a8d24792e
X-Patchwork-Hint: ignore
Message-Id: <20250228210104.9227A87CF3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/testing: include init
 script in iptables test
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b9bba85999b5840e5804a2f5d672c7a8d24792e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Check a save/start/stop cycle based on the rules created by direct
commands in the pre-existing test.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_iptables.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/support/testing/tests/package/test_iptables.py b/support/testing/tests/package/test_iptables.py
index 924a483ddb..6e4db0ac06 100644
--- a/support/testing/tests/package/test_iptables.py
+++ b/support/testing/tests/package/test_iptables.py
@@ -11,6 +11,7 @@ class TestIptables(infra.basetest.BRTest):
         """
         BR2_aarch64=y
         BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_INIT_BUSYBOX=y
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
@@ -70,9 +71,26 @@ class TestIptables(infra.basetest.BRTest):
         _, exit_code = self.emulator.run(ping_test_cmd)
         self.assertNotEqual(exit_code, 0)
 
+        # Save the current rules to test the init script later.
+        self.assertRunOk("/etc/init.d/S35iptables save")
+
         # We delete our only rule #1 in the INPUT chain.
         self.assertRunOk("iptables --delete INPUT 1")
 
         # Since we deleted the rule, the ping test command which was
         # supposed to fail earlier is now supposed to succeed.
         self.assertRunOk(ping_test_cmd)
+
+        # Load the rules as saved before.
+        self.assertRunOk("/etc/init.d/S35iptables start")
+
+        # Ping to 127.0.0.2 is expected to fail again.
+        _, exit_code = self.emulator.run(ping_test_cmd)
+        self.assertNotEqual(exit_code, 0)
+
+        # And flush the rules again.
+        self.assertRunOk("/etc/init.d/S35iptables stop")
+
+        # Since we deleted the rule, the ping test command which was
+        # supposed to fail earlier is now supposed to succeed.
+        self.assertRunOk(ping_test_cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
