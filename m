From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Nov 2014 23:59:24 +0100
Subject: [Buildroot] [git commit] package/shairport-sync: fix static builds
Message-ID: <20141130231214.EC2CD7F97F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ac1ac9e628a405e62e4eccb12010c3e364ed1053
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Because shairport-sync uses AC_CHECK_LIB to find some of the needed
libraries (opensl, alsa, popt...), it fails to bring in the dependencies
of those libraries; for example, -lssl requires -lz.

When doing a dynamically-linked build, those dependent libraries are
pulled in thanks to the DT_NEEDED ELF tags, but those are not available
in static libraries.

Use PKG_CHECK_MODULES instead of AC_CHECK_LIB, and emulate the results
of AC_CJECK_LIB (i.e. set the HAVE_LIBxxx and the LIBS variable
appropriately) to minimise the amount of code touched.

This should fix:
    http://autobuild.buildroot.net/results/1a5/1a56dbff3583bed0d693508dfc16859086846ecd/
    http://autobuild.buildroot.net/results/6d5/6d5a8157592f7a2c9469bf71b0453796ef982ab1/

At the same time, remove a comment at the end of a variable assignment,
since this has proven to cause some problems.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: J??rg Krause <jkrause@posteo.de>
Cc: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-fix-static-link-openssl.patch             |   41 ++++++++++++++++++++
 .../shairport-sync/0002-fix-static-link-alsa.patch |   27 +++++++++++++
 .../shairport-sync/0003-fix-static-link-popt.patch |   25 ++++++++++++
 package/shairport-sync/shairport-sync.mk           |    7 ++-
 4 files changed, 98 insertions(+), 2 deletions(-)

diff --git a/package/shairport-sync/0001-fix-static-link-openssl.patch b/package/shairport-sync/0001-fix-static-link-openssl.patch
new file mode 100644
index 0000000..8245b89
--- /dev/null
+++ b/package/shairport-sync/0001-fix-static-link-openssl.patch
@@ -0,0 +1,41 @@
+configure: fix static link with openssl
+
+Use pkg-config to find openssl libraries, that will return all the
+dependent libraries of openssl as well (e.g. -lz) that can not be
+deduced in case of a static link.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+---
+Patch applied upstream:
+    https://github.com/mikebrady/shairport-sync/commit/2a430ec434674ed8c1959698c061662bb7abc1a1
+
+diff -durN shairport-sync-2.1.8.orig/configure.ac shairport-sync-2.1.8/configure.ac
+--- shairport-sync-2.1.8.orig/configure.ac	2014-10-25 18:03:13.000000000 +0200
++++ shairport-sync-2.1.8/configure.ac	2014-11-29 12:52:41.507981720 +0100
+@@ -21,6 +21,8 @@
+ AC_PROG_CC
+ AC_PROG_INSTALL
+ 
++PKG_PROG_PKG_CONFIG([0.9.0])
++
+ # Checks for libraries.
+ if test "x${with_os_type}" = xlinux; then
+  AC_CHECK_LIB([rt],[clock_gettime], , AC_MSG_ERROR(librt needed))
+@@ -52,8 +56,14 @@
+     AC_MSG_ERROR(choose either "openssl" or "polarssl" encryption)
+   fi
+   if test "x${with_ssl}" = xopenssl ; then
+-    AC_CHECK_LIB([crypto], [MD5_Init], , AC_MSG_ERROR(libcrypto selected, but the library cannot be found!))
+-    AC_CHECK_LIB([ssl],[SSL_library_init], , AC_MSG_ERROR(openssl selected but the library cannot be found!))
++    PKG_CHECK_MODULES(
++        [CRYPTO], [libcrypto],
++        [LIBS="${CRYPTO_LIBS} ${LIBS}"
++         AC_DEFINE([HAVE_LIBCRYPTO],[1],[Define to 1 if you have libcrypto])])
++    PKG_CHECK_MODULES(
++        [SSL], [libssl],
++        [LIBS="${SSL_LIBS} ${LIBS}"
++         AC_DEFINE([HAVE_LIBSSL],[1],[Define to 1 if you have libssl])])
+   elif test "x${with_ssl}" = xpolarssl ; then
+     AC_CHECK_LIB([polarssl],[ssl_init], , AC_MSG_ERROR(PolarSSL selected but the library cannot be found!))
+   else
diff --git a/package/shairport-sync/0002-fix-static-link-alsa.patch b/package/shairport-sync/0002-fix-static-link-alsa.patch
new file mode 100644
index 0000000..101ce14
--- /dev/null
+++ b/package/shairport-sync/0002-fix-static-link-alsa.patch
@@ -0,0 +1,27 @@
+configure: fix static link with alsa
+
+Use pkg-config to find the alsa library, that will return all the
+dependent libraries of alsa (e.g. -ldl -lpthread -lrt) as well that
+can not be deduced in case of a static link.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+---
+Patch applied upstream:
+    https://github.com/mikebrady/shairport-sync/commit/e5a74a3ff08134a2b11f07bd850659d7816fb03d
+
+diff -durN shairport-sync-2.1.8.orig/configure.ac shairport-sync-2.1.8/configure.ac
+--- shairport-sync-2.1.8.orig/configure.ac	2014-11-29 12:56:11.954118681 +0100
++++ shairport-sync-2.1.8/configure.ac	2014-11-29 13:07:24.941687600 +0100
+@@ -99,7 +99,10 @@
+   HAS_ALSA=1
+   AM_CONDITIONAL([USE_ALSA], [test 0])
+   AC_DEFINE([CONFIG_ALSA], 1, [Needed by the compiler.])
+-  AC_CHECK_LIB([asound], [snd_pcm_open], , AC_MSG_ERROR(ALSA support requires the asound library!))], )
++  PKG_CHECK_MODULES(
++    [ALSA], [alsa],
++    [LIBS="${ALSA_LIBS} ${LIBS}"
++     AC_DEFINE([HAVE_LIBASOUND],[1],[Define to 1 if you have ALSA])])])
+ AM_CONDITIONAL([USE_ALSA], [test "x$HAS_ALSA" = "x1"])
+ 
+ # Look for SNDIO flag
diff --git a/package/shairport-sync/0003-fix-static-link-popt.patch b/package/shairport-sync/0003-fix-static-link-popt.patch
new file mode 100644
index 0000000..fe4d8f6
--- /dev/null
+++ b/package/shairport-sync/0003-fix-static-link-popt.patch
@@ -0,0 +1,25 @@
+configure: fix static link with popt
+
+Use pkg-config to find the popt library.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+---
+Patch applied upstream:
+    https://github.com/mikebrady/shairport-sync/commit/1f759e57e8c0682613eaaf89a46fdf6db4c6b5cd
+
+diff -durN shairport-sync-2.1.8.orig/configure.ac shairport-sync-2.1.8/configure.ac
+--- shairport-sync-2.1.8.orig/configure.ac	2014-11-29 14:14:36.655955733 +0100
++++ shairport-sync-2.1.8/configure.ac	2014-11-29 14:16:21.072719327 +0100
+@@ -31,7 +31,10 @@
+ AC_CHECK_LIB([daemon],[daemon_log], , AC_MSG_ERROR(libdaemon needed))
+ AC_CHECK_LIB([pthread],[pthread_create], , AC_MSG_ERROR(pthread library needed))
+ AC_CHECK_LIB([m],[exp], , AC_MSG_ERROR(maths library needed))
+-AC_CHECK_LIB([popt],[poptGetContext], , AC_MSG_ERROR(libpopt needed))
++PKG_CHECK_MODULES(
++    [POPT], [popt],
++    [LIBS="${POPT_LIBS} ${LIBS}"
++     AC_DEFINE([HAVE_LIBPOPT],[1],[Define to 1 if you have popt])])
+ 
+ # Look for piddir flag
+ AC_ARG_WITH(piddir, [ --with-piddir=<pathname> Specify a pathname to a directory in which to write the PID file.], [
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index da69171..dc5d092 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -9,9 +9,12 @@ SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VE
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3c
 SHAIRPORT_SYNC_LICENSE_FILES = LICENSES
-SHAIRPORT_SYNC_DEPENDENCIES = alsa-lib libdaemon popt
+SHAIRPORT_SYNC_DEPENDENCIES = alsa-lib libdaemon popt host-pkgconf
+
+# Touching configure.ac with the patches
 SHAIRPORT_SYNC_AUTORECONF = YES
-SHAIRPORT_SYNC_CONF_OPTS = --with-alsa # required
+
+SHAIRPORT_SYNC_CONF_OPTS = --with-alsa
 
 # Avahi or tinysvcmdns (shaiport-sync bundles its own version of tinysvcmdns).
 # Avahi support needs libavahi-client, which is built by avahi if avahi-daemon
