From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 19 May 2014 18:47:14 +0200
Subject: [Buildroot] [PATCH v5 3/3] Add an BR2_GCC_ENABLE_GRAPHITE flag
 for the buildroot toolchain
In-Reply-To: <BLU436-SMTP113064B7F559C14F7CA3C57A8320@phx.gbl>
References: <1400508976-3593-1-git-send-email-scjthm@live.com>
 <BLU436-SMTP113064B7F559C14F7CA3C57A8320@phx.gbl>
Message-ID: <20140519164714.GB3508@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Steve, All,

On 2014-05-19 14:16 +0000, Steve Thomas spake thusly:
> The gcc graphite optimisations such as loop-interchange, blocking
> and loop-flattening, also known as graphite are an optional feature of
> gcc that is very well supported since about gcc version 4.5.
> 
> This patch adds support for graphite for the toolchain as an optional
> flag for versions 4.6 onwards as an optional flag, that is disabled by
> default.

Which is wrong. Graphite support on gcc needs:
  - gcc < 4.4       : no Graphite support
  - 4.4 <= gcc < 4.8: ppl and CLooG-ppl
  - gcc >= 4.8      : isl and CLooG

Since this series only adds isl+CLooG, the patch is wrong to add
Graphite suport for all gcc versions < 4.8.

Regards,
Yann E. MORIN.

> Signed-off-by: Steve Thomas <scjthm@live.com>
> ---
> Changes v4 -> v5:
>     - fixed email address
>     - removed the cloog version check
>     - added note about the isl version check
> 
> Changes v3 -> v4:
>     - no changes apart from incorrect email.
> 
> Changes v2 -> v3:
>     - removed packages from Config.in
>     - disabled target builds
>     - added empty line to commit messages
>     - removed isl patch as different version used
> 
> Changes v1 -> v2:
>     - added more lucid and verbose description in commit messages
>     - fixed the url and removed the sources files
>     - add complete graphite as three commits yet a single patch
> ---
>  package/gcc/Config.in.host | 16 ++++++++++++++++
>  package/gcc/gcc.mk         |  9 +++++++++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index ca991da..6ecfef5 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -3,6 +3,9 @@ comment "GCC Options"
>  config BR2_GCC_NEEDS_MPC
>  	bool
>  
> +config BR2_GCC_SUPPORTS_GRAPHITE
> +	bool
> +
>  choice
>  	prompt "GCC compiler Version"
>  	default BR2_GCC_VERSION_4_4_X if BR2_sparc_sparchfleon || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleon || BR2_sparc_sparcsfleonv8
> @@ -42,36 +45,43 @@ choice
>  	config BR2_GCC_VERSION_4_6_X
>  		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a7 && !BR2_cortex_a12 && !BR2_x86_jaguar && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
>  		select BR2_GCC_NEEDS_MPC
> +		select BR2_GCC_SUPPORTS_GRAPHITE
>  		bool "gcc 4.6.x"
>  
>  	config BR2_GCC_VERSION_4_7_X
>  		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a12 && !BR2_x86_jaguar && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
>  		select BR2_GCC_NEEDS_MPC
> +		select BR2_GCC_SUPPORTS_GRAPHITE
>  		bool "gcc 4.7.x"
>  
>  	config BR2_GCC_VERSION_4_8_X
>  		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a12 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
>  		select BR2_GCC_NEEDS_MPC
> +		select BR2_GCC_SUPPORTS_GRAPHITE
>  		bool "gcc 4.8.x"
>  
>  	config BR2_GCC_VERSION_4_8_ARC
>  		depends on BR2_arc
>  		select BR2_GCC_NEEDS_MPC
> +		select BR2_GCC_SUPPORTS_GRAPHITE
>  		bool "gcc 4.8-arc"
>  
>  	config BR2_GCC_VERSION_4_9_X
>  		depends on !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
>  		select BR2_GCC_NEEDS_MPC
> +		select BR2_GCC_SUPPORTS_GRAPHITE
>  		bool "gcc 4.9.x"
>  
>  	config BR2_GCC_VERSION_4_9_MICROBLAZE
>  		depends on BR2_microblaze
>  		select BR2_GCC_NEEDS_MPC
> +		select BR2_GCC_SUPPORTS_GRAPHITE
>  		bool "gcc 4.9-microblaze"
>  
>  	config BR2_GCC_VERSION_SNAP
>  		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
>  		select BR2_GCC_NEEDS_MPC
> +		select BR2_GCC_SUPPORTS_GRAPHITE
>  		bool "gcc snapshot"
>  endchoice
>  
> @@ -147,6 +157,12 @@ config BR2_INSTALL_FORTRAN
>  	  cross-compiler, and install the Fortran runtime to the
>  	  target.
>  
> +config BR2_GCC_ENABLE_GRAPHITE
> +	bool "Enable compiler graphite optimisations"
> +	depends on BR2_GCC_SUPPORTS_GRAPHITE
> +	help
> +	  Enable the compiler to support graphite optimisations
> +
>  config BR2_GCC_ENABLE_TLS
>  	bool "Enable compiler tls support" if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
>  	default y
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index 32219cc..c05a824 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -156,6 +156,16 @@ HOST_GCC_COMMON_DEPENDENCIES += host-mpc
>  HOST_GCC_COMMON_CONF_OPT += --with-mpc=$(HOST_DIR)/usr
>  endif
>  
> +ifeq ($(BR2_GCC_ENABLE_GRAPHITE),y)
> +HOST_GCC_COMMON_DEPENDENCIES += \
> +	host-isl \
> +	host-cloog
> +
> +#This is needed as with-isl doesn't work
> +HOST_GCC_COMMON_CONF_OPT += \
> +	--disable-isl-version-check
> +endif
> +
>  ifneq ($(BR2_arc)$(BR2_GCC_VERSION_SNAP),)
>  HOST_GCC_COMMON_DEPENDENCIES += host-flex host-bison
>  endif
> -- 
> 1.9.3
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
