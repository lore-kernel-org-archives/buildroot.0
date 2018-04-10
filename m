From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Apr 2018 17:51:48 +0200
Subject: [Buildroot] [PATCH] package/mesa3d: add dependency on elfutils
 to r600 with llvm
In-Reply-To: <20180410151959.18713-1-valentin.korenblit@smile.fr>
References: <20180410151959.18713-1-valentin.korenblit@smile.fr>
Message-ID: <20180410175148.71878897@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Valentin,

On Tue, 10 Apr 2018 17:19:59 +0200, Valentin Korenblit wrote:

> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index 1476b39acc..391a1cbaed 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -97,13 +97,28 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
>  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
>  	bool "Gallium Radeon R600 driver"
>  	depends on BR2_i386 || BR2_x86_64
> +	depends on !BR2_PACKAGE_MESA3D_LLVM

Why ?

>  	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>  	select BR2_PACKAGE_LIBDRM_RADEON
> -	select BR2_PACKAGE_LLVM_AMDGPU if BR2_PACKAGE_MESA3D_LLVM
>  	select BR2_PACKAGE_MESA3D_NEEDS_XA
>  	help
>  	  Driver for ATI/AMD Radeon R600/R700/HD5000/HD6000 GPUs.
>  
> +config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600_LLVM
> +	bool "Gallium Radeon R600 driver with LLVM support"
> +	depends on BR2_i386 || BR2_x86_64
> +	depends on BR2_PACKAGE_MESA3D_LLVM
> +	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
> +		BR2_TOOLCHAIN_USES_GLIBC # elfutils
> +	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> +	select BR2_PACKAGE_LIBDRM_RADEON
> +	select BR2_PACKAGE_LLVM_AMDGPU
> +	select BR2_PACKAGE_ELFUTILS
> +	select BR2_PACKAGE_MESA3D_NEEDS_XA
> +	help
> +	  Driver for ATI/AMD Radeon R600/R700/HD5000/HD6000 GPUs
> +	  with LLVM support.

I don't understand why you have two mutually exclusive options here.
Why not instead have a sub-option ?

Something like:

config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
        bool "Gallium Radeon R600 driver"
        depends on BR2_i386 || BR2_x86_64
        select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
        select BR2_PACKAGE_LIBDRM_RADEON
        select BR2_PACKAGE_MESA3D_NEEDS_XA
        help
          Driver for ATI/AMD Radeon R600/R700/HD5000/HD6000 GPUs.

config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600_LLVM
	bool "Enable LLVM support in R600 driver"
	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
	depends on BR2_PACKAGE_MESA3D_LLVM
	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
	select BR2_PACKAGE_LLVM_AMDGPU
	select BR2_PACKAGE_ELFUTILS

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
