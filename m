Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D8F2C636CC
	for <buildroot@archiver.kernel.org>; Thu, 16 Feb 2023 18:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 310B660008;
	Thu, 16 Feb 2023 18:33:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 310B660008
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DVvvaLV1XeNC; Thu, 16 Feb 2023 18:33:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3209D60591;
	Thu, 16 Feb 2023 18:33:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3209D60591
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 201BB1BF963
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 18:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE38081369
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 18:33:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE38081369
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HCUtMnAKyxWv for <buildroot@lists.busybox.net>;
 Thu, 16 Feb 2023 18:33:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 770FE812D5
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 770FE812D5
 for <buildroot@buildroot.org>; Thu, 16 Feb 2023 18:33:50 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 hg24-20020a05600c539800b003e1f5f2a29cso4899913wmb.4
 for <buildroot@buildroot.org>; Thu, 16 Feb 2023 10:33:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VLEFMisWm0oJX9vpReLTQn41z4E9S7Po5IIaubd0olE=;
 b=K4Q9oT/QCVVYJ5cDMrfJJrR59K5j5xlDw6V4kT3CN0MbcEoasAvEYJ1oPf2vMdhmCT
 Yob0df5PtIgR6mylpfm14YRvze+3j7AMwxX5TSeCYBnALdxlh/R1oK+dx9ZbP/ZgEsNA
 GjVrQuatdkoNGtQ9IdZVrdIC1Q1/fDY06kEb8FE17ph/2xVNQijnOmrLPFBMv4Df6Pux
 zy2Zpsdsx8rrjFDclOnx8lNyaPgRMRNIAsbbZ6dsSBLgNpJKDWFz/OuEK1DGATtq1oHe
 dZNPMMxn57YCXdwZ/fTCiakMD7/ULU/p4Hx0NY09wsFGeouHHozw+hfqKtxEPWi1qkMl
 mVTQ==
X-Gm-Message-State: AO0yUKUPAJNTMSJi1KdRR7krgEXUqcgtzQS3YZ1Xn8REw/iEVqj2XUvc
 eZMmq5A30cOMJDC/Ddm6uJWUoW/SUHud6A==
X-Google-Smtp-Source: AK7set8phhszw+Tn6lQB2yIUKdedXOEAwacOV7iOTv6So6OT6GizYRSKjfLCi9HG9gwwuyynq81/AA==
X-Received: by 2002:a05:600c:a292:b0:3dc:1f90:35b with SMTP id
 hu18-20020a05600ca29200b003dc1f90035bmr5878253wmb.34.1676572428631; 
 Thu, 16 Feb 2023 10:33:48 -0800 (PST)
Received: from LinkTed.fritz.box ([2a02:8070:4182:37a0:64cb:8203:42ee:ef04])
 by smtp.gmail.com with ESMTPSA id
 k5-20020a05600c1c8500b003e204158ac7sm6754969wms.47.2023.02.16.10.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 10:33:48 -0800 (PST)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 16 Feb 2023 19:33:20 +0100
Message-Id: <20230216183322.21622-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215143534.19834-1-raphael.pavlidis@gmail.com>
References: <20230215143534.19834-1-raphael.pavlidis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VLEFMisWm0oJX9vpReLTQn41z4E9S7Po5IIaubd0olE=;
 b=PMwXaB7Uu91YZiuC95xGgCzTvEdX0BarXJaYsjcQkwcLD63GNlKJFxKV0t4c78eH97
 4PQP8B8BvvvDvN5hreQ1t3yGPpRdFC1TJk36fRiba8mC/iAcVkz/2/DMkUuXtfDoxaoF
 rnzlYrU6Ms+8QNn2Y5NqID1BjAjhqkCDcpDDD+g0pwK7I3Zaz68tLpEjvnLMQBXypFcn
 Gax8ZusxSEoM0vKYc2MyHHfFsI1xr+2yg8D0PAHiBHqdRUHjQ+I2YWQfvCsn82Qwn+yU
 XhoB8cTRBemq6topd9fRSnTIevjDtGcC84sxsHunqZlyEESmrQ6fwjqvaGYlcs1t9z3C
 hZgA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PMwXaB7U
Subject: [Buildroot] [PATCH v2 1/3] package/x11r7/xwayland: new package
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
Changes v1 -> v2:
  - split up patches in 3 parts
  - add missing depends on in wlroots

 DEVELOPERS                           |  1 +
 package/x11r7/Config.in              |  1 +
 package/x11r7/xwayland/Config.in     | 26 ++++++++
 package/x11r7/xwayland/xwayland.hash |  6 ++
 package/x11r7/xwayland/xwayland.mk   | 94 ++++++++++++++++++++++++++++
 5 files changed, 128 insertions(+)
 create mode 100644 package/x11r7/xwayland/Config.in
 create mode 100644 package/x11r7/xwayland/xwayland.hash
 create mode 100644 package/x11r7/xwayland/xwayland.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f8451c7fec..5374fb2f61 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2417,6 +2417,7 @@ F:	support/testing/tests/package/test_python_s3transfer.py
 N:	Raphael Pavlidis <raphael.pavlidis@gmail.com>
 F:	package/slirp4netns/
 F:	package/sway/
+F:	package/x11r7/xwayland/
 
 N:	Refik Tuzakli <tuzakli.refik@gmail.com>
 F:	package/freescale-imx/
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
