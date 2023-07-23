Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E112C001DC
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 10:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D90D413D0;
	Sun, 23 Jul 2023 10:10:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D90D413D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6DRZpIJRQvIA; Sun, 23 Jul 2023 10:10:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 380EE41365;
	Sun, 23 Jul 2023 10:10:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 380EE41365
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A3B851BF5EA
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 10:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88CB141365
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 10:10:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88CB141365
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zao2VAx2sSb0 for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 10:10:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3739C410E7
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 10:10:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3739C410E7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BB648263F; Sun, 23 Jul 2023 10:10:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 23 Jul 2023 12:08:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 72520986963140a314097c5a7d68dc4b2c55358c
X-Git-Newrev: 4d70454754142a6334ec4a7e8cc6582bbf2f4b9d
X-Patchwork-Hint: ignore
Message-Id: <20230723101018.1BB648263F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/riscv: enable RISC-V Toolchain with
 Vector Extension
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4d70454754142a6334ec4a7e8cc6582bbf2f4b9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commits adds support for building a RISC-V toolchain with the
vector extension, available since gcc 12.

Signed-off-by: Tianrui Wei <tianrui@tianruiwei.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.riscv | 9 +++++++++
 arch/arch.mk.riscv   | 3 +++
 2 files changed, 12 insertions(+)

diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
index 853e8deb06..3dfbb4165f 100644
--- a/arch/Config.in.riscv
+++ b/arch/Config.in.riscv
@@ -18,6 +18,9 @@ config BR2_RISCV_ISA_RVD
 config BR2_RISCV_ISA_RVC
 	bool
 
+config BR2_RISCV_ISA_RVV
+	bool
+
 choice
 	prompt "Target Architecture Variant"
 	default BR2_riscv_g
@@ -62,6 +65,12 @@ config BR2_RISCV_ISA_CUSTOM_RVD
 config BR2_RISCV_ISA_CUSTOM_RVC
 	bool "Compressed Instructions (C)"
 	select BR2_RISCV_ISA_RVC
+
+config BR2_RISCV_ISA_CUSTOM_RVV
+	bool "Vector Instructions (V)"
+	select BR2_RISCV_ISA_RVV
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_12
+
 endif
 
 choice
diff --git a/arch/arch.mk.riscv b/arch/arch.mk.riscv
index 8d2236147c..ee5c434b97 100644
--- a/arch/arch.mk.riscv
+++ b/arch/arch.mk.riscv
@@ -26,6 +26,9 @@ endif
 ifeq ($(BR2_RISCV_ISA_RVC),y)
 GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)c
 endif
+ifeq ($(BR2_RISCV_ISA_RVV),y)
+GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)v
+endif
 
 # Starting from gcc 12.x, csr and fence instructions have been
 # separated from the base I instruction set, and special -march
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
