From: laird at uclibc.org <laird@uclibc.org>
Date: Fri, 28 Nov 2008 06:20:47 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot: package package/atk
	package/directfb pa etc...
Message-ID: <20081128142047.DBFD83C2BB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2008-11-28 06:20:47 -0800 (Fri, 28 Nov 2008)
New Revision: 24173

Log:
Adding Central config.cache options

The following changes allow for use of a central configure cache
file.  This speeds up configuration of packages.
Its use is configurable at the top level (BR2_CONFIG_CACHE - default n).
Old style makefiles can use it if they use the following MACRO in makefiles:
$(AUTO_CONFIGURE_TARGET) see my change to directfb.mk.
New style Autotools.in will use it if you set the global option.
However you can enable the global option and on a per package overrule it by doing
the following: $(PKGNAME)_USE_CONFIG_CACHE = NO see fontconfig.mk for an example 
of this.
Finally I have removed a few config variable settings which indicated no CXX compiler
as this is wrong and breaks the build when using this central cache.

 Config.in                        |    8 ++++++++
 package/Makefile.autotools.in    |    5 ++++-
 package/Makefile.in              |   28 +++++++++++++++++++++++++++-
 package/atk/atk.mk               |    2 +-
 package/directfb/directfb.mk     |    7 +------
 package/fontconfig/fontconfig.mk |    3 +++
 package/libglib2/libglib2.mk     |    2 +-
 package/libgtk2/libgtk2.mk       |    1 -
 8 files changed, 45 insertions(+), 11 deletions(-)

I would appreciate feedback on this change (I have been testing for 2-3 weeks)
But I can never test all cases!  If you enable the BR2_CONFIG_CACHE option some
Makefile.autotools.in based packages may now break - I cannot build them all.
In this case you may need to remove config options that are being hardcoded all
over the place (like gtk saying we have 2 CXX compiler) or disable the use
of CONFIG CACHE file like I have done in fontconfig.
I can build all packages required to get WebKit on DirectFB up and running
and it runs fine.
I will try to resolve any issues this creates as fast as I can.

Signed-off-by: Daniel Laird <daniel.j.laird@nxp.com>



Modified:
   trunk/buildroot/Config.in
   trunk/buildroot/package/Makefile.autotools.in
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/package/atk/atk.mk
   trunk/buildroot/package/directfb/directfb.mk
   trunk/buildroot/package/fontconfig/fontconfig.mk
   trunk/buildroot/package/libglib2/libglib2.mk
   trunk/buildroot/package/libgtk2/libgtk2.mk


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2008-11-28 08:19:23 UTC (rev 24172)
+++ trunk/buildroot/Config.in	2008-11-28 14:20:47 UTC (rev 24173)
@@ -189,6 +189,14 @@
 	help
 	  This option show recent versions of packages.
 
+config BR2_CONFIG_CACHE
+	bool "Use a central configure cache file"
+	default n
+	help
+	  This determines if a central config cache is used by
+	  packages, reducing the configure time for packages as each
+	  one caches its findings.
+
 config BR2_ENABLE_DEBUG
 	bool "build packages with debugging symbols"
 	select BR2_PACKAGE_GDB_SERVER

Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2008-11-28 08:19:23 UTC (rev 24172)
+++ trunk/buildroot/package/Makefile.autotools.in	2008-11-28 14:20:47 UTC (rev 24173)
@@ -32,6 +32,8 @@
 #	run <autoreconf> before <configure>
 # FOO_LIBTOOL_PATCH [YES/NO, default YES]
 #	Do you want the standard buildroot patch applied to ltmain.sh? (libtool)
+# FOO_USE_CONFIG_CACHE [YES/NO default $(BR2_CONFIG_CACHE)]
+#   Do you wany to use the central configure cache file? See BR2_CONFIG_CACHE.
 # FOO_CONF_ENV [default empty]
 #	environment passed to the <configure> script
 # FOO_CONF_OPT [default empty]
@@ -217,8 +219,10 @@
 	cd $(@D)/$($(PKG)_SUBDIR) && rm -f config.cache && \
 	$(TARGET_CONFIGURE_OPTS) \
 	$(TARGET_CONFIGURE_ARGS) \
+	$(TARGET_CONFIGURE_ENV) \
 	$($(PKG)_CONF_ENV) \
-		./configure \
+	$(if $(THIS_SRCDIR),$(THIS_SRCDIR)/,./)configure \
+		$(if $(filter YES,$($(PKG)_USE_CONFIG_CACHE)),--cache-file="$(PROJECT_BUILD_DIR)/tgt-config.cache",) \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
@@ -302,6 +306,7 @@
 $(2)_DEPENDENCIES		?=
 $(2)_AUTORECONF			?= NO
 $(2)_LIBTOOL_PATCH		?= YES
+$(2)_USE_CONFIG_CACHE   ?= $(if $(BR2_CONFIG_CACHE),YES,NO)
 $(2)_CONF_ENV			?=
 $(2)_CONF_OPT			?=
 $(2)_MAKE_ENV			?=

Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2008-11-28 08:19:23 UTC (rev 24172)
+++ trunk/buildroot/package/Makefile.in	2008-11-28 14:20:47 UTC (rev 24173)
@@ -178,6 +178,8 @@
 STRIPCMD=$(TARGET_STRIP)
 endif
 INSTALL=/usr/bin/install
+FLEX:=$(shell $(CONFIG_SHELL) -c 'which flex || type -p flex')
+BISON:=$(shell $(CONFIG_SHELL) -c 'which bison || type -p bison')
 
 HOST_ARCH:=$(shell $(HOSTCC) -dumpmachine | sed -e s'/-.*//' \
 	-e 's/sparc.*/sparc/' \
@@ -193,10 +195,23 @@
 	)
 GNU_HOST_NAME:=$(HOST_ARCH)-$(subst ",,$(BR2_GNU_BUILD_SUFFIX))
 #")
+
+AUTO_CONFIGURE_TARGET=\
+	$(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_CONFIGURE_ARGS) \
+	$(TARGET_CONFIGURE_ENV) \
+	$(if $(THIS_SRCDIR),$(THIS_SRCDIR)/,./)configure \
+		$(if $(BR2_CONFIG_CACHE),--cache-file="$(PROJECT_BUILD_DIR)/tgt-config.cache",) \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME)
+
 TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
 		AR="$(TARGET_AR)" \
 		AS="$(TARGET_AS)" \
-		LD="$(TARGET_LD) $(TARGET_LDFLAGS)" \
+		LD="$(TARGET_LD)" \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
 		NM="$(TARGET_NM)" \
 		CC="$(TARGET_CC) $(TARGET_CFLAGS)" \
 		GCC="$(TARGET_CC) $(TARGET_CFLAGS)" \
@@ -229,6 +244,12 @@
 		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
 		STAGING_DIR="$(STAGING_DIR)"
 
+TARGET_CONFIGURE_ENV=\
+	CFLAGS="$(TARGET_CFLAGS)" \
+	CXXFLAGS="$(TARGET_CXXFLAGS)" \
+	LDFLAGS="$(TARGET_LDFLAGS)" \
+	FCFLAGS="$(TARGET_FCFLAGS)" \
+
 HOST_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
 		AR="$(HOSTAR)" \
 		AS="$(HOSTAS)" \
@@ -310,6 +331,11 @@
 	$(BR2_AC_CV_TRAP_CHECK) \
 	ac_cv_func_mmap_fixed_mapped=yes \
 	ac_cv_func_memcmp_working=yes \
+	ac_cv_have_decl_malloc=yes \
+	gl_cv_func_malloc_0_nonnull=yes \
+	ac_cv_func_malloc_0_nonnull=yes \
+	ac_cv_func_calloc_0_nonnull=yes \
+	ac_cv_func_realloc_0_nonnull=yes \
 	$(BR2_AC_CV_C_BIGENDIAN)
 
 #######################################################################

Modified: trunk/buildroot/package/atk/atk.mk
===================================================================
--- trunk/buildroot/package/atk/atk.mk	2008-11-28 08:19:23 UTC (rev 24172)
+++ trunk/buildroot/package/atk/atk.mk	2008-11-28 14:20:47 UTC (rev 24173)
@@ -39,7 +39,7 @@
 		gl_cv_func_mkstemp_limitations=no ac_cv_func_working_mktime=yes \
 		jm_cv_func_working_re_compile_pattern=yes ac_use_included_regex=no \
 		gl_cv_c_restrict=no ac_cv_path_GLIB_GENMARSHAL=$(HOST_GLIB)/bin/glib-genmarshal \
-		ac_cv_prog_F77=no ac_cv_prog_CXX=no
+		ac_cv_prog_F77=no
 
 ifneq ($(BR2_PACKAGE_XSERVER_none),y)
 ATK_CONF_OPT_X = --with-x \

Modified: trunk/buildroot/package/directfb/directfb.mk
===================================================================
--- trunk/buildroot/package/directfb/directfb.mk	2008-11-28 08:19:23 UTC (rev 24172)
+++ trunk/buildroot/package/directfb/directfb.mk	2008-11-28 14:20:47 UTC (rev 24173)
@@ -115,15 +115,10 @@
 
 $(DIRECTFB_DIR)/.configured: $(DIRECTFB_DIR)/.unpacked
 	(cd $(DIRECTFB_DIR); rm -f config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
 	ac_cv_header_linux_wm97xx_h=no \
 	ac_cv_header_linux_sisfb_h=no \
 	ac_cv_header_asm_page_h=no \
-	./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
+	$(AUTO_CONFIGURE_TARGET) \
 		--prefix=/usr \
 		--sysconfdir=/etc \
 		--localstatedir=/var \

Modified: trunk/buildroot/package/fontconfig/fontconfig.mk
===================================================================
--- trunk/buildroot/package/fontconfig/fontconfig.mk	2008-11-28 08:19:23 UTC (rev 24172)
+++ trunk/buildroot/package/fontconfig/fontconfig.mk	2008-11-28 14:20:47 UTC (rev 24173)
@@ -7,8 +7,11 @@
 FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.gz
 FONTCONFIG_SITE = http://fontconfig.org/release
 FONTCONFIG_AUTORECONF = YES
+FONTCONFIG_USE_CONFIG_CACHE = NO
 FONTCONFIG_INSTALL_STAGING = YES
 FONTCONFIG_INSTALL_TARGET = YES
+# This package does not like using the target cflags for some reason.
+FONTCONFIG_CONF_ENV = CFLAGS=
 
 FONTCONFIG_CONF_OPT = --with-arch=$(GNU_TARGET_NAME) \
 		--with-freetype-config="$(STAGING_DIR)/usr/bin/freetype-config" \

Modified: trunk/buildroot/package/libglib2/libglib2.mk
===================================================================
--- trunk/buildroot/package/libglib2/libglib2.mk	2008-11-28 08:19:23 UTC (rev 24172)
+++ trunk/buildroot/package/libglib2/libglib2.mk	2008-11-28 14:20:47 UTC (rev 24173)
@@ -41,7 +41,7 @@
 		ac_cv_func_working_mktime=yes jm_cv_func_working_re_compile_pattern=yes \
 		ac_use_included_regex=no gl_cv_c_restrict=no \
 		ac_cv_path_GLIB_GENMARSHAL=$(HOST_GLIB)/bin/glib-genmarshal ac_cv_prog_F77=no \
-		ac_cv_prog_CXX=no ac_cv_func_posix_getgrgid_r=no \
+		ac_cv_func_posix_getgrgid_r=no \
 		gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no)
 
 LIBGLIB2_CONF_OPT = --enable-shared \

Modified: trunk/buildroot/package/libgtk2/libgtk2.mk
===================================================================
--- trunk/buildroot/package/libgtk2/libgtk2.mk	2008-11-28 08:19:23 UTC (rev 24172)
+++ trunk/buildroot/package/libgtk2/libgtk2.mk	2008-11-28 14:20:47 UTC (rev 24173)
@@ -68,7 +68,6 @@
 		ac_cv_path_GTK_UPDATE_ICON_CACHE=$(HOST_GLIB)/bin/gtk-update-icon-cache \
 		ac_cv_path_GDK_PIXBUF_CSOURCE=$(HOST_GLIB)/bin/gdk-pixbuf-csource \
 		ac_cv_prog_F77=no \
-		ac_cv_prog_CXX=no \
 		ac_cv_path_CUPS_CONFIG=no
 
 LIBGTK2_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
