Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633D0C001DE
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 14:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DF724021B;
	Sun,  6 Aug 2023 14:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DF724021B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id doeeJ-K5_4HA; Sun,  6 Aug 2023 14:06:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC398409B6;
	Sun,  6 Aug 2023 14:06:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC398409B6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5A54C1BF947
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E8A960B14
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:04:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E8A960B14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZYVGNAJkKI43 for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 14:04:13 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D6D060B0F
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 14:04:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D6D060B0F
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2020AA4C10E9;
 Sun,  6 Aug 2023 16:02:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46282)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSeLD-0000Bn-2z;
 Sun, 06 Aug 2023 16:02:43 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  6 Aug 2023 16:02:36 +0200
Message-Id: <20230806140241.4155773-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230806140241.4155773-1-bernd@kuhls.net>
References: <20230806140241.4155773-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691330564;
 bh=RT/uUYiF0W1QfEi224fz7cYBEU2dNZpM1ZBfJE9CbWk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FRy2jJkImny6Q8YIukm7S2dzTyW0dnKoXm/wiwAcZL0FpxiFgigrklqO0/eVOXLE9
 fL8T5FMGuexQowRmaXL6IdPnj33gtEV6/e36uDMbYQJ/ftgyqWmWtK6z2LiSezOOzd
 mQyUn6GaTXY5PDTVjL9WQr+QyNG14XlmhRY8SAvfDhPYpkeBpCBGyJnEi5iCDPrlzm
 7g2uL1ZmExtiKrUVJoACo9/wVCUw5uL8BNqdbMrSJHAUkGk5gy8M5M6yA7k49C0ztw
 9Lx4l3JXdjgcteEYgKdgLduAOUl4Ek3qe4HW4G33FI0dZL5Kg0jwpyDE4KY3y2YGjc
 7L6MUYsR4Vueg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=FRy2jJkI
Subject: [Buildroot] [PATCH/next v9 07/12] package/qt5base: optionally use
 libudev
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 "Yann E. MORIN" <yann.morin@orange.com>, Sen Hastings <sen@phobosdpl.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

qt5base only requires libudev, not a full udev daemon.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: "Yann E. MORIN" <yann.morin@orange.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/qt5/qt5base/qt5base.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 028236d2ed..f7d6559d9f 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -105,8 +105,8 @@ ifneq ($(QT5BASE_CONFIG_FILE),)
 QT5BASE_CONFIGURE_OPTS += -qconfig buildroot
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-QT5BASE_DEPENDENCIES += udev
+ifeq ($(BR2_PACKAGE_HAS_LIBUDEV),y)
+QT5BASE_DEPENDENCIES += libudev
 endif
 
 ifeq ($(BR2_PACKAGE_CUPS), y)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
