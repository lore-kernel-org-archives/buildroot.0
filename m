From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Nov 2019 19:45:36 +0100
Subject: [Buildroot] [PATCH] package/xvisor: unconditionally disable SSP
In-Reply-To: <20191109164757.29565-1-eric.le.bihan.dev@free.fr>
References: <20191109164757.29565-1-eric.le.bihan.dev@free.fr>
Message-ID: <20191110184536.GA3419@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

This change looks a lot like what was done for kvm-unit-tests in c0ffd16e4.
What do you think of it?

Regards,
Yann E. MORIN.

On 2019-11-09 17:47 +0100, Eric Le Bihan spake thusly:
> Fixes:
> - http://autobuild.buildroot.net/results/5de37d3da17ca5cb17c0113d942ce8c22c0074e0
> - http://autobuild.buildroot.net/results/41b00d95ec4eb851abceaa7919aa1c533d4f16e8
> - http://autobuild.buildroot.net/results/119e22e8b03991ab9196e428a131f5a8ae2a2b2f
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  ...MAKEFILE-Unconditionally-disable-SSP.patch | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 package/xvisor/0001-MAKEFILE-Unconditionally-disable-SSP.patch
> 
> diff --git a/package/xvisor/0001-MAKEFILE-Unconditionally-disable-SSP.patch b/package/xvisor/0001-MAKEFILE-Unconditionally-disable-SSP.patch
> new file mode 100644
> index 0000000000..b69a745462
> --- /dev/null
> +++ b/package/xvisor/0001-MAKEFILE-Unconditionally-disable-SSP.patch
> @@ -0,0 +1,31 @@
> +From f04d1b73a9060e8f09cf1173f89daab73d6c0a18 Mon Sep 17 00:00:00 2001
> +From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> +Date: Sat, 9 Nov 2019 17:13:46 +0100
> +Subject: [PATCH] [MAKEFILE] Unconditionally disable SSP
> +
> +Though -nostdlib is passed in $(cflags), -fno-stack-protector must also be
> +passed to avoid linking errors related to undefined references to
> +'__stack_chk_guard' and '__stack_chk_fail' if toolchain enforces
> +-fstack-protector.
> +
> +Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> +---
> + Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index d6bcf519..de8e1043 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -137,7 +137,7 @@ cppflags+=$(cpu-cppflags)
> + cppflags+=$(board-cppflags)
> + cppflags+=$(libs-cppflags-y)
> + cc=$(CROSS_COMPILE)gcc
> +-cflags=-g -Wall -nostdlib --sysroot=$(drivers_dir)/include -fno-builtin -D__VMM__
> ++cflags=-g -Wall -nostdlib --sysroot=$(drivers_dir)/include -fno-builtin -D__VMM__ -fno-stack-protector
> + cflags+=$(board-cflags) 
> + cflags+=$(cpu-cflags) 
> + cflags+=$(libs-cflags-y) 
> +-- 
> +2.21.0
> +
> -- 
> 2.21.0
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
