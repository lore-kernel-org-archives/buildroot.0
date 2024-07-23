Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F10C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 20:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E6C781379;
	Tue, 23 Jul 2024 20:23:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_-g4y0nTjFQ; Tue, 23 Jul 2024 20:23:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78A6F80B7F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78A6F80B7F;
	Tue, 23 Jul 2024 20:23:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 234081BF27E
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 20:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F09440319
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 20:23:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s-5viDvuxevu for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 20:23:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2D69400F6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2D69400F6
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 20:23:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9900F87555; Tue, 23 Jul 2024 20:23:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 22:22:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 482a27a7be85e17f689b77d5d21e55cacbfd06fa
X-Git-Newrev: 2f7f3d00fa40381b5898cc5228dde37c7d70a136
X-Patchwork-Hint: ignore
Message-Id: <20240723202335.9900F87555@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcamera-apps: bump to version
 1.5.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2f7f3d00fa40381b5898cc5228dde37c7d70a136
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Use official tarball
- Switch to meson-package
- libcamera-apps unconditionally uses linux/dma-heap.h since version
  1.3.0 and
  https://github.com/raspberrypi/rpicam-apps/commit/11338687635cc5564c348c2f60c8c58c5779151d
  which is only available since kernel >= 5.5 and
  https://github.com/torvalds/linux/commit/a69b0e855d3fd278ff6f09a23e1edf929538e304
- This bump will fix the following build failure raised since bump of
  libcamera to version 0.3.0 in commit
  82efc2faa923e8881748738963be1fbe3cb2bb45:

/workdir/instance-1/output-1/build/libcamera-apps-1.2.1/core/libcamera_app.cpp: In member function 'void LibcameraApp::ConfigureViewfinder()':
/workdir/instance-1/output-1/build/libcamera-apps-1.2.1/core/libcamera_app.cpp:327:25: error: 'class libcamera::CameraConfiguration' has no member named 'transform'
  327 |         configuration_->transform = options_->transform;
      |                         ^~~~~~~~~

It shall be noted that upstream changed its name from libcamera-apps to
rpicam-apps perhaps the package shall also be renamed on buildroot side

Fixes: 82efc2faa923e8881748738963be1fbe3cb2bb45
 - http://autobuild.buildroot.org/results/18bb6d9c88c1a813a350658b251293744e161916

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcamera-apps/Config.in           |  9 ++++++---
 package/libcamera-apps/libcamera-apps.hash |  2 +-
 package/libcamera-apps/libcamera-apps.mk   | 32 +++++++++++++-----------------
 3 files changed, 21 insertions(+), 22 deletions(-)

diff --git a/package/libcamera-apps/Config.in b/package/libcamera-apps/Config.in
index 711fd6de05..f169d8c52e 100644
--- a/package/libcamera-apps/Config.in
+++ b/package/libcamera-apps/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LIBCAMERA_APPS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # libcamera
 	depends on !BR2_STATIC_LIBS # gnutls/libcamera
 	depends on BR2_USE_WCHAR # gnutls/libcamera/boost
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	select BR2_PACKAGE_JPEG
@@ -24,7 +25,9 @@ config BR2_PACKAGE_LIBCAMERA_APPS
 
 	  https://github.com/raspberrypi/libcamera-apps
 
-comment "libcamera-apps needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 8"
+comment "libcamera-apps needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 8, headers >= 5.5"
 	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || BR2_STATIC_LIBS || \
+		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5
diff --git a/package/libcamera-apps/libcamera-apps.hash b/package/libcamera-apps/libcamera-apps.hash
index 1437a0e8fa..00b499d247 100644
--- a/package/libcamera-apps/libcamera-apps.hash
+++ b/package/libcamera-apps/libcamera-apps.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e6b74a0ba10a962f1930199d7dd828c8d9ee370dfe1fdfd8ae2638df744f1344  libcamera-apps-1.2.1.tar.gz
+sha256  576bcd585f1c8d8bc80e37fa3c8a172e9d1c8406490438cf6d0fbc7ba4996ec1  rpicam-apps-1.5.0.tar.xz
 sha256  36dfed86bdef661a0a14ec1a1cc84c771d5a06b6f9b92e9ebb610ba711bd528a  license.txt
diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
index 2a217f095f..17983bb8ca 100644
--- a/package/libcamera-apps/libcamera-apps.mk
+++ b/package/libcamera-apps/libcamera-apps.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBCAMERA_APPS_VERSION = 1.2.1
-LIBCAMERA_APPS_SITE = $(call github,raspberrypi,libcamera-apps,v$(LIBCAMERA_APPS_VERSION))
+LIBCAMERA_APPS_VERSION = 1.5.0
+LIBCAMERA_APPS_SOURCE = rpicam-apps-$(LIBCAMERA_APPS_VERSION).tar.xz
+LIBCAMERA_APPS_SITE = https://github.com/raspberrypi/rpicam-apps/releases/download/v$(LIBCAMERA_APPS_VERSION)
 LIBCAMERA_APPS_LICENSE = BSD-2-Clause
 LIBCAMERA_APPS_LICENSE_FILES = license.txt
 LIBCAMERA_APPS_DEPENDENCIES = \
@@ -18,42 +19,37 @@ LIBCAMERA_APPS_DEPENDENCIES = \
 	tiff
 
 LIBCAMERA_APPS_CONF_OPTS = \
-	-DENABLE_COMPILE_FLAGS_FOR_TARGET=disabled \
-	-DENABLE_OPENCV=0 \
-	-DENABLE_TFLITE=0
+	-Denable_opencv=disabled \
+	-Denable_tflite=disabled
 
 ifeq ($(BR2_PACKAGE_LIBDRM),y)
 LIBCAMERA_APPS_DEPENDENCIES += libdrm
-LIBCAMERA_APPS_CONF_OPTS += -DENABLE_DRM=1
+LIBCAMERA_APPS_CONF_OPTS += -Denable_drm=enabled
 else
-LIBCAMERA_APPS_CONF_OPTS += -DENABLE_DRM=0
+LIBCAMERA_APPS_CONF_OPTS += -Denable_drm=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_FFMPEG)$(BR2_PACKAGE_LIBDRM),yy)
 LIBCAMERA_APPS_DEPENDENCIES += ffmpeg libdrm
-LIBCAMERA_APPS_CONF_OPTS += -DENABLE_LIBAV=1
+LIBCAMERA_APPS_CONF_OPTS += -Denable_libav=enabled
 else
-LIBCAMERA_APPS_CONF_OPTS += -DENABLE_LIBAV=0
+LIBCAMERA_APPS_CONF_OPTS += -Denable_libav=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 LIBCAMERA_APPS_DEPENDENCIES += \
 	$(if $(BR2_PACKAGE_LIBEPOXY),libepoxy) \
 	$(if $(BR2_PACKAGE_XLIB_LIBX11),xlib_libX11)
-LIBCAMERA_APPS_CONF_OPTS += -DENABLE_X11=1
+LIBCAMERA_APPS_CONF_OPTS += -Denable_egl=enabled
 else
-LIBCAMERA_APPS_CONF_OPTS += -DENABLE_X11=0
+LIBCAMERA_APPS_CONF_OPTS += -Denable_egl=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_QT5),y)
 LIBCAMERA_APPS_DEPENDENCIES += qt5base
-LIBCAMERA_APPS_CONF_OPTS += -DENABLE_QT=1
+LIBCAMERA_APPS_CONF_OPTS += -Denable_qt=enabled
 else
-LIBCAMERA_APPS_CONF_OPTS += -DENABLE_QT=0
+LIBCAMERA_APPS_CONF_OPTS += -Denable_qt=disabled
 endif
 
-ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-LIBCAMERA_APPS_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
-endif
-
-$(eval $(cmake-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
