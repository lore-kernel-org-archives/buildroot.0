Return-Path: <SRS0=uTOM=OH=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ABF1C433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Sep 2021 21:28:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11601611C8
	for <buildroot@archiver.kernel.org>; Fri, 17 Sep 2021 21:28:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 11601611C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91E1261C03;
	Fri, 17 Sep 2021 21:28:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ksS5rIrOxNf0; Fri, 17 Sep 2021 21:28:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA45E6077E;
	Fri, 17 Sep 2021 21:28:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EAAF41BF868
 for <buildroot@lists.busybox.net>; Fri, 17 Sep 2021 21:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D86A7407D9
 for <buildroot@lists.busybox.net>; Fri, 17 Sep 2021 21:28:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zpyuyllcmTDR for <buildroot@lists.busybox.net>;
 Fri, 17 Sep 2021 21:28:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9858407D7
 for <buildroot@buildroot.org>; Fri, 17 Sep 2021 21:28:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 23F928B533; Fri, 17 Sep 2021 21:26:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 17 Sep 2021 23:27:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7f303516f69a143c2ecc317948ec1934a195235c
X-Git-Newrev: b80c488d04940cf1280657cf294d58d0022f222f
X-Patchwork-Hint: ignore
Message-Id: <20210917212626.23F928B533@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi: fix selection of dependencies
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b80c488d04940cf1280657cf294d58d0022f222f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 package/kodi/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 074a457d1b..af7604428e 100644
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
