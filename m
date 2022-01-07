Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A07C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 17:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0895760AD1;
	Fri,  7 Jan 2022 17:14:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HeWNk4iVrqMs; Fri,  7 Jan 2022 17:14:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E11560AC4;
	Fri,  7 Jan 2022 17:14:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C17F11C116E
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 17:13:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE195404B5
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 17:13:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jYb2Iix6K1_i for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 17:13:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1D3F40192
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 17:13:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id C8775240004;
 Fri,  7 Jan 2022 17:13:28 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Date: Fri,  7 Jan 2022 18:13:14 +0100
Message-Id: <20220107171318.1423075-5-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220107171318.1423075-1-thomas.petazzoni@bootlin.com>
References: <20220107171318.1423075-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/7] package/rustc: fix the riscv64gc
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

riscv64gc was made available for BR2_riscv, but RISC-V can be 32-bit
or 64-bit, so we need to restrict it to BR2_RISCV_64. There's no need
to keep the BR2_riscv dependency, as BR2_RISCV_64 can only be true
when BR2_riscv is true.

Also, BR2_PACKAGE_HOST_RUSTC_ARCH needs to be set to riscv64gc to
allow rust-bin to download its pre-compiled standard library
correctly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rustc/Config.in.host | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index 05324ad755..8c8b75c0a2 100644
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
 	default BR2_ARCH if !BR2_ARM_CPU_ARMV7A
 
 config BR2_PACKAGE_HOST_RUSTC_ABI
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
