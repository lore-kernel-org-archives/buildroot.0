From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 7 Nov 2016 23:25:17 +0100
Subject: [Buildroot] [PATCH v4 06/22]
 toolchain-external-codesourcery-aarch64: new package
In-Reply-To: <20161107012017.22505-7-arnout@mind.be>
References: <20161107012017.22505-1-arnout@mind.be>
 <20161107012017.22505-7-arnout@mind.be>
Message-ID: <5d3c032e-f923-5364-fbbf-290627019bce@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Le 07/11/2016 ? 02:20, Arnout Vandecappelle (Essensium/Mind) a ?crit :
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> This commit adds a new package for the Sourcery CodeBench external
> toolchain for the AArch64 architecture.
> 
> The legacy implementation is removed.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> ---
> v4: add PREFIX definition, remove legacy implementation.
> ---
>  toolchain/toolchain-external/Config.in             | 21 ++-------------------
>  .../Config.in                                      | 17 +++++++++++++++++
>  .../Config.in.options                              |  9 +++++++++
>  .../toolchain-external-codesourcery-aarch64.hash   |  3 +++
>  .../toolchain-external-codesourcery-aarch64.mk     | 22 ++++++++++++++++++++++
>  .../toolchain-external/toolchain-external.hash     |  3 ---
>  toolchain/toolchain-external/toolchain-external.mk | 11 -----------
>  7 files changed, 53 insertions(+), 33 deletions(-)
>  create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in
>  create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in.options
>  create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.hash
>  create mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.mk
> 
> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index 096f435..ecf9618 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -13,6 +13,7 @@ comment "glibc toolchains only available with shared lib support"
>  
>  # Aarch64 (use Linaro toolchain by default)
>  source "toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in"
> +source "toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in"
>  
>  comment "Linaro toolchains available for Cortex-A + EABIhf"
>  	depends on BR2_arm || BR2_armeb
> @@ -491,24 +492,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
>  	  Toolchain for the Blackfin architecture, from
>  	  http://blackfin.uclinux.org.
>  
> -config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
> -	bool "CodeSourcery AArch64 2014.11"
> -	depends on BR2_aarch64
> -	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> -	depends on !BR2_STATIC_LIBS
> -	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_HAS_SSP
> -	select BR2_INSTALL_LIBSTDCPP
> -	select BR2_HOSTARCH_NEEDS_IA32_LIBS
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> -	help
> -	  Sourcery CodeBench toolchain for the AArch64 architecture,
> -	  from Mentor Graphics. It uses gcc 4.9.1, binutils
> -	  2.24.51.20140217, glibc 2.20, gdb 7.7.50 and kernel headers
> -	  3.16.2.
> -
>  config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
>  	bool "Musl 1.1.12 toolchain"
>  	depends on (BR2_arm && BR2_ARM_EABI && BR2_USE_MMU) || \
> @@ -618,7 +601,6 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
>  	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
>  	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
>  	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE
> -	default "aarch64-amd-linux-gnu"  if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
>  	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
>  	default "nios2-linux-gnu"        if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
>  	default "sh-linux-gnu"           if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH
> @@ -670,6 +652,7 @@ config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
>  
>  # Aarch64
>  source "toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in.options"
> +source "toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in.options"
>  
>  if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
>  
> diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in
> new file mode 100644
> index 0000000..2fbb218
> --- /dev/null
> +++ b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
> +	bool "CodeSourcery AArch64 2014.11"
> +	depends on BR2_aarch64
> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +	depends on !BR2_STATIC_LIBS
> +	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> +	select BR2_TOOLCHAIN_HAS_SSP
> +	select BR2_INSTALL_LIBSTDCPP
> +	select BR2_HOSTARCH_NEEDS_IA32_LIBS
> +	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +	help
> +	  Sourcery CodeBench toolchain for the AArch64 architecture,
> +	  from Mentor Graphics. It uses gcc 4.9.1, binutils
> +	  2.24.51.20140217, glibc 2.20, gdb 7.7.50 and kernel headers
> +	  3.16.2.
> diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in.options b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in.options
> new file mode 100644
> index 0000000..1eab839
> --- /dev/null
> +++ b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in.options
> @@ -0,0 +1,9 @@
> +if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
> +
> +config BR2_TOOLCHAIN_EXTERNAL_PREFIX
> +	default "aarch64-amd-linux-gnu"
> +
> +config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
> +	default "toolchain-external-codesourcery-aarch64"
> +
> +endif
> diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.hash b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.hash
> new file mode 100644
> index 0000000..f7d3f29
> --- /dev/null
> +++ b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256 405aada821146755c5f2df566375c2a682456d6b8451ee47b88cf1a52b093676  aarch64-amd-2014.11-95-aarch64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
> +sha256 3f50dd6ee433eb5b6992a1071b988e50379a738f54f58722bc60081613764716  aarch64-amd-2014.11-95-aarch64-amd-linux-gnu.src.tar.bz2
> diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.mk b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.mk
> new file mode 100644
> index 0000000..bc58c44
> --- /dev/null
> +++ b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/toolchain-external-codesourcery-aarch64.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# toolchain-external-codesourcery-aarch64
> +#
> +################################################################################
> +
> +TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_SITE = http://sourcery.mentor.com/public/gnu_toolchain/$(TOOLCHAIN_EXTERNAL_PREFIX)
> +TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_VERSION = 2014.11-95
> +TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_SOURCE = aarch64-amd-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX)-i686-pc-linux-gnu.tar.bz2
> +TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_ACTUAL_SOURCE_TARBALL = aarch64-amd-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX).src.tar.bz2
> +
> +define TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_STAGING_FIXUP
> +	ln -sf ld-2.20.so $(STAGING_DIR)/lib/ld-linux-aarch64.so.1
> +endef
> +TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_STAGING_FIXUP
> +
> +define TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_TARGET_FIXUP
> +	ln -sf ld-2.20.so $(TARGET_DIR)/lib/ld-linux-aarch64.so.1
> +endef
> +TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_POST_INSTALL_TARGET_HOOKS += TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_TARGET_FIXUP
> +
> +$(eval $(toolchain-external-package))
> diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
> index fd1bc6d..666cd02 100644
> --- a/toolchain/toolchain-external/toolchain-external.hash
> +++ b/toolchain/toolchain-external/toolchain-external.hash
> @@ -21,9 +21,6 @@ sha256 1a9519e415a1e6892c760bf21f7e98f3a633a9d1c5bb8781a96d338e4dd62717  ia32-20
>  # AMD64
>  sha256 3c31206c8b9277f409ee00e4777ba82dfa6da2a4ca0926501cd5fb6bbd1b407e  amd-2015.11-139-x86_64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
>  sha256 0b673f5035f97d5d03c31272cddab0f117d39ad76a5ad2a3bc98c156571527de  amd-2015.11-139-x86_64-amd-linux-gnu.src.tar.bz2
> -# Aarch64
> -sha256 405aada821146755c5f2df566375c2a682456d6b8451ee47b88cf1a52b093676  aarch64-amd-2014.11-95-aarch64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
> -sha256 3f50dd6ee433eb5b6992a1071b988e50379a738f54f58722bc60081613764716  aarch64-amd-2014.11-95-aarch64-amd-linux-gnu.src.tar.bz2
>  # MIPS
>  sha256 d354447c4c5160439dafd5464fa3a0266dd41e79f973477238e4f0215a6b5397  mips-2016.05-8-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
>  sha256 2658e55d5b71bba25d6f77e868e18b200ea5f75c8add7ed3a9266e716d9adfff  mips-2016.05-8-mips-linux-gnu.src.tar.bz2
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index 8a3e4da..2571539 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -148,17 +148,6 @@ TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2014R1-RC2.i386.tar.bz2
>  TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2014R1-RC2.i386.tar.bz2
>  TOOLCHAIN_EXTERNAL_STRIP_COMPONENTS = 3
>  TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += TOOLCHAIN_EXTERNAL_BLACKFIN_UCLIBC_EXTRA_EXTRACT
> -else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64),y)
> -TOOLCHAIN_EXTERNAL_SITE = http://sourcery.mentor.com/public/gnu_toolchain/aarch64-amd-linux-gnu
> -TOOLCHAIN_EXTERNAL_SOURCE = aarch64-amd-2014.11-95-aarch64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
> -define TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_STAGING_FIXUP
> -	ln -sf ld-2.20.so $(STAGING_DIR)/lib/ld-linux-aarch64.so.1
> -endef
> -TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_STAGING_FIXUP
> -define TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_TARGET_FIXUP
> -	ln -sf ld-2.20.so $(TARGET_DIR)/lib/ld-linux-aarch64.so.1
> -endef
> -TOOLCHAIN_EXTERNAL_POST_INSTALL_TARGET_HOOKS += TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_TARGET_FIXUP
>  else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS),y)
>  TOOLCHAIN_EXTERNAL_VERSION = 1.1.12
>  TOOLCHAIN_EXTERNAL_SITE = https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0/musl-$(TOOLCHAIN_EXTERNAL_VERSION)
> 
