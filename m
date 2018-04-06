From: Romain Naour <romain.naour@smile.fr>
Date: Fri, 6 Apr 2018 13:22:10 +0200
Subject: [Buildroot] [PATCH] package/llvm: add dependency on shared
 libraries
In-Reply-To: <20180406093958.9392-1-valentin.korenblit@smile.fr>
References: <20180406093958.9392-1-valentin.korenblit@smile.fr>
Message-ID: <e478cdf9-9852-4649-b282-15737de819d0@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Valentin,

Le 06/04/2018 ? 11:39, Valentin Korenblit a ?crit?:
> llvm generates libLLVM.so, so it won't work if BR2_STATIC_LIBS is set
> 
> Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
> ---
>  package/llvm/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/llvm/Config.in b/package/llvm/Config.in
> index 70f73f4858..d507acbef1 100644
> --- a/package/llvm/Config.in
> +++ b/package/llvm/Config.in
> @@ -18,6 +18,7 @@ config BR2_PACKAGE_LLVM
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on !BR2_STATIC_LIBS

This new dependency must be propagated to the comment below and other options
selecting llvm:

comment "llvm needs a toolchain w/ threads, C++, dynamic library, gcc >= 4.8,
host gcc >= 4.8"
	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
                !BR2_STATIC_LIBS \
		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8


>  	help
>  	  The LLVM Project is a collection of modular and reusable
>  	  compiler and toolchain technologies.
> 
