Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58581C433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 19:51:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6D6B60FD7
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 19:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B6D6B60FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86FD1426BC;
	Fri,  3 Sep 2021 19:51:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ibmqmvcNmpjF; Fri,  3 Sep 2021 19:51:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7963426A6;
	Fri,  3 Sep 2021 19:51:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B0E21C115D
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 19:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4653983EEC
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 19:51:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7wGvRlII1NKt for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 19:51:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C13C83EDA
 for <buildroot@buildroot.org>; Fri,  3 Sep 2021 19:51:36 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.165.52.250])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C3339B0052C;
 Fri,  3 Sep 2021 21:51:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1630698692;
 bh=fKGChuUrIQbwy3ZunNMk91UxfsCHlmMtg4AwNEZkoJs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DpZNVfbeKQljgJiLTULrsEEZnL+qdQp8FX6sLwd6CQ1T4YnC8w2+Ka3Zcbmk4HaG0
 +XSbDKC9yy5sBtn7oxUY+7cVZZJ41p22zrZhutha/edgxUlleeDvftKnXLJShWhRKS
 7WX2GwtAdwujStaSh4ZYLM0QJu3YgM3tNMBCjLf9bsxxoD4wd777YC0/oB1FN2dr4H
 1W7/8Tm6RzFieZbv5rNitZZX/tT28xSi4V/OI8MHF1LDgO+fSehbN95TgC9gmzv82X
 qRXNxcX3gLvv2C9cipAfpK6/FIb7qUaW/BA7TwnEtvSDxvKweQ1m+jpzWYAW9y0hxC
 skdAGzYizcV/Q==
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri,  3 Sep 2021 21:50:20 +0200
Message-Id: <20210903195021.11686-2-ju.o@free.fr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903195021.11686-1-ju.o@free.fr>
References: <20210903195021.11686-1-ju.o@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/glslsandbox-player: add mali-t76x
 support
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

mali-t76x frame buffer driver requires a "null" native windowing
system. With such a system, the default EGL display is selected.

Fixes:
http://autobuild.buildroot.net/results/4a579346463d0d946d6d2a05723270135d728981

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/glslsandbox-player/Config.in             | 5 +++++
 package/glslsandbox-player/glslsandbox-player.mk | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/package/glslsandbox-player/Config.in b/package/glslsandbox-player/Config.in
index dc0d2c07f1..8ab668d260 100644
--- a/package/glslsandbox-player/Config.in
+++ b/package/glslsandbox-player/Config.in
@@ -56,6 +56,7 @@ config BR2_PACKAGE_GLSLSANDBOX_PLAYER_SCRIPTS
 choice
 	prompt "Native windowing system"
 	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI  if BR2_PACKAGE_SUNXI_MALI_MAINLINE
+	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI_T76X if BR2_PACKAGE_MALI_T76X
 	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_RPI   if BR2_PACKAGE_RPI_USERLAND
 	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_SDL2  if BR2_PACKAGE_SDL2_OPENGLES
 	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_TISGX if BR2_PACKAGE_TI_SGX_UM
@@ -73,6 +74,10 @@ config BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI
 	bool "Allwinner ARM/Mali Frame Buffer"
 	depends on BR2_PACKAGE_SUNXI_MALI_MAINLINE
 
+config BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI_T76X
+	bool "ARM/Mali T76x Frame Buffer"
+	depends on BR2_PACKAGE_MALI_T76X
+
 config BR2_PACKAGE_GLSLSANDBOX_PLAYER_RPI
 	bool "RaspberryPI Frame Buffer"
 	depends on BR2_PACKAGE_RPI_USERLAND
diff --git a/package/glslsandbox-player/glslsandbox-player.mk b/package/glslsandbox-player/glslsandbox-player.mk
index 341b939110..1578608a42 100644
--- a/package/glslsandbox-player/glslsandbox-player.mk
+++ b/package/glslsandbox-player/glslsandbox-player.mk
@@ -44,6 +44,9 @@ GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=kms
 else ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI),y)
 GLSLSANDBOX_PLAYER_DEPENDENCIES += sunxi-mali-mainline
 GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=mali
+else ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI_T76X),y)
+GLSLSANDBOX_PLAYER_DEPENDENCIES += mali-t76x
+GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=nullws
 else ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_RPI),y)
 GLSLSANDBOX_PLAYER_DEPENDENCIES += rpi-userland
 GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=rpi
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
