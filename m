From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Jul 2021 17:54:25 +0200
Subject: [Buildroot] [PATCH v2 2/9] package/elf2flt: add RISC-V support
In-Reply-To: <20210715004843.337268-3-damien.lemoal@wdc.com>
References: <20210715004843.337268-1-damien.lemoal@wdc.com>
 <20210715004843.337268-3-damien.lemoal@wdc.com>
Message-ID: <20210717155425.GV12203@scaer>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Damien, All,

On 2021-07-15 09:48 +0900, Damien Le Moal spake thusly:
> From: Christoph Hellwig <hch@lst.de>
> 
> Enable selecting elf2flt for RISC-V no MMU builds and add support for
> it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  .../0004-elf2flt-add-riscv-support.patch      | 293 ++++++++++++++++++
>  package/elf2flt/Config.in.host                |   2 +-
>  2 files changed, 294 insertions(+), 1 deletion(-)
>  create mode 100644 package/elf2flt/0004-elf2flt-add-riscv-support.patch
> 
> diff --git a/package/elf2flt/0004-elf2flt-add-riscv-support.patch b/package/elf2flt/0004-elf2flt-add-riscv-support.patch
> new file mode 100644
> index 0000000000..4a0bc6e4fa
> --- /dev/null
> +++ b/package/elf2flt/0004-elf2flt-add-riscv-support.patch
> @@ -0,0 +1,293 @@
> +From d096b496525e487b356ac180a7168c18703c1c43 Mon Sep 17 00:00:00 2001
> +From: Christoph Hellwig <hch@lst.de>
> +Date: Wed, 9 Sep 2020 17:31:33 +0900
> +Subject: [PATCH] elf2flt: add riscv support
> +
> +We need a new linker script - riscv has a global_pointer and is
> +very picky about some section ordering.
> +
> +Signed-off-by: Christoph Hellwig <hch@lst.de>
> +Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>

You should add a reference to the upstream PR:
    https://github.com/uclinux-dev/elf2flt/pull/19

> +---
> + Makefile.in        |   4 +-
> + elf2flt.c          |  22 +++++
> + riscv64-elf2flt.ld | 198 +++++++++++++++++++++++++++++++++++++++++++++
> + 3 files changed, 223 insertions(+), 1 deletion(-)
> + create mode 100644 riscv64-elf2flt.ld
> +
> +diff --git a/Makefile.in b/Makefile.in
> +index 0529c7f..121a2a7 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -44,7 +44,9 @@ endif
> + LDFILE= elf2flt.ld
> + ifeq ($(strip $(CPU)),e1)
> + SRC_LDFILE= $(srcdir)/$(CPU)-elf2flt.ld
> +-else 
> ++else ifeq ($(strip $(CPU)),riscv64)
> ++SRC_LDFILE= $(srcdir)/$(CPU)-elf2flt.ld

Here: this looks like it really is specific to riscv64 only, and would
not add support for riscv32...

> ++else
> + SRC_LDFILE= elf2flt.ld
> + endif
> + 
> +diff --git a/elf2flt.c b/elf2flt.c
> +index 3bcf4fe..0adba12 100644
> +--- a/elf2flt.c
> ++++ b/elf2flt.c
> +@@ -81,6 +81,8 @@ const char *elf2flt_progname;
> + #include <elf/v850.h>
> + #elif defined(TARGET_xtensa)
> + #include <elf/xtensa.h>
> ++#elif defined(TARGET_riscv64)
> ++#include <elf/riscv.h>

Ditto.

> + #endif
> + 
> + #if defined(__MINGW32__)
> +@@ -123,6 +125,8 @@ const char *elf2flt_progname;
> + #define ARCH	"nios2"
> + #elif defined(TARGET_xtensa)
> + #define ARCH	"xtensa"
> ++#elif defined(TARGET_riscv64)
> ++#define ARCH    "riscv64"

Ditto.

And: TAB between ARCH and its value. ;-)
(yes, I've read the review thread on github! ;-) )

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
