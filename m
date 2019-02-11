From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Feb 2019 15:35:33 +0100
Subject: [Buildroot] [git commit] package/libupnp18: fix static linking with
 mpd
Message-ID: <20190211143431.8BC21815FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f67573373c7ee52b28771c8ed0fffb3dfcd5fbc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Add a call to PKG_CHECK_MODULES in configure.ac to get openssl
  libraries and its dependencies if openssl support is enabled
- Add OPENSSL_LIBS to libupnp.pc.in so that applications linking with
  pupnp (such as mpd) will be able to retrieve openssl libraries

Fixes:
 - http://autobuild.buildroot.org/results/a4148e516070b79816769f3443fc24d6d8192073

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-configure.ac-fix-build-with-openssl.patch | 51 ++++++++++++++++++++++
 package/libupnp18/libupnp18.mk                     |  3 +-
 2 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/package/libupnp18/0001-configure.ac-fix-build-with-openssl.patch b/package/libupnp18/0001-configure.ac-fix-build-with-openssl.patch
new file mode 100644
index 0000000000..6a09821dae
--- /dev/null
+++ b/package/libupnp18/0001-configure.ac-fix-build-with-openssl.patch
@@ -0,0 +1,51 @@
+From c70d326f3ae88aa2dca903fb17a1f18d3b45a2ca Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 8 Feb 2019 16:45:32 +0100
+Subject: [PATCH] configure.ac: fix build with openssl
+
+- Add a call to PKG_CHECK_MODULES to get openssl libraries and its
+  dependencies if openssl support is enabled
+- Add OPENSSL_LIBS to libupnp.pc.in so that applications linking with
+  pupnp (such as mpd) will be able to retrieve openssl libraries
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a4148e516070b79816769f3443fc24d6d8192073
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/mrjimenez/pupnp/pull/105]
+---
+ configure.ac  | 5 +++++
+ libupnp.pc.in | 2 +-
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 670d363..190b30c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -722,6 +722,11 @@ AC_COMPILE_IFELSE(
+ 			AC_MSG_ERROR([pthread_rwlock_t not available])])])
+ echo "-------------------------------------------------------------------------------"
+ 
++if test "x$enable_open_ssl" = xyes ; then
++	PKG_CHECK_MODULES(OPENSSL, libssl,
++		[LIBS="$LIBS $OPENSSL_LIBS" CFLAGS="$CFLAGS $OPENSSL_CFLAGS"],
++		[AC_MSG_ERROR([openssl not found])])
++fi
+ 
+ AC_CONFIG_FILES([
+ 	Makefile
+diff --git a/libupnp.pc.in b/libupnp.pc.in
+index bd2d7b3..54cba90 100644
+--- a/libupnp.pc.in
++++ b/libupnp.pc.in
+@@ -6,6 +6,6 @@ includedir=@includedir@
+ Name: libupnp
+ Description: Linux SDK for UPnP Devices
+ Version: @VERSION@
+-Libs: @PTHREAD_CFLAGS@ @PTHREAD_LIBS@ -L${libdir} -lupnp -lixml
++Libs: @PTHREAD_CFLAGS@ @PTHREAD_LIBS@ -L${libdir} -lupnp -lixml @OPENSSL_LIBS@
+ Cflags: @PTHREAD_CFLAGS@ -I${includedir}/upnp
+ 
+-- 
+2.14.1
+
diff --git a/package/libupnp18/libupnp18.mk b/package/libupnp18/libupnp18.mk
index 13536b8f7a..5154be5316 100644
--- a/package/libupnp18/libupnp18.mk
+++ b/package/libupnp18/libupnp18.mk
@@ -11,11 +11,12 @@ LIBUPNP18_CONF_ENV = ac_cv_lib_compat_ftime=no
 LIBUPNP18_INSTALL_STAGING = YES
 LIBUPNP18_LICENSE = BSD-3-Clause
 LIBUPNP18_LICENSE_FILES = COPYING
+# We're patching configure.ac
+LIBUPNP18_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBUPNP18_CONF_OPTS += --enable-open-ssl
 LIBUPNP18_DEPENDENCIES += host-pkgconf openssl
-LIBUPNP18_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libssl libcrypto`"
 else
 LIBUPNP18_CONF_OPTS += --disable-open-ssl
 endif
