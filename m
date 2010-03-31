From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 31 Mar 2010 12:16:15 +0200
Subject: [Buildroot] [git commit master] xlib_libX11: don't build
	documentation
Message-ID: <20100331101656.3BBFD7FA55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a12ef5db91a32caebeb47641c16a4d968be2335f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1387

The documentation step needs working groff and ps2pdf on the host, and
only slows down the build, so just disable it.

At the same time, cleanup the overlong _CONF_OPT line.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                  |    3 ++-
 package/x11r7/xlib_libX11/xlib_libX11.mk |    8 +++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 7c64c84..a5406c3 100644
--- a/CHANGES
+++ b/CHANGES
@@ -10,7 +10,7 @@
 	Updated/fixed packages: busybox, dosfstools, e2fsprogs,
 	freetype, iperf, iptables, less, libgcrypt, libglib2, libpng,
 	libxml2, mdadm, memstat, mtd-utils, nano, openssl, php, pppd,
-	setserial, squashfs, wget, xlib_libXfont
+	setserial, squashfs, wget, xlib_libX11, xlib_libXfont
 
 	Issues resolved (http://bugs.uclibc.org):
 
@@ -27,6 +27,7 @@
 	#1303: Add librsync package
 	#1327: mtd-utils compile failure due to lack of --sysroot in CFLAGS
 	#1345: Bump pppd to 2.4.5 and convert to Makefile.autotools.in
+	#1387: xlib_libX11-1.3.2 can't find libjpeg
 	#1411: [SECURITY] Update openssl package to 0.9.8n
 	#1417: Bump iptables to 1.4.7
 	#1423: Bump e2fsprogs to 1.41.11
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index 805540b..b9c18d0 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -10,7 +10,13 @@ XLIB_LIBX11_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBX11_AUTORECONF = YES
 XLIB_LIBX11_INSTALL_STAGING = YES
 XLIB_LIBX11_DEPENDENCIES = libxcb xutil_util-macros xlib_xtrans xlib_libXau xlib_libXdmcp xproto_kbproto xproto_xproto xproto_xextproto xproto_inputproto xproto_xf86bigfontproto xproto_bigreqsproto xproto_xcmiscproto
-XLIB_LIBX11_CONF_OPT = --disable-malloc0returnsnull --with-xcb --enable-shared --disable-static --with-keysymdef=$(STAGING_DIR)/usr/include/X11/keysymdef.h
+XLIB_LIBX11_CONF_OPT = \
+	--disable-malloc0returnsnull \
+	--with-xcb \
+	--enable-shared \
+	--disable-static \
+	--with-keysymdef=$(STAGING_DIR)/usr/include/X11/keysymdef.h \
+	--disable-specs
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libX11))
 
-- 
1.6.3.3
