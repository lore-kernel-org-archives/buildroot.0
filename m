From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 6 Jul 2016 21:50:47 +0200
Subject: [Buildroot] [PATCH] package/jemalloc: filter on suported
 architectures
In-Reply-To: <1467740148-10178-1-git-send-email-yann.morin.1998@free.fr>
References: <1467740148-10178-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <404a6790-8511-9442-96ce-4dd6863cd7a4@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Le 05/07/2016 ? 19:35, Yann E. MORIN a ?crit :
> jemalloc has a hard-coded list of supported architectures, which it uses
> to define the minimum alignment for allocations. It whines at build time
> (not at configure time) when it does not know that alignment.
> 
> Fix that by making jemalloc depend on the known-supported architectures.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/674/674b6022f9a403528a758c0785656d2bda79e0a9/

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/jemalloc/Config.in | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/package/jemalloc/Config.in b/package/jemalloc/Config.in
> index ff74387..a166821 100644
> --- a/package/jemalloc/Config.in
> +++ b/package/jemalloc/Config.in
> @@ -1,5 +1,15 @@
> +config BR2_PACKAGE_JEMALLOC_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_arm || BR2_armeb || BR2_aarch64 || BR2_aarch64_be
> +	default y if BR2_i386 || BR2_x86_64
> +	default y if BR2_mips || BR2_mipsel
> +	default y if BR2_sparc64
> +	default y if BR2_powerpc
> +	default y if BR2_sh && !BR2_sh2a
> +
>  config BR2_PACKAGE_JEMALLOC
>  	bool "jemalloc"
> +	depends on BR2_PACKAGE_JEMALLOC_ARCH_SUPPORTS
>  	depends on !BR2_STATIC_LIBS
>  	help
>  	 This library providing a malloc(3) implementation that emphasizes
> @@ -8,4 +18,5 @@ config BR2_PACKAGE_JEMALLOC
>  	 http://www.canonware.com/jemalloc/
>  
>  comment "jemalloc needs a toolchain w/ dynamic library"
> +	depends on BR2_PACKAGE_JEMALLOC_ARCH_SUPPORTS
>  	depends on BR2_STATIC_LIBS
> 
