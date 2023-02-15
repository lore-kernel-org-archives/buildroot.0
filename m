Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BFEC636CC
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 14:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58A2160FDA;
	Wed, 15 Feb 2023 14:36:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58A2160FDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2wzAMXPqbDHr; Wed, 15 Feb 2023 14:36:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27F2A61156;
	Wed, 15 Feb 2023 14:36:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27F2A61156
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 972B41BF337
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 14:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F6B481F01
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 14:36:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F6B481F01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bcXwH2m8M14S for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 14:36:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 474C381ECA
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 474C381ECA
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 14:36:11 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id eq11so22377319edb.6
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 06:36:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S/zmejRvTAfLLlbv4Fuvi3ilKDPP1U78Wsg+bOLSEYY=;
 b=5XH8Lnmuu70+6R5oBuoezK4rzk76B70wdMr1Hhe3v8kkKq9IeR6bT+RVmHKr499Don
 itz3FJOrUH9QDr/G/4P8HxyK8RNY/g3d9cV+4X6oVWJF8RTP7MiD+WEstqc2LD6n4/6p
 +ZaK3U2I99sEOoiO45J7Y2LUsRLc0bg8tB912XuZPRoyXYJIm41AOfcvIrvs43MIq9Bq
 WT4Uw9MhdP5mIjLBj1AWoK9e89LU+51lt8n5PSih2OX86qtG8l1ECRvBNNbJD6guSQYy
 0MRn8ptUeeu7XKWdEQ0PmGhtAi7GN9NKIsNcR6oHftczhduv+BKiihYlLTV/ElZ1HX8H
 xwUQ==
X-Gm-Message-State: AO0yUKW5bDRMu8vTGQwSUQ2snOLyCCJV2btYtcEhELJtzcBS8k+doGNr
 FJEszdiTC4Df6G4YjaBRIakQsBQS1cRy6A==
X-Google-Smtp-Source: AK7set+93RkiXOOvFkC5ccjTHLP8OhDTIVB+XpeUb8/JAQ0gajaicRRV2CpIV0lcHqrh4vV82z2f3g==
X-Received: by 2002:aa7:c603:0:b0:4ab:1ca2:e4d2 with SMTP id
 h3-20020aa7c603000000b004ab1ca2e4d2mr2173391edq.27.1676471769330; 
 Wed, 15 Feb 2023 06:36:09 -0800 (PST)
Received: from LinkTed.fritz.box ([2a02:8070:4182:37a0:64cb:8203:42ee:ef04])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a50d486000000b004aab36ad060sm9560719edi.92.2023.02.15.06.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 06:36:08 -0800 (PST)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Feb 2023 15:35:34 +0100
Message-Id: <20230215143534.19834-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=S/zmejRvTAfLLlbv4Fuvi3ilKDPP1U78Wsg+bOLSEYY=;
 b=jt3BQsV0JDh8J9tZHsVkB93SFYSa1NeoCa7/s0yOLsF+nrssRy0u6eab0mJUGa9KH6
 HQ9hQ0H/cRuvNMO2BuGP9o7CPSm+XeyKZYcE0cbaweMDImQAcXXufPGK0xPfz/Jy+zbZ
 uAJ5YbiSLxP3GEbyVXRBGMeQ16HVaYL919gwu/cz1fJpy1JAqlIDnQphf3FM10zfh3KY
 RR76WIQQJQ+pDBEyOHC/CJhFEFpchRgZGrxvhiJIGdHAagNDkc6/BT5oQTMKlI3WIq+o
 taUWv3DdDTtj0eWywQzFi6ml3Ar5R1yu7gDw6bREu3twZj2hk+g33aGAMqLjQTIWqDRw
 OQNA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jt3BQsV0
Subject: [Buildroot] [PATCH v1 1/1] package/x11r7/xwayland: new package
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

XServer to run X clients under wayland

This XServer is required to run the X clients under Wayland compositor,
for example weston or wlroots based compositors.

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 DEVELOPERS                           |  1 +
 package/weston/Config.in             |  8 +++
 package/weston/weston.mk             |  2 +-
 package/wlroots/Config.in            | 12 ++++
 package/wlroots/wlroots.mk           |  6 +-
 package/x11r7/Config.in              |  1 +
 package/x11r7/xwayland/Config.in     | 26 ++++++++
 package/x11r7/xwayland/xwayland.hash |  6 ++
 package/x11r7/xwayland/xwayland.mk   | 94 ++++++++++++++++++++++++++++
 9 files changed, 154 insertions(+), 2 deletions(-)
 create mode 100644 package/x11r7/xwayland/Config.in
 create mode 100644 package/x11r7/xwayland/xwayland.hash
 create mode 100644 package/x11r7/xwayland/xwayland.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index df2b98ad53..b240b7c92a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2515,6 +2515,7 @@ F:	support/testing/tests/package/test_python_s3transfer.py
 N:	Raphael Pavlidis <raphael.pavlidis@gmail.com>
 F:	package/slirp4netns/
 F:	package/sway/
+F:	package/x11r7/xwayland/
 
 N:	Refik Tuzakli <tuzakli.refik@gmail.com>
 F:	package/freescale-imx/
diff --git a/package/weston/Config.in b/package/weston/Config.in
index 3b4e932b7d..db12afc43a 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -111,14 +111,22 @@ config BR2_PACKAGE_WESTON_XWAYLAND
 	bool "XWayland support"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_PACKAGE_LIBEPOXY
+	depends on BR2_USE_MMU # xwayland
+	depends on !BR2_STATIC_LIBS # xwayland
+	depends on BR2_TOOLCHAIN_HAS_THREADS # xwayland
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_LIBXCB
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
+	select BR2_PACKAGE_XWAYLAND
 
 comment "XWayland support needs libepoxy and X.org enabled"
 	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_LIBEPOXY
 
+comment "XWayland support needs a toolchain w/ threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
 # Weston needs at least one shell; this can be one of the bundled ones,
 # below, of from a third-party package, which should then select this.
 config BR2_PACKAGE_WESTON_HAS_SHELL
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 5e71473640..01f84178b2 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -123,7 +123,7 @@ WESTON_CONF_OPTS += -Dbackend-default=$(call qstrip,$(BR2_PACKAGE_WESTON_DEFAULT
 
 ifeq ($(BR2_PACKAGE_WESTON_XWAYLAND),y)
 WESTON_CONF_OPTS += -Dxwayland=true
-WESTON_DEPENDENCIES += cairo libepoxy libxcb xlib_libX11 xlib_libXcursor
+WESTON_DEPENDENCIES += cairo libepoxy libxcb xlib_libX11 xlib_libXcursor xwayland
 else
 WESTON_CONF_OPTS += -Dxwayland=false
 endif
diff --git a/package/wlroots/Config.in b/package/wlroots/Config.in
index 84a4ef846e..26992ca326 100644
--- a/package/wlroots/Config.in
+++ b/package/wlroots/Config.in
@@ -41,4 +41,16 @@ config BR2_PACKAGE_WLROOTS_X11
 	help
 	  Support Wayland sessions nested inside a X11 window
 
+config BR2_PACKAGE_WLROOTS_XWAYLAND
+	bool "XWayland support"
+	depends on BR2_PACKAGE_XORG7 # libxcb, xcb-util-wm, xwayland
+	select BR2_PACKAGE_LIBXCB
+	select BR2_PACKAGE_XCB_UTIL_WM
+	select BR2_PACKAGE_XWAYLAND
+	help
+	  Support for X11 applications
+
+comment "XWayland support needs X.org enabled"
+	depends on !BR2_PACKAGE_XORG7
+
 endif
diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
index 4f14d20b11..5b930a51be 100644
--- a/package/wlroots/wlroots.mk
+++ b/package/wlroots/wlroots.mk
@@ -30,8 +30,12 @@ WLROOTS_BACKENDS = libinput drm
 
 ifeq ($(BR2_PACKAGE_WLROOTS_X11),y)
 WLROOTS_BACKENDS += x11
-WLROOTS_CONF_OPTS += -Dxwayland=enabled
 WLROOTS_DEPENDENCIES += libxcb xcb-util-wm xcb-util-renderutil xlib_libX11
+endif
+
+ifeq ($(BR2_PACKAGE_WLROOTS_XWAYLAND),y)
+WLROOTS_CONF_OPTS += -Dxwayland=enabled
+WLROOTS_DEPENDENCIES += libxcb xcb-util-wm xwayland
 else
 WLROOTS_CONF_OPTS += -Dxwayland=disabled
 endif
diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 365de34c98..4de8922e0d 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -12,6 +12,7 @@ menuconfig BR2_PACKAGE_XORG7
 if BR2_PACKAGE_XORG7
 	menu "X11R7 Servers"
 		source package/x11r7/xserver_xorg-server/Config.in
+		source package/x11r7/xwayland/Config.in
 	endmenu
 	menu "X11R7 Libraries"
 		source package/x11r7/libxcb/Config.in
diff --git a/package/x11r7/xwayland/Config.in b/package/x11r7/xwayland/Config.in
new file mode 100644
index 0000000000..4f14f2cc36
--- /dev/null
+++ b/package/x11r7/xwayland/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_XWAYLAND
+	bool "xwayland server"
+	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS # wayland
+	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
+	# We need a SHA1 implementation. If either openssl or
+	# libgcrypt are already part of the build, we'll use one of
+	# them, otherwise, use the small libsha1 library.
+	select BR2_PACKAGE_LIBSHA1 if (!BR2_PACKAGE_OPENSSL && !BR2_PACKAGE_LIBGCRYPT)
+	select BR2_PACKAGE_PIXMAN
+	select BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS
+	select BR2_PACKAGE_XLIB_LIBXCVT
+	select BR2_PACKAGE_XLIB_LIBXFONT2
+	select BR2_PACKAGE_XLIB_LIBXKBFILE
+	select BR2_PACKAGE_XLIB_LIBXRANDR
+	select BR2_PACKAGE_XLIB_XTRANS
+	select BR2_PACKAGE_XORGPROTO
+	help
+	  X.Org X server to run X clients under wayland
+
+	  http://xorg.freedesktop.org
+
+comment "xwayland needs a toolchain w/ threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/x11r7/xwayland/xwayland.hash b/package/x11r7/xwayland/xwayland.hash
new file mode 100644
index 0000000000..0c476f3183
--- /dev/null
+++ b/package/x11r7/xwayland/xwayland.hash
@@ -0,0 +1,6 @@
+# From https://lists.x.org/archives/xorg-announce/2023-February/003322.html
+sha256  d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73  xwayland-22.1.8.tar.xz
+sha512  f52c6f99d8ef7605bc1c651d5ee5e306c12af30649a2d712b1c4c3cf4c7c80246ae24bd9ac39461d47aafc78f5d659446a459cd6259e05ef3128b204981d114a  xwayland-22.1.8.tar.xz
+
+# Locally calculated
+sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
new file mode 100644
index 0000000000..174b440b07
--- /dev/null
+++ b/package/x11r7/xwayland/xwayland.mk
@@ -0,0 +1,94 @@
+################################################################################
+#
+# xwayland
+#
+################################################################################
+
+XWAYLAND_VERSION = 22.1.8
+XWAYLAND_SOURCE = xwayland-$(XWAYLAND_VERSION).tar.xz
+XWAYLAND_SITE = https://xorg.freedesktop.org/archive/individual/xserver
+XWAYLAND_LICENSE = MIT
+XWAYLAND_LICENSE_FILES = COPYING
+XWAYLAND_INSTALL_STAGING = YES
+XWAYLAND_DEPENDENCIES = \
+	pixman \
+	wayland \
+	wayland-protocols \
+	xlib_libxcvt \
+	xlib_libXfont2 \
+	xlib_libxkbfile \
+	xlib_libXrandr \
+	xlib_xtrans \
+	xorgproto
+XWAYLAND_CONF_OPTS = \
+	-Dxwayland_eglstream=false \
+	-Dxvfb=false \
+	-Ddefault_font_path=/usr/share/fonts/X11/ \
+	-Ddtrace=false \
+	-Ddocs=false
+
+ifeq ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_LIBEPOXY),yy)
+XWAYLAND_CONF_OPTS += -Dglamor=true
+XWAYLAND_DEPENDENCIES += libdrm libepoxy
+else
+XWAYLAND_CONF_OPTS += -Dglamor=false
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
+XWAYLAND_CONF_OPTS += -Dglx=true
+XWAYLAND_DEPENDENCIES += libgl
+else
+XWAYLAND_CONF_OPTS += -Dglx=false
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXDMCP),y)
+XWAYLAND_CONF_OPTS += \
+	-Dxdmcp=true \
+	-Dxdm-auth-1=true
+XWAYLAND_DEPENDENCIES += xlib_libXdmcp
+else
+XWAYLAND_CONF_OPTS += \
+	-Dxdmcp=false \
+	-Dxdm-auth-1=false
+endif
+
+ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
+XWAYLAND_CONF_OPTS += -Dsecure-rpc=true
+XWAYLAND_DEPENDENCIES += libtirpc
+else
+XWAYLAND_CONF_OPTS += -Dsecure-rpc=false
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSELINUX)$(BR2_PACKAGE_AUDIT),yy)
+XWAYLAND_CONF_OPTS += -Dxselinux=true
+XWAYLAND_DEPENDENCIES += libselinux audit
+else
+XWAYLAND_CONF_OPTS += -Dxselinux=false
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+XWAYLAND_CONF_OPTS += -Dsha1=libcrypto
+XWAYLAND_DEPENDENCIES += openssl
+else ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+XWAYLAND_CONF_OPTS += -Dsha1=libgcrypt
+XWAYLAND_DEPENDENCIES += libgcrypt
+else
+XWAYLAND_CONF_OPTS += -Dsha1=libsha1
+XWAYLAND_DEPENDENCIES += libsha1
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXSHMFENCE)$(BR2_PACKAGE_LIBDRM),yy)
+XWAYLAND_CONF_OPTS += -Ddri3=true
+XWAYLAND_DEPENDENCIES += xlib_libxshmfence libdrm
+else
+XWAYLAND_CONF_OPTS += -Ddri3=false
+endif
+
+ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
+XWAYLAND_CONF_OPTS += -Dlibunwind=true
+XWAYLAND_DEPENDENCIES += libunwind
+else
+XWAYLAND_CONF_OPTS += -Dlibunwind=false
+endif
+
+$(eval $(meson-package))
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
