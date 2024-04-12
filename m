Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355D0C4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 19:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCCF6605E7;
	Fri, 12 Apr 2024 19:54:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QMQAKgLoSxXE; Fri, 12 Apr 2024 19:54:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3A0E605E8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3A0E605E8;
	Fri, 12 Apr 2024 19:54:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 38F411BF4E2
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 19:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21D8580E72
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 19:54:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TWhgvW7tvIMD for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 19:54:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CA39980E69
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA39980E69
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA39980E69
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 19:54:00 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 327A4B00539;
 Fri, 12 Apr 2024 21:53:55 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 12 Apr 2024 21:53:46 +0200
Message-ID: <20240412195346.1563030-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712951637;
 bh=1vlNX47lMfWwu9cl53o6TGEzPdsWMcVg0WoIReYMkfk=;
 h=From:To:Cc:Subject:Date:From;
 b=sLC2lVfuAuq+txsMVJReeh77sjzkRScQPdFbM7PzLTmCYnyT+cIVPkBpuyZ8jSZw0
 87fg2m2LYQj+FNHQXUb7HFjS+e9FzygvpMKPy2gF3PF75/+XOa+aksk1FH6qN5xOKE
 DUNMkAzzRuHlJvADNd3dhpNDXoLqbRPGEX0P/h4DHCEEiyo6v1cb7b4bU8/W1QcrhM
 q2j29k0eQIFXCH+g7gXtw70eP/6VaQICeDNFlxK/yLxElFdL9r+OzhGuQf51Q9+rrj
 LfnCfwRidPos1m+dlh8l4OoeOXK9kz3ExOC5a8ey+/QK75lhq5nBiqgEgRKqSGbF2O
 C8FwMWnmkuyaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sLC2lVfu
Subject: [Buildroot] [PATCH 1/1] configs/wandboard: uboot needs openssl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Julien Olivain <ju.o@free.fr>, Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6609466641

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/wandboard_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index 522173b8ed9..b110c292dd6 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -26,6 +26,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="wandboard"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
 
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
