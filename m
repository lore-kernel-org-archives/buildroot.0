From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sat, 18 Sep 2010 14:38:10 +0200
Subject: [Buildroot] [PATCH 3/3] gettext: bump to 0.18.1.1
In-Reply-To: <1284813490-32442-1-git-send-email-llandwerlin@gmail.com>
References: <1284813490-32442-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1284813490-32442-4-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Also ensure with use autopoint tool from the gettext-host package
rather than the one from the host.

Signed-off-by: Lionel Landwerlin <lionel.landwerlin@pace.com>
---
 package/Makefile.autotools.in                      |    3 +-
 .../gettext/gettext-autoconf-lib-link-no-L.patch   |   28 +++
 package/gettext/gettext-autotools.patch            |   28 +++
 package/gettext/gettext-error_print_progname.patch |   14 --
 .../gettext-gnulib-uclibc-sched_param-def.patch    |   53 +++++
 package/gettext/gettext.mk                         |  227 +++++++-------------
 package/gettext/libdir-la.patch                    |  154 -------------
 7 files changed, 188 insertions(+), 319 deletions(-)
 create mode 100644 package/gettext/gettext-autoconf-lib-link-no-L.patch
 create mode 100644 package/gettext/gettext-autotools.patch
 delete mode 100644 package/gettext/gettext-error_print_progname.patch
 create mode 100644 package/gettext/gettext-gnulib-uclibc-sched_param-def.patch
 delete mode 100644 package/gettext/libdir-la.patch

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index 6d4f604..db44601 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -75,6 +75,7 @@ else
 $(2)_AUTORECONF			?= YES
 $(2)_AUTORECONF_OPT		?= -f -i -I "$$(ACLOCAL_STAGING_DIR)"
 $(2)_AUTORECONF_ENV		?= $$(TARGET_CONFIGURE_OPTS) \
+				AUTOPOINT="$$(AUTOPOINT)" \
 				ACLOCAL="$$(ACLOCAL)" \
 				AUTOCONF="$$(AUTOCONF)" \
 				AUTOHEADER="$$(AUTOHEADER)" \
@@ -188,7 +189,7 @@ endef
 
 ifeq ($$($(2)_AUTORECONF),YES)
 $(2)_POST_PATCH_HOOKS += AUTORECONF_HOOK
-$(2)_DEPENDENCIES += host-automake host-autoconf host-libtool
+$(2)_DEPENDENCIES += host-automake host-autoconf host-libtool $(if $(BR2_NEEDS_GETTEXT,y),host-gettext)
 endif
 
 #
diff --git a/package/gettext/gettext-autoconf-lib-link-no-L.patch b/package/gettext/gettext-autoconf-lib-link-no-L.patch
new file mode 100644
index 0000000..d2063b0
--- /dev/null
+++ b/package/gettext/gettext-autoconf-lib-link-no-L.patch
@@ -0,0 +1,28 @@
+Index: gettext-0.18/gettext-runtime/gnulib-m4/lib-link.m4
+===================================================================
+--- gettext-0.18.orig/gettext-runtime/gnulib-m4/lib-link.m4	2010-05-18 17:12:12.593014616 -0700
++++ gettext-0.18/gettext-runtime/gnulib-m4/lib-link.m4	2010-05-18 17:12:58.631176939 -0700
+@@ -312,6 +312,9 @@ AC_DEFUN([AC_LIB_LINKFLAGS_BODY],
+               fi
+             fi
+           fi
++          dnl Just let the compiler find the library, the compiler and user are smarter then this script
++          dnl when cross compiling and working with a relocated install.
++          found_dir=""
+           if test "X$found_dir" = "X"; then
+             for x in $LDFLAGS $LTLIB[]NAME; do
+               AC_LIB_WITH_FINAL_PREFIX([eval x=\"$x\"])
+Index: gettext-0.18/gettext-tools/gnulib-m4/lib-link.m4
+===================================================================
+--- gettext-0.18.orig/gettext-tools/gnulib-m4/lib-link.m4	2010-05-18 17:12:12.633052946 -0700
++++ gettext-0.18/gettext-tools/gnulib-m4/lib-link.m4	2010-05-18 17:13:35.020559106 -0700
+@@ -312,6 +312,9 @@ AC_DEFUN([AC_LIB_LINKFLAGS_BODY],
+               fi
+             fi
+           fi
++          dnl Just let the compiler find the library, the compiler and user are smarter then this script
++          dnl when cross compiling and working with a relocated install.
++          found_dir=""
+           if test "X$found_dir" = "X"; then
+             for x in $LDFLAGS $LTLIB[]NAME; do
+               AC_LIB_WITH_FINAL_PREFIX([eval x=\"$x\"])
diff --git a/package/gettext/gettext-autotools.patch b/package/gettext/gettext-autotools.patch
new file mode 100644
index 0000000..8302b34
--- /dev/null
+++ b/package/gettext/gettext-autotools.patch
@@ -0,0 +1,28 @@
+Index: gettext-0.18/gettext-runtime/man/Makefile.am
+===================================================================
+--- gettext-0.18.orig/gettext-runtime/man/Makefile.am	2009-06-28 12:44:04.000000000 -0700
++++ gettext-0.18/gettext-runtime/man/Makefile.am	2010-05-18 16:58:51.130518057 -0700
+@@ -159,8 +159,7 @@ bind_textdomain_codeset.3.html: bind_tex
+ 	$(MAN2HTML) $(srcdir)/bind_textdomain_codeset.3.in | sed -e '/CreationDate:/d' > t-$@
+ 	mv t-$@ $@
+ 
+-install-html-local:
+-	$(mkdir_p) $(DESTDIR)$(htmldir)
++install-html: installdirs-html
+ 	for file in $(man_HTML); do \
+ 	  if test -f $$file; then dir=.; else dir=$(srcdir); fi; \
+ 	  $(INSTALL_DATA) $$dir/$$file $(DESTDIR)$(htmldir)/$$file; \
+Index: gettext-0.18/gettext-tools/man/Makefile.am
+===================================================================
+--- gettext-0.18.orig/gettext-tools/man/Makefile.am	2009-06-28 12:44:04.000000000 -0700
++++ gettext-0.18/gettext-tools/man/Makefile.am	2010-05-18 16:58:51.130518057 -0700
+@@ -186,8 +186,7 @@ autopoint.1.html: autopoint.1
+ 	$(MAN2HTML) `if test -f autopoint.1; then echo .; else echo $(srcdir); fi`/autopoint.1 | sed -e '/CreationDate:/d' > t-$@
+ 	mv t-$@ $@
+ 
+-install-html-local:
+-	$(mkdir_p) $(DESTDIR)$(htmldir)
++install-html: installdirs-html
+ 	for file in $(man_HTML); do \
+ 	  if test -f $$file; then dir=.; else dir=$(srcdir); fi; \
+ 	  $(INSTALL_DATA) $$dir/$$file $(DESTDIR)$(htmldir)/$$file; \
diff --git a/package/gettext/gettext-error_print_progname.patch b/package/gettext/gettext-error_print_progname.patch
deleted file mode 100644
index 189d28b..0000000
--- a/package/gettext/gettext-error_print_progname.patch
+++ /dev/null
@@ -1,14 +0,0 @@
---- gettext-0.16.1.oorig/gettext-tools/gnulib-lib/error.h	2006-11-27 18:14:50.000000000 +0100
-+++ gettext-0.16.1/gettext-tools/gnulib-lib/error.h	2007-06-20 13:29:32.000000000 +0200
-@@ -50,7 +50,10 @@ extern void error_at_line (int __status,
- /* If NULL, error will flush stdout, then print on stderr the program
-    name, a colon and a space.  Otherwise, error will call this
-    function without parameters instead.  */
--extern DLL_VARIABLE void (*error_print_progname) (void);
-+#ifndef __UCLIBC__
-+extern DLL_VARIABLE
-+#endif
-+void (*error_print_progname) (void);
- 
- /* This variable is incremented each time `error' is called.  */
- extern DLL_VARIABLE unsigned int error_message_count;
diff --git a/package/gettext/gettext-gnulib-uclibc-sched_param-def.patch b/package/gettext/gettext-gnulib-uclibc-sched_param-def.patch
new file mode 100644
index 0000000..ce8a5af
--- /dev/null
+++ b/package/gettext/gettext-gnulib-uclibc-sched_param-def.patch
@@ -0,0 +1,53 @@
+uclibc defines __GLIBC__ but it does not expose struct shed_param as much as glibc
+and is not needed too per standard. gnulib attempts to use it but we have to account
+for it because in this case uclibc does not behave like glibc.
+
+-Khem
+
+diff --git a/gettext-tools/gnulib-lib/localename.c b/gettext-tools/gnulib-lib/localename.c
+index dab5e5b..67da340 100644
+--- a/gettext-tools/gnulib-lib/localename.c
++++ b/gettext-tools/gnulib-lib/localename.c
+@@ -2613,10 +2613,12 @@ gl_locale_name_thread_unsafe (int category, const char *categoryname)
+            See <http://sourceware.org/bugzilla/show_bug.cgi?id=10968>.  */
+         const char *name =
+           nl_langinfo (_NL_ITEM ((category), _NL_ITEM_INDEX (-1)));
++#   ifndef __UCLIBC__
+         if (name[0] == '\0')
+           /* Fallback code for glibc < 2.4, which did not implement
+              nl_langinfo (_NL_LOCALE_NAME (category)).  */
+           name = thread_locale->__names[category];
++#   endif
+         return name;
+ #  endif
+ #  if defined __APPLE__ && defined __MACH__ /* MacOS X */
+diff --git a/gettext-runtime/intl/localename.c b/gettext-runtime/intl/localename.c
+index 89a9692..c8b030e 100644
+--- a/gettext-runtime/intl/localename.c
++++ b/gettext-runtime/intl/localename.c
+@@ -2613,10 +2613,12 @@ gl_locale_name_thread_unsafe (int category, const char *categoryname)
+            See <http://sourceware.org/bugzilla/show_bug.cgi?id=10968>.  */
+         const char *name =
+           nl_langinfo (_NL_ITEM ((category), _NL_ITEM_INDEX (-1)));
++#   ifndef __UCLIBC__
+         if (name[0] == '\0')
+           /* Fallback code for glibc < 2.4, which did not implement
+              nl_langinfo (_NL_LOCALE_NAME (category)).  */
+           name = thread_locale->__names[category];
++#   endif
+         return name;
+ #  endif
+ #  if defined __APPLE__ && defined __MACH__ /* MacOS X */
+diff --git a/gettext-tools/gnulib-lib/spawn.in.h b/gettext-tools/gnulib-lib/spawn.in.h
+index 89a9692..c8b030e 100644
+--- a/gettext-tools/gnulib-lib/spawn.in.h
++++ b/gettext-tools/gnulib-lib/spawn.in.h
+@@ -31,7 +31,7 @@
+ 
+ /* Get definitions of 'struct sched_param' and 'sigset_t'.
+    But avoid namespace pollution on glibc systems.  */
+-#ifndef __GLIBC__
++#if !defined __GLIBC__ || defined __UCLIBC__
+ # include <sched.h>
+ # include <signal.h>
+ #endif
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 2b308c8..c6246bd 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -3,163 +3,90 @@
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
-
-ifeq ($(BR2_PACKAGE_GETTEXT_STATIC),y)
-LIBINTL_TARGET_BINARY:=usr/lib/libintl.a
-else
-LIBINTL_TARGET_BINARY:=usr/lib/libintl.so
+GETTEXT_VERSION = 0.18.1.1
+GETTEXT_SOURCE = gettext-$(GETTEXT_VERSION).tar.gz
+GETTEXT_SITE = $(BR2_GNU_MIRROR)/gettext
+GETTEXT_INSTALL_STAGING = YES
+
+GETTEXT_CONF_ENV = \
+	ac_cv_func_strtod=yes \
+	ac_fsusage_space=yes \
+	fu_cv_sys_stat_statfs2_bsize=yes \
+	ac_cv_func_closedir_void=no \
+	ac_cv_func_getloadavg=no \
+	ac_cv_lib_util_getloadavg=no \
+	ac_cv_lib_getloadavg_getloadavg=no \
+	ac_cv_func_getgroups=yes \
+	ac_cv_func_getgroups_works=yes \
+	ac_cv_func_chown_works=yes \
+	ac_cv_have_decl_euidaccess=no \
+	ac_cv_func_euidaccess=no \
+	ac_cv_have_decl_strnlen=yes \
+	ac_cv_func_strnlen_working=yes \
+	ac_cv_func_lstat_dereferences_slashed_symlink=yes \
+	ac_cv_func_lstat_empty_string_bug=no \
+	ac_cv_func_stat_empty_string_bug=no \
+	vb_cv_func_rename_trailing_slash_bug=no \
+	ac_cv_have_decl_nanosleep=yes \
+	jm_cv_func_nanosleep_works=yes \
+	gl_cv_func_working_utimes=yes \
+	ac_cv_func_utime_null=yes \
+	ac_cv_have_decl_strerror_r=yes \
+	ac_cv_func_strerror_r_char_p=no \
+	jm_cv_func_svid_putenv=yes \
+	ac_cv_func_getcwd_null=yes \
+	ac_cv_func_getdelim=yes \
+	ac_cv_func_mkstemp=yes \
+	utils_cv_func_mkstemp_limitations=no \
+	utils_cv_func_mkdir_trailing_slash_bug=no \
+	jm_cv_func_gettimeofday_clobber=no \
+	gl_cv_func_working_readdir=yes \
+	jm_ac_cv_func_link_follows_symlink=no \
+	utils_cv_localtime_cache=no \
+	ac_cv_struct_st_mtim_nsec=no \
+	gl_cv_func_tzset_clobber=no \
+	gl_cv_func_getcwd_null=yes \
+	gl_cv_func_getcwd_path_max=yes \
+	ac_cv_func_fnmatch_gnu=yes \
+	am_getline_needs_run_time_check=no \
+	am_cv_func_working_getline=yes \
+	gl_cv_func_mkdir_trailing_slash_bug=no \
+	gl_cv_func_mkstemp_limitations=no \
+	ac_cv_func_working_mktime=yes \
+	jm_cv_func_working_re_compile_pattern=yes \
+	ac_use_included_regex=no \
+	gl_cv_c_restrict=no
+
+GETTEXT_CONF_OPT = \
+	--disable-libasprintf \
+	--disable-openmp \
+	--without-emacs
+
+ifneq ($(BR2_PACKAGE_JAMVM),y)
+GETTEXT_CONF_OPT += --disable-java
 endif
 
-$(DL_DIR)/$(GETTEXT_SOURCE):
-	 $(call DOWNLOAD,$(GETTEXT_SITE),$(GETTEXT_SOURCE))
-
-gettext-source: $(DL_DIR)/$(GETTEXT_SOURCE)
-
-$(GETTEXT_DIR)/.unpacked: $(DL_DIR)/$(GETTEXT_SOURCE)
-	$(GETTEXT_CAT) $(DL_DIR)/$(GETTEXT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(GETTEXT_DIR) package/gettext/ gettext\*.patch
-	$(CONFIG_UPDATE) $(@D)
-	$(CONFIG_UPDATE) $(GETTEXT_DIR)/build-aux
-	touch $@
-
 ifneq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-IGNORE_EXTERNAL_GETTEXT:=--with-included-gettext
+GETTEXT_CONF_OPT += --with-included-gettext
 endif
 
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
-
-$(GETTEXT_DIR)/$(GETTEXT_BINARY): $(GETTEXT_DIR)/.configured
-	$(MAKE) -C $(GETTEXT_DIR)
-	touch -c $(GETTEXT_DIR)/$(GETTEXT_BINARY)
-
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
+# Do not install libintl unless we need it.
+define GETTEXT_REMOVE_STAGING_FILES
+	rm -f $(STAGING_DIR)/usr/lib/libintl*
+endef
 
-gettext-target: $(GETTEXT_DIR)/$(GETTEXT_BINARY)
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(GETTEXT_DIR) install
-	chmod +x $(TARGET_DIR)/usr/lib/libintl.so* # identify as needing to be stripped
+define GETTEXT_REMOVE_TARGET_FILES
+	rm -f $(TARGET_DIR)/usr/lib/libintl*
+endef
 
-$(TARGET_DIR)/usr/lib/libintl.so: $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY)
-	cp -dpf $(STAGING_DIR)/usr/lib/libgettext*.so* \
-		$(STAGING_DIR)/usr/lib/libintl*.so* $(TARGET_DIR)/usr/lib/
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libgettext*.so*
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libintl*.so*
-	rm -f $(addprefix $(TARGET_DIR)/usr/lib/, \
-		libgettext*.so*.la libintl*.so*.la)
-	touch -c $@
+ifneq ($(BR2_PACKAGE_LIBINTL),y)
+GETTEXT_POST_INSTALL_STAGING_HOOKS += GETTEXT_REMOVE_STAGING_FILES
+GETTEXT_POST_INSTALL_TARGET_HOOKS += GETTEXT_REMOVE_TARGET_FILES
+endif
 
-$(TARGET_DIR)/usr/lib/libintl.a: $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY)
-	cp -dpf $(STAGING_DIR)/usr/lib/libgettext*.a $(TARGET_DIR)/usr/lib/
-	cp -dpf $(STAGING_DIR)/usr/lib/libintl*.a $(TARGET_DIR)/usr/lib/
-	touch -c $@
+$(eval $(call AUTOTARGETS,package,gettext))
+$(eval $(call AUTOTARGETS,package,gettext,host))
 
-libintl: $(TARGET_DIR)/$(LIBINTL_TARGET_BINARY)
+libintl: gettext
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LIBINTL),y)
-TARGETS+=libintl
-endif
-ifeq ($(BR2_PACKAGE_GETTEXT),y)
-TARGETS+=gettext
-endif
+AUTOPOINT = $(HOST_DIR)/usr/bin/autopoint
\ No newline at end of file
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
1.7.1
