Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F33ECA0FED
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 20:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51110842EF;
	Wed, 10 Sep 2025 20:39:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2pO64_z3stHe; Wed, 10 Sep 2025 20:39:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A473F842F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A473F842F3;
	Wed, 10 Sep 2025 20:38:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DD639443
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 20:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88025842BF
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 20:38:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W7kST8tTZ3cU for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 20:38:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5A519842D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A519842D4
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A519842D4
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 20:38:53 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:382f:cdeb:de75:d1ab])
 (Authenticated sender: vjardin@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5C87F13F899;
 Wed, 10 Sep 2025 22:38:48 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Vladimir Oltean <olteanv@gmail.com>,
	Vincent Jardin <vjardin@free.fr>
Date: Wed, 10 Sep 2025 22:38:25 +0200
Message-ID: <20250910203826.41407-3-vjardin@free.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250910203826.41407-1-vjardin@free.fr>
References: <20250910203826.41407-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757536731;
 bh=EGR51y5Q4pPSr/bXN2gjBtZQZhBy/ZkttsZ65xiu7gw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nDD7v3I/incfUuhU4MbQ3GYZGSPV0BXUYiklC8JIyTpN6s/pggsKC+58ctiQcrUjZ
 tQ2MiD2dWJMi8RDUk3E60SFw883HaqznarsVFqkvR03uY/bx0rMCfAmgILfYaMWJzM
 jQc4/Ad+lwbZ4vg+KNmgMUNVwIBGwKSRzJrmFB3E4XEYGVDcsMiil5OWm7AdAMaNWs
 fAyQ+EKPEL4HiYMBWElwau50ztk/+H5O7ziacLn1AWvs7z49oQkLOT5aG62sFHyAVT
 JKFV8pna52VBRhDAI4ep6Vc0pxbiNgFegTtINsGmjmIMj6fZffHE7qIjHOizLJ0Fva
 idVk7+ljFBvcw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=nDD7v3I/
Subject: [Buildroot] [PATCH v4 2/2] package/qoriq-rcw: Generate RCW from
 templates
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Solidrun has started a framework to generate the RCW from templates.
Let's leverage it when it is available. If not, let's skip it.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 package/qoriq-rcw/qoriq-rcw.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qoriq-rcw/qoriq-rcw.mk b/package/qoriq-rcw/qoriq-rcw.mk
index 35602e41e4..d6bdd9cd69 100644
--- a/package/qoriq-rcw/qoriq-rcw.mk
+++ b/package/qoriq-rcw/qoriq-rcw.mk
@@ -61,6 +61,7 @@ else ifneq ($(QORIQ_RCW_INTREE),)
 QORIQ_RCW_PLATFORM = $(firstword $(subst /, ,$(QORIQ_RCW_INTREE)))
 
 define HOST_QORIQ_RCW_BUILD_CMDS
+	if [ -e "$(@D)/GenerateSRConfigs.sh" ]; then (cd $(@D) && ./GenerateSRConfigs.sh); fi
 	$(MAKE) -C $(@D)/$(QORIQ_RCW_PLATFORM)
 endef
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
