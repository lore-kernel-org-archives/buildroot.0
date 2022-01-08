Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C02C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 16:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C39C60AE3;
	Sat,  8 Jan 2022 16:53:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mEr0T_VyXSHW; Sat,  8 Jan 2022 16:53:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F17960A93;
	Sat,  8 Jan 2022 16:53:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 107001BF599
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 16:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3BB260674
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 16:52:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BT5nfLRtVWAA for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 16:52:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D46660A93
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 16:52:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A463581DFE; Sat,  8 Jan 2022 16:46:22 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 17:51:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1ed4147e76fe56322c47468be8a222204c459adf
X-Git-Newrev: 79c5639597e961a36ee10e55b0479e642013448f
X-Patchwork-Hint: ignore
Message-Id: <20220108164622.A463581DFE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rustc: fix the riscv64gc
 architecture handling
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=79c5639597e961a36ee10e55b0479e642013448f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

riscv64gc was made available for BR2_riscv, but RISC-V can be 32-bit
or 64-bit, so we need to restrict it to BR2_RISCV_64. There's no need
to keep the BR2_riscv dependency, as BR2_RISCV_64 can only be true
when BR2_riscv is true.

Also, BR2_PACKAGE_HOST_RUSTC_ARCH needs to be set to riscv64gc to
allow rust-bin to download its pre-compiled standard library
correctly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/rustc/Config.in.host | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index fe7404b3bd..80d1d1a3d8 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -49,7 +49,7 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_HOST_TOOLS_PLATFORMS
 	default y if BR2_powerpc64le && BR2_TOOLCHAIN_USES_GLIBC
 	# riscv64gc-unknown-linux-gnu
 	# "g" stands for imafd, and we also need "c".
-	default y if BR2_riscv && BR2_RISCV_ISA_RVI && BR2_RISCV_ISA_RVM && \
+	default y if BR2_RISCV_64 && BR2_RISCV_ISA_RVI && BR2_RISCV_ISA_RVM && \
 			BR2_RISCV_ISA_RVA && BR2_RISCV_ISA_RVF && \
 			BR2_RISCV_ISA_RVD && BR2_RISCV_ISA_RVC && \
 			BR2_TOOLCHAIN_USES_GLIBC
@@ -104,6 +104,7 @@ config BR2_PACKAGE_HOST_RUSTC_ARCH
 	string
 	default "armv5te" if BR2_ARM_CPU_ARMV5
 	default "armv7"  if BR2_ARM_CPU_ARMV7A
+	default "riscv64gc" if BR2_RISCV_64
 	default BR2_ARCH
 
 config BR2_PACKAGE_HOST_RUSTC_ABI
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
