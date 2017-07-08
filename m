From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 8 Jul 2017 18:34:14 +0200
Subject: [Buildroot] [PATCH 3/4 v2] arch/arm: add big.LITTLE cpu variants
In-Reply-To: <70c16aef44c02691ddfef07f5f1a99c7b7355d30.1499522760.git.yann.morin.1998@free.fr>
References: <cover.1499522760.git.yann.morin.1998@free.fr>
 <70c16aef44c02691ddfef07f5f1a99c7b7355d30.1499522760.git.yann.morin.1998@free.fr>
Message-ID: <72f8e309-5735-0cb5-9ca0-65c2a43892df@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-07-17 16:08, Yann E. MORIN wrote:
> The big.LITTLE configurations can be optimised for by gcc, and a few
> users wonder what they should choose when they have such CPUs.
> 
> Add new entries for those big.LITTLE configurations.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Baruch Siach <baruch@tkos.co.il>
[snip]
> +config BR2_cortex_a15_a7
> +	bool "cortex-A15/A7 big.LITTLE"
> +	select BR2_ARM_CPU_HAS_ARM
> +	select BR2_ARM_CPU_HAS_NEON
> +	select BR2_ARM_CPU_HAS_VFPV4
> +	select BR2_ARM_CPU_HAS_THUMB2
> +	select BR2_ARM_CPU_ARMV7A
> +	select BR2_ARCH_HAS_MMU_OPTIONAL

 Not for this patch, but: is this actually correct? Looking at the kernel's
arch/arm/Kconfig, I see that all the platforms that can be selected when MMU is
not selected are <= ARMv6. Well, I'm not entirely sure, it's a bit difficult to
map stuff like CPU_XSC3 on an ARM version.

> +	depends on !BR2_ARCH_IS_64
[snip]
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index 5dcaa03ff0..c072b78ae5 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -25,7 +25,8 @@ config BR2_GCC_VERSION_4_9_X
>  	# Broken or unsupported architectures
>  	depends on !BR2_arc && !BR2_bfin && !BR2_or1k
>  	# Broken or unsupported ARM cores
> -	depends on !BR2_cortex_a17 && !BR2_cortex_a72
> +	depends on !BR2_cortex_a17 && !BR2_cortex_a17_a7
> +	depends on !BR2_cortex_a72 && !BR2_cortex_a72_a53
>  	# Unsupported MIPS cores
>  	depends on !BR2_mips_interaptiv
>  	# Unsupported for MIPS R5
> @@ -45,6 +46,8 @@ config BR2_GCC_VERSION_5_X
>  	bool "gcc 5.x"
>  	# Broken or unsupported architectures
>  	depends on !BR2_arc && !BR2_bfin && !BR2_or1k
> +	# Broken or unsupported ARM cores
> +	depends on !BR2_cortex_a57_a53 && !BR2_cortex_a72_a53

 According to [1], a72.a53 was added in GCC 5. And a57.a53 was already added in
GCC 4.9 - is it broken in GCC 5?


>  	# musl ppc64 unsupported
>  	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64le))
>  	# Unsupported MIPS cores
> diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in
> index 2fbb218ecc..66a032e9ac 100644
> --- a/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in
> @@ -1,6 +1,8 @@
>  config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
>  	bool "CodeSourcery AArch64 2014.11"
>  	depends on BR2_aarch64
> +	# a57/a53 and a72/a53 appeared in gcc-6 or were broken before

 Ah, here you mention it. Better raise that to the commit message. Do you also
have a reference for it?


 Regards,
 Arnout


> +	depends on !BR2_cortex_a57_a53 && !BR2_cortex_a72_a53
[snip]

[1] https://gcc.gnu.org/gcc-5/changes.html

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
