From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 8 May 2020 12:44:04 -0700
Subject: [Buildroot] [PATCH 1/2] toolchain/toolchain-buildroot: enable
 uclibc for riscv64
In-Reply-To: <20200508103338.16391-1-mark@dibsco.co.uk>
References: <20200508103338.16391-1-mark@dibsco.co.uk>
Message-ID: <CAKmqyKNCTx4R9tgKRLZF8NQ3h1fvLEX1KqFUAxWTrSY_6_ZOCg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, May 8, 2020 at 3:41 AM Mark Corbin <mark@dibsco.co.uk> wrote:
>
> We can enable uclibc for RISC-V 64 bit now that it has been
> bumped from v1.0.32 to v1.0.34.
>
> Uclibc has had basic support for RISC-V 64 bit since v1.0.31, but
> shared library and TLS/NPTL support has only been available since
> v1.0.33.
>
> This update has been tested using qemu_riscv64_virt_defconfig and
> the Buildroot host QEMU.
>
> Signed-off-by: Mark Corbin <mark@dibsco.co.uk>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  package/uclibc/Config.in                |  1 +
>  toolchain/toolchain-buildroot/Config.in | 14 ++++++++------
>  2 files changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
> index de2885bc92..f8c9955bc8 100644
> --- a/package/uclibc/Config.in
> +++ b/package/uclibc/Config.in
> @@ -101,6 +101,7 @@ config BR2_UCLIBC_TARGET_ARCH
>         default "mips"     if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
>         default "or1k"     if BR2_or1k
>         default "powerpc"  if BR2_powerpc
> +       default "riscv64"  if BR2_riscv && BR2_ARCH_IS_64
>         default "sh"       if BR2_sh
>         default "sparc"    if BR2_sparc
>         default "xtensa"   if BR2_xtensa
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index 8c33b2b4dd..8ae7358526 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -27,12 +27,14 @@ choice
>
>  config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
>         bool "uClibc-ng"
> -       depends on BR2_aarch64 || BR2_aarch64_be || BR2_arcle   || BR2_arceb  || \
> -                  BR2_arm     || BR2_armeb    || \
> -                  BR2_i386    || BR2_m68k   || BR2_microblaze || \
> -                  BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
> -                  BR2_or1k    || BR2_powerpc || BR2_sh2a   || BR2_sh4     || \
> -                  BR2_sh4eb   || BR2_sparc   || BR2_xtensa || BR2_x86_64
> +       depends on BR2_aarch64 || BR2_aarch64_be || BR2_arcle      || BR2_arceb    || \
> +                  BR2_arm     || BR2_armeb      || \
> +                  BR2_i386    || BR2_m68k       || BR2_microblaze || \
> +                  BR2_mips    || BR2_mipsel     || BR2_mips64     || BR2_mips64el || \
> +                  BR2_or1k    || BR2_powerpc    || BR2_riscv      || \
> +                  BR2_sh2a    || BR2_sh4        || BR2_sh4eb      || BR2_sparc    || \
> +                  BR2_xtensa  || BR2_x86_64
> +       depends on BR2_ARCH_IS_64 || !BR2_riscv
>         select BR2_TOOLCHAIN_USES_UCLIBC
>         help
>           This option selects uClibc-ng as the C library for the
> --
> 2.20.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
