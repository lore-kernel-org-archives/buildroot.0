From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  3 Jun 2012 00:07:40 +0200
Subject: [Buildroot] [PATCH v2 1/2] Convert gettext to autotargets
Message-ID: <1338674861-1716-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Maxime Ripard <maxime.ripard@free-electrons.com>

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Acked-by: Samuel MARTIN <s.martin49@gmail.com>

 delete mode 100644 package/gettext/libdir-la.patch

diff --git a/package/gettext/Config.in b/package/gettext/Config.in
index fabfe1e..0ee4065 100644
--- a/package/gettext/Config.in
+++ b/package/gettext/Config.in
@@ -12,18 +12,6 @@ config BR2_PACKAGE_GETTEXT
 comment "gettext requires a toolchain with WCHAR support"
 	depends on BR2_NEEDS_GETTEXT && !BR2_USE_WCHAR

-config BR2_PACKAGE_GETTEXT_STATIC
-	bool "Use libgettext.a instead of libgettext.so.*"
-	depends on BR2_PACKAGE_GETTEXT
-	depends on BR2_arm
-	help
-	  The GNU `gettext' utilities are a set of tools that provide a
-	  framework to help other GNU packages produce multi-lingual
-	  messages.
-
-	  http://www.gnu.org/software/gettext/
-
-
 config BR2_PACKAGE_LIBINTL
 	bool "libintl"
 	depends on BR2_NEEDS_GETTEXT
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index f3605da..7c7b26c 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -3,162 +3,22 @@
 # gettext
 #
 #############################################################
-GETTEXT_VERSION:=0.16.1
-GETTEXT_SOURCE:=gettext-$(GETTEXT_VERSION).tar.gz
-GETTEXT_SITE:=$(BR2_GNU_MIRROR)/gettext
-GETTEXT_DIR:=$(BUILD_DIR)/gettext-$(GETTEXT_VERSION)
-GETTEXT_CAT:=$(ZCAT)
-GETTEXT_BINARY:=gettext-runtime/src/gettext
-GETTEXT_TARGET_BINARY:=usr/bin/gettext
+GETTEXT_VERSION = 0.16.1
+GETTEXT_SITE = $(BR2_GNU_MIRROR)/gettext
+GETTEXT_INSTALL_STAGING = YES

-ifeq ($(BR2_PACKAGE_GETTEXT_STATIC),y)
-LIBINTL_TARGET_BINARY:=usr/lib/libintl.a
-else
-LIBINTL_TARGET_BINARY:=usr/lib/libintl.so
-endif
-
-$(DL_DIR)/$(GETTEXT_SOURCE):
-	 $(call DOWNLOAD,$(GETTEXT_SITE)/$(GETTEXT_SOURCE))
-
-gettext-source: $(DL_DIR)/$(GETTEXT_SOURCE)
-
-$(GETTEXT_DIR)/.unpacked: $(DL_DIR)/$(GETTEXT_SOURCE)
-	$(GETTEXT_CAT) $(DL_DIR)/$(GETTEXT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	support/scripts/apply-patches.sh $(GETTEXT_DIR) package/gettext/ gettext\*.patch
-	$(call CONFIG_UPDATE,$(@D))
-	touch $@
-
-ifneq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-IGNORE_EXTERNAL_GETTEXT:=--with-included-gettext
-endif
-
-$(GETTEXT_DIR)/.configured: $(GETTEXT_DIR)/.unpacked
-	(cd $(GETTEXT_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
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
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--disable-libasprintf \
-		--enable-shared \
-		$(IGNORE_EXTERNAL_GETTEXT) \
-		--disable-openmp \
-	)
-	touch $@
+GETTEXT_CONF_OPT += \
+	--disable-libasprintf \
+	--disable-openmp \

-$(GETTEXT_DIR)/$(GETTEXT_BINARY): $(GETTEXT_DIR)/.configured
-	$(MAKE) -C $(GETTEXT_DIR)
-	touch -c $(GETTEXT_DIR)/$(GETTEXT_BINARY)
+define GETTEXT_REMOVE_BINARIES
+	rm -f $(TARGET_DIR)/usr/bin/gettext
+	rm -f $(TARGET_DIR)/usr/bin/gettext.sh
+	rm -f $(TARGET_DIR)/usr/bin/gettextize
+endef

-$(STAGING_DIR)/$(GETTEXT_TARGET_BINARY): $(GETTEXT_DIR)/$(GETTEXT_BINARY)
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(GETTEXT_DIR) install
-	$(SED) 's,/lib/,$(STAGING_DIR)/usr/lib/,g' $(STAGING_DIR)/usr/lib/libgettextlib.la
-	$(SED) 's,/lib/,$(STAGING_DIR)/usr/lib/,g' $(STAGING_DIR)/usr/lib/libgettextpo.la
-	$(SED) 's,/lib/,$(STAGING_DIR)/usr/lib/,g' $(STAGING_DIR)/usr/lib/libgettextsrc.la
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libgettextlib.la
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libgettextpo.la
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libgettextsrc.la
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libintl.la
-	rm -f $(addprefix $(STAGING_DIR)/usr/bin/, \
-		autopoint envsubst gettext.sh gettextize msg* ?gettext)
-	touch -c $@
-
-gettext: host-pkg-config $(if $(BR2_PACKAGE_LIBICONV),libiconv) $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY)
-
-gettext-unpacked: $(GETTEXT_DIR)/.unpacked
-
-gettext-clean:
-	-$(MAKE) DESTDIR=$(STAGING_DIR) CC="$(TARGET_CC)" -C $(GETTEXT_DIR) uninstall
-	-$(MAKE) DESTDIR=$(TARGET_DIR) CC="$(TARGET_CC)" -C $(GETTEXT_DIR) uninstall
-	-$(MAKE) -C $(GETTEXT_DIR) clean
-
-gettext-dirclean:
-	rm -rf $(GETTEXT_DIR)
-
-#############################################################
-#
-# gettext on the target
-#
-#############################################################
-
-gettext-target: $(GETTEXT_DIR)/$(GETTEXT_BINARY)
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(GETTEXT_DIR) install
-	chmod +x $(TARGET_DIR)/usr/lib/libintl.so* # identify as needing to be stripped
-
-$(TARGET_DIR)/usr/lib/libintl.so: $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY)
-	cp -dpf $(STAGING_DIR)/usr/lib/libgettext*.so* \
-		$(STAGING_DIR)/usr/lib/libintl*.so* $(TARGET_DIR)/usr/lib/
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libgettext*.so*
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libintl*.so*
-	rm -f $(addprefix $(TARGET_DIR)/usr/lib/, \
-		libgettext*.so*.la libintl*.so*.la)
-	touch -c $@
-
-$(TARGET_DIR)/usr/lib/libintl.a: $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY)
-	cp -dpf $(STAGING_DIR)/usr/lib/libgettext*.a $(TARGET_DIR)/usr/lib/
-	cp -dpf $(STAGING_DIR)/usr/lib/libintl*.a $(TARGET_DIR)/usr/lib/
-	touch -c $@
-
-libintl: $(TARGET_DIR)/$(LIBINTL_TARGET_BINARY)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
 ifeq ($(BR2_PACKAGE_LIBINTL),y)
-TARGETS+=libintl
-endif
-ifeq ($(BR2_PACKAGE_GETTEXT),y)
-TARGETS+=gettext
+	GETTEXT_POST_INSTALL_TARGET_HOOKS += GETTEXT_REMOVE_BINARIES
 endif
+
+$(eval $(call AUTOTARGETS))
diff --git a/package/gettext/libdir-la.patch b/package/gettext/libdir-la.patch
deleted file mode 100644
index d5076c1..0000000
--- a/package/gettext/libdir-la.patch
+++ /dev/null
@@ -1,154 +0,0 @@
---- gettext-0.14.6/autoconf-lib-link/build-aux/ltmain.sh.orig	2007-01-13 14:33:23.000000000 -0700
-+++ gettext-0.14.6/autoconf-lib-link/build-aux/ltmain.sh	2007-01-13 14:35:10.000000000 -0700
-@@ -234,8 +234,9 @@
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
-@@ -2324,8 +2325,14 @@
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
- 	  test "X$hardcode_automatic" = Xyes && avoidtemprpath=yes
- 	else
-@@ -2800,6 +2807,16 @@
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
-@@ -5210,6 +5227,10 @@
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
-@@ -5528,10 +5549,13 @@
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
---- gettext-0.14.6/build-aux/ltmain.sh.orig	2005-05-20 15:03:38.000000000 -0600
-+++ gettext-0.14.6/build-aux/ltmain.sh	2007-01-13 14:34:27.000000000 -0700
-@@ -234,8 +234,9 @@
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
-@@ -2324,8 +2325,14 @@
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
- 	  test "X$hardcode_automatic" = Xyes && avoidtemprpath=yes
- 	else
-@@ -2800,6 +2807,16 @@
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
-@@ -5210,6 +5227,10 @@
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
-@@ -5528,10 +5549,13 @@
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
--
1.7.10.3
