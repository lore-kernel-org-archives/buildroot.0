From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri,  3 Oct 2014 14:43:22 +0200
Subject: [Buildroot] [PATCH 01/11] mesa3d: Fix package requirements
In-Reply-To: <1412340212-3089-1-git-send-email-jezz@sysmic.org>
References: <1412340212-3089-1-git-send-email-jezz@sysmic.org>
Message-ID: <1412340212-3089-2-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mesa3d requirement (as specified by configure script) are:
    x11 xext xdamage xfixes x11-xcb xcb-glx >= 1.8.1 xcb-dri2 >= 1.8
    xcb-dri3 xcb-present xcb-sync xshmfence >= 1.1

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/mesa3d/Config.in | 3 +++
 package/mesa3d/mesa3d.mk | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 74ebbed..673fbe2 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -2,12 +2,15 @@ menuconfig BR2_PACKAGE_MESA3D
 	bool "mesa3d"
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_XPROTO_DRI3PROTO if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XPROTO_DRI2PROTO if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XPROTO_XF86DRIPROTO if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XPROTO_PRESENTPROTO if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XORG7
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_INSTALL_LIBSTDCPP
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index ec76872..203a055 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -28,11 +28,14 @@ ifeq ($(BR2_PACKAGE_XORG7),y)
 MESA3D_DEPENDENCIES += \
 	xproto_xf86driproto \
 	xproto_dri2proto \
+	xproto_dri3proto \
+	xproto_presentproto \
 	xproto_glproto \
 	xlib_libX11 \
 	xlib_libXext \
 	xlib_libXdamage \
 	xlib_libXfixes \
+	xlib_libxshmfence \
 	libxcb
 MESA3D_CONF_OPT += --enable-glx
 # quote from mesa3d configure "Building xa requires at least one non swrast gallium driver."
-- 
2.1.0
