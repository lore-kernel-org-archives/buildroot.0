From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 15 Apr 2012 21:09:21 +0200
Subject: [Buildroot] [PATCH 1/1] Convert gettext to autotargets
In-Reply-To: <854f44b783b6b7dd9c1189c53e6c98aa74db10a1.1333550801.git.maxime.ripard@free-electrons.com>
References: <854f44b783b6b7dd9c1189c53e6c98aa74db10a1.1333550801.git.maxime.ripard@free-electrons.com>
Message-ID: <1334516961-14740-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also cleanup any libintl dependency since the target does
not exist anymore (it is now part of the gettext target).

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/avahi/avahi.mk                      |    4 +-
 package/axel/axel.mk                        |    2 +-
 package/binutils/binutils.mk                |    2 +-
 package/diffutils/diffutils.mk              |    3 +-
 package/dnsmasq/dnsmasq.mk                  |    2 +-
 package/flex/flex.mk                        |    5 +-
 package/gdk-pixbuf/gdk-pixbuf.mk            |    2 +-
 package/gettext/Config.in                   |   12 --
 package/gettext/gettext.mk                  |  168 +++------------------------
 package/gettext/libdir-la.patch             |  154 ------------------------
 package/glib-networking/glib-networking.mk  |    2 +-
 package/gmpc/gmpc.mk                        |    2 +-
 package/grep/grep.mk                        |    2 +-
 package/kbd/kbd.mk                          |    2 +-
 package/libglib2/libglib2.mk                |    2 +-
 package/libsoup/libsoup.mk                  |    2 +-
 package/make/make.mk                        |    2 +-
 package/multimedia/pulseaudio/pulseaudio.mk |    2 +-
 package/pango/pango.mk                      |    2 +-
 package/psmisc/psmisc.mk                    |    2 +-
 package/sshfs/sshfs.mk                      |    2 +-
 package/sysstat/sysstat.mk                  |    2 +-
 package/util-linux/util-linux.mk            |    2 +-
 package/vala/vala.mk                        |    2 +-
 24 files changed, 37 insertions(+), 345 deletions(-)
 delete mode 100644 package/gettext/libdir-la.patch

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 32e3df7..2547e04 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -83,7 +83,7 @@ AVAHI_CONF_OPT = --localstatedir=/var \
 		--with-autoipd-user=default \
 		--with-autoipd-group=default
 
-AVAHI_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) host-intltool host-pkg-config
+AVAHI_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-intltool host-pkg-config
 
 ifneq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_AVAHI_AUTOIPD),)
 AVAHI_DEPENDENCIES += libdaemon
@@ -132,7 +132,7 @@ AVAHI_CONF_OPT += --disable-python
 endif
 
 ifeq ($(BR2_PACKAGE_LIBINTL),y)
-AVAHI_DEPENDENCIES += libintl
+AVAHI_DEPENDENCIES += gettext
 AVAHI_MAKE_OPT = LIBS=-lintl
 endif
 
diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index 91f6d1e..26d8b92 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -10,7 +10,7 @@ AXEL_SITE = https://alioth.debian.org/frs/download.php/3015
 AXEL_LDFLAGS = -lpthread
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
-AXEL_DEPENDENCIES += gettext libintl
+AXEL_DEPENDENCIES += gettext
 AXEL_LDFLAGS += -lintl
 endif
 
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 8632d67..29185e2 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -18,7 +18,7 @@ BINUTILS_SITE = ftp://www.at91.com/pub/buildroot
 endif
 BINUTILS_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_BINUTILS_EXTRA_CONFIG_OPTIONS))
 BINUTILS_INSTALL_STAGING = YES
-BINUTILS_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
+BINUTILS_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 
 # We need to specify host & target to avoid breaking ARM EABI
 BINUTILS_CONF_OPT = --disable-multilib --disable-werror \
diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
index 6d1896a..a877f2f 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -7,8 +7,7 @@
 DIFFUTILS_VERSION = 3.2
 DIFFUTILS_SITE = $(BR2_GNU_MIRROR)/diffutils
 DIFFUTILS_DEPENDENCIES = \
-	$(if $(BR2_PACKAGE_GETTEXT),gettext) \
-	$(if $(BR2_PACKAGE_LIBINTL),libintl)
+	$(if $(BR2_PACKAGE_GETTEXT),gettext)
 
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 DIFFUTILS_DEPENDENCIES += busybox
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index c1995a0..5457060 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -24,7 +24,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_DNSMASQ_IDN),y)
 	DNSMASQ_MAKE_OPT += all-i18n
-	DNSMASQ_DEPENDENCIES += libidn libintl
+	DNSMASQ_DEPENDENCIES += libidn gettext
 	DNSMASQ_MAKE_OPT += LDFLAGS+="-lintl -lidn"
 endif
 
diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index 041aba8..b684653 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -12,9 +12,8 @@ FLEX_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/f/flex
 FLEX_DIR = $(BUILD_DIR)/flex-$(FLEX_VERSION)
 FLEX_INSTALL_STAGING = YES
 FLEX_DEPENDENCIES = \
-	$(if $(BR2_PACKAGE_GETTEXT),gettext) \
-	$(if $(BR2_PACKAGE_LIBINTL),libintl)
-# we don't have a host-gettext/libintl
+	$(if $(BR2_PACKAGE_GETTEXT),gettext)
+# we don't have a host-gettext
 HOST_FLEX_DEPENDENCIES =
 
 # lex -> flex
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 8dc1c47..4bf71e4 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -35,7 +35,7 @@ GDK_PIXBUF_DEPENDENCIES += tiff
 endif
 
 GDK_PIXBUF_DEPENDENCIES += \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) \
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
 	$(if $(BR2_ENABLE_LOCALE),,libiconv) \
 	host-pkg-config libglib2
 
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
diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index 9165835..272994c 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -13,7 +13,7 @@ GLIB_NETWORKING_SOURCE = glib-networking-$(GLIB_NETWORKING_VERSION).tar.xz
 GLIB_NETWORKING_INSTALL_STAGING = YES
 
 GLIB_NETWORKING_DEPENDENCIES = \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) \
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
 	host-pkg-config \
 	host-intltool \
 	libglib2
diff --git a/package/gmpc/gmpc.mk b/package/gmpc/gmpc.mk
index 1db5346..f3c555a 100644
--- a/package/gmpc/gmpc.mk
+++ b/package/gmpc/gmpc.mk
@@ -11,6 +11,6 @@ GMPC_CONF_OPT = --disable-mmkeys --disable-unique
 GMPC_DEPENDENCIES = host-gob2 host-intltool host-pkg-config host-vala \
 	libglib2 libgtk2 libmpd libsoup sqlite \
 	xlib_libICE xlib_libSM xlib_libX11 \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 
 $(eval $(call AUTOTARGETS))
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index aa22910..e874128 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -8,7 +8,7 @@ GREP_VERSION = 2.11
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_CONF_OPT = --disable-perl-regexp --without-included-regex
-GREP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
+GREP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 
 # link with iconv if enabled
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index af30e8e..08a706b 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -2,6 +2,6 @@ KBD_VERSION = 1.15.2
 KBD_SOURCE = kbd-$(KBD_VERSION).tar.gz
 KBD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kbd
 
-KBD_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
+KBD_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 
 $(eval $(call AUTOTARGETS))
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index d2445a1..553378a 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -55,7 +55,7 @@ HOST_LIBGLIB2_CONF_OPT = \
 		--disable-gtk-doc \
 		--enable-debug=no \
 
-LIBGLIB2_DEPENDENCIES = host-pkg-config host-libglib2 libffi zlib $(if $(BR2_NEEDS_GETTEXT),gettext libintl)
+LIBGLIB2_DEPENDENCIES = host-pkg-config host-libglib2 libffi zlib $(if $(BR2_NEEDS_GETTEXT),gettext)
 
 HOST_LIBGLIB2_DEPENDENCIES = host-pkg-config host-libffi host-zlib
 
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 6572585..3ba47b9 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -19,7 +19,7 @@ endif
 
 LIBSOUP_CONF_OPT = --disable-glibtest --without-gnome
 
-LIBSOUP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) host-pkg-config host-libglib2 libglib2 libxml2
+LIBSOUP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-pkg-config host-libglib2 libglib2 libxml2
 
 ifeq ($(BR2_PACKAGE_LIBSOUP_SSL),y)
 LIBSOUP_DEPENDENCIES += glib-networking
diff --git a/package/make/make.mk b/package/make/make.mk
index 2886032..8cc8799 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -7,7 +7,7 @@ MAKE_VERSION:=3.81
 MAKE_SOURCE:=make-$(MAKE_VERSION).tar.bz2
 MAKE_SITE:=$(BR2_GNU_MIRROR)/make
 
-MAKE_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
+MAKE_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 
 MAKE_CONF_ENV = make_cv_sys_gnu_glob=no \
 		GLOBINC='-I$(@D)/glob' \
diff --git a/package/multimedia/pulseaudio/pulseaudio.mk b/package/multimedia/pulseaudio/pulseaudio.mk
index eefc497..2920dbc 100644
--- a/package/multimedia/pulseaudio/pulseaudio.mk
+++ b/package/multimedia/pulseaudio/pulseaudio.mk
@@ -15,7 +15,7 @@ PULSEAUDIO_CONF_OPT = \
 
 PULSEAUDIO_DEPENDENCIES = \
 	host-pkg-config libtool json-c libsndfile speex host-intltool \
-	$(if $(BR2_PACKAGE_LIBINTL),libintl) \
+	$(if $(BR2_PACKAGE_LIBINTL),gettext) \
 	$(if $(BR2_PACKAGE_LIBATOMIC_OPS),libatomic_ops) \
 	$(if $(BR2_PACKAGE_LIBSAMPLERATE),libsamplerate) \
 	$(if $(BR2_PACKAGE_ALSA_LIB),alsa-lib) \
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index f46bdc6..78620fe 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -41,7 +41,7 @@ PANGO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 
 PANGO_CONF_OPT = --enable-explicit-deps=no --disable-debug
 
-PANGO_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) host-pkg-config libglib2 cairo
+PANGO_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-pkg-config libglib2 cairo
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
         PANGO_CONF_OPT += --with-x \
diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
index 0b0e046..406be3a 100644
--- a/package/psmisc/psmisc.mk
+++ b/package/psmisc/psmisc.mk
@@ -6,7 +6,7 @@
 
 PSMISC_VERSION = 22.16
 PSMISC_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/psmisc/psmisc
-PSMISC_DEPENDENCIES = ncurses $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
+PSMISC_DEPENDENCIES = ncurses $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 
 ifneq ($(BR2_TOOLCHAIN_BUILDROOT_USE_SSP),y)
 # Don't force -fstack-protector
diff --git a/package/sshfs/sshfs.mk b/package/sshfs/sshfs.mk
index 738b4d0..7f6ce15 100644
--- a/package/sshfs/sshfs.mk
+++ b/package/sshfs/sshfs.mk
@@ -9,7 +9,7 @@ SSHFS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/fus
 SSHFS_SOURCE = sshfs-fuse-$(SSHFS_VERSION).tar.gz
 SSHFS_DEPENDENCIES = \
 	libglib2 libfuse openssh \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) \
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
 	$(if $(BR2_ENABLE_LOCALE),,libiconv)
 
 $(eval $(call AUTOTARGETS))
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index 55991c4..7bd5278 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -14,7 +14,7 @@ SYSSTAT_CONF_OPT += --disable-documentation
 endif
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
-SYSSTAT_DEPENDENCIES += gettext libintl
+SYSSTAT_DEPENDENCIES += gettext
 SYSSTAT_MAKE_OPT += CFLAGS+=-lintl
 endif
 
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index d8a3ac9..f6e9fcb 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -30,7 +30,7 @@ UTIL_LINUX_CONF_OPT += --without-ncurses
 endif
 
 ifeq ($(BR2_PACKAGE_LIBINTL),y)
-UTIL_LINUX_DEPENDENCIES += libintl
+UTIL_LINUX_DEPENDENCIES += gettext
 UTIL_LINUX_MAKE_OPT += LIBS=-lintl
 endif
 
diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index a3ad037..b579316 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -10,7 +10,7 @@ VALA_VERSION = $(VALA_VERSION_MAJOR).$(VALA_VERSION_MINOR)
 VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
 VALA_DEPENDENCIES = host-flex libglib2 \
-		$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
+		$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 HOST_VALA_DEPENDENCIES = host-flex host-libglib2
 
 $(eval $(call AUTOTARGETS))
-- 
1.7.10
