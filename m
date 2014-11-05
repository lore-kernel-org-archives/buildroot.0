From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Nov 2014 00:01:09 +0100
Subject: [Buildroot] [git commit] subversion: ensure --disable-debug doesn't
	mangle CFLAGS
Message-ID: <20141105230853.0C321B14B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=395c88051efb4b84f752be4eea1b34b13c80a1dc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/fc6/fc69a19c66462585449f7c4dad174d45a84e4947/
http://autobuild.buildroot.net/results/e04/e0471f2a9087d547840a7b18863289963e357b57/
http://autobuild.buildroot.net/results/bd8/bd8cdf976937c7b9029658871929f4be464b7a47/
http://autobuild.buildroot.net/results/652/652c3afe844e912061fbc5991e6fecad98ff6e6f/

And many more.

When --disable-debug is passed to configure, as is automatically done by the
autotools infrastructure since 822a757456e (infra: Move
--enable/--disable-debug to package/Makefile.in), the configure script will
try to strip debugging (-g) options from the C/CXXFLAGS. The logic to do so
is unfortunately buggy, so it ends up mangling options like
-mfloat-gprs=double that we use on certain PowerPC variants, breaking the
build.

Fix it by adjusting the sed regexp to be more selective in what it strips.
The package unfortunately doesn't cleanly autoreconf, so configure is
patched instead of configure.ac.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/subversion/0001-dont-mangle-cflags.patch |   28 ++++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/package/subversion/0001-dont-mangle-cflags.patch b/package/subversion/0001-dont-mangle-cflags.patch
new file mode 100644
index 0000000..33370c5
--- /dev/null
+++ b/package/subversion/0001-dont-mangle-cflags.patch
@@ -0,0 +1,28 @@
+[PATCH] configure: don't mangle CFLAGS
+
+Ensure that the sed expression to strip debugging options from CFLAGS
+doesn't mangle flags like -mfloat-gprs=double, breaking the build.
+
+Patch configure instead of configure.ac as subversion currently doesn't
+cleanly autoreconf.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ configure |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+Index: subversion-1.7.18/configure
+===================================================================
+--- subversion-1.7.18.orig/configure
++++ subversion-1.7.18/configure
+@@ -19798,8 +19798,8 @@
+       CFLAGS="$CFLAGS -DSVN_DEBUG -DAP_DEBUG"
+   CXXFLAGS="$CXXFLAGS -DSVN_DEBUG -DAP_DEBUG"
+ elif test "$enable_debugging" = "no" ; then
+-    CFLAGS="`echo $CFLAGS' ' | $SED -e 's/-g[0-9] //g' | $SED -e 's/-g//g'`"
+-    CXXFLAGS="`echo $CXXFLAGS' ' | $SED -e 's/-g[0-9] //g' | $SED -e 's/-g//g'`"
++    CFLAGS="`echo $CFLAGS' ' | $SED -e 's/-g[0-9]* //g'`"
++    CXXFLAGS="`echo $CXXFLAGS' ' | $SED -e 's/-g[0-9]* //g'`"
+         CFLAGS="$CFLAGS -DNDEBUG"
+     CXXFLAGS="$CXXFLAGS -DNDEBUG"
+ # elif test "$enable_debugging" = "maybe" ; then
