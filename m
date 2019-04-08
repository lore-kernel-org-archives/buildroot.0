From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Apr 2019 21:28:40 +0200
Subject: [Buildroot] [PATCH 1/1] linux: use host pkg-config when host
 libelf is set
In-Reply-To: <20190408184233.10697-1-stuart.summers@intel.com>
References: <20190405184712.5582-1-stuart.summers@intel.com>
 <20190408184233.10697-1-stuart.summers@intel.com>
Message-ID: <20190408192840.GB23890@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stuart, All,

On 2019-04-08 11:42 -0700, Stuart Summers spake thusly:
> A patch was added to the Linux kernel in 5.1.0-rc3 which
> adds a requirement that the host build environment include
> pkg-config. Add the correct host-pkgconf dependency and
> environment variables to ensure Linux picks up the correct
> libraries.

Additionally:

    Move the existing LINUX_MAKE_ENV assignment earlier, to simplify
    the append-assignment in the libelf conditional block.

And since you posted your patch, someone opened a bug in our tracker,
so:

    Fixes: #11761

> v2: Use LINUX_MAKE_ENV to pass PKG_CONFIG_* options (Thomas)
> v3: Add PKG_CONFIG_ALLOW_SYSTEM_{CFLAGS,LIBS} to kconfig
>     blacklist and move LINUX_MAKE_ENV initial assign in
>     linux.mk before DEP* assignments (Yann)

This v2-v3 changelog should be after the --- line, below...

> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---

... here.

>  linux/linux.mk         | 16 +++++++++++-----
>  package/pkg-kconfig.mk |  4 +++-
>  2 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 6bf2b88038..d209a5cf59 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -61,6 +61,10 @@ LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
>  # be directories in the patch list (unlike for other packages).
>  LINUX_PATCH = $(filter ftp://% http://% https://%,$(LINUX_PATCHES))
>  
> +LINUX_MAKE_ENV = \
> +	$(TARGET_MAKE_ENV) \
> +	BR_BINARIES_DIR=$(BINARIES_DIR)
> +
>  LINUX_INSTALL_IMAGES = YES
>  LINUX_DEPENDENCIES = host-kmod
>  
> @@ -97,7 +101,13 @@ LINUX_DEPENDENCIES += host-openssl
>  endif
>  
>  ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF),y)
> -LINUX_DEPENDENCIES += host-elfutils
> +LINUX_DEPENDENCIES += host-elfutils host-pkgconf
> +LINUX_MAKE_ENV += \
> +	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
> +	PKG_CONFIG_SYSROOT_DIR="/" \
> +	PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
> +	PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
> +	PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/share/pkgconfig"
>  endif
>  
>  # If host-uboot-tools is selected by the user, assume it is needed to
> @@ -121,10 +131,6 @@ LINUX_MAKE_FLAGS = \
>  	CROSS_COMPILE="$(TARGET_CROSS)" \
>  	DEPMOD=$(HOST_DIR)/sbin/depmod
>  
> -LINUX_MAKE_ENV = \
> -	$(TARGET_MAKE_ENV) \
> -	BR_BINARIES_DIR=$(BINARIES_DIR)
> -
>  ifeq ($(BR2_REPRODUCIBLE),y)
>  LINUX_MAKE_ENV += \
>  	KBUILD_BUILD_VERSION=1 \
> diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
> index d6c95b897e..e53cc9002e 100644
> --- a/package/pkg-kconfig.mk
> +++ b/package/pkg-kconfig.mk
> @@ -175,7 +175,9 @@ endif
>  # nconfig, gconfig, xconfig).
>  # So we simply remove our PATH and PKG_CONFIG_* variables.
>  $(2)_CONFIGURATOR_MAKE_ENV = \
> -	$$(filter-out PATH=% PKG_CONFIG=% PKG_CONFIG_SYSROOT_DIR=% PKG_CONFIG_LIBDIR=%,$$($(2)_MAKE_ENV)) \
> +	$$(filter-out PATH=% PKG_CONFIG=% PKG_CONFIG_SYSROOT_DIR=% \
> +	   PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=% PKG_CONFIG_ALLOW_SYSTEM_LIBS=% \
> +	   PKG_CONFIG_LIBDIR=%,$$($(2)_MAKE_ENV)) \

I'm not too happy about the look the above has, but I have no better
formatting suggestion to provide...

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  	PKG_CONFIG_PATH="$(HOST_PKG_CONFIG_PATH)"
>  
>  # Configuration editors (menuconfig, ...)
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
