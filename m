From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 2 Jan 2019 15:59:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/glibc: fix include of
 syscalls.h for RISC-V architecture
In-Reply-To: <20190102141724.23898-1-mark.corbin@embecosm.com>
References: <20190102141724.23898-1-mark.corbin@embecosm.com>
Message-ID: <20190102145901.GI23435@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mark, All,

On 2019-01-02 14:17 +0000, Mark Corbin spake thusly:
> UAPI header file asm/syscalls.h has been merged into the UAPI
> asm/unistd.h header file for the RISC-V architecture in the
> 4.20 kernel. This causes the glibc 2.28 build to break.
> 
> This commit applies the upstream glibc patch for this issue.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/8190eb74b2b97911e03671138487d747fcb22cba/
> 
> Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
> ---
>  .../0002-fix-syscalls-header-for-riscv.patch  | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 package/glibc/glibc-2.28-50-gb8dd0f42780a3133c02f064a2c0c5c4e7ab61aaa/0002-fix-syscalls-header-for-riscv.patch
> 
> diff --git a/package/glibc/glibc-2.28-50-gb8dd0f42780a3133c02f064a2c0c5c4e7ab61aaa/0002-fix-syscalls-header-for-riscv.patch b/package/glibc/glibc-2.28-50-gb8dd0f42780a3133c02f064a2c0c5c4e7ab61aaa/0002-fix-syscalls-header-for-riscv.patch
> new file mode 100644
> index 0000000000..a740018e12
> --- /dev/null
> +++ b/package/glibc/glibc-2.28-50-gb8dd0f42780a3133c02f064a2c0c5c4e7ab61aaa/0002-fix-syscalls-header-for-riscv.patch
> @@ -0,0 +1,67 @@
[--SNIP--]
> +[Mark: patch retrieved from
> +https://sourceware.org/ml/libc-alpha/2018-12/msg00875.html]

I'd prefer you point to the git commit:
    https://sourceware.org/git/?p=glibc.git;a=commit;h=0b9c84906f653978fb8768c7ebd0ee14a47e662e

Regards,
Yann E. MORIN.

> +Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
> +---
> + sysdeps/unix/sysv/linux/riscv/flush-icache.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/sysdeps/unix/sysv/linux/riscv/flush-icache.c b/sysdeps/unix/sysv/linux/riscv/flush-icache.c
> +index d612ef4c6c..d0ecec5107 100644
> +--- a/sysdeps/unix/sysv/linux/riscv/flush-icache.c
> ++++ b/sysdeps/unix/sysv/linux/riscv/flush-icache.c
> +@@ -21,7 +21,11 @@
> + #include <stdlib.h>
> + #include <atomic.h>
> + #include <sys/cachectl.h>
> ++#if __has_include__ (<asm/syscalls.h>)
> + #include <asm/syscalls.h>
> ++#else
> ++#include <asm/unistd.h>
> ++#endif
> + 
> + typedef int (*func_type) (void *, void *, unsigned long int);
> + 
> +-- 
> +2.19.2
> -- 
> 2.19.1
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
