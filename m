From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 Dec 2015 19:45:38 -0300
Subject: [Buildroot] [PATCH] xutil_util-macros: move outside x11r7 scope
Message-ID: <1449096338-8006-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move to package/util-macros and rename all symbols.
They don't really require x11r7 infrastructure and are in fact needed by
libepoxy which can be made x11r7-less.

Also add missing select in xfont_encoding for util-macros.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                                       |  1 +
 package/util-macros/Config.in                           |  4 ++++
 .../util-macros.hash}                                   |  0
 package/util-macros/util-macros.mk                      | 16 ++++++++++++++++
 package/x11r7/Config.in                                 |  1 -
 package/x11r7/libepoxy/Config.in                        |  2 +-
 package/x11r7/libepoxy/libepoxy.mk                      |  2 +-
 package/x11r7/xfont_encodings/Config.in                 |  1 +
 package/x11r7/xfont_encodings/xfont_encodings.mk        |  2 +-
 package/x11r7/xlib_libX11/Config.in                     |  2 +-
 package/x11r7/xlib_libX11/xlib_libX11.mk                |  2 +-
 package/x11r7/xlib_libXau/Config.in                     |  2 +-
 package/x11r7/xlib_libXau/xlib_libXau.mk                |  2 +-
 package/x11r7/xlib_libXdmcp/Config.in                   |  2 +-
 package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk            |  2 +-
 package/x11r7/xproto_presentproto/Config.in             |  2 +-
 .../x11r7/xproto_presentproto/xproto_presentproto.mk    |  2 +-
 package/x11r7/xserver_xorg-server/Config.in             |  2 +-
 .../x11r7/xserver_xorg-server/xserver_xorg-server.mk    |  2 +-
 package/x11r7/xutil_util-macros/Config.in               |  4 ----
 package/x11r7/xutil_util-macros/xutil_util-macros.mk    | 17 -----------------
 21 files changed, 35 insertions(+), 35 deletions(-)
 create mode 100644 package/util-macros/Config.in
 rename package/{x11r7/xutil_util-macros/xutil_util-macros.hash => util-macros/util-macros.hash} (100%)
 create mode 100644 package/util-macros/util-macros.mk
 delete mode 100644 package/x11r7/xutil_util-macros/Config.in
 delete mode 100644 package/x11r7/xutil_util-macros/xutil_util-macros.mk

diff --git a/package/Config.in b/package/Config.in
index f78baa3..8c109c9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1222,6 +1222,7 @@ menu "Miscellaneous"
 	source "package/qpdf/Config.in"
 	source "package/shared-mime-info/Config.in"
 	source "package/snowball-init/Config.in"
+	source "package/util-macros/Config.in"
 	source "package/wine/Config.in"
 endmenu
 
diff --git a/package/util-macros/Config.in b/package/util-macros/Config.in
new file mode 100644
index 0000000..de0b5bb
--- /dev/null
+++ b/package/util-macros/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_UTIL_MACROS
+	bool "util-macros"
+	help
+	  X.Org autotools utility macros
diff --git a/package/x11r7/xutil_util-macros/xutil_util-macros.hash b/package/util-macros/util-macros.hash
similarity index 100%
rename from package/x11r7/xutil_util-macros/xutil_util-macros.hash
rename to package/util-macros/util-macros.hash
diff --git a/package/util-macros/util-macros.mk b/package/util-macros/util-macros.mk
new file mode 100644
index 0000000..27884db
--- /dev/null
+++ b/package/util-macros/util-macros.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# util-macros
+#
+################################################################################
+
+UTIL_MACROS_VERSION = 1.19.0
+UTIL_MACROS_SOURCE = util-macros-$(UTIL_MACROS_VERSION).tar.bz2
+UTIL_MACROS_SITE = http://xorg.freedesktop.org/releases/individual/util
+UTIL_MACROS_LICENSE = MIT
+UTIL_MACROS_LICENSE_FILES = COPYING
+UTIL_MACROS_INSTALL_STAGING = YES
+UTIL_MACROS_INSTALL_TARGET = NO
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 4e996fc..6b9f418 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -264,7 +264,6 @@ if BR2_PACKAGE_XORG7
 	endmenu
 	menu "X11R7 Utilities"
 		source package/x11r7/xutil_makedepend/Config.in
-		source package/x11r7/xutil_util-macros/Config.in
 		source package/x11r7/mcookie/Config.in
 	endmenu
 	menu "X11R7 Other data"
diff --git a/package/x11r7/libepoxy/Config.in b/package/x11r7/libepoxy/Config.in
index 5628bf7..05d421c 100644
--- a/package/x11r7/libepoxy/Config.in
+++ b/package/x11r7/libepoxy/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBEPOXY
 	bool "epoxy"
 	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XUTIL_UTIL_MACROS
+	select BR2_PACKAGE_UTIL_MACROS
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	help
 	  Epoxy is a library for handling OpenGL function pointer
diff --git a/package/x11r7/libepoxy/libepoxy.mk b/package/x11r7/libepoxy/libepoxy.mk
index 58b094a..d093611 100644
--- a/package/x11r7/libepoxy/libepoxy.mk
+++ b/package/x11r7/libepoxy/libepoxy.mk
@@ -8,7 +8,7 @@ LIBEPOXY_VERSION = v1.2
 LIBEPOXY_SITE = $(call github,anholt,libepoxy,$(LIBEPOXY_VERSION))
 LIBEPOXY_INSTALL_STAGING = YES
 LIBEPOXY_AUTORECONF = YES
-LIBEPOXY_DEPENDENCIES = xlib_libX11 xutil_util-macros libegl \
+LIBEPOXY_DEPENDENCIES = xlib_libX11 util-macros libegl \
 	$(if $(BR2_PACKAGE_HAS_LIBGL),libgl)
 LIBEPOXY_LICENSE = MIT
 LIBEPOXY_LICENSE_FILES = COPYING
diff --git a/package/x11r7/xfont_encodings/Config.in b/package/x11r7/xfont_encodings/Config.in
index af40da1..7fcdf60 100644
--- a/package/x11r7/xfont_encodings/Config.in
+++ b/package/x11r7/xfont_encodings/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_XFONT_ENCODINGS
 	bool "encodings"
+	select BR2_PACKAGE_UTIL_MACROS
 	help
 	  No description available
diff --git a/package/x11r7/xfont_encodings/xfont_encodings.mk b/package/x11r7/xfont_encodings/xfont_encodings.mk
index 568dbcb..511786a 100644
--- a/package/x11r7/xfont_encodings/xfont_encodings.mk
+++ b/package/x11r7/xfont_encodings/xfont_encodings.mk
@@ -10,7 +10,7 @@ XFONT_ENCODINGS_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_ENCODINGS_LICENSE = Public Domain
 XFONT_ENCODINGS_LICENSE_FILES = COPYING
 
-XFONT_ENCODINGS_DEPENDENCIES = host-xapp_mkfontscale host-pkgconf xutil_util-macros
+XFONT_ENCODINGS_DEPENDENCIES = host-xapp_mkfontscale host-pkgconf util-macros
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_libX11/Config.in b/package/x11r7/xlib_libX11/Config.in
index 3ad8d00..82a209e 100644
--- a/package/x11r7/xlib_libX11/Config.in
+++ b/package/x11r7/xlib_libX11/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_XLIB_LIBX11
 	bool "libX11"
 	select BR2_PACKAGE_LIBXCB
-	select BR2_PACKAGE_XUTIL_UTIL_MACROS
+	select BR2_PACKAGE_UTIL_MACROS
 	select BR2_PACKAGE_XLIB_XTRANS
 	select BR2_PACKAGE_XLIB_LIBXAU
 	select BR2_PACKAGE_XLIB_LIBXDMCP
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index fc19aa1..2fcd2e8 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -12,7 +12,7 @@ XLIB_LIBX11_LICENSE_FILES = COPYING
 XLIB_LIBX11_INSTALL_STAGING = YES
 XLIB_LIBX11_DEPENDENCIES = \
 	libxcb \
-	xutil_util-macros \
+	util-macros \
 	xlib_xtrans \
 	xlib_libXau \
 	xlib_libXdmcp \
diff --git a/package/x11r7/xlib_libXau/Config.in b/package/x11r7/xlib_libXau/Config.in
index a220f01..23a193a 100644
--- a/package/x11r7/xlib_libXau/Config.in
+++ b/package/x11r7/xlib_libXau/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_XLIB_LIBXAU
 	bool "libXau"
 	select BR2_PACKAGE_XPROTO_XPROTO
-	select BR2_PACKAGE_XUTIL_UTIL_MACROS
+	select BR2_PACKAGE_UTIL_MACROS
 	help
 	  X.Org Xau library
diff --git a/package/x11r7/xlib_libXau/xlib_libXau.mk b/package/x11r7/xlib_libXau/xlib_libXau.mk
index 8ef48e4..7969688 100644
--- a/package/x11r7/xlib_libXau/xlib_libXau.mk
+++ b/package/x11r7/xlib_libXau/xlib_libXau.mk
@@ -10,7 +10,7 @@ XLIB_LIBXAU_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXAU_LICENSE = MIT
 XLIB_LIBXAU_LICENSE_FILES = COPYING
 XLIB_LIBXAU_INSTALL_STAGING = YES
-XLIB_LIBXAU_DEPENDENCIES = host-pkgconf xutil_util-macros xproto_xproto
+XLIB_LIBXAU_DEPENDENCIES = host-pkgconf util-macros xproto_xproto
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xlib_libXdmcp/Config.in b/package/x11r7/xlib_libXdmcp/Config.in
index 218ff15..7f82f9f 100644
--- a/package/x11r7/xlib_libXdmcp/Config.in
+++ b/package/x11r7/xlib_libXdmcp/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_XLIB_LIBXDMCP
 	bool "libXdmcp"
-	select BR2_PACKAGE_XUTIL_UTIL_MACROS
+	select BR2_PACKAGE_UTIL_MACROS
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
 	  X.Org Xdmcp library
diff --git a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
index 119c018..47f44ca 100644
--- a/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
+++ b/package/x11r7/xlib_libXdmcp/xlib_libXdmcp.mk
@@ -10,7 +10,7 @@ XLIB_LIBXDMCP_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXDMCP_LICENSE = MIT
 XLIB_LIBXDMCP_LICENSE_FILES = COPYING
 XLIB_LIBXDMCP_INSTALL_STAGING = YES
-XLIB_LIBXDMCP_DEPENDENCIES = xutil_util-macros xproto_xproto
+XLIB_LIBXDMCP_DEPENDENCIES = util-macros xproto_xproto
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/x11r7/xproto_presentproto/Config.in b/package/x11r7/xproto_presentproto/Config.in
index 586008d..4a638ab 100644
--- a/package/x11r7/xproto_presentproto/Config.in
+++ b/package/x11r7/xproto_presentproto/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XPROTO_PRESENTPROTO
 	bool "presentproto"
-	select BR2_PACKAGE_XUTIL_UTIL_MACROS
+	select BR2_PACKAGE_UTIL_MACROS
 	help
 	  X.Org Present extension headers
diff --git a/package/x11r7/xproto_presentproto/xproto_presentproto.mk b/package/x11r7/xproto_presentproto/xproto_presentproto.mk
index 6fea0a2..f074f46 100644
--- a/package/x11r7/xproto_presentproto/xproto_presentproto.mk
+++ b/package/x11r7/xproto_presentproto/xproto_presentproto.mk
@@ -9,7 +9,7 @@ XPROTO_PRESENTPROTO_SOURCE = presentproto-$(XPROTO_PRESENTPROTO_VERSION).tar.bz2
 XPROTO_PRESENTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_PRESENTPROTO_LICENSE = MIT
 XPROTO_PRESENTPROTO_LICENSE_FILES = presentproto.h
-XPROTO_PRESENTPROTO_DEPENDENCIES = host-pkgconf xutil_util-macros
+XPROTO_PRESENTPROTO_DEPENDENCIES = host-pkgconf util-macros
 XPROTO_PRESENTPROTO_INSTALL_STAGING = YES
 XPROTO_PRESENTPROTO_INSTALL_TARGET = NO
 
diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 84f0298..9a0c3fb 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -45,7 +45,7 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
 	select BR2_PACKAGE_XPROTO_XF86VIDMODEPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
-	select BR2_PACKAGE_XUTIL_UTIL_MACROS
+	select BR2_PACKAGE_UTIL_MACROS
 	select BR2_PACKAGE_XKEYBOARD_CONFIG
 	depends on BR2_USE_MMU # fork()
 	help
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 3f6cda7..e325ea8 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -14,7 +14,7 @@ XSERVER_XORG_SERVER_INSTALL_STAGING = YES
 XSERVER_XORG_SERVER_AUTORECONF = YES
 XSERVER_XORG_SERVER_DEPENDENCIES = 	\
 	xfont_font-util			\
-	xutil_util-macros 		\
+	util-macros 			\
 	xlib_libXfont 			\
 	xlib_libX11 			\
 	xlib_libXau 			\
diff --git a/package/x11r7/xutil_util-macros/Config.in b/package/x11r7/xutil_util-macros/Config.in
deleted file mode 100644
index 10b1a59..0000000
--- a/package/x11r7/xutil_util-macros/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_PACKAGE_XUTIL_UTIL_MACROS
-	bool "util-macros"
-	help
-	  No description available
diff --git a/package/x11r7/xutil_util-macros/xutil_util-macros.mk b/package/x11r7/xutil_util-macros/xutil_util-macros.mk
deleted file mode 100644
index 1451a06..0000000
--- a/package/x11r7/xutil_util-macros/xutil_util-macros.mk
+++ /dev/null
@@ -1,17 +0,0 @@
-################################################################################
-#
-# xutil_util-macros
-#
-################################################################################
-
-XUTIL_UTIL_MACROS_VERSION = 1.19.0
-XUTIL_UTIL_MACROS_SOURCE = util-macros-$(XUTIL_UTIL_MACROS_VERSION).tar.bz2
-XUTIL_UTIL_MACROS_SITE = http://xorg.freedesktop.org/releases/individual/util
-XUTIL_UTIL_MACROS_LICENSE = MIT
-XUTIL_UTIL_MACROS_LICENSE_FILES = COPYING
-
-XUTIL_UTIL_MACROS_INSTALL_STAGING = YES
-XUTIL_UTIL_MACROS_INSTALL_TARGET = NO
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
-- 
2.4.10
