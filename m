Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB10C001B0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 20:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2327341744;
	Tue,  8 Aug 2023 20:06:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2327341744
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gnpKafCR_Eop; Tue,  8 Aug 2023 20:06:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17B3F41745;
	Tue,  8 Aug 2023 20:06:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17B3F41745
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A0DFA1BF5E0
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 20:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A80860C25
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 20:05:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A80860C25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FZSJiuKG_Kg0 for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 20:05:57 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4248960B58
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 20:05:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4248960B58
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 05A0D13F8B7;
 Tue,  8 Aug 2023 22:05:51 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 22:05:46 +0200
Message-ID: <20230808200546.21420-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691525154;
 bh=kS2P9krLyC3s6V/kvF3XpkM94Ee9rF0sB4wNFYVMuC4=;
 h=From:To:Cc:Subject:Date:From;
 b=NGrt1hCw42XgZB9qpeA2N/A1QnjTt+n/jSEcb44P1WMmeOL5LRBi+BEkFe59l0UuO
 YK5f7Kf5Lt9NOQuL3X/5XfPEwOOsFM0ZAXnNWBGNuNgZQXKvBZ181+lfQEZ2nCzysA
 YCQ7Pan9UT1WsC1fEZgVghtJd9keF0rEIkViFaG+FaLPCo6QrRNfHDZm8ewYeY9jo6
 hpXYEnAVa3wuCQpJoyjKp214NswjbW4RSdlIW+k0aRlPDMGYrgtkR9IyQVlVmJf0eU
 OhiNZFrBz+g2KT7G/QSpwEPfoOQqtSsSbirhLZh8Edlc4FjwU8wEW843PGNJkB6BoT
 VbBgRC6wZ+LlQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NGrt1hCw
Subject: [Buildroot] [PATCH 1/1] package/xvisor: fix RISC-V hang when
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
Note: I have a runtime test available for riscv64 xvisor, but Docker
image does not contain qemu-system-riscv64 yet. See:
https://patchwork.ozlabs.org/project/buildroot/patch/20230808195753.19748-1-ju.o@free.fr/
---
 ...-pie-code-generation-and-static-link.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/xvisor/0001-RISC-V-Force-no-pie-code-generation-and-static-link.patch

diff --git a/package/xvisor/0001-RISC-V-Force-no-pie-code-generation-and-static-link.patch b/package/xvisor/0001-RISC-V-Force-no-pie-code-generation-and-static-link.patch
new file mode 100644
index 0000000000..7c9ae92509
--- /dev/null
+++ b/package/xvisor/0001-RISC-V-Force-no-pie-code-generation-and-static-link.patch
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
+Upstream: Proposed: https://github.com/xvisor/xvisor/pull/170
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
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
