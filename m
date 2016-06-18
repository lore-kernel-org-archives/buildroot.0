From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jun 2016 12:22:16 +0200
Subject: [Buildroot] [PATCH v3 1/3] gcc: add hidden symbol for defaults
In-Reply-To: <20160603040302.GA31489@waldemar-brodkorb.de>
References: <20160603040302.GA31489@waldemar-brodkorb.de>
Message-ID: <20160618102216.GC3573@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Waldemar, Thomas, All,

On 2016-06-03 06:03 +0200, Waldemar Brodkorb spake thusly:
> Some architectures, f.e. Blackfin doesn't support to
> configure GCC with --with-cpu to set some CPU specific
> default CFLAGS (-mcpu=foo). Use a hidden config symbol
> to give a hint which architecture supports it, otherwise
> add defaults to toolchain wrapper for internal toolchains.
> 
> Idea from Thomas Petazzoni.

I think we should come up with a much simpler solution.

First, this is not an architecture "feature"; it's a gcc limitation, so
I think the modification should be limited to gcc; none of arch/Config.in*
should be impacted.

Second, given that only bfin is in this case, we'd prefer a much simpler
solution that avoids having to touch all archs just for the sake of gcc
being funky on bfin. Thomas suggested, and I concur (almost):

    config BR2_GCC_ARCH_HAS_CONFIGURABLE_DEFAULT
        bool
        default y if !BR2_bfin

However, since this is purely limited to gcc on one arch, there is no
reason to have a kconfig knob for this; the check can be simply made in
the makefiles. But I won't whine if the kconfig knob is kept. ;-)

Third, there is duplication of the wrapper settings. This seems rather
difficult to deduplicate, though... I'm not very at ease with that part
for now; Thomas?

Also, a few comments, below...

> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
[--SNIP--]
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index 46f05ff..a956c0b 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -183,6 +183,7 @@ HOST_GCC_COMMON_CONF_OPTS += --disable-decimal-float
>  endif
>  
>  # Determine arch/tune/abi/cpu options
> +ifeq ($(BR2_GCC_TARGET_DEFAULTS),y)
>  ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),)
>  HOST_GCC_COMMON_CONF_OPTS += --with-arch=$(BR2_GCC_TARGET_ARCH)
>  endif
> @@ -211,6 +212,7 @@ GCC_TARGET_MODE = $(call qstrip,$(BR2_GCC_TARGET_MODE))
>  ifneq ($(GCC_TARGET_MODE),)
>  HOST_GCC_COMMON_CONF_OPTS += --with-mode=$(GCC_TARGET_MODE)
>  endif
> +endif

When enclosing "large" blocks, please add a comment after the "endif",
so that we can find the corresponding "if" :

    endif # BR2_GCC_TARGET_DEFAULTS == y

>  # Enable proper double/long double for SPE ABI
>  ifeq ($(BR2_powerpc_SPE),y)
> @@ -220,6 +222,37 @@ HOST_GCC_COMMON_CONF_OPTS += \
>  endif
>  
>  HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_CROSS_PATH_SUFFIX='".br_real"'
> +ifneq ($(BR2_GCC_TARGET_DEFAULTS),y)
> +ifeq ($(call qstrip,$(BR2_GCC_TARGET_CPU_REVISION)),)
> +CC_TARGET_CPU_ := $(call qstrip,$(BR2_GCC_TARGET_CPU))
> +else
> +CC_TARGET_CPU_ := $(call qstrip,$(BR2_GCC_TARGET_CPU)-$(BR2_GCC_TARGET_CPU_REVISION))
> +endif
> +CC_TARGET_ARCH_ := $(call qstrip,$(BR2_GCC_TARGET_ARCH))
> +CC_TARGET_ABI_ := $(call qstrip,$(BR2_GCC_TARGET_ABI))
> +CC_TARGET_FPU_ := $(call qstrip,$(BR2_GCC_TARGET_FPU))
> +CC_TARGET_FLOAT_ABI_ := $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
> +CC_TARGET_MODE_ := $(call qstrip,$(BR2_GCC_TARGET_MODE))
> +
> +ifneq ($(CC_TARGET_ARCH_),)
> +HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_ARCH='"$(CC_TARGET_ARCH_)"'
> +endif
> +ifneq ($(CC_TARGET_CPU_),)
> +HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_CPU='"$(CC_TARGET_CPU_)"'
> +endif
> +ifneq ($(CC_TARGET_ABI_),)
> +HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_ABI='"$(CC_TARGET_ABI_)"'
> +endif
> +ifneq ($(CC_TARGET_FPU_),)
> +HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_FPU='"$(CC_TARGET_FPU_)"'
> +endif
> +ifneq ($(CC_TARGET_FLOAT_ABI_),)
> +HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_FLOAT_ABI='"$(CC_TARGET_FLOAT_ABI_)"'
> +endif
> +ifneq ($(CC_TARGET_MODE_),)
> +HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_MODE='"$(CC_TARGET_MODE_)"'
> +endif
> +endif

Ditto:

    endif # BR2_GCC_TARGET_DEFAULTS != y

Regards,
Yann E. MORIN.

>  # For gcc-initial, we need to tell gcc that the C library will be
>  # providing the ssp support, as it can't guess it since the C library
> -- 
> 2.1.4
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
