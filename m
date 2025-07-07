Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30867C83F07
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 06:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD42D4138D;
	Mon,  7 Jul 2025 06:45:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZNT7EN06E3cn; Mon,  7 Jul 2025 06:45:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDE8C41242
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDE8C41242;
	Mon,  7 Jul 2025 06:45:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A7D112E
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 06:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BF5C8190B
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 06:45:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lrZUwfBiMqiQ for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 06:45:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=23.90.104.144;
 helo=esa1.hc555-34.eu.iphmx.com;
 envelope-from=vladimir.kondratiev@mobileye.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 44B3D81CD0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44B3D81CD0
Received: from esa1.hc555-34.eu.iphmx.com (esa1.hc555-34.eu.iphmx.com
 [23.90.104.144])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 44B3D81CD0
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 06:45:38 +0000 (UTC)
X-CSE-ConnectionGUID: XgguYDxfR6+AcqblxkWiYA==
X-CSE-MsgGUID: YlojUQL3RNWK8qSTQDqj1A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
 by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 09:45:36 +0300
X-CSE-ConnectionGUID: Mnmho/8URpmmGVWAV3dN5g==
X-CSE-MsgGUID: nLiAK/TvQTG13yy3L9vJzQ==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.1])
 by ces03_data.me-corp.lan with SMTP; 07 Jul 2025 09:45:34 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation);
 Mon, 07 Jul 2025 09:45:34 +0300
To: buildroot@buildroot.org
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Mon,  7 Jul 2025 09:45:31 +0300
Message-ID: <20250707064531.4032062-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
 t=1751870739; x=1783406739;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fg3eSQxFBoa6XYeqC25A4ed/N66Bt/cyM7ZjbGR2WfQ=;
 b=Df0NT85s49L7iY/Kn86UlIq9R1nUArT9TdLr06AM9+eff5IayQwE8o8C
 h736X8P3dicCiOuFVZFUwfMD/toVEIo3EDIeTArBfTTgQAUM7k0K/vy0Q
 UHs0ttB0KFeiZFXx0UJONsXsqxgmPE3BltR3yVkUOca3FljW/u/3GPuLX
 aljc3lpgjyH77yIu0+QKzDFGQg2tcVrQPtG+gFwioqdr6LxieqhBCSqKB
 yU3+YdwDCVMj4GOqTdnVXkCjDYqAbhPTiMuaDwfkkzLJ01BKN0MWcS/4b
 MeiIMi9e3sTbV4hR0AXMtF0lUNTGADgAZuOCy3um523+6KqdeY6CfBcIZ
 w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mobileye.com
Subject: [Buildroot] [PATCH 1/1] package/libunwind: enable on riscv 64-bit
 glibc
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
From: Vladimir Kondratiev via buildroot <buildroot@buildroot.org>
Reply-To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since version 1.8, libunwind supports 64-bit riscv,
at least with glibc

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 package/libunwind/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libunwind/Config.in b/package/libunwind/Config.in
index 08f7f879c929..dd8cc72926d1 100644
--- a/package/libunwind/Config.in
+++ b/package/libunwind/Config.in
@@ -26,7 +26,7 @@ config BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
 	default y if BR2_TOOLCHAIN_USES_GLIBC && \
 		(BR2_ARM_CPU_HAS_ARM || BR2_aarch64 || BR2_mips || BR2_mipsel || \
 		 BR2_mips64 || BR2_mips64el || BR2_powerpc || BR2_sh || \
-		 BR2_i386 || BR2_x86_64)
+		 BR2_i386 || BR2_x86_64 || (BR2_riscv && BR2_ARCH_IS_64))
 	default y if BR2_TOOLCHAIN_USES_UCLIBC && \
 		(BR2_ARM_CPU_HAS_ARM || BR2_mips || BR2_mipsel || \
 		 BR2_mips64 || BR2_mips64el || BR2_x86_64)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
