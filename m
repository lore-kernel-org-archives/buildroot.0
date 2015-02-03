From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 11:48:50 +0100
Subject: [Buildroot] [PATCH 1/1] binutils,
 gcc: add support for GCC flag -flto
In-Reply-To: <1419087669-2365-1-git-send-email-syntheticpp@gmx.net>
References: <1419087669-2365-1-git-send-email-syntheticpp@gmx.net>
Message-ID: <20150203114850.07e59b55@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter K?mmel,

We reviewed your patch during the Buildroot meeting, here is some
feedback.

For such a non-trivial feature, having an empty commit log is a bit
weird. Can you write down some more details in the commit log?

On Sat, 20 Dec 2014 16:01:09 +0100, Peter K?mmel wrote:

> diff --git a/package/binutils/Config.in b/package/binutils/Config.in
> index 64d0a09..a5d2cc9 100644
> --- a/package/binutils/Config.in
> +++ b/package/binutils/Config.in
> @@ -19,6 +19,11 @@ config BR2_PACKAGE_BINUTILS_TARGET
>  
>  	  http://www.gnu.org/software/binutils/
>  
> +config BR2_PACKAGE_BINUTILS_ENABLE_LTO
> +	bool "Enable support for link-time-optimization"
> +	help
> +	  Enable lto support. Allows passing a lto plugin to ar and ranlib.
> +

We believe this is not needed, as we don't support development on the
target. Even though we have a target binutils package for binutils
libraries (used by oprofile or  other things), or because sometimes
using objdump on the target might be useful, we generally don't support
development on the target, so having the option of enabling LTO in the
target binutils is not very useful.


> +ifeq ($(BR2_PACKAGE_BINUTILS_ENABLE_LTO),y)
> +BINUTILS_CONF_OPTS += --enable-plugins --enable-lto
> +endif

So this chunk would no longer be needed.

> +
> +ifeq ($(BR2_GCC_ENABLE_LTO),y)
> +HOST_BINUTILS_CONF_OPTS += --enable-plugins --enable-lto
> +endif

This looks fine.

> +
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index 0750807..4e0c2ae 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -128,6 +128,12 @@ config BR2_GCC_ENABLE_TLS
>  	  Enable the compiler to generate code for accessing
>  	  thread local storage variables
>  
> +config BR2_GCC_ENABLE_LTO
> +	bool "Enable compiler link-time-optimization support"
> +	help
> +	  Since version 4.5 GCC supports lto. Build GCC with lto support enabled.
> +	  Needed when -flto should be used.

Since it's only supported since GCC 4.5, then maybe make it 'depends
on !BR2_GCC_VERSION_4_2_2_AVR32_2_1_5'.

> +ifeq ($(BR2_GCC_ENABLE_LTO),y)
> +HOST_GCC_COMMON_CONF_OPTS += --enable-plugins --enable-lto
> +endif

Looks fine.


> +
>  ifeq ($(BR2_GCC_ENABLE_LIBMUDFLAP),y)
>  HOST_GCC_COMMON_CONF_OPTS += --enable-libmudflap
>  else
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index b07b16c..8baf561 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -643,6 +643,9 @@ define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
>  	for i in $(TOOLCHAIN_EXTERNAL_CROSS)*; do \
>  		base=$${i##*/}; \
>  		case "$$base" in \
> +		*-ar|*-ranlib|*-nm) \
> +			ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%../..%') .; \
> +			;; \

Please add a comment here in the code to explain why this is happening.
During the review, we had to find a previous version of your patch with
a more detailed commit log to understand what was going on.

I'll mark your patch as 'Changes Requested' in patchwork, so please
resend an updated version otherwise we will forget about it. Thanks a
lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
