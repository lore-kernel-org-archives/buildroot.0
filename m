From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Mar 2020 16:42:20 +0100
Subject: [Buildroot] [PATCH v5 1/3] package/gobject-introspection: fix
 host-linking
In-Reply-To: <20200315031359.365637-1-aduskett@gmail.com>
References: <20200315031359.365637-1-aduskett@gmail.com>
Message-ID: <20200315154220.GG19677@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-03-14 20:13 -0700, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> When building, gobject-introspection uses tools/g-ir-scanner to build several
> .gir and .typelib files. g-ir-scanner does not use LDFLAGS, and by default,
> links to the system-installed libglib2 path. To remedy this issue, defining
> either LD_LIBRARY_PATH or LD_RUN_PATH forces g-ir-scanner to use the host
> installed libglib2 files. The decision to use LD_RUN_PATH instead of
> LD_LIBRARY_PATH is because this is a run time issue with g-ir-scanner and not
> a compile-time issue.
> 
> g-ir-scanner can use the argument --lib-dirs-envvar to pass a list of library
> directories in place of LD_LIBRARY_PATH, which the installed g-ir-scanner
> wrapper does. However, during the build process, this is not possible due to
> the build process calling g-ir-scanner directly.
> 
> This fix has the added benefit of allowing the host gobject-introspection to
> build the host .gir, .rnc, and .typelib files, which some packages may require.

So, this commit log is indeed better at exaplaining the problem and the
fix/workaround that is needed.

However, I still think it could be improved, so I respun a new iteration
of the series, with a few fixes of my own:
    https://patchwork.ozlabs.org/project/buildroot/list/?series=164476

Regards,
Yann E. MORIN.

> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
> Changes v1 -> v3:
>   - Update comment to be more clear.
> 
> Changes v3 -> v4:
>   - Update patch to work with gobject-introspection 2.64.0
> 
> Changes v4 -> v5:
>   - Changed LD_LIBRARY_PATH to LD_RUN_PATH after more testing.
>   - Updated the commit message and comments in the .mk file to better describe
>     what the problem was and why this is necessary.
> 
>  .../gobject-introspection/gobject-introspection.mk  | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
> index c18a1f17d3..19071ba1cb 100644
> --- a/package/gobject-introspection/gobject-introspection.mk
> +++ b/package/gobject-introspection/gobject-introspection.mk
> @@ -33,11 +33,14 @@ HOST_GOBJECT_INTROSPECTION_DEPENDENCIES = \
>  GOBJECT_INTROSPECTION_NINJA_ENV += \
>  	CC="$(TARGET_CC)"
>  
> -# Disable introspection data on the host, as it is not needed and
> -# the package will attempt to use the systems libglib2 which will fail
> -# if the systems libglib2 version is older than 2.60.
> -HOST_GOBJECT_INTROSPECTION_CONF_OPTS = \
> -	-Dbuild_introspection_data=false
> +# When building, gobject-introspection uses tools/g-ir-scanner to build several
> +# .gir and .typelib files. g-ir-scanner does not use LDFLAGS, and by default,
> +# links to the system-installed libglib2 path. To remedy this issue, defining
> +# either LD_LIBRARY_PATH or LD_RUN_PATH forces g-ir-scanner to use the host
> +# installed libglib2 files. Use LD_RUN_PATH instead of LD_LIBRARY_PATH because
> +# this is a run time issue with g-ir-scanner and not a compile-time issue.
> +HOST_GOBJECT_INTROSPECTION_NINJA_ENV += \
> +	LD_RUN_PATH="$(HOST_DIR)/lib"
>  
>  # Use the host gi-scanner to prevent the scanner from generating incorrect
>  # elf classes.
> -- 
> 2.24.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
