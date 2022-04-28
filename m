Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3BEBC433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 21:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0CC740C5E;
	Thu, 28 Apr 2022 21:40:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T-fG_N00KoKG; Thu, 28 Apr 2022 21:40:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B705140C4E;
	Thu, 28 Apr 2022 21:40:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 934F91BF2E4
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:39:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FDA341C12
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:39:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rxT3I3dsmVOZ for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 21:39:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B84D541BF1
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 21:39:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 92059846EE; Thu, 28 Apr 2022 21:29:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 23:39:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c76fc9d1ccf623a8dad4d845a371bb5936e38d4
X-Git-Newrev: 2449d9c9dd69f5d291997560c4d48cbd5c5b0fe9
X-Patchwork-Hint: ignore
Message-Id: <20220428212928.92059846EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl2_ttf: disable builtin harfbuzz
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2449d9c9dd69f5d291997560c4d48cbd5c5b0fe9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable builtin harfbuzz which is enabled by default since bump to
version 2.0.18 in commit f4da031a77f200515bcc5b2e0fe665a7b4f2a780 and
https://github.com/libsdl-org/SDL_ttf/commit/834ec54127dc9c2a12928f5fe32cf110ec4c7a7f
resulting in the following build failure without threads:

In file included from external/harfbuzz-2.8.0/src/hb.hh:470,
                 from external/harfbuzz-2.8.0/src/hb-aat-layout.cc:28:
external/harfbuzz-2.8.0/src/hb-mutex.hh:53:10: fatal error: pthread.h: No such file or directory
   53 | #include <pthread.h>
      |          ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/ac8b366558bec61ada84ec15cf27652fde2b63b2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sdl2_ttf/sdl2_ttf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sdl2_ttf/sdl2_ttf.mk b/package/sdl2_ttf/sdl2_ttf.mk
index 54e76815f1..054e327fac 100644
--- a/package/sdl2_ttf/sdl2_ttf.mk
+++ b/package/sdl2_ttf/sdl2_ttf.mk
@@ -11,7 +11,7 @@ SDL2_TTF_LICENSE = Zlib
 SDL2_TTF_LICENSE_FILES = COPYING.txt
 SDL2_TTF_INSTALL_STAGING = YES
 SDL2_TTF_DEPENDENCIES = sdl2 freetype host-pkgconf
-SDL2_TTF_CONF_OPTS = --disable-freetype-builtin
+SDL2_TTF_CONF_OPTS = --disable-freetype-builtin --disable-harfbuzz-builtin
 
 ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
 SDL2_TTF_DEPENDENCIES += harfbuzz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
