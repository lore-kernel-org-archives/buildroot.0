Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFDBC433EF
	for <buildroot@archiver.kernel.org>; Fri, 31 Dec 2021 12:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0BD981439;
	Fri, 31 Dec 2021 12:47:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l-N8yn6rTXRx; Fri, 31 Dec 2021 12:47:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2056C813FD;
	Fri, 31 Dec 2021 12:47:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A8041BF2F3
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 12:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19B5540293
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 12:47:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0eclWl1vVDQF for <buildroot@lists.busybox.net>;
 Fri, 31 Dec 2021 12:47:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E2914027E
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 12:47:35 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id l4so17294890wmq.3
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 04:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ys9VsqvpMQug3J/DGA+Gm7PjQ0bw66cfefENX6HWT8Q=;
 b=hHC+qF10z3ZH9bl6d5KPpVQS1zp5FTOK6hgbrsVh+Mnoy+5QKnTTB+vQ+vJgp1Y6/K
 BICRrc3P3DVg7301l3yXB6JlRdlAHRxrMzR2CQ34sc2H2vCSAqvJh4ZUD+cDsIQMxg3P
 oDYbBU5Y7KiKM8nX5U9Hci7x4Z/OKE1zxuD3wz8VEfvJJ3ltxa6i/4y784PaNiEqpnr7
 kZ0a6dFstWpnVTeiBynv82ayepeB/m0UW4RxEELRLn8GFZ1GMvmo/PegQPU6VvEeMeyu
 FV70fd1dnQ+IEYNxU0EE9eSIVvr/TezZ1lmjPqrGXRBc35PC5hnNxUdBpmx3rFGvcpNU
 bFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ys9VsqvpMQug3J/DGA+Gm7PjQ0bw66cfefENX6HWT8Q=;
 b=oltq/Vj5mcvAOwrsAc55XW3+iM2fN6Oz6IyOmgw2J1gOCqTuiYTYyzDArIZ2WaOpR+
 DdR1MWHckJx/Dq2y8aWuWeZrZfwK6my9umHTHkZ4tCpPPli5dA4tfJUH02h06xNykBc7
 gHxHOke0U2Ofmp5V2TDQPQbuUD+Z77NYxeIL5zmgGGcJ88S11kv4aXT9xHH0p7FakeA7
 N4wzdlq+qmYtqDH+iH6ONfdiSybYgQL4Za+SMwrGzcI81RbSDiGhlW0m6e0xybBk3Oq2
 YBF+7vvDdn9m3opjTEhP7tlhcCV816U8021l4sWdGwR4LMw2SSH4ETeAp6ffUzVowxqy
 APlA==
X-Gm-Message-State: AOAM533KrDGB7WGeHEiiac8HSh85OzLrjSQQodRmFWgCmvKOWf+ge0q4
 zBigQgtJKN7REuzcnvamoqzDmx7RZA0=
X-Google-Smtp-Source: ABdhPJwgOWiqXwdVurK9n1ulxaNLWaTlpW/f3Z8ataomImkr8uEstXmfCBYyt6xHL1nFWibWVLHZOA==
X-Received: by 2002:a1c:1bd8:: with SMTP id
 b207mr30365966wmb.114.1640954854156; 
 Fri, 31 Dec 2021 04:47:34 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id b13sm27405653wrh.32.2021.12.31.04.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 04:47:33 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 31 Dec 2021 13:47:26 +0100
Message-Id: <20211231124728.1692301-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/flare-engine: enable ogg support in
 SDL2-mixer via Tremor
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Flare games use OGG audio file format througt SDL2-mixer.

Without OGG support, flare-engine trigger a lot of errors in its
log and fail to start the game.

ERROR: SoundManager: ItemManager: Loading sound /usr/share/flare/mods/fantasycore/soundfx/inventory/inventory_gem.ogg (soundfx/inventory/inventory_gem.ogg) failed: Unrecognized audio format

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/flare-engine/Config.in       | 1 +
 package/flare-engine/flare-engine.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/flare-engine/Config.in b/package/flare-engine/Config.in
index d08b740af3..9c997c2b9a 100644
--- a/package/flare-engine/Config.in
+++ b/package/flare-engine/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_FLARE_ENGINE
 	select BR2_PACKAGE_SDL2_IMAGE
 	select BR2_PACKAGE_SDL2_MIXER
 	select BR2_PACKAGE_SDL2_TTF
+	select BR2_PACKAGE_TREMOR # for SDL2_mixer ogg support
 	help
 	  Flare (Free Libre Action Roleplaying Engine) is a simple game
 	  engine built to handle a very specific kind of game:
diff --git a/package/flare-engine/flare-engine.mk b/package/flare-engine/flare-engine.mk
index 14d2681fda..d722a42208 100644
--- a/package/flare-engine/flare-engine.mk
+++ b/package/flare-engine/flare-engine.mk
@@ -9,7 +9,7 @@ FLARE_ENGINE_SITE = $(call github,flareteam,flare-engine,v$(FLARE_ENGINE_VERSION
 FLARE_ENGINE_LICENSE = GPL-3.0+
 FLARE_ENGINE_LICENSE_FILES = COPYING
 
-FLARE_ENGINE_DEPENDENCIES += sdl2 sdl2_image sdl2_mixer sdl2_ttf
+FLARE_ENGINE_DEPENDENCIES += sdl2 sdl2_image sdl2_mixer sdl2_ttf tremor
 
 # Don't use /usr/games and /usr/share/games
 FLARE_ENGINE_CONF_OPTS += -DBINDIR=bin -DDATADIR=share/flare
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
