From: =?utf-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
Date: Wed, 19 Dec 2012 17:28:12 +0100 (CET)
Subject: [Buildroot] [PATCH 1/4] libglib2: bumped version to 2.32.4
In-Reply-To: <1355936324-9585-1-git-send-email-bogdan@nimblex.org>
References: <1355936324-9585-1-git-send-email-bogdan@nimblex.org>
Message-ID: <1898585649.1424283.1355934492400.JavaMail.root@advansee.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bogdan, Sven,

On Wednesday, December 19, 2012 5:58:41 PM, bogdan at nimblex.org wrote:
> From: Sven Neumann <s.neumann@raumfeld.com>
> 
> Bump libglib2 to a newer stable version.
> 
> There are a few changes to the configure options necessary
> in order to make it compile cleanly and work correctly.
> The patch has been tested on ARM and i486. Some things
> might have to be adjusted for other platforms.
> 
> Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
[--snip--]
> diff --git a/package/libglib2/libglib2.mk
> b/package/libglib2/libglib2.mk
> index c3e510b..b476200 100644
> --- a/package/libglib2/libglib2.mk
> +++ b/package/libglib2/libglib2.mk
> @@ -3,8 +3,9 @@
>  # libglib2
>  #
>  #############################################################
> -LIBGLIB2_VERSION_MAJOR = 2.30
> -LIBGLIB2_VERSION_MINOR = 3
> +
> +LIBGLIB2_VERSION_MAJOR = 2.32
> +LIBGLIB2_VERSION_MINOR = 4
>  LIBGLIB2_VERSION =
>  $(LIBGLIB2_VERSION_MAJOR).$(LIBGLIB2_VERSION_MINOR)
>  LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
>  LIBGLIB2_SITE =
>  http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
> @@ -13,6 +14,7 @@ LIBGLIB2_INSTALL_STAGING = YES
>  LIBGLIB2_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR)
>  LDFLAGS=-L$(STAGING_DIR)/usr/lib install
>  
>  LIBGLIB2_CONF_ENV = \
> +		CPPFLAGS=-D__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 \
>  		ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
>  		glib_cv_uscore=no ac_cv_func_strtod=yes \
>  		ac_fsusage_space=yes fu_cv_sys_stat_statfs2_bsize=yes \
> @@ -40,8 +42,10 @@ LIBGLIB2_CONF_ENV = \
>  		ac_cv_func_working_mktime=yes
>  		jm_cv_func_working_re_compile_pattern=yes \
>  		ac_use_included_regex=no gl_cv_c_restrict=no \
>  		ac_cv_path_GLIB_GENMARSHAL=$(HOST_DIR)/usr/bin/glib-genmarshal
>  		ac_cv_prog_F77=no \
> -		ac_cv_func_posix_getgrgid_r=no glib_cv_long_long_format=ll \
> -		ac_cv_func_printf_unix98=yes ac_cv_func_vsnprintf_c99=yes \

Can you explain in detail why you removed these? Did you test that gst-inspect
still works fine after that?

> +		ac_cv_func_posix_getgrgid_r=no \
> +		ac_cv_alignof_guint32=4 ac_cv_alignof_guint64=8
> ac_cv_alignof_unsigned_long=4 \
> +		ac_cv_func_newlocale=no ac_cv_func_uselocale=no \
> +		ac_cv_func_strtod_l=no ac_cv_func_strtoll_l=no
> ac_cv_func_strtoull_l=no \
>  		gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no)
>  
>  # old uClibc versions don't provide qsort_r
> @@ -54,9 +58,6 @@ endif
>  HOST_LIBGLIB2_CONF_OPT = \
>  		--disable-gtk-doc \
>  		--enable-debug=no \
> -		--disable-dtrace \
> -		--disable-systemtap \
> -		--disable-gcov

Why? According to the help message, these options seem to be disabled by
default, but looking at the configure script, they rather seem to be auto if
unset.

Best regards,
Beno?t
