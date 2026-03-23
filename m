Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF58F4611B
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 13:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5FAF607FE;
	Mon, 23 Mar 2026 13:56:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xcw_SVEVIwcs; Mon, 23 Mar 2026 13:56:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B60B2607DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774274212;
	bh=8/VjpRDUQD12HyyYwJsTuwRBftk/qhuS/wEv04ds33Q=;
	h=Date:References:In-Reply-To:To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=TBTLxIfkXZaMzZMA837ZcC1LakqbrvaD7BFd4jB0d910nL5cPrDpgoDsBihAX9ntv
	 IeSWkJ2Mbtw+jwtUB4ZghsgCM4BmvZ/nmJUPBPUKgpmV0EOBCAEgjDa5XgTVfOZ5no
	 SmjfeuDsRq97zszjWfmjrw1ZebEhTIrLIDECCd+uULVw/5zhKz1+nreXrc1V2PVroi
	 6DIUXdmLEXvmLw+2AuO0lQfwliH0pFC96MVIpo41x5M278q4CIhiw+zCs3gwwWHClV
	 KYnRXDG4jlXstoVRTXAIw6vZUVqC02QubgRAQeonvpYE/gWfhMJnSooPWdTv8W1XxS
	 QgXGHh9bJqMrA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B60B2607DD;
	Mon, 23 Mar 2026 13:56:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 232F81D3
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 13:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0638A80AD1
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 13:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6yuBbGvKuR1M for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 13:56:44 +0000 (UTC)
X-Greylist: delayed 503 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 23 Mar 2026 13:56:43 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 12D1380ACF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12D1380ACF
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:1600:7:10::42af;
 helo=smtp-42af.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
Received: from smtp-42af.mail.infomaniak.ch (smtp-42af.mail.infomaniak.ch
 [IPv6:2001:1600:7:10::42af])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 12D1380ACF
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 13:56:43 +0000 (UTC)
Received: from smtp-4-0000.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:7:10::a6b])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4ffZJ15K6yzx9Y;
 Mon, 23 Mar 2026 14:48:17 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4ffZJ10bDHzqwt; Mon, 23 Mar 2026 14:48:17 +0100 (CET)
Date: Mon, 23 Mar 2026 14:47:49 +0100
MIME-Version: 1.0
Message-Id: <20260323-qt5-5-15-18-v1-1-3cf8da16df10@cherry.de>
References: <20260323-qt5-5-15-18-v1-0-3cf8da16df10@cherry.de>
In-Reply-To: <20260323-qt5-5-15-18-v1-0-3cf8da16df10@cherry.de>
To: buildroot@buildroot.org
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0leil.net; s=20231125; t=1774273697;
 bh=HYa6q+2L3G9qW2JZBKFnplHlXiwrULD7k7Y3gt8ygkI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Ukbp0+hkeIh6C9rqlpDUrbSHj3WY9do/p2A4XyeR78HiS42mOcAFU2EsQCI+Ew1TV
 yDGG25rAdd7fHBPqUU3Fa3UjHKx/Bfk/8W5hDqSxBTJb4qTWMd2Ikx7ypVD3Q1D49W
 na25iGjxL2MWH5OXLi+lYVV9KyPWxML9NKk58Mlm5JrfSFKjFVTMk0dfH0Ha/u5lDk
 YWH05kytn0K9qcH15lNKYP7Y2acXBjtyr+0c8MQZv718+FXnbi+Y0YQDdrweGedp1v
 ATCPNgIRvGNRUdaXZ3w0rcaz+s7BsyeYk5snSU3aDhVR1cwBqQfsQJd/tM+TkSZo4O
 ZfQXOGfhLPgxw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=0leil.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256
 header.s=20231125 header.b=Ukbp0+hk
Subject: [Buildroot] [PATCH 1/5] package/qt5/qt53d: disable assimp support
 when BR2_PACKAGE_ASSIMP is not set
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

If we don't disable it, the assimp module from the sources will be used
instead of none. Unfortunately, it currently doesn't build so let's
disable it when BR2_PACKAGE_ASSIMP is not set such that one can still
build qt53d.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 package/qt5/qt53d/qt53d.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index 8d9babd704..459b019902 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -11,8 +11,14 @@ QT53D_DEPENDENCIES = qt5declarative
 QT53D_INSTALL_STAGING = YES
 QT53D_SYNC_QT_HEADERS = YES
 
+# command line argument separator
+QT53D_CONF_OPTS = --
+
 ifeq ($(BR2_PACKAGE_ASSIMP),y)
 QT53D_DEPENDENCIES += assimp
+else
+QT53D_CONF_OPTS += \
+	-no-feature-assimp
 endif
 
 QT53D_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
