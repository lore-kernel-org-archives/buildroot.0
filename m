From: danieljlaird at hotmail.com <danieljlaird@hotmail.com>
Date: Wed, 12 Nov 2008 18:06:42 -0000
Subject: [Buildroot] Adding AUTO_CONFIGURE_TARGET options from the GIT
	version of buildroot.
In-Reply-To: <C13DBBE85AD6974B85C118C35890CA5F13B24B8CBE@EU1RDCRDC1WX029.exi.nxp.com>
References: <C13DBBE85AD6974B85C118C35890CA5F13B24B8CBE@EU1RDCRDC1WX029.exi.nxp.com>
Message-ID: <COL102-DS27ABA89DE666BAFC2B74ADC140@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Has anyone tried this yet?

Because I want to start work on the next bit!
(--enable-static if BR2_PREFER_STATIC) for Makefile.autotools.in packages.

Cheers
Daniel Laird

--------------------------------------------------
From: "Daniel J Laird" <daniel.j.laird@nxp.com>
Sent: Wednesday, November 12, 2008 9:33 AM
To: <buildroot@uclibc.org>
Subject: [Buildroot] Adding AUTO_CONFIGURE_TARGET options from the GIT 
version of buildroot.

> The following patch adds the AUTO_CONFIGURE_TARGET idea from the GIT 
> buildroot tree.
> This allows packages to use a central cache which speeds up configure.
> You can disable the cache at top level (BR2_CONFIG_CACHE) default n
> You can also on a per package basis (Makefile.autotools.in only) 
> $(PKG)_USE_CONFIG_CACHE = NO
> Old style packages do not use the cache by default so only if you add the 
> AUTO_CONFIGURE_TARGET like I have done for directfb.mk will it
> use it.
>
> I had an issue with Fontconfig so I disabled the cache usage.
>
> Hope some of you can try this and provide feedback.
>
> Cheers
> Daniel Laird
>
> Index: Config.in
> ===================================================================
> --- Config.in (revision 24010)
> +++ Config.in (working copy)
> @@ -189,6 +189,14 @@
>  help
>    This option show recent versions of packages.
>
> +config BR2_CONFIG_CACHE
> + bool "Use a central configure cache file"
> + default n
> + help
> +   This determines if a central config cache is used by
> +   packages, reducing the configure time for packages as each
> +   one caches its findings.
> +
> config BR2_ENABLE_DEBUG
>  bool "build packages with debugging symbols"
>  select BR2_PACKAGE_GDB_SERVER
> Index: package/atk/atk.mk
> ===================================================================
> --- package/atk/atk.mk (revision 24010)
> +++ package/atk/atk.mk (working copy)
> @@ -39,7 +39,7 @@
>  gl_cv_func_mkstemp_limitations=no ac_cv_func_working_mktime=yes \
>  jm_cv_func_working_re_compile_pattern=yes ac_use_included_regex=no \
>  gl_cv_c_restrict=no 
> ac_cv_path_GLIB_GENMARSHAL=$(HOST_GLIB)/bin/glib-genmarshal \
> - ac_cv_prog_F77=no ac_cv_prog_CXX=no
> + ac_cv_prog_F77=no
>
> ifneq ($(BR2_PACKAGE_XSERVER_none),y)
> ATK_CONF_OPT_X = --with-x \
> Index: package/libglib2/libglib2.mk
> ===================================================================
> --- package/libglib2/libglib2.mk (revision 24010)
> +++ package/libglib2/libglib2.mk (working copy)
> @@ -41,7 +41,7 @@
>  ac_cv_func_working_mktime=yes jm_cv_func_working_re_compile_pattern=yes \
>  ac_use_included_regex=no gl_cv_c_restrict=no \
>  ac_cv_path_GLIB_GENMARSHAL=$(HOST_GLIB)/bin/glib-genmarshal 
> ac_cv_prog_F77=no \
> - ac_cv_prog_CXX=no ac_cv_func_posix_getgrgid_r=no \
> + ac_cv_func_posix_getgrgid_r=no \
>  gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no)
>
> LIBGLIB2_CONF_OPT = --enable-shared \
> Index: package/directfb/directfb.mk
> ===================================================================
> --- package/directfb/directfb.mk (revision 24010)
> +++ package/directfb/directfb.mk (working copy)
> @@ -115,15 +115,10 @@
>
> $(DIRECTFB_DIR)/.configured: $(DIRECTFB_DIR)/.unpacked
>  (cd $(DIRECTFB_DIR); rm -f config.cache; \
> - $(TARGET_CONFIGURE_OPTS) \
> - $(TARGET_CONFIGURE_ARGS) \
>  ac_cv_header_linux_wm97xx_h=no \
>  ac_cv_header_linux_sisfb_h=no \
>  ac_cv_header_asm_page_h=no \
> - ./configure \
> - --target=$(GNU_TARGET_NAME) \
> - --host=$(GNU_TARGET_NAME) \
> - --build=$(GNU_HOST_NAME) \
> + $(AUTO_CONFIGURE_TARGET) \
>  --prefix=/usr \
>  --sysconfdir=/etc \
>  --localstatedir=/var \
> Index: package/fontconfig/fontconfig.mk
> ===================================================================
> --- package/fontconfig/fontconfig.mk (revision 24010)
> +++ package/fontconfig/fontconfig.mk (working copy)
> @@ -7,8 +7,11 @@
> FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.gz
> FONTCONFIG_SITE = http://fontconfig.org/release
> FONTCONFIG_AUTORECONF = YES
> +FONTCONFIG_USE_CONFIG_CACHE = NO
> FONTCONFIG_INSTALL_STAGING = YES
> FONTCONFIG_INSTALL_TARGET = YES
> +# This package does not like using the target cflags for some reason.
> +FONTCONFIG_CONF_ENV = CFLAGS=
>
> FONTCONFIG_CONF_OPT = --with-arch=$(GNU_TARGET_NAME) \
>  --with-freetype-config="$(STAGING_DIR)/usr/bin/freetype-config" \
> Index: package/Makefile.autotools.in
> ===================================================================
> --- package/Makefile.autotools.in (revision 24010)
> +++ package/Makefile.autotools.in (working copy)
> @@ -217,8 +217,10 @@
>  cd $(@D)/$($(PKG)_SUBDIR) && rm -f config.cache && \
>  $(TARGET_CONFIGURE_OPTS) \
>  $(TARGET_CONFIGURE_ARGS) \
> + $(TARGET_CONFIGURE_ENV) \
>  $($(PKG)_CONF_ENV) \
> - ./configure \
> + $(if $(THIS_SRCDIR),$(THIS_SRCDIR)/,./)configure \
> + $(if $(filter 
> YES,$($(PKG)_USE_CONFIG_CACHE)),--cache-file="$(PROJECT_BUILD_DIR)/tgt-config.cache",) 
> \
>  --target=$(GNU_TARGET_NAME) \
>  --host=$(GNU_TARGET_NAME) \
>  --build=$(GNU_HOST_NAME) \
> @@ -302,6 +304,7 @@
> $(2)_DEPENDENCIES ?=
> $(2)_AUTORECONF ?= NO
> $(2)_LIBTOOL_PATCH ?= YES
> +$(2)_USE_CONFIG_CACHE   ?= $(if $(BR2_CONFIG_CACHE),YES,NO)
> $(2)_CONF_ENV ?=
> $(2)_CONF_OPT ?=
> $(2)_MAKE_ENV ?=
> Index: package/libgtk2/libgtk2.mk
> ===================================================================
> --- package/libgtk2/libgtk2.mk (revision 24010)
> +++ package/libgtk2/libgtk2.mk (working copy)
> @@ -68,7 +68,6 @@
>  ac_cv_path_GTK_UPDATE_ICON_CACHE=$(HOST_GLIB)/bin/gtk-update-icon-cache \
>  ac_cv_path_GDK_PIXBUF_CSOURCE=$(HOST_GLIB)/bin/gdk-pixbuf-csource \
>  ac_cv_prog_F77=no \
> - ac_cv_prog_CXX=no \
>  ac_cv_path_CUPS_CONFIG=no
>
> LIBGTK2_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
> Index: package/Makefile.in
> ===================================================================
> --- package/Makefile.in (revision 24010)
> +++ package/Makefile.in (working copy)
> @@ -182,6 +182,8 @@
> STRIPCMD=$(TARGET_STRIP)
> endif
> INSTALL=/usr/bin/install
> +FLEX:=$(shell $(CONFIG_SHELL) -c 'which flex || type -p flex')
> +BISON:=$(shell $(CONFIG_SHELL) -c 'which bison || type -p bison')
>
> HOST_ARCH:=$(shell $(HOSTCC) -dumpmachine | sed -e s'/-.*//' \
>  -e 's/sparc.*/sparc/' \
> @@ -197,6 +199,17 @@
>  )
> GNU_HOST_NAME:=$(HOST_ARCH)-$(subst ",,$(BR2_GNU_BUILD_SUFFIX))
> #")
> +
> +AUTO_CONFIGURE_TARGET=\
> + $(TARGET_CONFIGURE_OPTS) \
> + $(TARGET_CONFIGURE_ARGS) \
> + $(TARGET_CONFIGURE_ENV) \
> + $(if $(THIS_SRCDIR),$(THIS_SRCDIR)/,./)configure \
> + $(if 
> $(BR2_CONFIG_CACHE),--cache-file="$(PROJECT_BUILD_DIR)/tgt-config.cache",) 
> \
> + --target=$(GNU_TARGET_NAME) \
> + --host=$(GNU_TARGET_NAME) \
> + --build=$(GNU_HOST_NAME)
> +
> TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
>  AR="$(TARGET_AR)" \
>  AS="$(TARGET_AS)" \
> @@ -235,6 +248,12 @@
>  PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
>  STAGING_DIR="$(STAGING_DIR)"
>
> +TARGET_CONFIGURE_ENV=\
> + CFLAGS="$(TARGET_CFLAGS)" \
> + CXXFLAGS="$(TARGET_CXXFLAGS)" \
> + LDFLAGS="$(TARGET_LDFLAGS)" \
> + FCFLAGS="$(TARGET_FCFLAGS)" \
> +
> HOST_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
>  AR="$(HOSTAR)" \
>  AS="$(HOSTAS)" \
> @@ -316,6 +335,11 @@
>  $(BR2_AC_CV_TRAP_CHECK) \
>  ac_cv_func_mmap_fixed_mapped=yes \
>  ac_cv_func_memcmp_working=yes \
> + ac_cv_have_decl_malloc=yes \
> + gl_cv_func_malloc_0_nonnull=yes \
> + ac_cv_func_malloc_0_nonnull=yes \
> + ac_cv_func_calloc_0_nonnull=yes \
> + ac_cv_func_realloc_0_nonnull=yes \
>  $(BR2_AC_CV_C_BIGENDIAN)
>
> #######################################################################
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 
