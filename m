Return-Path: <SRS0=17BZ=NV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8236C432BE
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 04:42:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FE0E60F35
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 04:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7FE0E60F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41B254010B;
	Mon, 30 Aug 2021 04:42:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2IZpFgtcvUjA; Mon, 30 Aug 2021 04:41:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB40D4011B;
	Mon, 30 Aug 2021 04:41:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6ED051BF2F4
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 04:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EC3360755
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 04:41:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=wdc.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MU1nI4iimpF0 for <buildroot@lists.busybox.net>;
 Mon, 30 Aug 2021 04:41:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E191A6075B
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 04:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630298465; x=1661834465;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HpFNNX5Ls6C5r8Ulp1AAiIhqUYtYybHcWGc9kLQ0NK4=;
 b=A0e3Wtio3ZfnjOF236bbyO81XL0avKiCyb6d0TUx0XJIiGn8F7kYJzJl
 y7YzW6jQ19Sv3L6L1+OAhsAfyqBnlaafllpI7w6B43f7m/Jt5d+L0PKCS
 1nU1pfOGD5qMAxTVYSPE13qCCLzyfzFNEAWI5mSb9hngpZmpRQBJsAa8d
 nBj1RHibaKPD/sZwsRVrNA8jNQLmZZh+YdtuWefYRq4/2c8ff6iQBMa+2
 Btd1LxKcwCP3xK/drzfo+3pV1xe87J8UeTnNKdG3W/FZhOB83HWaXkwH3
 YJIruecCxHZgGBcybkaqZnLx0AU2EnKiObOBLIoRSR9xyt5zxhzEPLFPr w==;
X-IronPort-AV: E=Sophos;i="5.84,362,1620662400"; d="scan'208";a="177842489"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Aug 2021 12:41:05 +0800
IronPort-SDR: d853ZgDsKvkqadYrCWliUpnNx8pMAP0eLiGXcKcM2hrZv49axyPFU0SxN2O5C82EcXulL9MNJv
 dwT2SlbJOlp34a1/7je/jqxT6ILVaLOot1RXqp/2PP1MZ15On/IXPlnS8vMwxIb/BLHNxMh/gg
 aifMdzi3wqEpGjoPQ46V9jgOZnYhmxYY8HpoV57s6AM8fizcZ1Y8vrl5QqDNaF4BRGG159ZFR9
 jO+huXrfm7JkNiWBVrGBpj3kf5jW42BnEYlxwNvfvCwMN7eCdGjj8AoAQ4XQiHhfXKpPDoQwLS
 wvrQRNJWxd3civ7vedTWhSM8
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2021 21:17:56 -0700
IronPort-SDR: 44WGn+Su5nfmbuzwkQ09BbtpvWpcTg78GoNSg0W2QDZThqBOp2vrXIYZK3KIvqnAJYCiUvM5Mf
 5waUorPgpVWGC3FAnF4zHB2fO5PiB8LvJ4qQ7ep3tg2bAUwTFesyCiiR/9N77tFzGS8SxYdTae
 wSL+/YGN592Qf8iv4Dnwlq5jB6Q8rmm5dEVYIV0wxZEJwjWclVLIQiukz6GNBpws4WqASLySfH
 0obdHqcbZeCSitJz+uuYZ6qgk+5A2SWf4kl3CTAZyg6S7ez4d5wRsa9lzXgKi8cWSJNGPlNd9O
 AjM=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.119])
 by uls-op-cesaip02.wdc.com with ESMTP; 29 Aug 2021 21:41:04 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Aug 2021 13:40:54 +0900
Message-Id: <20210830044100.260173-4-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210830044100.260173-1-damien.lemoal@wdc.com>
References: <20210830044100.260173-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 3/9] arch/config: Make RISC-V 64-bits MMU
 optional
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Linux supports No-MMU RISC-V 64-bits since kernel version 5.8. Make
MMU optional to enable building for RISC-V 64-bits boards that do not
have one. MMU use of RISC-V 32-bits builds remains mandatory for now.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 arch/Config.in       | 1 -
 arch/Config.in.riscv | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in b/arch/Config.in
index 1853e26bb4..2e95b6e76c 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -210,7 +210,6 @@ config BR2_powerpc64le
 
 config BR2_riscv
 	bool "RISCV"
-	select BR2_ARCH_HAS_MMU_MANDATORY
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	help
 	  RISC-V is an open, free Instruction Set Architecture created
diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
index 1fc20e5de7..e6436d7c39 100644
--- a/arch/Config.in.riscv
+++ b/arch/Config.in.riscv
@@ -71,10 +71,12 @@ choice
 
 config BR2_RISCV_32
 	bool "32-bit"
+	select BR2_ARCH_HAS_MMU_MANDATORY
 
 config BR2_RISCV_64
 	bool "64-bit"
 	select BR2_ARCH_IS_64
+	select BR2_ARCH_HAS_MMU_OPTIONAL
 
 endchoice
 
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
