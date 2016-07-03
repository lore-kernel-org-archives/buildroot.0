From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Jul 2016 01:13:55 +0200
Subject: [Buildroot] [PATCH 1/4] qemu: add support for host-qemu-system
In-Reply-To: <1467584664-11640-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1467584664-11640-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1467584664-11640-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160703231355.GH3482@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Simon, Thomas, All,

On 2016-07-04 00:24 +0200, Thomas Petazzoni spake thusly:
> From: Simon Maes <simonn.maes@gmail.com>
> 
> This commit adds support for building the system emulation mode in
> host-qemu. To do so, it adds the BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE and
> BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE sub-options, making sure that the
> latter is selected if the former is not enabled. This ensures that at
> least one is enabled *and* that existing configurations continue to
> build the user-land emulation (which was the only one we supported until
> now).
> 
> The list of architectures supported by the system emulation mode is the
> same as the one for the user-space emulation mode (as far as the
> existing list is concerned), so we simply drop the comment about this
> dependency list being related to the user-space emulation only.
> 
> Signed-off-by: Simon Maes <simonn.maes@gmail.com>
> [Thomas:
>  - Make sure either BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE or
>    BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE get selected.
>  - Unconditionally enable FDT support in host-qemu when in system
>    mode (so the option BR2_PACKAGE_HOST_QEMU_FDT has been removed)
>  - Remove the unneeded BR2_PACKAGE_HOST_QEMU_HAS_EMULS option.
>  - Remove the SDL related option, we really on the system to provide
>    SDL.
>  - Remove the BR2_PACKAGE_HOST_QEMU_DEBUG and
>    BR2_PACKAGE_HOST_QEMU_STRIP_BINARY options, since they are not really
>    useful.
>  - Remove HOST_QEMU_SITE and HOST_QEMU_SOURCE definitions, since they
>    are automatically derived from QEMU_SITE and QEMU_SOURCE anyway.
>  - Group things more logically in the .mk file.]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
[--SNIP--]
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index 5fa95bb..5c3cfea 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -61,9 +61,19 @@ endif
>  ifeq ($(HOST_QEMU_ARCH),sh4aeb)
>  HOST_QEMU_ARCH = sh4eb
>  endif
> -HOST_QEMU_TARGETS = $(HOST_QEMU_ARCH)-linux-user
>  
> -ifeq ($(BR2_PACKAGE_HOST_QEMU),y)
> +ifeq ($(BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE),y)
> +HOST_QEMU_TARGETS += $(HOST_QEMU_ARCH)-softmmu
> +HOST_QEMU_OPTS += --enable-system --enable-fdt
> +HOST_QEMU_DEPENDENCIES += host-dtc
> +else
> +HOST_QEMU_OPTS += --disable-system
> +endif
> +
> +ifeq ($(BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE),y)
> +HOST_QEMU_TARGETS += $(HOST_QEMU_ARCH)-linux-user
> +HOST_QEMU_OPTS += --enable-linux-user

It is unnecessary to pass --enable-system and/or --enable-linux-user
when an explicit --target-list is passed.

Othrewise:

    Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  HOST_QEMU_HOST_SYSTEM_TYPE = $(shell uname -s)
>  ifneq ($(HOST_QEMU_HOST_SYSTEM_TYPE),Linux)
>  $(error "qemu-user can only be used on Linux hosts")
> @@ -84,12 +94,16 @@ HOST_QEMU_COMPARE_VERSION = $(shell test $(HOST_QEMU_HOST_SYSTEM_VERSION) -ge $(
>  # built with kernel headers that are older or the same as the kernel
>  # version running on the host machine.
>  #
> +
>  ifeq ($(BR_BUILDING),y)
>  ifneq ($(HOST_QEMU_COMPARE_VERSION),OK)
>  $(error "Refusing to build qemu-user: target Linux version newer than host's.")
>  endif
> -endif
> -endif
> +endif # BR_BUILDING
> +
> +else # BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
> +HOST_QEMU_OPTS += --disable-linux-user
> +endif # BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
>  
>  define HOST_QEMU_CONFIGURE_CMDS
>  	cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure    \
> @@ -100,7 +114,8 @@ define HOST_QEMU_CONFIGURE_CMDS
>  		--host-cc="$(HOSTCC)"                   \
>  		--python=$(HOST_DIR)/usr/bin/python2    \
>  		--extra-cflags="$(HOST_CFLAGS)"         \
> -		--extra-ldflags="$(HOST_LDFLAGS)"
> +		--extra-ldflags="$(HOST_LDFLAGS)"       \
> +		$(HOST_QEMU_OPTS)
>  endef
>  
>  define HOST_QEMU_BUILD_CMDS
> -- 
> 2.7.4
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
