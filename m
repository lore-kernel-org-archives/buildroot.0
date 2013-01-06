From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Jan 2013 22:29:34 +0100
Subject: [Buildroot] [PATCH 22/28] metacity: fix X.org dependencies
In-Reply-To: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <c5bc9e78b820037000023382ff4cd79758dbc501.1357507764.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Metacity is a X client application, so there is no reason to depend on
the X.org server. Instead, depend on the appropriate X libraries.

In addition to the X.org related dependencies, we also add the
host-libxml-parser-perl dependency, otherwise:

  checking for XML::Parser... configure: error: XML::Parser perl module is required for intltool
  make[1]: *** [/home/test/outputs/xorg/build/metacity-2.25.1/.stamp_configured] Error 1
  make: *** [all] Error 2

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/metacity/Config.in   |   10 ++++++++++
 package/metacity/metacity.mk |   12 +++++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/package/metacity/Config.in b/package/metacity/Config.in
index c483c44..833a091 100644
--- a/package/metacity/Config.in
+++ b/package/metacity/Config.in
@@ -2,5 +2,15 @@ config BR2_PACKAGE_METACITY
 	bool "metacity"
 	depends on BR2_PACKAGE_LIBGTK2
 	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBX11
+	# Metacity configure.ac pretends it can be built without
+	# Composite, but in reality, it doesn't build.
+	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
+	select BR2_PACKAGE_XLIB_LIBXFIXES
+	select BR2_PACKAGE_XLIB_LIBXRENDER
+	select BR2_PACKAGE_XLIB_LIBXDAMAGE
+	# We do not directly depend on Xft, but they are needed to get
+	# Xft support in Pango, which we require.
+	select BR2_PACKAGE_XLIB_LIBXFT
 	help
 	  Metacity is a window manager for the X Window System.
diff --git a/package/metacity/metacity.mk b/package/metacity/metacity.mk
index 990ec9f..aa78a7a 100644
--- a/package/metacity/metacity.mk
+++ b/package/metacity/metacity.mk
@@ -17,7 +17,17 @@ METACITY_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
 		--disable-dependency-tracking \
 		--disable-sm --disable-startup-notification
 
-METACITY_DEPENDENCIES = libgtk2 xserver_xorg-server
+METACITY_DEPENDENCIES = libgtk2 \
+	xlib_libX11 \
+	host-libxml-parser-perl \
+	xlib_libXcomposite \
+	xlib_libXfixes \
+	xlib_libXrender \
+	xlib_libXdamage
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
+METACITY_DEPENDENCIES += xlib_libXcursor
+endif
 
 define METACITY_INSTALL_XSESSION
 	install -D package/metacity/Xsession $(TARGET_DIR)/etc/X11/Xsession
-- 
1.7.9.5
