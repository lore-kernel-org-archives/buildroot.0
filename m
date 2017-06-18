From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jun 2017 11:09:40 +0200
Subject: [Buildroot] [PATCH 03/14] toolchain: remove CodeSourcery sh
 toolchain
In-Reply-To: <0fa55d92e86e034d134945a6950229963712102c.1497583686.git.baruch@tkos.co.il>
References: <cover.1497583686.git.baruch@tkos.co.il>
 <0fa55d92e86e034d134945a6950229963712102c.1497583686.git.baruch@tkos.co.il>
Message-ID: <20170618090940.GC2918@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2017-06-16 06:32 +0300, Baruch Siach spake thusly:
> Since glibc 2.17, executable link command need not include the -lrt option for
> clock_* system calls. As a result, over time less and less software packages
> bother to check whether to toolchain needs -lrt. We are now at a point where
> maintainers refuse to add this complexity into their build system. This
> requires Buildroot to carry patches fixing this issue indefinitely.
> 
> glibc 2.17 is now 4.5 years old. There is no reason to use an older version
> with current software.
> 
> This commit removes the predefined profile for CodeSourcery sh toolchain that
> is based on glibc 2.16. One may still use the custom external toolchain
> support in Buildroot to get this toolchain back, and deal with any build
> issues that this toolchain causes.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  Config.in.legacy                                   |  9 ++++++++
>  toolchain/toolchain-external/Config.in             |  6 ------
>  .../toolchain-external-codesourcery-sh/Config.in   | 25 ----------------------
>  .../Config.in.options                              |  9 --------
>  .../toolchain-external-codesourcery-sh.hash        |  3 ---
>  .../toolchain-external-codesourcery-sh.mk          | 13 -----------
>  6 files changed, 9 insertions(+), 56 deletions(-)
>  delete mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in
>  delete mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in.options
>  delete mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-sh/toolchain-external-codesourcery-sh.hash
>  delete mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-sh/toolchain-external-codesourcery-sh.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index b851af2017b5..9af0e1516ce8 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -145,6 +145,15 @@ endif
>  ###############################################################################
>  comment "Legacy options removed in 2017.08"
>  
> +config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
> +	bool "SH Sourcery toolchain has been removed"
> +	select BR2_LEGACY
> +	help
> +	  The Sourcery CodeBench toolchain for the sh architecture has
> +	  been removed, since it uses glibc older than 2.17 that requires
> +	  -lrt to link executables using clock_* system calls. This makes
> +	  this toolchain difficult to maintain over time.
> +
>  config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86
>  	bool "x86 Sourcery toolchain has been removed"
>  	select BR2_LEGACY
> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index 75229bbddf47..4cd9ee4752cd 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -33,9 +33,6 @@ source "toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Confi
>  # NIOSII
>  source "toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in"
>  
> -# SH4a
> -source "toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in"
> -
>  # x86_64
>  source "toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in"
>  
> @@ -126,9 +123,6 @@ source "toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Confi
>  # NIOSII
>  source "toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in.options"
>  
> -# SH4a
> -source "toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in.options"
> -
>  # x86_64
>  source "toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in.options"
>  
> diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in
> deleted file mode 100644
> index a47dab7611f9..000000000000
> --- a/toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
> -	bool "Sourcery CodeBench SH 2012.09"
> -	depends on BR2_sh4a || BR2_sh4aeb
> -	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> -	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_SSP
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
> -	select BR2_INSTALL_LIBSTDCPP
> -	select BR2_HOSTARCH_NEEDS_IA32_LIBS
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
> -	help
> -	  Sourcery CodeBench toolchain for the SuperH architecture,
> -	  from Mentor Graphics. It uses gcc 4.7.2, binutils 2.23.51,
> -	  glibc 2.16, uClibc 0.9.30, gdb 7.4.50 and kernel headers
> -	  3.5.4. It has support for the following variants:
> -	    - SH4A, glibc, little endian
> -	      Default.
> -	    - SH4A, glibc, big endian
> -	      Add -mb to BR2_TARGET_OPTIMIZATION
> -	    - SH4A, uClibc, little endian
> -	      Not usable in Buildroot yet.
> -	    - SH4A, uClibc, big endian
> -	      Not usable in Buildroot yet.
> diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in.options b/toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in.options
> deleted file mode 100644
> index 90061cef49fd..000000000000
> --- a/toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in.options
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
> -
> -config BR2_TOOLCHAIN_EXTERNAL_PREFIX
> -	default "sh-linux-gnu"
> -
> -config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
> -	default "toolchain-external-codesourcery-sh"
> -
> -endif
> diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-sh/toolchain-external-codesourcery-sh.hash b/toolchain/toolchain-external/toolchain-external-codesourcery-sh/toolchain-external-codesourcery-sh.hash
> deleted file mode 100644
> index ff2ba5f473c4..000000000000
> --- a/toolchain/toolchain-external/toolchain-external-codesourcery-sh/toolchain-external-codesourcery-sh.hash
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# Locally calculated
> -sha256 59d6766fde244931aa52db01433d5acd051998762a931121c5fc109536a1a802  renesas-2012.09-61-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
> -sha256 e2e58c10e52395d5d35157e35f85233f713c6f9223a652dfc56194cfd2eed004  renesas-2012.09-61-sh-linux-gnu.src.tar.bz2
> diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-sh/toolchain-external-codesourcery-sh.mk b/toolchain/toolchain-external/toolchain-external-codesourcery-sh/toolchain-external-codesourcery-sh.mk
> deleted file mode 100644
> index 5370bb22a820..000000000000
> --- a/toolchain/toolchain-external/toolchain-external-codesourcery-sh/toolchain-external-codesourcery-sh.mk
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -################################################################################
> -#
> -# toolchain-external-sourcery-sh
> -#
> -################################################################################
> -
> -TOOLCHAIN_EXTERNAL_CODESOURCERY_SH_VERSION = 2012.09-61
> -
> -TOOLCHAIN_EXTERNAL_CODESOURCERY_SH_SITE = https://sourcery.mentor.com/public/gnu_toolchain/$(TOOLCHAIN_EXTERNAL_PREFIX)
> -TOOLCHAIN_EXTERNAL_CODESOURCERY_SH_SOURCE = renesas-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_SH_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX)-i686-pc-linux-gnu.tar.bz2
> -TOOLCHAIN_EXTERNAL_CODESOURCERY_SH_ACTUAL_SOURCE_TARBALL = renesas-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_SH_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX).src.tar.bz2
> -
> -$(eval $(toolchain-external-package))
> -- 
> 2.11.0
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
