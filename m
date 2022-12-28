Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EDAC4332F
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 07:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A93460B2F;
	Wed, 28 Dec 2022 07:17:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A93460B2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g0b2L0l9Wlw7; Wed, 28 Dec 2022 07:17:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA33C60B58;
	Wed, 28 Dec 2022 07:17:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA33C60B58
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 664B71BF34E
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 07:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4EAA981407
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 07:17:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EAA981407
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GQAaETZMqhU5 for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 07:17:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDBD981406
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CDBD981406
 for <buildroot@busybox.net>; Wed, 28 Dec 2022 07:17:44 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id bg10so10715096wmb.1
 for <buildroot@busybox.net>; Tue, 27 Dec 2022 23:17:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KwA+K56cnxScd5+h+k+zoctH4/NIKzJJWVNV6ukmlWI=;
 b=ZJrLATjWTrHwPwAvl7Ini4jsHtQWykkkEchmoJRXBW6gTjB56F1KakfugQw6YEAqWW
 QkqTTg8q2yh+UDfY0BV+I/6sj1km7vMALjd/7CElYpzsC26MQfvJDmdt6+ssQDtOLN3K
 ioIXLsQJPx1oWD830xj0m1eTIr+mJu3OmvdyqGHJc7w2e22+v//XQkjQIruxKQC+0Pzs
 icoB+36hBgyXxqdQdjOVZuRDSIAvxfhGzxFK8Yarf+GCKYezf+piWi2CFLUBv9rkOn81
 bE6e6fcALbSFkr6gKjSe6r0TQ0a9NRdQFiQreGLwoZcKCsMumcw1K/KPHV1PBQkn6+0T
 sEwQ==
X-Gm-Message-State: AFqh2koReRAMe+5XCQxxJgWWfmum9u76p3Bhnlkz/O0r6gK4C4U9k8dR
 bfWDJccdhJQFm3HQexytXylDYcsFHYw=
X-Google-Smtp-Source: AMrXdXuXnq/TswB92HTyMmmax7kFnM7yr/kHS/Nb+UreXqM2vXcv8ctRVS/EFSIQuypTHvcXpXkFtw==
X-Received: by 2002:a05:600c:3d86:b0:3d1:e04f:9bfa with SMTP id
 bi6-20020a05600c3d8600b003d1e04f9bfamr17606030wmb.28.1672211862787; 
 Tue, 27 Dec 2022 23:17:42 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c3b1200b003a6125562e1sm21815201wms.46.2022.12.27.23.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Dec 2022 23:17:42 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 28 Dec 2022 08:17:34 +0100
Message-Id: <20221228071734.737602-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KwA+K56cnxScd5+h+k+zoctH4/NIKzJJWVNV6ukmlWI=;
 b=ocgQ2dcVON2f9L4Fmf2fzQithon5OoQlsnwOEzO2rzBUXHV44oikOIzkWg8B0PrcEA
 nw389NMOSPDyXZZTSQCNsQp/hPhhLjDmfCltpbZZTicANAWH198XgF6fi15jsFKPo/47
 JIHNW/g1FxdCToriWEqJYyMXwGXoJoz5fKndbO6gCsMvV9llMGYJYjc2xBI/bEOe6pgm
 Th3mSsRT/5BOmZgljZnovwVho7MQixxr0Pderw4aKEYpLG8mlc+uVQUiep86yNgbXOD6
 IvMnJ5ZCGvIgAphAOCaS+2b469VDSjzq2FM/7WZsj7FgA78mpvD4VrBFTCnCV/5OVuZb
 0ptw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ocgQ2dcV
Subject: [Buildroot] [PATCH] package/libgtk3: bump to version 3.24.36
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

switch to meson infra
remove autotools specific patches

host-libgtk3 is a hack which build only gtk-update-icon-cache
host-libgtk3 is used by libgtk3 & adwaita-icon-theme

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...ge.patch => 0001-disable-atk-bridge.patch} | 28 +++---
 package/libgtk3/0001-no-gtk-doc.patch         | 25 ------
 ...ndency-from-gtk-encode-symbolic-svg.patch} |  0
 .../0002-fix-introspection-check.patch        | 28 ------
 package/libgtk3/Config.in                     |  1 +
 package/libgtk3/libgtk3.hash                  |  4 +-
 package/libgtk3/libgtk3.mk                    | 87 +++++--------------
 7 files changed, 35 insertions(+), 138 deletions(-)
 rename package/libgtk3/{0003-disable-atk-bridge.patch => 0001-disable-atk-bridge.patch} (62%)
 delete mode 100644 package/libgtk3/0001-no-gtk-doc.patch
 rename package/libgtk3/{0004-Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch => 0002-Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch} (100%)
 delete mode 100644 package/libgtk3/0002-fix-introspection-check.patch

diff --git a/package/libgtk3/0003-disable-atk-bridge.patch b/package/libgtk3/0001-disable-atk-bridge.patch
similarity index 62%
rename from package/libgtk3/0003-disable-atk-bridge.patch
rename to package/libgtk3/0001-disable-atk-bridge.patch
index 390fc012f..f3e9bff2b 100644
--- a/package/libgtk3/0003-disable-atk-bridge.patch
+++ b/package/libgtk3/0001-disable-atk-bridge.patch
@@ -5,21 +5,6 @@ add two new packages just for it: at-spi2-core and at-spi2-atk.
 
 Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
 
---- a/configure.ac
-+++ b/configure.ac
-@@ -1386,11 +1386,7 @@
- # Check for Accessibility Toolkit flags
- ########################################
-
--if test x$enable_x11_backend = xyes; then
--   ATK_PACKAGES="atk atk-bridge-2.0"
--else
--   ATK_PACKAGES="atk"
--fi
-+ATK_PACKAGES="atk"
-
- PKG_CHECK_MODULES(ATK, $ATK_PACKAGES)
-
 --- a/gtk/a11y/gtkaccessibility.c
 +++ b/gtk/a11y/gtkaccessibility.c
 @@ -37,10 +37,6 @@
@@ -33,7 +18,7 @@ Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
  static gboolean gail_focus_watcher      (GSignalInvocationHint *ihint,
                                           guint                  n_param_values,
                                           const GValue          *param_values,
-@@ -988,9 +984,5 @@
+@@ -988,9 +984,5 @@ _gtk_accessibility_init (void)
    _gtk_accessibility_override_atk_util ();
    do_window_event_initialization ();
 
@@ -43,3 +28,14 @@ Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
 -
    atk_misc_instance = g_object_new (GTK_TYPE_MISC_IMPL, NULL);
  }
+--- a/meson.build
++++ b/meson.build
+@@ -564,7 +564,7 @@ if x11_enabled
+   xfixes_dep     = dependency('xfixes', required: false)
+   xcomposite_dep = dependency('xcomposite', required: false)
+   fontconfig_dep = dependency('fontconfig', fallback: ['fontconfig', 'fontconfig_dep'])
+-  atkbridge_dep  = dependency('atk-bridge-2.0', version: at_spi2_atk_req)
++  atkbridge_dep  = dependency('atk-bridge-2.0', version: at_spi2_atk_req, required: false)
+ 
+   backend_immodules += ['xim']
+ 
diff --git a/package/libgtk3/0001-no-gtk-doc.patch b/package/libgtk3/0001-no-gtk-doc.patch
deleted file mode 100644
index e1d320802..000000000
--- a/package/libgtk3/0001-no-gtk-doc.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Same patch as for systemd in commit
-http://git.buildroot.net/buildroot/commit/?id=7144f2f04b70553
-
-Fix deactivation of gtk-doc
-
-The tarball contains the Makefile for building documentation with gtk-doc,
-Unfortunately the AM_CONDITIONAL variable is not the correct one, which
-results in an error when running autoreconf.
-
-This patch fixes this issue.
-
-Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
-Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
-
---- a/gtk-doc.make
-+++ b/gtk-doc.make
-@@ -300,7 +300,7 @@
- #
- # Require gtk-doc when making dist
- #
--if HAVE_GTK_DOC
-+if ENABLE_GTK_DOC
- dist-check-gtkdoc: docs
- else
- dist-check-gtkdoc:
diff --git a/package/libgtk3/0004-Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch b/package/libgtk3/0002-Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch
similarity index 100%
rename from package/libgtk3/0004-Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch
rename to package/libgtk3/0002-Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch
diff --git a/package/libgtk3/0002-fix-introspection-check.patch b/package/libgtk3/0002-fix-introspection-check.patch
deleted file mode 100644
index 7edf7db71..000000000
--- a/package/libgtk3/0002-fix-introspection-check.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Fix HAVE_INTROSPECTION does not appear in AM_CONDITIONAL
-
-During autoreconf GOBJECT_INTROSPECTION_CHECK could not be resolved because we
-don't have introspection which provides its custom m4 macro. Reconfigure fails
-with:
-
-gdk/Makefile.am:196: error: HAVE_INTROSPECTION does not appear in AM_CONDITIONAL
-gtk/Makefile.am:1347: error: HAVE_INTROSPECTION does not appear in AM_CONDITIONAL
-
-We avoid to add a copy of introspection.m4 in the m4 directory of libgtk3 by
-adding a check, as performed in Systemd.
-
-Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -1690,7 +1690,10 @@
- # GObject introspection
- ##################################################
-
--GOBJECT_INTROSPECTION_CHECK(introspection_required_version)
-+m4_ifdef([GOBJECT_INTROSPECTION_CHECK],
-+         [GOBJECT_INTROSPECTION_CHECK(introspection_required_version)],
-+         [AM_CONDITIONAL([HAVE_INTROSPECTION], [false])
-+          enable_introspection=no])
-
- ##################################################
- # colord module
diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index bc8cacd9f..82ca68d2d 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -88,6 +88,7 @@ config BR2_PACKAGE_LIBGTK3_X11
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXRANDR
 	select BR2_PACKAGE_XLIB_LIBXRENDER
 	select BR2_PACKAGE_XLIB_LIBXI
 	help
diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index 1715b94e7..9fed2c9df 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.35.sha256sum
-sha256  ec10fe6d712ef0b3c63b5f932639c9d1ae99fce94f500f6f06965629fef60bd1  gtk+-3.24.35.tar.xz
+# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.36.sha256sum
+sha256  27a6ef157743350c807ffea59baa1d70226dbede82a5e953ffd58ea6059fe691  gtk+-3.24.36.tar.xz
 
 # Hash for license file:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index f277fce2e..30aa4f701 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.24
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).35
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).36
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPL-2.0+
@@ -13,69 +13,42 @@ LIBGTK3_LICENSE_FILES = COPYING
 LIBGTK3_CPE_ID_VENDOR = gnome
 LIBGTK3_CPE_ID_PRODUCT = gtk
 LIBGTK3_INSTALL_STAGING = YES
-LIBGTK3_AUTORECONF = YES
-
-LIBGTK3_CONF_ENV = \
-	ac_cv_path_GTK_UPDATE_ICON_CACHE=$(HOST_DIR)/bin/gtk-update-icon-cache \
-	ac_cv_path_GDK_PIXBUF_CSOURCE=$(HOST_DIR)/bin/gdk-pixbuf-csource \
-	PKG_CONFIG_FOR_BUILD=$(HOST_DIR)/bin/pkgconf
-
-LIBGTK3_CONF_OPTS = \
-	--disable-glibtest \
-	--enable-explicit-deps=no
-HOST_LIBGTK3_CONF_OPTS = --disable-introspection
-
-# Override pkg-config pkgdatadir variable, it needs the prefix
-LIBGTK3_MAKE_OPTS = \
-	WAYLAND_PROTOCOLS_DATADIR=$(STAGING_DIR)/usr/share/wayland-protocols \
-	LIBS=$(TARGET_NLS_LIBS)
 
 LIBGTK3_DEPENDENCIES = host-pkgconf host-libgtk3 atk libglib2 cairo pango \
 	gdk-pixbuf libepoxy $(TARGET_NLS_DEPENDENCIES)
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
-LIBGTK3_DEPENDENCIES += fontconfig xlib_libX11 xlib_libXext xlib_libXrender xlib_libXi
-
-LIBGTK3_CONF_OPTS += \
-	--enable-x11-backend \
-	--x-includes=$(STAGING_DIR)/usr/include/X11 \
-	--x-libraries=$(STAGING_DIR)/usr/lib
+LIBGTK3_DEPENDENCIES += fontconfig xlib_libX11 xlib_libXext xlib_libXrandr xlib_libXrender xlib_libXi
+LIBGTK3_CONF_OPTS += -Dx11_backend=true
 else
-LIBGTK3_CONF_OPTS += --disable-x11-backend
+LIBGTK3_CONF_OPTS += -Dx11_backend=false
 endif
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-LIBGTK3_CONF_OPTS += --enable-introspection
+LIBGTK3_CONF_OPTS += -Dintrospection=true
 LIBGTK3_DEPENDENCIES += gobject-introspection
 else
-LIBGTK3_CONF_OPTS += --disable-introspection
+LIBGTK3_CONF_OPTS += -Dintrospection=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_WAYLAND),y)
 LIBGTK3_DEPENDENCIES += wayland wayland-protocols libxkbcommon
-LIBGTK3_CONF_OPTS += --enable-wayland-backend
+LIBGTK3_CONF_OPTS += -Dwayland_backend=true
 else
-LIBGTK3_CONF_OPTS += --disable-wayland-backend
+LIBGTK3_CONF_OPTS += -Dwayland_backend=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_BROADWAY),y)
-LIBGTK3_CONF_OPTS += --enable-broadway-backend
+LIBGTK3_CONF_OPTS += -Dbroadway_backend=true
 else
-LIBGTK3_CONF_OPTS += --disable-broadway-backend
+LIBGTK3_CONF_OPTS += -Dbroadway_backend=false
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
-LIBGTK3_CONF_OPTS += --enable-xinerama
+LIBGTK3_CONF_OPTS += -Dxinerama=yes
 LIBGTK3_DEPENDENCIES += xlib_libXinerama
 else
-LIBGTK3_CONF_OPTS += --disable-xinerama
-endif
-
-ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
-LIBGTK3_CONF_OPTS += --enable-xrandr
-LIBGTK3_DEPENDENCIES += xlib_libXrandr
-else
-LIBGTK3_CONF_OPTS += --disable-xrandr
+LIBGTK3_CONF_OPTS += -Dxinerama=no
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
@@ -83,55 +56,35 @@ LIBGTK3_DEPENDENCIES += xlib_libXcursor
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXFIXES),y)
-LIBGTK3_CONF_OPTS += --enable-xfixes
 LIBGTK3_DEPENDENCIES += xlib_libXfixes
-else
-LIBGTK3_CONF_OPTS += --disable-xfixes
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXCOMPOSITE),y)
-LIBGTK3_CONF_OPTS += --enable-xcomposite
 LIBGTK3_DEPENDENCIES += xlib_libXcomposite
-else
-LIBGTK3_CONF_OPTS += --disable-xcomposite
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXDAMAGE),y)
-LIBGTK3_CONF_OPTS += --enable-xdamage
 LIBGTK3_DEPENDENCIES += xlib_libXdamage
-else
-LIBGTK3_CONF_OPTS += --disable-xdamage
-endif
-
-ifeq ($(BR2_PACKAGE_XLIB_LIBXKBFILE),y)
-LIBGTK3_CONF_OPTS += --enable-xkb
-LIBGTK3_DEPENDENCIES += xlib_libxkbfile
-else
-LIBGTK3_CONF_OPTS += --disable-xkb
 endif
 
 ifeq ($(BR2_PACKAGE_CUPS),y)
-LIBGTK3_CONF_OPTS += --enable-cups
-LIBGTK3_CONF_ENV += ac_cv_path_CUPS_CONFIG=$(STAGING_DIR)/usr/bin/cups-config
+LIBGTK3_CONF_OPTS += -Dprint_backends=cups
 LIBGTK3_DEPENDENCIES += cups
 else
-LIBGTK3_CONF_OPTS += --disable-cups
+LIBGTK3_CONF_OPTS += -Dprint_backends=auto
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_DEMO),y)
+LIBGTK3_CONF_OPTS += -Ddemos=true -Dexamples=true
 LIBGTK3_DEPENDENCIES += hicolor-icon-theme shared-mime-info
 else
-define LIBGTK3_REMOVE_DEMOS
-	$(RM) $(TARGET_DIR)/usr/bin/gtk3-demo \
-		$(TARGET_DIR)/usr/bin/gtk3-demo-application
-endef
-LIBGTK3_POST_INSTALL_TARGET_HOOKS += LIBGTK3_REMOVE_DEMOS
+LIBGTK3_CONF_OPTS += -Ddemos=false -Dexamples=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_TESTS),y)
-LIBGTK3_CONF_OPTS += --enable-installed-tests
+LIBGTK3_CONF_OPTS += -Dtests=true -Dinstalled_tests=true
 else
-LIBGTK3_CONF_OPTS += --disable-installed-tests
+LIBGTK3_CONF_OPTS += -Dtests=false -Dinstalled_tests=false
 endif
 
 define LIBGTK3_COMPILE_GLIB_SCHEMAS
@@ -198,5 +151,5 @@ define LIBGTK3_UPDATE_ICON_CACHE
 endef
 LIBGTK3_TARGET_FINALIZE_HOOKS += LIBGTK3_UPDATE_ICON_CACHE
 
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(meson-package))
+$(eval $(host-generic-package))
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
