From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 13 Oct 2019 21:54:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXfont2: fix usage of
 libbsd
Message-ID: <20191013195443.19032-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream added optional support for libbsd:
"Add strlcat & strlcpy fallbacks if not provided by libc nor libbsd"
https://cgit.freedesktop.org/xorg/lib/libXfont/commit/?id=d4c941ea8b1dc07a14efce656bff58d31a14c985

and forgot to define HAVE_LIBBSD.

Also add libbsd as optional dependency because the build error occured
only when libbsd was built before building xlib_libXfont2.

Fixes:
http://autobuild.buildroot.net/results/165/165f9f948419fc69fbf6b9281d759b37bb7d40c6/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...ne-HAVE_LIBBSD-when-libbsd-was-found.patch | 33 +++++++++++++++++++
 .../x11r7/xlib_libXfont2/xlib_libXfont2.mk    |  6 ++++
 2 files changed, 39 insertions(+)
 create mode 100644 package/x11r7/xlib_libXfont2/0001-configure-define-HAVE_LIBBSD-when-libbsd-was-found.patch

diff --git a/package/x11r7/xlib_libXfont2/0001-configure-define-HAVE_LIBBSD-when-libbsd-was-found.patch b/package/x11r7/xlib_libXfont2/0001-configure-define-HAVE_LIBBSD-when-libbsd-was-found.patch
new file mode 100644
index 0000000000..ae2462e55d
--- /dev/null
+++ b/package/x11r7/xlib_libXfont2/0001-configure-define-HAVE_LIBBSD-when-libbsd-was-found.patch
@@ -0,0 +1,33 @@
+From 10202b813f86e3f4d477fd82ee7fceac3bc2ebd0 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 13 Oct 2019 21:21:28 +0200
+Subject: [PATCH] configure: define HAVE_LIBBSD when libbsd was found
+
+Source of the patch:
+http://lists.busybox.net/pipermail/buildroot/2019-October/261510.html
+
+Patch sent upstream:
+https://gitlab.freedesktop.org/xorg/lib/libxfont/merge_requests/6
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ configure.ac | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index f507c28..131713d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -52,7 +52,8 @@ AC_CHECK_HEADERS([endian.h poll.h sys/poll.h])
+ 
+ # Checks for library functions.
+ AC_CHECK_FUNCS([poll readlink])
+-AC_SEARCH_LIBS([strlcat], [bsd])
++AC_SEARCH_LIBS([strlcat], [bsd],
++  [AC_DEFINE(HAVE_LIBBSD,1,[Has libbsd])])
+ AC_CONFIG_LIBOBJ_DIR([src/util])
+ AC_REPLACE_FUNCS([reallocarray strlcat strlcpy])
+ 
+-- 
+2.20.1
+
diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
index cc3f474c64..611b8af548 100644
--- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
+++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
@@ -10,6 +10,8 @@ XLIB_LIBXFONT2_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFONT2_LICENSE = MIT
 XLIB_LIBXFONT2_LICENSE_FILES = COPYING
 XLIB_LIBXFONT2_INSTALL_STAGING = YES
+# 0001-configure-define-HAVE_LIBBSD-when-libbsd-was-found.patch
+XLIB_LIBXFONT2_AUTORECONF = YES
 XLIB_LIBXFONT2_DEPENDENCIES = \
 	freetype \
 	xlib_libfontenc \
@@ -17,6 +19,10 @@ XLIB_LIBXFONT2_DEPENDENCIES = \
 	xorgproto \
 	xfont_encodings
 
+ifeq ($(BR2_PACKAGE_LIBBSD),y)
+XLIB_LIBXFONT2_DEPENDENCIES += libbsd
+endif
+
 HOST_XLIB_LIBXFONT2_DEPENDENCIES = \
 	host-freetype \
 	host-xlib_libfontenc \
-- 
2.20.1
