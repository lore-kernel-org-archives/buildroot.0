Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EC5C433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 08:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57F8740589;
	Sat,  1 Jan 2022 08:38:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y3wnQhaq9XLn; Sat,  1 Jan 2022 08:38:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 648AE40339;
	Sat,  1 Jan 2022 08:38:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3C4751BF957
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 08:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28D0A40339
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 08:37:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CeZmySpJwQWW for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 08:37:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 215E7400C7
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 08:37:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 2550282DA3; Sat,  1 Jan 2022 08:31:53 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Jan 2022 09:35:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9849fa0101c151a2977507cfb8ecdcae68af89a1
X-Git-Newrev: 1f66c3557a391a00a7527e2b2e8fddd83f0ba0aa
X-Patchwork-Hint: ignore
Message-Id: <20220101083153.2550282DA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flare-engine: enable ogg support
 in SDL2-mixer via Tremor
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1f66c3557a391a00a7527e2b2e8fddd83f0ba0aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Flare games use OGG audio file format througt SDL2-mixer.

Without OGG support, flare-engine trigger a lot of errors in its
log and fail to start the game.

ERROR: SoundManager: ItemManager: Loading sound /usr/share/flare/mods/fantasycore/soundfx/inventory/inventory_gem.ogg (soundfx/inventory/inventory_gem.ogg) failed: Unrecognized audio format

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
