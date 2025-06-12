Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F41E7C61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA64B40B79;
	Thu, 12 Jun 2025 20:13:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qiVYwGsAXpSo; Thu, 12 Jun 2025 20:13:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E363640AEF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E363640AEF;
	Thu, 12 Jun 2025 20:13:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11E2A183
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D50484099B
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5mTVF5XK-3EG for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F36740976
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F36740976
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D91983554; Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Jun 2025 14:40:23 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 33e6f2e395fda8aff010ff77864da2daeaa51112
X-Git-Newrev: 9a679974547af0207238c5a109d3cf994dbd3ab7
X-Patchwork-Hint: ignore
Message-Id: <20250612201229.6D91983554@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/testing:
 test_timezone: fix test by setting a fixed time
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9a679974547af0207238c5a109d3cf994dbd3ab7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
(cherry picked from commit 0839545a9bc51792f40c46b52dac50c543a5cf4f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
