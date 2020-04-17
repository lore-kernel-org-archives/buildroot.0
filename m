From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Apr 2020 13:50:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/exfatprogs: new package
In-Reply-To: <20200417091119.13764-1-james.hilliard1@gmail.com>
References: <20200417091119.13764-1-james.hilliard1@gmail.com>
Message-ID: <20200417115043.GM5853@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2020-04-17 03:11 -0600, James Hilliard spake thusly:
> exFAT filesystem userspace utilities
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

I was about to apply, but first decided to run it through a round of
./utils/test-pkg, and unfortunately, we do have a few build errors:

    $ ./utils/test-pkg -d $(pwd)/br-test -c exfat.cfg
                 br-arm-full [1/6]: FAILED
      br-arm-cortex-a9-glibc [2/6]: OK
       br-arm-cortex-m4-full [3/6]: FAILED
              br-x86-64-musl [4/6]: OK
          br-arm-full-static [5/6]: FAILED
                sourcery-arm [6/6]: OK

Notice that all the failing builds are using uClibc, and fail with:

      CC       exfat_iconv.lo
    In file included from exfat_iconv.c:11:0:
    ../include/exfat_tools.h:72:1: error: unknown type name ?ssize_t?
     ssize_t exfat_read(int fd, void *buf, size_t size, off_t offset);
     ^
    ../include/exfat_tools.h:72:52: error: unknown type name ?off_t?
     ssize_t exfat_read(int fd, void *buf, size_t size, off_t offset);
                                                        ^
    ../include/exfat_tools.h:73:1: error: unknown type name ?ssize_t?
     ssize_t exfat_write(int fd, void *buf, size_t size, off_t offset);
     ^
    ../include/exfat_tools.h:73:53: error: unknown type name ?off_t?
     ssize_t exfat_write(int fd, void *buf, size_t size, off_t offset);
                                                         ^
    make[3]: *** [Makefile:427: exfat_iconv.lo] Error 1

So I guess this is missing to include a header. Care to see it fixed,
and respin an updated patch, please?

Also, would it make sense to have it as a host package?

In the meantime, I've marked this patch as changes-requested in
patchwork.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS                         |  1 +
>  package/Config.in                  |  1 +
>  package/exfatprogs/Config.in       |  6 ++++++
>  package/exfatprogs/exfatprogs.hash |  3 +++
>  package/exfatprogs/exfatprogs.mk   | 14 ++++++++++++++
>  5 files changed, 25 insertions(+)
>  create mode 100644 package/exfatprogs/Config.in
>  create mode 100644 package/exfatprogs/exfatprogs.hash
>  create mode 100644 package/exfatprogs/exfatprogs.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 3d9c976a95..2d1db22d35 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1171,6 +1171,7 @@ F:	configs/pine64_defconfig
>  F:	configs/pine64_sopine_defconfig
>  
>  N:	James Hilliard <james.hilliard1@gmail.com>
> +F:	package/exfatprogs/
>  F:	package/gensio/
>  F:	package/lua-std-debug/
>  F:	package/lua-std-normalize/
> diff --git a/package/Config.in b/package/Config.in
> index ccf54f2417..b6c0c44402 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -199,6 +199,7 @@ menu "Filesystem and flash utilities"
>  	source "package/erofs-utils/Config.in"
>  	source "package/exfat/Config.in"
>  	source "package/exfat-utils/Config.in"
> +	source "package/exfatprogs/Config.in"
>  	source "package/f2fs-tools/Config.in"
>  	source "package/flashbench/Config.in"
>  	source "package/fscryptctl/Config.in"
> diff --git a/package/exfatprogs/Config.in b/package/exfatprogs/Config.in
> new file mode 100644
> index 0000000000..54840513d3
> --- /dev/null
> +++ b/package/exfatprogs/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_EXFATPROGS
> +	bool "exfatprogs"
> +	help
> +	  exFAT filesystem userspace utilities
> +
> +	  https://github.com/exfatprogs/exfatprogs
> diff --git a/package/exfatprogs/exfatprogs.hash b/package/exfatprogs/exfatprogs.hash
> new file mode 100644
> index 0000000000..424cc2b1fa
> --- /dev/null
> +++ b/package/exfatprogs/exfatprogs.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  9cd3b71b0d90695969b83a68d5412898c120a60893e01434ef5e2be9f14fe570  exfatprogs-1.0.1.tar.gz
> +sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
> diff --git a/package/exfatprogs/exfatprogs.mk b/package/exfatprogs/exfatprogs.mk
> new file mode 100644
> index 0000000000..d2077ecbaa
> --- /dev/null
> +++ b/package/exfatprogs/exfatprogs.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# exfatprogs
> +#
> +################################################################################
> +
> +EXFATPROGS_VERSION = 1.0.1
> +EXFATPROGS_SITE = $(call github,exfatprogs,exfatprogs,$(EXFATPROGS_VERSION))
> +EXFATPROGS_LICENSE = GPL-2.0
> +EXFATPROGS_LICENSE_FILES = COPYING
> +EXFATPROGS_DEPENDENCIES = host-pkgconf
> +EXFATPROGS_AUTORECONF = YES
> +
> +$(eval $(autotools-package))
> -- 
> 2.20.1
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
