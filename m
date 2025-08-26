Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CFDCA0EFA
	for <buildroot@archiver.kernel.org>; Tue, 26 Aug 2025 12:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAA556F896;
	Tue, 26 Aug 2025 12:16:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kIdZxahO2s5e; Tue, 26 Aug 2025 12:16:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10F03616A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10F03616A3;
	Tue, 26 Aug 2025 12:16:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B9B31CD
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 12:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFAA3616A3
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 12:16:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 354nnu-d-dGk for <buildroot@buildroot.org>;
 Tue, 26 Aug 2025 12:16:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 390016168B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 390016168B
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 390016168B
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 12:16:37 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 550EEC1FD1
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 14:16:34 +0200 (CEST)
Message-ID: <9ce2daa8-6493-47b6-9159-52591480ebfd@grenoble.cnrs.fr>
Date: Tue, 26 Aug 2025 14:15:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, fr
To: Buildroot development <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1756210594;
 bh=Ahtpl3q9JP7RAduajNKeH8lEHIfBfGR116z5J6iql/Y=;
 h=Date:To:From:Subject:From;
 b=WDKsKQbyZZhxU9+5OBqYPiTtaD3VHHNWOUuOLyq0hacpH4n+ANkQYB55a3QWlADwl
 eYOSwbp92u4fpB+OsJcnE1DZhH+12Byz015OZnsfZy92Ac1HIqPWCTK+RSTb56XQGr
 rzvGj1JEYnSr75mfoKjvM814Ie62QakDfS3RYbkIUt65rh13Sx1AiiqgSSdO9Q7f0T
 wFTALrImjJ+yHVjntnztvGcYxrxq89mBQaOee8i+RLHSylovLdYaXrVEA+oqUVbvuF
 9IA1+0EpASvxZql5ggQRp8wAh88O97hz7m2AooO6kkDrUy6pHAT/fyfM8VAx2n3oSQ
 2djleUrFCKyVQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=WDKsKQby
Subject: [Buildroot] [PATCH 1/1] arch/Config.in.arm: fix typo in help text
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
---
 arch/Config.in.arm | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index c5695c1eba..a0bf6c3386 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -785,7 +785,7 @@ config BR2_ARM_INSTRUCTIONS_THUMB
 	# Thumb-1 and VFP are not compatible
 	depends on BR2_ARM_SOFT_FLOAT
 	help
-	  This option instructions the compiler to generate Thumb
+	  This option instructs the compiler to generate Thumb
 	  instructions, which allows to mix 16 bits instructions and
 	  32 bits instructions. This generally provides a much smaller
 	  compiled binary size.
@@ -798,7 +798,7 @@ config BR2_ARM_INSTRUCTIONS_THUMB2
 	bool "Thumb2"
 	depends on BR2_ARM_CPU_HAS_THUMB2
 	help
-	  This option instructions the compiler to generate Thumb2
+	  This option instructs the compiler to generate Thumb2
 	  instructions, which allows to mix 16 bits instructions and
 	  32 bits instructions. This generally provides a much smaller
 	  compiled binary size.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
