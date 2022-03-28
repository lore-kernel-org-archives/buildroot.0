Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF428C433EF
	for <buildroot@archiver.kernel.org>; Mon, 28 Mar 2022 20:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C47F81B6D;
	Mon, 28 Mar 2022 20:00:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T0_eIcfFT9bK; Mon, 28 Mar 2022 20:00:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 719AE80CB8;
	Mon, 28 Mar 2022 20:00:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2188B1BF2BA
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6030C81B10
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:58:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 67LoYxTkfmaV for <buildroot@lists.busybox.net>;
 Mon, 28 Mar 2022 19:58:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90E7581B35
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 19:58:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9205085F3F; Mon, 28 Mar 2022 19:48:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 28 Mar 2022 21:49:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: be3f9cde29f1727e264d6a2a023588273410c800
X-Git-Newrev: ba8f35eda65d3623967e35547d6bec38f5ebc66a
X-Patchwork-Hint: ignore
Message-Id: <20220328194854.9205085F3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5base: fix race with libxkbcommon
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

commit: https://git.buildroot.net/buildroot/commit/?id=ba8f35eda65d3623967e35547d6bec38f5ebc66a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qt5wayland package currently has a bug if the xkbcommon Qt config is not
enabled which highlighted a race issues between qt5base, libxkbcommon
and qt5wayland.

qt5wayland has a dependency on libxkbcommon package if it's enabled.
qt5base only has a dependency on libxkbcommon if xcb support is to be
enabled.

If libxkbcommon package is built before qt5base, qt5base will detect it
during its configure step and enable the Qt config accordingly. This
will make it available to qt5wayland afterwards, even if xcb support is
not enabled in Buildroot Kconfig.

However, if qt5base is built before libxkbcommon is, qt5base will not
advertise support of xbcommon feature to qt5wayland (which will fail its
build because of a bug in the source code).

Since the package build order should not impact the outcome of the
build, let's explicit the dependency if and only if libxkbcommon package
is to be compiled at some point in time so that at least this feature is
not susceptible to races.

Move the xkbcommon entries out of the BR2_PACKAGE_QT5BASE_XCB condition,
instead make them depend on BR2_PACKAGE_LIBXKBCOMMON. Since
BR2_PACKAGE_QT5BASE_XCB selects BR2_PACKAGE_LIBXKBCOMMON they are still
included if xcb is selected.

Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
[Arnout: remove the already existing xkbcommon entries]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qt5/qt5base/qt5base.mk | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 972d217ef1..0c811b3ac1 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -174,9 +174,13 @@ QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_LINUXFB),--enable-linuxfb,-
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_DIRECTFB),-directfb,-no-directfb)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_DIRECTFB),directfb)
 
+ifeq ($(BR2_PACKAGE_LIBXKBCOMMON),y)
+QT5BASE_CONFIGURE_OPTS += -xkbcommon
+QT5BASE_DEPENDENCIES   += libxkbcommon
+endif
+
 ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
 QT5BASE_CONFIGURE_OPTS += -xcb
-QT5BASE_CONFIGURE_OPTS += -xkbcommon
 
 QT5BASE_DEPENDENCIES   += \
 	libxcb \
@@ -184,8 +188,7 @@ QT5BASE_DEPENDENCIES   += \
 	xcb-util-image \
 	xcb-util-keysyms \
 	xcb-util-renderutil \
-	xlib_libX11 \
-	libxkbcommon
+	xlib_libX11
 ifeq ($(BR2_PACKAGE_QT5BASE_WIDGETS),y)
 QT5BASE_DEPENDENCIES   += xlib_libXext
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
