From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Oct 2011 22:50:41 +0200
Subject: [Buildroot] [git commit] openocd: remove fixed ldflags breaking
	build
Message-ID: <20111005205218.119318E1FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a5094a056ad99da7763d93a97b8e61630f60d170
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The openocd configure script would forcibly add -L/usr/lib to LDFLAGS,
causing the cross compiler to use host libraries, breaking the build.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../openocd/openocd-0005-dont-force-ldflags.patch  |   37 ++++++++++++++++++++
 1 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/package/openocd/openocd-0005-dont-force-ldflags.patch b/package/openocd/openocd-0005-dont-force-ldflags.patch
new file mode 100644
index 0000000..1880e00
--- /dev/null
+++ b/package/openocd/openocd-0005-dont-force-ldflags.patch
@@ -0,0 +1,37 @@
+[PATCH] don't force library search path / rpath settings
+
+openocd adds -L$exec_prefix/lib -Wl,rpath,$exec_prefix/lib to the compile
+LDFLAGS if it isn't installed into /usr/local, which breaks cross compilation
+as the compiler ends up using host libraries.
+---
+ configure.in |   17 -----------------
+ 1 file changed, 17 deletions(-)
+
+Index: openocd-0.5.0/configure.in
+===================================================================
+--- openocd-0.5.0.orig/configure.in
++++ openocd-0.5.0/configure.in
+@@ -174,23 +174,6 @@
+ # Let make expand exec_prefix.
+ test x"$OCDxprefix" = xNONE && OCDxprefix="$OCDprefix"
+ 
+-# what matters is the "exec-prefix"
+-if test "$OCDxprefix" != "$ac_default_prefix"
+-then
+-    # We are installing in a non-standard place
+-    # Nonstandard --prefix and/or --exec-prefix
+-    # We have an override of some sort.
+-    # use build specific install library dir
+-
+-    LDFLAGS="$LDFLAGS -L$OCDxprefix/lib"
+-    # RPATH becomes an issue on Linux only
+-    if test $host_os = linux-gnu || test $host_os = linux ; then
+-      LDFLAGS="$LDFLAGS -Wl,-rpath,$OCDxprefix/lib"
+-    fi
+-    # The "INCDIR" is also usable
+-    CFLAGS="$CFLAGS -I$includedir"
+-fi
+-
+ AC_ARG_WITH(ftd2xx,
+    AS_HELP_STRING([--with-ftd2xx=<PATH>],[This option has been removed.]),
+   [
