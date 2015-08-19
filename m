From: sergey kostanbaev <sergey.kostanbaev@gmail.com>
Date: Thu, 20 Aug 2015 01:49:53 +0300
Subject: [Buildroot] [PATCH 1/1] Add support for x32 ABI for x86-64
	target.
In-Reply-To: <1439333955-1259-1-git-send-email-Guido.Hatzsis@yandex.com>
References: <1439333955-1259-1-git-send-email-Guido.Hatzsis@yandex.com>
Message-ID: <CAGtNMfM=h-kOytBJoKLSk1kPxTNV=H5ZUP1JDR4tiB+wZV+vGQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guido,

I tried your patch against buildroot-2015.05 and it fails during
compilation of glibc-2.21:

/home/serg/projects/buildroot-2015.05/output/host/usr/bin/x86_64-umsiteroot-linux-gnux32-gcc
mktime.c -c -std=gnu99 -fgnu89-inline  -O2 -Wall -Werror -Winline
-Wno-error=undef -Wundef -Wwrite-strings -fmerge-all-constants
-frounding-math -Wstrict-prototypes   -fPIC        -I../include
-I/home/serg/projects/buildroot-2015.05/output/build/glibc-2.21/build/time
 -I/home/serg/projects/buildroot-2015.05/output/build/glibc-2.21/build
 -I../sysdeps/unix/sysv/linux/x86_64/x32  -I../sysdeps/x86_64/x32/nptl
 -I../sysdeps/unix/sysv/linux/x86_64  -I../sysdeps/unix/sysv/linux/x86
 -I../sysdeps/unix/sysv/linux/wordsize-64  -I../sysdeps/x86_64/nptl
 -I../sysdeps/unix/sysv/linux/include -I../sysdeps/unix/sysv/linux
 -I../sysdeps/nptl  -I../sysdeps/pthread  -I../sysdeps/gnu
 -I../sysdeps/unix/inet  -I../sysdeps/unix/sysv  -I../sysdeps/unix/x86_64
 -I../sysdeps/unix  -I../sysdeps/posix  -I../sysdeps/x86_64/x32
 -I../sysdeps/x86_64/fpu/multiarch  -I../sysdeps/x86_64/fpu
 -I../sysdeps/x86/fpu/include -I../sysdeps/x86/fpu
 -I../sysdeps/x86_64/multiarch  -I../sysdeps/x86_64  -I../sysdeps/x86
 -I../sysdeps/ieee754/ldbl-96  -I../sysdeps/ieee754/dbl-64/wordsize-64
 -I../sysdeps/ieee754/dbl-64  -I../sysdeps/ieee754/flt-32
 -I../sysdeps/wordsize-32  -I../sysdeps/ieee754  -I../sysdeps/generic  -I..
-I../libio -I. -nostdinc -isystem
/home/serg/projects/buildroot-2015.05/output/host/usr/lib/gcc/x86_64-umsiteroot-linux-gnux32/4.9.2/include
-isystem
/home/serg/projects/buildroot-2015.05/output/host/usr/lib/gcc/x86_64-umsiteroot-linux-gnux32/4.9.2/include-fixed
-isystem
/home/serg/projects/buildroot-2015.05/output/host/usr/x86_64-umsiteroot-linux-gnux32/sysroot/usr/include
 -D_LIBC_REENTRANT -include
/home/serg/projects/buildroot-2015.05/output/build/glibc-2.21/build/libc-modules.h
-DMODULE_NAME=libc -include ../include/libc-symbols.h  -DPIC -DSHARED
-o
/home/serg/projects/buildroot-2015.05/output/build/glibc-2.21/build/time/mktime.os
-MD -MP -MF
/home/serg/projects/buildroot-2015.05/output/build/glibc-2.21/build/time/mktime.os.dt
-MT
/home/serg/projects/buildroot-2015.05/output/build/glibc-2.21/build/time/mktime.os
(echo '#include <dl-vdso.h>'; \
         echo 'extern void *time_ifunc (void) __asm ("time");'; \
         echo 'void *'; \
         echo 'time_ifunc (void)'; \
         echo '{'; \
         echo '  PREPARE_VERSION_KNOWN (symver, LINUX_2_6);'; \
         echo '  return _dl_vdso_vsym ("__vdso_time", &symver);'; \
         echo '}'; \
         echo 'asm (".type time, %gnu_indirect_function");'; \
         echo 'asm (".globl __GI_time
/bin/sh: 10: Syntax error: Unterminated quoted string
make[3]: ***
[/home/serg/projects/buildroot-2015.05/output/build/glibc-2.21/build/time/time.os]
Error 2
make[3]: *** Waiting for unfinished jobs....
make[3]: Leaving directory
`/home/serg/projects/buildroot-2015.05/output/build/glibc-2.21/time'
make[2]: *** [time/subdir_lib] Error 2
make[2]: Leaving directory
`/home/serg/projects/buildroot-2015.05/output/build/glibc-2.21'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/serg/projects/buildroot-2015.05/output/build/glibc-2.21/build'
make: ***
[/home/serg/projects/buildroot-2015.05/output/build/glibc-2.21/.stamp_built]
Error 2

What version of buildroot and glibc have you tested it?



On Wed, Aug 12, 2015 at 1:59 AM, Guido Hatzsis <Guido.Hatzsis@yandex.com>
wrote:

> x32 uses 32-bit pointers on the x84-64 linux target. The kernel needs
> to have CONFIG_X86_X32 enabled. For more information see:
> https://en.wikipedia.org/wiki/X32_ABI
>
> Signed-off-by: Guido Hatzsis <Guido.Hatzsis@yandex.com>
> ---
>  arch/Config.in.x86                      | 30
> ++++++++++++++++++++++++++++++
>  package/Makefile.in                     |  5 +++++
>  package/glibc/Config.in                 |  2 ++
>  package/uclibc/Config.in                |  1 +
>  toolchain/toolchain-buildroot/Config.in |  2 ++
>  5 files changed, 40 insertions(+)
>
> diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
> index 43f6abc..a312df1 100644
> --- a/arch/Config.in.x86
> +++ b/arch/Config.in.x86
> @@ -268,3 +268,33 @@ config BR2_GCC_TARGET_ARCH
>         default "c3"            if BR2_x86_c3
>         default "c3-2"          if BR2_x86_c32
>         default "geode"         if BR2_x86_geode
> +
> +choice
> +       prompt "Target ABI"
> +       depends on BR2_x86_64
> +       default BR2_X86_64_ABI_GCC
> +       help
> +         Application Binary Interface to use. The Application Binary
> +         Interface describes the calling conventions (how arguments
> +         are passed to functions, how the return value is passed, how
> +         system calls are made, etc.).
> +
> +config BR2_X86_64_ABI_GNU
> +       bool "gnu"
> +       depends on BR2_x86_64
> +       help
> +      This is the gnu ABI for x86-64 which has 64-bits wide pointers.
> +
> +config BR2_X86_64_ABI_X32
> +       bool "x32"
> +       depends on BR2_x86_64
> +       help
> +      The X32 ABI is x86-64 with 32 bit pointers. It runs in x86-64 mode
> +      but as it has 32-bit pointers only 4 GB of RAM can be addressed.
> +      https://en.wikipedia.org/wiki/X32_ABI
> +
> +endchoice
> +
> +config BR2_GCC_TARGET_ABI
> +    default "x32"      if BR2_X86_64_ABI_X32
> +
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 545694f..db2c0f0 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -70,6 +70,11 @@ ABI := $(ABI)hf
>  endif
>  endif
>
> +# Only set the ABI for x86-64 x32.
> +ifeq ($(BR2_X86_64_ABI_X32),y)
> +ABI = x32
> +endif
> +
>  # For FSL PowerPC there's SPE
>  ifeq ($(BR2_powerpc_SPE),y)
>  ABI = spe
> diff --git a/package/glibc/Config.in b/package/glibc/Config.in
> index 8cc8cce..a76f2c7 100644
> --- a/package/glibc/Config.in
> +++ b/package/glibc/Config.in
> @@ -4,6 +4,7 @@ if BR2_TOOLCHAIN_BUILDROOT_EGLIBC
>  config BR2_PACKAGE_EGLIBC
>         bool
>         default y
> +       depends on !BR2_X86_64_ABI_X32
>
>  choice
>         prompt "eglibc version"
> @@ -29,6 +30,7 @@ if BR2_TOOLCHAIN_BUILDROOT_GLIBC
>  config BR2_PACKAGE_GLIBC
>         bool
>         default y
> +       depends on !BR2_X86_64_ABI_X32
>
>  choice
>         prompt "glibc version"
> diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
> index bf40a13..b21a7fe 100644
> --- a/package/uclibc/Config.in
> +++ b/package/uclibc/Config.in
> @@ -4,6 +4,7 @@ if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
>  config BR2_PACKAGE_UCLIBC
>         bool
>         default y
> +       depends on !BR2_X86_64_ABI_X32
>
>  comment "uClibc Options"
>
> diff --git a/toolchain/toolchain-buildroot/Config.in
> b/toolchain/toolchain-buildroot/Config.in
> index 13e2b15..828f753 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -34,6 +34,7 @@ config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
>                    BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el
> || \
>                    BR2_powerpc || BR2_sh2a   || BR2_sh4    || BR2_sh4eb
> || \
>                    BR2_sparc   || BR2_xtensa || BR2_x86_64
> +       depends on !BR2_X86_64_ABI_X32
>         help
>           This option selects uClibc as the C library for the
>           cross-compilation toolchain.
> @@ -51,6 +52,7 @@ config BR2_TOOLCHAIN_BUILDROOT_EGLIBC
>         depends on BR2_USE_MMU
>         depends on !BR2_STATIC_LIBS
>         depends on BR2_DEPRECATED_SINCE_2015_08
> +       depends on !BR2_X86_64_ABI_X32
>         select BR2_TOOLCHAIN_USES_GLIBC
>         # our eglibc.mk enables RPC support
>         select BR2_TOOLCHAIN_HAS_NATIVE_RPC
> --
> 2.5.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150820/8bf9e653/attachment.html>
