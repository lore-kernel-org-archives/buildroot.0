Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D46CD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 08:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D00441697;
	Wed,  3 Apr 2024 08:48:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1yc1RjR51ds0; Wed,  3 Apr 2024 08:48:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A014416A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A014416A7;
	Wed,  3 Apr 2024 08:48:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 72B3E1BF44A
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 08:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D69182039
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 08:48:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WMFGBOoGI5g7 for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 08:48:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1292182037
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1292182037
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1292182037
 for <buildroot@busybox.net>; Wed,  3 Apr 2024 08:48:20 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-56c583f5381so1128896a12.1
 for <buildroot@busybox.net>; Wed, 03 Apr 2024 01:48:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712134099; x=1712738899;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ovl9q2tOcaqnR3BXRFtPR+LnKBlE1a5PDSk4xs1vFuU=;
 b=f6qD97p7253EPcga4FCE7lyvtpeslM7edIPCwr9Qi1pbJ4UDHqG2uSJinaXOAwbHjg
 FLIrcmmx8KzbuenAkGTVjv/aceBcgnIljXZohDprEYvxG6yYqlTMQdRBxXrZx/zzY5JC
 EbOJHuzv4ZCi8JvYeBmPVlycWW0gJmeoQhY/nYTreTgdBgECap3gkkwCRgjhZN59VMes
 jikZz7sSJWl+syR1UVbWTdtIYlCSqKJCkJ6JO8wh0oeVdJlsked0JHjXo2srgPxdwW2q
 IlRmPh/dFWxt/LigNV8FRhYJ88J1hvEfAnZevxk6v2efcs96cbzRPMW/ZH0xMDCXMxit
 st0g==
X-Gm-Message-State: AOJu0YxUuNMJErdd++gHg6UoiNklOpciiUZ/j+tie8pzE1RLN29u6OKY
 uaoL3Soms2r6nBx2UuCE8HW0GQEAsMRvkVwRA9IZd9pPhaExc2pA0xg6bfAE4x8Kp+SXacdiGHk
 =
X-Google-Smtp-Source: AGHT+IFM2sWge4L/nI8k9L+0yMIWewYm2sRhudVnXGs1009FYBbEhnjDf0yMwp57VU/Ad+7dpPMXzA==
X-Received: by 2002:a50:9e46:0:b0:56d:c721:9f5b with SMTP id
 z64-20020a509e46000000b0056dc7219f5bmr1553546ede.10.1712134098524; 
 Wed, 03 Apr 2024 01:48:18 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 ec47-20020a0564020d6f00b0056e0badec02sm197248edb.38.2024.04.03.01.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 01:48:18 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  3 Apr 2024 10:48:07 +0200
Message-Id: <20240403084807.512825-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240403084807.512825-1-francois.perrad@gadz.org>
References: <20240403084807.512825-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1712134099; x=1712738899; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ovl9q2tOcaqnR3BXRFtPR+LnKBlE1a5PDSk4xs1vFuU=;
 b=PCBen3YZJVI1p/Pg2i7XcqrB5rSRbm1vallkoycLpIk+XsyGKO/WMGJ1jDZL3djjL6
 DtARU1rsCa6M/eqXFDilp9fTGrpv3mPgJlmXyUrqocPX/KMva439ieB+b6Z1Fm3ptJqq
 4sy83fPVdMyRLpUeRJDOEdI/q3rG/LwGBpD4cK0OVvFKv3XjlGdHyB6ZY+AKe9lrpvC0
 tVNn+XKk5DeuXSsXz3Vp4pVStxZY6tt6zSYnZ2YT5jZ/E6PGkUj+BCth3jvDm78fEo6w
 8AIlqgWdxGtgahqxFbQPACWq+tjQT3OxjqqxazuhnB9Ie4wE4IMNbzPoVZ4BiU0f+vIB
 4zUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=PCBen3YZ
Subject: [Buildroot] [PATCH 2/2] package/libgtk4: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS                   |   1 +
 package/Config.in            |   1 +
 package/libgtk4/Config.in    | 106 +++++++++++++++++++++++++++++++++
 package/libgtk4/libgtk4.hash |   5 ++
 package/libgtk4/libgtk4.mk   | 111 +++++++++++++++++++++++++++++++++++
 5 files changed, 224 insertions(+)
 create mode 100644 package/libgtk4/Config.in
 create mode 100644 package/libgtk4/libgtk4.hash
 create mode 100644 package/libgtk4/libgtk4.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f4b3d4627..d0a2cadba 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1122,6 +1122,7 @@ F:	package/dado/
 F:	package/ficl/
 F:	package/graphene/
 F:	package/janet/
+F:	package/libgtk4/
 F:	package/libtomcrypt/
 F:	package/libtommath/
 F:	package/libwpe/
diff --git a/package/Config.in b/package/Config.in
index 9d659320b..5087792f7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1679,6 +1679,7 @@ menu "Graphics"
 	source "package/libgta/Config.in"
 	source "package/libgtk2/Config.in"
 	source "package/libgtk3/Config.in"
+	source "package/libgtk4/Config.in"
 	source "package/libjxl/Config.in"
 	source "package/libmediaart/Config.in"
 	source "package/libmng/Config.in"
diff --git a/package/libgtk4/Config.in b/package/libgtk4/Config.in
new file mode 100644
index 000000000..cda183c8d
--- /dev/null
+++ b/package/libgtk4/Config.in
@@ -0,0 +1,106 @@
+comment "libgtk4 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_HAS_THREADS
+
+comment "libgtk4 needs an OpenGL or an OpenGL-EGL/wayland backend"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_PACKAGE_HAS_LIBEGL_WAYLAND && !BR2_PACKAGE_HAS_LIBGL
+
+config BR2_PACKAGE_LIBGTK4
+	bool "libgtk4"
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
+	depends on BR2_INSTALL_LIBSTDCPP # pango
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
+	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_CAIRO_PS
+	select BR2_PACKAGE_CAIRO_PDF
+	select BR2_PACKAGE_CAIRO_SVG
+	select BR2_PACKAGE_GDK_PIXBUF
+	select BR2_PACKAGE_GRAPHENE
+	select BR2_PACKAGE_LIBEPOXY
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_PANGO
+	select BR2_PACKAGE_TIFF
+	# At least one backend is required
+	select BR2_PACKAGE_LIBGTK4_BROADWAY if \
+		!(BR2_PACKAGE_LIBGTK4_X11 || BR2_PACKAGE_LIBGTK4_WAYLAND)
+	help
+	  The GTK version 4 graphical user interface library
+
+	  https://www.gtk.org/
+
+if BR2_PACKAGE_LIBGTK4
+
+config BR2_PACKAGE_LIBGTK4_BROADWAY
+	bool "Broadway GDK backend"
+	default y
+	  help
+	  This enables the Broadway backend for GDK, which provides
+	  support for displaying GTK+ applications in a web browser,
+	  using HTML5 and web sockets.
+
+	  For example, to run gtk4-demo on a target which IP address is
+	  192.168.0.1 and use it from a web browser, execute the
+	  following commands:
+
+	  $ broadwayd -a 192.168.0.1 -p 8080 :2 &
+	  $ export GDK_BACKEND=broadway
+	  $ export BROADWAY_DISPLAY=:2
+	  $ gtk4-demo
+
+	  Then open a web browser at address http://192.168.0.1:8080.
+	  Javascript and web sockets should be enabled.
+
+comment "Wayland GDK backend needs an OpenGL EGL backend provided by mesa3d w/ headers >= 3.17"
+	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
+
+config BR2_PACKAGE_LIBGTK4_WAYLAND
+	bool "Wayland GDK backend"
+	default y
+	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
+	select BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_LIBXKBCOMMON
+	help
+	  This enables the Wayland backend for GDK.
+
+comment "X11 GDK backend needs an OpenGL provider"
+	depends on !BR2_PACKAGE_HAS_LIBGL
+
+config BR2_PACKAGE_LIBGTK4_X11
+	bool "X11 GDK backend"
+	default y
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_XLIB_LIBXCURSOR
+	select BR2_PACKAGE_XLIB_LIBXI
+	select BR2_PACKAGE_XLIB_LIBXINERAMA
+	help
+	  This enables the X11 backend for GDK.
+
+config BR2_PACKAGE_LIBGTK4_GSTREAMER
+	bool "gstreamer support"
+	select BR2_PACKAGE_GSTREAMER1
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL
+	select BR2_PACKAGE_GST1_PLUGINS_BAD
+	help
+	  Enable gstreamer support.
+
+config BR2_PACKAGE_LIBGTK4_DEMO
+	bool "Install libgtk4 demo/example programs"
+	select BR2_PACKAGE_SHARED_MIME_INFO
+	select BR2_PACKAGE_HICOLOR_ICON_THEME
+	help
+	  The GTK source base contains demo/exmaple programs.
+	  This option allows to install them to the target.
+
+endif
diff --git a/package/libgtk4/libgtk4.hash b/package/libgtk4/libgtk4.hash
new file mode 100644
index 000000000..efb944f2a
--- /dev/null
+++ b/package/libgtk4/libgtk4.hash
@@ -0,0 +1,5 @@
+# From https://download.gnome.org/sources/gtk/4.12/gtk-4.12.4.sha256sum
+sha256  ba67c6498e5599f928edafb9e08a320adfaa50ab2f0da6fc6ab2252fc2d57520  gtk-4.12.4.tar.xz
+
+# Hash for license file:
+sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libgtk4/libgtk4.mk b/package/libgtk4/libgtk4.mk
new file mode 100644
index 000000000..2d3e5049a
--- /dev/null
+++ b/package/libgtk4/libgtk4.mk
@@ -0,0 +1,111 @@
+################################################################################
+#
+# libgtk4
+#
+################################################################################
+
+LIBGTK4_VERSION_MAJOR = 4.12
+LIBGTK4_VERSION = $(LIBGTK4_VERSION_MAJOR).4
+LIBGTK4_SOURCE = gtk-$(LIBGTK4_VERSION).tar.xz
+LIBGTK4_SITE = https://download.gnome.org/sources/gtk/$(LIBGTK4_VERSION_MAJOR)
+LIBGTK4_LICENSE = LGPL-2.0+
+LIBGTK4_LICENSE_FILES = COPYING
+LIBGTK4_CPE_ID_VENDOR = gnome
+LIBGTK4_CPE_ID_PRODUCT = gtk
+LIBGTK4_INSTALL_STAGING = YES
+
+LIBGTK4_DEPENDENCIES = host-pkgconf host-libgtk4 \
+	gdk-pixbuf graphene libepoxy libglib2 pango \
+	$(TARGET_NLS_DEPENDENCIES)
+
+LIBGTK4_CONF_OPTS = -Dbuild-tests=false
+
+ifeq ($(BR2_PACKAGE_LIBGTK4_X11),y)
+LIBGTK4_DEPENDENCIES += xlib_libXcursor xlib_libXi xlib_libXinerama
+LIBGTK4_CONF_OPTS += -Dx11-backend=true
+else
+LIBGTK4_CONF_OPTS += -Dx11-backend=false
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGTK4_WAYLAND),y)
+LIBGTK4_DEPENDENCIES += wayland libxkbcommon
+LIBGTK4_CONF_OPTS += -Dwayland-backend=true
+else
+LIBGTK4_CONF_OPTS += -Dwayland-backend=false
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGTK4_BROADWAY),y)
+LIBGTK4_CONF_OPTS += -Dbroadway-backend=true
+else
+LIBGTK4_CONF_OPTS += -Dbroadway-backend=false
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGTK4_GSTREAMER),y)
+LIBGTK4_CONF_OPTS += -Dmedia-gstreamer=enabled
+LIBGTK4_DEPENDENCIES += gstreamer1 gst1-plugins-base gst1-plugins-bad
+else
+LIBGTK4_CONF_OPTS += -Dmedia-gstreamer=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_CUPS),y)
+LIBGTK4_CONF_OPTS += -Dprint-cups=enabled
+LIBGTK4_DEPENDENCIES += cups
+else
+LIBGTK4_CONF_OPTS += -Dprint-cups=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGTK4_DEMO),y)
+LIBGTK4_CONF_OPTS += -Ddemos=true -Dbuild-examples=true
+LIBGTK4_DEPENDENCIES += hicolor-icon-theme shared-mime-info
+else
+LIBGTK4_CONF_OPTS += -Ddemos=false -Dbuild-examples=false
+endif
+
+define LIBGTK4_COMPILE_GLIB_SCHEMAS
+	$(HOST_DIR)/bin/glib-compile-schemas \
+		$(TARGET_DIR)/usr/share/glib-2.0/schemas
+endef
+LIBGTK4_POST_INSTALL_TARGET_HOOKS += LIBGTK4_COMPILE_GLIB_SCHEMAS
+
+# here, we build a native gtk4-update-icon-cache as host-libgtk4
+
+HOST_LIBGTK4_DEPENDENCIES = \
+	host-gdk-pixbuf \
+	host-libglib2 \
+	host-pkgconf
+
+HOST_LIBGTK4_CFLAGS = \
+	-I $(@D)/gtk \
+	`$(HOST_MAKE_ENV) $(PKG_CONFIG_HOST_BINARY) --cflags --libs gdk-pixbuf-2.0`
+
+define HOST_LIBGTK4_CONFIGURE_CMDS
+	echo "#define BUILD_TOOLS 1" >> $(@D)/gtk/config.h
+	echo "#define GETTEXT_PACKAGE \"gtk40\"" >> $(@D)/gtk/config.h
+	echo "#define GTK_LOCALEDIR \"/usr/share/locale\"" >> $(@D)/gtk/config.h
+	echo "#define HAVE_UNISTD_H 1" >> $(@D)/gtk/config.h
+	echo "#define HAVE_FTW_H 1" >> $(@D)/gtk/config.h
+endef
+
+define HOST_LIBGTK4_BUILD_CMDS
+	$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) \
+		$(@D)/tools/updateiconcache.c $(@D)/gtk/gtkiconcachevalidator.c\
+		$(HOST_LIBGTK4_CFLAGS) \
+		-o $(@D)/tools/gtk4-update-icon-cache
+endef
+
+define HOST_LIBGTK4_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/tools/gtk4-update-icon-cache \
+		$(HOST_DIR)/bin/gtk4-update-icon-cache
+endef
+
+# Create icon-theme.cache for each of the icon directories/themes
+# It's not strictly necessary but speeds up lookups
+define LIBGTK4_UPDATE_ICON_CACHE
+	[ ! -d $(TARGET_DIR)/usr/share/icons ] || \
+		find $(TARGET_DIR)/usr/share/icons -maxdepth 1 -mindepth 1 -type d \
+			-exec $(HOST_DIR)/bin/gtk-update-icon-cache {} \;
+endef
+LIBGTK4_TARGET_FINALIZE_HOOKS += LIBGTK4_UPDATE_ICON_CACHE
+
+$(eval $(meson-package))
+$(eval $(host-generic-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
