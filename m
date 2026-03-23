Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA3AF4611B
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 13:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B0ED6077D;
	Mon, 23 Mar 2026 13:56:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ahd6QodK2cml; Mon, 23 Mar 2026 13:56:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6342D60648
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774274207;
	bh=eB3j1A1+ZTo2ac8bddStebD/qKLIkHLX5ryn259/DG8=;
	h=Date:References:In-Reply-To:To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=KX/eU5wbLlwAIacclNWO0CQyxt+BKMy6dYfMUs+mXM9i6opxPiUBUuZZwCcD/1b97
	 gb3II69VVBg91BUJcSbiGAzHbhutNxfViGK1yB7AvA2ODG2DhIsY688aPhDQhP4Gw2
	 oJl1k7cBIwa3yV4IFUo/Irb5FFxz0SwhfN3/eFLMNi2zRYiB6oHVlOFMgKfVn7Mrdt
	 PFC/672P719T6TnSAY8JWVvR8vxKOOtqhi5170gJUG5dt1J3WPtpe40pWzsLSBr+xf
	 bM2tQEKMA1ByRIIY28usBcET3pWOeCqU5C0mCu2KaHwst1ulPOzlX929VOKmAXUcMK
	 IBCruG0gN6GtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6342D60648;
	Mon, 23 Mar 2026 13:56:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2599F356
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 13:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BCF1401A1
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 13:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NuD_ZNodmbWu for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 13:56:44 +0000 (UTC)
X-Greylist: delayed 502 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 23 Mar 2026 13:56:43 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CA38E400F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA38E400F1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.157.188.9;
 helo=smtp-bc09.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
Received: from smtp-bc09.mail.infomaniak.ch (smtp-bc09.mail.infomaniak.ch
 [45.157.188.9])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA38E400F1
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 13:56:43 +0000 (UTC)
Received: from smtp-4-0000.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:7:10::a6b])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4ffZJ225vTzwHs;
 Mon, 23 Mar 2026 14:48:18 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4ffZJ15CDYzppm; Mon, 23 Mar 2026 14:48:17 +0100 (CET)
Date: Mon, 23 Mar 2026 14:47:50 +0100
MIME-Version: 1.0
Message-Id: <20260323-qt5-5-15-18-v1-2-3cf8da16df10@cherry.de>
References: <20260323-qt5-5-15-18-v1-0-3cf8da16df10@cherry.de>
In-Reply-To: <20260323-qt5-5-15-18-v1-0-3cf8da16df10@cherry.de>
To: buildroot@buildroot.org
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0leil.net; s=20231125; t=1774273698;
 bh=ttn+7Xxwhc+N+o1s+RcKgfuYZ6sDVodL7bA+SLJhauI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ahKqd7Yy6Hrfb/xmw8kx5payE55huWkz9Ej6eY9CrHtIQP2sfOMMZ75yHzN/SkRTC
 61jLKtsqotuLbae3ohmtaWIHgaSMky8MS0xOFZlM0ZdAc5yyH/Xa58aBHRSFbG+MNh
 q2fCV4vk36oNDscTDQok+te71PPH9mmJnRNQWMgaCrU6e9tfUsTTaO7xEN65nI/Byk
 lLAd0YERQuaI3gjzTBYgdxbG7v7+3UTrprK0SG5Oqmh7ruID6viy5wnbWTNp6O0h2+
 QY4jdSCG4jipXzSbfo4ooXU/h+TGFgn3DmwrK04xcRvAM0QGPLw559zfaW+7GrPfHI
 HclHGRODpqWCA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=0leil.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256
 header.s=20231125 header.b=ahKqd7Yy
Subject: [Buildroot] [PATCH 2/5] package/qt5/qt53d: force using Buildroot's
 assimp when selected
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
