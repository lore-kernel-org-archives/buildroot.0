From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 8 Jun 2014 18:19:46 +0200
Subject: [Buildroot] [PATCH 04/11] toolchain-external: support only one
 Linaro AArch64 toolchain at a time
In-Reply-To: <1401619668-28062-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1401619668-28062-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1401619668-28062-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140608161946.GH3266@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-06-01 12:47 +0200, Thomas Petazzoni spake thusly:
> Linaro toolchains are released so frequently (every month) that it
> doesn't make much sense to support 3 consecutive versions. So, like we
> do for ARM big-endian, let's support only one version at a time.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  toolchain/toolchain-external/Config.in             | 34 ++--------------------
>  toolchain/toolchain-external/toolchain-external.mk | 10 +------
>  2 files changed, 3 insertions(+), 41 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index c187116..abecc6f 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -782,7 +782,7 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2
>  	  Toolchain for the Microblaze architecture, from
>  	  http://wiki.xilinx.com/mb-gnu-tools
>  
> -config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_14_02
> +config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
>  	bool "Linaro AArch64 14.02"
>  	depends on BR2_aarch64
>  	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> @@ -796,34 +796,6 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_14_02
>  	  Toolchain for the AArch64 architecture, from
>  	  http://www.linaro.org/engineering/armv8/
>  
> -config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_14_01
> -	bool "Linaro AArch64 14.01"
> -	depends on BR2_aarch64
> -	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> -	depends on !BR2_PREFER_STATIC_LIB
> -	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_INSTALL_LIBSTDCPP
> -	select BR2_HOSTARCH_NEEDS_IA32_LIBS
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
> -	help
> -	  Toolchain for the AArch64 architecture, from
> -	  http://www.linaro.org/engineering/armv8/
> -
> -config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_12
> -	bool "Linaro AArch64 13.12"
> -	depends on BR2_aarch64
> -	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> -	depends on !BR2_PREFER_STATIC_LIB
> -	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_INSTALL_LIBSTDCPP
> -	select BR2_HOSTARCH_NEEDS_IA32_LIBS
> -	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
> -	help
> -	  Toolchain for the AArch64 architecture, from
> -	  http://www.linaro.org/engineering/armv8/
> -
>  config BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS
>  	bool "Musl toolchain"
>  	depends on (BR2_arm && BR2_ARM_EABI) || (BR2_armeb && BR2_ARM_EABI) || \
> @@ -901,9 +873,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
>  	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201311
>  	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_201109
>  	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
> -	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_14_02
> -	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_14_01
> -	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_12
> +	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
>  	default "microblazeel-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_14_3
>  	default "microblazeel-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2
>  	default "microblaze-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_14_3
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index bb81f4c..1b19089 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -350,15 +350,7 @@ TOOLCHAIN_EXTERNAL_SOURCE = lin32-microblaze-unknown-linux-gnu_14.3_early.tar.xz
>  else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2),y)
>  TOOLCHAIN_EXTERNAL_SITE = http://sources.buildroot.net/
>  TOOLCHAIN_EXTERNAL_SOURCE = microblaze-unknown-linux-gnu.tgz
> -else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_12),y)
> -TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.12/components/toolchain/binaries/
> -TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.8-2013.12-linux.tar.xz
> -TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
> -else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_14_01),y)
> -TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.01/components/toolchain/binaries/
> -TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.8-2014.01_linux.tar.xz
> -TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
> -else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_14_02),y)
> +else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64),y)
>  TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.02/components/toolchain/binaries/
>  TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.8-2014.02_linux.tar.xz
>  TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SYMLINK
> -- 
> 1.9.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
