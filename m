Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4DA3EDEBF1
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 20:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FA42818C4;
	Tue,  3 Mar 2026 20:27:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zNYfLep-Eq8x; Tue,  3 Mar 2026 20:27:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9FDF815B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772569655;
	bh=oX2wUDISMOCMBsC/HkS1/bYIkcmVMNPSG9xk94xuMiE=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=frSk9/Nh6SopTuKynNWxNPt369QGpnQUf7wTlAiaVBWZFfZz6Sr/IYHF5HlzE87Jv
	 M0R5jAEhTBHKyUDfSyxDLGXPwpk8GgblWl4o8wh7G5xyv4Ek9OLYeduUAllA1hfB+Q
	 e0XqwJPx0JGi/3tBdVSS7Ezps5bQJ92oSUEQ3jeMnEdd4giKJoIPFecPjS1VYS/11X
	 195YdUIO7fQxi5OLNB5zT7ApcKbMCnusnes8aryaeDuhmC2N9kDkIE+cOP9eZCE8z3
	 KTsb6F/vgPtVi3fctskDB536FKTXJawJh73cfwzeZdBVJWqghvEkTyIdukJCls4/5K
	 F/c9dSStqnbGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9FDF815B2;
	Tue,  3 Mar 2026 20:27:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 53A4A231
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4559C815B2
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:27:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NvRIqGMuKepz for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 20:27:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1440380F34
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1440380F34
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1440380F34
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:27:32 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 81A2C19F59C;
 Tue,  3 Mar 2026 21:27:27 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Tue,  3 Mar 2026 21:27:04 +0100
Message-ID: <20260303202708.2065406-1-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772569650;
 bh=2FKmQyqKW++9qnsK1RfByLvMPvljapNWRqc5CFJFlzY=;
 h=From:To:Cc:Subject:Date:From;
 b=vOSADk6sJib0KncJilztjEKt+s8ZemviyrET68QvJRnWfxbnT2WIXCO47SrOIK1rt
 UHKpTupmq+zAVZfYiiiE/gqX0alXrga2rTyR1YclxfsVERR85r4/bC3Jn0pe1CNW9V
 Lqnr3aBObm7/9NnpEelYdviBAWgF437IDYzXtoAFQeUSilLe1WoJpCtBEiSD28mpmT
 f2MeTG4kugK1xmirlSTaWDDEaHSA/Evl3uhAEOqACULv/oeSJQJnKEBCIiNq/jWiWr
 JNV9OWUAhmJIm9ZGoYh0KbIfDNlRB0ilXkyTT3v9Rqq4PXgDo+NbMt8mMajSPvSiLm
 qXbXdEACkwbyA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=vOSADk6s
Subject: [Buildroot] [PATCH next 1/4] arch/arm: add the Neoverse-V1 core
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

This commit adds the Neoverse-V1 core, which is an armv8.4a ISA.
See: [1] [2].

This CPU support was added in GCC 11. See [3] [4] [5].

This CPU supports Aarch64 at all exception levels (EL0 to EL3).
It also supports Aarch32 only in EL0 (user-space). This means it's
technically possible to compile Aarch32 code. GCC has the support
to do so. Since Buildroot recompiles a full system (ATF, Kernel,
user-space) this support has limited value. This is why this
CPU is limited to 64bit builds only.

Qemu added neoverse-v1 support in upstream commit [6], first included
in v8.1.0.

[1] https://developer.arm.com/Processors/Neoverse%20V1
[2] https://developer.arm.com/documentation/101427/0102/Functional-description/Introduction/About-the-core
[3] https://gcc.gnu.org/gcc-11/changes.html#arm-targets
[4] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/aarch64/aarch64-cores.def;hb=releases/gcc-11.1.0#l141
[5] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=c9d56eb777552ac5ee0c281e1f6e34b6fe929b77
[6] https://gitlab.com/qemu-project/qemu/-/commit/c74138c6c040b62e941326a4fbb25a93fdd35b72

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 arch/Config.in.arm | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index a0bf6c3386..16911f5b95 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -498,6 +498,12 @@ config BR2_tsv110
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 
 comment "armv8.4a cores"
+config BR2_neoverse_v1
+	bool "neoverse-V1 (aka zeus)"
+	depends on BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8A
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
 config BR2_saphira
 	bool "saphira"
 	depends on BR2_ARCH_IS_64
@@ -918,6 +924,7 @@ config BR2_GCC_TARGET_CPU
 	default "neoverse-n1"	if BR2_neoverse_n1
 	default "tsv110"	if BR2_tsv110
 	# armv8.4a
+	default "neoverse-v1"   if BR2_neoverse_v1
 	default "saphira"	if BR2_saphira
 	# armv9.0a
 	default "cortex-a710"	if BR2_cortex_a710
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
