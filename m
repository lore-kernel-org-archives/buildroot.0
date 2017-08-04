From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 4 Aug 2017 21:40:17 +0200
Subject: [Buildroot] [PATCH] gdb: drop support for Microblaze
In-Reply-To: <20170803215812.28951-1-thomas.petazzoni@free-electrons.com>
References: <20170803215812.28951-1-thomas.petazzoni@free-electrons.com>
Message-ID: <4461fa0d-7def-b676-52e2-f0e95e875a9e@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 03/08/2017 ? 23:58, Thomas Petazzoni a ?crit :
> Microblaze support was never upstreamed in gdb. We currently use a gdb
> from the Xilinx Github repository, but this gdb is based on 7.6, and
> has never been updated in the last 4 years. There are no other active
> branches at https://github.com/Xilinx/gdb/branches.
> 
> Xilinx has a slightly newer gdb, based on 7.7, available at
> https://github.com/Xilinx/meta-xilinx/tree/master/recipes-microblaze/gdb. However,
> it's apparently only available in the form of stack of big patches
> (https://github.com/Xilinx/meta-xilinx/tree/master/recipes-microblaze/gdb/files).
> 
> Currently, gdb on Microblaze fails to build in various conditions:
> 
>  * Against glibc, with "error: conflicting types for 'ps_lgetfpregs'"
> 
>  * Against musl, with "error: unknown type name 'elf_gregset_t'"
> 
> While those issues can probably be fixed, the fact that there is no
> active upstream significantly reduces the incentive to fix those
> problems.
> 
> Therefore, let's drop support for gdb on Microblaze entirely.

Acked-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/gdb/Config.in      | 5 +++--
>  package/gdb/Config.in.host | 5 ++---
>  package/gdb/gdb.hash       | 1 -
>  package/gdb/gdb.mk         | 6 ------
>  4 files changed, 5 insertions(+), 12 deletions(-)
> 
> diff --git a/package/gdb/Config.in b/package/gdb/Config.in
> index 67ef010..af020f4 100644
> --- a/package/gdb/Config.in
> +++ b/package/gdb/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_GDB_ARCH_SUPPORTS
>  	default y
>  	depends on !((BR2_arm || BR2_armeb) && BR2_BINFMT_FLAT)
>  	depends on !BR2_bfin
> +	depends on !BR2_microblaze
>  	depends on !BR2_nios2
>  	depends on !BR2_or1k
>  
> @@ -47,11 +48,11 @@ config BR2_PACKAGE_GDB_SERVER
>  config BR2_PACKAGE_GDB_DEBUGGER
>  	bool "full debugger"
>  	depends on BR2_USE_WCHAR
> -	depends on !BR2_sh && !BR2_microblaze
> +	depends on !BR2_sh
>  	select BR2_PACKAGE_NCURSES
>  
>  comment "full gdb on target needs a toolchain w/ wchar"
> -	depends on !BR2_sh && !BR2_microblaze
> +	depends on !BR2_sh
>  	depends on !BR2_USE_WCHAR
>  
>  if BR2_PACKAGE_GDB_DEBUGGER
> diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
> index 6a3037d..93dfa67 100644
> --- a/package/gdb/Config.in.host
> +++ b/package/gdb/Config.in.host
> @@ -7,6 +7,7 @@ config BR2_PACKAGE_HOST_GDB
>  	# toolchain should be used.
>  	depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
>  	depends on !((BR2_arm || BR2_armeb) && BR2_BINFMT_FLAT)
> +	depends on !BR2_microblaze
>  	depends on !BR2_nios2
>  	depends on !BR2_or1k
>  	help
> @@ -29,7 +30,7 @@ config BR2_PACKAGE_HOST_GDB_PYTHON
>  
>  config BR2_PACKAGE_HOST_GDB_SIM
>  	bool "Simulator support"
> -	depends on !BR2_arc && !BR2_microblaze
> +	depends on !BR2_arc
>  	help
>  	  This option enables the simulator support in the cross gdb.
>  
> @@ -37,7 +38,6 @@ choice
>  	prompt "GDB debugger Version"
>  	default BR2_GDB_VERSION_7_11
>  	depends on !BR2_arc
> -	depends on !BR2_microblaze
>  	help
>  	  Select the version of gdb you wish to use.
>  
> @@ -65,7 +65,6 @@ endif
>  config BR2_GDB_VERSION
>  	string
>  	default "arc-2017.03-gdb" if BR2_arc
> -	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
>  	default "7.10.1"   if BR2_GDB_VERSION_7_10
>  	default "7.11.1"   if BR2_GDB_VERSION_7_11 || !BR2_PACKAGE_HOST_GDB
>  	default "7.12.1"   if BR2_GDB_VERSION_7_12
> diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
> index 098d20a..a4fd8bc 100644
> --- a/package/gdb/gdb.hash
> +++ b/package/gdb/gdb.hash
> @@ -5,5 +5,4 @@ sha512  0ac8d0a495103611ef41167a08313a010dce6ca4c6d827cbe8558a0c1a1a8a6bfa53f1b7
>  sha512  e4044bdd162cbf95044ec1eaa44d2fa62a33e051bdbbacbc97afd4dfb07bae1bea514381fc1966aede89d6796ef2377a15748a93d95e2ad494c8497db489e886	gdb-8.0.tar.xz
>  
>  # Locally calculated (fetched from Github)
> -sha512  0a467091d4b01fbecabb4b8da1cb743025c70e7f4874a0b5c8fa2ec623569a39bde6762b91806de0be6e63711aeb6909715cfbe43860de73d8aec6159a9f10a7	gdb-6be65fb56ea6694a9260733a536a023a1e2d4d57.tar.gz
>  sha512  8ec849a5ea1c16f104c51c4813c35ab229e460eef0025967673b87316f62b5171f05448cda018464914d43d2da50b2902eb7f9f060d0af1368a9db111f959668	gdb-arc-2017.03-gdb.tar.gz
> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index 1fef0d4..7e86ba0 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -14,12 +14,6 @@ GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
>  GDB_FROM_GIT = y
>  endif
>  
> -ifeq ($(BR2_microblaze),y)
> -GDB_SITE = $(call github,Xilinx,gdb,$(GDB_VERSION))
> -GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
> -GDB_FROM_GIT = y
> -endif
> -
>  GDB_LICENSE = GPL-2.0+, LGPL-2.0+, GPL-3.0+, LGPL-3.0+
>  GDB_LICENSE_FILES = COPYING COPYING.LIB COPYING3 COPYING3.LIB
>  
> 
