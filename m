From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 21 Mar 2017 20:32:13 +0100
Subject: [Buildroot] [PATCH] autofs: use libtirpc instead of internal C
	implementation
Message-ID: <20170321193213.GA18747@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uClibc-ng plans to remove internal RPC implementation as it
is ipv4 only and can not be used for most important RPC software
rpcbind and nfs-utils.
musl does not implement RPC and GNU C library deprecated the
internal implementation a while ago.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
I am planning to send patches to convert existing packages
and remove the RPC internal toolchain stuff, before releasing
uClibc-ng without RPC. For a smooth migration.
---
 package/autofs/0004-libtirpc-via-pkgconfig.patch | 83 ++++++++++++++++++++++++
 package/autofs/Config.in                         |  7 +-
 package/autofs/autofs.mk                         |  3 +-
 3 files changed, 88 insertions(+), 5 deletions(-)
 create mode 100644 package/autofs/0004-libtirpc-via-pkgconfig.patch

diff --git a/package/autofs/0004-libtirpc-via-pkgconfig.patch b/package/autofs/0004-libtirpc-via-pkgconfig.patch
new file mode 100644
index 0000000..784b4c6
--- /dev/null
+++ b/package/autofs/0004-libtirpc-via-pkgconfig.patch
@@ -0,0 +1,83 @@
+Use pkg-config to find libtirpc headers
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur autofs-5.1.2.orig/aclocal.m4 autofs-5.1.2/aclocal.m4
+--- autofs-5.1.2.orig/aclocal.m4	2016-06-15 04:40:44.000000000 +0200
++++ autofs-5.1.2/aclocal.m4	2017-03-21 20:10:06.441615642 +0100
+@@ -411,11 +411,18 @@
+ dnl --------------------------------------------------------------------------
+ AC_DEFUN([AF_CHECK_LIBTIRPC],
+ [
++
++AC_PATH_PROGS(PKG_CONFIG, pkg-config, no)
++
+ # save current flags
+ af_check_libtirpc_save_cflags="$CFLAGS"
+ af_check_libtirpc_save_ldflags="$LDFLAGS"
+-CFLAGS="$CFLAGS -I/usr/include/tirpc"
+-LDFLAGS="$LDFLAGS -ltirpc"
++
++TIRPC_LIBS=`$PKG_CONFIG --libs libtirpc`
++TIRPC_FLAGS=`$PKG_CONFIG --cflags libtirpc`
++
++CFLAGS="$CFLAGS $TIRPC_FLAGS"
++LIBS="$LIBS $TIRPC_LIBS"
+ 
+ AC_TRY_LINK(
+     [ #include <rpc/rpc.h> ],
+@@ -431,7 +438,8 @@
+ if test "$af_have_libtirpc" = "yes"; then
+     AC_DEFINE(WITH_LIBTIRPC,1, [Define to 1 if you have the libtirpc library installed])
+     AC_DEFINE(TIRPC_WORKAROUND,1, [Define to 1 to use the libtirpc tsd usage workaround])
+-    TIRPCLIB="-ltirpc"
++    TIRPCINCLUDE=$TIRPC_FLAGS
++    TIRPCLIB=$TIRPC_LIBS
+ fi
+ 
+ AC_CHECK_FUNCS([getrpcbyname getservbyname])
+@@ -439,6 +447,7 @@
+ # restore flags
+ CFLAGS="$af_check_libtirpc_save_cflags"
+ LDFLAGS="$af_check_libtirpc_save_ldflags"
++
+ ])
+ 
+ AC_DEFUN([AF_WITH_LIBTIRPC],
+diff -Nur autofs-5.1.2.orig/configure.in autofs-5.1.2/configure.in
+--- autofs-5.1.2.orig/configure.in	2016-06-15 04:40:44.000000000 +0200
++++ autofs-5.1.2/configure.in	2017-03-20 22:01:57.191254563 +0100
+@@ -126,6 +126,7 @@
+ #
+ AF_WITH_LIBTIRPC()
+ AC_SUBST(TIRPCLIB)
++AC_SUBST(TIRPCINCLUDE)
+ 
+ #
+ # Optional include dmalloc
+diff -Nur autofs-5.1.2.orig/Makefile.conf.in autofs-5.1.2/Makefile.conf.in
+--- autofs-5.1.2.orig/Makefile.conf.in	2016-06-15 04:40:44.000000000 +0200
++++ autofs-5.1.2/Makefile.conf.in	2017-03-20 21:59:38.341881802 +0100
+@@ -62,6 +62,7 @@
+ 
+ # Use libtirpc if requested and available
+ TIRPCLIB = @TIRPCLIB@
++TIRPCINCLUDE = @TIRPCINCLUDE@
+ 
+ # Use dmalloc for memory debuging
+ DMALLOCLIB = @DMALLOCLIB@
+diff -Nur autofs-5.1.2.orig/Makefile.rules autofs-5.1.2/Makefile.rules
+--- autofs-5.1.2.orig/Makefile.rules	2016-06-15 04:40:44.000000000 +0200
++++ autofs-5.1.2/Makefile.rules	2017-03-20 22:03:25.590675167 +0100
+@@ -45,10 +45,8 @@
+ CFLAGS += -D_REENTRANT -D_FILE_OFFSET_BITS=64
+ LIBS += -lpthread
+ 
+-ifdef TIRPCLIB
+-CFLAGS += -I/usr/include/tirpc
++CFLAGS += $(TIRPCINCLUDE)
+ LIBS += $(TIRPCLIB)
+-endif
+ 
+ ifdef DMALLOCLIB
+ LIBS += $(DMALLOCLIB)
diff --git a/package/autofs/Config.in b/package/autofs/Config.in
index 8e08357..bf1bf47 100644
--- a/package/autofs/Config.in
+++ b/package/autofs/Config.in
@@ -2,8 +2,8 @@ config BR2_PACKAGE_AUTOFS
 	bool "autofs"
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	depends on !BR2_STATIC_LIBS # dlfcn
+	select BR2_PACKAGE_LIBTIRPC
 	help
 	  Autofs controls the operation of the automount daemons. The
 	  automount daemons automatically mount filesystems when they
@@ -15,7 +15,6 @@ config BR2_PACKAGE_AUTOFS
 
 	  http://www.linuxfromscratch.org/blfs/view/svn/general/autofs.html
 
-comment "autofs needs a toolchain w/ NPTL, RPC, dynamic library"
+comment "autofs needs a toolchain w/ NPTL and dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
diff --git a/package/autofs/autofs.mk b/package/autofs/autofs.mk
index 23e6836..1add8b2 100644
--- a/package/autofs/autofs.mk
+++ b/package/autofs/autofs.mk
@@ -9,7 +9,7 @@ AUTOFS_SOURCE = autofs-$(AUTOFS_VERSION).tar.xz
 AUTOFS_SITE = $(BR2_KERNEL_MIRROR)/linux/daemons/autofs/v5
 AUTOFS_LICENSE = GPLv2+
 AUTOFS_LICENSE_FILES = COPYING COPYRIGHT
-AUTOFS_DEPENDENCIES = host-flex host-bison
+AUTOFS_DEPENDENCIES = host-flex host-bison libtirpc host-pkgconf
 # For 0002-autofs-configure-check-for-clock_gettime-in-librt.patch and
 # 0003-configure-add-cache-variable-for-Linux-proc-filesyst.patch.
 AUTOFS_AUTORECONF = YES
@@ -27,6 +27,7 @@ AUTOFS_CONF_ENV = \
 AUTOFS_CONF_OPTS = \
 	--disable-mount-locking \
 	--enable-ignore-busy \
+	--with-libtirpc \
 	--without-openldap \
 	--without-sasl \
 	--with-path="$(BR_PATH)" \
-- 
2.1.4
