Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9214D1118C
	for <buildroot@archiver.kernel.org>; Sun,  3 Nov 2024 21:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 672F680B8F;
	Sun,  3 Nov 2024 21:30:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hEMM5fz9v-48; Sun,  3 Nov 2024 21:30:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 905F380B63
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 905F380B63;
	Sun,  3 Nov 2024 21:30:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4926C962
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 21:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4401D6059F
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 21:30:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hxNg7yxVzbbk for <buildroot@buildroot.org>;
 Sun,  3 Nov 2024 21:30:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 17B8460591
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17B8460591
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17B8460591
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 21:30:21 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 76136B0055A;
 Sun,  3 Nov 2024 22:30:16 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Sun,  3 Nov 2024 22:30:01 +0100
Message-ID: <20241103213001.2203278-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730669418;
 bh=p1Vxl+JDw6zkDCK62IqPPCpickHEJVRHNhiqnrbcnwY=;
 h=From:To:Cc:Subject:Date:From;
 b=sg3N5y6LahCEWqrvukWPWnD9Iyxi/eCDl+NhWUHECYH+cYm+rO6IRqNBast0LAuUV
 w5xzzmRnnv+0u4yYd3x6NtHeWZGVNcjAC+DtzR83nfb+MrnBEh9i8BimLNztUGwIP6
 339j7H425jvqGM/qvdNXxqaX2PWRnK/+XJqWY40GTTLna9If9RFCF1IKSEWb9Nw40t
 dL3WdND5b146B8jUv7/bObPESm19LPMY7eyjY8+3YOv/eIkQvbfdvtCrULqFUD5ZMY
 fzdvcmz6zCxNYfwZuk/TARzFyrDZ5fnxPcWky/G3ULm4Ob53vffTuI8Dvhcv+kALrP
 RXFE4VwPxf4Ag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sg3N5y6L
Subject: [Buildroot] [PATCH 1/1] arch/arm: add the Cortex-A78 core
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit adds the Cortex-A78 core, which is a armv8.2a ISA.
See: [1] [2].

This CPU support was added in GCC 11. See [3] [4].

Buildroot commit 771da1dd9 "configs/nvidia_bf3_defconfig: new
defconfig" [5] added the first defconfig for a board including
this CPU.

[1] https://developer.arm.com/Processors/Cortex-A78
[2] https://developer.arm.com/documentation/101430/0102/Functional-description/Introduction/About-the-core
[3] https://gcc.gnu.org/gcc-11/changes.html
[4] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/aarch64/aarch64-cores.def;hb=releases/gcc-11.1.0#l98
[5] https://gitlab.com/buildroot.org/buildroot/-/commit/771da1dd9b209adfb27d2dd344a4b2fdcc8bacc4

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 arch/Config.in.arm | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 219215d122..a11d581c43 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -466,6 +466,14 @@ config BR2_cortex_a76_a55
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
+config BR2_cortex_a78
+	bool "cortex-A78"
+	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_NEON if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8A
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
 config BR2_neoverse_n1
 	bool "neoverse-N1 (aka ares)"
 	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
@@ -876,6 +884,7 @@ config BR2_GCC_TARGET_CPU
 	default "cortex-a75.cortex-a55"	if BR2_cortex_a75_a55
 	default "cortex-a76"	if BR2_cortex_a76
 	default "cortex-a76.cortex-a55"	if BR2_cortex_a76_a55
+	default "cortex-a78"	if BR2_cortex_a78
 	default "neoverse-n1"	if BR2_neoverse_n1
 	default "tsv110"	if BR2_tsv110
 	# armv8.4a
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
