From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 May 2021 15:04:49 +0200
Subject: [Buildroot] [PATCH 1/5] package/bdwgc: Fix 'undefined reference
 to __data_start' linker error on RISC-V
In-Reply-To: <20210502214919.1826571-2-romain.naour@gmail.com>
References: <20210502214919.1826571-1-romain.naour@gmail.com>
 <20210502214919.1826571-2-romain.naour@gmail.com>
Message-ID: <20210517130449.GV2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2021-05-02 23:49 +0200, Romain Naour spake thusly:
> Backport an upstream patch fixing a link issue with libgc.so on RISC-V
> 
> riscv64-buildroot-linux-musl/sysroot/usr/lib/libgc.so: undefined reference to `__data_start'
> 
> https://gitlab.com/kubu93/buildroot/-/jobs/1229888983
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

I considered applying for master, but that depends on libatomic-ops
support on riscv, which is arguably a new feature, so does not belong to
master.

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...ference-to-__data_start-linker-error.patch | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/bdwgc/0001-Fix-undefined-reference-to-__data_start-linker-error.patch
> 
> diff --git a/package/bdwgc/0001-Fix-undefined-reference-to-__data_start-linker-error.patch b/package/bdwgc/0001-Fix-undefined-reference-to-__data_start-linker-error.patch
> new file mode 100644
> index 0000000000..81221c9f66
> --- /dev/null
> +++ b/package/bdwgc/0001-Fix-undefined-reference-to-__data_start-linker-error.patch
> @@ -0,0 +1,33 @@
> +From 301ef15aefa6764466c374d07efb511b1c3862cc Mon Sep 17 00:00:00 2001
> +From: Nikita Ermakov <coffe92@gmail.com>
> +Date: Wed, 20 May 2020 17:57:17 +0300
> +Subject: [PATCH] Fix 'undefined reference to __data_start' linker error on
> + RISC-V
> +
> +Issue #294 (bdwgc).
> +
> +* include/private/gcconfig.h [RISCV && LINUX] (__data_start): Add
> +attribute(weak).
> +
> +(cherry picked from commit 538562ad01b181f4cc3913da1ac06a77945cd9b9)
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +---
> + include/private/gcconfig.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/include/private/gcconfig.h b/include/private/gcconfig.h
> +index d9d45da1..d6cefa6f 100644
> +--- a/include/private/gcconfig.h
> ++++ b/include/private/gcconfig.h
> +@@ -2943,7 +2943,7 @@ EXTERN_C_BEGIN
> + #   define ALIGNMENT (CPP_WORDSZ/8)
> + #   ifdef LINUX
> + #     define OS_TYPE "LINUX"
> +-      extern int __data_start[];
> ++      extern int __data_start[] __attribute__((__weak__));
> + #     define DATASTART ((ptr_t)__data_start)
> + #     define LINUX_STACKBOTTOM
> + #     define DYNAMIC_LOADING
> +-- 
> +2.30.2
> +
> -- 
> 2.30.2
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
