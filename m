Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DDDC5AD49
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 19:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B55881B60;
	Wed, 28 May 2025 19:57:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3jHrI2S1ODiM; Wed, 28 May 2025 19:57:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DE2A813C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DE2A813C3;
	Wed, 28 May 2025 19:57:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 12A11127
 for <buildroot@buildroot.org>; Wed, 28 May 2025 19:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 04BA560EE7
 for <buildroot@buildroot.org>; Wed, 28 May 2025 19:57:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XYcy16dIb9DB for <buildroot@buildroot.org>;
 Wed, 28 May 2025 19:57:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41DFA60EEF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41DFA60EEF
 for <buildroot@buildroot.org>; Wed, 28 May 2025 19:57:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2BFFA8768B; Wed, 28 May 2025 19:57:08 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 28 May 2025 21:54:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 43dcaa19a0a8549df39f51ab6782840834ea79a8
X-Git-Newrev: 0839545a9bc51792f40c46b52dac50c543a5cf4f
X-Patchwork-Hint: ignore
Message-Id: <20250528195708.2BFFA8768B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_timezone: fix test
 by setting a fixed time
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

commit: https://git.buildroot.net/buildroot/commit/?id=0839545a9bc51792f40c46b52dac50c543a5cf4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit [1], the runtime test emulator infra is setting
the emulated system date to the host date.

While this is desired in general, this behaviour is introducing a
variability in the test execution. Depending if the test is executed
during winter or summer time, the output of the command "date +%Z"
will produce a different output.

This commit fixes the issue by setting a fixed date and time on the
emulated system. The date is fixed to Unix Epoch plus one hour. This
is because Linux cannot set the system date to a value less than the
system uptime. So we cannot set the time back to Unix Epoch with the
command "date -s @0" (this would result to a EINVAL Invalid argument).

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/9922589073
https://gitlab.com/buildroot.org/buildroot/-/jobs/9922589081

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/cf8641b73e7f1577637bfef0ece78dd519b25d19

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/core/test_timezone.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/support/testing/tests/core/test_timezone.py b/support/testing/tests/core/test_timezone.py
index bf4a47fcde..bfb9604f66 100644
--- a/support/testing/tests/core/test_timezone.py
+++ b/support/testing/tests/core/test_timezone.py
@@ -9,6 +9,24 @@ def boot_armv5_cpio(emulator, builddir):
                   options=["-initrd", img])
     emulator.login()
 
+    # emulator.login() sets the emulated system date to the host
+    # date. In general, this is desirable (for correct SSL certificate
+    # behaviors, for example).
+    #
+    # This timezone runtime test checks that a Buildroot configuration
+    # is reflected in the generated system at runtime, using the
+    # standard "date" command. To make sure this test is stable in
+    # time (i.e. output is independent to the date/time the test is
+    # executed due to daylight saving time changes), we reset the
+    # system date to a constant value.
+    #
+    # We cannot set the system date to a value less than the system
+    # uptime. So we cannot set the time back to Unix Epoch with the
+    # command "date -s @0" (this would result to a EINVAL Invalid
+    # argument). Instead, we set the time at 1 hour after Epoch. This
+    # is sufficient as the emulated system takes few seconds to start.
+    emulator.run("date -s @3600")
+
 
 class TestNoTimezone(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
