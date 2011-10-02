From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 3 Oct 2011 00:28:37 +0200
Subject: [Buildroot] [PATCH 5/9] ext-toolchain: Add CodeSourcery SH
	GNU/Linux 2011.03
In-Reply-To: <3d4f1d5cfa5a643be95d5f5ffb8d0e235ca3ff8c.1317583191.git.thomas.petazzoni@free-electrons.com>
References: <cover.1317583191.git.thomas.petazzoni@free-electrons.com>
 <3d4f1d5cfa5a643be95d5f5ffb8d0e235ca3ff8c.1317583191.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201110030028.37488.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Sunday 02 October 2011 21:20:13 Thomas Petazzoni wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
But see below...

> ---
>  toolchain/toolchain-external/Config.in   |   16 ++++++++++++++++
>  toolchain/toolchain-external/ext-tool.mk |    3 +++
>  2 files changed, 19 insertions(+), 0 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index ac712ba..c50acc8 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -137,6 +137,21 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
>              - e500mc glibc, 32 bits
>              - 970 glibc hard-float, 64 bits
>  
> +config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
> +	bool "CodeSourcery SH 2011.03"
> +	depends on BR2_sh4a || BR2_sh4aeb
> +	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> +	select BR2_INSTALL_LIBSTDCPP
> +	help
> +	  Toolchain for the SuperH architecture, from CodeSourcery. It
> +	  uses gcc 4.5.2, binutils 2.20, glibc 2.13, uClibc 0.9.30,
> +	  gdb 7.2.50 and kernel headers 2.6.38. It has support for
> +	  the following variants:
> +            - SH4A, glibc, little endian
> +            - SH4A, glibc, big endian
> +            - SH4A, uClibc, little endian
> +            - SH4A, uClibc, big endian
> +
>  config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
>  	bool "CodeSourcery SH 2010.09"
>  	depends on BR2_sh4a || BR2_sh4aeb
> @@ -238,6 +253,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
>  	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201103
>  	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
>  	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
> +	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
>  	default "sh-uclinux"             if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009
>  	default "sh-uclinux"             if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201103

There is inconsistency in the SH? namings:
 - sh4a: _SH201009
 - sh2a: _SH2A_201009

Notice for sh2a we have an underscore between variant and version, but not
sh4a. Also, for sh2a, we have the full variant name, not for sh4a.

That's what caused my confusion earlier. Maybe we could clean this up
in a separate patch?

>  	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1 && !BR2_BFIN_FDPIC
> diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
> index c8a214d..2662520 100644
> --- a/toolchain/toolchain-external/ext-tool.mk
> +++ b/toolchain/toolchain-external/ext-tool.mk
> @@ -188,6 +188,9 @@ TOOLCHAIN_EXTERNAL_SOURCE=freescale-2010.09-55-powerpc-linux-gnu-i686-pc-linux-g
>  else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009),y)
>  TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/superh/portal/package7783/public/sh-linux-gnu/
>  TOOLCHAIN_EXTERNAL_SOURCE=renesas-2010.09-45-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
> +else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103),y)
> +TOOLCHAIN_EXTERNAL_SITE=https://sourcery.mentor.com/sgpp/lite/superh/portal/package8759/public/sh-linux-gnu/
> +TOOLCHAIN_EXTERNAL_SOURCE=renesas-2011.03-37-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
>  else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009),y)
>  TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/superh/portal/package7859/public/sh-uclinux/
>  TOOLCHAIN_EXTERNAL_SOURCE=renesas-2010.09-60-sh-uclinux-i686-pc-linux-gnu.tar.bz2

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
