From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Jul 2014 00:45:13 +0200
Subject: [Buildroot] [RFC,
 PATCH] toolchain: separate c++ compiler from libstdc++ presence
In-Reply-To: <1404359847.56223.159017096333.1.gpush@pablo>
References: <1404359847.56223.159017096333.1.gpush@pablo>
Message-ID: <20140729224513.GB5846@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jeremy,All,

On 2014-07-03 11:57 +0800, Jeremy Kerr spake thusly:
> We may want a c++ compiler, but no libstdc++ on the system. For example,
> firmware that isn't linked with the system libstdc++. These packages can
> depend on BR2_CPP instead of BR2_INSTALL_LIBSTDCPP.

We've discussed this at length with Thoms P., and we came to the
following conclusions.

First, there are two cases: internal toolchains, and external toolchains.
Your patch only addresses the case for internal toolchains.

For internal toolchains, we consider this is better served by using a
post-build script that will remove the unneeded libs. It's much easier
to write than this non-trivial patch.

For external toolchains, the same script can be used in the state, too.

However, this has prompted the case for how we handle C++ detection in
the external toolchains. Currently, the selection in the menuconfig must
match exactly whether the toolchain has or does not have C++.

We pondered whether to change the check to require g++ if the user
answered 'Y' to "toolchain has c++", but do no check if the user
answered "N" to that question (currently the check is to test for g++ to
be missing.)

This does not solve your issue at hand, but we do believe the easiest
way is to just use a post-build script to remove the libstdc++.

Therefore, I've marked your patch as Rejected in the Patchwork. Should
you have a strong case for this patch, please do not hesitate to discuss
this resolution, we can always re-open the patch later.

Regards,
Yann E. MORIN.

> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> 
> ---
>  package/Makefile.in                |    2 +-
>  package/gcc/Config.in.host         |   14 +++++++++++---
>  package/gcc/gcc-final/gcc-final.mk |    2 +-
>  toolchain/toolchain-common.in      |    4 ++++
>  4 files changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 0233506..e8de29f 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -361,7 +361,7 @@ else
>  DISABLE_IPV6= --disable-ipv6
>  endif
>  
> -ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
> +ifneq ($(BR2_CPP),y)
>  TARGET_CONFIGURE_OPTS+=CXX=false
>  endif
>  
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index fde1b90..693ff5f 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -126,13 +126,21 @@ config BR2_EXTRA_GCC_CONFIG_OPTIONS
>  	  initial, gcc intermediate and gcc final passes.
>  
>  config BR2_TOOLCHAIN_BUILDROOT_CXX
> -	bool "Enable C++ support"
> -	select BR2_INSTALL_LIBSTDCPP
> +	bool "Enable C++ compiler support"
> +	select BR2_CPP
>  	depends on !(BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 && \
>  		     BR2_TOOLCHAIN_BUILDROOT_LOCALE)
>  	help
>  	  Enable this option if you want your toolchain to support the
> -	  C++ language and you want C++ libraries to be installed on
> +	  C++ language.
> +
> +config BR2_TOOLCHAIN_BUILDROOT_LIBSTDCPP
> +	bool "Install C++ libraries"
> +	default y
> +	select BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_BUILDROOT_CXX
> +	help
> +	  Enable this option if you want C++ libraries to be installed on
>  	  your target system.
>  
>  comment "C++ support broken in uClibc with locale enabled with gcc 4.2"
> diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
> index 622dcf2..d277064 100644
> --- a/package/gcc/gcc-final/gcc-final.mk
> +++ b/package/gcc/gcc-final/gcc-final.mk
> @@ -43,7 +43,7 @@ endef
>  
>  # Languages supported by the cross-compiler
>  GCC_FINAL_CROSS_LANGUAGES-y = c
> -GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_LIBSTDCPP) += c++
> +GCC_FINAL_CROSS_LANGUAGES-$(BR2_CPP) += c++
>  GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_FORTRAN) += fortran
>  GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_OBJC)    += objc
>  GCC_FINAL_CROSS_LANGUAGES = $(subst $(space),$(comma),$(GCC_FINAL_CROSS_LANGUAGES-y))
> diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
> index a91d247..24edce3 100644
> --- a/toolchain/toolchain-common.in
> +++ b/toolchain/toolchain-common.in
> @@ -26,8 +26,12 @@ config BR2_USE_WCHAR
>  config BR2_ENABLE_LOCALE
>  	bool
>  
> +config BR2_CPP
> +	bool
> +
>  config BR2_INSTALL_LIBSTDCPP
>  	bool
> +	select BR2_CPP
>  
>  config BR2_TOOLCHAIN_HAS_THREADS
>  	bool
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
