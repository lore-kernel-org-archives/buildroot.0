Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B1DC74A5B
	for <buildroot@archiver.kernel.org>; Sat, 18 Mar 2023 19:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CCF460C12;
	Sat, 18 Mar 2023 19:32:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CCF460C12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hyENeqMOdoH8; Sat, 18 Mar 2023 19:32:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6522960E24;
	Sat, 18 Mar 2023 19:32:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6522960E24
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A5CE1BF4E2
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 19:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 240A981EC8
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 19:32:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 240A981EC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IolPdOl_SwSq for <buildroot@lists.busybox.net>;
 Sat, 18 Mar 2023 19:32:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3DAE81EA1
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3DAE81EA1
 for <buildroot@busybox.net>; Sat, 18 Mar 2023 19:32:08 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id er8so20865850edb.0
 for <buildroot@busybox.net>; Sat, 18 Mar 2023 12:32:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679167927;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2u6GKZRpdk2A6vsU3meweSr9BK/NikNL2X3EBO2Bkd4=;
 b=mLZHwwvJ0joi7tJWbsB84C/QwBZWhGG7x0UCi2Fn5iv0xwzPqdnM0gb5U34PBqVXQj
 3FBv+7ckCLo2RkRcGVx6Sh7UlSbHztZinN8DayXrXzm/8joWr1tsjgBYDkwc/L3DUFMF
 703CzyaWfGuQUQgNe8pUvfBGID2cy9otUORAnN1S+/lI+IrsyVt9I03YrzvwKRZWcgM5
 qs60HS0MNjbBLiZf0oyZP/AQeRUeqj9PxJUjjLT6b7P9sViD6ZKeFHGGOV+DcgsUEJ52
 IqcMpi5gvMA7NS2AY8vj9LoqppnN+p8fq7hiabbsck26umwHQNS7AAdjhPxhg2GUTybu
 i2Xw==
X-Gm-Message-State: AO0yUKU/lj+juI6XraA0B7zGalsV0CyGGTlGkfIW+Hzz3dWLEaG1YSxJ
 gEiF3iqkdiZAFDuC8RBP109yCYmSbaI=
X-Google-Smtp-Source: AK7set/x7h7mRtE0bBiow+p4vI46BnUqB8G5rqMSU/oViqmr8UkwURk/XLzt0W21qkc1uN6o9fj13A==
X-Received: by 2002:aa7:d896:0:b0:4af:64b8:262e with SMTP id
 u22-20020aa7d896000000b004af64b8262emr7580567edq.6.1679167927057; 
 Sat, 18 Mar 2023 12:32:07 -0700 (PDT)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 24-20020a508758000000b004fb419921e2sm2745137edv.57.2023.03.18.12.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 12:32:06 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 18 Mar 2023 20:31:59 +0100
Message-Id: <20230318193159.1418922-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230318193159.1418922-1-francois.perrad@gadz.org>
References: <20230318193159.1418922-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679167927;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2u6GKZRpdk2A6vsU3meweSr9BK/NikNL2X3EBO2Bkd4=;
 b=UjUhXu5cNWneacUvhoD+vTF3lCYjV1tqSg7ftm765WESvmIH1ZLApRXDMJaRfA+LgG
 VPdPJgZxgmmm0wTSO7pA/yuWVfwDwd7U+rtCCUjRH2K2VXvaq2AEQwTvNb7L29eGJC+g
 J5YNGarUjBXzJgPdFe0crcIwWt6NrbzBtX1CeLqIZhjTbgSFDawuErz/5Vyxm3yRK0gV
 SCETTKRbybCIa9v2Lun6xebxUZQw/FYd0B7R4/CwgfFQ7MFbWxkyNjgTWMbj6OJbQhaR
 JB4CyDBhHaIw2VPLcUqHNrCUyfR5bJ2Ufcs9hjrDX4sSmU0eveFWmQKXttisu6xiSYfU
 3U9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UjUhXu5c
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
 package/libgtk4/libgtk4.mk   | 110 +++++++++++++++++++++++++++++++++++
 5 files changed, 223 insertions(+)
 create mode 100644 package/libgtk4/Config.in
 create mode 100644 package/libgtk4/libgtk4.hash
 create mode 100644 package/libgtk4/libgtk4.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5000d7230..61e6e281c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1059,6 +1059,7 @@ F:	package/dado/
 F:	package/ficl/
 F:	package/graphene/
 F:	package/janet/
+F:	package/libgtk4/
 F:	package/libtomcrypt/
 F:	package/libtommath/
 F:	package/libwpe/
diff --git a/package/Config.in b/package/Config.in
index 272ea7f4a..9eff213c0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1612,6 +1612,7 @@ menu "Graphics"
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
index 000000000..8edafb3ca
--- /dev/null
+++ b/package/libgtk4/libgtk4.hash
@@ -0,0 +1,5 @@
+# From https://download.gnome.org/sources/gtk/4.10/gtk-4.10.1.sha256sum
+sha256  e8fcac04bc7715b9da667c911a5ee8f262e200d1d6a50adf23645ca8cfcd0311  gtk-4.10.1.tar.xz
+
+# Hash for license file:
+sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libgtk4/libgtk4.mk b/package/libgtk4/libgtk4.mk
new file mode 100644
index 000000000..8f3d13046
--- /dev/null
+++ b/package/libgtk4/libgtk4.mk
@@ -0,0 +1,110 @@
+################################################################################
+#
+# libgtk4
+#
+################################################################################
+
+LIBGTK4_VERSION_MAJOR = 4.10
+LIBGTK4_VERSION = $(LIBGTK4_VERSION_MAJOR).1
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
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
