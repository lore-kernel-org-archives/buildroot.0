Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD07CA101F
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 11:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8096660724;
	Wed, 10 Sep 2025 11:35:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dgv08D2yDCjC; Wed, 10 Sep 2025 11:35:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 282F360B70
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 282F360B70;
	Wed, 10 Sep 2025 11:35:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E34C110E
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 11:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9949405EC
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 11:35:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r4cPNuXEufy9 for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 11:35:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 639FF405D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 639FF405D4
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 639FF405D4
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 11:35:50 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:382f:cdeb:de75:d1ab])
 (Authenticated sender: vjardin@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7F67F13F8CF;
 Wed, 10 Sep 2025 13:35:46 +0200 (CEST)
To: buildroot@buildroot.org
Cc: vjardin@free.fr
Date: Wed, 10 Sep 2025 13:35:44 +0200
Message-ID: <20250910113544.27088-1-vjardin@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757504147;
 bh=0Cqq8cJEYdJoEM3yavH57NRr8W41HB/5852oFrSCA1s=;
 h=From:To:Cc:Subject:Date:From;
 b=jMf8BRWC3W09zOe/c49n72mvfJ92qahnyFgdlifL9+CVYqi7HCyb0evFs+GKOxD8x
 ZjOM3Gj7uycSNaqAnoy/MfteHKiKjeHxfsEcb3Jq71GXFzFIJR+/oZghWaA0xy4cMm
 rpoOwtUvH04b+tktP9tLUiqXeM/kHScC5j8fvGq89KR6zLgIgnBKzm4ivK+u3OwsFF
 ZgyvT5cHA6h0wOVYKpJoPKCtRtL6Bn20JNnjYhwuF/Ze6eimL+hHvz4SBRLOcBZqdR
 ig1FCveptOJoDIrAMAgy+VM6YYg7c/H2fS5mu92ohUz86WXx3AHYSl1KnuTsBo0Yg4
 Ck2pOx7ZQT7mQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=jMf8BRWC
Subject: [Buildroot] [PATCH] package/qoriq-rcw: Generate RCW from templates
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
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
