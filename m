Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D989BC433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Jun 2022 07:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D3C860FEE;
	Wed,  8 Jun 2022 07:11:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GvuEHmQiQekX; Wed,  8 Jun 2022 07:11:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B40AC60FD8;
	Wed,  8 Jun 2022 07:11:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B26C11BF3D2
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 07:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1488404A9
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 07:10:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7lueG_4w3N1E for <buildroot@lists.busybox.net>;
 Wed,  8 Jun 2022 07:10:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 49BA240363
 for <buildroot@buildroot.org>; Wed,  8 Jun 2022 07:10:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 18D76FF810;
 Wed,  8 Jun 2022 07:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654672239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pJ0aKh9TjfmH3AkTPGD8kxT8KmXSr+HT8AeTtO3ChfE=;
 b=Em2o5oeMkAmroNxSMDRpfas4XqVmQlf3PYAYvVIgIUQBR90yzTdTMdUrraNJbvqnmI329t
 savPBFuyV0bKLlZJdTTIfA2QW47/R5j3zEdphYl3GRqDVUFGiEQI3kQwexSLeBOahGQavg
 aSyfFwKUfHGu3dik5zOQJ8b7LhQDp2TUQJYSGpa98UpG9kHqmZihkcjID3epnFz6KMftkJ
 cm0mgZukaYYf60aJhQWSTTpN/hfUO2JuEVvjuWYGaWKMJc3Qym9wqFSBYM1vMcd+WSTTne
 W1wIHCOCDbiygO41Vy3w84dR9WQTQ9c2BLNNEl6cmLgO1gL+eOAXJlIjOq0EuA==
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Date: Wed,  8 Jun 2022 09:10:18 +0200
Message-Id: <20220608071027.3384469-7-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220608071027.3384469-1-thomas.petazzoni@bootlin.com>
References: <20220608071027.3384469-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 06/14]
 toolchain/toolchain-external/toolchain-external-bootlin: regenerate after
 i686 toolchain dependency fixes
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:

  http://autobuild.buildroot.net/results/56ac1a8fa5b34a9ca10eef98ae9fb090b8c762c4/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../Config.in.options                         | 32 ++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index 825556a5da..6e98a1dfda 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -44,7 +44,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
 	default y if BR2_x86_64 && BR2_X86_CPU_HAS_MMX && BR2_X86_CPU_HAS_SSE && BR2_X86_CPU_HAS_SSE2 && BR2_X86_CPU_HAS_SSE3 && BR2_X86_CPU_HAS_SSSE3 && BR2_X86_CPU_HAS_SSE4 && BR2_X86_CPU_HAS_SSE42 && BR2_X86_CPU_HAS_AVX && BR2_X86_CPU_HAS_AVX2 && BR2_X86_CPU_HAS_AVX512
 	default y if BR2_x86_64 && BR2_X86_CPU_HAS_MMX && BR2_X86_CPU_HAS_SSE && BR2_X86_CPU_HAS_SSE2 && BR2_X86_CPU_HAS_SSE3 && BR2_X86_CPU_HAS_SSSE3 && BR2_X86_CPU_HAS_SSE4 && BR2_X86_CPU_HAS_SSE42
 	default y if BR2_i386 && BR2_X86_CPU_HAS_MMX && BR2_X86_CPU_HAS_SSE && BR2_X86_CPU_HAS_SSE2 && BR2_X86_CPU_HAS_SSE3 && BR2_X86_CPU_HAS_SSSE3
-	default y if BR2_i386 && !BR2_x86_i486 && !BR2_x86_i586 && !BR2_x86_x1000
+	default y if BR2_i386 && !BR2_x86_i486 && !BR2_x86_i586 && !BR2_x86_x1000 && !BR2_x86_pentium_mmx && !BR2_x86_geode && !BR2_x86_c3 && !BR2_x86_winchip_c6 && !BR2_x86_winchip2
 	default y if BR2_xtensa && BR2_XTENSA_CUSTOM && BR2_XTENSA_LITTLE_ENDIAN
 
 if BR2_TOOLCHAIN_EXTERNAL_BOOTLIN
@@ -4668,6 +4668,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_BLEEDING_EDGE
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
 	depends on !BR2_x86_x1000
+	depends on !BR2_x86_pentium_mmx
+	depends on !BR2_x86_geode
+	depends on !BR2_x86_c3
+	depends on !BR2_x86_winchip_c6
+	depends on !BR2_x86_winchip2
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
@@ -4695,6 +4700,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_STABLE
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
 	depends on !BR2_x86_x1000
+	depends on !BR2_x86_pentium_mmx
+	depends on !BR2_x86_geode
+	depends on !BR2_x86_c3
+	depends on !BR2_x86_winchip_c6
+	depends on !BR2_x86_winchip2
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
@@ -4722,6 +4732,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_BLEEDING_EDGE
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
 	depends on !BR2_x86_x1000
+	depends on !BR2_x86_pentium_mmx
+	depends on !BR2_x86_geode
+	depends on !BR2_x86_c3
+	depends on !BR2_x86_winchip_c6
+	depends on !BR2_x86_winchip2
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
@@ -4747,6 +4762,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_MUSL_STABLE
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
 	depends on !BR2_x86_x1000
+	depends on !BR2_x86_pentium_mmx
+	depends on !BR2_x86_geode
+	depends on !BR2_x86_c3
+	depends on !BR2_x86_winchip_c6
+	depends on !BR2_x86_winchip2
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
@@ -4771,6 +4791,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_BLEEDING_EDGE
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
 	depends on !BR2_x86_x1000
+	depends on !BR2_x86_pentium_mmx
+	depends on !BR2_x86_geode
+	depends on !BR2_x86_c3
+	depends on !BR2_x86_winchip_c6
+	depends on !BR2_x86_winchip2
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	select BR2_USE_WCHAR
@@ -4797,6 +4822,11 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_UCLIBC_STABLE
 	depends on !BR2_x86_i486
 	depends on !BR2_x86_i586
 	depends on !BR2_x86_x1000
+	depends on !BR2_x86_pentium_mmx
+	depends on !BR2_x86_geode
+	depends on !BR2_x86_c3
+	depends on !BR2_x86_winchip_c6
+	depends on !BR2_x86_winchip2
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 	select BR2_USE_WCHAR
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
