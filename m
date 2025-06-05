Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607CFC5B543
	for <buildroot@archiver.kernel.org>; Thu,  5 Jun 2025 14:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1204880D85;
	Thu,  5 Jun 2025 14:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9225VUYx3-J7; Thu,  5 Jun 2025 14:41:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56B0380D47
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56B0380D47;
	Thu,  5 Jun 2025 14:41:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 27E441A6
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 14:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A605401B0
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 14:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zfHqv4BcHxgU for <buildroot@buildroot.org>;
 Thu,  5 Jun 2025 14:41:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=93.104.207.81;
 helo=mx1.tq-group.com; envelope-from=matthias.schiffer@ew.tq-group.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9544340183
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9544340183
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9544340183
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 14:41:17 +0000 (UTC)
X-CSE-ConnectionGUID: VzA0sg43S7mehsxBPXHKxA==
X-CSE-MsgGUID: OroxvzMGQpOzmavX6GPiOg==
X-IronPort-AV: E=Sophos;i="6.16,212,1744063200"; d="scan'208";a="44481695"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 05 Jun 2025 16:34:05 +0200
X-CheckPoint: {6841AADC-28-E6D854B1-C1E76DF5}
X-MAIL-CPID: 1C108A7344C6C2474C22D7B4A6CB6927_4
X-Control-Analysis: str=0001.0A00639A.6841AAE8.001F, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9EF9B164B5F; Thu,  5 Jun 2025 16:34:00 +0200 (CEST)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: buildroot@buildroot.org
Cc: Vladimir Oltean <olteanv@gmail.com>, oss@ew.tq-group.com,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Date: Thu,  5 Jun 2025 16:32:41 +0200
Message-ID: <f4d62d775a2fc76a6a2ad286675df03610e3ecbc.1749133483.git.matthias.schiffer@tq-group.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <21834b48ff096e427bdb722be447f4ea8a770135.1749133483.git.matthias.schiffer@tq-group.com>
References: <21834b48ff096e427bdb722be447f4ea8a770135.1749133483.git.matthias.schiffer@tq-group.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1749134477; x=1780670477;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OPorxbI0BEYEWP8MWlLf1aTlXQoUQScQ75ooYsJjLCk=;
 b=Uudo9FNuybzQwJlu4QXGA6jqMxiFK8RwrU9pWIldSJe0Z8PC6xRjANh7
 0+Ti1262uRLFET+hAbYnY9mwVh3SLvxtDzYPSzotl1khpNHwH0CDCy/9q
 ZK693aS5EhQTbZIW3Q2pkUn7jH0eQYs9+onwIthr1SUHtNh0laCxLUCkS
 41xVHKv/yBtp+OIPPThKtF+rx7Wg4kTO+La/whbtDLC7k6cKZs2A/bbO5
 5Y8h2GBhPEQcP8jgdFy5trU1pvtX682ftVlqWRQrtKmFffAwQEJyTsW1Q
 RWA+11Qi//Mz6Yj/A3Rz/Wvi2GR68zlkj7ZAdyKAYSmH0O/nY95ndVeER
 Q==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ew.tq-group.com; s=dkim; t=1749134040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OPorxbI0BEYEWP8MWlLf1aTlXQoUQScQ75ooYsJjLCk=;
 b=Ikwmt5wfngWP4I1I2zvNXo3PREddfIa/7b9DjMiIegPbh9Gkl4IWde0sULoZfl3zx4cURS
 czBcI5b3IDy953odExKiO+ac+ahgctwAqFvX8Z3JqdnUAFUIlPeyYe8ntYaCu1lKKjbxAD
 B0TK1vgLafzb882yKTtCtsrEHMSSdjdT33llu7g9GrimFyyzQW/JHaGDHNGtvE6h5bLZC0
 Tl5gSX3lRPzujKt/mTr8GiBRGAEO3r3dQNjb+OYMT5ysuFO2LT2rzbn9Wm4XB+AwxLRx7l
 WyGFq4xiMtMwkOUrQmwrLCtz+hfR/4NpPxx+Yzi2DMnQZgrDciDTnmBuH/gdIQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=ew.tq-group.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com
 header.a=rsa-sha256 header.s=key1 header.b=Uudo9FNu; 
 dkim=temperror header.d=ew.tq-group.com header.i=@ew.tq-group.com
 header.a=rsa-sha256 header.s=dkim header.b=Ikwmt5wf
Subject: [Buildroot] [PATCH 2/2] package/qoriq-mc-utils: fix target install
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

- The check was referencing an incorrect variable name
- In the `$(QORIQ_MC_UTILS_DPC_FILES) $(QORIQ_MC_UTILS_DPL_FILES)` case,
  the target directory needs to be created first

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 package/qoriq-mc-utils/qoriq-mc-utils.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/qoriq-mc-utils/qoriq-mc-utils.mk b/package/qoriq-mc-utils/qoriq-mc-utils.mk
index 29a0d3c560..63390ad6de 100644
--- a/package/qoriq-mc-utils/qoriq-mc-utils.mk
+++ b/package/qoriq-mc-utils/qoriq-mc-utils.mk
@@ -16,11 +16,12 @@ QORIQ_MC_UTILS_DPL_FILES = $(call qstrip,$(BR2_PACKAGE_QORIQ_MC_UTILS_DPL_CUSTOM
 QORIQ_MC_UTILS_DPL_INTREE = $(call qstrip,$(BR2_PACKAGE_QORIQ_MC_UTILS_DPL_INTREE))
 QORIQ_MC_UTILS_INSTALL_PATH = $(call qstrip,$(BR2_PACKAGE_QORIQ_MC_UTILS_TARGET_INSTALL_PATH))
 
-ifeq ($(QORIQ_MC_UTILS_TARGET_INSTALL_PATH),)
+ifeq ($(QORIQ_MC_UTILS_INSTALL_PATH),)
 QORIQ_MC_UTILS_INSTALL_TARGET = NO
 endif
 
 define QORIQ_MC_UTILS_INSTALL_FILES
+	$(INSTALL) -d $(1)
 	$(foreach file, $(QORIQ_MC_UTILS_DPC_FILES) $(QORIQ_MC_UTILS_DPL_FILES), \
 		PATH=$(BR_PATH) dtc -I dts -O dtb $(file).dts -o $(1)/$(notdir $(file)).dtb
 	)
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
