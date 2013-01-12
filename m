From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 12 Jan 2013 22:44:51 +0100
Subject: [Buildroot] [git commit] libgtk2: replace dependency on X.org
	server by dependency on libraries
Message-ID: <20130112215437.8E443996EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0e55b8dc8ac082ab8adb48dc790a4105a7630304
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libgtk2 is a X client library, so it doesn't make sense for it to
depend on the X.org server. Instead, it should depend on the X client
libraries.

This patch therefore replaces the dependency on the X server by a
dependency on libX11, libXext, libXrender and fontconfig, that are the
mandatory requirements to build the X backend of Gtk.

[Peter: don't add an empty line before gtk demo help text]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libgtk2/Config.in  |    4 ++++
 package/libgtk2/libgtk2.mk |    3 ++-
 2 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
index efaf12f..3e8cf75 100644
--- a/package/libgtk2/Config.in
+++ b/package/libgtk2/Config.in
@@ -8,6 +8,10 @@ config BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_PANGO
 	select BR2_PACKAGE_GDK_PIXBUF
+	select BR2_PACKAGE_FONTCONFIG if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXRENDER if BR2_PACKAGE_XORG7
 	depends on BR2_PACKAGE_XORG7||BR2_PACKAGE_DIRECTFB
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 9adb6b9..3dcecbf 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -82,7 +82,8 @@ ifeq ($(BR2_PACKAGE_XORG7),y)
 		--x-includes=$(STAGING_DIR)/usr/include/X11 \
 		--x-libraries=$(STAGING_DIR)/usr/lib \
 		--with-gdktarget=x11
-	LIBGTK2_DEPENDENCIES += xlib_libXcomposite xserver_xorg-server
+	LIBGTK2_DEPENDENCIES += xlib_libXcomposite fontconfig xlib_libX11 \
+		xlib_libXext xlib_libXrender
 else
 	LIBGTK2_CONF_OPT += --without-x
 endif
