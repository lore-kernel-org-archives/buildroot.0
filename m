Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF5BC3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 19:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58DEB8117C;
	Fri, 12 Jul 2024 19:54:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id egnCfAz-96VD; Fri, 12 Jul 2024 19:54:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5954181296
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5954181296;
	Fri, 12 Jul 2024 19:54:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 15D351BF279
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19C2B84688
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:53:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8FksfyK_hINa for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 19:53:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E088845D4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E088845D4
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 19:53:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1B07F86171; Fri, 12 Jul 2024 19:53:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 21:52:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a411588b582ad6a0c8573ec9f59f737473d69bee
X-Git-Newrev: 28925c6c86c41f2539c057f1a67267e58b5b2057
X-Patchwork-Hint: ignore
Message-Id: <20240712195345.1B07F86171@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xvisor: fix RISC-V hang when
 BR2_SHARED_LIBS=y
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=28925c6c86c41f2539c057f1a67267e58b5b2057
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When BR2_SHARED_LIBS=y (shared libraries only) and BR2_PIC_PIE=y
(Build code with PIC/PIE), the toolchain-wrapper will try to enable
position-independent code/executables. See [1]. This configuration
is a common default.

Xvisor was likely tested only with RISC-V gcc from [2], which will
not enable PIE by default. Since Xvisor is a Type 1 hypervisor, it
needs the same kind of special treatment as U-Boot or Kernel.

This commit adds a patch to explicitly force static linking and
disable PIE for RISC-V architecture.

[1] https://git.buildroot.org/buildroot/tree/toolchain/toolchain-wrapper.c?h=2023.05.1#n392
[2] https://github.com/riscv-collab/riscv-gnu-toolchain

Signed-off-by: Julien Olivain <ju.o@free.fr>
[Arnout: renumber patch]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...ce-no-pie-code-generation-and-static-link.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/xvisor/0002-RISC-V-Force-no-pie-code-generation-and-static-link.patch b/package/xvisor/0002-RISC-V-Force-no-pie-code-generation-and-static-link.patch
new file mode 100644
index 0000000000..706fbbfbda
--- /dev/null
+++ b/package/xvisor/0002-RISC-V-Force-no-pie-code-generation-and-static-link.patch
@@ -0,0 +1,46 @@
+From 8491908238c4b3397571e9cff55765d59da03a45 Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Wed, 2 Aug 2023 23:57:17 +0200
+Subject: [PATCH] RISC-V: Force no-pie code generation and static link
+
+Some toolchains are now enabling PIE for security reasons by default.
+When XVisor is built with such a RISC-V toolchain, it is crashing
+just after OpenSBI, in early Xvisor startup (before any message is
+printed on the console).
+
+Hangs looks like those described in:
+
+https://github.com/xvisor/xvisor/issues/144
+https://github.com/xvisor/xvisor/issues/159
+
+Forcing -fno-pie code generation and -static link will explicitly disable
+PIE with those toolchains, hence fixing those issues.
+
+This issue was observed while using a riscv64 gcc toolchain from:
+https://toolchains.bootlin.com/downloads/releases/toolchains/riscv64-lp64d/tarballs/riscv64-lp64d--glibc--bleeding-edge-2022.08-1.tar.bz2
+
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+Upstream: https://github.com/xvisor/xvisor/pull/170
+---
+ arch/riscv/cpu/generic/objects.mk | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/arch/riscv/cpu/generic/objects.mk b/arch/riscv/cpu/generic/objects.mk
+index 230da2a1..576603f6 100644
+--- a/arch/riscv/cpu/generic/objects.mk
++++ b/arch/riscv/cpu/generic/objects.mk
+@@ -67,6 +67,11 @@ cpu-cflags += -fno-strict-aliasing -O2
+ cpu-asflags += $(arch-cflags-y) -march=$(march-nonld-isa-y)
+ cpu-ldflags += $(arch-ldflags-y) -march=$(march-ld-isa-y)
+ 
++cpu-cflags += -fno-pie
++cpu-asflags += -fno-pie
++cpu-ldflags += -static
++cpu-mergeflags += -static
++
+ cpu-objs-y+= cpu_entry.o
+ cpu-objs-y+= cpu_proc.o
+ cpu-objs-y+= cpu_tlb.o
+-- 
+2.41.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
