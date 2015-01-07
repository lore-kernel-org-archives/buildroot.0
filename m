From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 7 Jan 2015 21:33:21 +0100
Subject: [Buildroot] [PATCH v3 1/2] Makefile: pass host PKG_CONFIG_PATH
 at "make menuconfig" time
In-Reply-To: <1420243128-7708-2-git-send-email-bjorn.forsman@gmail.com>
References: <1420243128-7708-1-git-send-email-bjorn.forsman@gmail.com>
 <1420243128-7708-2-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <20150107203321.GB4249@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bj?rn, All,

On 2015-01-03 00:58 +0100, Bj?rn Forsman spake thusly:
> Buildroot unexports PKG_CONFIG_PATH in the top-level Makefile for purity
> reasons. But it has an unfortunate side-effect in that "make menuconfig"
> will not (necessarily) be able to pick up ncurses via host pkg-config,
> breaking "make menuconfig" on systems where ncurses is installed in a
> non-standard location.
> 
> This patch saves the original PKG_CONFIG_PATH variable in
> HOST_PKG_CONFIG_PATH and restores the original PKG_CONFIG_PATH variable
> only in the sub-processes that builds the various menuconfig/nconfig/...
> targets.
> 
> (PKG_CONFIG_PATH has to be placed in front of the make command so that it
> propagates to sub-processes. If given as an argument, it doesn't work.)
> 
> Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  Makefile | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 5e0b4f2..0112853 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -264,6 +264,7 @@ export HOSTAR HOSTAS HOSTCC HOSTCXX HOSTFC HOSTLD
>  export HOSTCC_NOCCACHE HOSTCXX_NOCCACHE
>  
>  # Make sure pkg-config doesn't look outside the buildroot tree
> +HOST_PKG_CONFIG_PATH := $(PKG_CONFIG_PATH)
>  unexport PKG_CONFIG_PATH
>  unexport PKG_CONFIG_SYSROOT_DIR
>  unexport PKG_CONFIG_LIBDIR
> @@ -692,7 +693,8 @@ export HOSTCFLAGS
>  
>  $(BUILD_DIR)/buildroot-config/%onf:
>  	mkdir -p $(@D)/lxdialog
> -	$(MAKE) CC="$(HOSTCC_NOCCACHE)" HOSTCC="$(HOSTCC_NOCCACHE)" obj=$(@D) -C $(CONFIG) -f Makefile.br $(@F)
> +	PKG_CONFIG_PATH="$(HOST_PKG_CONFIG_PATH)" $(MAKE) CC="$(HOSTCC_NOCCACHE)" HOSTCC="$(HOSTCC_NOCCACHE)" \
> +	    obj=$(@D) -C $(CONFIG) -f Makefile.br $(@F)
>  
>  DEFCONFIG = $(call qstrip,$(BR2_DEFCONFIG))
>  
> -- 
> 2.1.3
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
