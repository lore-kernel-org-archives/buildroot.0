From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Dec 2019 22:26:12 +0100
Subject: [Buildroot] [PATCH 3/3] toolchain/ARC: Enable ability to build
 with upstream gcc/binutils
In-Reply-To: <20191206193924.18777-4-vgupta@synopsys.com>
References: <20191206193924.18777-1-vgupta@synopsys.com>
 <20191206193924.18777-4-vgupta@synopsys.com>
Message-ID: <20191206222612.6006c8ae@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  6 Dec 2019 11:39:24 -0800
Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:

> While ARC upstream gcc/binutils work, they are still trailing behind
> the more up to date code at github. To help expedite this gap, we want
> to test the upstreeam versiosn more often, hence this patch. It allows
> ARC tools to be built of upstream gcc/binutils.
> 
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> ---
>  arch/Config.in.arc              | 4 ++++
>  package/binutils/Config.in.host | 6 +++---
>  package/binutils/binutils.mk    | 2 +-
>  package/gcc/Config.in.host      | 4 ++--
>  4 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/Config.in.arc b/arch/Config.in.arc
> index fdfafda31c72..c389ba8b42c9 100644
> --- a/arch/Config.in.arc
> +++ b/arch/Config.in.arc
> @@ -59,6 +59,10 @@ config BR2_arc
>  	bool
>  	default y if BR2_arcle || BR2_arceb
>  
> +config BR2_arc_gh
> +	bool "ARC github tools"
> +	default y if BR2_arc

That's not how we want to handle this.

> +
>  config BR2_ENDIAN
>  	default "LITTLE" if BR2_arcle
>  	default "BIG"	 if BR2_arceb
> diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
> index 514f620086eb..78785878cecc 100644
> --- a/package/binutils/Config.in.host
> +++ b/package/binutils/Config.in.host
> @@ -7,8 +7,8 @@ config BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI
>  
>  choice
>  	prompt "Binutils Version"
> -	default BR2_BINUTILS_VERSION_2_32_X if !BR2_arc && !BR2_csky
> -	default BR2_BINUTILS_VERSION_ARC if BR2_arc
> +	default BR2_BINUTILS_VERSION_2_32_X if !BR2_arc_gh && !BR2_csky
> +	default BR2_BINUTILS_VERSION_ARC if BR2_arc_gh
>  	default BR2_BINUTILS_VERSION_CSKY if BR2_csky
>  	help
>  	  Select the version of binutils you wish to use.
> @@ -27,7 +27,7 @@ config BR2_BINUTILS_VERSION_2_33_X
>  
>  config BR2_BINUTILS_VERSION_ARC
>  	bool "binutils arc (2.31)"
> -	depends on BR2_arc
> +	depends on BR2_arc_gh

For binutils, you can already select any upstream version, or the ARC
specific version on ARC. So there is nothing to change here: you can
already select either upstream or ARC-specific.

> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index 92af40b19fc3..d9f4c6cae14b 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -2,7 +2,7 @@ comment "GCC Options"

Ditto for gcc, you can already chose any upstream gcc version >= 7.x
for ARC, or the ARC-specific version.

So, I don't understand what your patch brings: what you describe in
your commit log is already possible today.

The following defconfig is already possible with Buildroot today:

BR2_arcle=y
BR2_archs38=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_BINUTILS_VERSION_2_33_X=y
BR2_GCC_VERSION_9_X=y

It builds an ARC HS38 glibc toolchain with upstream gcc 9.x and
upstream binutils 2.33.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
