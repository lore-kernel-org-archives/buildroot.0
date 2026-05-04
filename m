Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831A1CD3427
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 20:30:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBFD18474D;
	Mon,  4 May 2026 20:30:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VD0rSYriiMsm; Mon,  4 May 2026 20:30:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48096846D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777926656;
	bh=SR++U8fmN/lErhe13Cfx3EKmCH5kkoXvEdfPld8tJB4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=lGRMdxv0HzNX13mv5CRzphvGejRwqFCHBkpJ8QZGQ4fGt9J4yJQNcwRS6q0L4utjV
	 NSeK58PeOg2udiQ5l/4Vv5f+ElvDiIqwMg8M1+e10B18YpBGFgl2mABaR+bCRH4gGW
	 iyIp88GYRdiam0wSMg+h8KDJajWaVjv9Th2UtKLkOMoGRa9IMFIi3EdLbQTyjmo99/
	 JVqqQRtuUGSjvrvlWN+cNHLq2L7D+0+mpFZlSLaiSQHZxzUCYzuBb5lXK3zEXAq4jC
	 5+hymnScflP26RiPZPwX2HSf8udsiZ1dbbuipyhmtu0x5UUKdgdXfxsAsnBD4rUQT/
	 93gzj/mC0W5cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48096846D9;
	Mon,  4 May 2026 20:30:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3897847E
 for <buildroot@buildroot.org>; Mon,  4 May 2026 20:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E29D615D3
 for <buildroot@buildroot.org>; Mon,  4 May 2026 20:30:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VtjJLqI4lhtR for <buildroot@buildroot.org>;
 Mon,  4 May 2026 20:30:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9FE7A615D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FE7A615D0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9FE7A615D0
 for <buildroot@buildroot.org>; Mon,  4 May 2026 20:30:53 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 4A8A75FFBA;
 Mon,  4 May 2026 22:30:47 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Cyril Bur <cyrilbur@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Julien Olivain <ju.o@free.fr>
Date: Mon,  4 May 2026 22:30:32 +0200
Message-ID: <20260504203035.1729184-1-ju.o@free.fr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777926651;
 bh=nqRjgNndEErgIRIScr4s0njyF5J/wrjdglZC1WEtk0s=;
 h=From:To:Cc:Subject:Date:From;
 b=pt1ZhCFXWBGrdLmFCRQvYYSvJ/3HluRerN2ovSCMLa1q6+IV6GzT292yDiRY5znfJ
 rtmGFFFpB0ePYBqjqesjHylfWEUNBBeYrBlB4h9+BxuJVZDxrbxtU1yxWSfkUUrkJg
 /PDS9dRWdd7k9eaQ84H/ubiLOfK0372Lg/CmKQDrzBT9AW/Vq9Vn66eUnY1/KJMU9q
 Kdst9RUlcYBV8Gad26BTp7GEgizKJ3JyqwlUK7usVcaFvhvt0ItWfKU95wXgPaR0uL
 nuZ+UsrnrvuNu80e+KrfCVBdP236Rpas1tMLZEbk5EyAi3BMIGZDJd5HFOO8GJMXCp
 LAktHPbrxWYMg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pt1ZhCFX
Subject: [Buildroot] [PATCH 1/4] arch/Config.in.powerpc: add Power10 CPU type
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

This commit adds the IBM Power10 CPU type. See [1].

This CPU is supported in gcc since v11.1.0 (see upstream commit [2]),
and in binutils since v2.35 (the gas -mpower10 option is documented
since upstream commit [3]).

[1] https://en.wikipedia.org/wiki/Power10
[2] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=5d9d0c94588c8834a33eca6847b0a1401353300b
[3] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=1424c35d071e7d49a4a219c7dee8c88ffd60ddca

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 arch/Config.in.powerpc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index 3f4d348d5f..a2605ca6a9 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -144,6 +144,11 @@ config BR2_powerpc_power9
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
 	select BR2_POWERPC_CPU_HAS_VSX
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
+config BR2_powerpc_power10
+	bool "power10"
+	select BR2_POWERPC_CPU_HAS_ALTIVEC
+	select BR2_POWERPC_CPU_HAS_VSX
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
 endchoice
 
 config BR2_POWERPC_SOFT_FLOAT
@@ -207,6 +212,7 @@ config BR2_GCC_TARGET_CPU
 	default "power7"	if BR2_powerpc_power7
 	default "power8"	if BR2_powerpc_power8
 	default "power9"	if BR2_powerpc_power9
+	default "power10"	if BR2_powerpc_power10
 
 config BR2_READELF_ARCH_NAME
 	default "PowerPC"	if BR2_powerpc
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
