Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC858C5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 17:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DA1C83BC2;
	Sat, 31 May 2025 17:06:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MbikQNX0LXD2; Sat, 31 May 2025 17:06:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C45683BEB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C45683BEB;
	Sat, 31 May 2025 17:06:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DADE236
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 04755606C0
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:06:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E0Z-2mtEIZup for <buildroot@buildroot.org>;
 Sat, 31 May 2025 17:06:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C6DB60729
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C6DB60729
 for <buildroot@buildroot.org>; Sat, 31 May 2025 17:06:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D04D87804; Sat, 31 May 2025 17:06:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 May 2025 17:50:07 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8ef468eea0be22428bfa22f5d48e078d0dda2bbd
X-Git-Newrev: 65ca143c5ca0f96445e94f885767841db3aac30a
X-Patchwork-Hint: ignore
Message-Id: <20250531170619.2D04D87804@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/qt6/qt6multimedia: fix ffmpeg plugin build for x11
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=65ca143c5ca0f96445e94f885767841db3aac30a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The following defconfig:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE=y
BR2_PACKAGE_QT6=y
BR2_PACKAGE_QT6BASE_XCB=y
BR2_PACKAGE_QT6MULTIMEDIA=y
BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG=y
BR2_PACKAGE_XORG7=y

would fail to build, due to <X11/extensions/Xext.h> being not found,
and then <X11/extensions/Xrandr.h> being not found. Fix that up by
introducing the necessary dependencies.

There are no build failures reported for qt6multimedia in the
autobuilders, so there is no reference to a build failure.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 04d1ee01054d21d138031dfd12eca49486360e26)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/qt6/qt6multimedia/Config.in        | 5 +++++
 package/qt6/qt6multimedia/qt6multimedia.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/qt6/qt6multimedia/Config.in b/package/qt6/qt6multimedia/Config.in
index ae555f98ea..3107caa597 100644
--- a/package/qt6/qt6multimedia/Config.in
+++ b/package/qt6/qt6multimedia/Config.in
@@ -38,6 +38,11 @@ config BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE
 	select BR2_PACKAGE_QT6BASE_CONCURRENT
 	select BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO
+	# libxext/libxrandr are needed for ffmpeg plugin to build with
+	# X11 support:
+	# https://code.qt.io/cgit/qt/qtmultimedia.git/tree/src/plugins/multimedia/ffmpeg/CMakeLists.txt?h=6.8.1#n198
+	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_XORG7
 	help
 	  This option enables ffmpeg media backend.
 
diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk b/package/qt6/qt6multimedia/qt6multimedia.mk
index 98ab2ec4be..c2a9d250cf 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.mk
+++ b/package/qt6/qt6multimedia/qt6multimedia.mk
@@ -66,6 +66,12 @@ endif
 ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG),y)
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_ffmpeg=ON
 QT6MULTIMEDIA_DEPENDENCIES += ffmpeg
+# libxext/libxrandr are needed for ffmpeg plugin to build with X11
+# support:
+# https://code.qt.io/cgit/qt/qtmultimedia.git/tree/src/plugins/multimedia/ffmpeg/CMakeLists.txt?h=6.8.1#n198
+ifeq ($(BR2_PACKAGE_XORG7),y)
+QT6MULTIMEDIA_DEPENDENCIES += xlib_libXext xlib_libXrandr
+endif
 else
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_ffmpeg=OFF
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
