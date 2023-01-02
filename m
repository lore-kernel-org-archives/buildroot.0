Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DFCC3DA7A
	for <buildroot@archiver.kernel.org>; Mon,  2 Jan 2023 15:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 294DA40895;
	Mon,  2 Jan 2023 15:46:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 294DA40895
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ReJMow7AnkV0; Mon,  2 Jan 2023 15:46:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54F52408BC;
	Mon,  2 Jan 2023 15:46:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54F52408BC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 19B1D1BF2F1
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 15:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA2E34070F
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 15:45:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA2E34070F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x8W7iblPjAI8 for <buildroot@lists.busybox.net>;
 Mon,  2 Jan 2023 15:45:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDF9640289
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CDF9640289
 for <buildroot@buildroot.org>; Mon,  2 Jan 2023 15:45:58 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id d17so6867517wrs.2
 for <buildroot@buildroot.org>; Mon, 02 Jan 2023 07:45:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3mMApBdwkJEqUYZeE/Ve2v6yKN1D0Xzky7iT0lbn/T8=;
 b=usauOarjngHn/mznBjTEPnPvW+acwgGaZQu2CcRg2fe1qs09f0Lbu0PypZCPw8L4s7
 35G4Rih7JVAotXuTJAyzJHmyutEgdnhaKErsUPJU91YaFHfX4YNTjx9qdtP7ECCkrIFg
 QwMRlSD/jc6Kiuv/OBg7KSyBLuNGvrojhvDgiY91l06XbBiwtifQStySpBWDPA52ptxy
 vGjGcVqxYnCqAtlYoe6vd1TyJ2zPnZY16mnUeuwF1NcqpDetgboG3Mnm5szupuu0SUCV
 AibCn4+nLbOYW5HLOnKzTE5ByalhaDsjXZd10XkkP724yz/QwqtnRuWp014E0fvlL42e
 v2pQ==
X-Gm-Message-State: AFqh2koxFVQWBI+LPF9ecHL+e1v7iCnN0ngYLdLTjigiBcOyjszqF/mx
 ptT6Ra6Er6IAIwpxYPhtMYfS2OuRUeA=
X-Google-Smtp-Source: AMrXdXuAAfWWFsHHwzvy3WhcmRsOR4QOW40OYC5pFCL4fhGg17WfHwl6C077Rbs+XVBkXuqMHAzCVg==
X-Received: by 2002:a5d:51c7:0:b0:29d:7fe4:b70e with SMTP id
 n7-20020a5d51c7000000b0029d7fe4b70emr727630wrv.7.1672674356943; 
 Mon, 02 Jan 2023 07:45:56 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a1800a2cec8fffeea5f12.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:a2ce:c8ff:feea:5f12])
 by smtp.gmail.com with ESMTPSA id
 f8-20020adff8c8000000b00282194eaf7bsm18844796wrq.71.2023.01.02.07.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 07:45:56 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 Jan 2023 16:45:50 +0100
Message-Id: <20230102154550.78227-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230102154550.78227-1-romain.naour@gmail.com>
References: <20230102154550.78227-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3mMApBdwkJEqUYZeE/Ve2v6yKN1D0Xzky7iT0lbn/T8=;
 b=ZncqC6B3OIbvCH/FGN6LpiKqWB4c1zWwOWdbSCbIMDxmCqJsUyDc7DI9AHV1Wxu+2A
 jaKRAbhbm0Z7e6hdWj+HPtwr7gAV9/Oxzvqr0lUEGpK1jdq/TWPyUdFYgU60GcqC0G4f
 DGe0cpJdTiOq9PEzylXUfiRP63FVjICPyzIWnNri4P51MUXNtV39vsFdBRrtuEyEnqHK
 s5D56JuYMedO8KnhEpDsJlkx5PFaRDZM1OZjmoAVv7yW66k0O5RtASX7S/ryvgIGZy1Y
 R3iS37s5K3s3yiJBi33OZ7VKcs8pfoFDJeO4cNb3+qsJ+xrBkXd/rmj9kkqs8KZ7Nhqs
 QnYQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZncqC6B3
Subject: [Buildroot] [PATCH] flare-{engine,game}: bump to version 1.14
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

See:
https://flarerpg.org/2022/01/31/flare-1-13/
https://flarerpg.org/2022/12/10/flare-1-14/

While at it, change url to use https.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/flare-engine/Config.in         | 2 +-
 package/flare-engine/flare-engine.hash | 2 +-
 package/flare-engine/flare-engine.mk   | 2 +-
 package/flare-game/Config.in           | 2 +-
 package/flare-game/flare-game.hash     | 2 +-
 package/flare-game/flare-game.mk       | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/flare-engine/Config.in b/package/flare-engine/Config.in
index 9c997c2b9a..136cae707e 100644
--- a/package/flare-engine/Config.in
+++ b/package/flare-engine/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_FLARE_ENGINE
 	  Flare is not a reimplementation of an existing game or engine.
 	  It is a tribute to and exploration of the action RPG genre.
 
-	  http://flarerpg.org
+	  https://flarerpg.org
 
 comment "flare-engine needs a toolchain w/ C++, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
diff --git a/package/flare-engine/flare-engine.hash b/package/flare-engine/flare-engine.hash
index 7f6169381c..2e1f87b237 100644
--- a/package/flare-engine/flare-engine.hash
+++ b/package/flare-engine/flare-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  287a08532972fa3ac56ce7cb213d21be8be35b529339f61d4eeadbd501c78a8e  flare-engine-1.12.tar.gz
+sha256  2c1bafeaa5ac26c10449bfcb7151b06e8a22547aa7364d2a39bbcb135aa50a09  flare-engine-1.14.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/flare-engine/flare-engine.mk b/package/flare-engine/flare-engine.mk
index cbb7add4bb..e5fa947272 100644
--- a/package/flare-engine/flare-engine.mk
+++ b/package/flare-engine/flare-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLARE_ENGINE_VERSION = 1.12
+FLARE_ENGINE_VERSION = 1.14
 FLARE_ENGINE_SITE = $(call github,flareteam,flare-engine,v$(FLARE_ENGINE_VERSION))
 FLARE_ENGINE_LICENSE = GPL-3.0+
 FLARE_ENGINE_LICENSE_FILES = COPYING
diff --git a/package/flare-game/Config.in b/package/flare-game/Config.in
index ca68d19a69..535a9b18a2 100644
--- a/package/flare-game/Config.in
+++ b/package/flare-game/Config.in
@@ -10,4 +10,4 @@ config BR2_PACKAGE_FLARE_GAME
 	  game engine itself is part of a separate package,
 	  flame-engine.
 
-	  http://flarerpg.org
+	  https://flarerpg.org
diff --git a/package/flare-game/flare-game.hash b/package/flare-game/flare-game.hash
index 3d6d678c94..9ae88c6daa 100644
--- a/package/flare-game/flare-game.hash
+++ b/package/flare-game/flare-game.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  19a909f2c6e0868baae823bb491e8840d5fb3e0454f00201de8da119772e5160  flare-game-1.12.tar.gz
+sha256  65758462070aa88842084f8ee69083d8226e93cfbf83481663276d8307494b8e  flare-game-1.14.tar.gz
 sha256  3f941b3b89cf7b8370ceb83cc76d2120d471b58735d8ca60238a751a48d7f72f  LICENSE.txt
diff --git a/package/flare-game/flare-game.mk b/package/flare-game/flare-game.mk
index 41f02bec93..a1a0a5944a 100644
--- a/package/flare-game/flare-game.mk
+++ b/package/flare-game/flare-game.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLARE_GAME_VERSION = 1.12
+FLARE_GAME_VERSION = 1.14
 FLARE_GAME_SITE = $(call github,flareteam,flare-game,v$(FLARE_GAME_VERSION))
 FLARE_GAME_LICENSE = CC-BY-SA-3.0 (data files), GPL-2.0 (GNU Unifont), \
 	OFL-1.1 (Liberation Sans)
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
