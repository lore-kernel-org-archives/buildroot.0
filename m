From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 31 Dec 2017 16:04:00 -0500
Subject: [Buildroot] [PATCHv2] package/meson: fix malformed
 cross-compilation.conf.in
In-Reply-To: <20171230095635.18123-1-yann.morin.1998@free.fr>
References: <20171230095635.18123-1-yann.morin.1998@free.fr>
Message-ID: <CAFSsvmr21N+7tTGDY-qXQ7zhD1C2-QKBOKxPWuZdB-6QPHSeZg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All;

On Sat, Dec 30, 2017 at 4:56 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Currently, meson will set the c_link_args and the cpp_link_args to the
> value of TARGET_LDFLAGS, even when it's not defined.
>
> This creates a malformed array ["",] which will break any package
> building using meson/ninja.
>
> We fix that by using an empty replacement when the corresponding values
> are empty.
>
> Reported-by: Adam Duskett <Adamduskett@outlook.com>
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> [yann.morin.1998 at free.fr: alternate implementation, suggested by Thomas]
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/meson/meson.mk | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/package/meson/meson.mk b/package/meson/meson.mk
> index 55ce84da07..d55c3c7c00 100644
> --- a/package/meson/meson.mk
> +++ b/package/meson/meson.mk
> @@ -16,15 +16,19 @@ HOST_MESON_NEEDS_HOST_PYTHON = python3
>  HOST_MESON_TARGET_ENDIAN = $(call LOWERCASE,$(BR2_ENDIAN))
>  HOST_MESON_TARGET_CPU = $(call qstrip,$(BR2_GCC_TARGET_CPU))
>
> +HOST_MESON_SED_CFLAGS = $(if $(TARGET_CFLAGS),`printf '"%s"$(comma) ' $(TARGET_CFLAGS)`)
> +HOST_MESON_SED_LDFLAGS = $(if $(TARGET_LDFLAGS),`printf '"%s"$(comma) ' $(TARGET_LDFLAGS)`)
> +HOST_MESON_SED_CXXFLAGS = $(if $(TARGET_CXXFLAGS),`printf '"%s"$(comma) ' $(TARGET_CXXFLAGS)`)
> +
>  define HOST_MESON_INSTALL_CROSS_CONF
>         mkdir -p $(HOST_DIR)/etc/meson
>         sed -e "s%@TARGET_CROSS@%$(TARGET_CROSS)%g" \
>             -e "s%@TARGET_ARCH@%$(ARCH)%g" \
>             -e "s%@TARGET_CPU@%$(HOST_MESON_TARGET_CPU)%g" \
>             -e "s%@TARGET_ENDIAN@%$(HOST_MESON_TARGET_ENDIAN)%g" \
> -           -e "s%@TARGET_CFLAGS@%`printf '"%s", ' $(TARGET_CFLAGS)`%g" \
> -           -e "s%@TARGET_LDFLAGS@%`printf '"%s", ' $(TARGET_LDFLAGS)`%g" \
> -           -e "s%@TARGET_CXXFLAGS@%`printf '"%s", ' $(TARGET_CXXFLAGS)`%g" \
> +           -e "s%@TARGET_CFLAGS@%$(HOST_MESON_SED_CFLAGS)%g" \
> +           -e "s%@TARGET_LDFLAGS@%$(HOST_MESON_SED_LDFLAGS)%g" \
> +           -e "s%@TARGET_CXXFLAGS@%$(HOST_MESON_SED_CXXFLAGS)%g" \
>             -e "s%@HOST_DIR@%$(HOST_DIR)%g" \
>             $(HOST_MESON_PKGDIR)/cross-compilation.conf.in \
>             > $(HOST_DIR)/etc/meson/cross-compilation.conf
> --
> 2.11.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
Tested and works well. This needs to be pushed before I can send a
systemd patch.
