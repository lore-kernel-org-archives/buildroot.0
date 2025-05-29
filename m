Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76824C54FB3
	for <buildroot@archiver.kernel.org>; Thu, 29 May 2025 23:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0452140A97;
	Thu, 29 May 2025 23:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XyofaXrhw5F7; Thu, 29 May 2025 23:09:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46A3341998
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46A3341998;
	Thu, 29 May 2025 23:09:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E4FD6127
 for <buildroot@buildroot.org>; Thu, 29 May 2025 23:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D728D42014
 for <buildroot@buildroot.org>; Thu, 29 May 2025 23:09:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id saLGUdMiIhiJ for <buildroot@buildroot.org>;
 Thu, 29 May 2025 23:09:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C79DB4200A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C79DB4200A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C79DB4200A
 for <buildroot@buildroot.org>; Thu, 29 May 2025 23:09:02 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0BD90B0055E;
 Fri, 30 May 2025 01:08:56 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Fri, 30 May 2025 01:08:51 +0200
Message-ID: <20250529230851.3709212-1-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748560139;
 bh=jHebg/J8v4SG2KZZNhr2zaWUBuy4oKgHGCqGaF+kwNk=;
 h=From:To:Cc:Subject:Date:From;
 b=s+Y+lk2ziHmoxX13cCopBicqntGNtt0A8q6IvZ7n+vXhmYNjze9K7503V5kZ/byi0
 x47786dh7d4ZRm09IxEbmYPVhfptNB0/EDp8nkFV4Wd0qfHs7HZNSkThbuiYCb1Dv+
 KuDbJOybYZOFU5vigdNnnPWb+6iGnOizdcQ0CgE9j0372EBN8etKNGQJpOlGQK+vBN
 2DmfIRPNF/RPrZsEbwa7Qt2NC91rr+6EXpHhXV5JYwrzlLgB/kRakvNln+U+72AaMA
 hKd7FRlaVkKu0K1mJiDWbNBWgXxBjynOimvsyWk6VjaboNL9Dl2LvTs2LhB3MNjN9b
 IJzBE9nrAQrmg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=s+Y+lk2z
Subject: [Buildroot] [PATCH next 1/1] arch/arm: add the Cortex-A720 core
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

This commit adds the Cortex-A720 core, which is a armv9.2a ISA.
See: [1] [2].

This CPU support was added in GCC 14. See [3] [4].

Cortex-A720 processors are included in boards such as the
Radxa Orion O6. See [5].

This CPU supports Aarch64 only at all exception levels (EL0 to EL3).

[1] https://developer.arm.com/Processors/Cortex-A720
[2] https://developer.arm.com/documentation/102530/0002/The-Cortex-A720--core/Cortex-A720--core-features
[3] https://gcc.gnu.org/gcc-14/changes.html#aarch64
[4] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/aarch64/aarch64-cores.def;hb=releases/gcc-14.1.0#l180
[5] https://radxa.com/products/orion/o6/

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 arch/Config.in.arm | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 546ba8070e..c5695c1eba 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -518,6 +518,14 @@ config BR2_neoverse_n2
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV9A
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
+
+comment "armv9.2a cores"
+config BR2_cortex_a720
+	bool "Cortex-A720 (aka hunter)"
+	depends on BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV9A
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 endchoice
 
 config BR2_ARM_ENABLE_NEON
@@ -914,6 +922,8 @@ config BR2_GCC_TARGET_CPU
 	# armv9.0a
 	default "cortex-a710"	if BR2_cortex_a710
 	default "neoverse-n2"	if BR2_neoverse_n2
+	# armv9.2a
+	default "cortex-a720"	if BR2_cortex_a720
 
 config BR2_GCC_TARGET_ABI
 	default "aapcs-linux"	if BR2_arm || BR2_armeb
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
