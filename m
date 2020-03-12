From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 12 Mar 2020 13:38:04 -0700
Subject: [Buildroot] [PATCH v2 1/2] package/pkg-meson.mk: add
 FOO_MESON_EXTRA_PROPERTIES
In-Reply-To: <20200311112256.2849174-1-john@metanate.com>
References: <20200311112256.2849174-1-john@metanate.com>
Message-ID: <CAFSsvmpFPk6RfEopHLfvKQw+FpEbKfPVOGJpWyGFzFrR9XnYCQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All;

reviewed-by: Adam Duskett <aduskett@gmail.com>

On Wed, Mar 11, 2020 at 4:23 AM John Keeping <john@metanate.com> wrote:
>
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
> Reviewed-by: Peter Seiderer <ps.report@gmx.net>
> ---
> v2:
> - Reword documentation on the format of _MESON_EXTRA_PROPERTIES entries
> - Add Peter's reviewed-by - thanks!
> ---
>  docs/manual/adding-packages-meson.txt | 9 +++++++++
>  package/pkg-meson.mk                  | 4 ++++
>  2 files changed, 13 insertions(+)
>
> diff --git a/docs/manual/adding-packages-meson.txt b/docs/manual/adding-packages-meson.txt
> index e84bf7f60a..029c8c2488 100644
> --- a/docs/manual/adding-packages-meson.txt
> +++ b/docs/manual/adding-packages-meson.txt
> @@ -116,6 +116,15 @@ will therefore only use a few of them.
>    single quotes. By default, empty. Note that Buildroot already sets the
>    correct values for +c+, +cpp+, +ar+, +strip+, and +pkgconfig+.
>
> +* +FOO_MESON_EXTRA_PROPERTIES+, to specify a space-separated list of
> +  properties to add to the `[properties]` section of the meson
> +  `cross-compilation.conf` configuration file. The format is
> +  `property-name=<value>` with no space around the +=+ sign, and with
> +  single quotes around string values. By default, empty. Note that
> +  Buildroot already sets values for +needs_exe_wrapper+, +c_args+,
> +  +c_link_args+, +cpp_args+, +cpp_link_args+, +sys_root+, and
> +  +pkg_config_libdir+.
> +
>  * +FOO_NINJA_ENV+, to specify additional environment variables to pass to
>    +ninja+, meson companion tool in charge of the build operations. By default,
>    empty.
> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> index 6ac3f79fe9..4df1326cad 100644
> --- a/package/pkg-meson.mk
> +++ b/package/pkg-meson.mk
> @@ -80,6 +80,10 @@ define $(2)_CONFIGURE_CMDS
>                 $$(foreach x,$$($(2)_MESON_EXTRA_BINARIES), \
>                     s:$$$$:\n$$(x): ; \
>                 ) }" \
> +           -e "/^\[properties\]$$$$/ { \
> +               $$(foreach x,$$($(2)_MESON_EXTRA_PROPERTIES), \
> +                   s:$$$$:\n$$(x): ; \
> +               ) }" \
>             package/meson/cross-compilation.conf.in \
>             > $$($$(PKG)_SRCDIR)/build/cross-compilation.conf
>         PATH=$$(BR_PATH) $$($$(PKG)_CONF_ENV) $$(MESON) \
> --
> 2.25.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
