From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Sep 2018 21:39:55 +0200
Subject: [Buildroot] [git commit] package/vlc: also use AC_PATH_PROG to
 check for wayland-scanner
Message-ID: <20180907111608.667417FEB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c60b6df0a428a0c8b79d79e7c0c62813e2b3e8ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/a6b/a6b5e5677efc2b46af85837637f2832eefdfed1d/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...c-also-use-AC_PATH_PROG-to-check-for-wayl.patch | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

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
