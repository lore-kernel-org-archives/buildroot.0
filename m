Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB42EDEBF1
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 20:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D2A281D4F;
	Tue,  3 Mar 2026 20:27:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8EW7pHbhEBaJ; Tue,  3 Mar 2026 20:27:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 063F4815CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772569666;
	bh=e9Bjy+sf86vLK8lThBNjivaPu/wMU0wUw296uEFJMm4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KR5JabFKH+fU42UkHBuWRVnLnzavpfxfwLyDqTuDy4c0LTuXaYP5QABCu1ra4Jwy1
	 uLexBEIexRAMTCaOcyEkN1ZKGR/frEO0fJUzx+1aXkxpcy3ejh0AnoQeIN8L4dXJuQ
	 egGCQPRbGvT61v2ZdkYuSZOtVWbyDIkLQuPmt9iedTfUtgmbGJvLIAz4GAcL/ix+xr
	 yxv/6KuthyLsTlatWoorKPbgPTaTd0vfu6fVEma/qesOCLhMUXxllLK59LzHLGN+77
	 q6VlILCnK8Qm3anVd0nreVrA0h7fmHDWS/SKAZpDHmdYJ6OA1VKlA5BEHTKiX80TeW
	 dJlPHoC4gQd2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 063F4815CF;
	Tue,  3 Mar 2026 20:27:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B5C14231
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7C9B606D9
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:27:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hONBsALMzQxV for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 20:27:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 906F26066D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 906F26066D
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 906F26066D
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:27:43 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 9BB0019F5A5;
 Tue,  3 Mar 2026 21:27:37 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Tue,  3 Mar 2026 21:27:07 +0100
Message-ID: <20260303202708.2065406-4-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303202708.2065406-1-ju.o@free.fr>
References: <20260303202708.2065406-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772569661;
 bh=PWwM7MZm9ZrTsm5NiqvI6+5jqu1CIKKZLwMitqvcRsc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PZCkgDdmA4opGTbpt8O3g+VnN8TRY90Mg2AM6MsqmyHnFY3SBCzn2Zw3ce/ejdC9t
 SZoDN3HQVfYvYy1yuFsfcbdNxQZssKK3pb5NWMpRko/HI/jnrrPYeNG7Ygbb5lb2wF
 k8xIlTWnHT7oAvsD+9dVkdf81H6ndAQpYoJfPLeXAuhMjHLvjYGQbZCX9L453uCXVT
 Xpw9g0E6ddq/lICtqZixVP4ry9Z+LZ9khpKT5d3Yl/b4mHTQhjXmVIu4RG7luTyL5q
 9kliOl96Qspxn11HR+9NUwTjkJjSIEZEpzPN0ufGjqVHerpMpUthELWnxg8xt6Kpiz
 +pJE51MzrupSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PZCkgDdm
Subject: [Buildroot] [PATCH next 4/4] arch/arm: add the Neoverse-V3AE core
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit adds the Neoverse-V3AE (Automotive Enhanced) core, which
is an armv9.2a ISA. See: [1] [2].

This CPU support was added in GCC 15. See [3] [4] [5].

This CPU supports Aarch64 only at all exception levels (EL0 to EL3).

This CPU is present in NVIDIA Jetson Thor / Tegra T264 [6].

[1] https://developer.arm.com/Processors/Neoverse%20V3AE
[2] https://developer.arm.com/documentation/101595/0002/The-Neoverse-V3AE--core/Neoverse-V3AE--core-features
[3] https://gcc.gnu.org/gcc-15/changes.html#aarch64
[4] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/aarch64/aarch64-cores.def;hb=releases/gcc-15.1.0#l222
[5] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=7ca2a803c4a0d8e894f0b36625a2c838c54fb4cd
[6] https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/jetson-thor/

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 arch/Config.in.arm | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index ff301785e5..eb5babe29b 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -544,6 +544,12 @@ config BR2_neoverse_v3
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV9A
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+config BR2_neoverse_v3ae
+	bool "neoverse-V3AE (aka poseidon)"
+	depends on BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV9A
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 endchoice
 
 config BR2_ARM_ENABLE_NEON
@@ -945,6 +951,7 @@ config BR2_GCC_TARGET_CPU
 	# armv9.2a
 	default "cortex-a720"	if BR2_cortex_a720
 	default "neoverse-v3"	if BR2_neoverse_v3
+	default "neoverse-v3ae"	if BR2_neoverse_v3ae
 
 config BR2_GCC_TARGET_ABI
 	default "aapcs-linux"	if BR2_arm || BR2_armeb
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
