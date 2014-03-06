From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 06 Mar 2014 08:17:20 +0100
Subject: [Buildroot] [PATCH 2/6] toolchain-external: add publicly
 available musl toolchains
In-Reply-To: <1394058220-5863-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1394058220-5863-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1394058220-5863-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <53182100.8020505@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/03/14 23:23, Thomas Petazzoni wrote:
> This commit adds nine toolchains based on the musl C library that are
> publicly available from the musl-cross project. Note that toolchains
> prior to version 0.9.15 cannot be used in Buildroot because they don't
> have sysroot support.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  toolchain/toolchain-external/Config.in             | 148 +++++++++++++++++++++
>  toolchain/toolchain-external/toolchain-external.mk |  27 ++++
>  2 files changed, 175 insertions(+)
> 
> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index 7ad46c3..063df14 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -842,6 +842,145 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_09
>  	  Toolchain for the AArch64 architecture, from
>  	  http://www.linaro.org/engineering/armv8/
>  
> +config BR2_TOOLCHAIN_EXTERNAL_ARM_MUSL_CROSS
> +	bool "Musl ARM toolchain"
> +	depends on BR2_arm
> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"

 Not related to this patch, but why don't we move this depends to a
global if?

> +	select BR2_TOOLCHAIN_EXTERNAL_MUSL
> +	select BR2_INSTALL_LIBSTDCPP
> +	select BR2_HOSTARCH_NEEDS_IA32_LIBS
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
> +	help
> +	  ARM toolchain based on the Musl C library, provided by the
> +	  musl-cross project. It uses gcc 4.8.2, binutils 2.24 and
> +	  musl 0.9.15. It does not have a cross debugger included. The
> +	  toolchain is built for ARMv4t, soft-float.
> +
> +	  http://musl.codu.org/

 All this MUSL stuff looks exactly the same. Wouldn't it be possible to
have a single config option with a depends on BR2_arm || BR2_i386 || ... ?


 Regards,
 Arnout

> +
> +config BR2_TOOLCHAIN_EXTERNAL_X86_MUSL_CROSS
> +	bool "Musl x86 toolchain"
> +	# The toolchain is built for i486, so we exclude i386
> +	depends on BR2_i386 && !BR2_x86_i386
> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +	select BR2_TOOLCHAIN_EXTERNAL_MUSL
> +	select BR2_INSTALL_LIBSTDCPP
> +	select BR2_HOSTARCH_NEEDS_IA32_LIBS
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
> +	help
> +	  x86 toolchain based on the Musl C library, provided by the
> +	  musl-cross project. It uses gcc 4.8.2, binutils 2.24 and
> +	  musl 0.9.15. It does not have a cross debugger included. The
> +	  toolchain is built for i486.
> +
> +	  http://musl.codu.org/
> +
> +config BR2_TOOLCHAIN_EXTERNAL_MICROBLAZE_MUSL_CROSS
> +	bool "Musl Microblaze toolchain"
> +	depends on BR2_microblaze
> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +	select BR2_TOOLCHAIN_EXTERNAL_MUSL
> +	select BR2_INSTALL_LIBSTDCPP
> +	select BR2_HOSTARCH_NEEDS_IA32_LIBS
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
> +	help
> +	  Microblaze toolchain based on the Musl C library, provided
> +	  by the musl-cross project. It uses gcc 4.8.2, binutils 2.24
> +	  and musl 0.9.15. It does not have a cross debugger
> +	  included.
> +
> +	  http://musl.codu.org/

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
