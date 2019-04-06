From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Apr 2019 22:31:17 +0200
Subject: [Buildroot] [PATCH] linux: use host pkg-config when host libelf
 is set
In-Reply-To: <20190405184712.5582-1-stuart.summers@intel.com>
References: <20190404192413.10205-2-stuart.summers@intel.com>
 <20190405184712.5582-1-stuart.summers@intel.com>
Message-ID: <20190406203117.GD2659@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stuart, All,

On 2019-04-05 11:47 -0700, Stuart Summers spake thusly:
> A patch was added to the Linux kernel in 5.1.0-rc3 which
> adds a requirement that the host build environment include
> pkg-config. Add the correct host-pkgconf dependency and
> environment variables to ensure Linux picks up the correct
> libraries.
> 
> Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  linux/linux.mk | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 6bf2b88038..05bb5b9525 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -96,10 +96,6 @@ ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL),y)
>  LINUX_DEPENDENCIES += host-openssl
>  endif
>  
> -ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF),y)
> -LINUX_DEPENDENCIES += host-elfutils
> -endif

Why did you move that block around?

>  # If host-uboot-tools is selected by the user, assume it is needed to
>  # create a custom image
>  ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS),y)
> @@ -125,6 +121,16 @@ LINUX_MAKE_ENV = \
>  	$(TARGET_MAKE_ENV) \
>  	BR_BINARIES_DIR=$(BINARIES_DIR)
>  
> +ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF),y)
> +LINUX_DEPENDENCIES += host-elfutils host-pkgconf
> +LINUX_MAKE_ENV += \
> +	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
> +	PKG_CONFIG_SYSROOT_DIR="/" \
> +	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
> +	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
> +	PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/share/pkgconfig"

linux is a kconfig-package, so we should be able to run (for example):
    make linux-menuconfig

However, this should use the real pkg-config from the host, not ours, so
we explictly blacklist a set of PKG_CONFIG_* variables when calling the
kconfig configurators:
    https://git.buildroot.org/buildroot/tree/package/pkg-kconfig.mk#n174

If needed, please expand that blacklist with the two additional
PKG_CONFIG_ALLOW_SYSTEM_{CFLAGS,LIBS} this patch introduces.

If that is not needed, please expand the commit log to explain it.

In the meantime, I've marked this patch as changes-requested in
patchwork.

Thank! :-)

Regards,
Yann E. MORIN.

> +endif
> +
>  ifeq ($(BR2_REPRODUCIBLE),y)
>  LINUX_MAKE_ENV += \
>  	KBUILD_BUILD_VERSION=1 \
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
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
