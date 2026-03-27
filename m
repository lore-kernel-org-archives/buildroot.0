Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FCF10F2855
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 16:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 222B1613AD;
	Fri, 27 Mar 2026 16:53:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v3W1CFG3GNWr; Fri, 27 Mar 2026 16:53:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 458CE61313
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774630404;
	bh=eB3j1A1+ZTo2ac8bddStebD/qKLIkHLX5ryn259/DG8=;
	h=Date:References:In-Reply-To:To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=sb3XXQpsOnyNjLhYmqPEr88TyII9LafgFLSux1VmefozzP5rxFqWjNekHswc+oOBx
	 U8LJyPSvlP+QicgwRx5nRTrIGwonRT5UFgp4fJeIH030sdp24teEgL4Uk7V9wuO+G7
	 iBbZQ3HnUWflRcnkdcPQhZVxbPJ2cvC1yKaBMprHE2IokPLhjjwSvMeforKuYvloxY
	 w49oaMhnLIFu7Dc5ESvS/PQ2yt6XsAuFemouIYRgpz3iQ5dAh7RrMUPeWDmx8RuhAn
	 oa+YSMRIPhbCZqz+JG+cXN1/n5aN2FpCrRhCyy5PEch+wKRaQZdnA6nMnA3kYeKF5k
	 pu+0HUhb9/9pA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 458CE61313;
	Fri, 27 Mar 2026 16:53:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 186F92D5
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 16:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3560417A3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 16:53:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BeOp_sofUEug for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 16:53:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.25.8;
 helo=smtp-1908.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CD0BC4179F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD0BC4179F
Received: from smtp-1908.mail.infomaniak.ch (smtp-1908.mail.infomaniak.ch
 [185.125.25.8])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD0BC4179F
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 16:53:20 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch
 [10.4.36.108])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fj6Cf32BhzLG9;
 Fri, 27 Mar 2026 17:53:18 +0100 (CET)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4fj6Cd5pPJzLvr; Fri, 27 Mar 2026 17:53:17 +0100 (CET)
Date: Fri, 27 Mar 2026 17:53:03 +0100
MIME-Version: 1.0
Message-Id: <20260327-qt5-5-15-18-v2-2-4c98e853266a@cherry.de>
References: <20260327-qt5-5-15-18-v2-0-4c98e853266a@cherry.de>
In-Reply-To: <20260327-qt5-5-15-18-v2-0-4c98e853266a@cherry.de>
To: buildroot@buildroot.org
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0leil.net; s=20231125; t=1774630398;
 bh=ttn+7Xxwhc+N+o1s+RcKgfuYZ6sDVodL7bA+SLJhauI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=OLBtGMD8VOCzl8SrrH3pUTJCewlnJtlob4nkE+4pZ4kDPNBF7sDZ+P8Zxjg/MJnVB
 Yy72BjmvnSgAYmRgY/MVxbyZVQ8bhi7YZLPZHSAxUsd5FSpEZtKOKOj2gkMxm6XuJl
 pNSj1JHnB9W93PsSFEXOYVC8m3lTH8Suqsg7PAwq+fVBYK0PP84AyNcoUB08q0VrA+
 JdQFPvdbWP8wUbBdR8CkhugGEySX+EJLJ3aIfFJUtz9yNFLoJYZ0bV+AHAqgHUnA+K
 TCrV0chsyH8c7/4wL0OwYv6e0pqz0BUYquQHAksb9MrEx0JX4SyySCSo9/wCJWPiR4
 0iKCpg5ivkzEQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=0leil.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256
 header.s=20231125 header.b=OLBtGMD8
Subject: [Buildroot] [PATCH v2 2/5] package/qt5/qt53d: force using
 Buildroot's assimp when selected
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
From: Quentin Schulz via buildroot <buildroot@buildroot.org>
Reply-To: Quentin Schulz <foss+buildroot@0leil.net>
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Peter Seiderer <ps.report@gmx.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Quentin Schulz <quentin.schulz@cherry.de>

If we're adding a dependency to the package, it's for its build system
to use it. Unfortunately, when -feature-system-assimp is not passed, the
assimp module from the sources will be used. Moreover, it doesn't build
currently.

Unfortunately, qt53d still doesn't build with assimp from Buildroot.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 package/qt5/qt53d/qt53d.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index 459b019902..ae15b58df3 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -16,6 +16,8 @@ QT53D_CONF_OPTS = --
 
 ifeq ($(BR2_PACKAGE_ASSIMP),y)
 QT53D_DEPENDENCIES += assimp
+QT53D_CONF_OPTS += \
+	-feature-system-assimp
 else
 QT53D_CONF_OPTS += \
 	-no-feature-assimp

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
