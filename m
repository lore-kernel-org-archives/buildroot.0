From: Romain Naour <romain.naour@smile.fr>
Date: Sat, 7 Apr 2018 17:26:09 +0200
Subject: [Buildroot] [PATCH 2/2] package/mesa3d: propagate llvm
 dependency on shared libs
In-Reply-To: <20180407083106.7772-2-valentin.korenblit@smile.fr>
References: <20180407083106.7772-1-valentin.korenblit@smile.fr>
 <20180407083106.7772-2-valentin.korenblit@smile.fr>
Message-ID: <eae5b269-d4f1-a6e9-dab4-920dd0b6db89@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Valentin,

Le 07/04/2018 ? 10:31, Valentin Korenblit a ?crit?:
> Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
> ---
>  package/mesa3d/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 8f347ffe0c..7dab883aad 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -33,12 +33,14 @@ config BR2_PACKAGE_MESA3D_LLVM
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
> +	depends on !BR2_STATIC_LIBS

As discussed privately, this patch must be squashed with the first one.
Otherwise, without this patch, BR2_PACKAGE_MESA3D_LLVM can select llvm package
when BR2_STATIC_LIBS is set.

I believe, this can be done by maintainers when merging.

Best regards,
Romain

>  	select BR2_PACKAGE_LLVM
>  
> -comment "llvm support needs a toolchain w/ threads, C++, gcc >= 4.8, host gcc >= 4.8"
> +comment "llvm support needs a toolchain w/ threads, C++, gcc >= 4.8, host gcc >= 4.8, dynamic library"
>  	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
> -		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
> +		|| BR2_STATIC_LIBS
>  
>  comment "llvm support needs a toolchain not affected by GCC bug 64735"
>  	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
> 
