From: Daniel Mack <zonque@gmail.com>
Date: Tue,  6 Dec 2011 12:45:59 +0100
Subject: [Buildroot] [PATCH 3/3] libglib2: bump to version 2.30.2
In-Reply-To: <1323171959-24873-1-git-send-email-zonque@gmail.com>
References: <1323171959-24873-1-git-send-email-zonque@gmail.com>
Message-ID: <1323171959-24873-4-git-send-email-zonque@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Important changes for this version bump are that libffi (for both host
and target) is now a hard requirement for libglib.

The patch regarding atomic function seems obsolete now, as this part of
the lib was rewritten. I couldn't figure which platform this used to
break on, but in worst case, it would be trivial to redo this one-liner.

Also, there's an issue in the upstream package that makes configure fail
for cross-builds with "configure: error: cannot run test program while
cross compiling". This issue was reported, but the patch was rejected.
Appearantly, the developers don't expect people to use configure for
cross environments anymore, so we have to maintain this patch locally.
For more information, see

  https://bugzilla.gnome.org/show_bug.cgi?id=665607

Signed-off-by: Daniel Mack <zonque@gmail.com>
---
 package/libglib2/Config.in                         |    1 +
 ...ib2-configure.ac-fix-cross-compile-builds.patch |   39 ++++++++++++++++++++
 ...b2-fix-compilation-with-no-builtin-atomic.patch |   25 -------------
 package/libglib2/libglib2.mk                       |   11 ++++--
 4 files changed, 47 insertions(+), 29 deletions(-)
 create mode 100644 package/libglib2/libglib2-configure.ac-fix-cross-compile-builds.patch
 delete mode 100644 package/libglib2/libglib2-fix-compilation-with-no-builtin-atomic.patch

diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
index 3d42430..71682cd 100644
--- a/package/libglib2/Config.in
+++ b/package/libglib2/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LIBFFI
 	depends on BR2_USE_WCHAR # gettext
 	help
 	  Low-level core library that forms the basis of GTK+ and GNOME.
diff --git a/package/libglib2/libglib2-configure.ac-fix-cross-compile-builds.patch b/package/libglib2/libglib2-configure.ac-fix-cross-compile-builds.patch
new file mode 100644
index 0000000..ff0d036
--- /dev/null
+++ b/package/libglib2/libglib2-configure.ac-fix-cross-compile-builds.patch
@@ -0,0 +1,39 @@
+From 22fd992b8e4acbbbcaf099bb1eafab6670a22022 Mon Sep 17 00:00:00 2001
+From: Daniel Mack <zonque@gmail.com>
+Date: Mon, 5 Dec 2011 17:28:32 +0100
+Subject: [PATCH] configure.ac: fix cross-compile builds
+
+When cross-compiling for ARM platforms, I was getting the following
+error:
+
+  checking for qsort_r... yes
+  checking if qsort_r uses glibc compatible argument order... configure:
+  error: in `/home/daniel/src/glib':
+  configure: error: cannot run test program while cross compiling
+  See `config.log' for more details
+
+Use the 4th argument of AC_RUN_IFELSE and assume
+glib_cv_have_qsort_r=no for cross-compile builds, just to be sure glib
+doesn't relay on any faulty functions.
+
+Signed-off-by: Daniel Mack <zonque@gmail.com>
+---
+ configure.ac |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 1befff3..e770c20 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -608,7 +608,7 @@ if test x$ac_cv_func_qsort_r = xyes ; then
+       return 0;
+     else
+       return 1;
+-  }]])],[glib_cv_have_qsort_r=yes],[glib_cv_have_qsort_r=no])])
++  }]])],[glib_cv_have_qsort_r=yes],[glib_cv_have_qsort_r=no],[glib_cv_have_qsort_r=no])])
+ fi
+ 
+ if test x$glib_cv_have_qsort_r = xyes ; then
+-- 
+1.7.7.3
+
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
index 0832ac3..c5bc4a9 100644
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
@@ -13,6 +13,9 @@ LIBGLIB2_INSTALL_STAGING = YES
 LIBGLIB2_INSTALL_TARGET = YES
 LIBGLIB2_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 
+# we have to patch configure.ac
+LIBGLIB2_AUTORECONF = YES
+
 LIBGLIB2_CONF_ENV =	\
 		ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		glib_cv_uscore=no ac_cv_func_strtod=yes \
@@ -48,9 +51,9 @@ HOST_LIBGLIB2_CONF_OPT = \
 		--disable-gtk-doc \
 		--enable-debug=no \
 
-LIBGLIB2_DEPENDENCIES = host-pkg-config host-libglib2 zlib $(if $(BR2_NEEDS_GETTEXT),gettext libintl)
+LIBGLIB2_DEPENDENCIES = host-pkg-config host-libglib2 zlib libffi $(if $(BR2_NEEDS_GETTEXT),gettext libintl)
 
-HOST_LIBGLIB2_DEPENDENCIES = host-pkg-config host-zlib
+HOST_LIBGLIB2_DEPENDENCIES = host-pkg-config host-zlib host-libffi
 
 ifneq ($(BR2_ENABLE_LOCALE),y)
 LIBGLIB2_DEPENDENCIES+=libiconv
-- 
1.7.7.3
