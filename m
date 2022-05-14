Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3C7C433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 17:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEDA660E82;
	Sat, 14 May 2022 17:59:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gwu7rs9qLr-e; Sat, 14 May 2022 17:59:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16B4360E0F;
	Sat, 14 May 2022 17:59:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 478AE1BF3DE
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 17:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0681182871
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 17:56:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id awCeJuELOWnH for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 17:56:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1AF6E827FD
 for <buildroot@buildroot.org>; Sat, 14 May 2022 17:56:21 +0000 (UTC)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout10.t-online.de (Postfix) with SMTP id 8D93D6625;
 Sat, 14 May 2022 19:56:17 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.4.164]) by fwd86.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1npvzy-2G5rq20; Sat, 14 May 2022 19:56:14 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:41714)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1npvzx-0005N1-7i;
 Sat, 14 May 2022 19:56:13 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 19:55:59 +0200
Message-Id: <20220514175612.2510884-6-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220514175612.2510884-1-bernd.kuhls@t-online.de>
References: <20220514175612.2510884-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1652550974-000116DC-F3503FC3/0/0 CLEAN NORMAL
X-TOI-MSGID: 7b3fde3d-ec72-4561-ae4c-f9533776fc33
Subject: [Buildroot] [PATCH 06/19] package/x11r7/xdriver_xf86-video-ati:
 switch dependency from mesa3d to libgbm
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
Cc: Gary Bisson <bisson.gary@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The package depends on gbm and not mesa3d:
https://gitlab.freedesktop.org/xorg/driver/xf86-video-ati/-/blob/master/configure.ac#L155

Remove the dependency to BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON in order
to prevent a circular dependency here. This option will be removed in
a follow-patch anyway because Mesa3D will drop DRI drivers in version
22.x.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-video-ati/Config.in             | 7 +++----
 .../x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk | 1 +
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-ati/Config.in b/package/x11r7/xdriver_xf86-video-ati/Config.in
index 1246014dca..81255d5a4c 100644
--- a/package/x11r7/xdriver_xf86-video-ati/Config.in
+++ b/package/x11r7/xdriver_xf86-video-ati/Config.in
@@ -1,15 +1,14 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI
 	bool "xf86-video-ati"
 	depends on BR2_i386 || BR2_x86_64 # DRI radeon r100 driver
-	depends on BR2_PACKAGE_MESA3D
+	depends on BR2_PACKAGE_HAS_LIBGBM
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBDRM_RADEON
-	select BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
 	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
 	select BR2_PACKAGE_XORGPROTO
 	help
 	  ATI video driver
 
-comment "xf86-video-ati needs mesa3d"
+comment "xf86-video-ati needs GBM"
 	depends on BR2_i386 || BR2_x86_64
-	depends on !BR2_PACKAGE_MESA3D
+	depends on !BR2_PACKAGE_HAS_LIBGBM
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
index edb8b11add..e7f5852811 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
@@ -11,6 +11,7 @@ XDRIVER_XF86_VIDEO_ATI_LICENSE = MIT
 XDRIVER_XF86_VIDEO_ATI_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_ATI_DEPENDENCIES = \
 	libdrm \
+	libgbm \
 	xlib_libXcomposite \
 	xorgproto \
 	xserver_xorg-server
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
