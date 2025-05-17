Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD6EC3ABDD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60A99710C2;
	Mon, 19 May 2025 11:04:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A-J6IdrPxS0t; Mon, 19 May 2025 11:04:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D74F1710AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D74F1710AE;
	Mon, 19 May 2025 11:04:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 519ECE4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 231AD419E7
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id De8ig2GdXYsE for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E728C41E03
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E728C41E03
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E593583BC0; Mon, 19 May 2025 10:40:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 11:38:14 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4cca0f30f2b263acf97c6d0abd8d31e2417542e2
X-Git-Newrev: adff0d37ba9cd5f3bf6d1b0faa562a1e097a244b
X-Patchwork-Hint: ignore
Message-Id: <20250519104006.E593583BC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qt6/qt6base: fix build
 when xcb support is enabled
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=adff0d37ba9cd5f3bf6d1b0faa562a1e097a244b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
ERROR: Feature "xcb": Forcing to "ON" breaks its condition:
QT_FEATURE_thread AND TARGET XCB::XCB AND TEST_xcb_syslibs AND QT_FEATURE_xkbcommon_x11
Condition values dump:
QT_FEATURE_thread = "ON"
TARGET XCB::XCB found
TEST_xcb_syslibs = "FALSE"
QT_FEATURE_xkbcommon_x11 not evaluated

The xcb feature is defined in [2].

According to [1] XCB::CURSOR is needed for xcb support.

[1] https://code.qt.io/cgit/qt/qtbase.git/tree/src/gui/configure.cmake?h=6.9.0#n522
[2] https://code.qt.io/cgit/qt/qtbase.git/tree/src/gui/configure.cmake?h=6.9.0#n1016

This bug was introduced in e634be8906bd64d6a9de1768204d0f03d8d8357a,
and fixes the build with the following defconfig:

 BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE=y
 BR2_PACKAGE_QT6=y
 BR2_PACKAGE_QT6BASE_GUI=y
 BR2_PACKAGE_QT6BASE_XCB=y
 BR2_PACKAGE_XORG7=y

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/qt6/qt6base/Config.in  | 1 +
 package/qt6/qt6base/qt6base.mk | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 96a0416dbd..7f3948ec27 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -61,6 +61,7 @@ config BR2_PACKAGE_QT6BASE_XCB
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_LIBXCB
+	select BR2_PACKAGE_XCB_UTIL_CURSOR
 	select BR2_PACKAGE_XCB_UTIL_IMAGE
 	select BR2_PACKAGE_XCB_UTIL_KEYSYMS
 	select BR2_PACKAGE_XCB_UTIL_RENDERUTIL
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index a4c56da601..39fb440be7 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -211,6 +211,7 @@ QT6BASE_CONF_OPTS += \
 QT6BASE_DEPENDENCIES += \
 	libxcb \
 	libxkbcommon \
+	xcb-util-cursor \
 	xcb-util-wm \
 	xcb-util-image \
 	xcb-util-keysyms \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
