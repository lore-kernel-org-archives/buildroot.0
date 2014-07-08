From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 8 Jul 2014 19:34:57 +0200
Subject: [Buildroot] [RFC 6/9] libgtk3: new package
In-Reply-To: <1404827832-1101-7-git-send-email-hadrien.boutteville@gmail.com>
References: <1404827832-1101-1-git-send-email-hadrien.boutteville@gmail.com>
 <1404827832-1101-7-git-send-email-hadrien.boutteville@gmail.com>
Message-ID: <20140708173455.GB25364@rmm-p1267483>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!
On Tue, Jul 08, 2014 at 03:57:09PM +0200, Hadrien Boutteville wrote:
> Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/Config.in                                  |   1 +
>  package/libgtk3/Config.in                          |  47 ++++++
>  package/libgtk3/libgtk3-0001-no-gtk-doc.patch      |  11 ++
>  .../libgtk3-0002-add-file-introspection-m4.patch   | 100 +++++++++++
>  package/libgtk3/libgtk3.mk                         | 184 +++++++++++++++++++++
>  5 files changed, 343 insertions(+)
>  create mode 100644 package/libgtk3/Config.in
>  create mode 100644 package/libgtk3/libgtk3-0001-no-gtk-doc.patch
>  create mode 100644 package/libgtk3/libgtk3-0002-add-file-introspection-m4.patch
>  create mode 100644 package/libgtk3/libgtk3.mk
>
[snip]
> diff --git a/package/libgtk3/libgtk3-0002-add-file-introspection-m4.patch b/package/libgtk3/libgtk3-0002-add-file-introspection-m4.patch
> new file mode 100644
> index 0000000..3cd0569
> --- /dev/null
I guess the addition of this file is needed because you have to perform an
autoreconf, but GOBJECT_INTROSPECTION_CHECK could not be resolved, right?

Maybe you can avoid it by patching configure.ac, to add a check, as performed
in Systemd:

  m4_ifdef([GOBJECT_INTROSPECTION_CHECK],
           [GOBJECT_INTROSPECTION_CHECK([1.31.1])],
           [AM_CONDITIONAL([HAVE_INTROSPECTION], [false])
            enable_introspection=no])

> diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
> new file mode 100644
> index 0000000..0b61e25
> --- /dev/null
> +++ b/package/libgtk3/libgtk3.mk
> @@ -0,0 +1,184 @@
> +################################################################################
> +#
> +# libgtk3
> +#
> +################################################################################
> +
> +LIBGTK3_VERSION_MAJOR = 3.12
> +LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).2
> +
> +LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
> +LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
> +LIBGTK3_LICENSE = LGPLv2+
> +LIBGTK3_LICENSE_FILES = COPYING
> +LIBGTK3_INSTALL_STAGING = YES
> +LIBGTK3_INSTALL_TARGET = YES
> +
> +LIBGTK3_AUTORECONF = YES
> +
> +LIBGTK3_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
> +		glib_cv_uscore=no \
> +		ac_cv_func_strtod=yes \
> +		ac_fsusage_space=yes \
> +		fu_cv_sys_stat_statfs2_bsize=yes \
> +		ac_cv_func_closedir_void=no \
> +		ac_cv_func_getloadavg=no \
> +		ac_cv_lib_util_getloadavg=no \
> +		ac_cv_lib_getloadavg_getloadavg=no \
> +		ac_cv_func_getgroups=yes \
> +		ac_cv_func_getgroups_works=yes \
> +		ac_cv_func_chown_works=yes \
> +		ac_cv_have_decl_euidaccess=no \
> +		ac_cv_func_euidaccess=no \
> +		ac_cv_have_decl_strnlen=yes \
> +		ac_cv_func_strnlen_working=yes \
> +		ac_cv_func_lstat_dereferences_slashed_symlink=yes \
> +		ac_cv_func_lstat_empty_string_bug=no \
> +		ac_cv_func_stat_empty_string_bug=no \
> +		vb_cv_func_rename_trailing_slash_bug=no \
> +		ac_cv_have_decl_nanosleep=yes \
> +		jm_cv_func_nanosleep_works=yes \
> +		gl_cv_func_working_utimes=yes \
> +		ac_cv_func_utime_null=yes \
> +		ac_cv_have_decl_strerror_r=yes \
> +		ac_cv_func_strerror_r_char_p=no \
> +		jm_cv_func_svid_putenv=yes \
> +		ac_cv_func_getcwd_null=yes \
> +		ac_cv_func_getdelim=yes \
> +		ac_cv_func_mkstemp=yes \
> +		utils_cv_func_mkstemp_limitations=no \
> +		utils_cv_func_mkdir_trailing_slash_bug=no \
> +		jm_cv_func_gettimeofday_clobber=no \
> +		gl_cv_func_working_readdir=yes \
> +		jm_ac_cv_func_link_follows_symlink=no \
> +		utils_cv_localtime_cache=no \
> +		ac_cv_struct_st_mtim_nsec=no \
> +		gl_cv_func_tzset_clobber=no \
> +		gl_cv_func_getcwd_null=yes \
> +		gl_cv_func_getcwd_path_max=yes \
> +		ac_cv_func_fnmatch_gnu=yes \
> +		am_getline_needs_run_time_check=no \
> +		am_cv_func_working_getline=yes \
> +		gl_cv_func_mkdir_trailing_slash_bug=no \
> +		gl_cv_func_mkstemp_limitations=no \
> +		ac_cv_func_working_mktime=yes \
> +		jm_cv_func_working_re_compile_pattern=yes \
> +		ac_use_included_regex=no gl_cv_c_restrict=no \
> +		ac_cv_path_GTK_UPDATE_ICON_CACHE=$(HOST_DIR)/usr/bin/gtk-update-icon-cache \
> +		ac_cv_path_GDK_PIXBUF_CSOURCE=$(HOST_DIR)/usr/bin/gdk-pixbuf-csource \
> +		ac_cv_prog_F77=no \
> +		ac_cv_path_CUPS_CONFIG=no

I still wonder why all these definitions are needed... I manage to build
libgtk3 using a uclibc-based toolchain without them (except for
ac_cv_path_GTK_UPDATE_ICON_CACHE and ac_cv_path_GDK_PIXBUF_CSOURCE of course)!

Anyone with some background history on this?

> +
> +LIBGTK3_CONF_OPT = --disable-glibtest \
> +		--enable-explicit-deps=no \
> +		--enable-gtk2-dependency \
> +		--disable-debug
> +
> +LIBGTK3_DEPENDENCIES = host-pkgconf host-libgtk3 libglib2 cairo pango atk \
> +		gdk-pixbuf
[snip]
> +
> +# We do not build a full version of libgtk3 for the host, because that
> +# requires compiling Cairo, Pango, ATK and X.org for the
> +# host. Therefore, we patch it to remove dependencies, and we hack the
> +# build to only build gdk-pixbuf-from-source and
> +# gtk-update-icon-cache, which are the host tools needed to build Gtk
> +# for the target.
> +
> +HOST_LIBGTK3_DEPENDENCIES = host-libglib2 host-libpng host-gdk-pixbuf
> +
> +HOST_LIBGTK3_CFLAGS = $(shell $(HOST_DIR)/usr/bin/pkg-config \
> +	--cflags --libs gdk-pixbuf-2.0)

When experimenting on my side, I've noticed that gtk+ >= 3.10 can build a
native version of gtk-update-icon-cache if --enable-gtk2-dependency=no is set
when invoking './configure'.

Unfortunately, if the target toolchain is based on uClibc, the macro
AM_GLIB_GNU_GETTEXT will detect the libintl built for the target and will add
'-lintl' to the default list of libraries for the linker (used for both native
and target builds).

But no native version of libintl is available (the functions are provided by
glibc): gtk-update-icon-cache will not build...

So, Buildroot must still build its own version, as done in your patch.

Best regards,
ELB
