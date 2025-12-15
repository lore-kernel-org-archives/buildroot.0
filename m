Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC5AD5B871
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 22:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E07660F2F;
	Mon, 15 Dec 2025 22:50:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IcAUoMoOFaew; Mon, 15 Dec 2025 22:50:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16E4460F2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765839010;
	bh=70jJoF2zUyA8u/Vg5KJK3cei0UCPeB4nQaZATgE6ahA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WHwmJ7gnDOe/KNLlr5bqOHZOFjVmecdMFpuIT0UhmW99cbdRB5773S7gBo9zDCTc1
	 P6jyBV4DrYzxqG59HMHD9KRoSrbZe2hue+wvAiWZvdeiNIoawTTb29SgIrzDqWn8X1
	 b4ODbQ1GmpnUYZqq35Qmz62ABrbYJYlE6e0G2G2YjPww2mYH36LgYfe6nBVeVpZlv/
	 pk8xlpe7i55UenYpfnIOePklGv1O9zjEGtbq1QLkE3FtZd2MtVDRSBprqf/fKFk+Fi
	 vjT+0Rcvk8NfV8IVI14PgSL50ENm5hIWCDfXpzfX0QCdr8P5MLjz+2sAC8g70Nr0F0
	 JTEM8J3A4Jv4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16E4460F2E;
	Mon, 15 Dec 2025 22:50:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4271E219
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2993340B1B
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:50:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XyLcpeCxdqNc for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 22:50:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 26B8440B10
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26B8440B10
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 26B8440B10
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:50:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 698944E41A65;
 Mon, 15 Dec 2025 22:50:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3AC2C60664;
 Mon, 15 Dec 2025 22:50:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 301451194297B; Mon, 15 Dec 2025 23:50:03 +0100 (CET)
To: Buildroot List <buildroot@buildroot.org>
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Mon, 15 Dec 2025 23:49:36 +0100
Message-ID: <20251215224952.1253359-5-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215224952.1253359-1-thomas.petazzoni@bootlin.com>
References: <20251215224952.1253359-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765839003; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=iZL95kuy4Vjv583XzlBXCXw3s02Fq1pwEmrZiqONO+k=;
 b=RLRZih6+KGhL/+/MI0yMH2omumiAfgxf8C1AWEJIS1eqI9buksnEumn3U0S2iux0ILkJWo
 +mGUMXEtaoCHixjZ9xQYYx7tMWJaNxlDpHeZMZxzf6TFO1DzVtc8xpE1mOuGg1s7Su5Nhg
 FXr+a+SyZ5yrqBNRTUrAVu38A6fWndPt2JZCUEZB8R7ikFiKxZzk9posn0TY/AeFZqxJLL
 TeVq/emtozE7QbX2kRMYpkwTytfnJm2kIOgEO9aaeuSEvHQNl8fzjWj/YCagIGk9bzfNkG
 yuCaxJ8hMpB0qSlcXlPrMn5MPR76iTsgAfb5E62bEah2w+xTWIMw8lSc+eNXjw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=RLRZih6+
Subject: [Buildroot] [PATCH 04/13] package/glslsandbox-player: drop
 rpi-userland support
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As we're about to remove the rpi-userland package, drop support for it
from package/glslsandbox-player.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glslsandbox-player/Config.in             | 5 -----
 package/glslsandbox-player/glslsandbox-player.mk | 3 ---
 2 files changed, 8 deletions(-)

diff --git a/package/glslsandbox-player/Config.in b/package/glslsandbox-player/Config.in
index 530c158fc3..d2e146d827 100644
--- a/package/glslsandbox-player/Config.in
+++ b/package/glslsandbox-player/Config.in
@@ -53,7 +53,6 @@ choice
 	prompt "Native windowing system"
 	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI  if BR2_PACKAGE_SUNXI_MALI_UTGARD
 	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI_T76X if BR2_PACKAGE_MALI_T76X
-	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_RPI   if BR2_PACKAGE_RPI_USERLAND
 	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_SDL2  if BR2_PACKAGE_SDL2_OPENGLES
 	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_TISGX if BR2_PACKAGE_TI_SGX_UM
 	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_VIVFB if BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB
@@ -81,10 +80,6 @@ config BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI_T76X
 	bool "ARM/Mali T76x Frame Buffer"
 	depends on BR2_PACKAGE_MALI_T76X
 
-config BR2_PACKAGE_GLSLSANDBOX_PLAYER_RPI
-	bool "RaspberryPI Frame Buffer"
-	depends on BR2_PACKAGE_RPI_USERLAND
-
 config BR2_PACKAGE_GLSLSANDBOX_PLAYER_SDL2
 	bool "SDL2"
 	depends on BR2_PACKAGE_SDL2_OPENGLES
diff --git a/package/glslsandbox-player/glslsandbox-player.mk b/package/glslsandbox-player/glslsandbox-player.mk
index 0066f43567..2e5212396b 100644
--- a/package/glslsandbox-player/glslsandbox-player.mk
+++ b/package/glslsandbox-player/glslsandbox-player.mk
@@ -52,9 +52,6 @@ GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=mali
 else ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI_T76X),y)
 GLSLSANDBOX_PLAYER_DEPENDENCIES += mali-t76x
 GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=nullws
-else ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_RPI),y)
-GLSLSANDBOX_PLAYER_DEPENDENCIES += rpi-userland
-GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=rpi
 else ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_SDL2),y)
 GLSLSANDBOX_PLAYER_DEPENDENCIES += sdl2
 GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=sdl2
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
