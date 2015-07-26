From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 26 Jul 2015 20:55:28 +0200
Subject: [Buildroot] [RFC 18/37] package/efl: add X11 support
In-Reply-To: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
References: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437936947-17632-19-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also, set x-includes and x-libraries configure option for cross-compiling.

Previous efl versions had cross-compilation issue (poisoned paths)
if these options are not passed to configure script.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/efl/Config.in | 41 +++++++++++++++++++++++++++++++++
 package/efl/efl.mk    | 63 +++++++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 102 insertions(+), 2 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index d36a38e..99e7c07 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -42,6 +42,47 @@ comment "libecore video support"
 config BR2_PACKAGE_EFL_FB
 	bool "libecore framebuffer support"
 
+config BR2_PACKAGE_EFL_X
+	bool "libecore X support"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+
+if BR2_PACKAGE_EFL_X
+
+choice
+	prompt "select libecore XLIB/XCB support"
+
+config BR2_PACKAGE_EFL_X_XLIB
+	bool "libecore XLIB support"
+	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
+	select BR2_PACKAGE_XLIB_LIBXCURSOR
+	select BR2_PACKAGE_XLIB_LIBXDAMAGE
+	select BR2_PACKAGE_XLIB_LIBXINERAMA
+	select BR2_PACKAGE_XLIB_LIBXP
+	select BR2_PACKAGE_XLIB_LIBXRANDR
+	select BR2_PACKAGE_XLIB_LIBXRENDER
+	select BR2_PACKAGE_XLIB_LIBXSCRNSAVER
+	select BR2_PACKAGE_XLIB_LIBXTST
+	select BR2_PACKAGE_XPROTO_GLPROTO
+
+config BR2_PACKAGE_EFL_X_XCB
+	bool "libecore XCB support"
+	depends on !BR2_PACKAGE_EFL_RECOMMENDED_CONFIG
+	select BR2_PACKAGE_LIBXCB
+	select BR2_PACKAGE_XCB_UTIL_IMAGE # xcb-image.pc
+	select BR2_PACKAGE_XCB_UTIL_KEYSYMS # xcb-keysyms.pc
+	select BR2_PACKAGE_XCB_UTIL_RENDERUTIL # xcb-renderutil.pc
+	select BR2_PACKAGE_XCB_UTIL_WM # xcb-icccm.pc
+	select BR2_PACKAGE_XLIB_LIBX11
+
+comment "for libecore XCB support disable recommanded configurations"
+	depends on BR2_PACKAGE_EFL_RECOMMENDED_CONFIG
+
+endchoice
+
+endif # BR2_PACKAGE_EFL_X
+
 comment "libevas loaders"
 
 config BR2_PACKAGE_EFL_PNG
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 201e578..f283108 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -23,8 +23,7 @@ EFL_CONF_OPTS = \
 	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
 	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
 	--disable-cxx-bindings \
-	--enable-lua-old \
-	--with-x11=none
+	--enable-lua-old
 
 # Disable untested configuration warning.
 ifeq ($(BR2_PACKAGE_EFL_RECOMMENDED_CONFIG),)
@@ -165,6 +164,66 @@ else
 EFL_CONF_OPTS += --enable-fb=no
 endif
 
+ifeq ($(BR2_PACKAGE_EFL_X),y)
+EFL_CONF_OPTS += --with-x=$(STAGING_DIR) \
+	--x-includes=$(STAGING_DIR)/usr/include \
+	--x-libraries=$(STAGING_DIR)/usr/lib \
+	--with-opengl=none
+
+EFL_DEPENDENCIES += \
+	xlib_libX11 \
+	xlib_libXext
+else
+EFL_CONF_OPTS += --with-x=no \
+	--with-x11=none
+endif
+
+ifeq ($(BR2_PACKAGE_EFL_X_XLIB),y)
+EFL_DEPENDENCIES += \
+	xlib_libX11 \
+	xlib_libXcomposite \
+	xlib_libXcursor \
+	xlib_libXdamage \
+	xlib_libXext \
+	xlib_libXinerama \
+	xlib_libXp \
+	xlib_libXrandr \
+	xlib_libXrender \
+	xlib_libXScrnSaver \
+	xlib_libXtst
+EFL_CONF_OPTS += --with-x11=xlib
+endif
+
+# xcb-util-image to provide xcb-image.pc
+# xcb-util-renderutil to provide xcb-renderutil.pc
+# xcb-util-wm to provide xcb-icccm.pc
+# xcb-util-keysyms to provide xcb-keysyms.pc
+ifeq ($(BR2_PACKAGE_EFL_X_XCB),y)
+EFL_DEPENDENCIES += libxcb \
+	xcb-util-image \
+	xcb-util-keysyms \
+	xcb-util-renderutil \
+	xcb-util-wm
+# You have chosen to use XCB instead of Xlib. It is a myth that XCB
+# is amazingly faster than Xlib (when used sensibly). It can be
+# faster in a few corner cases on startup of an app, but it comes
+# with many downsides. One of those is more complex code inside
+# ecore_x, which is far less tested in XCB mode than Xlib. Also
+# the big catch is that OpenGL support basically requires Xlib anyway
+# so if you want OpenGL in X11, you need Xlib regardless and so you
+# gain nothing really in terms of speed and no savings in memory
+# because Xlib is still linked, loaded and used, BUT instead you
+# have OpenGL drivers working with an hybrid XCB/Xlib (mostly XCB)
+# toolkit and this is basically never tested by anyone working on
+# the OpenGL drivers, so you will have bugs. Do not enable XCB
+# and use OpenGL. XCB is only useful if you wish to shave a few Kb
+# off the memory footprint of a whole system and live with less
+# tested code, and possibly unimplemented features in ecore_x. To
+# remove the XCB setup, remove the --with-x11=xcb option to
+# configure.
+EFL_CONF_OPTS += --with-x11=xcb
+endif
+
 # image loader: handle only loaders that requires dependencies.
 # All other loaders are builded by default statically.
 ifeq ($(BR2_PACKAGE_EFL_PNG),y)
-- 
2.4.3
