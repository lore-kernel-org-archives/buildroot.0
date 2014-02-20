From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Feb 2014 07:20:46 +0100
Subject: [Buildroot] [PATCH] webkit: disable on < ARMv5t
In-Reply-To: <1392847730-14412-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1392847730-14412-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <53059EBE.6030902@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/02/14 23:08, Thomas Petazzoni wrote:
> webkit needs the ARM blx instruction, which is only available on >=
> ARMv5t, so we have to make sure the webkit package cannot be enabled
> on < ARMv5t. In order to achieve this, this commit introduces the
> BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS hidden Config.in knob, which avoids
> duplicating all over the place the complex architecture dependencies
> of webkit.
> 
> Fixes:
> 
>   http://autobuild.buildroot.org/results/fdf/fdf8bc7660ac251792d0542d2729ea22753d3789/build-end.log
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/midori/Config.in |  6 ++----
>  package/webkit/Config.in | 14 ++++++++++----
>  2 files changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/package/midori/Config.in b/package/midori/Config.in
> index a684376..c3b5a1b 100644
> --- a/package/midori/Config.in
> +++ b/package/midori/Config.in
> @@ -8,15 +8,13 @@ config BR2_PACKAGE_MIDORI
>  	depends on BR2_INSTALL_LIBSTDCPP # webkit
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # webkit -> enchant -> libglib2
>  	depends on BR2_USE_WCHAR	 # webkit
> -	depends on (BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || BR2_mipsel || \
> -		    BR2_powerpc || BR2_sh || BR2_sparc || BR2_x86_64) # webkit
> +	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
>  	help
>  	  Midori is a lightweight web browser based on WebKit
>  
>  	  http://software.twotoasts.de/?page=midori
>  
>  comment "midori needs libgtk2 and a toolchain w/ C++, wchar, threads"
> -	depends on (BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || BR2_mipsel || \
> -		    BR2_powerpc || BR2_sh || BR2_sparc || BR2_x86_64)
> +	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
>  		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_LIBGTK2
> diff --git a/package/webkit/Config.in b/package/webkit/Config.in
> index 0207a6d..daaec36 100644
> --- a/package/webkit/Config.in
> +++ b/package/webkit/Config.in
> @@ -1,11 +1,18 @@
> +config BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
> +	bool
> +	# ARM needs BLX, so v5t+
> +	default y if (BR2_arm || BR2_armeb) && \
> +		!(BR2_arm7tdmi || BR2_arm720t || BR2_arm920t || BR2_arm922t || BR2_fa526)
> +	default y if BR2_i386 || BR2_mips || BR2_mipsel || \
> +		BR2_powerpc || BR2_sh || BR2_sparc || BR2_x86_64

 We normally write

	depends on FOO
	depends on BAR

rather than

	depends on FOO && BAR

 Shouldn't we do the same here?

	default y if BR2_i386
	default y if BR2_mips


 Regards,
 Arnout

> +
>  config BR2_PACKAGE_WEBKIT
>  	bool "webkit"
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_USE_WCHAR # enchant -> libglib2
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # enchant -> libglib2
>  	depends on BR2_PACKAGE_LIBGTK2
> -	depends on (BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || BR2_mipsel || \
> -		    BR2_powerpc || BR2_sh || BR2_sparc || BR2_x86_64)
> +	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
>  	select BR2_PACKAGE_CAIRO_PNG
>  	select BR2_PACKAGE_ENCHANT
>  	select BR2_PACKAGE_HARFBUZZ
> @@ -29,7 +36,6 @@ config BR2_PACKAGE_WEBKIT
>  	  http://webkit.org/
>  
>  comment "webkit needs libgtk2 and a toolchain w/ C++, wchar, threads"
> -	depends on (BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || BR2_mipsel || \
> -		    BR2_powerpc || BR2_sh || BR2_sparc || BR2_x86_64)
> +	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
>  	depends on !BR2_PACKAGE_LIBGTK2 || !BR2_INSTALL_LIBSTDCPP || \
>  		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
