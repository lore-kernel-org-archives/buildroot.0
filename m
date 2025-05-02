Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004AEC3ABAC
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C25E88055C;
	Fri,  2 May 2025 11:15:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OTVOQdp__LEN; Fri,  2 May 2025 11:15:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0AD8842A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0AD8842A9;
	Fri,  2 May 2025 11:15:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 261EC229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA46341E65
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xum_zN6xsaHz for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:11:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26E75419D4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26E75419D4
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2417781E82; Fri,  2 May 2025 11:11:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 May 2025 13:01:06 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4c80e9cd3e1aad53697a7985cbf81ce7ff252753
X-Git-Newrev: f1214d75b1acbf9182d0f42cb11f24124332f133
X-Patchwork-Hint: ignore
Message-Id: <20250502111138.2417781E82@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/linux-tools: fix
 parallel compilation
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f1214d75b1acbf9182d0f42cb11f24124332f133
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

linux-tools opportunistically set linux as only a patch dependency. This
unfortunately introduces a race condition in the shared linux scripts
when using PER_PACKAGE_DIRECTORIES and using top level parallelism. The
race manifests as the error "/bin/sh: 1: scripts/basic/fixdep:
Permission denied". This happens when the linux package and the
linux-tools package are being compiled in parallel.

The linux-tools currently using fixdep are perf and rtla. When the
timing is correct, perf, rtla, or the kernel Makefile will try to use
fixdep while one of the others is compiling fixed, resulting in fixdep
being briefly not available.

To fix this, set linux as a build dependency instead of a patch
dependency.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b074f6b72b8b9bd48e06be61c0d1fa80d7f0b740)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/linux-tools/linux-tools.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/linux-tools/linux-tools.mk b/package/linux-tools/linux-tools.mk
index 81b1fbc176..49e73a9ca4 100644
--- a/package/linux-tools/linux-tools.mk
+++ b/package/linux-tools/linux-tools.mk
@@ -19,8 +19,12 @@
 
 include $(sort $(wildcard package/linux-tools/*.mk.in))
 
-# We only need the kernel to be extracted, not actually built
-LINUX_TOOLS_PATCH_DEPENDENCIES = linux
+# Prevent the kernel from being compiled in parallel with linux-tools. The
+# kernel and some linux-tools (such as perf) use fixdep to manage kconfig
+# dependencies. There is a race condition where the kernel and linux-tools try
+# to build fixdep while the other tries to use fixdep, resulting in the use of
+# fixdep failing.
+LINUX_TOOLS_DEPENDENCIES = linux
 
 # Install Linux kernel tools in the staging directory since some tools
 # may install shared libraries and headers (e.g. cpupower).
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
