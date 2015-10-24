From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 24 Oct 2015 23:00:54 +0200
Subject: [Buildroot] [PATCH v5 14/36] package/efl/libefl: add X11 support
In-Reply-To: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1445720476-21517-15-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an option to enable X11 support in libecore without graphic
acceleration. libecore can use xlib or xcb support but the latter
in not recommended by efl developpers.

Also, set x-includes and x-libraries configure option for cross-compiling.
Previous efl versions had cross-compilation issue (poisoned paths)
if these options are not passed to configure script.

In order to remove the dependency on libXp wich is no longer bundled in
recent X11 release [1], backport an upstream patch [2] to remove xprint
usage.

[1] http://www.x.org/wiki/Releases/ModuleVersions
[2] https://git.enlightenment.org/core/efl.git/commit/?h=efl-1.15&id=434572355c7e929b84210b2f795634d38f13c913

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v4: rename libefl
    improve commit log
v3: fix typo
    remove xlib_libXp dependency (xprint), since libXp package has been
    removed from this series.
---
 .../libefl/0002-ecore_x-Remove-XPrint-usage.patch  | 153 +++++++++++++++++++++
 package/efl/libefl/Config.in                       |  41 ++++++
 package/efl/libefl/libefl.mk                       |  62 ++++++++-
 3 files changed, 255 insertions(+), 1 deletion(-)
 create mode 100644 package/efl/libefl/0002-ecore_x-Remove-XPrint-usage.patch

diff --git a/package/efl/libefl/0002-ecore_x-Remove-XPrint-usage.patch b/package/efl/libefl/0002-ecore_x-Remove-XPrint-usage.patch
new file mode 100644
index 0000000..4687e4c
--- /dev/null
+++ b/package/efl/libefl/0002-ecore_x-Remove-XPrint-usage.patch
@@ -0,0 +1,153 @@
+From 434572355c7e929b84210b2f795634d38f13c913 Mon Sep 17 00:00:00 2001
+From: Derek Foreman <derekf@osg.samsung.com>
+Date: Tue, 6 Oct 2015 13:13:01 -0400
+Subject: [PATCH] ecore_x: Remove XPrint usage
+
+Summary:
+Xprint has been deprecated since 2008.
+
+It's recently (August 2015) been removed from debian.
+
+Reviewers: zmike, devilhorns
+
+Subscribers: cedric
+
+Differential Revision: https://phab.enlightenment.org/D3150
+---
+ configure.ac                           |  1 -
+ src/lib/ecore_x/xlib/ecore_x.c         | 78 ----------------------------------
+ src/lib/ecore_x/xlib/ecore_x_private.h |  3 --
+ 3 files changed, 82 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9c17946..c34191c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3624,7 +3624,6 @@ if test "x${want_x11_xlib}" = "xyes" ; then
+    ECORE_CHECK_X_EXTENSION([Xdpms], [dpms.h], [Xext], [DPMSQueryExtension])
+    ECORE_CHECK_X_EXTENSION([Xfixes], [Xfixes.h], [Xfixes], [XFixesExpandRegion])
+    ECORE_CHECK_X_EXTENSION([Xinerama], [Xinerama.h], [Xinerama], [XineramaQueryScreens])
+-   ECORE_CHECK_X_EXTENSION([Xprint], [Print.h], [Xp], [XpQueryScreens])
+    ECORE_CHECK_X_EXTENSION([Xrandr], [Xrandr.h], [Xrandr], [XRRGetScreenResourcesCurrent])
+    ECORE_CHECK_X_EXTENSION([Xrender], [Xrender.h], [Xrender], [XRenderFindVisualFormat])
+    ECORE_CHECK_X_EXTENSION([Xtest], [XTest.h], [Xtst], [XTestFakeKeyEvent])
+diff --git a/src/lib/ecore_x/xlib/ecore_x.c b/src/lib/ecore_x/xlib/ecore_x.c
+index 096f64d..8e2057e 100644
+--- a/src/lib/ecore_x/xlib/ecore_x.c
++++ b/src/lib/ecore_x/xlib/ecore_x.c
+@@ -1219,9 +1219,6 @@ ecore_x_window_root_list(int *num_ret)
+ {
+    int num, i;
+    Ecore_X_Window *roots;
+-#ifdef ECORE_XPRINT
+-   int xp_base, xp_err_base;
+-#endif /* ifdef ECORE_XPRINT */
+ 
+    if (!num_ret)
+      return NULL;
+@@ -1229,80 +1226,6 @@ ecore_x_window_root_list(int *num_ret)
+    *num_ret = 0;
+ 
+    LOGFN(__FILE__, __LINE__, __FUNCTION__);
+-#ifdef ECORE_XPRINT
+-   num = ScreenCount(_ecore_x_disp);
+-   if (XpQueryExtension(_ecore_x_disp, &xp_base, &xp_err_base))
+-     {
+-        Screen **ps = NULL;
+-        int psnum = 0;
+-
+-        ps = XpQueryScreens(_ecore_x_disp, &psnum);
+-        if (ps)
+-          {
+-             int overlap, j;
+-
+-             overlap = 0;
+-             for (i = 0; i < num; i++)
+-               {
+-                  for (j = 0; j < psnum; j++)
+-                    {
+-                       if (ScreenOfDisplay(_ecore_x_disp, i) == ps[j])
+-                         overlap++;
+-                    }
+-               }
+-             roots = malloc(MAX((num - overlap) * sizeof(Ecore_X_Window), 1));
+-             if (roots)
+-               {
+-                  int k;
+-
+-                  k = 0;
+-                  for (i = 0; i < num; i++)
+-                    {
+-                       int is_print;
+-
+-                       is_print = 0;
+-                       for (j = 0; j < psnum; j++)
+-                         {
+-                            if (ScreenOfDisplay(_ecore_x_disp, i) == ps[j])
+-                              {
+-                                 is_print = 1;
+-                                 break;
+-                              }
+-                         }
+-                       if (!is_print)
+-                         {
+-                            roots[k] = RootWindow(_ecore_x_disp, i);
+-                            k++;
+-                         }
+-                    }
+-                  *num_ret = k;
+-               }
+-
+-             XFree(ps);
+-          }
+-        else
+-          {
+-             roots = malloc(num * sizeof(Ecore_X_Window));
+-             if (!roots)
+-               return NULL;
+-
+-             *num_ret = num;
+-             for (i = 0; i < num; i++)
+-               roots[i] = RootWindow(_ecore_x_disp, i);
+-          }
+-     }
+-   else
+-     {
+-        roots = malloc(num * sizeof(Ecore_X_Window));
+-        if (!roots)
+-          return NULL;
+-
+-        *num_ret = num;
+-        for (i = 0; i < num; i++)
+-          roots[i] = RootWindow(_ecore_x_disp, i);
+-     }
+-
+-#else /* ifdef ECORE_XPRINT */
+    num = ScreenCount(_ecore_x_disp);
+    roots = malloc(num * sizeof(Ecore_X_Window));
+    if (!roots)
+@@ -1311,7 +1234,6 @@ ecore_x_window_root_list(int *num_ret)
+    *num_ret = num;
+    for (i = 0; i < num; i++)
+      roots[i] = RootWindow(_ecore_x_disp, i);
+-#endif /* ifdef ECORE_XPRINT */
+    return roots;
+ }
+ 
+diff --git a/src/lib/ecore_x/xlib/ecore_x_private.h b/src/lib/ecore_x/xlib/ecore_x_private.h
+index 97b3858..07c09fb 100644
+--- a/src/lib/ecore_x/xlib/ecore_x_private.h
++++ b/src/lib/ecore_x/xlib/ecore_x_private.h
+@@ -19,9 +19,6 @@
+ #ifdef ECORE_XCURSOR
+ #include <X11/Xcursor/Xcursor.h>
+ #endif /* ifdef ECORE_XCURSOR */
+-#ifdef ECORE_XPRINT
+-#include <X11/extensions/Print.h>
+-#endif /* ifdef ECORE_XPRINT */
+ #ifdef ECORE_XINERAMA
+ #include <X11/extensions/Xinerama.h>
+ #endif /* ifdef ECORE_XINERAMA */
+-- 
+2.4.3
+
diff --git a/package/efl/libefl/Config.in b/package/efl/libefl/Config.in
index 53adea2..8356fa1 100644
--- a/package/efl/libefl/Config.in
+++ b/package/efl/libefl/Config.in
@@ -42,6 +42,47 @@ comment "libecore video support"
 config BR2_PACKAGE_LIBEFL_FB
 	bool "libecore framebuffer support"
 
+config BR2_PACKAGE_LIBEFL_X
+	bool "libecore X support"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+
+if BR2_PACKAGE_LIBEFL_X
+
+choice
+	prompt "select libecore XLIB/XCB support"
+
+config BR2_PACKAGE_LIBEFL_X_XLIB
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
+config BR2_PACKAGE_LIBEFL_X_XCB
+	bool "libecore XCB support"
+	depends on !BR2_PACKAGE_LIBEFL_RECOMMENDED_CONFIG
+	select BR2_PACKAGE_LIBXCB
+	select BR2_PACKAGE_XCB_UTIL_IMAGE # xcb-image.pc
+	select BR2_PACKAGE_XCB_UTIL_KEYSYMS # xcb-keysyms.pc
+	select BR2_PACKAGE_XCB_UTIL_RENDERUTIL # xcb-renderutil.pc
+	select BR2_PACKAGE_XCB_UTIL_WM # xcb-icccm.pc
+	select BR2_PACKAGE_XLIB_LIBX11
+
+comment "for libecore XCB support disable recommended configurations"
+	depends on BR2_PACKAGE_LIBEFL_RECOMMENDED_CONFIG
+
+endchoice
+
+endif # BR2_PACKAGE_LIBEFL_X
+
 comment "libevas loaders"
 
 config BR2_PACKAGE_LIBEFL_PNG
diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
index e53470d..6a1a8ae 100644
--- a/package/efl/libefl/libefl.mk
+++ b/package/efl/libefl/libefl.mk
@@ -18,6 +18,7 @@ LIBEFL_DEPENDENCIES = host-pkgconf host-libefl dbus freetype jpeg libcurl lua \
 
 # regenerate the configure script:
 # https://phab.enlightenment.org/T2718
+# configure.ac patched by 0002-ecore_x-Remove-XPrint-usage.patch
 LIBEFL_AUTORECONF = YES
 LIBEFL_GETTEXTIZE = YES
 
@@ -30,7 +31,7 @@ LIBEFL_CONF_OPTS = \
 	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
 	--disable-cxx-bindings \
 	--enable-lua-old \
-	--with-x11=none
+	--enable-lua-old
 
 # Disable untested configuration warning.
 ifeq ($(BR2_PACKAGE_LIBEFL_RECOMMENDED_CONFIG),)
@@ -172,6 +173,65 @@ else
 LIBEFL_CONF_OPTS += --enable-fb=no
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEFL_X),y)
+LIBEFL_CONF_OPTS += --with-x=$(STAGING_DIR) \
+	--x-includes=$(STAGING_DIR)/usr/include \
+	--x-libraries=$(STAGING_DIR)/usr/lib \
+	--with-opengl=none
+
+LIBEFL_DEPENDENCIES += \
+	xlib_libX11 \
+	xlib_libXext
+else
+LIBEFL_CONF_OPTS += --with-x=no \
+	--with-x11=none
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEFL_X_XLIB),y)
+LIBEFL_DEPENDENCIES += \
+	xlib_libX11 \
+	xlib_libXcomposite \
+	xlib_libXcursor \
+	xlib_libXdamage \
+	xlib_libXext \
+	xlib_libXinerama \
+	xlib_libXrandr \
+	xlib_libXrender \
+	xlib_libXScrnSaver \
+	xlib_libXtst
+LIBEFL_CONF_OPTS += --with-x11=xlib
+endif
+
+# xcb-util-image to provide xcb-image.pc
+# xcb-util-renderutil to provide xcb-renderutil.pc
+# xcb-util-wm to provide xcb-icccm.pc
+# xcb-util-keysyms to provide xcb-keysyms.pc
+ifeq ($(BR2_PACKAGE_LIBEFL_X_XCB),y)
+LIBEFL_DEPENDENCIES += libxcb \
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
+LIBEFL_CONF_OPTS += --with-x11=xcb
+endif
+
 # image loader: handle only loaders that requires dependencies.
 # All other loaders are builded by default statically.
 ifeq ($(BR2_PACKAGE_LIBEFL_PNG),y)
-- 
2.4.3
