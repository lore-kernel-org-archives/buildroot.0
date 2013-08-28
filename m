From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Aug 2013 18:15:39 +0200
Subject: [Buildroot] [PATCH v2 2/2] toolchain-external: Add Sourcery
 CodeBench for Nios-II
In-Reply-To: <1377115128-29749-3-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1377115128-29749-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1377115128-29749-3-git-send-email-ezequiel.garcia@free-electrons.com>
Message-ID: <20130828181539.74d30a31@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ezequiel Garcia,

On Wed, 21 Aug 2013 16:58:48 -0300, Ezequiel Garcia wrote:
> From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> 
> This commit adds the pre-built Sourcery CodeBench toolchains
> currently available for the Nios-II architecture.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

I have a comment below, but I guess it can easily be fixed by Peter
when committing, unless Ezequiel wants to send an updated version to
fix it. Once it is fixed, this patch has my:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> +config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305_43

You should remove the _43 suffix here.

> +	bool "Sourcery CodeBench Nios-II 2013.05-43"

and here the -43 suffix.

> +	depends on BR2_nios2
> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> +	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
> +	select BR2_INSTALL_LIBSTDCPP
> +	select BR2_HOSTARCH_NEEDS_IA32_LIBS
> +	help
> +	  Sourcery CodeBench toolchain for the Nios-II architecture,
> +	  from Mentor Graphics. It uses gcc 4.7.3, binutils 2.23.52,
> +	  glibc 2.17, gdb 7.4.50 and kernel headers 3.7.0.
> +
>  config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103
>  	bool "Sourcery CodeBench PowerPC 2011.03"
>  	depends on BR2_powerpc
> @@ -818,6 +831,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
>  	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203
>  	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
>  	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305
> +	default "nios2-linux-gnu"        if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305_43

Ditto.

>  	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
>  	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103
>  	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
> diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
> index 01be85c..fd6bfea 100644
> --- a/toolchain/toolchain-external/ext-tool.mk
> +++ b/toolchain/toolchain-external/ext-tool.mk
> @@ -247,6 +247,9 @@ TOOLCHAIN_EXTERNAL_SOURCE = mips-2012.09-99-mips-linux-gnu-i686-pc-linux-gnu.tar
>  else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305),y)
>  TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/mips-linux-gnu/
>  TOOLCHAIN_EXTERNAL_SOURCE = mips-2013.05-36-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
> +else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305_43),y)

Same thing.

> +TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/nios2-linux-gnu/
> +TOOLCHAIN_EXTERNAL_SOURCE = sourceryg++-2013.05-43-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
>  else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009),y)
>  TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/powerpc-linux-gnu/
>  TOOLCHAIN_EXTERNAL_SOURCE = freescale-2010.09-55-powerpc-linux-gnu-i686-pc-linux-gnu.tar.bz2

This allows to be consistent with what we do for the other
external toolchains. The Config.in options designates the version of
the toolchain without the patch level.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
