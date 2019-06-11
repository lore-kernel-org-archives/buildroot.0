From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 11 Jun 2019 16:57:25 -0400
Subject: [Buildroot] [PATCH 1/2] infra/pkg-meson: allow packages to
 expand their CFLAGS/CXXFLAGS/LDFLAGS
In-Reply-To: <4a99ac5f8c5f10cfc9bb20b33423aceca4773fa0.1560286529.git.yann.morin.1998@free.fr>
References: <cover.1560286529.git.yann.morin.1998@free.fr>
 <4a99ac5f8c5f10cfc9bb20b33423aceca4773fa0.1560286529.git.yann.morin.1998@free.fr>
Message-ID: <CAFSsvmrPg2FPoC6CzjNprcQmOXUhDdMLunOwrcSDnkySFMg3Kw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Acked-by: Adam Duskett <aduskett@gmail.com>

On Tue, Jun 11, 2019 at 4:55 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Some packages will want to pass extra CFLAGS, CXXFLAGS, or LDFLAGS.
> For example, they may want/have to pass $(TARGET_NLS_LIBS), like
> libglib2 when the toolchain is based on musl or uClibc (because meson
> does not have all the necessary infra internally to properly and reliably
> detect the presence of, or need for linking with, -lintl.
>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Adam Duskett <aduskett@gmail.com>
> Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/pkg-meson.mk | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> index 886fcf7205..8512a3559d 100644
> --- a/package/pkg-meson.mk
> +++ b/package/pkg-meson.mk
> @@ -49,6 +49,10 @@ $(2)_CONF_ENV                ?=
>  $(2)_CONF_OPTS         ?=
>  $(2)_NINJA_ENV         ?=
>
> +$(2)_CFLAGS ?= $$(TARGET_CFLAGS)
> +$(2)_LDFLAGS ?= $$(TARGET_LDFLAGS)
> +$(2)_CXXFLAGS ?= $$(TARGET_CXXFLAGS)
> +
>  #
>  # Configure step. Only define it if not already defined by the package
>  # .mk file. And take care of the differences between host and target
> @@ -67,9 +71,9 @@ define $(2)_CONFIGURE_CMDS
>             -e "s%@TARGET_ARCH@%$$(HOST_MESON_TARGET_CPU_FAMILY)%g" \
>             -e "s%@TARGET_CPU@%$$(GCC_TARGET_CPU)%g" \
>             -e "s%@TARGET_ENDIAN@%$$(call LOWERCASE,$$(BR2_ENDIAN))%g" \
> -           -e "s%@TARGET_CFLAGS@%$$(HOST_MESON_SED_CFLAGS)%g" \
> -           -e "s%@TARGET_LDFLAGS@%$$(HOST_MESON_SED_LDFLAGS)%g" \
> -           -e "s%@TARGET_CXXFLAGS@%$$(HOST_MESON_SED_CXXFLAGS)%g" \
> +           -e "s%@TARGET_CFLAGS@%$$(if $$($(2)_CFLAGS),`printf '"%s"$$(comma) ' $$($(2)_CFLAGS)`)%g" \
> +           -e "s%@TARGET_LDFLAGS@%$$(if $$($(2)_LDFLAGS),`printf '"%s"$$(comma) ' $$($(2)_LDFLAGS)`)%g" \
> +           -e "s%@TARGET_CXXFLAGS@%$$(if $$($(2)_CXXFLAGS),`printf '"%s"$$(comma) ' $$($(2)_CXXFLAGS)`)%g" \
>             -e "s%@HOST_DIR@%$$(HOST_DIR)%g" \
>             package/meson/cross-compilation.conf.in \
>             > $$($$(PKG)_SRCDIR)/build/cross-compilation.conf
> --
> 2.20.1
>
