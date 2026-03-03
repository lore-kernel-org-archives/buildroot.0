Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F36EDEBF0
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 20:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD8FB817A2;
	Tue,  3 Mar 2026 20:27:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tEVV4W-tshxE; Tue,  3 Mar 2026 20:27:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0262F818C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772569662;
	bh=Px76VfjgY/RGUteJGNVyfer7NeW7SGU9sAyHPXTnjks=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MINZUPkmE89WvApgLcq/jvedPO6qkx95QOeK6TmxlJvRfMQtcyecI9DRx/kRMGxsn
	 UZzmT5XngA/Hv7BgTecbGBlnEBo9a1rK+cIPE0s6U8QlPLuqc6iS9UchfvznjhGXM+
	 5ye55WI2TyXpuA0PGM7JoOXOwa5b6jCHFO1D9NC/U99ukvmaPtvTLdUEDOKSW4iSbZ
	 qiQ/s09b53aS/XtZbO8Dr7kjYCP8UImXFZAPnLTu6avoLFdbgUr4VckMuAtvW7cMMk
	 FLOgvVfOW4eRQenyS5sDnm+ERXy4javKoyWhLJ2xUZk3Y7Eakb8R7OapJCYvrysktO
	 fU5yDKjUzIMWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0262F818C2;
	Tue,  3 Mar 2026 20:27:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 36530231
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28612818C2
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:27:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 85DH8LCKtCe0 for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 20:27:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 19144817A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19144817A2
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 19144817A2
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:27:39 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id EB41A19F574;
 Tue,  3 Mar 2026 21:27:33 +0100 (CET)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Tue,  3 Mar 2026 21:27:06 +0100
Message-ID: <20260303202708.2065406-3-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303202708.2065406-1-ju.o@free.fr>
References: <20260303202708.2065406-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772569657;
 bh=nkiRyyZNjNgZLqdcMx8oV0HYCyXtsWUoo7EizFC9um4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LNNSsfTaeFKP0H9oI+fSgHvT7e4MSG6J/x0RbwCMwBxnqs2yabsn/FJR9MpWeOlWO
 0ZyY8gS5+NoROuM0Q2EmyonN4p7l+QEP+FIy1mFGd4AFcpGz1sAdMqEXxwyDpsjlja
 3npbdVsqUwb0bGufRslMkDER/6N1Y0ChhqiWpqRe9WaD1LXCtdhGuLwutkqSgECxmC
 2IzhgRW7AzTtxaKb7PNboQSOw5B0ygQj+F03UmjHvOkgh+17gUEqBlpISKAxhF8ErF
 luzkPFZd8QMxqZHzFOZU0cWlpcZYKY8UEq08e9+0WOz9W2oPJx5THgYRviT18w8QDI
 6Gx6/NktroIyw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LNNSsfTa
Subject: [Buildroot] [PATCH next 3/4] arch/arm: add the Neoverse-V3 core
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

This commit adds the Neoverse-V3 core, which is an armv9.2a ISA.
See: [1] [2].

This CPU support was added in GCC 15. See [3] [4] [5].

This CPU supports Aarch64 only at all exception levels (EL0 to EL3).

[1] https://developer.arm.com/Processors/Neoverse%20V3
[2] https://developer.arm.com/documentation/107734/0002/The-Neoverse--V3--core/Neoverse--V3--core-features
[3] https://gcc.gnu.org/gcc-15/changes.html#aarch64
[4] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/aarch64/aarch64-cores.def;hb=releases/gcc-15.1.0#l221
[5] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=729000b90300a31ef9ed405635a0be761c5e168b

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 arch/Config.in.arm | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index e9f3c53e0d..ff301785e5 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -538,6 +538,12 @@ config BR2_cortex_a720
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV9A
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+config BR2_neoverse_v3
+	bool "neoverse-V3 (aka poseidon)"
+	depends on BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV9A
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 endchoice
 
 config BR2_ARM_ENABLE_NEON
@@ -938,6 +944,7 @@ config BR2_GCC_TARGET_CPU
 	default "neoverse-v2"	if BR2_neoverse_v2
 	# armv9.2a
 	default "cortex-a720"	if BR2_cortex_a720
+	default "neoverse-v3"	if BR2_neoverse_v3
 
 config BR2_GCC_TARGET_ABI
 	default "aapcs-linux"	if BR2_arm || BR2_armeb
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
