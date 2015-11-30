From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Nov 2015 22:26:23 +0100
Subject: [Buildroot] [PATCH 1/1] autofs: new package
In-Reply-To: <1448200100-29006-1-git-send-email-yba@tkos.co.il>
References: <1448200100-29006-1-git-send-email-yba@tkos.co.il>
Message-ID: <20151130222623.5835cd65@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jonathan Ben-Avraham,

On Sun, 22 Nov 2015 15:48:20 +0200, Jonathan Ben-Avraham wrote:
> From: Jonathan Ben Avraham <yba@tkos.co.il>
> 
> Add the autofs package from kernel.org
> 
> Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>

This package doesn't build when the toolchain doesn't have RPC support,
it fails due to <rpc/rpc.h> being unavailable. You can reproduce with
this configuration:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-basic-2015.11-rc1-71-g90d1299.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_3=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_AUTOFS=y
# BR2_TARGET_ROOTFS_TAR is not set

I've tried to add libtirpc support in it:

+       select BR2_PACKAGE_LIBTIRPC if !BR2_INET_RPC

in Config.in and

+ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
+AUTOFS_CONF_OPTS += --with-libtirpc
+AUTOFS_DEPENDENCIES += libtirpc
+else
+AUTOFS_CONF_OPTS += --without-libtirpc
+endif

in the .mk file, but it still doesn't find the headers because they are
located in <sysroot>/usr/include/tirpc/. The m4 code that checks for
libtirpc is wrong, as it hardcodes looking in /usr/include/tirpc:

AC_DEFUN([AF_CHECK_LIBTIRPC],
[
# save current flags
af_check_libtirpc_save_cflags="$CFLAGS"
af_check_libtirpc_save_ldflags="$LDFLAGS"
CFLAGS="$CFLAGS -I/usr/include/tirpc"

More comments below.


> diff --git a/package/autofs/Config.in b/package/autofs/Config.in
> new file mode 100644
> index 0000000..2db185b
> --- /dev/null
> +++ b/package/autofs/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_AUTOFS
> +	bool "autofs"
> +	select BR2_PACKAGE_NFS_UTILS # runtime
> +	select BR2_PACKAGE_RPCBIND # runtime
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # rpcbind
> +	depends on BR2_USE_MMU # nfs-utils, rpcbind
> +	help
> +	  Based on the Debian autofs package description:
> +	  Autofs controls the operation of the automount daemons. The automount
> +	  daemons automatically mount filesystems when they are used and unmount
> +	  them after a period of inactivity based on a set of pre-configured
> +	  maps defined by default in /etc/auto.master. The kernel automounter
> +	  implements SunOS style automounter under Linux and requires a kernel
> +	  version of at least 2.6.17 and the autofs4 kernel module.

Lines are too long, please wrap at 72.

> +	  git://git.kernel.org/pub/scm/linux/storage/autofs/autofs.git

As Baruch said, please make this link an http link. Yes, I've followed
your argumentation with Baruch, but I believe a http:// link is still
better.

> diff --git a/package/autofs/autofs.mk b/package/autofs/autofs.mk
> new file mode 100644
> index 0000000..0de6b97
> --- /dev/null
> +++ b/package/autofs/autofs.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# autofs
> +#
> +################################################################################
> +
> +AUTOFS_VERSION = 5.1.1
> +AUTOFS_SOURCE = autofs-$(AUTOFS_VERSION).tar.xz
> +AUTOFS_SITE = $(BR2_KERNEL_MIRROR)/linux/daemons/autofs/v5
> +AUTOFS_LICENSE = GPLv2+
> +AUTOFS_LICENSE_FILES = COPYING COPYRIGHT
> +
> +AUTOFS_CONF_OPTS = --disable-mount-locking \
> +	--enable-ignore-busy \
> +	--with-openldap=no \
> +	--with-sasl=no \
> +	--with-libtirpc=no

We prefer --without-<foo> rather than --with-<foo>=no.

So basically, your patch was almost ready to go, except for the build
issue on non-RPC capable toolchains.

Can you look into it and send an updated version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
