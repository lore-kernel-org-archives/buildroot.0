From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 10 Mar 2020 15:07:26 +0100
Subject: [Buildroot] [PATCH 1/2] package/pkg-meson.mk: add
 FOO_MESON_EXTRA_PROPERTIES
In-Reply-To: <20200310124459.908611-2-john@metanate.com>
References: <20200310124459.908611-1-john@metanate.com>
 <20200310124459.908611-2-john@metanate.com>
Message-ID: <20200310150726.6ace1450@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello John,

On Tue, 10 Mar 2020 12:44:58 +0000, John Keeping <john@metanate.com> wrote:

> With autoconf packages, we often specify ac_cv_func_... cached values to
> avoid runtime checks during configure.  With meson the equivalent is
> setting properties in cross-compilation.conf which we cannot do in
> Buildroot at the moment.
>
> For example, libglib2 used to set ac_cv_func_printf_unix98 and
> ac_cv_func_vsnprintf_c99 so that the system printf could be used, but
> with the conversion to meson these checks fail and the gnulib fallback
> is used.
>
> Add infrastructure in the same way as FOO_MESON_EXTRA_BINARIES to allow
> per-package modification to the cross-compilation properties.
>
> Signed-off-by: John Keeping <john@metanate.com>
> ---
>  docs/manual/adding-packages-meson.txt | 8 ++++++++
>  package/pkg-meson.mk                  | 4 ++++
>  2 files changed, 12 insertions(+)
>
> diff --git a/docs/manual/adding-packages-meson.txt b/docs/manual/adding-packages-meson.txt
> index e84bf7f60a..c28828243c 100644
> --- a/docs/manual/adding-packages-meson.txt
> +++ b/docs/manual/adding-packages-meson.txt
> @@ -116,6 +116,14 @@ will therefore only use a few of them.
>    single quotes. By default, empty. Note that Buildroot already sets the
>    correct values for +c+, +cpp+, +ar+, +strip+, and +pkgconfig+.
>
> +* +FOO_MESON_EXTRA_PROPERTIES+, to specify a space-separated list of
> +  properties to add to the `[properties]` section of the meson
> +  `cross-compilation.conf` configuration file. The format is
> +  `property-name='value'`, with no space around the +=+ sign, and with the
> +  value between single quotes. By default, empty. Note that Buildroot
> +  already sets values for +needs_exe_wrapper+, +c_args+, +c_link_args+,
> +  +cpp_args+, +cpp_link_args+, +sys_root+, and +pkg_config_libdir+.
> +

The description does not fit the usage in the follow-up patch
(...value between single quoates...):

+LIBGLIB2_MESON_EXTRA_PROPERTIES = \
+	have_c99_vsnprintf=true \
+	have_c99_snprintf=true \
+	have_unix98_printf=true
+

With this fixed you can add my

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter

>  * +FOO_NINJA_ENV+, to specify additional environment variables to pass to
>    +ninja+, meson companion tool in charge of the build operations. By default,
>    empty.
> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> index 6ac3f79fe9..4df1326cad 100644
> --- a/package/pkg-meson.mk
> +++ b/package/pkg-meson.mk
> @@ -80,6 +80,10 @@ define $(2)_CONFIGURE_CMDS
>  		$$(foreach x,$$($(2)_MESON_EXTRA_BINARIES), \
>  	            s:$$$$:\n$$(x): ; \
>  		) }" \
> +	    -e "/^\[properties\]$$$$/ { \
> +		$$(foreach x,$$($(2)_MESON_EXTRA_PROPERTIES), \
> +		    s:$$$$:\n$$(x): ; \
> +		) }" \
>  	    package/meson/cross-compilation.conf.in \
>  	    > $$($$(PKG)_SRCDIR)/build/cross-compilation.conf
>  	PATH=$$(BR_PATH) $$($$(PKG)_CONF_ENV) $$(MESON) \
