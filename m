From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 16 Nov 2015 08:02:34 +0100
Subject: [Buildroot] [PATCH v2] package/gauche: exclude build on archs
 not boehm gc ported
In-Reply-To: <201511131026.tADAQef8020593@ms-omx01.plus.so-net.ne.jp>
References: <201511131026.tADAQef8020593@ms-omx01.plus.so-net.ne.jp>
Message-ID: <56497F8A.2010400@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13-11-15 11:26, Hiroshi Kawashima wrote:
> This patch limits gauch build only on architectures boehm gc is ported.
> 
> Will fix:
> http://autobuild.buildroot.org/results/368/3681948013fcd39cc80b690b880924421e429c80//
> http://autobuild.buildroot.org/results/ba7/ba7eb5a878ec25033596dc7c9b0f4678d4a83de5//
> http://autobuild.buildroot.org/results/1cb/1cbf1ee5bde3d50b935ae8ba931c8d0cc1052acc//
> http://autobuild.buildroot.org/results/8af/8afb36606eabdc6ae6e65a28a11877af39f9a7e0//
> 
> Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>

 Minor nit, otherwise
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
> Change v1->v2:
> - add depends on BR2_PACKAGE_GAUCHE_ARCH_SUPPORTS on comment
> ---
> diff --git a/package/gauche/Config.in b/package/gauche/Config.in
> index 0720672..b574231 100644
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
> @@ -13,7 +14,16 @@ config BR2_PACKAGE_GAUCHE
>  
>  	  http://practical-scheme.net/gauche/
>  
> +config BR2_PACKAGE_GAUCHE_ARCH_SUPPORTS

 It would be good to add here:

	# From the bundled bwmgc

 Regards,
 Arnout

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
> +	depends on BR2_PACKAGE_GAUCHE_ARCH_SUPPORTS
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
> ============================================================
>     Hiroshi Kawashima
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
