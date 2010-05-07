From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 May 2010 00:11:46 +0200
Subject: [Buildroot] [git commit master] xlib_libX11: re-add a patch to fix
	the keysymdef issue
Message-ID: <20100507223516.8F5A28F341@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e3963e90cc84df3a31b68768831fe07a0003e322
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When xlib_libX11 was bumped to 1.3.2 in commit
1d956c9190dafbe425e9e02255b540641e27f690, the keysymdef patch was
dropped. However, this patch is still needed in order to be able to
tell ./configure where the keysymdef header file is installed.

The patch has been updated for 1.3.2.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xlib_libX11/xlib_libX11-1.3.2-keysymdef.patch  |   35 ++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 package/x11r7/xlib_libX11/xlib_libX11-1.3.2-keysymdef.patch

diff --git a/package/x11r7/xlib_libX11/xlib_libX11-1.3.2-keysymdef.patch b/package/x11r7/xlib_libX11/xlib_libX11-1.3.2-keysymdef.patch
new file mode 100644
index 0000000..9c4eae2
--- /dev/null
+++ b/package/x11r7/xlib_libX11/xlib_libX11-1.3.2-keysymdef.patch
@@ -0,0 +1,35 @@
+[patch]: configure: add --with-keysymdef argument for cross compilation
+
+Based on a similar patch from Openembedded.
+
+The libX11 configure script hardcodes the location to keysymdef.h as
+<prefix>/include/X11/keysymdef.h, which is fine for native compilation,
+but breaks with cross compilation as that directory is a location on
+the target, not the build host.
+
+Fix it by providing an explicit --with-keysymdef=<full-path-to-file>.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>Index: libX11-1.1.5/configure.ac
+===================================================================
+Index: xlib_libX11-1.3.2/configure.ac
+===================================================================
+--- xlib_libX11-1.3.2.orig/configure.ac	2009-10-23 22:55:03.000000000 +0200
++++ xlib_libX11-1.3.2/configure.ac	2010-05-04 16:26:39.000000000 +0200
+@@ -280,8 +280,15 @@
+ # Find keysymdef.h
+ #
+ AC_MSG_CHECKING([keysymdef.h])
+-dir=`pkg-config --variable=includedir xproto`
+-KEYSYMDEF="$dir/X11/keysymdef.h"
++AC_ARG_WITH(keysymdef,
++      AC_HELP_STRING([--with-keysymdef=DIR/keysymdef.h], [The location of keysymdef.h]),
++      KEYSYMDEF=$withval, KEYSYMDEF="")
++
++if test x$KEYSYMDEF = x; then
++      dir=`pkg-config --variable=includedir xproto`
++      KEYSYMDEF="$dir/X11/keysymdef.h"
++fi
++
+ if test -f "$KEYSYMDEF"; then
+         AC_MSG_RESULT([$KEYSYMDEF])
+ else
-- 
1.6.3.3
