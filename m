From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Mar 2015 23:48:37 +0100
Subject: [Buildroot] [PATCH] fix eudev really not depending kernel
 headers >=3.9
In-Reply-To: <1425661783-26577-1-git-send-email-swexru@gmail.com>
References: <1425661783-26577-1-git-send-email-swexru@gmail.com>
Message-ID: <20150306234837.0e201d35@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Mednyy,

Thanks for this contribution, see some comments below.

The commit title should be something like:

	eudev: relax dependency on kernel headers version

at least, the format should almost always be:

	<package name>: <description>

Also, since the patch is doing not so trivial things, an empty commit
log is a bit strange.

On Fri,  6 Mar 2015 20:09:43 +0300, Alexey Mednyy wrote:

> diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
> index 2221966..eb266a1 100644
> --- a/package/eudev/eudev.mk
> +++ b/package/eudev/eudev.mk
> @@ -10,6 +10,7 @@ EUDEV_SITE = http://dev.gentoo.org/~blueness/eudev
>  EUDEV_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)
>  EUDEV_LICENSE_FILES = COPYING
>  EUDEV_INSTALL_STAGING = YES
> +EUDEV_AUTORECONF = YES

Add a comment above this line saying:

# We're patching configure.ac

>  # mq_getattr is in librt
>  EUDEV_CONF_ENV += LIBS=-lrt
> diff --git a/system/Config.in b/system/Config.in
> index 4d1c3d2..9e2b13f 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -128,13 +128,12 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
>  	depends on BR2_USE_WCHAR
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_USE_MMU # eudev
> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
> +#	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9

On which kernel headers version does eudev now depends? If it really
builds with old 2.6 kernel headers, then just get rid of this line
instead of commenting it out.

However, looking at the eudev source code, I don't see how your
solution can fix the problem. Indeed src/udev/udev-builtin-btrfs.c only
includes <linux/btrfs.h> if HAVE_LINUX_BTRFS_H is defined. But it uses
BTRFS_IOC_DEVICES_READY unconditionally, and this definition is only
available in <linux/btrfs.h>.

Can you expand a little bit on how this can work? Maybe I missed
something obvious?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
