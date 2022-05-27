Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE64C433EF
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 19:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68AB483E37;
	Fri, 27 May 2022 19:11:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KgvKpLsT7bf1; Fri, 27 May 2022 19:11:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A75082FB1;
	Fri, 27 May 2022 19:11:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EA31D1BF296
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 19:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9A5B82FB1
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 19:11:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7FdnWgqXKprs for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 19:11:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C46A82F87
 for <buildroot@buildroot.org>; Fri, 27 May 2022 19:11:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4DCD7866BD; Fri, 27 May 2022 19:00:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 20:53:40 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 0c0d2be13c8a7849b3077250f527168cb57152f1
X-Git-Newrev: 30fe3922815ee46d78b9cdec2f5fe6befadb94aa
X-Patchwork-Hint: ignore
Message-Id: <20220527190009.4DCD7866BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/sdl2_ttf: disable
 builtin harfbuzz
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

commit: https://git.buildroot.net/buildroot/commit/?id=30fe3922815ee46d78b9cdec2f5fe6befadb94aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit 2449d9c9dd69f5d291997560c4d48cbd5c5b0fe9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
