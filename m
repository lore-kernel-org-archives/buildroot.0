From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 12 Jan 2013 22:45:20 +0100
Subject: [Buildroot] [git commit] libgtk2: add support for some optional X
	dependencies
Message-ID: <20130112215437.B1E56996EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7c8cd9f55469ad3121f282ab30caf72d5218e401
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libgtk2 can optionally use a number of features from additional X
extensions, so we add support for those, to ensure that Gtk gets built
after those extensions if they have been enabled in the Buildroot
configuration.

The extensions are Xinerama, Xinput, Xrandr, Xcursor, Xfixes,
Xcomposite and Xdamage.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libgtk2/libgtk2.mk |   35 +++++++++++++++++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 3dcecbf..e6a9d84 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -84,6 +84,41 @@ ifeq ($(BR2_PACKAGE_XORG7),y)
 		--with-gdktarget=x11
 	LIBGTK2_DEPENDENCIES += xlib_libXcomposite fontconfig xlib_libX11 \
 		xlib_libXext xlib_libXrender
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
+	LIBGTK2_CONF_OPT += --enable-xinerama
+	LIBGTK2_DEPENDENCIES += xlib_libXinerama
+else
+	LIBGTK2_CONF_OPT += --disable-xinerama
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXI),y)
+	LIBGTK2_CONF_OPT += --with-xinput=yes
+	LIBGTK2_DEPENDENCIES += xlib_libXi
+else
+	LIBGTK2_CONF_OPT += --with-xinput=no
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
+	LIBGTK2_DEPENDENCIES += xlib_libXrandr
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
+	LIBGTK2_DEPENDENCIES += xlib_libXcursor
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXFIXES),y)
+	LIBGTK2_DEPENDENCIES += xlib_libXfixes
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXCOMPOSITE),y)
+	LIBGTK2_DEPENDENCIES += xlib_libXcomposite
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXDAMAGE),y)
+	LIBGTK2_DEPENDENCIES += xlib_libXdamage
+endif
+
 else
 	LIBGTK2_CONF_OPT += --without-x
 endif
