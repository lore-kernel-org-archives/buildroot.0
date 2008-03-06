From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 09:56:31 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/cairo: old_patches
Message-ID: <20080306175631.BBBB51201D2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 09:56:30 -0800 (Thu, 06 Mar 2008)
New Revision: 21185

Log:
updated cairo

Added:
   trunk/buildroot/package/cairo/cairo-1.4.14-libdir-la.patch
   trunk/buildroot/package/cairo/old_patches/
   trunk/buildroot/package/cairo/old_patches/0001-Add-autoconf-macro-AX_C_FLOAT_WORDS_BIGENDIAN.patch
   trunk/buildroot/package/cairo/old_patches/0002-Change-_cairo_fixed_from_double-to-use-the-magic-number-technique.patch

Removed:
   trunk/buildroot/package/cairo/0001-Add-autoconf-macro-AX_C_FLOAT_WORDS_BIGENDIAN.patch
   trunk/buildroot/package/cairo/0002-Change-_cairo_fixed_from_double-to-use-the-magic-number-technique.patch
   trunk/buildroot/package/cairo/libdir-la.patch

Modified:
   trunk/buildroot/package/cairo/cairo.mk


Changeset:
Deleted: trunk/buildroot/package/cairo/0001-Add-autoconf-macro-AX_C_FLOAT_WORDS_BIGENDIAN.patch
===================================================================
--- trunk/buildroot/package/cairo/0001-Add-autoconf-macro-AX_C_FLOAT_WORDS_BIGENDIAN.patch	2008-03-06 17:56:10 UTC (rev 21184)
+++ trunk/buildroot/package/cairo/0001-Add-autoconf-macro-AX_C_FLOAT_WORDS_BIGENDIAN.patch	2008-03-06 17:56:30 UTC (rev 21185)
@@ -1,103 +0,0 @@
-From nobody Mon Sep 17 00:00:00 2001
-From: Dan Amelang <dan@amelang.net>
-Date: Sun Oct 29 21:30:08 2006 -0800
-Subject: [PATCH] Add autoconf macro AX_C_FLOAT_WORDS_BIGENDIAN
-
-The symbol that this macro defines (FLOAT_WORDS_BIGENDIAN) can be used
-to make double arithmetic tricks portable.
-
----
-
- acinclude.m4 |   65 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
- configure.in |    1 +
- 2 files changed, 66 insertions(+), 0 deletions(-)
-
-3231d91b59a6c2e1c40bbaa8b143694b6c693662
-diff --git a/acinclude.m4 b/acinclude.m4
-index af73800..a0eb13a 100644
---- a/acinclude.m4
-+++ b/acinclude.m4
-@@ -51,3 +51,68 @@ ifelse([$1],[],,
-   AM_CONDITIONAL(ENABLE_GTK_DOC, test x$enable_gtk_doc = xyes)
-   AM_CONDITIONAL(GTK_DOC_USE_LIBTOOL, test -n "$LIBTOOL")
- ])
-+
-+# AX_C_FLOAT_WORDS_BIGENDIAN ([ACTION-IF-TRUE], [ACTION-IF-FALSE],
-+#                             [ACTION-IF-UNKNOWN])
-+#
-+# Checks the ordering of words within a multi-word float. This check
-+# is necessary because on some systems (e.g. certain ARM systems), the
-+# float word ordering can be different from the byte ordering. In a
-+# multi-word float context, "big-endian" implies that the word containing
-+# the sign bit is found in the memory location with the lowest address.
-+# This implemenation was inspired by the AC_C_BIGENDIAN macro in autoconf.
-+# -------------------------------------------------------------------------
-+AC_DEFUN([AX_C_FLOAT_WORDS_BIGENDIAN],
-+  [AC_CACHE_CHECK(whether float word ordering is bigendian,
-+                  ax_cv_c_float_words_bigendian, [
-+
-+# The endianess is detected by first compiling C code that contains a special
-+# double float value, then grepping the resulting object file for certain
-+# strings of ascii values. The double is specially crafted to have a
-+# binary representation that corresponds with a simple string. In this
-+# implementation, the string "noonsees" was selected because the individual
-+# word values ("noon" and "sees") are palindromes, thus making this test
-+# byte-order agnostic. If grep finds the string "noonsees" in the object
-+# file, the target platform stores float words in big-endian order. If grep
-+# finds "seesnoon", float words are in little-endian order. If neither value
-+# is found, the user is instructed to specify the ordering.
-+
-+ax_cv_c_float_words_bigendian=unknown
-+AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
-+
-+double d = 90904234967036810337470478905505011476211692735615632014797120844053488865816695273723469097858056257517020191247487429516932130503560650002327564517570778480236724525140520121371739201496540132640109977779420565776568942592.0;
-+
-+]])], [
-+
-+if grep noonsees conftest.$ac_objext >/dev/null ; then
-+  ax_cv_c_float_words_bigendian=yes
-+fi
-+if grep seesnoon conftest.$ac_objext >/dev/null ; then
-+  if test "$ax_cv_c_float_words_bigendian" = unknown; then
-+    ax_cv_c_float_words_bigendian=no
-+  else
-+    ax_cv_c_float_words_bigendian=unknown
-+  fi
-+fi
-+
-+])])
-+
-+case $ax_cv_c_float_words_bigendian in
-+  yes)
-+    m4_default([$1],
-+      [AC_DEFINE([FLOAT_WORDS_BIGENDIAN], 1,
-+                 [Define to 1 if your system stores words within floats
-+                  with the most significant word first])]) ;;
-+  no)
-+    $2 ;;
-+  *)
-+    m4_default([$3],
-+      [AC_MSG_ERROR([
-+
-+Unknown float word ordering. You need to manually preset
-+ax_cv_c_float_words_bigendian=no (or yes) according to your system.
-+
-+    ])]) ;;
-+esac
-+
-+])# AX_C_FLOAT_WORDS_BIGENDIAN
-diff --git a/configure.in b/configure.in
-index 2d2bf9f..797c7ce 100644
---- a/configure.in
-+++ b/configure.in
-@@ -55,6 +55,7 @@ AC_PROG_CPP
- AC_PROG_LIBTOOL dnl required version (1.4) DON'T REMOVE!
- AC_STDC_HEADERS
- AC_C_BIGENDIAN
-+AX_C_FLOAT_WORDS_BIGENDIAN
- 
- dnl ===========================================================================
- dnl === Local macros
--- 
-1.2.6
-

Deleted: trunk/buildroot/package/cairo/0002-Change-_cairo_fixed_from_double-to-use-the-magic-number-technique.patch
===================================================================
--- trunk/buildroot/package/cairo/0002-Change-_cairo_fixed_from_double-to-use-the-magic-number-technique.patch	2008-03-06 17:56:10 UTC (rev 21184)
+++ trunk/buildroot/package/cairo/0002-Change-_cairo_fixed_from_double-to-use-the-magic-number-technique.patch	2008-03-06 17:56:30 UTC (rev 21185)
@@ -1,79 +0,0 @@
-From nobody Mon Sep 17 00:00:00 2001
-From: Dan Amelang <dan@amelang.net>
-Date: Sun Oct 29 21:31:23 2006 -0800
-Subject: [PATCH] Change _cairo_fixed_from_double to use the "magic number" technique
-
-See long thread here:
-http://lists.freedesktop.org/archives/cairo/2006-October/008285.html 
-
----
-
- src/cairo-fixed.c |   48 +++++++++++++++++++++++++++++++++++++++++++++++-
- 1 files changed, 47 insertions(+), 1 deletions(-)
-
-d88acddcabe770e17664b34a2d5f74d3926e1642
-diff --git a/src/cairo-fixed.c b/src/cairo-fixed.c
-index 604c9e7..fe6c2dc 100644
---- a/src/cairo-fixed.c
-+++ b/src/cairo-fixed.c
-@@ -42,10 +42,56 @@ _cairo_fixed_from_int (int i)
-     return i << 16;
- }
- 
-+/* This is the "magic number" approach to converting a double into fixed
-+ * point as described here:
-+ *
-+ * http://www.stereopsis.com/sree/fpu2006.html (an overview)
-+ * http://www.d6.com/users/checker/pdfs/gdmfp.pdf (in detail)
-+ *
-+ * The basic idea is to add a large enough number to the double that the
-+ * literal floating point is moved up to the extent that it forces the
-+ * double's value to be shifted down to the bottom of the mantissa (to make
-+ * room for the large number being added in). Since the mantissa is, at a
-+ * given moment in time, a fixed point integer itself, one can convert a
-+ * float to various fixed point representations by moving around the point
-+ * of a floating point number through arithmetic operations. This behavior
-+ * is reliable on most modern platforms as it is mandated by the IEEE-754
-+ * standard for floating point arithmetic.
-+ *
-+ * For our purposes, a "magic number" must be carefully selected that is
-+ * both large enough to produce the desired point-shifting effect, and also
-+ * has no lower bits in its representation that would interfere with our
-+ * value@the bottom of the mantissa. The magic number is calculated as
-+ * follows:
-+ *
-+ *          (2 ^ (MANTISSA_SIZE - FRACTIONAL_SIZE)) * 1.5
-+ *
-+ * where in our case:
-+ *  - MANTISSA_SIZE for 64-bit doubles is 52
-+ *  - FRACTIONAL_SIZE for 16.16 fixed point is 16
-+ *
-+ * Although this approach provides a very large speedup of this function
-+ * on a wide-array of systems, it does come with two caveats:
-+ *
-+ * 1) It uses banker's rounding as opposed to arithmetic rounding.
-+ * 2) It doesn't function properly if the FPU is in single-precision
-+ *    mode.
-+ */
-+#define CAIRO_MAGIC_NUMBER_FIXED_16_16 (103079215104.0)
- cairo_fixed_t
- _cairo_fixed_from_double (double d)
- {
--    return (cairo_fixed_t) floor (d * 65536 + 0.5);
-+    union {
-+        double d;
-+        int32_t i[2];
-+    } u;
-+
-+    u.d = d + CAIRO_MAGIC_NUMBER_FIXED_16_16;
-+#ifdef FLOAT_WORDS_BIGENDIAN
-+    return u.i[1];
-+#else
-+    return u.i[0];
-+#endif
- }
- 
- cairo_fixed_t
--- 
-1.2.6
-

Added: trunk/buildroot/package/cairo/cairo-1.4.14-libdir-la.patch
===================================================================
--- trunk/buildroot/package/cairo/cairo-1.4.14-libdir-la.patch	                        (rev 0)
+++ trunk/buildroot/package/cairo/cairo-1.4.14-libdir-la.patch	2008-03-06 17:56:30 UTC (rev 21185)
@@ -0,0 +1,77 @@
+--- cairo/ltmain.sh.orig	2004-11-23 09:19:19.000000000 -0700
++++ cairo/ltmain.sh	2007-01-13 14:36:53.000000000 -0700
+@@ -231,8 +231,9 @@
+ 	# line option must be used.
+ 	if test -z "$tagname"; then
+ 	  $echo "$modename: unable to infer tagged configuration"
+-	  $echo "$modename: specify a tag with \`--tag'" 1>&2
+-	  exit $EXIT_FAILURE
++	  $echo "$modename: defaulting to \`CC'"
++	  $echo "$modename: if this is not correct, specify a tag with \`--tag'"
++#	  exit $EXIT_FAILURE
+ #        else
+ #          $echo "$modename: using $tagname tagged configuration"
+ 	fi
+@@ -2279,8 +2280,14 @@
+ 	    absdir="$abs_ladir"
+ 	    libdir="$abs_ladir"
+ 	  else
+-	    dir="$libdir"
+-	    absdir="$libdir"
++            # Adding 'libdir' from the .la file to our library search paths
++            # breaks crosscompilation horribly.  We cheat here and don't add
++            # it, instead adding the path where we found the .la.  -CL
++	    dir="$abs_ladir"
++	    absdir="$abs_ladir"
++	    libdir="$abs_ladir"
++	    #dir="$libdir"
++	    #absdir="$libdir"
+ 	  fi
+ 	else
+ 	  if test ! -f "$ladir/$objdir/$linklib" && test -f "$abs_ladir/$linklib"; then
+@@ -2754,6 +2761,16 @@
+ 		esac
+ 		if grep "^installed=no" $deplib > /dev/null; then
+ 		  path="$absdir/$objdir"
++#		This interferes with crosscompilation. -CL
++#		else
++#		  eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
++#		  if test -z "$libdir"; then
++#		    $echo "$modename: \`$deplib' is not a valid libtool archive" 1>&2
++#		    exit 1
++#		  fi
++#		  if test "$absdir" != "$libdir"; then
++#		    $echo "$modename: warning: \`$deplib' seems to be moved" 1>&2
++#		  fi
+ 		else
+ 		  eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
+ 		  if test -z "$libdir"; then
+@@ -5141,6 +5158,10 @@
+ 	    # Replace all uninstalled libtool libraries with the installed ones
+ 	    newdependency_libs=
+ 	    for deplib in $dependency_libs; do
++              # Replacing uninstalled with installed can easily break crosscompilation,
++              # since the installed path is generally the wrong architecture.  -CL
++              newdependency_libs="$newdependency_libs $deplib"
++              continue
+ 	      case $deplib in
+ 	      *.la)
+ 		name=`$echo "X$deplib" | $Xsed -e 's%^.*/%%'`
+@@ -5459,10 +5480,13 @@
+ 	  # At present, this check doesn't affect windows .dll's that
+ 	  # are installed into $libdir/../bin (currently, that works fine)
+ 	  # but it's something to keep an eye on.
+-	  if test "$inst_prefix_dir" = "$destdir"; then
+-	    $echo "$modename: error: cannot install \`$file' to a directory not ending in $libdir" 1>&2
+-	    exit $EXIT_FAILURE
+-	  fi
++	  #
++	  # This breaks install into our staging area.  -PB
++	  # 
++	  # if test "$inst_prefix_dir" = "$destdir"; then
++	  #   $echo "$modename: error: cannot install \`$file' to a directory not ending in $libdir" 1>&2
++	  #   exit $EXIT_FAILURE
++	  # fi
+ 
+ 	  if test -n "$inst_prefix_dir"; then
+ 	    # Stick the inst_prefix_dir data into the link command.

Modified: trunk/buildroot/package/cairo/cairo.mk
===================================================================
--- trunk/buildroot/package/cairo/cairo.mk	2008-03-06 17:56:10 UTC (rev 21184)
+++ trunk/buildroot/package/cairo/cairo.mk	2008-03-06 17:56:30 UTC (rev 21185)
@@ -3,145 +3,48 @@
 # cairo
 #
 #############################################################
-CAIRO_VERSION:=1.2.6
-CAIRO_SOURCE:=cairo-$(CAIRO_VERSION).tar.gz
-CAIRO_SITE:=http://cairographics.org/releases
-CAIRO_CAT:=$(ZCAT)
-CAIRO_DIR:=$(BUILD_DIR)/cairo-$(CAIRO_VERSION)
-CAIRO_BINARY:=libcairo.a
+CAIRO_VERSION = 1.4.14
+CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.gz
+CAIRO_SITE = http://cairographics.org/releases
+CAIRO_AUTORECONF = NO
+CAIRO_INSTALL_STAGING = YES
+CAIRO_INSTALL_TARGET = YES
+CAIRO_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install 
 
-$(DL_DIR)/$(CAIRO_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(CAIRO_SITE)/$(CAIRO_SOURCE)
+CAIRO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
+		glib_cv_uscore=no ac_cv_func_strtod=yes \
+		ac_fsusage_space=yes fu_cv_sys_stat_statfs2_bsize=yes \
+		ac_cv_func_closedir_void=no ac_cv_func_getloadavg=no \
+		ac_cv_lib_util_getloadavg=no ac_cv_lib_getloadavg_getloadavg=no \
+		ac_cv_func_getgroups=yes ac_cv_func_getgroups_works=yes \
+		ac_cv_func_chown_works=yes ac_cv_have_decl_euidaccess=no \
+		ac_cv_func_euidaccess=no ac_cv_have_decl_strnlen=yes \
+		ac_cv_func_strnlen_working=yes ac_cv_func_lstat_dereferences_slashed_symlink=yes \
+		ac_cv_func_lstat_empty_string_bug=no ac_cv_func_stat_empty_string_bug=no \
+		vb_cv_func_rename_trailing_slash_bug=no ac_cv_have_decl_nanosleep=yes \
+		jm_cv_func_nanosleep_works=yes gl_cv_func_working_utimes=yes \
+		ac_cv_func_utime_null=yes ac_cv_have_decl_strerror_r=yes \
+		ac_cv_func_strerror_r_char_p=no jm_cv_func_svid_putenv=yes \
+		ac_cv_func_getcwd_null=yes ac_cv_func_getdelim=yes \
+		ac_cv_func_mkstemp=yes utils_cv_func_mkstemp_limitations=no \
+		utils_cv_func_mkdir_trailing_slash_bug=no ac_cv_func_memcmp_working=yes \
+		ac_cv_have_decl_malloc=yes gl_cv_func_malloc_0_nonnull=yes \
+		ac_cv_func_malloc_0_nonnull=yes ac_cv_func_calloc_0_nonnull=yes \
+		ac_cv_func_realloc_0_nonnull=yes jm_cv_func_gettimeofday_clobber=no \
+		gl_cv_func_working_readdir=yes jm_ac_cv_func_link_follows_symlink=no \
+		utils_cv_localtime_cache=no ac_cv_struct_st_mtim_nsec=no \
+		gl_cv_func_tzset_clobber=no gl_cv_func_getcwd_null=yes \
+		gl_cv_func_getcwd_path_max=yes ac_cv_func_fnmatch_gnu=yes \
+		am_getline_needs_run_time_check=no am_cv_func_working_getline=yes \
+		gl_cv_func_mkdir_trailing_slash_bug=no gl_cv_func_mkstemp_limitations=no \
+		ac_cv_func_working_mktime=yes jm_cv_func_working_re_compile_pattern=yes \
+		ac_use_included_regex=no gl_cv_c_restrict=no \
+		ac_cv_path_GLIB_GENMARSHAL=/usr/bin/glib-genmarshal 
 
-cairo-source: $(DL_DIR)/$(CAIRO_SOURCE)
+ifeq ($(BR2_PACKAGE_DIRECTFB),y)
+	CAIRO_CONF_OPT = --disable-xlib --without-x --enable-directfb
+endif
 
-$(CAIRO_DIR)/.unpacked: $(DL_DIR)/$(CAIRO_SOURCE)
-	$(CAIRO_CAT) $(DL_DIR)/$(CAIRO_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(CAIRO_DIR) package/cairo/ \*.patch*
-	$(CONFIG_UPDATE) $(CAIRO_DIR)
-	touch $(CAIRO_DIR)/.unpacked
+CAIRO_DEPENDENCIES = uclibc gettext libintl pkgconfig libglib2 zlib png fontconfig $(XSERVER) 
 
-$(CAIRO_DIR)/.configured: $(CAIRO_DIR)/.unpacked
-	(cd $(CAIRO_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		ac_cv_func_posix_getpwuid_r=yes \
-		glib_cv_stack_grows=no \
-		glib_cv_uscore=no \
-		ac_cv_func_strtod=yes \
-		ac_fsusage_space=yes \
-		fu_cv_sys_stat_statfs2_bsize=yes \
-		ac_cv_func_closedir_void=no \
-		ac_cv_func_getloadavg=no \
-		ac_cv_lib_util_getloadavg=no \
-		ac_cv_lib_getloadavg_getloadavg=no \
-		ac_cv_func_getgroups=yes \
-		ac_cv_func_getgroups_works=yes \
-		ac_cv_func_chown_works=yes \
-		ac_cv_have_decl_euidaccess=no \
-		ac_cv_func_euidaccess=no \
-		ac_cv_have_decl_strnlen=yes \
-		ac_cv_func_strnlen_working=yes \
-		ac_cv_func_lstat_dereferences_slashed_symlink=yes \
-		ac_cv_func_lstat_empty_string_bug=no \
-		ac_cv_func_stat_empty_string_bug=no \
-		vb_cv_func_rename_trailing_slash_bug=no \
-		ac_cv_have_decl_nanosleep=yes \
-		jm_cv_func_nanosleep_works=yes \
-		gl_cv_func_working_utimes=yes \
-		ac_cv_func_utime_null=yes \
-		ac_cv_have_decl_strerror_r=yes \
-		ac_cv_func_strerror_r_char_p=no \
-		jm_cv_func_svid_putenv=yes \
-		ac_cv_func_getcwd_null=yes \
-		ac_cv_func_getdelim=yes \
-		ac_cv_func_mkstemp=yes \
-		utils_cv_func_mkstemp_limitations=no \
-		utils_cv_func_mkdir_trailing_slash_bug=no \
-		ac_cv_func_memcmp_working=yes \
-		ac_cv_have_decl_malloc=yes \
-		gl_cv_func_malloc_0_nonnull=yes \
-		ac_cv_func_malloc_0_nonnull=yes \
-		ac_cv_func_calloc_0_nonnull=yes \
-		ac_cv_func_realloc_0_nonnull=yes \
-		jm_cv_func_gettimeofday_clobber=no \
-		gl_cv_func_working_readdir=yes \
-		jm_ac_cv_func_link_follows_symlink=no \
-		utils_cv_localtime_cache=no \
-		ac_cv_struct_st_mtim_nsec=no \
-		gl_cv_func_tzset_clobber=no \
-		gl_cv_func_getcwd_null=yes \
-		gl_cv_func_getcwd_path_max=yes \
-		ac_cv_func_fnmatch_gnu=yes \
-		am_getline_needs_run_time_check=no \
-		am_cv_func_working_getline=yes \
-		gl_cv_func_mkdir_trailing_slash_bug=no \
-		gl_cv_func_mkstemp_limitations=no \
-		ac_cv_func_working_mktime=yes \
-		jm_cv_func_working_re_compile_pattern=yes \
-		ac_use_included_regex=no \
-		gl_cv_c_restrict=no \
-		ac_cv_path_GLIB_GENMARSHAL=/usr/bin/glib-genmarshal \
-		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--includedir=/usr/include \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		--enable-shared \
-		--enable-static \
-		--with-x \
-		--x-includes=$(STAGING_DIR)/usr/include/X11 \
-		--x-libraries=$(STAGING_DIR)/usr/lib \
-		--enable-ps=yes \
-		--enable-pdf=yes \
-		--enable-svg=no \
-		--enable-png=yes \
-		--enable-freetype=yes \
-		--enable-xlib=yes \
-		--enable-xlib-xrender=yes \
-	)
-	touch $(CAIRO_DIR)/.configured
-
-$(CAIRO_DIR)/src/.libs/$(CAIRO_BINARY): $(CAIRO_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(CAIRO_DIR)
-	touch -c $(CAIRO_DIR)/src/.libs/$(CAIRO_BINARY)
-
-$(STAGING_DIR)/lib/$(CAIRO_BINARY): $(CAIRO_DIR)/src/.libs/$(CAIRO_BINARY)
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(CAIRO_DIR) install
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" $(STAGING_DIR)/lib/libcairo.la
-	touch -c $(STAGING_DIR)/lib/$(CAIRO_BINARY)
-
-$(TARGET_DIR)/lib/libcairo.so.2.9.3: $(STAGING_DIR)/lib/$(CAIRO_BINARY)
-	cp -a $(STAGING_DIR)/lib/libcairo.so $(TARGET_DIR)/lib/
-	cp -a $(STAGING_DIR)/lib/libcairo.so.2* $(TARGET_DIR)/lib/
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/lib/libcairo.so.2.*
-	touch -c $(TARGET_DIR)/lib/libcairo.so.2.9.3
-
-cairo: uclibc gettext libintl pkgconfig libglib2 zlib png fontconfig $(XSERVER) $(TARGET_DIR)/lib/libcairo.so.2.9.3
-
-cairo-clean:
-	rm -f $(TARGET_DIR)/lib/$(CAIRO_BINARY)
-	-$(MAKE) -C $(CAIRO_DIR) clean
-
-cairo-dirclean:
-	rm -rf $(CAIRO_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(strip $(BR2_PACKAGE_CAIRO)),y)
-TARGETS+=cairo
-endif
+$(eval $(call AUTOTARGETS,package,cairo))

Deleted: trunk/buildroot/package/cairo/libdir-la.patch
===================================================================
--- trunk/buildroot/package/cairo/libdir-la.patch	2008-03-06 17:56:10 UTC (rev 21184)
+++ trunk/buildroot/package/cairo/libdir-la.patch	2008-03-06 17:56:30 UTC (rev 21185)
@@ -1,77 +0,0 @@
---- cairo/ltmain.sh.orig	2004-11-23 09:19:19.000000000 -0700
-+++ cairo/ltmain.sh	2007-01-13 14:36:53.000000000 -0700
-@@ -231,8 +231,9 @@
- 	# line option must be used.
- 	if test -z "$tagname"; then
- 	  $echo "$modename: unable to infer tagged configuration"
--	  $echo "$modename: specify a tag with \`--tag'" 1>&2
--	  exit $EXIT_FAILURE
-+	  $echo "$modename: defaulting to \`CC'"
-+	  $echo "$modename: if this is not correct, specify a tag with \`--tag'"
-+#	  exit $EXIT_FAILURE
- #        else
- #          $echo "$modename: using $tagname tagged configuration"
- 	fi
-@@ -2279,8 +2280,14 @@
- 	    absdir="$abs_ladir"
- 	    libdir="$abs_ladir"
- 	  else
--	    dir="$libdir"
--	    absdir="$libdir"
-+            # Adding 'libdir' from the .la file to our library search paths
-+            # breaks crosscompilation horribly.  We cheat here and don't add
-+            # it, instead adding the path where we found the .la.  -CL
-+	    dir="$abs_ladir"
-+	    absdir="$abs_ladir"
-+	    libdir="$abs_ladir"
-+	    #dir="$libdir"
-+	    #absdir="$libdir"
- 	  fi
- 	else
- 	  if test ! -f "$ladir/$objdir/$linklib" && test -f "$abs_ladir/$linklib"; then
-@@ -2754,6 +2761,16 @@
- 		esac
- 		if grep "^installed=no" $deplib > /dev/null; then
- 		  path="$absdir/$objdir"
-+#		This interferes with crosscompilation. -CL
-+#		else
-+#		  eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
-+#		  if test -z "$libdir"; then
-+#		    $echo "$modename: \`$deplib' is not a valid libtool archive" 1>&2
-+#		    exit 1
-+#		  fi
-+#		  if test "$absdir" != "$libdir"; then
-+#		    $echo "$modename: warning: \`$deplib' seems to be moved" 1>&2
-+#		  fi
- 		else
- 		  eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
- 		  if test -z "$libdir"; then
-@@ -5141,6 +5158,10 @@
- 	    # Replace all uninstalled libtool libraries with the installed ones
- 	    newdependency_libs=
- 	    for deplib in $dependency_libs; do
-+              # Replacing uninstalled with installed can easily break crosscompilation,
-+              # since the installed path is generally the wrong architecture.  -CL
-+              newdependency_libs="$newdependency_libs $deplib"
-+              continue
- 	      case $deplib in
- 	      *.la)
- 		name=`$echo "X$deplib" | $Xsed -e 's%^.*/%%'`
-@@ -5459,10 +5480,13 @@
- 	  # At present, this check doesn't affect windows .dll's that
- 	  # are installed into $libdir/../bin (currently, that works fine)
- 	  # but it's something to keep an eye on.
--	  if test "$inst_prefix_dir" = "$destdir"; then
--	    $echo "$modename: error: cannot install \`$file' to a directory not ending in $libdir" 1>&2
--	    exit $EXIT_FAILURE
--	  fi
-+	  #
-+	  # This breaks install into our staging area.  -PB
-+	  # 
-+	  # if test "$inst_prefix_dir" = "$destdir"; then
-+	  #   $echo "$modename: error: cannot install \`$file' to a directory not ending in $libdir" 1>&2
-+	  #   exit $EXIT_FAILURE
-+	  # fi
- 
- 	  if test -n "$inst_prefix_dir"; then
- 	    # Stick the inst_prefix_dir data into the link command.

Added: trunk/buildroot/package/cairo/old_patches/0001-Add-autoconf-macro-AX_C_FLOAT_WORDS_BIGENDIAN.patch
===================================================================
--- trunk/buildroot/package/cairo/old_patches/0001-Add-autoconf-macro-AX_C_FLOAT_WORDS_BIGENDIAN.patch	                        (rev 0)
+++ trunk/buildroot/package/cairo/old_patches/0001-Add-autoconf-macro-AX_C_FLOAT_WORDS_BIGENDIAN.patch	2008-03-06 17:56:30 UTC (rev 21185)
@@ -0,0 +1,103 @@
+From nobody Mon Sep 17 00:00:00 2001
+From: Dan Amelang <dan@amelang.net>
+Date: Sun Oct 29 21:30:08 2006 -0800
+Subject: [PATCH] Add autoconf macro AX_C_FLOAT_WORDS_BIGENDIAN
+
+The symbol that this macro defines (FLOAT_WORDS_BIGENDIAN) can be used
+to make double arithmetic tricks portable.
+
+---
+
+ acinclude.m4 |   65 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ configure.in |    1 +
+ 2 files changed, 66 insertions(+), 0 deletions(-)
+
+3231d91b59a6c2e1c40bbaa8b143694b6c693662
+diff --git a/acinclude.m4 b/acinclude.m4
+index af73800..a0eb13a 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -51,3 +51,68 @@ ifelse([$1],[],,
+   AM_CONDITIONAL(ENABLE_GTK_DOC, test x$enable_gtk_doc = xyes)
+   AM_CONDITIONAL(GTK_DOC_USE_LIBTOOL, test -n "$LIBTOOL")
+ ])
++
++# AX_C_FLOAT_WORDS_BIGENDIAN ([ACTION-IF-TRUE], [ACTION-IF-FALSE],
++#                             [ACTION-IF-UNKNOWN])
++#
++# Checks the ordering of words within a multi-word float. This check
++# is necessary because on some systems (e.g. certain ARM systems), the
++# float word ordering can be different from the byte ordering. In a
++# multi-word float context, "big-endian" implies that the word containing
++# the sign bit is found in the memory location with the lowest address.
++# This implemenation was inspired by the AC_C_BIGENDIAN macro in autoconf.
++# -------------------------------------------------------------------------
++AC_DEFUN([AX_C_FLOAT_WORDS_BIGENDIAN],
++  [AC_CACHE_CHECK(whether float word ordering is bigendian,
++                  ax_cv_c_float_words_bigendian, [
++
++# The endianess is detected by first compiling C code that contains a special
++# double float value, then grepping the resulting object file for certain
++# strings of ascii values. The double is specially crafted to have a
++# binary representation that corresponds with a simple string. In this
++# implementation, the string "noonsees" was selected because the individual
++# word values ("noon" and "sees") are palindromes, thus making this test
++# byte-order agnostic. If grep finds the string "noonsees" in the object
++# file, the target platform stores float words in big-endian order. If grep
++# finds "seesnoon", float words are in little-endian order. If neither value
++# is found, the user is instructed to specify the ordering.
++
++ax_cv_c_float_words_bigendian=unknown
++AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
++
++double d = 90904234967036810337470478905505011476211692735615632014797120844053488865816695273723469097858056257517020191247487429516932130503560650002327564517570778480236724525140520121371739201496540132640109977779420565776568942592.0;
++
++]])], [
++
++if grep noonsees conftest.$ac_objext >/dev/null ; then
++  ax_cv_c_float_words_bigendian=yes
++fi
++if grep seesnoon conftest.$ac_objext >/dev/null ; then
++  if test "$ax_cv_c_float_words_bigendian" = unknown; then
++    ax_cv_c_float_words_bigendian=no
++  else
++    ax_cv_c_float_words_bigendian=unknown
++  fi
++fi
++
++])])
++
++case $ax_cv_c_float_words_bigendian in
++  yes)
++    m4_default([$1],
++      [AC_DEFINE([FLOAT_WORDS_BIGENDIAN], 1,
++                 [Define to 1 if your system stores words within floats
++                  with the most significant word first])]) ;;
++  no)
++    $2 ;;
++  *)
++    m4_default([$3],
++      [AC_MSG_ERROR([
++
++Unknown float word ordering. You need to manually preset
++ax_cv_c_float_words_bigendian=no (or yes) according to your system.
++
++    ])]) ;;
++esac
++
++])# AX_C_FLOAT_WORDS_BIGENDIAN
+diff --git a/configure.in b/configure.in
+index 2d2bf9f..797c7ce 100644
+--- a/configure.in
++++ b/configure.in
+@@ -55,6 +55,7 @@ AC_PROG_CPP
+ AC_PROG_LIBTOOL dnl required version (1.4) DON'T REMOVE!
+ AC_STDC_HEADERS
+ AC_C_BIGENDIAN
++AX_C_FLOAT_WORDS_BIGENDIAN
+ 
+ dnl ===========================================================================
+ dnl === Local macros
+-- 
+1.2.6
+

Added: trunk/buildroot/package/cairo/old_patches/0002-Change-_cairo_fixed_from_double-to-use-the-magic-number-technique.patch
===================================================================
--- trunk/buildroot/package/cairo/old_patches/0002-Change-_cairo_fixed_from_double-to-use-the-magic-number-technique.patch	                        (rev 0)
+++ trunk/buildroot/package/cairo/old_patches/0002-Change-_cairo_fixed_from_double-to-use-the-magic-number-technique.patch	2008-03-06 17:56:30 UTC (rev 21185)
@@ -0,0 +1,79 @@
+From nobody Mon Sep 17 00:00:00 2001
+From: Dan Amelang <dan@amelang.net>
+Date: Sun Oct 29 21:31:23 2006 -0800
+Subject: [PATCH] Change _cairo_fixed_from_double to use the "magic number" technique
+
+See long thread here:
+http://lists.freedesktop.org/archives/cairo/2006-October/008285.html 
+
+---
+
+ src/cairo-fixed.c |   48 +++++++++++++++++++++++++++++++++++++++++++++++-
+ 1 files changed, 47 insertions(+), 1 deletions(-)
+
+d88acddcabe770e17664b34a2d5f74d3926e1642
+diff --git a/src/cairo-fixed.c b/src/cairo-fixed.c
+index 604c9e7..fe6c2dc 100644
+--- a/src/cairo-fixed.c
++++ b/src/cairo-fixed.c
+@@ -42,10 +42,56 @@ _cairo_fixed_from_int (int i)
+     return i << 16;
+ }
+ 
++/* This is the "magic number" approach to converting a double into fixed
++ * point as described here:
++ *
++ * http://www.stereopsis.com/sree/fpu2006.html (an overview)
++ * http://www.d6.com/users/checker/pdfs/gdmfp.pdf (in detail)
++ *
++ * The basic idea is to add a large enough number to the double that the
++ * literal floating point is moved up to the extent that it forces the
++ * double's value to be shifted down to the bottom of the mantissa (to make
++ * room for the large number being added in). Since the mantissa is, at a
++ * given moment in time, a fixed point integer itself, one can convert a
++ * float to various fixed point representations by moving around the point
++ * of a floating point number through arithmetic operations. This behavior
++ * is reliable on most modern platforms as it is mandated by the IEEE-754
++ * standard for floating point arithmetic.
++ *
++ * For our purposes, a "magic number" must be carefully selected that is
++ * both large enough to produce the desired point-shifting effect, and also
++ * has no lower bits in its representation that would interfere with our
++ * value@the bottom of the mantissa. The magic number is calculated as
++ * follows:
++ *
++ *          (2 ^ (MANTISSA_SIZE - FRACTIONAL_SIZE)) * 1.5
++ *
++ * where in our case:
++ *  - MANTISSA_SIZE for 64-bit doubles is 52
++ *  - FRACTIONAL_SIZE for 16.16 fixed point is 16
++ *
++ * Although this approach provides a very large speedup of this function
++ * on a wide-array of systems, it does come with two caveats:
++ *
++ * 1) It uses banker's rounding as opposed to arithmetic rounding.
++ * 2) It doesn't function properly if the FPU is in single-precision
++ *    mode.
++ */
++#define CAIRO_MAGIC_NUMBER_FIXED_16_16 (103079215104.0)
+ cairo_fixed_t
+ _cairo_fixed_from_double (double d)
+ {
+-    return (cairo_fixed_t) floor (d * 65536 + 0.5);
++    union {
++        double d;
++        int32_t i[2];
++    } u;
++
++    u.d = d + CAIRO_MAGIC_NUMBER_FIXED_16_16;
++#ifdef FLOAT_WORDS_BIGENDIAN
++    return u.i[1];
++#else
++    return u.i[0];
++#endif
+ }
+ 
+ cairo_fixed_t
+-- 
+1.2.6
+
