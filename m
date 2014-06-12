From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Jun 2014 21:54:36 +0200
Subject: [Buildroot] [PATCH 1/1] Add support for gold linker and LTO for
 GCC.
In-Reply-To: <BLU436-SMTP187DA10D0CB5B02F7E271EEA8280@phx.gbl>
References: <BLU436-SMTP187DA10D0CB5B02F7E271EEA8280@phx.gbl>
Message-ID: <20140612215436.6a142e95@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve Thomas,

Great, glad to see someone working on LTO support in Buildroot!

On Tue, 10 Jun 2014 22:13:24 +0000, Steve Thomas wrote:
> Link Time Optimisations (LTO) from GCC needs the linker plugin. It also
> needs support from the tools, in particular the archiver (AR) to
> properly form archives that can be used by the linker.  The linker needs
> to support the plugin also.
> 
> This patch changes the linker from BFD to GOLD and wraps the ar, nm and
> ranlib utilities with a wrapper that calls the gcc-wrapper version that
> call the actual utilities with an additional argument. This is a
> temporary measure until the GCC versions supoort this properly and saves

supoort -> support.

> having to modify a few hundres packages.

This wrapper thing is indeed a bit annoying.

> diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
> index 08540a3..a6e5ba6 100644
> --- a/package/binutils/Config.in.host
> +++ b/package/binutils/Config.in.host
> @@ -1,5 +1,8 @@
>  comment "Binutils Options"
>  
> +config BR2_BINUTILS_SUPPORTS_GOLD
> +	bool "binutils 2.24"

This should be a blind option, so just "bool", with no prompt.

>  choice
>  	prompt "Binutils Version"
>  	depends on !BR2_arc
> @@ -42,6 +45,7 @@ choice
>  
>  	config BR2_BINUTILS_VERSION_2_24
>  		depends on !BR2_avr32
> +		select BR2_BINUTILS_SUPPORTS_GOLD
>  		bool "binutils 2.24"
>  
>  endchoice
> diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
> index 9cc4d28..5e32b2d 100644
> --- a/package/binutils/binutils.mk
> +++ b/package/binutils/binutils.mk
> @@ -62,6 +62,18 @@ HOST_BINUTILS_CONF_OPT = --disable-multilib --disable-werror \
>  			--with-sysroot=$(STAGING_DIR) \
>  			$(BINUTILS_EXTRA_CONFIG_OPTIONS)
>  
> +# disable ld explicitely and use ld.gold exclusively
> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT_GOLD),y)
> +HOST_BINUTILS_CONF_OPT += \
> +           --enable-plugins \
> +           --enable-gold \
> +           --disable-ld

Indentation should use one tab.

> +endif
> +
> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT_LTO),y)
> +HOST_BINUTILS_CONF_OPT += --enable-lto
> +endif
> +
>  # We just want libbfd and libiberty, not the full-blown binutils in staging
>  define BINUTILS_INSTALL_STAGING_CMDS
>  	$(MAKE) -C $(@D)/bfd DESTDIR=$(STAGING_DIR) install
> diff --git a/package/gcc/4.8.3/950-lto-support.patch b/package/gcc/4.8.3/950-lto-support.patch
> new file mode 100644
> index 0000000..c45512a
> --- /dev/null
> +++ b/package/gcc/4.8.3/950-lto-support.patch

All patches should have a description + Signed-off-by line.

> diff --git a/package/gcc/4.9.0/950-lto-support.patch b/package/gcc/4.9.0/950-lto-support.patch
> new file mode 100644
> index 0000000..c45512a
> --- /dev/null
> +++ b/package/gcc/4.9.0/950-lto-support.patch

Same comment here.

> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index b6d4b5e..ea464bf 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -6,6 +6,9 @@ config BR2_GCC_NEEDS_MPC
>  config BR2_GCC_SUPPORTS_GRAPHITE
>  	bool
>  
> +config BR2_GCC_SUPPORTS_GOLD
> +	bool
> +
>  choice
>  	prompt "GCC compiler Version"
>  	default BR2_GCC_VERSION_4_4_X if BR2_sparc_sparchfleon || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleon || BR2_sparc_sparcsfleonv8
> @@ -64,6 +67,7 @@ choice
>  		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a12 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_powerpc64le
>  		select BR2_GCC_NEEDS_MPC
>  		select BR2_GCC_SUPPORTS_GRAPHITE
> +		select BR2_GCC_SUPPORTS_GOLD
>  		bool "gcc 4.8.x"
>  
>  	config BR2_GCC_VERSION_4_8_ARC
> @@ -75,6 +79,7 @@ choice
>  		depends on !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
>  		select BR2_GCC_NEEDS_MPC
>  		select BR2_GCC_SUPPORTS_GRAPHITE
> +		select BR2_GCC_SUPPORTS_GOLD
>  		bool "gcc 4.9.x"
>  
>  	config BR2_GCC_VERSION_SNAP
> @@ -147,6 +152,13 @@ config BR2_INSTALL_OBJC
>  	  cross-compiler, and install the Objective-C runtime to the
>  	  target.
>  
> +config BR2_GCC_ENABLE_GRAPHITE
> +   bool "Enable compiler graphite optimisations"
> +   depends on BR2_GCC_SUPPORTS_GRAPHITE
> +   help
> +     Enable the compiler to support graphite optimisations
> +

I believe this hunk should not be part of the patch, as it's unrelated.

> +
>  config BR2_INSTALL_FORTRAN
>  	bool "Enable Fortran support"
>  	depends on !BR2_avr32
> @@ -186,10 +198,3 @@ config BR2_GCC_ENABLE_LIBMUDFLAP
>  	  the help of the gcc -fmudflap option for more details.
>  
>  	  If you're unsure, leave this option disabled.
> -
> -config BR2_GCC_ENABLE_GRAPHITE
> -	bool "Enable graphite support"
> -	depends on BR2_GCC_SUPPORTS_GRAPHITE
> -	help
> -	  This option enables the graphite optimizations in the
> -	  compiler.

Ditto.

> diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
> index bc5ad26..57df10d 100644
> --- a/package/gcc/gcc-initial/gcc-initial.mk
> +++ b/package/gcc/gcc-initial/gcc-initial.mk
> @@ -40,4 +40,22 @@ HOST_GCC_INITIAL_CONF_ENV = \
>  HOST_GCC_INITIAL_MAKE_OPT = all-gcc
>  HOST_GCC_INITIAL_INSTALL_OPT = install-gcc
>  
> +# Extremely nasty hack for setting up links for binutils programs that are
> +# executed using the wrapper.
> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT_GOLD),y)
> +define HOST_GCC_INSTALL_WRAPPERS
> +        for i in ar nm ranlib ; do \
> +			_tmp=$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-$${i}; \
> +	        if [ ! -f "$${_tmp}-bin" ] ; then \
> +				mv $${_tmp} $${_tmp}-bin; \
> +				cp -dpf $$(echo $${_tmp} | sed 's:-[^-]*$$:-gcc&:') $${_tmp}; \
> +				ln -f $${_tmp}-bin $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin/$${i}-bin; \
> +				ln -f $${_tmp} $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin/$${i}; \
> +			fi; \
> +        done; \
> +		ln -fs $(HOST_DIR)/usr/libexec $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/libexec
> +endef
> +HOST_GCC_INITIAL_POST_INSTALL_HOOKS += HOST_GCC_INSTALL_WRAPPERS
> +endif

Indentation is a bit broken as well. Also, in the comment, instead of
saying that's it's a nasty hack, it would be a lot more useful to
explain what this is doing.

> +
>  $(eval $(host-autotools-package))
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index 5b60bc3..6980fa8 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -213,6 +213,17 @@ ifneq ($(GCC_TARGET_MODE),)
>  HOST_GCC_COMMON_CONF_OPT += --with-mode=$(GCC_TARGET_MODE)
>  endif
>  
> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT_GOLD),y)
> +HOST_GCC_COMMON_CONF_OPT += \
> +           --enable-plugins \
> +           --enable-gold \
> +           --disable-ld
> +endif

Indentation should be one tab.

> +
> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT_LTO),y)
> +HOST_GCC_COMMON_CONF_OPT += --enable-lto
> +endif
> +
>  # Branding works on >= 4.3
>  ifneq ($(findstring x4.2.,x$(GCC_VERSION)),x4.2.)
>  HOST_GCC_COMMON_CONF_OPT += \
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index eef9f9c..8f38b4f 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -100,6 +100,17 @@ config BR2_TOOLCHAIN_BUILDROOT_LIBC
>  	default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_GLIBC
>  	default "musl"	 if BR2_TOOLCHAIN_BUILDROOT_MUSL
>  
> +config BR2_TOOLCHAIN_BUILDROOT_GOLD
> +	bool "gold (experimental)"
> +	depends on BR2_BINUTILS_SUPPORTS_GOLD
> +	depends on BR2_GCC_SUPPORTS_GOLD
> +	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_x86_64

Help text needed.

I'm curious, is gold actually limited to the architectures you've
listed?

> +
> +config BR2_TOOLCHAIN_BUILDROOT_LTO
> +	bool "lto (experimental)"
> +	depends on BR2_TOOLCHAIN_BUILDROOT_GOLD
> +	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_x86_64

Same (help text + limitation on architectures).

Also, I'm not sure just "gold" or "lto" are sufficient, some more
descriptive prompt text would be useful.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
