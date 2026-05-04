Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 985A2FF885A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 20:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59A66615D0;
	Mon,  4 May 2026 20:31:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PvHlQvpBXh9N; Mon,  4 May 2026 20:31:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84B37615D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777926664;
	bh=PqtAkzKIzkdnY57AMGtJRn8rCmgGG/FgJcrzt8cr9dI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UAfDrUjoX2K935TAPa0YIERyjXQjv2e//mdbw+LvNCNfhdkbuTbWNJW3bbk8hKW3g
	 CuBBimBWZOKcQZU+WteNRY+KCLrQI3vTnEobbUO05GpbF/m0tr51fCUDxuHHE+pope
	 ko5+FTSQ8puZr8gOBRQoriDK2yB/KI717KGMcf8j55Ali1Qmif6gUft+/fQnzhHhIY
	 K+B6P3jj1kJhXt9ObieS9/cUpFOXb32jFLlwpXfFTAqVNv8/d/7YLebBw8SwILwjx5
	 QogoDrBK9N/Jn3AhEa4unY9fIjfvJ5hEh2F2okcyADDkB0YHYABVvzEjawOiEW6i+H
	 beb2EU90yYboA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84B37615D3;
	Mon,  4 May 2026 20:31:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 53EB7190
 for <buildroot@buildroot.org>; Mon,  4 May 2026 20:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5177784760
 for <buildroot@buildroot.org>; Mon,  4 May 2026 20:31:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hs2GJxev2O4d for <buildroot@buildroot.org>;
 Mon,  4 May 2026 20:31:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3F0CB84752
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F0CB84752
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F0CB84752
 for <buildroot@buildroot.org>; Mon,  4 May 2026 20:31:02 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D92D85FFB4;
 Mon,  4 May 2026 22:30:55 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Cyril Bur <cyrilbur@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Julien Olivain <ju.o@free.fr>
Date: Mon,  4 May 2026 22:30:34 +0200
Message-ID: <20260504203035.1729184-3-ju.o@free.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504203035.1729184-1-ju.o@free.fr>
References: <20260504203035.1729184-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777926660;
 bh=QPBk9LV1ozctc3KH0aFJ44TuhBg7or/lthmlYnWS1to=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pa9+X21YENS7pwA/2YP01fArRFYEJzKWSGk7jCNXZjraZftbkMSAhNkuh8u7Tnb4H
 zIEl9w9qQF0nNtMpr2gU5ilnsRavhiow6jt640eIABXos6l7UAuI87dMzL2FE2bAtD
 RT6IMx3BTvyzrZQ3t4+uk08EOudQjjKEc0UxXU7MRpMHYtfLZAHUmK19DwkdzNm4wU
 J68NwEugqzZzr6mpED983hC5lzUH30cs80jNFYV8AXqwR45Qt4Fr+QsCL6BB1WXisg
 zRcFz1Ks1gez+CUydki+/SoNEQ2Hm5pgbwl5L2EjIeN/fWwn7zV0G8q4Cha19ay12u
 dOFAVM1qOK82g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pa9+X21Y
Subject: [Buildroot] [PATCH 3/4] arch/Config.in.powerpc: add Power11 CPU type
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

This commit adds the IBM Power11 CPU type.

This CPU is supported in gcc since v15.1.0 (see upstream commit [1]),
and in binutils since v2.35 (the gas -mpower10 option is documented
since upstream commit [2]).

[1] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=05f0e9eec9f9beeffe024ecd6566b41200d79cff
[2] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=4199cf1e152daab0460f08cc7dbd1f727ac3e4cc

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 arch/Config.in.powerpc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index a2605ca6a9..805bc9ce68 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -149,6 +149,11 @@ config BR2_powerpc_power10
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
 	select BR2_POWERPC_CPU_HAS_VSX
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
+config BR2_powerpc_power11
+	bool "power11"
+	select BR2_POWERPC_CPU_HAS_ALTIVEC
+	select BR2_POWERPC_CPU_HAS_VSX
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 endchoice
 
 config BR2_POWERPC_SOFT_FLOAT
@@ -213,6 +218,7 @@ config BR2_GCC_TARGET_CPU
 	default "power8"	if BR2_powerpc_power8
 	default "power9"	if BR2_powerpc_power9
 	default "power10"	if BR2_powerpc_power10
+	default "power11"	if BR2_powerpc_power11
 
 config BR2_READELF_ARCH_NAME
 	default "PowerPC"	if BR2_powerpc
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
