Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76440107BCE6
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 20:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 367B260832;
	Fri, 13 Mar 2026 20:55:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Q0_8w_9gTLN; Fri, 13 Mar 2026 20:55:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AFEC608C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773435311;
	bh=UBIv2WrL4ezZoC5IUG3SkeX212bpvJo1kJAv0/JJPh0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Kei9Vw/FuNvKqSkXMiZHVG+XnomLzVdt2BMcCmdtjtPFlYqzQTgsFPG4h+Pay9dNd
	 uA2nU0r5tyjMkcmisyU+oDwSKHHrNbJzAzRo/c6E2T02FLxXPRoPQs40sl+Rij5ryO
	 Thw8zP2MSOHYKSM7eb7q6xLnA4mUoeZtSEYaMOl5ERtM9jIMUVQ1mUWKO8GNja/Odh
	 lNnJxX2TDkhaUacIe6y3oyPIFUvUGLnRxoMpjAcyqPjAercIM1H8y3rWhE2BSQ/gTF
	 x39pnzIw8iadc2Tkoitv4MXMhMFK6DBgAl7C8B1OjDVBvDBDWf4S3xjD4Okj6KUsMH
	 A0WtauAWYYrJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AFEC608C5;
	Fri, 13 Mar 2026 20:55:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 14716787
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 058D840604
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:55:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fmfHtCoSVQuc for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 20:55:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C32D405F3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C32D405F3
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:55:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2FDF986FAC; Fri, 13 Mar 2026 20:55:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 21:52:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 99d626822348e1edd79b7363f010dd549c37c976
X-Git-Newrev: efe7aa7ca47ba3e21032c69467519928bb4202a6
X-Patchwork-Hint: ignore
Message-Id: <20260313205508.2FDF986FAC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/arm: add the Neoverse-V2 core
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/efe7aa7ca47ba3e21032c69467519928bb4202a6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This commit adds the Neoverse-V2 core, which is an armv9.0a ISA.
See: [1] [2].

This CPU support was added in GCC 13. See [3] [4] [5].

This CPU supports Aarch64 at all exception levels (EL0 to EL3).
It also supports Aarch32 only in EL0 (user-space). This means it's
technically possible to compile Aarch32 code. GCC has the support
to do so. Since Buildroot recompiles a full system (ATF, Kernel,
user-space) this support has limited value. This is why this
CPU is limited to 64bit builds only.

Note: at the time of this commit, the latest binutils v2.46 does not
include a Neoverse-V2 support for its '-mcpu' option. See [6]. This is
not an issue because gcc will call the "as" assembler with the relevant
"-march=armv9-a+EXTENSION..." options. Binutils supports "armv9-a"
since upstream commit [7] (first included in 2.38), and the oldest
Binutils version in Buildroot is 2.44.

[1] https://developer.arm.com/Processors/Neoverse%20V2
[2] https://developer.arm.com/documentation/102375/latest/
[3] https://gcc.gnu.org/gcc-13/changes.html#aarch64
[4] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/aarch64/aarch64-cores.def;hb=releases/gcc-13.1.0#l184
[5] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=14d4b4fb12041dde1511262b926662929196c3fe
[6] https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=gas/config/tc-aarch64.c;h=cd76163488c48e45d43c35b2704d637999d51015;hb=3e93b95c3ae3f00a0283ddbab8029cbc07d96aff#l10833
[7] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=d5007f0280d881a8add44e6a68a3f536e138244c

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 arch/Config.in.arm | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 16911f5b95..e9f3c53e0d 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -524,6 +524,12 @@ config BR2_neoverse_n2
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV9A
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
+config BR2_neoverse_v2
+	bool "neoverse-V2 (aka demeter)"
+	depends on BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV9A
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 
 comment "armv9.2a cores"
 config BR2_cortex_a720
@@ -929,6 +935,7 @@ config BR2_GCC_TARGET_CPU
 	# armv9.0a
 	default "cortex-a710"	if BR2_cortex_a710
 	default "neoverse-n2"	if BR2_neoverse_n2
+	default "neoverse-v2"	if BR2_neoverse_v2
 	# armv9.2a
 	default "cortex-a720"	if BR2_cortex_a720
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
