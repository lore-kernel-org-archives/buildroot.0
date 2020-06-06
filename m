From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 6 Jun 2020 23:15:47 +0200
Subject: [Buildroot] [PATCH] package/armadillo: allows to select between
 clapack or lapack as BLAS and LAPACK provider
In-Reply-To: <20200513145926.1673064-1-gwenj@trabucayre.com>
References: <20200513145926.1673064-1-gwenj@trabucayre.com>
Message-ID: <4c972069-39f2-0c2c-e4f1-86ec337a1dd4@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gwenhael,

Le 13/05/2020 ? 16:59, Gwenhael Goavec-Merou a ?crit?:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> armadillo can use clapack or lapack as BLAS and LAPACK provider.
> This patch
> - adds two hidden variable to check dependencies/requirement for each of them
> - a choice to select wich implementation to use, by default use on clapack
>  when it's possible, else lapack

Last year we discussed about dropping clapack since it's outdated

"The last release is version 3.2.1 when lapack is at version 3.8.0"

Since then, lapack has been updated to 3.9.0.

At some point we should remove clapack even if it's the only "lapack" provider
that doesn't depend on Fortran compiler [2].

armadillo should also work with openblas since it bundle a version of lapack.

[1] http://lists.busybox.net/pipermail/buildroot/2019-August/256653.html
[2] http://lists.busybox.net/pipermail/buildroot/2019-August/256459.html

Best regards,
Romain

> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
>  package/armadillo/Config.in    | 41 +++++++++++++++++++++++++++++++---
>  package/armadillo/armadillo.mk |  7 +++++-
>  2 files changed, 44 insertions(+), 4 deletions(-)
> 
> diff --git a/package/armadillo/Config.in b/package/armadillo/Config.in
> index b2b61a3233..964a380d5e 100644
> --- a/package/armadillo/Config.in
> +++ b/package/armadillo/Config.in
> @@ -1,3 +1,12 @@
> +config BR2_PACKAGE_ARMADILLO_CLAPACK_SUPPORTS
> +	bool
> +	default y if (!BR2_m68k_cf && (!BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC))
> +
> +config BR2_PACKAGE_ARMADILLO_LAPACK_SUPPORTS
> +	bool
> +	default y if BR2_TOOLCHAIN_HAS_FORTRAN && \
> +		!(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)
> +
>  comment "armadillo needs a toolchain w/ C++"
>  	depends on !BR2_INSTALL_LIBSTDCPP
>  	depends on !BR2_powerpc
> @@ -10,11 +19,37 @@ comment "armadillo needs a glibc toolchain w/ C++"
>  config BR2_PACKAGE_ARMADILLO
>  	bool "armadillo"
>  	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on !BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC # clapack
> -	depends on !BR2_m68k_cf # clapack
> -	select BR2_PACKAGE_CLAPACK
> +	depends on BR2_PACKAGE_ARMADILLO_CLAPACK_SUPPORTS || \
> +		BR2_PACKAGE_ARMADILLO_LAPACK_SUPPORTS
> +
>  	help
>  	  Armadillo: An Open Source C++ Linear Algebra Library for
>  	  Fast Prototyping and Computationally Intensive Experiments.
>  
>  	  http://arma.sourceforge.net/
> +
> +if BR2_PACKAGE_ARMADILLO
> +
> +choice
> +	prompt "blas library"
> +	default BR2_PACKAGE_ARMADILLO_CLAPACK if \
> +		BR2_PACKAGE_ARMADILLO_CLAPACK_SUPPORTS
> +	default BR2_PACKAGE_ARMADILLO_LAPACK if \
> +		BR2_PACKAGE_ARMADILLO_LAPACK_SUPPORTS && \
> +		!BR2_PACKAGE_ARMADILLO_CLAPACK_SUPPORTS
> +	help
> +	  Selects blas library to use
> +
> +config BR2_PACKAGE_ARMADILLO_CLAPACK
> +	bool "clapack"
> +	depends on BR2_PACKAGE_ARMADILLO_CLAPACK_SUPPORTS
> +	select BR2_PACKAGE_CLAPACK
> +
> +config BR2_PACKAGE_ARMADILLO_LAPACK
> +	bool "lapack"
> +	depends on BR2_PACKAGE_ARMADILLO_LAPACK_SUPPORTS
> +	select BR2_PACKAGE_LAPACK
> +
> +endchoice
> +
> +endif
> diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
> index f693d8c946..03fd020267 100644
> --- a/package/armadillo/armadillo.mk
> +++ b/package/armadillo/armadillo.mk
> @@ -7,11 +7,16 @@
>  ARMADILLO_VERSION = 9.850.1
>  ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
>  ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
> -ARMADILLO_DEPENDENCIES = clapack
>  ARMADILLO_INSTALL_STAGING = YES
>  ARMADILLO_LICENSE = Apache-2.0
>  ARMADILLO_LICENSE_FILES = LICENSE.txt
>  
> +ifeq ($(BR2_PACKAGE_ARMADILLO_CLAPACK), y)
> +ARMADILLO_DEPENDENCIES = clapack
> +else
> +ARMADILLO_DEPENDENCIES = lapack
> +endif
> +
>  ARMADILLO_CONF_OPTS = -DDETECT_HDF5=false
>  
>  $(eval $(cmake-package))
> 
