Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E85C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B75B5007B;
	Fri, 28 Feb 2025 17:10:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t9GPbTvHh3ay; Fri, 28 Feb 2025 17:10:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 377F55028F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 377F55028F;
	Fri, 28 Feb 2025 17:10:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FD151DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79C9D406B8
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NbWtyuqxkwJJ for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C28E42F42
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C28E42F42
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E35687B60; Fri, 28 Feb 2025 16:30:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 09:54:56 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 75c594d4468430067fbe1a9c81aefd80b4c2a064
X-Git-Newrev: a956eeb96b44e42423f997b22cf37dca83cb4e76
X-Patchwork-Hint: ignore
Message-Id: <20250228163028.4E35687B60@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/busybox: fix hwclock
 build issue on RISC-V 32-bit musl configs
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

commit: https://git.buildroot.net/buildroot/commit/?id=a956eeb96b44e42423f997b22cf37dca83cb4e76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Take a patch from meta-riscv, which was submitted upstream by Khem Raj
to fix a build issue on RISC-V 32-bit musl configurations. This issue
has been discussed with musl developers who believe this is a Busybox
issue. The patch from Khem works around the issue by making it a
runtime failure just affecting hwclock on RISC-V 32-bit musl instead
of a build failure. The correct fix is not really clear, as there
seems to be a disagreement between Busybox people and musl people on
what the C library settimeofday() function should do, and that's why
Busybox is bypassing settimeofday() on musl by making a direct system
call, except this system call doesn't exist on RISC-V 32-bit.

In the mean time, this patch fixes the long standing Gitlab CI issue:

- tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinRiscv32ilp32dMuslStable
  https://gitlab.com/buildroot.org/buildroot/-/jobs/8954291684

- tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinRiscv32ilp32dMuslBleedingEdge
  https://gitlab.com/buildroot.org/buildroot/-/jobs/8954291683

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ck-for-SYS_settimeofday-before-calling-sy.patch | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/package/busybox/0016-hwclock-Check-for-SYS_settimeofday-before-calling-sy.patch b/package/busybox/0016-hwclock-Check-for-SYS_settimeofday-before-calling-sy.patch
new file mode 100644
index 0000000000..c61cbc8107
--- /dev/null
+++ b/package/busybox/0016-hwclock-Check-for-SYS_settimeofday-before-calling-sy.patch
@@ -0,0 +1,54 @@
+From a378cd9c3a022500d7feaefb4e3bb43fdd789131 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 7 Mar 2021 17:30:24 -0800
+Subject: [PATCH] hwclock: Check for SYS_settimeofday before calling syscall
+
+Some newer architectures e.g. RISCV32 have 64bit time_t from get go and
+thusly do not have gettimeofday_time64/settimeofday_time64 implemented
+therefore check for SYS_settimeofday definition before making the
+syscall. Fixes build for riscv32 and it will bail out at runtime.
+
+Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2021-March/088583.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream: http://lists.busybox.net/pipermail/busybox/2021-March/088583.html
+[Thomas: this issue has been discussed on the musl mailing list, and
+the musl developers' opinion is that Busybox is wrong:
+https://www.openwall.com/lists/musl/2024/03/03/2
+https://www.openwall.com/lists/musl/2024/04/07/2. The correct fix
+isn't clear, and in the mean time, the patch from Khem turns the build
+issue into a runtime error only on the problematic architecture, which
+seems like a reasonable trade-off]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ util-linux/hwclock.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/util-linux/hwclock.c b/util-linux/hwclock.c
+index 723b09589..b9faaabbc 100644
+--- a/util-linux/hwclock.c
++++ b/util-linux/hwclock.c
+@@ -131,6 +131,7 @@ static void show_clock(const char **pp_rtcname, int utc)
+ 
+ static void set_kernel_tz(const struct timezone *tz)
+ {
++	int ret = 1;
+ #if LIBC_IS_MUSL
+ 	/* musl libc does not pass tz argument to syscall
+ 	 * because "it's deprecated by POSIX, therefore it's fine
+@@ -139,9 +140,11 @@ static void set_kernel_tz(const struct timezone *tz)
+ #if !defined(SYS_settimeofday) && defined(SYS_settimeofday_time32)
+ # define SYS_settimeofday SYS_settimeofday_time32
+ #endif
+-	int ret = syscall(SYS_settimeofday, NULL, tz);
++#if defined(SYS_settimeofday)
++	ret = syscall(SYS_settimeofday, NULL, tz);
++#endif
+ #else
+-	int ret = settimeofday(NULL, tz);
++	ret = settimeofday(NULL, tz);
+ #endif
+ 	if (ret)
+ 		bb_simple_perror_msg_and_die("settimeofday");
+-- 
+2.48.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
