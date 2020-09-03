From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Sep 2020 23:42:34 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/multipath-tools: new package
In-Reply-To: <20200831185010.16556-1-egorenar-dev@posteo.net>
References: <20200831185010.16556-1-egorenar-dev@posteo.net>
Message-ID: <20200903234234.2f4d6793@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Aleksander,

On Mon, 31 Aug 2020 20:50:10 +0200
Alexander Egorenkov <egorenar-dev@posteo.net> wrote:

> Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>

Here as well, the patch looks mostly good (see below the minor
comments), but the main issue is that it doesn't build.

The following defconfig:

BR2_x86_64=y
BR2_x86_core2=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-core2-full-2020.02.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_4=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_MULTIPATH_TOOLS=y
# BR2_TARGET_ROOTFS_TAR is not set

fails to build because multipath-tools is unconditionally build with
-fstack-protector.

I've disabled that by passing STACKPROT= as a make option, which allows
to get passed that. But then it fails with:

parser.c: In function ?set_value?:
parser.c:375:4: error: ?strncat? specified bound 1 equals source length [-Werror=stringop-overflow=]
    strncat(alloc, " ", 1);
    ^~~~~~~~~~~~~~~~~~~~~~

Could you test this package a bit better by using ./utils/test-pkg ?

> diff --git a/package/multipath-tools/0001-kpartx-libmultipath-use-pkg-config-to-get-path-to-he.patch b/package/multipath-tools/0001-kpartx-libmultipath-use-pkg-config-to-get-path-to-he.patch
> new file mode 100644
> index 0000000000..e1ab73312d
> --- /dev/null
> +++ b/package/multipath-tools/0001-kpartx-libmultipath-use-pkg-config-to-get-path-to-he.patch
> @@ -0,0 +1,59 @@
> +From f55b1a37e2c43b67e7fd7f6a39afe2b2316b7cf9 Mon Sep 17 00:00:00 2001
> +From: Alexander Egorenkov <egorenar-dev@posteo.net>
> +Date: Mon, 31 Aug 2020 19:05:46 +0200
> +Subject: [PATCH 1/1] kpartx, libmultipath: use pkg-config to get path to

Patches should be generated with "git format-patch -N", so that we have
[PATCH] instead of [PATCH 1/1].

> diff --git a/package/multipath-tools/0002-libmpathpersist-depend-on-libmultipath.patch b/package/multipath-tools/0002-libmpathpersist-depend-on-libmultipath.patch
> new file mode 100644
> index 0000000000..236d2b7116
> --- /dev/null
> +++ b/package/multipath-tools/0002-libmpathpersist-depend-on-libmultipath.patch
> @@ -0,0 +1,30 @@
> +From 48f537b9fef4f9db761466b8951fb63243f06602 Mon Sep 17 00:00:00 2001
> +From: Christian Hesse <mail@eworm.de>
> +Date: Wed, 6 May 2020 09:35:47 +0200
> +Subject: [PATCH 1/1] libmpathpersist: depend on libmultipath

Ditto.

> +
> +Without this the build fails with:
> +
> +/usr/bin/ld: cannot find -lmultipath
> +
> +Signed-off-by: Christian Hesse <mail@eworm.de>

We need you to add your Signed-off-by on all patches you've imported.

> diff --git a/package/multipath-tools/Config.in b/package/multipath-tools/Config.in
> new file mode 100644
> index 0000000000..74bfe74964
> --- /dev/null
> +++ b/package/multipath-tools/Config.in
> @@ -0,0 +1,30 @@
> +comment "multipath-tools needs a uClibc or glibc toolchain"

	w/ threads, dynamic library

> +	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +	depends on !BR2_TOOLCHAIN_USES_MUSL
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> +
> +config BR2_PACKAGE_MULTIPATH_TOOLS
> +	bool "multipath-tools"
> +	depends on !BR2_STATIC_LIBS
> +	depends on !BR2_TOOLCHAIN_USES_MUSL
> +	depends on BR2_USE_MMU
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HAS_UDEV
> +	select BR2_PACKAGE_JSON_C
> +	select BR2_PACKAGE_LIBURCU
> +	select BR2_PACKAGE_LIBAIO
> +	select BR2_PACKAGE_LVM2
> +	select BR2_PACKAGE_LVM2_STANDARD_INSTALL
> +	select BR2_PACKAGE_READLINE
> +	help
> +	  This package provides the following binaries to drive the Device Mapper
> +	  multipathing driver:  
> +	    * multipath - Device mapper target autoconfig.
> +	    * multipathd - Multipath daemon.
> +	    * mpathpersist - Manages SCSI persistent reservations on dm multipath devices.
> +	    * kpartx - Create device maps from partition tables.

Some lines are too long. Please run "make check-package" and ensure you
don't have any warning.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
