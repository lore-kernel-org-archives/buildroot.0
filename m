From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Sep 2010 19:01:33 +0200
Subject: [Buildroot] [PATCH 1/2] introducing util-linux-ng as
 replacement for util-linux
In-Reply-To: <1284195279-6225-2-git-send-email-marcus.osdoba@googlemail.com>
References: <1284195279-6225-1-git-send-email-marcus.osdoba@googlemail.com>
	<1284195279-6225-2-git-send-email-marcus.osdoba@googlemail.com>
Message-ID: <20100911190133.460ab01f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 11 Sep 2010 10:54:38 +0200
Marcus Osdoba <marcus.osdoba@googlemail.com> wrote:

> mark util-linux as deprecated since next version (util-linux-ng) is available
> some basic components of utillinuxng can be switched of (--disable-<> in configure step)
> this patch uses version 2.17.2 of util-linux-ng

Thanks for doing this !

>  ...0001-replace-bcopy-bzero-index-and-rindex.patch |  418 ++++++++++++++++++++
>  .../0002-Allow-linking-with-uClibc.patch           |   26 ++

Are those two patches submitted upstream ?

> --- /dev/null
> +++ b/package/util-linux-ng/Config.in
> @@ -0,0 +1,47 @@
> +config BR2_PACKAGE_UTIL_LINUX_NG
> +	bool "util-linux-ng"
> +	depends on (BR2_PROGRAM_INVOCATION && BR2_LARGEFILE)
> +	help
> +	  Fork of util-linux which consists of essential Linux utilities.
> +
> +	  Things like mkfs, mkswap, swapon, fdisk, mount, dmesg, etc...
> +	  http://userweb.kernel.org/~kzak/util-linux-ng/
> +
> +comment "util-linux-ng requires a toolchain with PROGRAM_INVOCATION support"
> +	depends on !BR2_PROGRAM_INVOCATION
> +
> +comment "util-linux-ng requires a toolchain with LARGEFILE support"
> +	depends on !BR2_LARGEFILE

The 'old' util-linux version also needed gettext when locale support was
enabled. It isn't the case with this new version ?

> +if BR2_PACKAGE_UTIL_LINUX_NG
> +comment "utils selection"
> +
> +config BR2_PACKAGE_UTIL_LINUX_NG_LIBBLKID
> +	bool "The library and tools for blkid support."
> +	help
> +	 This package provides the recent blkid support 
> +	 (parallel versions exist in e2fsprogs and busybox)

Tab + 2 spaces before each line of the help text.

> +
> +config BR2_PACKAGE_UTIL_LINUX_NG_LIBUUID
> +	bool "The library and tools for uuid support."
> +	help
> +	 This package provides the recent uuid support 
> +	 (parallel versions exist in e2fsprogs and busybox)
> +
> +config BR2_PACKAGE_UTIL_LINUX_NG_MOUNT_UTILS
> +	bool "Devices mount/unmounting utilities"
> +	depends on BR2_PACKAGE_UTIL_LINUX_NG_LIBUUID && BR2_PACKAGE_UTIL_LINUX_NG_LIBBLKID
> +	help
> +	 This package contains utilities to mount/unmount devices.
> +	 Also provided by busybox.

So, shouldn't it be hidden when BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is no ?

> +config BR2_PACKAGE_UTIL_LINUX_NG_FSCK
> +	bool "Filesystem check"
> +	depends on BR2_PACKAGE_UTIL_LINUX_NG_LIBUUID && BR2_PACKAGE_UTIL_LINUX_NG_LIBBLKID
> +	help
> +	 Linux mainstream filesystem check.
> +	 Also provided by busybox.

Ditto.

> +#############################################################
> +#
> +# UTIL_LINUX_NG
> +#
> +#############################################################
> +UTIL_LINUX_NG_VERSION=2.17.2
> +UTIL_LINUX_NG_MAJORVERSION=2.17

Minor thing:

UTIL_LINUX_NG_VERSION=$(UTIL_LINUX_NG_MAJORVERSION).2

> +UTIL_LINUX_NG_SITE=$(BR2_KERNEL_MIRROR)/linux/utils/util-linux-ng/v$(UTIL_LINUX_NG_MAJORVERSION)
> +UTIL_LINUX_NG_SOURCE=util-linux-ng-$(UTIL_LINUX_NG_VERSION).tar.bz2
> +#UTIL_LINUX_NG_INSTALL_STAGING = YES
> +UTIL_LINUX_NG_CONF_OPT=--disable-use-tty-group \
> +                       --enable-shared \
> +                       --without-libiconv-prefix \
> +                       --without-libintl-prefix \
> +                       --disable-rpath \
> +                       --disable-nls \

Not needed, the options already contains $(DISABLE_NLS), which will
contain the right value depending on whether we want NLS support or not.

> +                       --disable-schedutils \
> +                       --disable-doc
> +
> +UTIL_LINUX_NG_DEPENDENCIES=e2fsprogs
> +UTIL_LINUX_NG_LIBTOOL_PATCH = NO

Minor: please be consistent with regard to the spaces. Either no spaces
before and after =, or spaces before and after. My preference is for
having spaces, but that's just my own.

> +# make util-linux-ng win over links to busybox binary
> +ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> +  UTIL_LINUX_NG_DEPENDENCIES+=busybox
> +endif
> +
> +ifeq ($(BR2_PACKAGE_NCURSES),y)
> +  ifneq ($(BR2_USE_WCHAR),y)
> +    UTIL_LINUX_NG_CONF_OPT+=--with-ncurses

Sounds strange. When wide char is not available, you need to enable
ncurses ? Why ?

It also lacks:

UTIL_LINUX_NG_DEPENDENCIES += curses

The rest seems ok to me.

Thanks again!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
