From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Oct 2015 11:15:13 +0200
Subject: [Buildroot] [PATCH 1/2] Add package libhackrf
In-Reply-To: <1444546853-1505-1-git-send-email-jrspruitt@gmail.com>
References: <1444546853-1505-1-git-send-email-jrspruitt@gmail.com>
Message-ID: <20151011111513.012e06c8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jason Pruitt,

Thanks for your contribution!

By convention, the title of the commits for new packages should be:

	<package>: new package

i.e in this case:

	libhackrf: new package

See some other comments below.


On Sun, 11 Oct 2015 00:00:52 -0700, Jason Pruitt wrote:
> diff --git a/package/libhackrf/0001-disabled_shared_library_in_build.patch b/package/libhackrf/0001-disabled_shared_library_in_build.patch
> new file mode 100644
> index 0000000..98a2af8
> --- /dev/null
> +++ b/package/libhackrf/0001-disabled_shared_library_in_build.patch
> @@ -0,0 +1,54 @@
> +diff -rupN hackrf/host/libhackrf/src/CMakeLists.txt libhackrf-v2015.07.2/host/libhackrf/src/CMakeLists.txt
> +--- hackrf/host/libhackrf/src/CMakeLists.txt	2015-10-10 13:31:57.754026872 -0700
> ++++ libhackrf-v2015.07.2/host/libhackrf/src/CMakeLists.txt	2015-10-10 13:30:52.162026628 -0700

All patches should have a description + Signed-off-by. Also, since the
upstream project is using Git, it would be preferable to have a patch
generated with Git. In addition, if you can submit to the upstream
project this change, it would be useful.

> diff --git a/package/libhackrf/Config.in b/package/libhackrf/Config.in
> new file mode 100644
> index 0000000..2666a46
> --- /dev/null
> +++ b/package/libhackrf/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_LIBHACKRF
> +	bool "libhackrf"
> +	select BR2_PACKAGE_LIBUSB
> +	depends on BR2_TOOLCHAIN_HAS_THREADS

Since you depend on thread support, you need to add a Config.in
"comment", like:

comment "libhackrf needs a toolchain w/ threads"
	depends on !BR2_TOOLCHAIN_HAS_THREADS

> +	help
> +	  Library for accessing HackRF SDR boards.
> +
> +	  https://github.com/mossmann/hackrf/host/libhackrf
> +

This last empty new line is not needed.

> diff --git a/package/libhackrf/libhackrf.mk b/package/libhackrf/libhackrf.mk
> new file mode 100644
> index 0000000..d7ed919
> --- /dev/null
> +++ b/package/libhackrf/libhackrf.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# libhackrf 
> +#
> +################################################################################
> +
> +LIBHACKRF_VERSION = v2015.07.2
> +LIBHACKRF_SITE = $(call github,mossmann,hackrf,$(LIBHACKRF_VERSION))
> +LIBHACKRF_LICENSE = GPLv2+
> +LIBHACKRF_LICENSE_FILES = COPYING

Indeed, the COPYING file says GPLv2, but the library source file itself
(https://github.com/mossmann/hackrf/blob/master/host/libhackrf/src/hackrf.c)
advertise a BSD-3c license.

> +LIBHACKRF_DEPENDENCIES = libusb
> +LIBHACKRF_SUBDIR = host/libhackrf

Why do you have two packages for libhackrf and hackrf-tools if they are
part of the same upstream repository? There should be a single
Buildroot package for both, possibly with sub-options to select only
the library, or the library + the tools. Especially since there is a
host/CMakeLists.txt file that allows to build both.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
