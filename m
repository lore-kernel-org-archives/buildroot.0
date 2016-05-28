From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 May 2016 19:45:10 +0200
Subject: [Buildroot] [PATCH 1/1] core/pkg-kconfig: pass host
 PKG_CONFIG_PATH env var
In-Reply-To: <1464386608-13165-1-git-send-email-bjorn.forsman@gmail.com>
References: <1464386608-13165-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <20160528174510.GA3309@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bj?rn, All,

On 2016-05-28 00:03 +0200, Bj?rn Forsman spake thusly:
> This is basically the same change as in 0515fe45661b6d320f8d2071df2
> ("Makefile: pass host PKG_CONFIG_PATH at "make menuconfig" time"). That
> commit made sure to pass host PKG_CONFIG_PATH when invoking Buildroot's
> own menuconfig program. This change ensures that the same is true for
> third party menuconfig programs (i.e. Linux, uClibc and Busybox).
> 
> This unbreaks "make {linux,uclibc}-menuconfig" for host platforms which
> rely on PKG_CONFIG_PATH to find .pc files (e.g. NixOS). (When Busybox
> updates to a more recent Kconfig snapshot, one that uses pkg-config to
> find ncurses, "make busybox-menuconfig" will also start working.)
> 
> Tested on Ubuntu and NixOS:
> 
>   $ make qemu_arm_versatile_defconfig
>   $ make linux-menuconfig
>   $ make
> 
> Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/pkg-kconfig.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
> index 40d2f88..b0f5178 100644
> --- a/package/pkg-kconfig.mk
> +++ b/package/pkg-kconfig.mk
> @@ -143,7 +143,8 @@ endif
>  # nconfig, gconfig, xconfig).
>  # So we simply remove our PATH and PKG_CONFIG_* variables.
>  $(2)_CONFIGURATOR_MAKE_ENV = \
> -	$$(filter-out PATH=% PKG_CONFIG=% PKG_CONFIG_SYSROOT_DIR=% PKG_CONFIG_LIBDIR=%,$$($(2)_MAKE_ENV))
> +	$$(filter-out PATH=% PKG_CONFIG=% PKG_CONFIG_SYSROOT_DIR=% PKG_CONFIG_LIBDIR=%,$$($(2)_MAKE_ENV)) \
> +	PKG_CONFIG_PATH="$(HOST_PKG_CONFIG_PATH)"
>  
>  # Configuration editors (menuconfig, ...)
>  #
> -- 
> 2.8.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
