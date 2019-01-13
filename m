From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jan 2019 22:50:09 +0100
Subject: [Buildroot] [PATCH 3/3] linux: use HOSTCC_NOCCACHE as kconfig
 HOSTCC
In-Reply-To: <20190110211500.14368-4-thomas.petazzoni@bootlin.com>
References: <20190110211500.14368-1-thomas.petazzoni@bootlin.com>
 <20190110211500.14368-4-thomas.petazzoni@bootlin.com>
Message-ID: <20190113215009.GM2428@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-01-10 22:15 +0100, Thomas Petazzoni spake thusly:
> linux is a bit different than other kconfig-package, because it has
> "toolchain" in KCONFIG_DEPENDENCIES. Thanks to this, host-ccache *is*
> ready by the time kconfig invocations are made, so we could use
> $(HOSTCC) as the host compiler for kconfig related operations.
> 
> However, for consistency with other kconfig-package packages, we chose
> to use $(HOSTCC_NOCCACHE) as well.
> 
> We cannot rely on the default value of HOSTCC passed by the
> kconfig-package infrastructure, because $(LINUX_MAKE_FLAGS) also
> contains a HOSTCC definition that would override the one passed by the
> kconfig-package infrastructure.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  linux/linux.mk | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 6bf2b88038..02def89113 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -269,13 +269,16 @@ endif
>  LINUX_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES))
>  LINUX_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
>  
> -# LINUX_MAKE_FLAGS overrides HOSTCC to allow the kernel build to find our
> -# host-openssl and host-libelf. However, this triggers a bug in the kconfig
> -# build script that causes it to build with /usr/include/ncurses.h (which is
> -# typically wchar) but link with $(HOST_DIR)/lib/libncurses.so (which is not).
> -# We don't actually need any host-package for kconfig, so remove the HOSTCC
> -# override again.
> -LINUX_KCONFIG_OPTS = $(LINUX_MAKE_FLAGS) HOSTCC="$(HOSTCC)"
> +# LINUX_MAKE_FLAGS overrides HOSTCC to allow the kernel build to find
> +# our host-openssl and host-libelf. However, this triggers a bug in
> +# the kconfig build script that causes it to build with
> +# /usr/include/ncurses.h (which is typically wchar) but link with
> +# $(HOST_DIR)/lib/libncurses.so (which is not).  We don't actually
> +# need any host-package for kconfig, so remove the HOSTCC override
> +# again. In addition, even though linux depends on the toolchain and
> +# therefore host-ccache would be ready, we use HOSTCC_NOCCACHE for
> +# consistency with other kconfig packages.
> +LINUX_KCONFIG_OPTS = $(LINUX_MAKE_FLAGS) HOSTCC="$(HOSTCC_NOCCACHE)"
>  
>  # If no package has yet set it, set it from the Kconfig option
>  LINUX_NEEDS_MODULES ?= $(BR2_LINUX_NEEDS_MODULES)
> -- 
> 2.20.1
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
