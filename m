Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3A1C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 16:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 177EA83530;
	Fri, 16 May 2025 16:01:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id svf7QMgw0mc7; Fri, 16 May 2025 16:01:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BA35835C9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BA35835C9;
	Fri, 16 May 2025 16:01:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0070C185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 16:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5D3F400CE
 for <buildroot@buildroot.org>; Fri, 16 May 2025 16:01:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kHNspiBPyFBX for <buildroot@buildroot.org>;
 Fri, 16 May 2025 16:01:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50F5B400AF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50F5B400AF
 for <buildroot@buildroot.org>; Fri, 16 May 2025 16:01:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C7B186C5F; Fri, 16 May 2025 16:01:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 18:00:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4662553088b81dbf35fa43aaeef098ac2c7f41f9
X-Git-Newrev: 82575b3e52b5ada683a3305a275ed38cdda3a912
X-Patchwork-Hint: ignore
Message-Id: <20250516160132.3C7B186C5F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl2: allow wayland support to be
 enabled without X11
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=82575b3e52b5ada683a3305a275ed38cdda3a912
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 4662553088 ("package/sdl2: add wayland support") added an option to
enable wayland support but accidentally put the .mk logic inside the
BR2_PACKAGE_SDL2_X11, so it would only trigger if the X11 driver was
enabled.

Fix that by moving it outside the conditional.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl2/sdl2.mk | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 9b4a19571c..5ed7c6c612 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -104,13 +104,6 @@ else
 SDL2_CONF_OPTS += --disable-video-x11-xcursor
 endif
 
-ifeq ($(BR2_PACKAGE_SDL2_WAYLAND),y)
-SDL2_DEPENDENCIES += libegl libxkbcommon wayland wayland-protocols
-SDL2_CONF_OPTS += --enable-video-wayland
-else
-SDL2_CONF_OPTS += --disable-video-wayland
-endif
-
 ifeq ($(BR2_PACKAGE_XLIB_LIBXI),y)
 SDL2_DEPENDENCIES += xlib_libXi
 SDL2_CONF_OPTS += --enable-video-x11-xinput
@@ -136,6 +129,13 @@ else
 SDL2_CONF_OPTS += --disable-video-x11 --without-x
 endif
 
+ifeq ($(BR2_PACKAGE_SDL2_WAYLAND),y)
+SDL2_DEPENDENCIES += libegl libxkbcommon wayland wayland-protocols
+SDL2_CONF_OPTS += --enable-video-wayland
+else
+SDL2_CONF_OPTS += --disable-video-wayland
+endif
+
 ifeq ($(BR2_PACKAGE_SDL2_OPENGL),y)
 SDL2_CONF_OPTS += --enable-video-opengl
 SDL2_DEPENDENCIES += libgl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
