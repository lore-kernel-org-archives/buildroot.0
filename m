From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Jul 2021 17:46:51 +0200
Subject: [Buildroot] [PATCH v2 1/9] arch/config: Make RISC-V MMU optional
In-Reply-To: <20210715004843.337268-2-damien.lemoal@wdc.com>
References: <20210715004843.337268-1-damien.lemoal@wdc.com>
 <20210715004843.337268-2-damien.lemoal@wdc.com>
Message-ID: <20210717154651.GU12203@scaer>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Damien, All,

On 2021-07-15 09:48 +0900, Damien Le Moal spake thusly:
> Linux supports No-MMU RISC-V since kernel version 5.8. Make MMU optional
> to enable building for RISC-V boards that do not have one.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  arch/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/Config.in b/arch/Config.in
> index 1853e26bb4..82d3b01980 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -210,7 +210,7 @@ config BR2_powerpc64le
>  
>  config BR2_riscv
>  	bool "RISCV"
> -	select BR2_ARCH_HAS_MMU_MANDATORY
> +	select BR2_ARCH_HAS_MMU_OPTIONAL

I am a bit confused with this: the elf2flt patch only adds support for
riscv64 (excerpts):

    Makefile.in:
    +else ifeq ($(strip $(CPU)),riscv64)
and:
    elf2flt.c:
    +#elif defined(TARGET_riscv64)
    +#include <elf/riscv.h>
and:
    +#elif defined(TARGET_riscv64)
    +#define ARCH    "riscv64"

However, this change will make it possible to select noMMU for riscv32
too... Is this supposed to be supported?

If not, then I think the following patch would be a better starting
point to add noMMU support only for riscv64:

    diff --git a/arch/Config.in b/arch/Config.in
    index 1853e26bb4..2e95b6e76c 100644
    --- a/arch/Config.in
    +++ b/arch/Config.in
    @@ -210,7 +210,6 @@ config BR2_powerpc64le
     
     config BR2_riscv
     	bool "RISCV"
    -	select BR2_ARCH_HAS_MMU_MANDATORY
     	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
     	help
     	  RISC-V is an open, free Instruction Set Architecture created
    diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
    index 1fc20e5de7..e6436d7c39 100644
    --- a/arch/Config.in.riscv
    +++ b/arch/Config.in.riscv
    @@ -71,10 +71,12 @@ choice
     
     config BR2_RISCV_32
     	bool "32-bit"
    +	select BR2_ARCH_HAS_MMU_MANDATORY
     
     config BR2_RISCV_64
     	bool "64-bit"
     	select BR2_ARCH_IS_64
    +	select BR2_ARCH_HAS_MMU_OPTIONAL
     
     endchoice
     

Also, the ordering is weird: first you allow a noMMU configuration, then
you add support for it in elf2flt. If only the first patch (this one) is
applied, and not the second (e.g. because there is an issue with it),
then the build is broken.

Ditto with the patch to fix TARGET_OS.

The series should be bisectable, i.e. we should be able to apply number
of the first patches without breaking the build.

So, instead, I would think it is better to:

 1. backport the elf2flt upstream support for riscv(64--only?)
 2. fix TARGET_OS for noMMU riscv(64-only?)
 3. allow selecting noMMU for riscv(64-only?)

And I think that patches 2 and 3 could even be squashed together. But I
am not opposed to having them separate either; do as you feel best.

Also, I wil be replying to the elft2flt patch separately...

Regards,
Yann E. MORIN.

>  	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
>  	help
>  	  RISC-V is an open, free Instruction Set Architecture created
> -- 
> 2.31.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
