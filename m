Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7DFC433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 21:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C2F083486;
	Wed, 16 Feb 2022 21:50:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fypM8I7O9dLK; Wed, 16 Feb 2022 21:50:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B097082612;
	Wed, 16 Feb 2022 21:50:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E3941BF5A9
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C2D3813F7
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:49:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XZMoVLyx9G7H for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 21:49:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18A408142C
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 21:49:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4627583776; Wed, 16 Feb 2022 21:41:35 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 22:38:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 81636b1ea14a423eac3145413dcf7200a8f1edd7
X-Git-Newrev: e253e41ce2e50d3af689a40b4dd0f5c615985787
X-Patchwork-Hint: ignore
Message-Id: <20220216214135.4627583776@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl2_ttf: add harfbuzz optional
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=e253e41ce2e50d3af689a40b4dd0f5c615985787
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

harfbuzz is an optional dependency (which is enabled by default) since
version 2.0.18 and
https://github.com/libsdl-org/SDL_ttf/commit/328bbed78db496ff36720e8a809661ffb236e673

If harfbuzz is not disabled and not found, builtin harfbuzz is enabled
resulting in the following build failure without C++ since commit
f4da031a77f200515bcc5b2e0fe665a7b4f2a780 and
https://github.com/libsdl-org/SDL_ttf/commit/9a7ef3fb640a1f086d9b02954c3b4bbfb3578871:

configure: error: *** A compiler with support for C++11 language features is required.

Fixes:
 - http://autobuild.buildroot.org/results/3fecb96a8063b1a28703682e9373714c1c9cfa24

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/sdl2_ttf/sdl2_ttf.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/sdl2_ttf/sdl2_ttf.mk b/package/sdl2_ttf/sdl2_ttf.mk
index e9397d8505..54e76815f1 100644
--- a/package/sdl2_ttf/sdl2_ttf.mk
+++ b/package/sdl2_ttf/sdl2_ttf.mk
@@ -13,6 +13,13 @@ SDL2_TTF_INSTALL_STAGING = YES
 SDL2_TTF_DEPENDENCIES = sdl2 freetype host-pkgconf
 SDL2_TTF_CONF_OPTS = --disable-freetype-builtin
 
+ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
+SDL2_TTF_DEPENDENCIES += harfbuzz
+SDL2_TTF_CONF_OPTS += --enable-harfbuzz
+else
+SDL2_TTF_CONF_OPTS += --disable-harfbuzz
+endif
+
 # x-includes and x-libraries must be set for cross-compiling
 # By default x_includes and x_libraries contains unsafe paths.
 # (/usr/include and /usr/lib)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
