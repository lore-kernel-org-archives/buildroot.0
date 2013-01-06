From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Jan 2013 22:29:30 +0100
Subject: [Buildroot] [PATCH 18/28] libgtk2: add support for some optional X
	dependencies
In-Reply-To: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357507764.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f81b3c2a5b24ca73365e9b40c83c83cd04f544ca.1357507764.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libgtk2 can optionally use a number of features from additional X
extensions, so we add support for those, to ensure that Gtk gets built
after those extensions if they have been enabled in the Buildroot
configuration.

The extensions are Xinerama, Xinput, Xrandr, Xcursor, Xfixes,
Xcomposite and Xdamage.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgtk2/libgtk2.mk |   35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

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
-- 
1.7.9.5
