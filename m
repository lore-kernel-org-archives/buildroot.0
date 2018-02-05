From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  5 Feb 2018 21:57:12 +0100
Subject: [Buildroot] [PATCH 1/5] package/x11r7/xlib_libxshmfence: fix build
 with glibc 2.27
Message-ID: <20180205205716.4279-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With glibc 2.27 memfd_create() is inside a _GNU_SOURCE guard, so call
AC_USE_SYSTEM_EXTENSIONS to get this defined.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...onfigure.ac-call-AC_USE_SYSTEM_EXTENSIONS.patch | 30 ++++++++++++++++++++++
 .../x11r7/xlib_libxshmfence/xlib_libxshmfence.mk   |  3 +++
 2 files changed, 33 insertions(+)
 create mode 100644 package/x11r7/xlib_libxshmfence/0001-configure.ac-call-AC_USE_SYSTEM_EXTENSIONS.patch

diff --git a/package/x11r7/xlib_libxshmfence/0001-configure.ac-call-AC_USE_SYSTEM_EXTENSIONS.patch b/package/x11r7/xlib_libxshmfence/0001-configure.ac-call-AC_USE_SYSTEM_EXTENSIONS.patch
new file mode 100644
index 0000000000..f24b1da5dd
--- /dev/null
+++ b/package/x11r7/xlib_libxshmfence/0001-configure.ac-call-AC_USE_SYSTEM_EXTENSIONS.patch
@@ -0,0 +1,30 @@
+From 0b550a4e7acf02d3478602848f6afbfcbfb0d4b2 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Mon, 29 Jan 2018 16:24:36 +0000
+Subject: [PATCH] configure.ac: call AC_USE_SYSTEM_EXTENSIONS
+
+With glibc 2.27 memfd_create() is inside a _GNU_SOURCE guard, so call
+AC_USE_SYSTEM_EXTENSIONS to get this defined.
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ configure.ac | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 55772d0..ed77e6d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -28,6 +28,8 @@ AC_INIT([libxshmfence], [1.2],
+ AC_CONFIG_SRCDIR([Makefile.am])
+ AC_CONFIG_HEADERS([config.h])
+ 
++AC_USE_SYSTEM_EXTENSIONS
++
+ # Initialize Automake
+ AM_INIT_AUTOMAKE([foreign dist-bzip2])
+ 
+-- 
+2.14.3
+
diff --git a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
index 3a2f32623a..9686c408c1 100644
--- a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
+++ b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
@@ -12,4 +12,7 @@ XLIB_LIBXSHMFENCE_LICENSE_FILES = COPYING
 XLIB_LIBXSHMFENCE_INSTALL_STAGING = YES
 XLIB_LIBXSHMFENCE_DEPENDENCIES = host-pkgconf xproto_xproto
 
+# 0001-configure.ac-call-AC_USE_SYSTEM_EXTENSIONS.patch
+XLIB_LIBXSHMFENCE_AUTORECONF = YES
+
 $(eval $(autotools-package))
-- 
2.14.3
