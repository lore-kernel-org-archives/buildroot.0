Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2714DC433F5
	for <buildroot@archiver.kernel.org>; Fri, 31 Dec 2021 12:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9C5B60D56;
	Fri, 31 Dec 2021 12:48:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6LA1zY5RB2tJ; Fri, 31 Dec 2021 12:48:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3069560C2D;
	Fri, 31 Dec 2021 12:48:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA5D31BF2F3
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 12:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9D7540293
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 12:47:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DDvyQ5gp_ZMl for <buildroot@lists.busybox.net>;
 Fri, 31 Dec 2021 12:47:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C97E94027E
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 12:47:37 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 d198-20020a1c1dcf000000b0034569cdd2a2so14693455wmd.5
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 04:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VBNZnnhgQgEzj2lLpue0o9eEApQIdQ7RM8EnK/TyPf8=;
 b=ZGbTP/ayzQUozyRUTf82gUGeF5WipS8rp6phYy9R3Xag3ksDV4J6N4LcK1V+WFOuF0
 r8zq1wYx2MZUXEraRRHBjedO0R8eevY72yYsMxCiTdXKq56hxljLijnko6GWyWdzKrrs
 3WR62scha71Fu+nqNoAD8ub6CLTb3mHl6b1satevIGHzDJIqUYjpB2GUIGqTmQeVUe25
 5MUKIzqSIjE+UYzdWufN/CfDethk1xJfdkG6bu+/UPM83lwJxjI825lWQNYBhDHQ3x05
 txLVuQDz3M0AIvP84O68zPm3rtpb0e3Ve9FusJ0A7UcnRReyqyAN443/umiCIMKjnIC9
 C1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VBNZnnhgQgEzj2lLpue0o9eEApQIdQ7RM8EnK/TyPf8=;
 b=1dEVoAI1ML4WqtScYy3tbeTcWkmGu9dgxn/rTEoCPQ0ovqD7lEvi1FSPP+nNKLqJDQ
 wF3m9GcPOIAIqvY/qz6SuoXOWdyuGI83WM7Wjyu8xpQTaLjH+q8jz/FA/8pngvBnRiCP
 HZFuX3Urcn6CPxBIhy1yYl2/kkM50N9H4bHnGzOICQkPBLPQKIWW/SDBC4xFRYWcrfq5
 dp8Nux18QR2WWqN55QgOTssIvEEtQW/5DikF2J3I/qc/jGyx8K5rjenuqnThJl0BuFg9
 EcND+Yf8gZ44e3nfH+RTVhzFda4YiWT6BWMg475teDZsbFynzyfUKBJERdHgU2Wyjvco
 Qdqw==
X-Gm-Message-State: AOAM531m1Y54DICY8aFY76eF9oWBIFwdKIE69FGPGqyDSFupvJS3ydy0
 Yn8EG9Om6HruVFNgFakfav56el23QFY=
X-Google-Smtp-Source: ABdhPJwQL9pJFOox7QxtW18JnxRPOnpaE9yiirueMWDncYfFHFY8MAChRNzwnzf3uCRpSYBuOl+vdw==
X-Received: by 2002:a05:600c:4104:: with SMTP id
 j4mr29966966wmi.52.1640954855955; 
 Fri, 31 Dec 2021 04:47:35 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id b13sm27405653wrh.32.2021.12.31.04.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 04:47:35 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 31 Dec 2021 13:47:28 +0100
Message-Id: <20211231124728.1692301-3-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211231124728.1692301-1-romain.naour@gmail.com>
References: <20211231124728.1692301-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] flare-{engine,game}: bump to version 1.12
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
https://flarerpg.org/2021/08/02/flare-1-12/

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/flare-engine/flare-engine.hash | 2 +-
 package/flare-engine/flare-engine.mk   | 2 +-
 package/flare-game/flare-game.hash     | 2 +-
 package/flare-game/flare-game.mk       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/flare-engine/flare-engine.hash b/package/flare-engine/flare-engine.hash
index 0e37a71922..7f6169381c 100644
--- a/package/flare-engine/flare-engine.hash
+++ b/package/flare-engine/flare-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  035ffd936d9e120dc2eb792779a0b7ff64574d4a29a1124946deaf7946d1059d  flare-engine-1.11.tar.gz
+sha256  287a08532972fa3ac56ce7cb213d21be8be35b529339f61d4eeadbd501c78a8e  flare-engine-1.12.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/flare-engine/flare-engine.mk b/package/flare-engine/flare-engine.mk
index d722a42208..cbb7add4bb 100644
--- a/package/flare-engine/flare-engine.mk
+++ b/package/flare-engine/flare-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLARE_ENGINE_VERSION = 1.11
+FLARE_ENGINE_VERSION = 1.12
 FLARE_ENGINE_SITE = $(call github,flareteam,flare-engine,v$(FLARE_ENGINE_VERSION))
 FLARE_ENGINE_LICENSE = GPL-3.0+
 FLARE_ENGINE_LICENSE_FILES = COPYING
diff --git a/package/flare-game/flare-game.hash b/package/flare-game/flare-game.hash
index 983c23200f..3d6d678c94 100644
--- a/package/flare-game/flare-game.hash
+++ b/package/flare-game/flare-game.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c13231c7dd021252487f6cf117f7f2bb24bbda40af0a2b2902d72b5e2d4c242a  flare-game-1.11.tar.gz
+sha256  19a909f2c6e0868baae823bb491e8840d5fb3e0454f00201de8da119772e5160  flare-game-1.12.tar.gz
 sha256  3f941b3b89cf7b8370ceb83cc76d2120d471b58735d8ca60238a751a48d7f72f  LICENSE.txt
diff --git a/package/flare-game/flare-game.mk b/package/flare-game/flare-game.mk
index 2845dc9714..41f02bec93 100644
--- a/package/flare-game/flare-game.mk
+++ b/package/flare-game/flare-game.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLARE_GAME_VERSION = 1.11
+FLARE_GAME_VERSION = 1.12
 FLARE_GAME_SITE = $(call github,flareteam,flare-game,v$(FLARE_GAME_VERSION))
 FLARE_GAME_LICENSE = CC-BY-SA-3.0 (data files), GPL-2.0 (GNU Unifont), \
 	OFL-1.1 (Liberation Sans)
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
