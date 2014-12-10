From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Dec 2014 18:47:04 +0100
Subject: [Buildroot] [PATCH v2 1/3] util-linux: enable host fdisk
In-Reply-To: <1418141008-18739-2-git-send-email-kaszak@gmail.com>
References: <1418141008-18739-1-git-send-email-kaszak@gmail.com>
 <1418141008-18739-2-git-send-email-kaszak@gmail.com>
Message-ID: <20141210174704.GB3926@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Karoly, All,

On 2014-12-09 17:03 +0100, Karoly Kasza spake thusly:
> Enable the building of fdisk utility for host.

We've reviewed your patch series yesterday during the Patchwork cleanup
session, and cam e to this conclusion about this patch: we think there
is a better solution as proposed by Thierry Bultel in:
    http://patchwork.ozlabs.org/patch/419247/

The patch from Thierry is better because it is simpler and does not need
patching util-linux.

The solution to build all or nothing is an acceptable trade-off for
simplicity. Also, if later the need arise to install yet another host
util-linux program, we'd have to add yet another option and further
patch util-linux. The gain is not that important when compared to
maintainability and simplicity.

So, we marked this patch as Rejected in Patchwork.

Thank you for contribution!

Regards,
Yann E. MORIN.

> Signed-off-by: Karoly Kasza <kaszak@gmail.com>
> ---
> 
> Changes v1 -> v2:
>   - Wording.
> 
>  package/util-linux/Config.in.host                  |    9 ++++++
>  .../util-linux/util-linux-004-enable-fdisk.patch   |   34 ++++++++++++++++++++
>  package/util-linux/util-linux.mk                   |    5 +++
>  3 files changed, 48 insertions(+)
>  create mode 100644 package/util-linux/util-linux-004-enable-fdisk.patch
> 
> diff --git a/package/util-linux/Config.in.host b/package/util-linux/Config.in.host
> index f73dc43..65f4a87 100644
> --- a/package/util-linux/Config.in.host
> +++ b/package/util-linux/Config.in.host
> @@ -6,3 +6,12 @@ config BR2_PACKAGE_HOST_UTIL_LINUX
>  	  Things like mkfs, mkswap, swapon, fdisk, mount, dmesg, etc...
>  
>  	  http://www.kernel.org/pub/linux/utils/util-linux/
> +
> +if BR2_PACKAGE_HOST_UTIL_LINUX
> +
> +config BR2_PACKAGE_HOST_UTIL_LINUX_FDISK
> +	bool "fdisk"
> +	help
> +	  Enable compiling fdisk for the host
> +
> +endif
> diff --git a/package/util-linux/util-linux-004-enable-fdisk.patch b/package/util-linux/util-linux-004-enable-fdisk.patch
> new file mode 100644
> index 0000000..5faf1bb
> --- /dev/null
> +++ b/package/util-linux/util-linux-004-enable-fdisk.patch
> @@ -0,0 +1,34 @@
> +Add options to enable/disable libfdisk and fdisk
> +
> +This is needed to be able to just build an fdisk binary
> +for the host package.
> +
> +Signed-off-by: Karoly Kasza <kaszak@gmail.com>
> +
> +--- util-linux-2.25.1.orig/configure.ac	2014-10-11 13:47:52.000000000 +0200
> ++++ util-linux-2.25.1/configure.ac	2014-10-11 13:45:50.065076171 +0200
> +@@ -820,12 +820,22 @@
> + dnl
> + dnl libfdisk is enabled at all times if possible
> + dnl
> +-UL_BUILD_INIT([libfdisk], [check])
> ++# this behaviour changed for buildroot, along with fdisk
> ++AC_ARG_ENABLE([libfdisk],
> ++  AS_HELP_STRING([--disable-libfdisk], [do not build libfdisk]),
> ++  [], [UL_DEFAULT_ENABLE([libfdisk], [check])]
> ++)
> ++UL_BUILD_INIT([libfdisk])
> + UL_REQUIRES_BUILD([libfdisk], [libuuid])
> + UL_REQUIRES_BUILD([libfdisk], [libsmartcols])
> + AM_CONDITIONAL([BUILD_LIBFDISK], [test "x$build_libfdisk" = xyes])
> + 
> +-UL_BUILD_INIT([fdisk], [check])
> ++
> ++AC_ARG_ENABLE([fdisk],
> ++  AS_HELP_STRING([--disable-fdisk], [do not build fdisk]),
> ++  [], [UL_DEFAULT_ENABLE([fdisk], [check])]
> ++)
> ++UL_BUILD_INIT([fdisk])
> + UL_REQUIRES_BUILD([fdisk], [libfdisk])
> + AM_CONDITIONAL([BUILD_FDISK], [test "x$build_fdisk" = xyes])
> + 
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index dc10193..9f70a11 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -97,6 +97,11 @@ HOST_UTIL_LINUX_CONF_OPTS += \
>  	--disable-libblkid --disable-libmount \
>  	--disable-all-programs --without-ncurses
>  
> +# Build host fdisk if selected
> +ifeq ($(BR2_PACKAGE_HOST_UTIL_LINUX_FDISK),y)
> +HOST_UTIL_LINUX_CONF_OPTS += --enable-fdisk --enable-libfdisk --enable-libsmartcols
> +endif
> +
>  # Avoid building the tools if they are disabled since we can't install on
>  # a per-directory basis.
>  ifeq ($(BR2_PACKAGE_UTIL_LINUX_BINARIES),)
> -- 
> 1.7.10.4
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
