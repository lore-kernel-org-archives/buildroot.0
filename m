From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 20:49:27 +0200
Subject: [Buildroot] squashfs-fuse: new package
In-Reply-To: <CAETHaKp82wP9fk=hFVp2--GBauJBoefW5VD=zVpp-7nJojJZGA@mail.gmail.com>
References: <CAETHaKp82wP9fk=hFVp2--GBauJBoefW5VD=zVpp-7nJojJZGA@mail.gmail.com>
Message-ID: <20170731204927.06eeb004@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Jul 2017 22:59:24 -0400, Dave Bender wrote:
> Added FUSE squashfs utilities
> 
> Signed-off-by: David Bender <codehero@gmail.com>

Thanks for a contribution! See below for a few comments/issues. If you
could fix them, and send an updated version, it would be nice!

> ---
>  package/Config.in                      |  1 +
>  package/squashfs-fuse/Config.in        | 14 ++++++++++++++
>  package/squashfs-fuse/squashfs-fuse.mk | 14 ++++++++++++++

Please add a .hash file in the package directory, and also an entry in
the top-level DEVELOPERS file.

> diff --git a/package/squashfs-fuse/Config.in b/package/squashfs-fuse/Config.in
> new file mode 100644
> index 0000000..b5f3537
> --- /dev/null
> +++ b/package/squashfs-fuse/Config.in

Indentation in this file is wrong. Look at other packages, and run
utils/check-package on your package to see the problems.

> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_SQUASHFS_FUSE
> + bool "squashfs (FUSE)"

Should be:

	bool "squashfs-fuse"

> + select BR2_PACKAGE_LIBFUSE
> + depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
> + depends on BR2_USE_MMU # libfuse
> + depends on !BR2_STATIC_LIBS # libfuse

"depends on" before "select" (that's just a convention).

> + help
> +  A userspace squashfs implementation.
> +
> + https://github.com/vasi/squashfuse
> +
> +comment "squashfs needs a toolchain w/ threads, dynamic library"

squashfs -> squashfs-fuse

> + depends on BR2_USE_MMU
> + depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> diff --git a/package/squashfs-fuse/squashfs-fuse.mk
> b/package/squashfs-fuse/squashfs-fuse.mk
> new file mode 100644
> index 0000000..812a197
> --- /dev/null
> +++ b/package/squashfs-fuse/squashfs-fuse.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# Squashfs-fuse

squashfs-fuse (lower case)

> +#
> +################################################################################
> +
> +SQUASHFS_FUSE_VERSION = 1f980303b89c779eabfd0a0fdd36d6a7a311bf92
> +SQUASHFS_FUSE_SITE = $(call github,vasi,squashfuse,$(SQUASHFS_FUSE_VERSION))
> +SQUASHFS_FUSE_DEPENDENCIES = libfuse host-pkgconf
> +SQUASHFS_FUSE_LICENSE = BSD-2c

BSD-2-Clause

> +SQUASHFS_FUSE_LICENSE_FILES = LICENSE
> +SQUASHFS_FUSE_AUTORECONF = YES
> +
> +$(eval $(autotools-package))

Other than that, looks good. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
