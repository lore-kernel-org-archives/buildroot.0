From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Mar 2020 18:36:05 +0100
Subject: [Buildroot] [PATCH v4,
 1/3] package/gobject-introspection: fix host-linking
In-Reply-To: <20200312194632.3787015-1-aduskett@gmail.com>
References: <20200312194632.3787015-1-aduskett@gmail.com>
Message-ID: <20200314173605.GQ705@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-03-12 12:46 -0700, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> When building, gobject-introspection uses g-ir-scanner to build several .gir
> files. g-ir-scanner does not use LDPATH, so LD_LIBRARY_PATH must be used in

What's LDPATH? Did you mean LDFLAGS? Or LD_RUN_PATH? Or soemthing else?

Still, this is not clear what the problem is, and why we need
LD_LIBRART_PATH. We already discussed this on IRC, and you said upstream
said to use it, but I am still not convinced, because this is really
ugly.

Also, this is not just g-ir-scanner that has the problem Is we were to
just export LD_LIBRARY_PATH in our wrapper, that would stil cause build
failures:

    1 #!/usr/bin/env bash
    2
    3 export GI_SCANNER_DISABLE_CACHE=1
    4 export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}${HOST_DIR}/lib"  # Not enough!
    5 ${HOST_DIR}/bin/g-ir-scanner \
    6 --lib-dirs-envvar=GIR_EXTRA_LIBS_PATH \
    7 --use-binary-wrapper=$(dirname $0)/g-ir-scanner-qemuwrapper \
    8 --use-ldd-wrapper=$(dirname $0)/g-ir-scanner-lddwrapper \
    9 --add-include-path=$(dirname $0)/../share/gir-1.0 "$@"

> order to ensure that g-ir-scanner does not use the host library path.

Did you mean:
    ... that g-ir-scanner does not use the system-install libglib2.

There is indeed a problem, but I still don't understand it, and even if
setting LD_LIBRARY_PATH does indeed solve the issue, I'm still not happy
about that... :-(

Yeah, we've already concluded that anything goi related would have to be
ugly by design... Still, I'm not happy... :-(

Maybe if the commit log were to at least point at the discussion with
upstream (on their issue tracker?), that could make the pill easier to
swallow... :-/

Regards,
Yann E. MORIN.

> This fix has the added benefit of allowing the host gobject-introspection to
> build the host .gir, .rnc, and .typelib files, which some packages may require.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
> Changes v1 -> v3:
>   - Update comment to be more clear.
> 
> Changes v3 -> v4:
>   - Update patch to work with gobject-introspection 2.64.0
> 
>  package/gobject-introspection/gobject-introspection.mk | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
> index c18a1f17d3..9043390857 100644
> --- a/package/gobject-introspection/gobject-introspection.mk
> +++ b/package/gobject-introspection/gobject-introspection.mk
> @@ -33,11 +33,11 @@ HOST_GOBJECT_INTROSPECTION_DEPENDENCIES = \
>  GOBJECT_INTROSPECTION_NINJA_ENV += \
>  	CC="$(TARGET_CC)"
>  
> -# Disable introspection data on the host, as it is not needed and
> -# the package will attempt to use the systems libglib2 which will fail
> -# if the systems libglib2 version is older than 2.60.
> -HOST_GOBJECT_INTROSPECTION_CONF_OPTS = \
> -	-Dbuild_introspection_data=false
> +# When building, gobject-introspection uses g-ir-scanner to build several .gir
> +# files. g-ir-scanner does not use LDPATH, so LD_LIBRARY_PATH must be used in
> +# order to ensure that g-ir-scanner does not use the host library path.
> +HOST_GOBJECT_INTROSPECTION_NINJA_ENV += \
> +	LD_LIBRARY_PATH="$(HOST_DIR)/lib"
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
