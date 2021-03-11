From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 11 Mar 2021 22:44:44 +0100
Subject: [Buildroot] [PATCH v1] package/sysvinit: add patch to fix
 compile without stack-protector support
In-Reply-To: <20210310220812.25726-1-ps.report@gmx.net>
References: <20210310220812.25726-1-ps.report@gmx.net>
Message-ID: <20210311214444.GY2737665@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-03-10 23:08 +0100, Peter Seiderer spake thusly:
> - add patch to remove '-fstack-protector-strong' compile flag
> 
> Fixes:
>   .../aarch64-buildroot-linux-uclibc/bin/ld: runlevel.o: in function `main':
>   runlevel.c:(.text.startup+0x4): undefined reference to `__stack_chk_guard'
>   .../aarch64-buildroot-linux-uclibc/bin/ld: cannot find -lssp_nonshared
>   .../aarch64-buildroot-linux-uclibc/bin/ld: cannot find -lssp
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

I've added a little blurb that explains that Buildroot uses the
toolchain wrapper to pass such flags, and only those supoprted by
the toolchain.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...efile-disable-stack-protector-strong.patch | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/sysvinit/0001-Makefile-disable-stack-protector-strong.patch
> 
> diff --git a/package/sysvinit/0001-Makefile-disable-stack-protector-strong.patch b/package/sysvinit/0001-Makefile-disable-stack-protector-strong.patch
> new file mode 100644
> index 0000000000..066bdb3660
> --- /dev/null
> +++ b/package/sysvinit/0001-Makefile-disable-stack-protector-strong.patch
> @@ -0,0 +1,33 @@
> +From 0759f3f9bb2850df455599e7c82eda4ec804e3b6 Mon Sep 17 00:00:00 2001
> +From: Peter Seiderer <ps.report@gmx.net>
> +Date: Wed, 10 Mar 2021 22:57:50 +0100
> +Subject: [PATCH] Makefile: disable stack-protector-strong
> +
> +Fixes:
> +
> +  .../aarch64-buildroot-linux-uclibc/bin/ld: runlevel.o: in function `main':
> +  runlevel.c:(.text.startup+0x4): undefined reference to `__stack_chk_guard'
> +  .../aarch64-buildroot-linux-uclibc/bin/ld: cannot find -lssp_nonshared
> +  .../aarch64-buildroot-linux-uclibc/bin/ld: cannot find -lssp
> +
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> +---
> + src/Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/Makefile b/src/Makefile
> +index 1b368dc..1985929 100644
> +--- a/src/Makefile
> ++++ b/src/Makefile
> +@@ -10,7 +10,7 @@
> + 
> + CPPFLAGS =
> + CFLAGS  ?= -O2
> +-override CFLAGS += -ansi -fomit-frame-pointer -fstack-protector-strong -W -Wall -Wunreachable-code -Wformat -Werror=format-security -D_FORTIFY_SOURCE=2 -D_XOPEN_SOURCE -D_GNU_SOURCE -DVERSION=\"$(VERSION)\"
> ++override CFLAGS += -ansi -fomit-frame-pointer -W -Wall -Wunreachable-code -Wformat -Werror=format-security -D_FORTIFY_SOURCE=2 -D_XOPEN_SOURCE -D_GNU_SOURCE -DVERSION=\"$(VERSION)\"
> + override CFLAGS += $(shell getconf LFS_CFLAGS)
> + STATIC	=
> + MANDB	:= s@^\('\\\\\"\)[^\*-]*-\*- coding: [^[:blank:]]\+ -\*-@\1@
> +-- 
> +2.30.1
> +
> -- 
> 2.30.1
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
