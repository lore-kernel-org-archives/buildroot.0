From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Aug 2015 23:16:29 +0200
Subject: [Buildroot] [PATCH v2] Add support for the x86-64 x32 ABI for
 glibc and musl.
In-Reply-To: <1440070351-29057-1-git-send-email-Guido.Hatzsis@yandex.com>
References: <1440070351-29057-1-git-send-email-Guido.Hatzsis@yandex.com>
Message-ID: <20150820231629.5688e5ed@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Guido Hatzsis,

Thanks for this contribution! Great to see someone working on x32
support!

On Thu, 20 Aug 2015 11:32:31 +0000, Guido Hatzsis wrote:
> x32 uses 32-bit pointers on the x84-64 linux target. The kernel needs
> to have CONFIG_X86_X32 enabled. For more information see:
> https://en.wikipedia.org/wiki/X32_ABI
> 
> Changes v1 -> v2:
>     Adding links for libx32 -> lib
>     Added copying for libs to staging directory.

The changelog should go below the "---" sign after the Signed-off-by
statement, since we don't want the changelog to be kept in the final
commit.

> diff --git a/Makefile b/Makefile
> index b4cef3f..d50161f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -448,7 +448,11 @@ $(BUILD_DIR) $(TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIS
>  # We make a symlink lib32->lib or lib64->lib as appropriate
>  # MIPS64/n32 requires lib32 even though it's a 64-bit arch.
>  ifeq ($(BR2_ARCH_IS_64)$(BR2_MIPS_NABI32),y)
> +ifeq ($(BR2_X86_64_ABI_X32),y)
> +LIB_SYMLINK= libx32

Space after LIB_SYMLINK.

> +else
>  LIB_SYMLINK = lib64
> +endif
>  else
>  LIB_SYMLINK = lib32
>  endif
> diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
> index 43f6abc..baaeae1 100644
> --- a/arch/Config.in.x86
> +++ b/arch/Config.in.x86
> @@ -268,3 +268,32 @@ config BR2_GCC_TARGET_ARCH
>  	default "c3"		if BR2_x86_c3
>  	default "c3-2"		if BR2_x86_c32
>  	default "geode"		if BR2_x86_geode
> +
> +choice
> +       prompt "Target ABI"
> +       depends on BR2_x86_64
> +       default BR2_X86_64_ABI_GCC

This option does not exist. You called it BR2_X86_64_ABI_GNU.

> +       help
> +         Application Binary Interface to use. The Application Binary
> +         Interface describes the calling conventions (how arguments
> +         are passed to functions, how the return value is passed, how
> +         system calls are made, etc.).
> +
> +config BR2_X86_64_ABI_GNU
> +       bool "gnu"
> +       depends on BR2_x86_64

Not needed, the entire choice depends on BR2_x86_64.

> +       help
> +      This is the gnu ABI for x86-64 which has 64-bits wide pointers.

Indentation should be one tab + two spaces. Also, please indicate here
that something such as "This is the default ABI on x86-64, and should
be used unless you know what you are doing".

> +
> +config BR2_X86_64_ABI_X32
> +       bool "x32"
> +       depends on BR2_x86_64

Not needed.

> +       help
> +      The X32 ABI is x86-64 with 32 bit pointers. It runs in x86-64 mode
> +      but as it has 32-bit pointers only 4 GB of RAM can be addressed.
> +      https://en.wikipedia.org/wiki/X32_ABI

Please fix the indentation: one tab + two spaces.

> +
> +endchoice
> +
> +config BR2_GCC_TARGET_ABI
> +    default "x32"      if BR2_X86_64_ABI_X32

Do we need to provide a value for BR2_X86_64_ABI_GNU ? Or the ABI is
empty ?

> diff --git a/package/Makefile.in b/package/Makefile.in
> index 545694f..db2c0f0 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -70,6 +70,11 @@ ABI := $(ABI)hf
>  endif
>  endif
>  
> +# Only set the ABI for x86-64 x32.
> +ifeq ($(BR2_X86_64_ABI_X32),y)
> +ABI = x32
> +endif
> +
>  # For FSL PowerPC there's SPE
>  ifeq ($(BR2_powerpc_SPE),y)
>  ABI = spe
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index cbfbf32..59a81d9 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -117,7 +117,7 @@ endif
>  
>  define GLIBC_INSTALL_TARGET_CMDS
>  	for libs in $(GLIBC_LIBS_LIB); do \
> -		$(call copy_toolchain_lib_root,$(STAGING_DIR)/,,lib,$$libs,/lib) ; \
> +		$(call copy_toolchain_lib_root,$(STAGING_DIR)/,,$(if $(BR2_X86_64_ABI_X32),libx32,lib),$$libs,/lib) ; \

Hum, I'm not too happy with this. How does it work for normal x86-64
toolchains that want lib64 as the library directory?

>  	done
>  endef
>  
> diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
> index bf40a13..f4de98b 100644
> --- a/package/uclibc/Config.in
> +++ b/package/uclibc/Config.in
> @@ -3,6 +3,7 @@ if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
>  # For legal-info
>  config BR2_PACKAGE_UCLIBC
>  	bool
> +    depends on !BR2_X86_64_ABI_X32

Change not needed, since you're doing a change in
toolchain/toolchain-buildroot/Config.in to prevent selecting uClibc.

>  	default y
>  
>  comment "uClibc Options"
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index 13e2b15..a2ce5cd 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -34,6 +34,7 @@ config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
>  		   BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
>  		   BR2_powerpc || BR2_sh2a   || BR2_sh4	   || BR2_sh4eb    || \
>  		   BR2_sparc   || BR2_xtensa || BR2_x86_64
> +	depends on !BR2_X86_64_ABI_X32

I would prefer the following change:

-  		   BR2_sparc   || BR2_xtensa || BR2_x86_64
+ 		   BR2_sparc   || BR2_xtensa || (BR2_x86_64 && BR2_X86_64_ABI_GNU)

Also, you need to:

 * Verify that the musl C library supports the x32 ABI, and if not,
   make it unavailable when x32 is selected.

 * Make the relevant external x86-64 toolchains depend on
   BR2_X86_64_ABI_GNU. You can have a look at how we handle ARM EABI
   vs. ARM EABIhf toolchains to see how to do this.

 * Ideally, we would need to check if we have packages that package
   pre-built x86-64 binaries. And if we have such packages, then they
   should probably depend on BR2_X86_64_ABI_GNU. Of course, I'm
   assuming here that linking x32 binaries/libraries with x86-64 nu
   binaries/libraries does not work.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
