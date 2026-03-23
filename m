Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC7EF46119
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 13:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14D0D60774;
	Mon, 23 Mar 2026 13:56:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kdwBdczbJ5bt; Mon, 23 Mar 2026 13:56:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1242760777
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774274209;
	bh=1J8AEiPRQqt1G6E0U0TGzDp4uMpj/908DUhAL/NInhA=;
	h=Date:References:In-Reply-To:To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=IXHKWWdm8KMhMMYFPVHZeFcSWFLv7QGsNQRFXE+ElcGcfzd9nHZCQ0jhAwH4T4tpX
	 nO0B/Af/QVs6FCR0JWA1jraTQrlfhY0GKGbzkCSQOUngCj9QJ+ohQp2w7lpMImYLkB
	 KtkC0/5Puz+UiOLYM5lSPZsW5hv1Ch/Huls+ts62MQfTTBqfdo/MOlycrxOoVMMlnn
	 a5Gl+lVMEkTKFU6d4IgH8BB9U68hOQ8v8TbNMJP1ARh0YWnYdLoXsVpFgMhw0MlXhT
	 XoP4MfKUUhrW2t0Rlh9amFKNq213LLr97wSzuJUuBNDYSso4tCTZLE0qEZS9tjMplQ
	 7IPQH78s+k4FQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1242760777;
	Mon, 23 Mar 2026 13:56:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B879353
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 13:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 390EE40CA1
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 13:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EVC9t9QVp3TE for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 13:56:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:1600:7:10::8fa9;
 helo=smtp-8fa9.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 12A7C40A21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12A7C40A21
Received: from smtp-8fa9.mail.infomaniak.ch (smtp-8fa9.mail.infomaniak.ch
 [IPv6:2001:1600:7:10::8fa9])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 12A7C40A21
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 13:56:43 +0000 (UTC)
Received: from smtp-4-0000.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:7:10::a6b])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4ffZJ25ZJ2zvWP;
 Mon, 23 Mar 2026 14:48:18 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4ffZJ220G6zrm1; Mon, 23 Mar 2026 14:48:18 +0100 (CET)
Date: Mon, 23 Mar 2026 14:47:51 +0100
MIME-Version: 1.0
Message-Id: <20260323-qt5-5-15-18-v1-3-3cf8da16df10@cherry.de>
References: <20260323-qt5-5-15-18-v1-0-3cf8da16df10@cherry.de>
In-Reply-To: <20260323-qt5-5-15-18-v1-0-3cf8da16df10@cherry.de>
To: buildroot@buildroot.org
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0leil.net; s=20231125; t=1774273698;
 bh=/9SguVJMt3/VEyBSaOxh2JbPQIZfcvMlN1LQBdgjFrY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=SdCRTUtQdtawIpo3yJe+TdZnERg+5hdPJlLk1uu+8dl4SIdGtz2LBWhdf0mY4hfcR
 5EW0p5WIdEB8fWmTIMTDItX54HxWFIkqPZMcBpQ4cxANoYv+icsVstHM/YfIZWgOkC
 ckvhaGqQQuM/rWv2nnU6rZUR5n6mwlABztlEEdoUjxDYH54/RBV/5dUAKdHA8Ts/Pw
 ycjhCtiVc7T952rmn6638pzhc3g7/bsvJShqb5B+qyxQq/YKhon8nvyUgL0UOxb+my
 mnJYjQLF2eXXzw/MMXosKwcIPBrtWR1ur8jzwJuR5s2LeAhgDU69Zb+o6OC4W6kEH7
 GPY1qBzlzP7pw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=0leil.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256
 header.s=20231125 header.b=SdCRTUtQ
Subject: [Buildroot] [PATCH 3/5] package/qt5/qt53d: always disable assimp
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
