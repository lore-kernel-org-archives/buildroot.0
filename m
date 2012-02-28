From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 28 Feb 2012 09:22:03 +0100
Subject: [Buildroot] [git commit branch/next] libglib2: update to version
	2.30.2
Message-ID: <20120228082317.5463590BB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4fd8bdc7da9e69d7c7515f1577de3e5c427dde89
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update to latest stable release and add a dependency on libffi which
is needed by GObject.

[Peter: fixup build on uClibc]
Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libglib2/Config.in                         |    1 +
 ...b2-fix-compilation-with-no-builtin-atomic.patch |   25 --------------------
 package/libglib2/libglib2.mk                       |   16 ++++++------
 3 files changed, 9 insertions(+), 33 deletions(-)

diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
index 3d42430..d1d7231 100644
--- a/package/libglib2/Config.in
+++ b/package/libglib2/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_ZLIB
 	depends on BR2_USE_WCHAR # gettext
 	help
diff --git a/package/libglib2/libglib2-fix-compilation-with-no-builtin-atomic.patch b/package/libglib2/libglib2-fix-compilation-with-no-builtin-atomic.patch
deleted file mode 100644
index 39c0510..0000000
--- a/package/libglib2/libglib2-fix-compilation-with-no-builtin-atomic.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 58096320ea0888c4fbbff318839017a4d2e82703 Mon Sep 17 00:00:00 2001
-From: Lionel Landwerlin <llandwerlin@gmail.com>
-Date: Sat, 6 Nov 2010 14:56:15 +0100
-Subject: [PATCH] glib: fix compilation with no builtin atomic operations compilers
-
-Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
----
- glib/gatomic.c |    1 +
- 1 files changed, 1 insertions(+), 0 deletions(-)
-
-diff --git a/glib/gatomic.c b/glib/gatomic.c
-index 845c866..01468ce 100644
---- a/glib/gatomic.c
-+++ b/glib/gatomic.c
-@@ -881,6 +881,7 @@ g_atomic_pointer_compare_and_exchange (volatile gpointer G_GNUC_MAY_ALIAS *atomi
- #endif /* DEFINE_WITH_WIN32_INTERLOCKED */
- 
- #ifdef DEFINE_WITH_MUTEXES
-+# include "gthread.h"
- /* We have to use the slow, but safe locking method */
- static GMutex *g_atomic_mutex; 
- 
--- 
-1.7.2.3
-
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 0832ac3..d0d9c5c 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -3,8 +3,8 @@
 # libglib2
 #
 #############################################################
-LIBGLIB2_VERSION_MAJOR = 2.28
-LIBGLIB2_VERSION_MINOR = 8
+LIBGLIB2_VERSION_MAJOR = 2.30
+LIBGLIB2_VERSION_MINOR = 2
 LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).$(LIBGLIB2_VERSION_MINOR)
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.bz2
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
@@ -13,7 +13,7 @@ LIBGLIB2_INSTALL_STAGING = YES
 LIBGLIB2_INSTALL_TARGET = YES
 LIBGLIB2_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 
-LIBGLIB2_CONF_ENV =	\
+LIBGLIB2_CONF_ENV = \
 		ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		glib_cv_uscore=no ac_cv_func_strtod=yes \
 		ac_fsusage_space=yes fu_cv_sys_stat_statfs2_bsize=yes \
@@ -41,24 +41,24 @@ LIBGLIB2_CONF_ENV =	\
 		ac_cv_func_working_mktime=yes jm_cv_func_working_re_compile_pattern=yes \
 		ac_use_included_regex=no gl_cv_c_restrict=no \
 		ac_cv_path_GLIB_GENMARSHAL=$(HOST_DIR)/usr/bin/glib-genmarshal ac_cv_prog_F77=no \
-		ac_cv_func_posix_getgrgid_r=no \
+		ac_cv_func_posix_getgrgid_r=no glib_cv_have_qsort_r=yes \
 		gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no)
 
 HOST_LIBGLIB2_CONF_OPT = \
 		--disable-gtk-doc \
 		--enable-debug=no \
 
-LIBGLIB2_DEPENDENCIES = host-pkg-config host-libglib2 zlib $(if $(BR2_NEEDS_GETTEXT),gettext libintl)
+LIBGLIB2_DEPENDENCIES = host-pkg-config host-libglib2 libffi zlib $(if $(BR2_NEEDS_GETTEXT),gettext libintl)
 
-HOST_LIBGLIB2_DEPENDENCIES = host-pkg-config host-zlib
+HOST_LIBGLIB2_DEPENDENCIES = host-pkg-config host-libffi host-zlib
 
 ifneq ($(BR2_ENABLE_LOCALE),y)
-LIBGLIB2_DEPENDENCIES+=libiconv
+LIBGLIB2_DEPENDENCIES += libiconv
 endif
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 LIBGLIB2_CONF_OPT += --with-libiconv=gnu
-LIBGLIB2_DEPENDENCIES+=libiconv
+LIBGLIB2_DEPENDENCIES += libiconv
 endif
 
 define LIBGLIB2_REMOVE_DEV_FILES
