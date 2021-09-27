Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2792EC433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:26:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C15CD60F3A
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C15CD60F3A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BB166068C;
	Mon, 27 Sep 2021 19:26:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FwQtTEANNMuz; Mon, 27 Sep 2021 19:26:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEAB460611;
	Mon, 27 Sep 2021 19:26:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 78B541BF379
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67B5160611
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:26:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TWKOLQPFRCOP for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 19:26:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82B0B605DA
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 19:26:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C5C678D362; Mon, 27 Sep 2021 19:23:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 21:24:48 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 21a5bc35f119215b89be2b9a30e381209b27c66d
X-Git-Newrev: dc201ed3238b0ba16cbd7d7958f2f82c76e89700
X-Patchwork-Hint: ignore
Message-Id: <20210927192345.C5C678D362@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/kodi: fix
 selection of dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=dc201ed3238b0ba16cbd7d7958f2f82c76e89700
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Commit 148e695e3756 (package/kodi: bump version to 19.0-Matrix) extended
the set of required libraries for various "platform" backends, by
selecting those libraries from the blind options. For example, we have:

    config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM
        bool
        default y
        depends on [...]
        select BR2_PACKAGE_LIBINPUT
        [...]

However, that option is true as soon as the requirements are met (the
depends on), even when Kodi itself is not enabled.

This means that extra libraries are pulled in to the build, even when
not required.

We fix that by moving the actual selects to the main symbol, along with
the proper conditions. This means that we have two lines that select
libxbcommon, under two different conditions; we could make that a single
select, but the codition would need to be on two lines anyway, so meh...

This is not an ideal solution, because it is a bit ugly, but:
 1) adding three new blind options just for the select is kinda extreme
    and superfluous;
 2) our Kodi packaging is already a bit ugly anyway.

Fixes: #14206

Reported-by: Thomas Ruschival <t.ruschival@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
(cherry picked from commit b80c488d04940cf1280657cf294d58d0022f222f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index f4cfc6380c..ea8b5c6dc5 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -25,8 +25,6 @@ config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM
 	depends on BR2_PACKAGE_MESA3D_GBM
 	depends on BR2_PACKAGE_HAS_UDEV # libinput
 	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
-	select BR2_PACKAGE_LIBINPUT
-	select BR2_PACKAGE_LIBXKBCOMMON
 
 config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND
 	bool
@@ -38,8 +36,6 @@ config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND
 	depends on BR2_INSTALL_LIBSTDCPP # waylandpp
 	depends on BR2_PACKAGE_WAYLAND # waylandpp
 	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
-	select BR2_PACKAGE_LIBXKBCOMMON
-	select BR2_PACKAGE_WAYLANDPP
 
 config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11
 	bool
@@ -47,7 +43,6 @@ config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11
 	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
-	select BR2_PACKAGE_XLIB_LIBXRANDR
 
 comment "kodi needs an OpenGL EGL backend with OpenGL or GLES support"
 	depends on !BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
@@ -102,6 +97,11 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_TINYXML
 	select BR2_PACKAGE_ZLIB
 	select BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY if BR2_TOOLCHAIN_USES_GLIBC # runtime UTF conversion support
+	select BR2_PACKAGE_LIBINPUT if BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM
+	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM
+	select BR2_PACKAGE_LIBXKBCOMMON if BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND
+	select BR2_PACKAGE_WAYLANDPP if BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND
+	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11
 	help
 	  Kodi is an award-winning free and open source (GPL) software
 	  media player and entertainment hub for digital media.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
