From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 13 Nov 2015 12:13:10 +0200
Subject: [Buildroot] [PATCH] package/gauche: exclude build on archs not
 boehm gc ported
In-Reply-To: <201511131005.tADA5ZAn022684@ms-omx03.plus.so-net.ne.jp>
References: <201511131005.tADA5ZAn022684@ms-omx03.plus.so-net.ne.jp>
Message-ID: <20151113101310.GC23860@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Hiroshi Kawashima,

On Fri, Nov 13, 2015 at 07:05:35PM +0900, Hiroshi Kawashima wrote:
> This patch limits gauch build only on architectures boehm gc is ported.
> 
> Will fix:
> http://autobuild.buildroot.org/results/368/3681948013fcd39cc80b690b880924421e429c80//
> http://autobuild.buildroot.org/results/ba7/ba7eb5a878ec25033596dc7c9b0f4678d4a83de5//
> http://autobuild.buildroot.org/results/1cb/1cbf1ee5bde3d50b935ae8ba931c8d0cc1052acc//
> http://autobuild.buildroot.org/results/8af/8afb36606eabdc6ae6e65a28a11877af39f9a7e0//
> 
> Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
> ---
> diff --git a/package/gauche/Config.in b/package/gauche/Config.in
> index 0720672..ff1d0f6 100644
> --- a/package/gauche/Config.in
> +++ b/package/gauche/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_GAUCHE
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	depends on BR2_USE_MMU # fork()
>  	depends on BR2_ARCH_HAS_ATOMICS
> +	depends on BR2_PACKAGE_GAUCHE_ARCH_SUPPORTS
>  	help
>  	  Gauche is an R7RS Scheme implementation developed to be a
>  	  handy script interpreter, which allows programmers and
> @@ -13,6 +14,14 @@ config BR2_PACKAGE_GAUCHE
>  
>  	  http://practical-scheme.net/gauche/
>  
> +config BR2_PACKAGE_GAUCHE_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_arm || BR2_armeb || BR2_i386 || BR2_m68k || \
> +		BR2_mips || BR2_mipsel || BR2_mips64 || \
> +		BR2_mips64el || BR2_powerpc || BR2_powerpc64 || \
> +		BR2_powerpc64le || BR2_sh || BR2_sh64 || BR2_sparc || \
> +		BR2_sparc64 || BR2_x86_64
> +
>  comment "gauche needs a toolchain w/ NPTL"
>  	depends on BR2_USE_MMU
>  	depends on BR2_ARCH_HAS_ATOMICS

You should also add 'depends on BR2_PACKAGE_GAUCHE_ARCH_SUPPORTS' here. There 
is no point in showing this comment when the architecture itself is not 
supported, and the user can not usually change the architecture choice.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
