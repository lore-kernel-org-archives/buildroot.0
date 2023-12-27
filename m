Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C82C46CD2
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 18:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D2F0404BF;
	Wed, 27 Dec 2023 18:30:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D2F0404BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0OqEpE106u09; Wed, 27 Dec 2023 18:30:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C52A740493;
	Wed, 27 Dec 2023 18:30:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C52A740493
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 426551BF3E3
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 18:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B49860B21
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 18:30:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B49860B21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GwP6THu4XVy0 for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 18:30:08 +0000 (UTC)
X-Greylist: delayed 324 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 27 Dec 2023 18:30:07 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D959460B0F
Received: from relay4.mail.vrmd.de (relay4.mail.vrmd.de [81.28.224.58])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D959460B0F
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 18:30:07 +0000 (UTC)
Received: from [95.90.241.14] (helo=murray.fritz.box)
 by relay2.mail.vrmd.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95) (envelope-from <mail@sebastianbauer.info>)
 id 1rIYaP-009Brb-2Z; Wed, 27 Dec 2023 19:24:57 +0100
From: Sebastian Bauer <mail@sebastianbauer.info>
To: buildroot@buildroot.org
Date: Wed, 27 Dec 2023 19:24:29 +0100
Message-ID: <20231227182429.1215185-3-mail@sebastianbauer.info>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231227182429.1215185-1-mail@sebastianbauer.info>
References: <20231227182429.1215185-1-mail@sebastianbauer.info>
MIME-Version: 1.0
X-Relay-User: mail@sebastianbauer.info
Subject: [Buildroot] [PATCH 3/3] packages/libcamera-apps: Fix build to use
 meson
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Sebastian Bauer <mail@sebastianbauer.info>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream uses meson instead of cmake since a while.

Signed-off-by: Sebastian Bauer <mail@sebastianbauer.info>
---
 package/libcamera-apps/libcamera-apps.mk | 27 ++++++++++--------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
index 2a217f095f..b76d2b2a1b 100644
--- a/package/libcamera-apps/libcamera-apps.mk
+++ b/package/libcamera-apps/libcamera-apps.mk
@@ -18,42 +18,37 @@ LIBCAMERA_APPS_DEPENDENCIES = \
 	tiff
 
 LIBCAMERA_APPS_CONF_OPTS = \
-	-DENABLE_COMPILE_FLAGS_FOR_TARGET=disabled \
-	-DENABLE_OPENCV=0 \
-	-DENABLE_TFLITE=0
+	-Denable_opencv=false \
+	-Denable_tflite=false
 
 ifeq ($(BR2_PACKAGE_LIBDRM),y)
 LIBCAMERA_APPS_DEPENDENCIES += libdrm
-LIBCAMERA_APPS_CONF_OPTS += -DENABLE_DRM=1
+LIBCAMERA_APPS_CONF_OPTS += -Denable_drm=true
 else
-LIBCAMERA_APPS_CONF_OPTS += -DENABLE_DRM=0
+LIBCAMERA_APPS_CONF_OPTS += -Denable_drm=false
 endif
 
 ifeq ($(BR2_PACKAGE_FFMPEG)$(BR2_PACKAGE_LIBDRM),yy)
 LIBCAMERA_APPS_DEPENDENCIES += ffmpeg libdrm
-LIBCAMERA_APPS_CONF_OPTS += -DENABLE_LIBAV=1
+LIBCAMERA_APPS_CONF_OPTS += -Denable_libav=true
 else
-LIBCAMERA_APPS_CONF_OPTS += -DENABLE_LIBAV=0
+LIBCAMERA_APPS_CONF_OPTS += -Denable_libav=false
 endif
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 LIBCAMERA_APPS_DEPENDENCIES += \
 	$(if $(BR2_PACKAGE_LIBEPOXY),libepoxy) \
 	$(if $(BR2_PACKAGE_XLIB_LIBX11),xlib_libX11)
-LIBCAMERA_APPS_CONF_OPTS += -DENABLE_X11=1
+LIBCAMERA_APPS_CONF_OPTS += -Denable_egl=true
 else
-LIBCAMERA_APPS_CONF_OPTS += -DENABLE_X11=0
+LIBCAMERA_APPS_CONF_OPTS += -Denable_egl=false
 endif
 
 ifeq ($(BR2_PACKAGE_QT5),y)
 LIBCAMERA_APPS_DEPENDENCIES += qt5base
-LIBCAMERA_APPS_CONF_OPTS += -DENABLE_QT=1
+LIBCAMERA_APPS_CONF_OPTS += -Denable_qt=true
 else
-LIBCAMERA_APPS_CONF_OPTS += -DENABLE_QT=0
+LIBCAMERA_APPS_CONF_OPTS += -Denable_qt=false
 endif
 
-ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-LIBCAMERA_APPS_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
-endif
-
-$(eval $(cmake-package))
+$(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
