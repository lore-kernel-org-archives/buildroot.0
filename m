From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 31 Mar 2021 22:07:10 +0200
Subject: [Buildroot] [PATCH v2] package/haveged: bump version to 1.9.14
In-Reply-To: <20210331185001.24790-1-ps.report@gmx.net>
References: <20210331185001.24790-1-ps.report@gmx.net>
Message-ID: <20210331200710.GH24043@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-03-31 20:50 +0200, Peter Seiderer spake thusly:
> - add patch to fix uclibc compile (disable dependency on sys/auxv.h
>   introduced with upstream commit [1])
[--SNIP--]
> diff --git a/package/haveged/0001-Check-for-sys-auxv.h-before-using-it.patch b/package/haveged/0001-Check-for-sys-auxv.h-before-using-it.patch
> new file mode 100644
> index 0000000000..042135f127
> --- /dev/null
> +++ b/package/haveged/0001-Check-for-sys-auxv.h-before-using-it.patch
> @@ -0,0 +1,60 @@
> +From 676abde95bab10e1d26e91682772514010143343 Mon Sep 17 00:00:00 2001
> +From: Peter Seiderer <ps.report@gmx.net>
> +Date: Sun, 21 Mar 2021 17:00:08 +0100
> +Subject: [PATCH] Check for sys/auxv.h before using it.
> +
> +- fixes uclibc-ng compile (does not provide sys/auxv.h header file)
> +
> +Fixes:
> +
> +  haveged.c:22:10: fatal error: sys/auxv.h: No such file or directory
> +     22 | #include <sys/auxv.h>
> +        |          ^~~~~~~~~~~~
> +
> +[Upstream: https://github.com/jirka-h/haveged/pull/59]

Upstream has merged your patch, hwever I think it is flawed, see
below...

> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[--SNIP--]
> +diff --git a/src/haveged.c b/src/haveged.c
> +index b9cb77b..dad3072 100644
> +--- a/src/haveged.c
> ++++ b/src/haveged.c
> +@@ -135,8 +137,10 @@ int main(int argc, char **argv)
> + {
> +    volatile char *path = strdup(argv[0]);
> +    volatile char *arg0 = argv[0];
> ++#if defined(HAVE_SYS_AUXV_H)
> +    if (path[0] != '/')
> +       path = (char*)getauxval(AT_EXECFN);
> ++#endif

Are you sure this is correct? Later on in that file, 'path' is forcibly
assigned as thus:

    200       path[0] = '/';

And then, 'path' is used to start the daemon:

    527    else run_daemon(handle, path, argv);

So, if the original argv[0] does not start with a '/' (e.g. because it
is called from the PATH), then 'path' will contain a mangled program
name:

    argv[0] = "haveged"
    path = strdup(argv[0]) = "haveged"

and thus with line 200:
    path = "/aveged"

Did I miss something?

Regards,
Yann E. MORIN.

> +    static const char* cmds[] = {
> +       "b", "buffer",      "1", SETTINGR("Buffer size [KW], default: ",COLLECT_BUFSIZE),
> +       "d", "data",        "1", SETTINGR("Data cache size [KB], with fallback to: ", GENERIC_DCACHE ),
> +-- 
> +2.30.2
> +
> diff --git a/package/haveged/haveged.hash b/package/haveged/haveged.hash
> index df8c48e214..f55e004923 100644
> --- a/package/haveged/haveged.hash
> +++ b/package/haveged/haveged.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  d17bd22fa1745daca5ac72e014ed3b0fe5720da4c115953124b1bf2a0aa2b04b  haveged-1.9.13.tar.gz
> +sha256  938cb494bcad7e4f24e61eb50fab4aa0acbc3240c80f3ad5c6cf7e6e922618c3  haveged-1.9.14.tar.gz
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
> index 3980f80132..5d76bdc3c9 100644
> --- a/package/haveged/haveged.mk
> +++ b/package/haveged/haveged.mk
> @@ -4,14 +4,32 @@
>  #
>  ################################################################################
>  
> -HAVEGED_VERSION = 1.9.13
> +HAVEGED_VERSION = 1.9.14
>  HAVEGED_SITE = $(call github,jirka-h,haveged,v$(HAVEGED_VERSION))
>  HAVEGED_LICENSE = GPL-3.0+
>  HAVEGED_LICENSE_FILES = COPYING
>  HAVEGED_SELINUX_MODULES = entropyd
> +# patch touching configure.ac
> +HAVEGED_AUTORECONF = YES
> +
> +# '--disable-init' as buildroot ships its own sysv/systemd init files
> +HAVEGED_CONF_OPTS = \
> +	--enable-daemon \
> +	--disable-diagnostic \
> +	--disable-init \
> +	--disable-nistest \
> +	--disable-enttest \
> +	--disable-olt \
> +	--enable-tune
>  
>  ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
> -HAVEGED_CONF_OPTS += --enable-clock_gettime=yes
> +HAVEGED_CONF_OPTS += --enable-clock_gettime
> +endif
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> +HAVEGED_CONF_OPTS += --enable-threads
> +else
> +HAVEGED_CONF_OPTS += --disable-threads
>  endif
>  
>  define HAVEGED_INSTALL_INIT_SYSV
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
