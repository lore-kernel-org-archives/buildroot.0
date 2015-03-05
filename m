From: =?UTF-8?B?UGV0ZXIgS8O8bW1lbA==?= <syntheticpp@gmx.net>
Date: Thu, 05 Mar 2015 15:47:24 +0100
Subject: [Buildroot] [PATCH 1/1] toolchain: add link-time-optimization
	support
In-Reply-To: <1425479715-5716-1-git-send-email-syntheticpp@gmx.net>
References: <1425479715-5716-1-git-send-email-syntheticpp@gmx.net>
Message-ID: <54F86C7C.8050003@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is an update of the reviewed patch:

     http://patchwork.ozlabs.org/patch/423082

Hope it is enough to get committed.

BTW, how do I add comments in patchwork.


Am 04.03.2015 um 15:35 schrieb Peter K?mmel:
> GCC's link-time-optimization could be enabled by the flag '-flto'.
> With LTO enabled, ar and runlib must be called with an argument which
> triggers the usage of a LTO plugin.
> GCC provides wrappers for ar and ranlib which implicitly pass the LTO
> arguments to ar/ranlib. This way existing Makefiles don't need to be
> changed for LTO support when these wrappers around ar and ranlib are used.
> Also the LTO and plugin support must be enabled in the host's binutils.
>
> Signed-off-by: Peter K?mmel <syntheticpp@gmx.net>
> ---
>   package/binutils/binutils.mk                       | 4 ++++
>   package/gcc/Config.in.host                         | 7 +++++++
>   package/gcc/gcc.mk                                 | 4 ++++
>   toolchain/toolchain-external/toolchain-external.mk | 8 ++++++++
>   4 files changed, 23 insertions(+)
>
> diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
> index 9e99253..daa8c45 100644
> --- a/package/binutils/binutils.mk
> +++ b/package/binutils/binutils.mk
> @@ -96,5 +96,9 @@ BINUTILS_PRE_PATCH_HOOKS += BINUTILS_XTENSA_PRE_PATCH
>   HOST_BINUTILS_PRE_PATCH_HOOKS += BINUTILS_XTENSA_PRE_PATCH
>   endif
>
> +ifeq ($(BR2_GCC_ENABLE_LTO),y)
> +HOST_BINUTILS_CONF_OPTS += --enable-plugins --enable-lto
> +endif
> +
>   $(eval $(autotools-package))
>   $(eval $(host-autotools-package))
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index dd61f51..3c83579 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -116,6 +116,13 @@ config BR2_GCC_ENABLE_TLS
>   	  Enable the compiler to generate code for accessing
>   	  thread local storage variables
>
> +config BR2_GCC_ENABLE_LTO
> +	bool "Enable compiler link-time-optimization support"
> +	depends on !BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
> +	help
> +	  Since version 4.5 GCC supports lto. Build GCC with lto support enabled.
> +	  Needed when -flto should be used.
> +
>   config BR2_GCC_ENABLE_OPENMP
>   	bool "Enable compiler OpenMP support"
>   	depends on !BR2_PTHREADS_NONE && !BR2_arc && !BR2_microblaze
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index ffac15c..b5d2ddb 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -132,6 +132,10 @@ else
>   HOST_GCC_COMMON_CONF_OPTS += --disable-tls
>   endif
>
> +ifeq ($(BR2_GCC_ENABLE_LTO),y)
> +HOST_GCC_COMMON_CONF_OPTS += --enable-plugins --enable-lto
> +endif
> +
>   ifeq ($(BR2_GCC_ENABLE_LIBMUDFLAP),y)
>   HOST_GCC_COMMON_CONF_OPTS += --enable-libmudflap
>   else
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index ab73f9a..d7a8499 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -656,12 +656,20 @@ endif
>   # Build toolchain wrapper for preprocessor, C and C++ compiler and setup
>   # symlinks for everything else. Skip gdb symlink when we are building our
>   # own gdb to prevent two gdb's in output/host/usr/bin.
> +# When the link-time-optimazation flag '-flto' is used, then the compiler
> +# and binutils have to support lto. ar/ranlib needs to be called with the
> +# lto plugin. The wrappers *-gcc-ar and *-gcc-ranlib provided by GCC could
> +# be used as drop-ins for ar/runlib when Makefiles are used which do not
> +# pass the lto arguments.
>   define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
>   	$(Q)$(call MESSAGE,"Building ext-toolchain wrapper")
>   	mkdir -p $(HOST_DIR)/usr/bin; cd $(HOST_DIR)/usr/bin; \
>   	for i in $(TOOLCHAIN_EXTERNAL_CROSS)*; do \
>   		base=$${i##*/}; \
>   		case "$$base" in \
> +		*-ar|*-ranlib|*-nm) \
> +			ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
> +			;; \
>   		*cc|*cc-*|*++|*++-*|*cpp) \
>   			ln -sf ext-toolchain-wrapper $$base; \
>   			;; \
>
