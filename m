From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 4 Nov 2012 08:52:22 +0200
Subject: [Buildroot] [PATCH 15/18] toolchain-external: add Sourcery
 CodeBench SuperH 2012.03
In-Reply-To: <7e388c24997609bc09afc7b02be61de9651f9ef5.1351964808.git.thomas.petazzoni@free-electrons.com>
References: <cover.1351964808.git.thomas.petazzoni@free-electrons.com>
 <7e388c24997609bc09afc7b02be61de9651f9ef5.1351964808.git.thomas.petazzoni@free-electrons.com>
Message-ID: <20121104065221.GA32575@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Nov 03, 2012 at 06:48:00PM +0100, Thomas Petazzoni wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  toolchain/toolchain-external/Config.in   |   20 ++++++++++++++++++++
>  toolchain/toolchain-external/ext-tool.mk |    3 +++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index 96b689a..2bf4e0b 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -421,6 +421,25 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
>  	    - 970 glibc hard-float, 64 bits
>  	      Set BR2_TARGET_OPTIMIZATION to -m64
>  
> +config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201203
> +	bool "Sourcery CodeBench SH 2012.03"
> +	depends on BR2_sh4a || BR2_sh4aeb
> +	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> +	select BR2_INSTALL_LIBSTDCPP
> +	help
> +	  Sourcery CodeBench toolchain for the SuperH architecture,
> +	  from Mentor Graphics. It uses gcc 4.5.2, binutils 2.20,
> +	  glibc 2.13, uClibc 0.9.30, gdb 7.2.50 and kernel headers
> +	  2.6.38. It has support for the following variants:

According to 
https://sourcery.mentor.com/GNUToolchain/release2132?@template=datasheet this 
release contains gcc 4.6.3, binutils 2.21.53, and glibc 2.15. The "Getting 
Started" guild for this release also mentions kernel headers 3.2.10.

baruch

> +            - SH4A, glibc, little endian
> +              Default.
> +            - SH4A, glibc, big endian
> +              Add -mb to BR2_TARGET_OPTIMIZATION
> +            - SH4A, uClibc, little endian
> +              Not usable in Buildroot yet.
> +            - SH4A, uClibc, big endian
> +              Not usable in Buildroot yet.
> +
>  config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
>  	bool "Sourcery CodeBench SH 2011.03"
>  	depends on BR2_sh4a || BR2_sh4aeb
> @@ -671,6 +690,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
>  	default "powerpc-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103
>  	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
>  	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
> +	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201203
>  	default "sh-uclinux"             if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009
>  	default "sh-uclinux"             if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201103
>  	default "i686-pc-linux-gnu"	 if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201009
> diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
> index 459bc12..df1ef15 100644
> --- a/toolchain/toolchain-external/ext-tool.mk
> +++ b/toolchain/toolchain-external/ext-tool.mk
> @@ -226,6 +226,9 @@ TOOLCHAIN_EXTERNAL_SOURCE=renesas-2010.09-45-sh-linux-gnu-i686-pc-linux-gnu.tar.
>  else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103),y)
>  TOOLCHAIN_EXTERNAL_SITE=https://sourcery.mentor.com/sgpp/lite/superh/portal/package8759/public/sh-linux-gnu/
>  TOOLCHAIN_EXTERNAL_SOURCE=renesas-2011.03-37-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
> +else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201203),y)
> +TOOLCHAIN_EXTERNAL_SITE=https://sourcery.mentor.com/GNUToolchain/package10148/public/sh-linux-gnu/
> +TOOLCHAIN_EXTERNAL_SOURCE=renesas-2012.03-35-sh-linux-gnu-i686-pc-linux-gnu.tar.bz2
>  else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009),y)
>  TOOLCHAIN_EXTERNAL_SITE=http://sourcery.mentor.com/sgpp/lite/superh/portal/package7859/public/sh-uclinux/
>  TOOLCHAIN_EXTERNAL_SOURCE=renesas-2010.09-60-sh-uclinux-i686-pc-linux-gnu.tar.bz2
> -- 
> 1.7.9.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
