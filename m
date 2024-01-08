Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553DBC3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 10:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC69E60D70;
	Mon,  8 Jan 2024 10:56:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC69E60D70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QGnHF8Yacghz; Mon,  8 Jan 2024 10:56:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D35C60ED0;
	Mon,  8 Jan 2024 10:56:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D35C60ED0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 551241BF31D
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 10:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D9A040967
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 10:56:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D9A040967
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r35o8PBk3Cd2 for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 10:56:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43406408FD
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 10:56:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43406408FD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 20D0184B74; Mon,  8 Jan 2024 10:56:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Jan 2024 11:54:25 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: bbde80325228158bfff8b2ccaafb4bdcc3668383
X-Git-Newrev: a3d291e8f6ad2b970a81c1b8a7e7f25a69ffc229
X-Patchwork-Hint: ignore
Message-Id: <20240108105648.20D0184B74@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/wlroots: add
 hwdata and hwdata_pnp_ids as a dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=a3d291e8f6ad2b970a81c1b8a7e7f25a69ffc229
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Since upstream commit
eec95e3d5e1a4f2e13b1f6b34cc287475ca57daf ("backend/drm: use pnp.ids to
fetch EDID data"), the pnp.ids file from hwdata is parsed at build
time to generate a C source file. As per backend/drm/meson.build:

hwdata = dependency('hwdata', required: false, native: true)
if hwdata.found()
	hwdata_dir = hwdata.get_variable(pkgconfig: 'pkgdatadir')
	pnp_ids = files(hwdata_dir / 'pnp.ids')
else
	pnp_ids = files('/usr/share/hwdata/pnp.ids')
endif

This is only needed when the DRM backend of wlroots is enabled, but
currently, Buildroot enables this backend unconditionally.

This failure can be reproduced using the following defconfig:

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_OSMESA_GALLIUM=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_WLROOTS=y

The issue was not caught in the autobuilders because the last
successful build of a configuration that includes wlroots dates back
from 2022-05-05, at which time Buildroot had wlroots 0.15.1.

This change in wlroots was introduced in wlroots 0.16.0, which means
that it's only since Buildroot bumped from 0.15.1 to 0.16.2 in
d6279bc82c02b43c9a2f28c36639e092b9e9e08b ("package/wlroots: bump to
version 0.16.2") that the issue occurs. This commit is not yet in any
tagged release, so there is no need to backport this fix.

It should be noted that the proposed patch also installs pnp.ids to
the target filesystem, while it is in practice not needed at runtime
by wlroots. However, our current hwdata packaging doesn't allow
installing it only in staging, and since wlroots anyway implies we're
building a fairly heavy graphics stack, the size overhead of hwdata is
deemed to be an acceptable trade-off.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[Thomas: further extend the commit log, with details gathered by Yann
and myself.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 50eed2060ae6a35be257a8773b8e217a623eb29e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wlroots/Config.in  | 2 ++
 package/wlroots/wlroots.mk | 1 +
 2 files changed, 3 insertions(+)

diff --git a/package/wlroots/Config.in b/package/wlroots/Config.in
index fb23e9069c..7622a3033b 100644
--- a/package/wlroots/Config.in
+++ b/package/wlroots/Config.in
@@ -16,6 +16,8 @@ config BR2_PACKAGE_WLROOTS
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
 	depends on BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_HWDATA
+	select BR2_PACKAGE_HWDATA_PNP_IDS
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBINPUT
 	select BR2_PACKAGE_LIBXKBCOMMON
diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index b478e57abb..bb5c8f497d 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -13,6 +13,7 @@ WLROOTS_INSTALL_STAGING = YES
 WLROOTS_DEPENDENCIES = \
 	host-pkgconf \
 	host-wayland \
+	hwdata \
 	libinput \
 	libxkbcommon \
 	libegl \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
