From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 14 Jun 2008 14:01:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  pkgconfig
Message-ID: <20080614210100.7FEC53C8BA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-14 14:00:59 -0700 (Sat, 14 Jun 2008)
New Revision: 22339

Log:
pkgconfig: bump version and cleanup

Upgrade to pkgconfig 0.23 which has native sysroot support (buggy,
but easily fixable), which allows us to get rid of pkgconfig-filter.sh.
At the same time cleanup the makefile.



Added:
   trunk/buildroot/package/pkgconfig/pkg-config-0.23-fix-sysroot.patch

Removed:
   trunk/buildroot/package/pkgconfig/configure.patch
   trunk/buildroot/package/pkgconfig/glibconfig-sysdefs.patch
   trunk/buildroot/package/pkgconfig/pkgconfig-filter.sh

Modified:
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/package/pkgconfig/pkgconfig.mk


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2008-06-14 19:38:35 UTC (rev 22338)
+++ trunk/buildroot/package/Makefile.in	2008-06-14 21:00:59 UTC (rev 22339)
@@ -226,11 +226,9 @@
 		NM_FOR_TARGET="$(TARGET_NM)" \
 		DEFAULT_ASSEMBLER="$(TARGET_AS)" \
 		DEFAULT_LINKER="$(TARGET_LD)" \
-		PKG_CONFIG_SYSROOT="$(STAGING_DIR)" \
+		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
 		PKG_CONFIG="$(STAGING_DIR)/usr/bin/pkg-config" \
 		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
-		PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
-		PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
 		STAGING_DIR="$(STAGING_DIR)"
 
 HOST_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \

Deleted: trunk/buildroot/package/pkgconfig/configure.patch
===================================================================
--- trunk/buildroot/package/pkgconfig/configure.patch	2008-06-14 19:38:35 UTC (rev 22338)
+++ trunk/buildroot/package/pkgconfig/configure.patch	2008-06-14 21:00:59 UTC (rev 22339)
@@ -1,331 +0,0 @@
---- pkgconfig-0.15.0/glib-1.2.8/Makefile.am~configure.patch
-+++ pkgconfig-0.15.0/glib-1.2.8/Makefile.am
-@@ -65,7 +65,7 @@
- 
- CONFIGURE_DEPENDENCIES = acglib.m4		
- 
--BUILT_SOURCES = stamp-gc-h #note: not glibconfig.h
-+BUILT_SOURCES += stamp-gc-h #note: not glibconfig.h
- glibconfig.h: stamp-gc-h
- 	@:
- stamp-gc-h: config.status
---- pkgconfig-0.20/configure.in~configure.patch
-+++ pkgconfig-0.20/configure.in
-@@ -1,6 +1,7 @@
- 
- AC_INIT(pkg-config.1)
- 
-+AC_CONFIG_AUX_DIR(.)
- AM_INIT_AUTOMAKE(pkg-config, 0.21)
- AM_MAINTAINER_MODE
- 
-@@ -92,8 +93,6 @@
- 
-   AC_SUBST(GLIB_LIBS)
-   AC_SUBST(GLIB_CFLAGS)
--
--  AC_CONFIG_AUX_DIR(.)
- else
-   AC_CONFIG_SUBDIRS(glib-1.2.8)
- fi # !native_win32
---- pkgconfig-0.20/glib-1.2.8/configure.in.orig	2005-10-16 11:12:52.000000000 -0600
-+++ pkgconfig-0.20/glib-1.2.8/configure.in	2006-07-07 16:11:05.000000000 -0600
-@@ -1,10 +1,11 @@
- dnl ***********************************
- dnl *** include special GLib macros ***
- dnl ***********************************
--builtin(include, acglib.m4)dnl
-+dnl no need, just use aclocal -I . --CL
-+dnl builtin(include, acglib.m4)dnl
- 
- # require autoconf 2.13
--AC_PREREQ(2.13)
-+AC_PREREQ(2.53)
- 
- # init autoconf (and check for presence of glist.c)
- AC_INIT(glist.c)
-@@ -15,6 +16,39 @@
- # we rewrite this file
- rm -f glibconfig-sysdefs.h
- 
-+# config defines
-+
-+AH_TEMPLATE([ENABLE_MEM_CHECK], [Define if enabling memory checking])
-+AH_TEMPLATE([ENABLE_MEM_PROFILE], [])
-+AH_TEMPLATE([GLIB_BINARY_AGE], [])
-+AH_TEMPLATE([GLIB_BYTE_CONTENTS_GMUTEX], [])
-+AH_TEMPLATE([GLIB_INTERFACE_AGE], [])
-+AH_TEMPLATE([GLIB_MAJOR_VERSION], [])
-+AH_TEMPLATE([GLIB_MINOR_VERSION], [])
-+AH_TEMPLATE([GLIB_MICRO_VERSION], [])
-+AH_TEMPLATE([GLIB_SIZEOF_GMUTEX], [])
-+AH_TEMPLATE([G_COMPILED_WITH_DEBUGGING], [])
-+AH_TEMPLATE([G_HAVE_INLINE], [])
-+AH_TEMPLATE([G_HAVE___INLINE], [])
-+AH_TEMPLATE([G_HAVE___INLINE__], [])
-+AH_TEMPLATE([G_THREAD_SOURCE], [])
-+AH_TEMPLATE([G_VA_COPY], [])
-+AH_TEMPLATE([G_VA_COPY_AS_ARRAY], [])
-+AH_TEMPLATE([HAVE_BROKEN_WCTYPE], [])
-+AH_TEMPLATE([HAVE_GETPWUID_R], [])
-+AH_TEMPLATE([HAVE_GETPWUID_R_POSIX], [])
-+AH_TEMPLATE([HAVE_PTHREAD_COND_TIMEDWAIT_POSIX], [])
-+AH_TEMPLATE([HAVE_PTHREAD_GETSPECIFIC_POSIX], [])
-+AH_TEMPLATE([HAVE_PTHREAD_MUTEX_TRYLOCK_POSIX], [])
-+AH_TEMPLATE([HAVE_WCHAR_H], [])
-+AH_TEMPLATE([HAVE_WCTYPE_H], [])
-+AH_TEMPLATE([NO_FD_SET], [])
-+AH_TEMPLATE([NO_SYS_ERRLIST], [])
-+AH_TEMPLATE([NO_SYS_SIGLIST], [])
-+AH_TEMPLATE([NO_SYS_SIGLIST_DECL], [])
-+AH_TEMPLATE([REALLOC_0_WORKS], [])
-+
-+
- dnl we need to AC_DIVERT_PUSH/AC_DIVERT_POP these variable definitions so they
- dnl are available for $ac_help expansion (don't we all *love* autoconf?)
- GLIB_AC_DIVERT_BEFORE_HELP([
-@@ -173,7 +207,9 @@
-          CFLAGS=$glib_save_CFLAGS
-          AC_MSG_WARN(
-                 [No ANSI prototypes found in library. (-std1 didn't work.)])
-+	, AC_MSG_WARN([Skipping test due to crosscompilation])
-      )
-+     , AC_MSG_WARN([Skipping test due to crosscompilation])
- )
- LIBS=$glib_save_LIBS
- 
-@@ -384,11 +420,13 @@
- 	  return realloc (0, sizeof (int)) == 0;
- 	}],
- 	glib_cv_sane_realloc=yes
--	AC_DEFINE(REALLOC_0_WORKS)
- 	,
- 	glib_cv_sane_realloc=no
- 	,)
- ])
-+if test "x$glib_cv_sane_realloc" = "xyes"; then
-+	AC_DEFINE(REALLOC_0_WORKS)
-+fi
- AC_MSG_RESULT($glib_cv_sane_realloc)
- 
- 
-@@ -464,7 +502,8 @@
- ])
- if test "x$glib_cv_va_copy" = "xyes"; then
-   AC_DEFINE(G_VA_COPY, va_copy)
--else if test "x$glib_cv___va_copy" = "xyes"; then
-+else
-+if test "x$glib_cv___va_copy" = "xyes"; then
-   AC_DEFINE(G_VA_COPY, __va_copy)
- fi
- fi
-@@ -473,6 +512,7 @@
- fi
- AC_MSG_RESULT($glib_cv_va_val_copy)
- 
-+AC_MSG_WARN([hi mom])
- 
- dnl ***********************
- dnl *** g_module checks ***
-@@ -484,12 +524,12 @@
- G_MODULE_HAVE_DLERROR=0
- dnl *** dlopen() and dlsym() in system libraries
- if test -z "$G_MODULE_IMPL"; then
--	AC_CHECK_FUNC(dlopen,
--		[AC_CHECK_FUNC(dlsym,
-+	AC_CHECK_FUNC(dlopen,[
-+		AC_CHECK_FUNC(dlsym,[
- 			G_MODULE_IMPL=G_MODULE_IMPL_DL
--		,)]
--	,)
--
-+			],
-+		)],
-+	)
- fi
- 
- dnl *** dlopen() and dlsym() in libdl
-@@ -578,6 +618,7 @@
- AC_SUBST(G_MODULE_HAVE_DLERROR)
- AC_SUBST(G_MODULE_NEED_USCORE)
- AC_SUBST(GLIB_DEBUG_FLAGS)
-+AC_MSG_WARN([hi mom])
- 
- 
- dnl ***********************
-@@ -891,13 +932,14 @@
- dnl ****************************************
- dnl *** GLib POLL* compatibility defines ***
- dnl ****************************************
-+if test x"$cross_compiling" != xyes; then
- GLIB_SYSDEFS(
- [#include <sys/types.h>
- #include <sys/poll.h>],
- 	POLLIN:1 POLLOUT:4 POLLPRI:2 POLLERR:8 POLLHUP:16 POLLNVAL:32,
- 	glibconfig-sysdefs.h,
- 	=)
--
-+fi
- 
- dnl ******************************
- dnl *** output the whole stuff ***
-@@ -954,7 +996,7 @@
- 	  echo '#define GLIB_HAVE_SYS_POLL_H' >> $outfile
- 	fi
- 
--	cat >> $outfile <<_______EOF
-+	cat >> $outfile <<EOF
- 
- #define G_MINFLOAT	$glib_mf
- #define G_MAXFLOAT	$glib_Mf
-@@ -967,60 +1009,60 @@
- #define G_MINLONG	$glib_ml
- #define G_MAXLONG	$glib_Ml
- 
--_______EOF
-+EOF
- 
- 
- 	### this should always be true in a modern C/C++ compiler
--	cat >>$outfile <<_______EOF
-+	cat >>$outfile <<EOF
- typedef signed char gint8;
- typedef unsigned char guint8;
--_______EOF
-+EOF
- 
- 
- 	if test -n "$gint16"; then
--	  cat >>$outfile <<_______EOF
-+	  cat >>$outfile <<EOF
- typedef signed $gint16 gint16;
- typedef unsigned $gint16 guint16;
--_______EOF
-+EOF
- 	fi
- 
- 
- 	if test -n "$gint32"; then
--	  cat >>$outfile <<_______EOF
-+	  cat >>$outfile <<EOF
- typedef signed $gint32 gint32;
- typedef unsigned $gint32 guint32;
--_______EOF
-+EOF
- 	fi
- 
- 
- 	if test -n "$gint64"; then
--	  cat >>$outfile <<_______EOF
-+	  cat >>$outfile <<EOF
- ${glib_warning_guard}#define G_HAVE_GINT64 1
- 
- ${glib_extension}typedef signed $gint64 gint64;
- ${glib_extension}typedef unsigned $gint64 guint64;
- 
- #define G_GINT64_CONSTANT(val)	$gint64_constant
--_______EOF
-+EOF
- 	fi
- 
- 
- 	if test -z "$glib_unknown_void_p"; then
--	  cat >>$outfile <<_______EOF
-+	  cat >>$outfile <<EOF
- 
- #define GPOINTER_TO_INT(p)	((gint)  ${glib_gpi_cast} (p))
- #define GPOINTER_TO_UINT(p)	((guint) ${glib_gpui_cast} (p))
- 
- #define GINT_TO_POINTER(i)	((gpointer) ${glib_gpi_cast} (i))
- #define GUINT_TO_POINTER(u)	((gpointer) ${glib_gpui_cast} (u))
--_______EOF
-+EOF
- 	else
- 	  echo '#error SIZEOF_VOID_P unknown - This should never happen' >>$outfile
- 	fi
- 
- 
- 
--	cat >>$outfile <<_______EOF
-+	cat >>$outfile <<EOF
- $glib_atexit
- $glib_memmove
- $glib_defines
-@@ -1032,11 +1074,11 @@
- #else	/* !__cplusplus */
- $glib_inline
- #endif	/* !__cplusplus */
--_______EOF
-+EOF
- 
- 	echo >>$outfile
- 	if test x$g_mutex_has_default = xyes; then
--		cat >>$outfile <<_______EOF
-+		cat >>$outfile <<EOF
- $g_enable_threads_def G_THREADS_ENABLED
- #define G_THREADS_IMPL_$g_threads_impl_def
- typedef struct _GStaticMutex GStaticMutex;
-@@ -1054,15 +1096,15 @@
- #define	g_static_mutex_get_mutex(mutex) \
-   (g_thread_use_default_impl ? ((GMutex*) &((mutex)->aligned_pad_u)) : \
-    g_static_mutex_get_mutex_impl (&((mutex)->runtime_mutex)))
--_______EOF
-+EOF
- 	else
--		cat >>$outfile <<_______EOF
-+		cat >>$outfile <<EOF
- $g_enable_threads_def G_THREADS_ENABLED
- #define G_THREADS_IMPL_$g_threads_impl_def
- typedef struct _GMutex* GStaticMutex;
- #define G_STATIC_MUTEX_INIT NULL
- #define g_static_mutex_get_mutex(mutex) (g_static_mutex_get_mutex_impl (mutex))
--_______EOF
-+EOF
- 	fi
- 
- 	echo >>$outfile
-@@ -1071,15 +1113,15 @@
- 	  g_bit_sizes="$g_bit_sizes 64"
- 	fi
- 	for bits in $g_bit_sizes; do
--	  cat >>$outfile <<_______EOF
-+	  cat >>$outfile <<EOF
- #define GINT${bits}_TO_${g_bs_native}(val)	((gint${bits}) (val))
- #define GUINT${bits}_TO_${g_bs_native}(val)	((guint${bits}) (val))
- #define GINT${bits}_TO_${g_bs_alien}(val)	((gint${bits}) GUINT${bits}_SWAP_LE_BE (val))
- #define GUINT${bits}_TO_${g_bs_alien}(val)	(GUINT${bits}_SWAP_LE_BE (val))
--_______EOF
-+EOF
- 	done
- 
--	cat >>$outfile <<_______EOF
-+	cat >>$outfile <<EOF
- #define GLONG_TO_LE(val)	((glong) GINT${glongbits}_TO_LE (val))
- #define GULONG_TO_LE(val)	((gulong) GUINT${glongbits}_TO_LE (val))
- #define GLONG_TO_BE(val)	((glong) GINT${glongbits}_TO_BE (val))
-@@ -1090,14 +1132,14 @@
- #define GUINT_TO_BE(val)	((guint) GUINT${gintbits}_TO_BE (val))
- #define G_BYTE_ORDER $g_byte_order
- 
--_______EOF
-+EOF
- 
- 	if test -r glibconfig-sysdefs.h; then
- 	  cat glibconfig-sysdefs.h >>$outfile
- 	fi
- 
- 
--	cat >>$outfile <<_______EOF
-+	cat >>$outfile <<EOF
- 
- $glib_wc
- 
-@@ -1107,7 +1149,7 @@
- #endif /* __cplusplus */
- 
- #endif /* GLIBCONFIG_H */
--_______EOF
-+EOF
- 
- 
- 	if cmp -s $outfile glibconfig.h; then

Deleted: trunk/buildroot/package/pkgconfig/glibconfig-sysdefs.patch
===================================================================
--- trunk/buildroot/package/pkgconfig/glibconfig-sysdefs.patch	2008-06-14 19:38:35 UTC (rev 22338)
+++ trunk/buildroot/package/pkgconfig/glibconfig-sysdefs.patch	2008-06-14 21:00:59 UTC (rev 22339)
@@ -1,9 +0,0 @@
---- pkgconfig/glib-1.2.8/null	2006-05-22 05:44:12.000000000 -0600
-+++ pkgconfig/glib-1.2.8/glibconfig-sysdefs.h	2006-06-29 11:18:04.000000000 -0600
-@@ -0,0 +1,6 @@
-+#define GLIB_SYSDEF_POLLIN =1
-+#define GLIB_SYSDEF_POLLOUT =4
-+#define GLIB_SYSDEF_POLLPRI =2
-+#define GLIB_SYSDEF_POLLERR =8
-+#define GLIB_SYSDEF_POLLHUP =16
-+#define GLIB_SYSDEF_POLLNVAL =32

Added: trunk/buildroot/package/pkgconfig/pkg-config-0.23-fix-sysroot.patch
===================================================================
--- trunk/buildroot/package/pkgconfig/pkg-config-0.23-fix-sysroot.patch	                        (rev 0)
+++ trunk/buildroot/package/pkgconfig/pkg-config-0.23-fix-sysroot.patch	2008-06-14 21:00:59 UTC (rev 22339)
@@ -0,0 +1,34 @@
+[PATCH] fix PKG_CONFIG_SYSROOT_DIR handling
+
+With PKG_CONFIG_SYSROOT_DIR enabled, everything else than -L and -I words
+gets stripped away.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ pkg.c |    8 ++------
+ 1 file changed, 2 insertions(+), 6 deletions(-)
+
+Index: pkg-config-0.23/pkg.c
+===================================================================
+--- pkg-config-0.23.orig/pkg.c
++++ pkg-config-0.23/pkg.c
+@@ -472,17 +472,13 @@
+   while (tmp != NULL)
+     {
+       char *tmpstr = (char*) tmp->data;
+-      if (pcsysrootdir != NULL)
++      if (pcsysrootdir != NULL && tmpstr[0] == '-' &&
++          (tmpstr[1] == 'I' || tmpstr[1] == 'L'))
+ 	{
+-	  if (tmpstr[0] == '-' &&
+-	      (tmpstr[1] == 'I' ||
+-	       tmpstr[1] == 'L'))
+-	    {
+ 	      g_string_append_c (str, '-');
+ 	      g_string_append_c (str, tmpstr[1]);
+ 	      g_string_append (str, pcsysrootdir);
+ 	      g_string_append (str, tmpstr+2);
+-	    }
+ 	}
+       else 
+ 	{

Deleted: trunk/buildroot/package/pkgconfig/pkgconfig-filter.sh
===================================================================
--- trunk/buildroot/package/pkgconfig/pkgconfig-filter.sh	2008-06-14 19:38:35 UTC (rev 22338)
+++ trunk/buildroot/package/pkgconfig/pkgconfig-filter.sh	2008-06-14 21:00:59 UTC (rev 22339)
@@ -1,28 +0,0 @@
-#!/bin/bash
-# filter the output from pkg-config (renamed as pkg-config.real)
-# and ensures PKG_CONFIG_SYSROOT is prepended to all paths
-
-set -o pipefail
-
-CMD=$0
-
-if [ ! "$PKG_CONFIG_SYSROOT" ]; then
-	echo "pkg-config-filter: missing \$PKG_CONFIG_SYSROOT environment variable"
-	exit 2
-fi
-
-export PKG_CONFIG_LIBDIR
-export PKG_CONFIG_PATH
-
-if $CMD.real $* |
-	sed -e "s~\-L/*$PKG_CONFIG_SYSROOT/*~-L=/~g; s~\-I/*$PKG_CONFIG_SYSROOT/*~-I=/~g;" |
-	sed -e "s~\-L/~-L=/~g; s~\-I/~-I=/~g;" |
-	sed -e "s~\-L\=~-L$PKG_CONFIG_SYSROOT~g; s~\-I\=~-I$PKG_CONFIG_SYSROOT~g;"
-then
-	#echo "PKG_CONFIG_LIBDIR=$PKG_CONFIG_LIBDIR" >&2
-	#echo "PKG_CONFIG_PATH=$PKG_CONFIG_PATH" >&2
-	#echo "OKAY" >&2;
-	exit 0;
-else
-	exit $?
-fi

Modified: trunk/buildroot/package/pkgconfig/pkgconfig.mk
===================================================================
--- trunk/buildroot/package/pkgconfig/pkgconfig.mk	2008-06-14 19:38:35 UTC (rev 22338)
+++ trunk/buildroot/package/pkgconfig/pkgconfig.mk	2008-06-14 21:00:59 UTC (rev 22339)
@@ -3,7 +3,7 @@
 # pkgconfig
 #
 #############################################################
-PKGCONFIG_VERSION:=0.21
+PKGCONFIG_VERSION:=0.23
 PKGCONFIG_SOURCE:=pkg-config-$(PKGCONFIG_VERSION).tar.gz
 PKGCONFIG_SITE:=http://pkgconfig.freedesktop.org/releases/
 PKGCONFIG_DIR:=$(BUILD_DIR)/pkg-config-$(PKGCONFIG_VERSION)
@@ -25,17 +25,8 @@
 	(cd $(PKGCONFIG_DIR); rm -rf config.cache; \
 		./configure \
 		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
 		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		--with-pc-path="$(STAGING_DIR)/lib/pkgconfig:$(STAGING_DIR)/usr/lib/pkgconfig" \
+		--with-pc-path="$(STAGING_DIR)/usr/lib/pkgconfig" \
 		$(DISABLE_NLS) \
 		$(DISABLE_LARGEFILE) \
 	)
@@ -46,11 +37,7 @@
 
 $(STAGING_DIR)/$(PKGCONFIG_TARGET_BINARY): $(PKGCONFIG_DIR)/$(PKGCONFIG_BINARY)
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(PKGCONFIG_DIR) install
-	mv $(STAGING_DIR)/usr/bin/pkg-config $(STAGING_DIR)/usr/bin/pkg-config.real
-	cp package/pkgconfig/pkgconfig-filter.sh $(STAGING_DIR)/usr/bin/pkg-config
-	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig
-	rm -rf $(STAGING_DIR)/share/locale $(STAGING_DIR)/usr/info \
-		$(STAGING_DIR)/usr/man $(STAGING_DIR)/usr/share/doc
+	rm -rf $(STAGING_DIR)/usr/share/man
 
 pkgconfig: uclibc $(STAGING_DIR)/$(PKGCONFIG_TARGET_BINARY)
 
