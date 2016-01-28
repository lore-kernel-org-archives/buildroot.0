From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Jan 2016 23:31:59 +0100
Subject: [Buildroot] [PATCH v2 01/17] toolchain: add
 BR2_TOOLCHAIN_HAS_SYNC_x hidden booleans
In-Reply-To: <1453934861-26364-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453934861-26364-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453934861-26364-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160128223159.GE7523@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-01-27 23:47 +0100, Thomas Petazzoni spake thusly:
> Currently, Buildroot provides one BR2_ARCH_HAS_ATOMICS boolean option
> to indicate whether the architecture supports atomic operations or
> not. However, the reality of atomic operations support is much more
> complicated and requires more than one option to be expressed
> properly.
> 
> There are in fact two types of atomic built-ins provided by gcc:
> 
>  (1) The __sync_*() family of functions, which have been in gcc for a
>      long time (probably gcc 4.1). They are available in variants
>      operating on 1-byte, 2-byte, 4-byte and 8-byte integers. Some
>      architectures implement a number of variants, certain do not

s/certain/some/

>      implement any, certain architectures implement all of them.

s/certain architectures/some/  (indeed, no need to repeat 'architecture'
here, it's implicit here.)

[--SNIP--]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

With the above fixed:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  toolchain/toolchain-common.in | 65 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 
> diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
> index 014a23d..27ce33b 100644
> --- a/toolchain/toolchain-common.in
> +++ b/toolchain/toolchain-common.in
> @@ -313,3 +313,68 @@ config BR2_TOOLCHAIN_GCC_AT_LEAST
>  	default "4.5"	if BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
>  	default "4.4"	if BR2_TOOLCHAIN_GCC_AT_LEAST_4_4
>  	default "4.3"	if BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
> +
> +config BR2_TOOLCHAIN_HAS_SYNC_1
> +	bool
> +	default y
> +	depends on !BR2_x86_i386
> +	depends on !BR2_bfin
> +	depends on !BR2_microblaze
> +	depends on !BR2_sparc
> +	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT)
> +
> +config BR2_TOOLCHAIN_HAS_SYNC_2
> +	bool
> +	default y if BR2_TOOLCHAIN_HAS_SYNC_1
> +
> +config BR2_TOOLCHAIN_HAS_SYNC_4
> +	bool
> +	default y
> +	depends on !BR2_sparc
> +	depends on !BR2_x86_i386
> +	depends on !(BR2_arc && !BR2_ARC_ATOMIC_EXT)
> +
> +# The availability of __sync for 8-byte types on ARM is somewhat
> +# complicated:
> +#
> +#  - It appeared in gcc starting with gcc 4.7.
> +#
> +#  - On ARMv7, there is no problem, it can be directly implemented in
> +#    userspace.
> +#
> +#  - On < ARMv7, it requires help from the kernel. Unfortunately, the
> +#    libgcc code implementing 8-byte __sync with the help from the
> +#    kernel calls __write() when a failure occurs, which is a function
> +#    internal to glibc, not available in uClibc and musl. This means
> +#    that the 8-byte __sync operations are not available on < ARMv7
> +#    with uClibc and musl. This problem was fixed as part of gcc
> +#    PR68059, which was backported to the gcc 5 branch, but isn't yet
> +#    part of any gcc 5.x release.
> +#
> +config BR2_TOOLCHAIN_ARM_HAS_SYNC_8
> +	bool
> +	default y
> +	depends on BR2_arm || BR2_armeb
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
> +	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_ARM_CPU_ARMV7A
> +
> +# 8-byte intrinsics available on most x86 CPUs, except a few old ones
> +config BR2_TOOLCHAIN_X86_HAS_SYNC_8
> +	bool
> +	default y
> +	depends on BR2_i386
> +	depends on !BR2_x86_i386
> +	depends on !BR2_x86_i486
> +	depends on !BR2_x86_c3
> +	depends on !BR2_x86_winchip_c6
> +	depends on !BR2_x86_winchip2
> +
> +# 8-byte intrinsics available:
> +#  - On all 64 bits architecture
> +#  - On a certain combinations of ARM platforms
> +#  - On certain x86 32 bits CPUs
> +config BR2_TOOLCHAIN_HAS_SYNC_8
> +	bool
> +	default y if BR2_ARCH_IS_64
> +	default y if BR2_TOOLCHAIN_ARM_HAS_SYNC_8
> +	default y if BR2_TOOLCHAIN_X86_HAS_SYNC_8
> -- 
> 2.6.4
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
