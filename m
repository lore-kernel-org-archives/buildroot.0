From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 25 Jun 2019 22:28:06 +0200
Subject: [Buildroot] [PATCH 2/4] infra/pkg-meson: allow packages to pass
 custom compiler/linker flags
In-Reply-To: <48a9daf25e9ca7335b0a09b8cd7f67974ad7c572.1561407936.git.yann.morin.1998@free.fr>
References: <cover.1561407936.git.yann.morin.1998@free.fr>
 <48a9daf25e9ca7335b0a09b8cd7f67974ad7c572.1561407936.git.yann.morin.1998@free.fr>
Message-ID: <20190625222806.37c0ee4c@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Mon, 24 Jun 2019 22:25:48 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> From: Peter Seiderer <ps.report@gmx.net>
>
> Meson does not allow to pass CFLAGS/LDFLAGS/CXXFLAGS via the environment
> or via command-line arguments or options (instead, those flags from the
> environment are passed to the host compiler, which is seldom what we
> need). The only way to pas those flags is via the cross-compilation.conf
> file.
>
> Add LIBFOO_CFLAGS, LIBFOO_LDFLAGS and LIBFOO_CXXFLAGS variables to allow
> packages to provide their own flags, possibly overriding the generic
> ones entirely, as we allow for other infras. Those per-package flags will
> then be used to generate the per-package cross-compilation.conf.
>
> This means that the meson infra is the first and only infra for which
> FOO_CFLAGS, FOO_LDFLAGS, and FOO_CXXFLAGS are meaningful, while for the
> other infras, they are just variables private to the package itself.
> Instead of naming those variables after the meson infra (e.g.cc55205e417ab6616bb14a21bf403f901f742c0d
> FOO_MESON_CFLAGS), we name them with a generic name, as maybe, just
> maybe, we could also change the other infras to also recognise those
> variables.
>
> To mimic this feature for packages that are built from the SDK, we also
> install a templatised version of cross-compilation.conf, with three new
> placeholders for custom flags. If a user wants to build a package that
> needs custom flags, they can use that template to generate a per-package
> cross-compilation.conf.
>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Adam Duskett <aduskett@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>
> ---
> Changes v2 -> v3:
>   - simplify the default clauses in the manual  (Thomas)
>   - expand commit log with the first paragraph  (Thomas)
>   - fix missing double-dollars in some places, bug introduced when
>     adopted by Yann.
>
> Changes v1 -> v2 (adopted by Yann):
>   - rename the variables
>   - don't add new placeholders in the bundled template; instead, insertcc55205e417ab6616bb14a21bf403f901f742c0d
>     those placeholders when generating the partially-templatised
>     template (irk!).
>   - update the doc
> ---
>  docs/manual/adding-packages-meson.txt | 12 ++++++++++++
>  package/meson/meson.mk                | 14 ++++++++++----
>  package/pkg-meson.mk                  | 14 +++++++++++---
>  3 files changed, 33 insertions(+), 7 deletions(-)
>
> diff --git a/docs/manual/adding-packages-meson.txt b/docs/manual/adding-packages-meson.txt
> index 30c338f486..8e2d448788 100644
> --- a/docs/manual/adding-packages-meson.txt
> +++ b/docs/manual/adding-packages-meson.txt
> @@ -97,6 +97,18 @@ will therefore only use a few of them.
>  * +FOO_CONF_OPTS+, to specify additional options to pass to +meson+ for the
>    configuration step. By default, empty.
>
> +* +FOO_CFLAGS+, to specify compiler arguments added to the package specific
> +  +cross-compile.conf+ file +c_args+ property. By default, the value of
> +  +TARGET_CFLAGS+.
> +
> +* +FOO_CXXFLAGS+, to specify compiler arguments added to the package specific
> +  +cross-compile.conf+ file +cpp_args+ property. By default, the value of
> +  +TARGET_CXXFLAGS+.cc55205e417ab6616bb14a21bf403f901f742c0d
> +
> +* +FOO_LDFLAGS+, to specify compiler arguments added to the package specific
> +  +cross-compile.conf+ file +c_link_args+ and +cpp_link_args+ properties. By
> +  default, the value of +TARGET_LDFLAGS+.
> +
>  * +FOO_NINJA_ENV+, to specify additional environment variables to pass to
>    +ninja+, meson companion tool in charge of the build operations. By default,
>    empty.
> diff --git a/package/meson/meson.mk b/package/meson/meson.mk
> index 511be05a46..dffa301191 100644
> --- a/package/meson/meson.mk
> +++ b/package/meson/meson.mk
> @@ -50,18 +50,24 @@ HOST_MESON_SED_LDFLAGS = $(if $(strip $(TARGET_LDFLAGS)),`printf '"%s"$(comma) '
>  HOST_MESON_SED_CXXFLAGS = $(if $(strip $(TARGET_CXXFLAGS)),`printf '"%s"$(comma) ' $(TARGET_CXXFLAGS)`)
>
>  # Generate a Meson cross-compilation.conf suitable for use with the
> -# SDK
> +# SDK; also install the file as a template for users to add their
> +# own flags if they need to.
>  define HOST_MESON_INSTALL_CROSS_CONF
>  	mkdir -p $(HOST_DIR)/etc/meson
>  	sed -e "s%@TARGET_CROSS@%$(TARGET_CROSS)%g" \
>  	    -e "s%@TARGET_ARCH@%$(HOST_MESON_TARGET_CPU_FAMILY)%g" \
>  	    -e "s%@TARGET_CPU@%$(HOST_MESON_TARGET_CPU)%g" \
>  	    -e "s%@TARGET_ENDIAN@%$(HOST_MESON_TARGET_ENDIAN)%g" \
> -	    -e "s%@TARGET_CFLAGS@%$(HOST_MESON_SED_CFLAGS)%g" \
> -	    -e "s%@TARGET_LDFLAGS@%$(HOST_MESON_SED_LDFLAGS)%g" \
> -	    -e "s%@TARGET_CXXFLAGS@%$(HOST_MESON_SED_CXXFLAGS)%g" \
> +	    -e "s%@TARGET_CFLAGS@%$(HOST_MESON_SED_CFLAGS)@PKG_TARGET_CFLAGS@%g" \
> +	    -e "s%@TARGET_LDFLAGS@%$(HOST_MESON_SED_LDFLAGS)@PKG_TARGET_CFLAGS@%g" \
> +	    -e "s%@TARGET_CXXFLAGS@%$(HOST_MESON_SED_CXXFLAGS)@PKG_TARGET_CFLAGS@%g" \
>  	    -e "s%@HOST_DIR@%$(HOST_DIR)%g" \
>  	    $(HOST_MESON_PKGDIR)/cross-compilation.conf.in \
> +	    > $(HOST_DIR)/etc/meson/cross-compilation.conf.in
> +	sed -e "s%@PKG_TARGET_CFLAGS@%%g" \
> +	    -e "s%@PKG_TARGET_LDFLAGS@%%g" \
> +	    -e "s%@PKG_TARGET_CXXFLAGS@%%g" \
> +	    $(HOST_DIR)/etc/meson/cross-compilation.conf.in \
>  	    > $(HOST_DIR)/etc/meson/cross-compilation.conf
>  endef
>
> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> index 886fcf7205..0b811d1cc0 100644
> --- a/package/pkg-meson.mk
> +++ b/package/pkg-meson.mk
> @@ -57,6 +57,14 @@ $(2)_NINJA_ENV		?=
>  ifndef $(2)_CONFIGURE_CMDS
>  ifeq ($(4),target)
>
> +$(2)_CFLAGS ?= $$(TARGET_CFLAGS)
> +$(2)_LDFLAGS ?= $$(TARGET_LDFLAGS)
> +$(2)_CXXFLAGS ?= $$(TARGET_CXXFLAGS)
> +
> +$(2)_MESON_SED_CFLAGS = $$(if $$(strip $$($(2)_CFLAGS)),`printf '"%s"$$(comma) ' $$($(2)_CFLAGS)`)
> +$(2)_MESON_SED_LDFLAGS = $$(if $$(strip $$($(2)_LDFLAGS)),`printf '"%s"$$(comma) ' $$($(2)_LDFLAGS)`)
> +$(2)_MESON_SED_CXXFLAGS = $$(if $$(strip $$($(2)_CXXFLAGS)),`printf '"%s"$$(comma) ' $$($(2)_CXXFLAGS)`)
> +
>  # Configure package for target
>  #
>  #
> @@ -67,9 +75,9 @@ define $(2)_CONFIGURE_CMDS
>  	    -e "s%@TARGET_ARCH@%$$(HOST_MESON_TARGET_CPU_FAMILY)%g" \
>  	    -e "s%@TARGET_CPU@%$$(GCC_TARGET_CPU)%g" \
>  	    -e "s%@TARGET_ENDIAN@%$$(call LOWERCASE,$$(BR2_ENDIAN))%g" \
> -	    -e "s%@TARGET_CFLAGS@%$$(HOST_MESON_SED_CFLAGS)%g" \
> -	    -e "s%@TARGET_LDFLAGS@%$$(HOST_MESON_SED_LDFLAGS)%g" \
> -	    -e "s%@TARGET_CXXFLAGS@%$$(HOST_MESON_SED_CXXFLAGS)%g" \
> +	    -e "s%@TARGET_CFLAGS@%$$($(2)_MESON_SED_CFLAGS)%g" \
> +	    -e "s%@TARGET_LDFLAGS@%$$($(2)_MESON_SED_LDFLAGS)%g" \
> +	    -e "s%@TARGET_CXXFLAGS@%$$($(2)_MESON_SED_CXXFLAGS)%g" \
>  	    -e "s%@HOST_DIR@%$$(HOST_DIR)%g" \
>  	    package/meson/cross-compilation.conf.in \
>  	    > $$($$(PKG)_SRCDIR)/build/cross-compilation.conf

Tested with the updated version of '[PATCH v7] libdrm: change to meson build system' ([1]), you can add my

Tested-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter
