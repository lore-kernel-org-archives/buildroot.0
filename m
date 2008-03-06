From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 09:54:01 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/atk
Message-ID: <20080306175401.A8A591201A9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 09:54:01 -0800 (Thu, 06 Mar 2008)
New Revision: 21178

Log:
updated makefile for atk

Added:
   trunk/buildroot/package/atk/atk-1.9.1-libdir-la.patch

Removed:
   trunk/buildroot/package/atk/libdir-la.patch

Modified:
   trunk/buildroot/package/atk/Config.in
   trunk/buildroot/package/atk/atk.mk


Changeset:
Modified: trunk/buildroot/package/atk/Config.in
===================================================================
--- trunk/buildroot/package/atk/Config.in	2008-03-06 17:53:35 UTC (rev 21177)
+++ trunk/buildroot/package/atk/Config.in	2008-03-06 17:54:01 UTC (rev 21178)
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ATK
 	bool "atk"
+	select BR2_PACKAGE_PKGCONFIG
 	default n
 	depends BR2_PACKAGE_LIBGLIB2
 	help

Added: trunk/buildroot/package/atk/atk-1.9.1-libdir-la.patch
===================================================================
--- trunk/buildroot/package/atk/atk-1.9.1-libdir-la.patch	                        (rev 0)
+++ trunk/buildroot/package/atk/atk-1.9.1-libdir-la.patch	2008-03-06 17:54:01 UTC (rev 21178)
@@ -0,0 +1,77 @@
+--- atk-1.9.1/ltmain.sh.orig	2004-11-23 09:19:19.000000000 -0700
++++ atk-1.9.1/ltmain.sh	2007-01-13 14:36:53.000000000 -0700
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

Modified: trunk/buildroot/package/atk/atk.mk
===================================================================
--- trunk/buildroot/package/atk/atk.mk	2008-03-06 17:53:35 UTC (rev 21177)
+++ trunk/buildroot/package/atk/atk.mk	2008-03-06 17:54:01 UTC (rev 21178)
@@ -3,143 +3,59 @@
 # atk
 #
 #############################################################
-ATK_VERSION:=1.9.1
-ATK_SOURCE:=atk-$(ATK_VERSION).tar.bz2
-ATK_SITE:=ftp://ftp.gtk.org/pub/gtk/v2.10/dependencies
-ATK_CAT:=$(BZCAT)
-ATK_DIR:=$(BUILD_DIR)/atk-$(ATK_VERSION)
-ATK_BINARY:=libatk-1.0.a
+ATK_VERSION = 1.9.1
+ATK_SOURCE = atk-$(ATK_VERSION).tar.bz2
+ATK_SITE = ftp://ftp.gtk.org/pub/gtk/v2.10/dependencies
+ATK_AUTORECONF = NO
+ATK_INSTALL_STAGING = YES
+ATK_INSTALL_TARGET = YES
+ATK_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install 
 
-$(DL_DIR)/$(ATK_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(ATK_SITE)/$(ATK_SOURCE)
+ATK_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes \
+		glib_cv_stack_grows=no glib_cv_uscore=no \
+		ac_cv_func_strtod=yes ac_fsusage_space=yes \
+		fu_cv_sys_stat_statfs2_bsize=yes ac_cv_func_closedir_void=no \
+		ac_cv_func_getloadavg=no ac_cv_lib_util_getloadavg=no \
+		ac_cv_lib_getloadavg_getloadavg=no ac_cv_func_getgroups=yes \
+		ac_cv_func_getgroups_works=yes ac_cv_func_chown_works=yes \
+		ac_cv_have_decl_euidaccess=no ac_cv_func_euidaccess=no \
+		ac_cv_have_decl_strnlen=yes ac_cv_func_strnlen_working=yes \
+		ac_cv_func_lstat_dereferences_slashed_symlink=yes ac_cv_func_lstat_empty_string_bug=no \
+		ac_cv_func_stat_empty_string_bug=no vb_cv_func_rename_trailing_slash_bug=no \
+		ac_cv_have_decl_nanosleep=yes jm_cv_func_nanosleep_works=yes \
+		gl_cv_func_working_utimes=yes ac_cv_func_utime_null=yes \
+		ac_cv_have_decl_strerror_r=yes ac_cv_func_strerror_r_char_p=no \
+		jm_cv_func_svid_putenv=yes ac_cv_func_getcwd_null=yes \
+		ac_cv_func_getdelim=yes ac_cv_func_mkstemp=yes \
+		utils_cv_func_mkstemp_limitations=no utils_cv_func_mkdir_trailing_slash_bug=no \
+		ac_cv_func_memcmp_working=yes ac_cv_have_decl_malloc=yes \
+		gl_cv_func_malloc_0_nonnull=yes ac_cv_func_malloc_0_nonnull=yes \
+		ac_cv_func_calloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes \
+		jm_cv_func_gettimeofday_clobber=no gl_cv_func_working_readdir=yes \
+		jm_ac_cv_func_link_follows_symlink=no utils_cv_localtime_cache=no \
+		ac_cv_struct_st_mtim_nsec=no gl_cv_func_tzset_clobber=no \
+		gl_cv_func_getcwd_null=yes gl_cv_func_getcwd_path_max=yes \
+		ac_cv_func_fnmatch_gnu=yes am_getline_needs_run_time_check=no \
+		am_cv_func_working_getline=yes gl_cv_func_mkdir_trailing_slash_bug=no \
+		gl_cv_func_mkstemp_limitations=no ac_cv_func_working_mktime=yes \
+		jm_cv_func_working_re_compile_pattern=yes ac_use_included_regex=no \
+		gl_cv_c_restrict=no ac_cv_path_GLIB_GENMARSHAL=/usr/bin/glib-genmarshal \
+		ac_cv_prog_F77=no ac_cv_prog_CXX=no 
 
-atk-source: $(DL_DIR)/$(ATK_SOURCE)
-
-$(ATK_DIR)/.unpacked: $(DL_DIR)/$(ATK_SOURCE)
-	$(ATK_CAT) $(DL_DIR)/$(ATK_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(ATK_DIR) package/atk/ \*.patch*
-	$(CONFIG_UPDATE) $(ATK_DIR)
-	touch $(ATK_DIR)/.unpacked
-
-$(ATK_DIR)/.configured: $(ATK_DIR)/.unpacked
-	(cd $(ATK_DIR); rm -rf config.cache; \
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
-		ac_cv_prog_F77=no \
-		ac_cv_prog_CXX=no \
-		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(REAL_GNU_TARGET_NAME) \
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
-		--includedir=/include \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		--enable-shared \
-		--enable-static \
-		--with-x \
+ATK_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(REAL_GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) --prefix=/usr \
+		--exec-prefix=/usr --bindir=/usr/bin \
+		--sbindir=/usr/sbin --libdir=/usr/lib \
+		--libexecdir=/usr/lib --sysconfdir=/etc \
+		--datadir=/usr/share --localstatedir=/var \
+		--includedir=/usr/include --mandir=/usr/man \
+		--infodir=/usr/info --enable-shared \
+		--enable-static --with-x \
 		--x-includes=$(STAGING_DIR)/usr/include/X11 \
 		--x-libraries=$(STAGING_DIR)/usr/lib \
-		--disable-glibtest \
-		--enable-explicit-deps=no \
-		--disable-debug \
-	)
-	touch $(ATK_DIR)/.configured
+		--disable-glibtest --enable-explicit-deps=no \
+		--disable-debug 
 
-$(ATK_DIR)/atk/.libs/$(ATK_BINARY): $(ATK_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(ATK_DIR)
-	touch -c $(ATK_DIR)/atk/.libs/$(ATK_BINARY)
+ATK_DEPENDENCIES = libglib2 pkgconfig
 
-$(STAGING_DIR)/lib/$(ATK_BINARY): $(ATK_DIR)/atk/.libs/$(ATK_BINARY)
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(ATK_DIR) install
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" $(STAGING_DIR)/lib/libatk-1.0.la
-	touch -c $(STAGING_DIR)/lib/$(ATK_BINARY)
-
-$(TARGET_DIR)/lib/libatk-1.0.so.0: $(STAGING_DIR)/lib/$(ATK_BINARY)
-	cp -a $(STAGING_DIR)/lib/libatk-1.0.so $(TARGET_DIR)/lib/
-	cp -a $(STAGING_DIR)/lib/libatk-1.0.so.0* $(TARGET_DIR)/lib/
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/lib/libatk-1.0.so.0.*
-	touch -c $(TARGET_DIR)/lib/libatk-1.0.so.0
-
-atk: libglib2 pkgconfig $(TARGET_DIR)/lib/libatk-1.0.so.0
-
-atk-clean:
-	rm -f $(TARGET_DIR)/lib/$(ATK_BINARY)
-	-$(MAKE) -C $(ATK_DIR) clean
-
-atk-dirclean:
-	rm -rf $(ATK_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(strip $(BR2_PACKAGE_ATK)),y)
-TARGETS+=atk
-endif
+$(eval $(call AUTOTARGETS,package,atk))

Deleted: trunk/buildroot/package/atk/libdir-la.patch
===================================================================
--- trunk/buildroot/package/atk/libdir-la.patch	2008-03-06 17:53:35 UTC (rev 21177)
+++ trunk/buildroot/package/atk/libdir-la.patch	2008-03-06 17:54:01 UTC (rev 21178)
@@ -1,77 +0,0 @@
---- atk-1.9.1/ltmain.sh.orig	2004-11-23 09:19:19.000000000 -0700
-+++ atk-1.9.1/ltmain.sh	2007-01-13 14:36:53.000000000 -0700
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
