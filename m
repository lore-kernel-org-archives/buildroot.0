From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 14 Mar 2018 19:02:25 +0100
Subject: [Buildroot] [PATCH v4 1/4] qemu: cleanup for
 gobject-introspection
In-Reply-To: <20180314172451.22455-2-aduskett@gmail.com>
References: <20180314172451.22455-1-aduskett@gmail.com>
 <20180314172451.22455-2-aduskett@gmail.com>
Message-ID: <20180314180225.GA24940@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2018-03-14 13:24 -0400, Adam Duskett spake thusly:
> Add a BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS which will be referenced by the
> gobject-introspection package. This also has the added benefit of making the
> config file conform to other package standards such as Valgrind.
> 
> Add depends on !BR2_powerpc_620 && !BR2_powerpc_630 && !BR2_powerpc_970 to
> Config.in.host as these are not currently supported cpus by qemu.
> 
> Add a new variable in qemu.mk: HOST_QEMU_CPU_TUNE. When qemu-$(ARCH) is
> called, some architectures require a -cpu flag to be passed, or else a
> segfault may occure when building .gir files.
> For PowerPC, many of these cpu's need a specific CPU flag to be passed
> via the command line.

I think you should split this patch in two:
  - one to introduce BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
  - one to introduce HOST_QEMU_CPU_TUNE

The second of which I have more comment about, see below...

> Signed-off-by: Adam Duskett <aduskett@gmail.com>
[--SNIP--]
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index 345ef52668..62cb517628 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -70,6 +70,37 @@ endif
>  ifeq ($(HOST_QEMU_ARCH),sh4aeb)
>  HOST_QEMU_ARCH = sh4eb
>  endif
> +
> +# Add cpu specific callouts for qemu.
> +# In some cases (e.g. ppc) simply being arch specific (apparently) isn't good
> +# enough and a PACKAGE_ARCH specific -cpu option is needed 
> +# For others (e.g. arm) a -cpu option is not necessary, since the
> +# qemu-arm default CPU supports all required architecture levels.
> +ifeq ($(BR2_x86_64),y)
> +HOST_QEMU_CPU_TUNE = -cpu Nehalem,check=false
> +endif
> +
> +# PowerPC architecture. Currently, the 620, 630, and 970 are not supported.
> +ifeq ($(BR2_powerpc_e5500),y)
> +HOST_QEMU_CPU_TUNE = -cpu e5500
> +endif
> +
> +ifeq ($(BR2_powerpc_e6500),y)
> +HOST_QEMU_CPU_TUNE = -cpu e6500
> +endif
> +
> +ifeq ($(BR2_powerpc_power7),y)
> +HOST_QEMU_CPU_TUNE = -cpu 7400
> +endif
> +
> +ifeq ($(BR2_powerpc64)$(BR2_powerpc_e5500),yy)
> +HOST_QEMU_CPU_TUNE = -cpu e500mc
> +endif
> +
> +ifeq ($(BR2_powerpc64)$(BR2_powerpc_e6500),yy)
> +HOST_QEMU_CPU_TUNE = -cpu e500mc
> +endif

So, as I understand it, pacakges that will want to use qemu will have to
call it with those options, like so:

    define FOO_BLABLA_HOOK
        qemu $(HOST_QEMU_CPU_TUNE) blabla...
    endef

Wat I would suggest is that you rename this variable, and change the way
QEMU_USER is defined, on line 150:

    QEMU_USER_OPTS += -cpu blurk

    QEMU_USER = $(HOST_DIR)/bin/qemu-$(HOST_QEMU_ARCH) $(QEMU_USER_OPTS)

Then, when a package wants to use qemu-user, it just has to call
$(QEMU_USER).

Regards,
Yann E. MORIN.

>  HOST_QEMU_SYS_ARCH ?= $(HOST_QEMU_ARCH)
>  
>  ifeq ($(BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE),y)
> -- 
> 2.14.3
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
