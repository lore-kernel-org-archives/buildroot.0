From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 26 Aug 2018 13:04:52 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/vlc: also use AC_PATH_PROG to
 check for wayland-scanner
Message-ID: <20180826110452.18151-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/a6b/a6b5e5677efc2b46af85837637f2832eefdfed1d/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...o-use-AC_PATH_PROG-to-check-for-wayl.patch | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/vlc/0011-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch

diff --git a/package/vlc/0011-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch b/package/vlc/0011-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch
new file mode 100644
index 0000000000..2b74fe0d39
--- /dev/null
+++ b/package/vlc/0011-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch
@@ -0,0 +1,50 @@
+From 27635f902831fac898586f1f3dc98369f12582c9 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 26 Aug 2018 12:51:04 +0200
+Subject: [PATCH] configure.ac: also use AC_PATH_PROG to check for
+ wayland-scanner
+
+When cross-compiling the .pc file might point to the wrong
+wayland-scanner binary (target rather than host) resulting in a
+non-executable and wrong scanner.
+Try searching the PATH first, and if that fails fall back into
+pkg-config.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ configure.ac | 19 +++++++++++--------
+ 1 file changed, 11 insertions(+), 8 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4808b8becf..a18641ed23 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3140,14 +3140,17 @@ AS_IF([test "${enable_wayland}" != "no"], [
+       AC_MSG_ERROR([$(${PKG_CONFIG} --print-errors 'wayland-protocols >= 1.4')])
+     ])
+ 
+-    AC_MSG_CHECKING([for the Wayland scanner])
+-    PKG_CHECK_EXISTS([wayland-scanner], [
+-      WAYLAND_SCANNER="$(${PKG_CONFIG} wayland-scanner --variable wayland_scanner)"
+-      AC_MSG_RESULT([${WAYLAND_SCANNER}])
+-    ], [
+-      AC_MSG_RESULT([not found])
+-      AC_MSG_ERROR([$(${PKG_CONFIG} --print-errors wayland-scanner)])
+-    ])
++    AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner])
++    if test "x$WAYLAND_SCANNER" = x; then
++        AC_MSG_CHECKING([for the Wayland scanner])
++        PKG_CHECK_EXISTS([wayland-scanner], [
++          WAYLAND_SCANNER="$(${PKG_CONFIG} wayland-scanner --variable wayland_scanner)"
++          AC_MSG_RESULT([${WAYLAND_SCANNER}])
++        ], [
++          AC_MSG_RESULT([not found])
++          AC_MSG_ERROR([$(${PKG_CONFIG} --print-errors wayland-scanner)])
++        ])
++    fi
+ 
+     have_wayland="yes"
+ 
+-- 
+2.18.0
+
-- 
2.18.0
