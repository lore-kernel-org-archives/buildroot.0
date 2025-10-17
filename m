Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9137DCCD199
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 20:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AB0760F65;
	Fri, 17 Oct 2025 20:44:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id obvPLAmummyY; Fri, 17 Oct 2025 20:44:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AB8461295
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AB8461295;
	Fri, 17 Oct 2025 20:44:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C041443F
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 20:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A65DE612D1
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 20:43:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ko9N0Fx2HzsC for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 20:43:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C4DE61295
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C4DE61295
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 20:43:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8AC888741F; Fri, 17 Oct 2025 20:43:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Oct 2025 22:40:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e089a1c048148d83f060f042c7d2ecaa3a03f998
X-Git-Newrev: 49f54c4a9f14ac48c766cb41a25e6c568b2e436e
X-Patchwork-Hint: ignore
Message-Id: <20251017204357.8AC888741F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/weston: fix DRM backend build with
 libdisplay-info 0.3.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=49f54c4a9f14ac48c766cb41a25e6c568b2e436e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Weston 14.0.2 has a "< 0.3.0" version constraint for the
libdisplay-info dependency. Upstream has relaxed the dependency,
explicitly stating "There are no breaking changes for the high-level
API that Weston uses" [1], but there is no release with the change
yet.

The change had to be backported due to restructuring on upstream
"main" since, where libdisplay-info has become a dependency of Weston
in general, not just the DRM backend.

[1] https://gitlab.freedesktop.org/wayland/weston/-/commit/683eabb61ec43a270f2e3ed67c63bbe3754b1214

Fixes: 1a66cdf7b34328d2b2065bfd22f190c92318e499

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-build-Allow-libdisplay-info-0.3.0.patch   | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/weston/0001-build-Allow-libdisplay-info-0.3.0.patch b/package/weston/0001-build-Allow-libdisplay-info-0.3.0.patch
new file mode 100644
index 0000000000..d97d1a9bf4
--- /dev/null
+++ b/package/weston/0001-build-Allow-libdisplay-info-0.3.0.patch
@@ -0,0 +1,37 @@
+From 83b49400c1dfb72e3019267fd03f165d0bffec76 Mon Sep 17 00:00:00 2001
+From: Fiona Klute <fiona.klute@gmx.de>
+Date: Mon, 6 Oct 2025 15:20:26 +0200
+Subject: [PATCH] build: Allow libdisplay-info 0.3.0
+
+This is a backport of the change in upstream commit
+683eabb61ec43a270f2e3ed67c63bbe3754b1214 "build: Allow libdisplay-info 0.3.0"
+[1], applying the loosened version limit to the DRM backend only. The dependency
+definition was moved to the top level meson.build in [2], and the lower bound
+increased in [3].
+
+[1] https://gitlab.freedesktop.org/wayland/weston/-/commit/683eabb61ec43a270f2e3ed67c63bbe3754b1214
+[2] https://gitlab.freedesktop.org/wayland/weston/-/commit/76e659f45edd23a8b1b253a93316ec73c709bc71
+[3] https://gitlab.freedesktop.org/wayland/weston/-/commit/82c5b386d860a479ed5a157f4dde58ffe202b948
+
+Upstream: https://gitlab.freedesktop.org/wayland/weston/-/commit/683eabb61ec43a270f2e3ed67c63bbe3754b1214 (backported)
+Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
+---
+ libweston/backend-drm/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libweston/backend-drm/meson.build b/libweston/backend-drm/meson.build
+index 002669e6..a8f2ea59 100644
+--- a/libweston/backend-drm/meson.build
++++ b/libweston/backend-drm/meson.build
+@@ -4,7 +4,7 @@ endif
+ 
+ dep_libdisplay_info = dependency(
+ 	'libdisplay-info',
+-	version: ['>= 0.1.1', '< 0.3.0'],
++	version: ['>= 0.1.1', '< 0.4.0'],
+ 	fallback: ['display-info', 'di_dep'],
+ 	default_options: [
+ 		'werror=false',
+-- 
+2.51.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
