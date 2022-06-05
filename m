Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E8DC433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 19:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85F9B612A4;
	Sun,  5 Jun 2022 19:44:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VUbQK1CgBJzu; Sun,  5 Jun 2022 19:44:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96C8F612A3;
	Sun,  5 Jun 2022 19:44:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A2B401BF388
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 19:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 910EA40D33
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 19:43:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9NioPRMCaq0D for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 19:43:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A22040D24
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 19:43:21 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 0879F240002;
 Sun,  5 Jun 2022 19:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654458199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hatnkj4aD+RgLot0+W5xFHdxVpISYG654KsfhD1Tp+U=;
 b=U6SdWNN42XoY/GFqXIYxD9g3mIbaPAwkeOD3U5BgD4eWpwKZUVIThn3EHd6fqEjf0HTyFw
 flZ0vJj7130YeoLu+UbxlLBDeBml05gJOtJ06XMW7UMdS95CQY8H/SQh5ZHFkDGCoCfS/B
 9trhJsukbWF4HBK8VDVfqceSwJwk2qLVJhl40tXN2Z6Q1sfBxKF2+RjnJhTx2/LpbwwDsZ
 lkZN2r3VTvlRkYgzCFxDCvXfNFS5OT4LKuinFUB+LCDPEA49dP19LATeawTHke6MbYP2JF
 FRuCr5cHnxGU9tsJ1iPNz0UVjnJQlTKE1pAR2iUsSHg/8v84sofXhGolHWnxkA==
To: Buildroot List <buildroot@buildroot.org>,
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 James Hilliard <james.hilliard1@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Sun,  5 Jun 2022 21:42:59 +0200
Message-Id: <20220605194259.2928568-8-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220605194259.2928568-1-thomas.petazzoni@bootlin.com>
References: <20220605194259.2928568-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 7/7]
 toolchain/toolchain-external/toolchain-external-bootlin: regenerate with
 correct !BR2_STATIC_LIBS handling
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit is simply the result of regenerating the
toolchain-external-bootlin package after gen-bootlin-toolchains was
changed in commit "support/scripts/gen-bootlin-toolchains: properly
take into account !BR2_STATIC_LIBS for glibc toolchains".

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../toolchain-external-bootlin/Config.in.options       | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index 53034c4f5e..06a9ddf2d2 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -22,21 +22,21 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
 	default y if BR2_mips64 && BR2_mips_64 && BR2_MIPS_NABI32 && !BR2_MIPS_SOFT_FLOAT
 	default y if BR2_mips64el && BR2_mips_64 && BR2_MIPS_NABI32 && !BR2_MIPS_SOFT_FLOAT
 	default y if BR2_mips64el && BR2_mips_64r6 && BR2_MIPS_NABI32 && !BR2_MIPS_SOFT_FLOAT
-	default y if BR2_nios2
+	default y if BR2_nios2 && !BR2_STATIC_LIBS
 	default y if BR2_or1k
 	default y if BR2_powerpc && BR2_powerpc_440fp
 	default y if BR2_powerpc && BR2_powerpc_e300c3
 	default y if BR2_powerpc && BR2_powerpc_e500mc
-	default y if BR2_powerpc64 && BR2_powerpc_e5500
+	default y if BR2_powerpc64 && BR2_powerpc_e5500 && !BR2_STATIC_LIBS
 	default y if BR2_powerpc64 && BR2_powerpc_e6500
 	default y if BR2_powerpc64 && BR2_powerpc_power8
 	default y if BR2_powerpc64le && BR2_powerpc_power8
-	default y if BR2_riscv && BR2_riscv_g && BR2_RISCV_32 && BR2_RISCV_ABI_ILP32D
+	default y if BR2_riscv && BR2_riscv_g && BR2_RISCV_32 && BR2_RISCV_ABI_ILP32D && !BR2_STATIC_LIBS
 	default y if BR2_riscv && BR2_riscv_g && BR2_RISCV_64 && BR2_RISCV_ABI_LP64D
-	default y if BR2_s390x && BR2_s390x_z13
+	default y if BR2_s390x && BR2_s390x_z13 && !BR2_STATIC_LIBS
 	default y if BR2_sh && BR2_sh4
 	default y if BR2_sh && BR2_sh4aeb
-	default y if BR2_sparc64 && BR2_sparc_v9
+	default y if BR2_sparc64 && BR2_sparc_v9 && !BR2_STATIC_LIBS
 	default y if BR2_sparc && BR2_sparc_v8
 	default y if BR2_x86_64 && BR2_X86_CPU_HAS_MMX && BR2_X86_CPU_HAS_SSE && BR2_X86_CPU_HAS_SSE2
 	default y if BR2_x86_64 && BR2_X86_CPU_HAS_MMX && BR2_X86_CPU_HAS_SSE && BR2_X86_CPU_HAS_SSE2 && BR2_X86_CPU_HAS_SSE3 && BR2_X86_CPU_HAS_SSSE3 && BR2_X86_CPU_HAS_SSE4 && BR2_X86_CPU_HAS_SSE42
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
