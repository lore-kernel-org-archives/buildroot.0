From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Mar 2014 19:52:41 +0100
Subject: [Buildroot] [PATCH 1/1] [V3] toolchain: control vendor part in
 GNU_TARGET_NAME
In-Reply-To: <884EA965490E3C4D8E66AEF41E9802500939A1@ezex10.ezchip.com>
References: <1393908571-30334-1-git-send-email-noamc@ezchip.com>
 <884EA965490E3C4D8E66AEF41E9802500939A1@ezex10.ezchip.com>
Message-ID: <20140304185240.GC11474@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Noam, All,

On 2014-03-04 04:51 +0000, Noam Camus spake thusly:
> This option allows to customize the "vendor" part of the
> toolchain tuple, where the toolchain tuple has the form
> <cpu>-<vendor>-<kernel>-<os>. Use this option in situations
> where gcc might make different decisions based on the vendor
> part of the tuple.
> 
> Signed-off-by: Noam Camus <noamc@ezchip.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

I don't think Thomas provided a SoB line so far. You can't add such a
line for someone else, unless they explicitly stated so. A SoB-line is
binding:
    http://elinux.org/Developer_Certificate_Of_Origin

> diff --git a/package/Makefile.in b/package/Makefile.in
> index 454f614..121fe74 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -20,8 +20,18 @@ endif
>  MAKE1:=$(HOSTMAKE) -j1
>  MAKE:=$(HOSTMAKE) $(if $(PARALLEL_JOBS),-j$(PARALLEL_JOBS))
> 
> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT_VENDOR),)
> +VENDOR:=buildroot
> +else
> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT_VENDOR),unknown)
> +$(error The value 'unknown' is not allowed. It might be confused with native toolchain)

... with the native ...

[--SNIP--]
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index 07db50b..34f78ae 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -70,6 +70,23 @@ config BR2_TOOLCHAIN_BUILDROOT_LIBC
>         default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_EGLIBC
>         default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_GLIBC

Your patch is space-mangled: the leading tabs have been replaced with
spaces. Can you try to use 'git send-email' to send the mails? This is
known to work correctly most of the case, whereas some user-friendly
mailers (lie the ones from MS) have issues properly sending patches.

> +config BR2_TOOLCHAIN_BUILDROOT_VENDOR
> +       string "custom toolchain vendor name"
> +       default "buildroot"
> +       help
> +

Superfluous empty line.

> +         This option allows to customize the "vendor" part of the
> +         toolchain tuple, where the toolchain tuple has the form
> +         <cpu>-<vendor>-<kernel>-<os>. The default value, "buildroot",
> +         is fine for most cases, except in very specific situations
> +         where gcc might make different decisions based on the vendor
> +         part of the tuple. The value "unknown" is not allowed, as the
> +         cross-compiling toolchain might then be confused with the
> +         native toolchain when the target and host architecture are
> +         identical.
> +
> +         If you're not sure, just leave the default "buildroot" value.

Add something like:

    Leaving this empty will also use the default "buildroot" value.

Otherwise, looks good.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
