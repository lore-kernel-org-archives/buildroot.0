From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 15 Oct 2011 23:18:50 +0200
Subject: [Buildroot] [git commit] gmpc: bump to version 11.8.16
Message-ID: <20111015213659.8B6428D520@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2da2281cbcdc67ffb9419e76650f3636a5313d62
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gmpc/Config.in |    8 ++++++--
 package/gmpc/gmpc.mk   |   21 +++++++--------------
 2 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/package/gmpc/Config.in b/package/gmpc/Config.in
index 7bfe611..f86945c 100644
--- a/package/gmpc/Config.in
+++ b/package/gmpc/Config.in
@@ -2,14 +2,18 @@ config BR2_PACKAGE_GMPC
 	bool "gmpc"
 	depends on BR2_PACKAGE_LIBGTK2
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBMPD
-	select BR2_PACKAGE_LIBCURL
-	select BR2_PACKAGE_LIBGLADE
+	select BR2_PACKAGE_LIBSOUP
 	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_XLIB_LIBICE
+	select BR2_PACKAGE_XLIB_LIBSM
+	select BR2_PACKAGE_XLIB_LIBX11
 	help
 	  Gnome Music Player Client is a GNOME/GTK2.2 client for
 	  Music Player Daemon.
diff --git a/package/gmpc/gmpc.mk b/package/gmpc/gmpc.mk
index d6b6e93..1db5346 100644
--- a/package/gmpc/gmpc.mk
+++ b/package/gmpc/gmpc.mk
@@ -3,21 +3,14 @@
 # gmpc
 #
 #############################################################
-GMPC_VERSION = 0.17.0
-GMPC_SOURCE = gmpc-$(GMPC_VERSION).tar.gz
-GMPC_SITE = http://download.sarine.nl/download/Programs/gmpc/$(GMPC_VERSION)/
-GMPC_CONF_ENV = ac_cv_lib_curl_curl_global_init=yes \
-		ac_cv_path_GOB2=$(GOB2_HOST_BINARY)
-GMPC_CONF_OPT = --disable-mmkeys
 
-GMPC_DEPENDENCIES = libglib2 libgtk2 libglade libcurl libmpd host-gob2 host-intltool \
+GMPC_VERSION = 11.8.16
+GMPC_SITE = http://download.sarine.nl/Programs/gmpc/$(GMPC_VERSION)
+GMPC_CONF_ENV = ac_cv_path_GOB2=$(GOB2_HOST_BINARY)
+GMPC_CONF_OPT = --disable-mmkeys --disable-unique
+GMPC_DEPENDENCIES = host-gob2 host-intltool host-pkg-config host-vala \
+	libglib2 libgtk2 libmpd libsoup sqlite \
+	xlib_libICE xlib_libSM xlib_libX11 \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
 
-ifeq ($(BR2_PACKAGE_XLIB_LIBSM),y)
-GMPC_DEPENDENCIES += xlib_libSM
-GMPC_CONF_OPT += --enable-sm
-else
-GMPC_CONF_OPT += --disable-sm
-endif
-
 $(eval $(call AUTOTARGETS))
