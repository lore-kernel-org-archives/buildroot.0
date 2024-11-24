Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7E7D75E5D
	for <buildroot@archiver.kernel.org>; Sun, 24 Nov 2024 21:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 472A684C3A;
	Sun, 24 Nov 2024 21:30:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dQuPzReTBIYC; Sun, 24 Nov 2024 21:30:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4726B84C41
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4726B84C41;
	Sun, 24 Nov 2024 21:30:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 93C834961
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 21:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50BA142FBE
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 21:30:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O32OLkltAWUb for <buildroot@buildroot.org>;
 Sun, 24 Nov 2024 21:30:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C1CC342F81
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1CC342F81
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1CC342F81
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 21:30:52 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 3F0A0B0053E;
 Sun, 24 Nov 2024 22:30:47 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Sun, 24 Nov 2024 22:30:31 +0100
Message-ID: <20241124213031.2515138-2-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241124213031.2515138-1-ju.o@free.fr>
References: <20241124213031.2515138-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732483850;
 bh=a2SRlz74PsGIBOXIjsW3pD9sT6Ad8ryTzrafQq9T5dw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hrhoKgcpgKN/Ce+VZciyktSWMk/tHtvEnIEia/HXrl0ebLGUnNna/5+FkBO5k6Oy6
 DkRsV0zPbj17yCufTEfuqfLZfnnlR9jSWYHDekTqvk5c7jBG2XrMg/R+48c44KrDC1
 llCy2s8VS3SMt1y24ci/Saq1YGJeut7Xn9x48T8ZOc2wrQFRC2psUBbXrDZohq5jsz
 CHDnGiW2/VABbjZ5Rfl6EPQVfcDndBpavjCuv8PZDayv5vmpGOqE0pzsMFssgBrUrt
 My0IwdcQcLeocXx8TXBiz7XL6HIoiPOFQejL+AGiSK6FpUlK3fntrrqpHYMjm5E8PO
 xj5FVGDNyB+hw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hrhoKgcp
Subject: [Buildroot] [PATCH next RFC 2/2] arch/arm: add the Cortex-A710 core
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

This commit adds the Cortex-A710 core, which is a armv9.0a ISA.
See: [1] [2].

This CPU support was added in GCC 12. See [3] [4].

Cortex-A710 support has been added in QEmu in commit [5], first
included in v8.2.0.

This CPU supports Aarch32 only in EL0 (user-space). This means it's
technically possible to compile Aarch32 code targeting. GCC has the
support to do so. Since Buildroot recompiles a full system (ATF,
Kernel, user-space) this support has limited value. This is why this
CPU is limited  to 64bit builds only.

[1] https://developer.arm.com/Processors/Cortex-A710
[2] https://developer.arm.com/documentation/101800/0201/The-Cortex-A710--core/Cortex-A710--core-features
[3] https://gcc.gnu.org/gcc-12/changes.html
[4] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/aarch64/aarch64-cores.def;hb=releases/gcc-12.1.0#l163
[5] https://gitlab.com/qemu-project/qemu/-/commit/e3d45c0a895764203f489184d361fe4c74b2cd57

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 arch/Config.in.arm | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 9e6c8661ba..45647547ce 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -498,6 +498,12 @@ config BR2_saphira
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 
 comment "armv9.0a cores"
+config BR2_cortex_a710
+	bool "Cortex-A710 (aka matterhorn)"
+	depends on BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV9A
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_12
 config BR2_neoverse_n2
 	bool "neoverse-N2 (aka perseus)"
 	depends on BR2_ARCH_IS_64
@@ -897,6 +903,7 @@ config BR2_GCC_TARGET_CPU
 	# armv8.4a
 	default "saphira"	if BR2_saphira
 	# armv9.0a
+	default "cortex-a710"	if BR2_cortex_a710
 	default "neoverse-n2"	if BR2_neoverse_n2
 
 config BR2_GCC_TARGET_ABI
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
