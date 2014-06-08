From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 8 Jun 2014 18:49:31 +0200
Subject: [Buildroot] [PATCH 10/11] toolchain-external: add CodeSourcery
 PowerPC 2012.03
In-Reply-To: <1401619668-28062-11-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1401619668-28062-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1401619668-28062-11-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140608164931.GM3266@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-06-01 12:47 +0200, Thomas Petazzoni spake thusly:
> However, this toolchain is only usable for e500v2 with the SPE ABI.

However, this toolchain is not available...

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  toolchain/toolchain-external/Config.in             | 19 +++++++++++++++++++
>  toolchain/toolchain-external/toolchain-external.mk |  3 +++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index 3331b69..7d086ef 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -416,6 +416,24 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
>  	  from Mentor Graphics. It uses gcc 4.7.3, binutils 2.23.52,
>  	  glibc 2.17, gdb 7.4.50 and kernel headers 3.7.0.
>  
> +config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201203
> +	bool "Sourcery CodeBench PowerPC 2012.03"
> +	depends on BR2_powerpc
> +	depends on BR2_powerpc_SPE
> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +	depends on !BR2_PREFER_STATIC_LIB
> +	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> +	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
> +	select BR2_INSTALL_LIBSTDCPP
> +	select BR2_HOSTARCH_NEEDS_IA32_LIBS
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
> +	help
> +	  Sourcery CodeBench toolchain for the PowerPC architecture,
> +	  from Mentor Graphics. It uses gcc 4.6.3, binutils 2.21.53,
> +	  glibc 2.15, gdb 7.2.50 and kernel headers 3.2.10. It has
> +	  support for the following variants:
> +	    - e500v2 glibc, SPE, 32 bits
> +
>  config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103
>  	bool "Sourcery CodeBench PowerPC 2011.03"
>  	depends on BR2_powerpc
> @@ -883,6 +901,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
>  	default "nios2-linux-gnu"        if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
>  	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
>  	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103
> +	default "powerpc-mentor-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201203
>  	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
>  	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201203
>  	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201209
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index 50e8dca..163428f 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -302,6 +302,9 @@ TOOLCHAIN_EXTERNAL_SOURCE = freescale-2010.09-55-powerpc-linux-gnu-i686-pc-linux
>  else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103),y)
>  TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/powerpc-linux-gnu/
>  TOOLCHAIN_EXTERNAL_SOURCE = freescale-2011.03-38-powerpc-linux-gnu-i686-pc-linux-gnu.tar.bz2
> +else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201203),y)
> +TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/powerpc-linux-gnu/
> +TOOLCHAIN_EXTERNAL_SOURCE = mentor-2012.03-71-powerpc-mentor-linux-gnu-i686-pc-linux-gnu.tar.bz2

wget "${TOOLCHAIN_EXTERNAL_SITE}${TOOLCHAIN_EXTERNAL_SOURCE}"
 --> 404

Regards,
Yann E. MORIN.

>  else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103),y)
>  TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/sh-linux-gnu/
>  TOOLCHAIN_EXTERNAL_SOURCE = renesas-2011.03-37-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
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
