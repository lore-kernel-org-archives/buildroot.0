Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F849CA0EEB
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 14:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04E2740BD3;
	Tue, 19 Aug 2025 14:50:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TsmxU9_opj88; Tue, 19 Aug 2025 14:50:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1029B40BD5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1029B40BD5;
	Tue, 19 Aug 2025 14:50:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E026BE2
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 14:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C548140BD0
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 14:50:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PE2Qllq_qLiC for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 14:50:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D698C40B99
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D698C40B99
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 14:50:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF657876FE; Tue, 19 Aug 2025 14:50:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 19 Aug 2025 16:47:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ded3e0045aeeab226d2770fe8de522422c174434
X-Git-Newrev: 022ff55a39cad5d103b3bf29f887c37ec0b2f0f9
X-Patchwork-Hint: ignore
Message-Id: <20250819145053.CF657876FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/elfutils: fix build after 0.193
 version bump
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=022ff55a39cad5d103b3bf29f887c37ec0b2f0f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 0.193 version bump done in commit
c7508a23242aae7a80f22acc4473da25f7f9e96d broke the build on numerous
CPU architectures. Let's take a patch from upstream's main branch to
fix the issue.

Fixes:

  https://autobuild.buildroot.net/results/3b005f7afec386f6fa4237f427f73367d55bb211/ (sparc64)
  https://autobuild.buildroot.net/results/a6b1d5078abdd6c8def93aaffa2e67573250da3e/ (m68k)
  https://autobuild.buildroot.net/results/45305cc2be3b255740808ee1f3486d1a10abfbb4/ (microblaze)
  and a bunch more

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...30-backends-guard-asm-perf_regs.h-include.patch | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/package/elfutils/0003-PR32930-backends-guard-asm-perf_regs.h-include.patch b/package/elfutils/0003-PR32930-backends-guard-asm-perf_regs.h-include.patch
new file mode 100644
index 0000000000..76c604510b
--- /dev/null
+++ b/package/elfutils/0003-PR32930-backends-guard-asm-perf_regs.h-include.patch
@@ -0,0 +1,53 @@
+From d05241ce690018548857199bd34d7734c7164679 Mon Sep 17 00:00:00 2001
+From: Serhei Makarov <serhei@serhei.io>
+Date: Mon, 5 May 2025 12:08:55 -0400
+Subject: [PATCH] PR32930 backends/: guard asm/perf_regs.h include
+
+asm/perf_regs.h is an arch-specific linux include, not present on
+architectures like hppa and m68k that lack perf_events support.
+
+Only one place we need to fix; others already guard the include by
+architecture, or use architecture-independent headers (e.g.
+linux/perf_events.h).
+
+* backends/libebl_PERF_FLAGS.h: Only include asm/perf_regs.h on
+  architectures where we use it.
+
+Signed-off-by: Serhei Makarov <serhei@serhei.io>
+Upstream: d05241ce690018548857199bd34d7734c7164679
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ backends/libebl_PERF_FLAGS.h | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/backends/libebl_PERF_FLAGS.h b/backends/libebl_PERF_FLAGS.h
+index 2ed45f0f..51c20ea6 100644
+--- a/backends/libebl_PERF_FLAGS.h
++++ b/backends/libebl_PERF_FLAGS.h
+@@ -32,8 +32,12 @@
+ #define _LIBEBL_PERF_FLAGS_H 1
+ 
+ #if defined(__linux__)
++/* XXX Need to exclude __linux__ arches without perf_regs.h. */
++#if defined(__x86_64__) || defined(__i386__)
++/* || defined(other_architecture)... */
+ # include <asm/perf_regs.h>
+ #endif
++#endif
+ 
+ #if defined(_ASM_X86_PERF_REGS_H)
+ /* See the code in x86_initreg_sample.c for list of required regs and
+@@ -49,8 +53,8 @@
+    see the code in tools/perf/util/intel-pt.c intel_pt_add_gp_regs()
+    and note how regs are added in the same order as the perf_regs.h enum.  */
+ #else
+-/* Since asm/perf_regs.h gives the register layout for a different arch,
+-   we can't unwind x86_64 frames.  */
++/* Since asm/perf_regs.h is absent, or gives the register layout for a
++   different arch, we can't unwind i386 and x86_64 frames. */
+ #define PERF_FRAME_REGISTERS_I386 0
+ #define PERF_FRAME_REGISTERS_X86_64 0
+ #endif
+-- 
+2.50.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
