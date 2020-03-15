From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 15 Mar 2020 09:35:30 -0700
Subject: [Buildroot] [PATCH 1/3 v6] package/gobject-introspection: fix
 host-linking
In-Reply-To: <ccda32dbb7d04471b987c0b8bed21a2b2c7544ed.1584286382.git.yann.morin.1998@free.fr>
References: <cover.1584286382.git.yann.morin.1998@free.fr>
 <ccda32dbb7d04471b987c0b8bed21a2b2c7544ed.1584286382.git.yann.morin.1998@free.fr>
Message-ID: <CAFSsvmq8XaxyVf70MKyRJ_pj_qJECcGvK-cGDuNb22vogc=pNQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All:

Tested-by: Adam Duskett <aduskett@gmail.com>

On Sun, Mar 15, 2020 at 8:33 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> From: Adam Duskett <Aduskett@gmail.com>
>
> When building, gobject-introspection uses tools/g-ir-scanner to build
> several .gir and .typelib files. To that goal, it internally builds and
> runs a few small executables linked to libglib2. However, it does not
> pass them any LDFLAGS that we could pass the buildsystem. So, it either
> ends up trying to link with the system's libglib2, which may not be
> instaleld (build breaks), or is installed to an other version (build may
> break); in either cases, this is not good...
>
> g-ir-scanner can use the argument --lib-dirs-envvar to pass a list of
> library directories to search for. However, during the build process,
> this is not possible due to the build process calling g-ir-scanner
> directly without letting the user (us) pass any option.
>
> When discussing with upstream, they explained that the only solution in
> that case was to set and export LD_LIBRARY_PATH to point to the location
> where the correct libglib2 was installed.
>
> Ergo, that's what we do.
>
> This fix has the added benefit of allowing the host gobject-introspection
> to build the host .gir, .rnc, and .typelib files, which some packages
> may require.
>
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
>
> ---
> Changes v1 -> v3:
>   - Update comment to be more clear.
>
> Changes v3 -> v4:
>   - Update patch to work with gobject-introspection 2.64.0
>
> Changes v4 -> v5:
>   - Changed LD_LIBRARY_PATH to LD_RUN_PATH after more testing.
>   - Updated the commit message and comments in the .mk file to better
> describe
>     what the problem was and why this is necessary.
>
> Changes v5 -> v6  (Yann):
>   - switch back to LD_LIBRARY_PATH
>   - append to an already set LD_LIBRARY_PATH
>   - tweak the comment
>   - reorganise and reword the commit log
> ---
>  .../gobject-introspection/gobject-introspection.mk    | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
> index c18a1f17d3..35b6669469 100644
> --- a/package/gobject-introspection/gobject-introspection.mk
> +++ b/package/gobject-introspection/gobject-introspection.mk
> @@ -33,11 +33,12 @@ HOST_GOBJECT_INTROSPECTION_DEPENDENCIES = \
>  GOBJECT_INTROSPECTION_NINJA_ENV += \
>         CC="$(TARGET_CC)"
>
> -# Disable introspection data on the host, as it is not needed and
> -# the package will attempt to use the systems libglib2 which will fail
> -# if the systems libglib2 version is older than 2.60.
> -HOST_GOBJECT_INTROSPECTION_CONF_OPTS = \
> -       -Dbuild_introspection_data=false
> +# When building, gobject-introspection uses tools/g-ir-scanner to build several
> +# .gir and .typelib files. g-ir-scanner does not use LDFLAGS, and by default,
> +# links to the system-installed libglib2 path. To remedy this issue, defining
> +# LD_LIBRARY_PATH forces g-ir-scanner to use our host installed libglib2 files.
> +HOST_GOBJECT_INTROSPECTION_NINJA_ENV += \
> +       LD_LIBRARY_PATH="$(if $(LD_LIBRARY_PATH),$(LD_LIBRARY_PATH):)$(HOST_DIR)/lib"
>
>  # Use the host gi-scanner to prevent the scanner from generating incorrect
>  # elf classes.
> --
> 2.20.1
>
