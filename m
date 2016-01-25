From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 25 Jan 2016 19:27:37 +0100
Subject: [Buildroot] [PATCH 03/21] toolchain: add
 BR2_TOOLCHAIN_HAS_SYNC_x hidden booleans
In-Reply-To: <1453676887-31236-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453676887-31236-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453676887-31236-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160125182737.GD3386@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

[Warning: pedantic-english mode engaged. ;-) But with real, interesting
 comments, too! ]

On 2016-01-25 00:07 +0100, Thomas Petazzoni spake thusly:
> Currently, Buildroot provides one BR2_ARCH_HAS_ATOMICS boolean option
> to indicate whether the architecture supports atomic operations or
> not. However, the reality of atomic operations support is much more
> complicated and requires more than one option to be expressed
> properly.
> 
> There are in fact two types of atomic built-ins provided by gcc:
> 
>  (1) The __sync_*() family of functions, which have been in gcc since
>      a long time (probably gcc 4.1). They are available in variants

    "for a long time", "for ages"
or
    "since January 1970", "since I was born (and even before)"

>      operating on 1 byte, 2 bytes, 4 bytes and 8 bytes

    1-byte, 2-byte, 4-byte or 8-byte integers

(no plural to a noun when it is prefixed with a numeral as they are then
considered an adjective, and adjectives in english have no plural.)

>      integers. Certain architectures implement certain variants,

s/certain/some/

'certain' is a false-friend for french natives. ;-)

>      certain do not implement any, certain architectures implement all
>      of them.
> 
>      They are now considered "legacy" by the gcc developers but are
>      nonetheless still being used by a significant number of userspace
>      libraries and applications.
> 
>      https://gcc.gnu.org/onlinedocs/gcc/_005f_005fsync-Builtins.html
> 
>  (2) The __atomic_*() family of functions, which have been introduced
>      in gcc 4.7. They have been introduced in order to support C++11
>      atomic operations. They are available on all architectures,
>      either built-in, or in the libatomic library part of the gcc
>      runtime (in which case the application needs to be linked with
>      -latomic).
> 
> Since (2) are available on all architectures starting gcc 4.7, we do
> not need to add any new option for them: packages using them should
> depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 and link with libatomic.
> 
> However, for (1), a single BR2_ARCH_HAS_ATOMICS is not sufficient,
> because depending on the architecture, certain variants are available
> or not. Setting BR2_ARCH_HAS_ATOMICS to false as soon as one of the

    ... some variants may or may not be available.

> variant is missing would cause a large number of packages to become
> unavailable, even if they in fact use only more common variants
> available on a large number of architectures. For this reason, we've
> chosen to introduce four new Config.in options:
> 
>  - BR2_TOOLCHAIN_HAS_SYNC_1
>  - BR2_TOOLCHAIN_HAS_SYNC_2
>  - BR2_TOOLCHAIN_HAS_SYNC_3
>  - BR2_TOOLCHAIN_HAS_SYNC_4
> 
> Which indicate whether the toolchain support 1 byte, 2 bytes, 4 bytes
> and 8 bytes __sync_*() built-ins respectively.

Ditto:
    1-byte, 2-byte, 4-byte or 8-byte __sync_*() built-ins

> We conducted a fairly large analysis on various architectures
> supported by Buildroot, as well as a number of different toolchains,

    analysis _about_ architectures
    analysis _with_ toolchains

So:

    a fairly large analysis about various architectures [...], and with
    a number of different toolchains,

> to check which combinations supported which variant. To do, we linked

    ... which combinations support which variant.

(it's an immutable fact: it was true, is still true, and will be true.)

> the following program with various toolchains:
> 
> int main(void)
> {
> 	uint8_t a;
> 	uint16_t b;
> 	uint32_t c;
> 	uint64_t d;
> 
> 	__sync_fetch_and_add(&a, 3);
> 	__sync_fetch_and_add(&b, 3);
> 	__sync_fetch_and_add(&c, 3);
> 	__sync_fetch_and_add(&d, 3);
> 
> 	__sync_val_compare_and_swap(&a, 1, 2);
> 	__sync_val_compare_and_swap(&b, 1, 2);
> 	__sync_val_compare_and_swap(&c, 1, 2);
> 	__sync_val_compare_and_swap(&d, 1, 2);
> 
> 	__atomic_add_fetch(&a, 3, __ATOMIC_RELAXED);
> 	__atomic_add_fetch(&b, 3, __ATOMIC_RELAXED);
> 	__atomic_add_fetch(&c, 3, __ATOMIC_RELAXED);
> 	__atomic_add_fetch(&d, 3, __ATOMIC_RELAXED);
> 
> 	__atomic_compare_exchange_n(&a, &a, 2, 1,  __ATOMIC_RELAXED,  __ATOMIC_RELAXED);
> 	__atomic_compare_exchange_n(&b, &b, 2, 1,  __ATOMIC_RELAXED,  __ATOMIC_RELAXED);
> 	__atomic_compare_exchange_n(&c, &c, 2, 1,  __ATOMIC_RELAXED,  __ATOMIC_RELAXED);
> 	__atomic_compare_exchange_n(&d, &d, 2, 1,  __ATOMIC_RELAXED,  __ATOMIC_RELAXED);
> 
> 	return 0;
> }
> 
> And looked at which symbols were unresolved. For the __atomic_*()
> ones, we tested with and without -latomic to see which variants are
> built-in, which variants require libatomic. This testing effort has
> led to the following results:
> 
>                 __sync       __atomic    gcc
>                1  2  4  8    1  2  4  8
> ARC            Y  Y  Y  -    Y  Y  Y  L   4.8 [with BR2_ARC_ATOMIC_EXT]
> ARC            -  -  -  -    L  L  L  L   4.8 [without BR2_ARC_ATOMIC_EXT]
> ARM            Y  Y  Y  X    Y  Y  Y  Y   4.8, 4.7
> ARM            Y  Y  Y  -                 4.5
> AArch64        Y  Y  Y  Y    Y  Y  Y  Y   4.9, 5.1
> Bfin           -  -  Y  -                 4.3
> i386 (i386)    -  -  -  -    L  L  L  L   4.9
> i386 (i486..)  Y  Y  Y  -    L  L  L  L   4.9 [i486, c3, winchip2, winchip-c6]
> i386 (> i586)  Y  Y  Y  Y    L  L  L  L   4.9
> Microblaze     -  -  Y  -    L  L  Y  L   4.9
> MIPS           Y  Y  Y  -    Y  Y  Y  L   4.9
> MIPS64         Y  Y  Y  Y    Y  Y  Y  Y   4.9
> NIOS 2         Y  Y  Y  -    Y  Y  Y  L   4.9, 5.2
> PowerPC        Y  Y  Y  -    Y  Y  Y  L   4.9
> SuperH         Y  Y  Y  -    Y  Y  Y  L   4.9
> SPARC          -  -  -  -    L  L  L  L   4.9
> SPARC64        Y  Y  Y  Y    Y  Y  Y  Y   4.9
> x86_64         Y  Y  Y  Y    Y  Y  Y  Y   4.7, 4.9
> Xtensa         Y  Y  Y  -    Y  Y  Y  Y   4.9
> 
> Notes:
> 
>  * __atomic built-ins appeared in gcc 4.7, so for toolchais older than
>    that, the __atomic column is empty.
> 
>  * Y means 'supported built-in'
> 
>  * L means 'supported via linking to libatomic' (only for __atomic
>    functions)
> 
>  * X indicates a very special case for 8 bytes __sync built-ins on
>    ARM. On ARMv7, there is no problem, starting from gcc 4.7, the
>    __sync built-in for 8 bytes integers is implemented, fully in
>    userspace. For cores < ARMv7, doing a 8 bytes atomic operation
>    requires help from the kernel. Unfortunately, the libgcc code
>    implementing this uses the __write() function to display an error,
>    and this function is internal to glibc. Therefore, if you're using
>    glibc everything is fine, but if you're using uClibc or musl, you
>    cannot link an application that uses 8 bytes __sync
>    operations. This has been fixed as part of gcc PR68095, merged in
>    the gcc 5 branch but not yet part of any gcc release.
> 
>  * - means not supported

Just... Woo... Impressive! :-)

> As said above:
> 
>  * For the __atomic_*() built-ins, we do not add any new Config.in
>    option, since they are all available on all architectures as long
>    as you link with libatomic.

   ... and depend on gcc >= 4.7

>  * For the __sync_*() built-ins, we add one option for each size,
>    encoding on which architectures they are available or not. There is
>    only one case where the gcc version/C library comes into play: on
>    ARM, where the situation is a bit complicated for 8 bytes atomics.
> 
> This commit only introduces the new options. Follow-up commits will
> progressively change the packages using BR2_ARCH_HAS_ATOMICS to use
> the appropriate BR2_TOOLCHAIN_HAS_SYNC_x, until the point where
> BR2_ARCH_HAS_ATOMICS can be removed.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  toolchain/toolchain-common.in | 54 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 
> diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
> index 014a23d..273afab 100644
> --- a/toolchain/toolchain-common.in
> +++ b/toolchain/toolchain-common.in
> @@ -313,3 +313,57 @@ config BR2_TOOLCHAIN_GCC_AT_LEAST
[--SNIP sync_{1,2,4}--]
> +# The availability of __sync for 8 bytes types on ARM is somewhat
> +# complicated:
> +#
> +#  - It appeared in gcc starting from gcc 4.7.

... starting with gcc 4.7.

> +#  - On ARMv7, there is no problem, it can be directly implemented in
> +#    userspace.
> +#
> +#  - On < ARMv7, it requires help from the kernel. Unfortunately, the
> +#    libgcc code implementing 8 bytes __sync with the help from the
> +#    kernel calls __write() when a failure occurs, which is a function
> +#    internal to glibc, not available in uClibc and musl. This means
> +#    that the 8 bytes __sync operations are not available on < ARMv7
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

I had a bit of difficulty parsing that one. It was not obvious from the
commit log that gcc >= 4.7 was required, while the comment above makes
it really explicit. Here's how I understood the commit log:

  - for armv7, with gcc-4.7+, it's OK
  - for armv6-, it needs glibc and there is no gcc condition.

But the comment here states it differently, and matches the code.

Can you just confirm that I misunderstand the commit log?

> +# 8 bytes intrinsics available:
> +#  - On all 64 bits architecture
> +#  - On a certain combinations of ARM platforms
> +#  - On i386, except some really old processors
> +config BR2_TOOLCHAIN_HAS_SYNC_8
> +	bool
> +	default y if BR2_ARCH_IS_64 || BR2_TOOLCHAIN_ARM_HAS_SYNC_8 || \
> +		(BR2_i386 && !BR2_x86_i386 && !BR2_x86_i486 && !BR2_x86_c3 && \
> +		 !BR2_x86_winchip_c6 && !BR2_x86_winchip2)

Well, I'd prefer we have a simpler conditional block, maybe something
like:

    config BR2_TOOLCHAIN_i386_HAS_SYNC_8
        bool
        default y
        depends on BR2_i386
        depends on !BR2_x86_i386
        depends on !BR2_x86_i486
        depends on !BR2_x86_c3
        depends on !BR2_x86_winchip_c6
        depends on !BR2_x86_winchip2

    config BR2_TOOLCHAIN_HAS_SYNC_8
        bool
        default y if BR2_ARCH_IS_64
        default y if BR2_TOOLCHAIN_i386_HAS_SYNC_8
        default y if BR2_TOOLCHAIN_ARM_HAS_SYNC_8

(check the conditions, I may have barfed a bit on the copy-paste)

Also, I'm not sure about the 'default y if BR2_ARCH_IS_64' and I think
we should just list those architectures (4 of them: AArch64, mips64,
sparc64 and x86_64, with that last one already covered with i386).

Otherwise, I'm pretty impressed with that. It must have been totally
time-consuming, and I'm happy to read such a detailed report and
summary. :-)

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
