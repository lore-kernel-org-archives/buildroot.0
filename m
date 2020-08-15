From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 Aug 2020 22:30:14 +0200
Subject: [Buildroot] [PATCH] Revert "toolchain/toolchain-buildroot:
 enable uclibc for riscv64"
In-Reply-To: <20200815141039.4774-1-thomas.petazzoni@bootlin.com>
References: <20200815141039.4774-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200815203014.GA24264@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-08-15 16:10 +0200, Thomas Petazzoni spake thusly:
> This reverts commit bd9810e176273914eca1208bcba23f0de9e446b3. Indeed,
> while uClibc-ng has support for RISC-V 64-bit, this support lacks the
> __riscv_flush_icache() function call, which is used by some GCC
> builtins used for example in libffi.
> 
> Due to this missing __riscv_flush_icache(), anything that links
> against libffi fails to build:
> 
> /home/test/autobuild/run/instance-0/output-1/host/bin/riscv64-buildroot-linux-uclibc-gcc  -o gobject/gobject-query gobject/gobject-query.p/gobject-query.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -Wl,--start-group glib/libglib-2.0.so.0.6400.4 gobject/libgobject-2.0.so.0.6400.4 -Wl,--end-group -pthread '-Wl,-rpath,$ORIGIN/../glib:$ORIGIN/' -Wl,-rpath-link,/home/test/autobuild/run/instance-0/output-1/build/libglib2-2.64.4/build/glib -Wl,-rpath-link,/home/test/autobuild/run/instance-0/output-1/build/libglib2-2.64.4/build/gobject
> /home/test/autobuild/run/instance-0/output-1/host/lib/gcc/riscv64-buildroot-linux-uclibc/9.3.0/../../../../riscv64-buildroot-linux-uclibc/bin/ld: /home/test/autobuild/run/instance-0/output-1/host/riscv64-buildroot-linux-uclibc/sysroot/usr/lib64/libffi.so.7: undefined reference to `__riscv_flush_icache'
> collect2: error: ld returned 1 exit status
> 
> Note that this commit means that
> support/config-fragments/autobuild/br-riscv64-full-internal.config
> will be back to using glibc as the C library, but that is OK, until
> uClibc-ng is fixed to implemented __riscv_flush_icache().
> 
> This uClibc-ng issue has been reported upstream at
> https://mailman.uclibc-ng.org/pipermail/devel/2020-August/002022.html.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/ec1185ad1fd8863a3990143a0af2ace987761a27/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

OTOH, I was wondering why we were not adding an exclusion in the
genrandconfig script, like we do for all the other libffi limitations...

Regards,
Yann E. MORIN.

> ---
>  package/uclibc/Config.in                |  1 -
>  toolchain/toolchain-buildroot/Config.in | 13 ++++++-------
>  2 files changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
> index f4d4f06462..de2885bc92 100644
> --- a/package/uclibc/Config.in
> +++ b/package/uclibc/Config.in
> @@ -101,7 +101,6 @@ config BR2_UCLIBC_TARGET_ARCH
>  	default "mips"	   if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
>  	default "or1k"     if BR2_or1k
>  	default "powerpc"  if BR2_powerpc
> -	default "riscv64"  if BR2_RISCV_64
>  	default "sh"	   if BR2_sh
>  	default "sparc"	   if BR2_sparc
>  	default "xtensa"   if BR2_xtensa
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index 068f91c875..418d5cb387 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -27,13 +27,12 @@ choice
>  
>  config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
>  	bool "uClibc-ng"
> -	depends on BR2_aarch64 || BR2_aarch64_be || BR2_arcle      || BR2_arceb    || \
> -		   BR2_arm     || BR2_armeb      || \
> -		   BR2_i386    || BR2_m68k       || BR2_microblaze || \
> -		   BR2_mips    || BR2_mipsel     || BR2_mips64     || BR2_mips64el || \
> -		   BR2_or1k    || BR2_powerpc    || BR2_RISCV_64   || \
> -		   BR2_sh2a    || BR2_sh4	 || BR2_sh4eb      || BR2_sparc    || \
> -		   BR2_xtensa  || BR2_x86_64
> +	depends on BR2_aarch64 || BR2_aarch64_be || BR2_arcle   || BR2_arceb  || \
> +		   BR2_arm     || BR2_armeb    || \
> +		   BR2_i386    || BR2_m68k   || BR2_microblaze || \
> +		   BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
> +		   BR2_or1k    || BR2_powerpc || BR2_sh2a   || BR2_sh4	   || \
> +		   BR2_sh4eb   || BR2_sparc   || BR2_xtensa || BR2_x86_64
>  	select BR2_TOOLCHAIN_USES_UCLIBC
>  	help
>  	  This option selects uClibc-ng as the C library for the
> -- 
> 2.26.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
