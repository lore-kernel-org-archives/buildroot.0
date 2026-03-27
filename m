Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D4910F284F
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 16:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DE7A613BC;
	Fri, 27 Mar 2026 16:53:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dZivOHKgUTbR; Fri, 27 Mar 2026 16:53:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 105C4613B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774630410;
	bh=1J8AEiPRQqt1G6E0U0TGzDp4uMpj/908DUhAL/NInhA=;
	h=Date:References:In-Reply-To:To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=bJEx2asmZ15g4upkIQ7xhrNaxKhgpvGmp1G0ZgOp6de6n0cF3Oww/3czZKLf/0YS3
	 IYOkS4Kxj2grOUbdgJxVYrAMx4wocLcNj2xsTLd374JklUEis/EfbDBEjW2K4gkUQl
	 DviO2WQhoe63AhMrfA6mlwGalsCeDim5ejanOgVACRrym5vfaCPbj3NknJVQUXV6Wy
	 PzFF4ijx+l2/OuUbVX4OiNmJWJOJg7/Yt8X2eaaYmc9HbAIygi3dtQGGtkzTXOKy+s
	 Y1tnOW6/usHOk2g43wCK/3CutwFzlAgNv5sYgux6GD/XCfgUUsJUir6SVrJ7a4hXRe
	 sxV54ZB1R/04Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 105C4613B5;
	Fri, 27 Mar 2026 16:53:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DA152AA
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 16:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C97383EA1
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 16:53:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZZpXye0FmVSd for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 16:53:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:1600:4:17::190c;
 helo=smtp-190c.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5EDD283E96
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EDD283E96
Received: from smtp-190c.mail.infomaniak.ch (smtp-190c.mail.infomaniak.ch
 [IPv6:2001:1600:4:17::190c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5EDD283E96
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 16:53:26 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:4:17::246c])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fj6Cm1M2jzKQv;
 Fri, 27 Mar 2026 17:53:24 +0100 (CET)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4fj6Cf3PHXzN5H; Fri, 27 Mar 2026 17:53:18 +0100 (CET)
Date: Fri, 27 Mar 2026 17:53:04 +0100
MIME-Version: 1.0
Message-Id: <20260327-qt5-5-15-18-v2-3-4c98e853266a@cherry.de>
References: <20260327-qt5-5-15-18-v2-0-4c98e853266a@cherry.de>
In-Reply-To: <20260327-qt5-5-15-18-v2-0-4c98e853266a@cherry.de>
To: buildroot@buildroot.org
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0leil.net; s=20231125; t=1774630404;
 bh=/9SguVJMt3/VEyBSaOxh2JbPQIZfcvMlN1LQBdgjFrY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=oINhs06bU/g2lb4e20fcTYZRu1MGC3EtVFpoki65S30DH2LocIoroTCM1q1pQBHZp
 atKbu5MwOIS/YRv/V+nmzHj8kVDxfotYNbO4wb3/3TiaN/GUyuTw8FO+LHucaabbdO
 QuroPTXBUSPDEXDexfY8PHePXrdwuaXmpye0gbNfHVWlJpO7QaP2mPr3NVxA+AtwV1
 ERZb9BaUKJkSg68DppiUaNFnU8bA1T92tOckuKrrvMSYOeAquO06kRN/t5Y9fXTOa7
 CpXxFkTxtfeVAUc2KK0Zs9ikQ0HLpkFrrR2RVf3GyxdWrHO5IKb+BBTXljKgrtkjHH
 Dt4X9zwpTvV+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=0leil.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256
 header.s=20231125 header.b=oINhs06b
Subject: [Buildroot] [PATCH v2 3/5] package/qt5/qt53d: always disable assimp
 support
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

Neither Buildroot's nor the module from qt53d sources compile, so always
disable assimp support.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 package/qt5/qt53d/qt53d.mk | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index ae15b58df3..33e93ec5db 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -14,14 +14,10 @@ QT53D_SYNC_QT_HEADERS = YES
 # command line argument separator
 QT53D_CONF_OPTS = --
 
-ifeq ($(BR2_PACKAGE_ASSIMP),y)
-QT53D_DEPENDENCIES += assimp
-QT53D_CONF_OPTS += \
-	-feature-system-assimp
-else
+# Assimp support is broken with both Buildroot assimp and the assimp module in
+# the qt53d sources, therefore disable it for now.
 QT53D_CONF_OPTS += \
 	-no-feature-assimp
-endif
 
 QT53D_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0
 QT53D_LICENSE_FILES = LICENSE.GPL LICENSE.GPLv3 LICENSE.LGPLv3

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
