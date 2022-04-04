Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E366BC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 12:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 874E182965;
	Mon,  4 Apr 2022 12:31:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WBu0KIZcjJar; Mon,  4 Apr 2022 12:31:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E8D882919;
	Mon,  4 Apr 2022 12:31:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C23151BF9AD
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 12:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B14E782919
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 12:30:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c9tlSjdOn5cC for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 12:30:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E509E82909
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 12:30:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E2CDE86161; Mon,  4 Apr 2022 12:21:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 14:26:59 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 99cf9381a0f114994dd068e084108d1d5335a8fe
X-Git-Newrev: b27f378ff71380b0dbcbfa5f90764e7c9ae4ccc6
X-Patchwork-Hint: ignore
Message-Id: <20220404122121.E2CDE86161@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/qt5base: fix race
 with libxkbcommon
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

commit: https://git.buildroot.net/buildroot/commit/?id=b27f378ff71380b0dbcbfa5f90764e7c9ae4ccc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit ba8f35eda65d3623967e35547d6bec38f5ebc66a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5base/qt5base.mk | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 14b58ba384..f880f806cc 100644
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
