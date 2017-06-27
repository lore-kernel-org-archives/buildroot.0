From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 27 Jun 2017 18:50:51 +0200
Subject: [Buildroot] [PATCH v4] autofs: allow to use libtirpc instead of
 internal C implementation
Message-ID: <20170627165051.GA15934@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uClibc-ng removed internal RPC implementation as it
is ipv4 only and can not be used for most important RPC software
rpcbind and nfs-utils.
musl does not implement RPC and GNU C library deprecated the
internal implementation a while ago.
It is still possible to use the C library implementation.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1 -> v2:                                                                                     
  - Thomas Petazzoni wants to keep legacy C library provided RPC
    support                      
v2 -> v3:                                                                                     
  - combine with BR2_PACKAGE_LIBTIRPC conditionally, suggested by
    Baruch Siach
v3 -> v4:
  - add patch to use pkg-config to search libtirpc
  - automatically use it when BR2_TOOLCHAIN_HAS_NATIVE_RPC isn't
    available
  - tested with glibc/uclibc-ng toolchains
---
 ...fig-to-search-for-libtirpc-to-fix-cross-c.patch | 129 +++++++++++++++++++++
 package/autofs/Config.in                           |   7 +-
 package/autofs/autofs.mk                           |  10 +-
 3 files changed, 141 insertions(+), 5 deletions(-)
 create mode 100644 package/autofs/0002-use-pkg-config-to-search-for-libtirpc-to-fix-cross-c.patch

diff --git a/package/autofs/0002-use-pkg-config-to-search-for-libtirpc-to-fix-cross-c.patch b/package/autofs/0002-use-pkg-config-to-search-for-libtirpc-to-fix-cross-c.patch
new file mode 100644
index 0000000..29c3075
--- /dev/null
+++ b/package/autofs/0002-use-pkg-config-to-search-for-libtirpc-to-fix-cross-c.patch
@@ -0,0 +1,129 @@
+From 7582cb88121d1ca4431def9175469e1590e9c29f Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Tue, 27 Jun 2017 18:11:56 +0200
+Subject: [PATCH] use pkg-config to search for libtirpc to fix
+ cross-compilation
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ Makefile.conf.in |  3 ++-
+ Makefile.rules   |  2 +-
+ aclocal.m4       | 48 ------------------------------------------------
+ configure.in     | 11 +++++++++--
+ 4 files changed, 12 insertions(+), 52 deletions(-)
+
+diff --git a/Makefile.conf.in b/Makefile.conf.in
+index 2bc3202..f879e26 100644
+--- a/Makefile.conf.in
++++ b/Makefile.conf.in
+@@ -64,7 +64,8 @@ RPCGEN = @PATH_RPCGEN@
+ RANLIB = @PATH_RANLIB@
+ 
+ # Use libtirpc if requested and available
+-TIRPCLIB = @TIRPCLIB@
++TIRPCLIB = @TIRPC_LIBS@
++TIRPCCFLAGS = @TIRPC_CFLAGS@
+ 
+ # Use dmalloc for memory debuging
+ DMALLOCLIB = @DMALLOCLIB@
+diff --git a/Makefile.rules b/Makefile.rules
+index 7d1af2e..0edf9bf 100644
+--- a/Makefile.rules
++++ b/Makefile.rules
+@@ -46,7 +46,7 @@ CFLAGS += -D_REENTRANT -D_FILE_OFFSET_BITS=64
+ LIBS += -lpthread
+ 
+ ifdef TIRPCLIB
+-CFLAGS += -I/usr/include/tirpc
++CFLAGS += $(TIRPCCFLAGS)
+ LIBS += $(TIRPCLIB)
+ endif
+ 
+diff --git a/aclocal.m4 b/aclocal.m4
+index 00811e0..31ca602 100644
+--- a/aclocal.m4
++++ b/aclocal.m4
+@@ -399,51 +399,3 @@ fi
+ LIBS="$af_check_ldap_parse_page_control_save_libs"
+ ])
+ 
+-dnl --------------------------------------------------------------------------
+-dnl AF_CHECK_LIBTIRPC
+-dnl
+-dnl Use libtirpc for rpc transport
+-dnl --------------------------------------------------------------------------
+-AC_DEFUN([AF_CHECK_LIBTIRPC],
+-[
+-# save current flags
+-af_check_libtirpc_save_cflags="$CFLAGS"
+-af_check_libtirpc_save_libs="$LIBS"
+-CFLAGS="$CFLAGS -I/usr/include/tirpc"
+-LIBS="$LIBS -ltirpc"
+-
+-AC_TRY_LINK(
+-    [ #include <rpc/rpc.h> ],
+-    [ CLIENT *cl;
+-      struct sockaddr_in addr;
+-      int fd;
+-      unsigned long ul; struct timeval t; unsigned int ui;
+-      cl = clntudp_bufcreate(&addr,ul,ul,t,&fd,ui,ui); ],
+-    [ af_have_libtirpc=yes
+-      AC_MSG_RESULT(yes) ],
+-    [ AC_MSG_RESULT(no) ])
+-
+-if test "$af_have_libtirpc" = "yes"; then
+-    AC_DEFINE(WITH_LIBTIRPC,1, [Define to 1 if you have the libtirpc library installed])
+-    AC_DEFINE(TIRPC_WORKAROUND,1, [Define to 1 to use the libtirpc tsd usage workaround])
+-    TIRPCLIB="-ltirpc"
+-fi
+-
+-AC_CHECK_FUNCS([getrpcbyname getservbyname])
+-
+-# restore flags
+-CFLAGS="$af_check_libtirpc_save_cflags"
+-LIBS="$af_check_libtirpc_save_libs"
+-])
+-
+-AC_DEFUN([AF_WITH_LIBTIRPC],
+-[AC_MSG_CHECKING([if libtirpc is requested and available])
+-AC_ARG_WITH(libtirpc,
+-[  --with-libtirpc         use libtirpc if available],
+-[if test "$withval" = yes; then
+-  AF_CHECK_LIBTIRPC()
+-else
+-  AC_MSG_RESULT(no)
+-fi], [AC_MSG_RESULT(no)])
+-])
+-
+diff --git a/configure.in b/configure.in
+index 0521252..43a2776 100644
+--- a/configure.in
++++ b/configure.in
+@@ -11,6 +11,9 @@ define([AC_CACHE_LOAD], )dnl
+ define([AC_CACHE_SAVE], )dnl
+ AC_INIT(.autofs-5.1.3)
+ 
++# for pkg-config/pkconf
++m4_include([pkg.m4])
++
+ #
+ # autofs installs by default in /usr
+ #
+@@ -124,8 +127,12 @@ AC_SUBST(flagdir)
+ #
+ # Use libtirpc
+ #
+-AF_WITH_LIBTIRPC()
+-AC_SUBST(TIRPCLIB)
++PKG_PROG_PKG_CONFIG()
++
++AC_ARG_WITH([libtirpc], AS_HELP_STRING([--with-libtirpc], [Build with the TIRPC library]))
++if test "x$with_libtirpc" = "xyes"; then
++  PKG_CHECK_MODULES([TIRPC],[libtirpc])
++fi
+ 
+ #
+ # Optional include dmalloc
+-- 
+2.1.4
+
diff --git a/package/autofs/Config.in b/package/autofs/Config.in
index 8e08357..efb0ec2 100644
--- a/package/autofs/Config.in
+++ b/package/autofs/Config.in
@@ -2,8 +2,8 @@ config BR2_PACKAGE_AUTOFS
 	bool "autofs"
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	depends on !BR2_STATIC_LIBS # dlfcn
+	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
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
index 148ab1b..eb28306 100644
--- a/package/autofs/autofs.mk
+++ b/package/autofs/autofs.mk
@@ -9,7 +9,8 @@ AUTOFS_SOURCE = autofs-$(AUTOFS_VERSION).tar.xz
 AUTOFS_SITE = $(BR2_KERNEL_MIRROR)/linux/daemons/autofs/v5
 AUTOFS_LICENSE = GPL-2.0+
 AUTOFS_LICENSE_FILES = COPYING COPYRIGHT
-AUTOFS_DEPENDENCIES = host-flex host-bison
+AUTOFS_DEPENDENCIES = host-flex host-bison host-pkgconf
+AUTOFS_AUTORECONF = YES
 
 # autofs looks on the build machine for the path of modprobe, so tell
 # it explicitly where it will be located on the target.
@@ -31,4 +32,11 @@ AUTOFS_CONF_OPTS = \
 
 AUTOFS_MAKE_ENV = DONTSTRIP=1
 
+ifeq ($(BR2_TOOLCHAIN_HAS_NATIVE_RPC),)
+AUTOFS_CONF_OPTS += --with-libtirpc
+AUTOFS_DEPENDENCIES += libtirpc
+else
+AUTOFS_CONF_OPTS += --without-libtirpc
+endif
+
 $(eval $(autotools-package))
-- 
2.1.4
