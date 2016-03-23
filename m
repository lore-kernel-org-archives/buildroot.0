From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 23 Mar 2016 18:55:22 -0300
Subject: [Buildroot] [PATCH 4/4] libgtk3: bump to version 3.20.0
In-Reply-To: <1458770122-8852-1-git-send-email-gustavo@zacarias.com.ar>
References: <1458770122-8852-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1458770122-8852-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libgtk3/Config.in    |  1 +
 package/libgtk3/libgtk3.hash |  4 ++--
 package/libgtk3/libgtk3.mk   | 10 +++++++---
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index cf35f84..77ea394 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -66,6 +66,7 @@ config BR2_PACKAGE_LIBGTK3_WAYLAND
 	default y
 	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
 	select BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS
 	select BR2_PACKAGE_LIBXKBCOMMON
 	help
 	  This enables the Wayland backend for GDK.
diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index 69118eb..957f0af 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.18/gtk+-3.18.9.sha256sum
-sha256	783d7f8b00f9b4224cc94d7da885a67598e711c2d6d79c9c873c6b203e83acbd	gtk+-3.18.9.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.20/gtk+-3.20.0.sha256sum
+sha256	1c3d3a4a6e959ec8636ccb074bcdb8fa25c81ec56fbc70de6a3f5ef83ba6d803	gtk+-3.20.0.tar.xz
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 8211233..596f236 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGTK3_VERSION_MAJOR = 3.18
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).9
+LIBGTK3_VERSION_MAJOR = 3.20
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).0
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPLv2+
@@ -24,6 +24,10 @@ LIBGTK3_CONF_OPTS = \
 	--enable-gtk2-dependency \
 	--disable-introspection
 
+# Override pkg-config pkgdatadir variable, it needs the prefix
+LIBGTK3_MAKE_OPTS = \
+	WAYLAND_PROTOCOLS_DATADIR=$(STAGING_DIR)/usr/share/wayland-protocols
+
 LIBGTK3_DEPENDENCIES = host-pkgconf host-libgtk3 atk libglib2 cairo pango gdk-pixbuf libepoxy
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
@@ -38,7 +42,7 @@ LIBGTK3_CONF_OPTS += --disable-x11-backend
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_WAYLAND),y)
-LIBGTK3_DEPENDENCIES += wayland libxkbcommon
+LIBGTK3_DEPENDENCIES += wayland wayland-protocols libxkbcommon
 LIBGTK3_CONF_OPTS += --enable-wayland-backend
 else
 LIBGTK3_CONF_OPTS += --disable-wayland-backend
-- 
2.7.3
