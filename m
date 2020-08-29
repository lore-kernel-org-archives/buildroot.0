From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 22:48:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/multipath-tools: new package
In-Reply-To: <20200829082632.27414-1-egorenar-dev@posteo.net>
References: <20200829082632.27414-1-egorenar-dev@posteo.net>
Message-ID: <20200829224826.05bdb28b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alexander,

Again, thanks for your contribution! See below for a number of comments.

On Sat, 29 Aug 2020 10:26:32 +0200
Alexander Egorenkov <egorenar-dev@posteo.net> wrote:

> Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
> ---
>  package/Config.in                             |  1 +
>  .../0001-Cross-compilation-fixes.patch        | 45 +++++++++++++++++
>  .../0002-Fix-parallel-make.patch              | 49 +++++++++++++++++++
>  .../multipath-tools/0003-systemd-fix.patch    | 28 +++++++++++
>  .../0004-udev-rules-path.patch                | 13 +++++
>  ...005-libdmmp_private.h-add-TRUE-FALSE.patch | 17 +++++++
>  package/multipath-tools/Config.in             | 12 +++++
>  package/multipath-tools/S60multipathd         | 39 +++++++++++++++
>  package/multipath-tools/multipath-tools.hash  |  3 ++
>  package/multipath-tools/multipath-tools.mk    | 34 +++++++++++++
>  10 files changed, 241 insertions(+)

As usual, we need an entry in the DEVELOPERS file.

>  create mode 100644 package/multipath-tools/0001-Cross-compilation-fixes.patch
>  create mode 100644 package/multipath-tools/0002-Fix-parallel-make.patch
>  create mode 100644 package/multipath-tools/0003-systemd-fix.patch
>  create mode 100644 package/multipath-tools/0004-udev-rules-path.patch
>  create mode 100644 package/multipath-tools/0005-libdmmp_private.h-add-TRUE-FALSE.patch

All those patches should have a description, Signed-off-by line, and be
generated with git format-patch.

> diff --git a/package/multipath-tools/0001-Cross-compilation-fixes.patch b/package/multipath-tools/0001-Cross-compilation-fixes.patch
> new file mode 100644
> index 0000000000..8914b3bae7
> --- /dev/null
> +++ b/package/multipath-tools/0001-Cross-compilation-fixes.patch
> @@ -0,0 +1,45 @@
> +Index: multipath-tools-0.8.4/libmultipath/Makefile
> +===================================================================
> +--- multipath-tools-0.8.4.orig/libmultipath/Makefile
> ++++ multipath-tools-0.8.4/libmultipath/Makefile
> +@@ -20,21 +20,10 @@ ifdef SYSTEMD
> + 	endif
> + endif
> + 
> +-ifneq ($(call check_func,dm_task_no_flush,/usr/include/libdevmapper.h),0)
> +-	CFLAGS += -DLIBDM_API_FLUSH -D_GNU_SOURCE
> +-endif
> +-
> +-ifneq ($(call check_func,dm_task_set_cookie,/usr/include/libdevmapper.h),0)
> +-	CFLAGS += -DLIBDM_API_COOKIE
> +-endif
> +-
> +-ifneq ($(call check_func,udev_monitor_set_receive_buffer_size,/usr/include/libudev.h),0)
> +-	CFLAGS += -DLIBUDEV_API_RECVBUF
> +-endif
> +-
> +-ifneq ($(call check_func,dm_task_deferred_remove,/usr/include/libdevmapper.h),0)
> +-	CFLAGS += -DLIBDM_API_DEFERRED
> +-endif
> ++CFLAGS += -DLIBDM_API_FLUSH -D_GNU_SOURCE
> ++CFLAGS += -DLIBDM_API_COOKIE
> ++CFLAGS += -DLIBUDEV_API_RECVBUF
> ++CFLAGS += -DLIBDM_API_DEFERRED

Hum, this is not the best solution. Can we find something that works
also for cross-compilation ?

> diff --git a/package/multipath-tools/0002-Fix-parallel-make.patch b/package/multipath-tools/0002-Fix-parallel-make.patch
> new file mode 100644
> index 0000000000..8d493659bd
> --- /dev/null
> +++ b/package/multipath-tools/0002-Fix-parallel-make.patch

This one can be submitted upstream. Did you do it already?

> diff --git a/package/multipath-tools/0003-systemd-fix.patch b/package/multipath-tools/0003-systemd-fix.patch
> new file mode 100644
> index 0000000000..15e708b2ca
> --- /dev/null
> +++ b/package/multipath-tools/0003-systemd-fix.patch
> @@ -0,0 +1,28 @@
> +Index: multipath-tools-0.8.4/Makefile.inc
> +===================================================================
> +--- multipath-tools-0.8.4.orig/Makefile.inc
> ++++ multipath-tools-0.8.4/Makefile.inc
> +@@ -36,13 +36,8 @@ ifndef RUN
> + endif
> + 
> + ifndef SYSTEMD
> +-	ifeq ($(shell pkg-config --modversion libsystemd >/dev/null 2>&1 && echo 1), 1)
> +-		SYSTEMD = $(shell pkg-config --modversion libsystemd)
> +-	else
> +-		ifeq ($(shell systemctl --version >/dev/null 2>&1 && echo 1), 1)
> +-			SYSTEMD = $(shell systemctl --version 2> /dev/null | \
> +-				sed -n 's/systemd \([0-9]*\).*/\1/p')
> +-		endif
> ++	ifeq ($(shell $(PKG_CONFIG) --modversion libsystemd >/dev/null 2>&1 && echo 1), 1)
> ++		SYSTEMD = $(shell $(PKG_CONFIG) --modversion libsystemd)
> + 	endif

I like that you're using $(PKG_CONFIG), but it's a bit annoying that
you're dropping the systemctl usage because it makes the patch probably
unsuitable for upstream. Should there be a way to avoid the systemctl
usage if we're cross-compiling ?

> diff --git a/package/multipath-tools/0004-udev-rules-path.patch b/package/multipath-tools/0004-udev-rules-path.patch
> new file mode 100644
> index 0000000000..a53be4004c
> --- /dev/null
> +++ b/package/multipath-tools/0004-udev-rules-path.patch
> @@ -0,0 +1,13 @@
> +Index: multipath-tools-0.8.4/Makefile.inc
> +===================================================================
> +--- multipath-tools-0.8.4.orig/Makefile.inc
> ++++ multipath-tools-0.8.4/Makefile.inc
> +@@ -49,7 +49,7 @@ prefix		=
> + exec_prefix	= $(prefix)
> + usr_prefix	= $(prefix)
> + bindir		= $(exec_prefix)/sbin
> +-libudevdir	= $(prefix)/$(SYSTEMDPATH)/udev
> ++libudevdir	= $(prefix)/lib/udev

Not sure why this change is needed. Perhaps to support non-systemd
situations ?

> diff --git a/package/multipath-tools/0005-libdmmp_private.h-add-TRUE-FALSE.patch b/package/multipath-tools/0005-libdmmp_private.h-add-TRUE-FALSE.patch
> new file mode 100644
> index 0000000000..4d6f71cb86
> --- /dev/null
> +++ b/package/multipath-tools/0005-libdmmp_private.h-add-TRUE-FALSE.patch
> @@ -0,0 +1,17 @@
> +--- a/libdmmp/libdmmp_private.h	2020-06-29 08:29:04.308560526 +0200
> ++++ b/libdmmp/libdmmp_private.h	2020-06-29 08:29:12.196605583 +0200
> +@@ -34,6 +34,14 @@
> + 
> + #include "libdmmp/libdmmp.h"
> + 
> ++#ifndef FALSE
> ++#define FALSE   (0)
> ++#endif
> ++
> ++#ifndef TRUE
> ++#define TRUE    (!FALSE)
> ++#endif
> ++
> + #ifdef __cplusplus
> + extern "C" {
> + #endif

This should be submitted upstream too.

> diff --git a/package/multipath-tools/Config.in b/package/multipath-tools/Config.in
> new file mode 100644
> index 0000000000..54f670089c
> --- /dev/null
> +++ b/package/multipath-tools/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_MULTIPATH_TOOLS
> +	bool "multipath-tools"
> +	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HAS_UDEV
> +	select BR2_PACKAGE_LIBURCU

So you need to replicate:

        depends on BR2_TOOLCHAIN_HAS_THREADS

> +	select BR2_PACKAGE_JSON_C

So you need to replicate:

        depends on BR2_TOOLCHAIN_HAS_SYNC_4

> +	select BR2_PACKAGE_LIBAIO

Is libaio directly used by multipath-tools, or just as a dependency of
lvm2 ?

> +	select BR2_PACKAGE_READLINE
> +	select BR2_PACKAGE_LVM2

You also need to replicate:

        depends on BR2_TOOLCHAIN_HAS_THREADS
        depends on BR2_USE_MMU # needs fork()
        depends on !BR2_STATIC_LIBS # It fails to build statically

> +	select BR2_PACKAGE_LVM2_STANDARD_INSTALL

And:

        depends on !BR2_TOOLCHAIN_USES_MUSL

> +	help
> +	  Makes a small dumpfile of kdump.

This description is wrong.

The upstream URL of the project at the end of the Config.in help text
is missing.

Hint: run "make check-package".

You're also missing a Config.in comment about the dependencies.

> diff --git a/package/multipath-tools/S60multipathd b/package/multipath-tools/S60multipathd
> new file mode 100644
> index 0000000000..1c687901c7
> --- /dev/null
> +++ b/package/multipath-tools/S60multipathd

Could you take package/busybox/S01syslogd as a template for the init
script ?

> diff --git a/package/multipath-tools/multipath-tools.hash b/package/multipath-tools/multipath-tools.hash
> new file mode 100644
> index 0000000000..7eaf246094
> --- /dev/null
> +++ b/package/multipath-tools/multipath-tools.hash
> @@ -0,0 +1,3 @@
> +# Locally computed:
> +sha256  ccd73bf67621161d9e42d1a770c3a7efff6e252433e8b8ed5f64a88cb5e7151d  multipath-tools-0.8.4.tar.gz
> +sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
> diff --git a/package/multipath-tools/multipath-tools.mk b/package/multipath-tools/multipath-tools.mk
> new file mode 100644
> index 0000000000..2572172895
> --- /dev/null
> +++ b/package/multipath-tools/multipath-tools.mk
> @@ -0,0 +1,34 @@
> +################################################################################
> +#
> +# multipath-tools
> +#
> +################################################################################
> +
> +MULTIPATH_TOOLS_VERSION = 0.8.4
> +MULTIPATH_TOOLS_SITE = $(call github,openSUSE,multipath-tools,$(MULTIPATH_TOOLS_VERSION))
> +MULTIPATH_TOOLS_LICENSE = LGPL-2.0
> +MULTIPATH_TOOLS_LICENSE_FILES = COPYING
> +MULTIPATH_TOOLS_DEPENDENCIES = lvm2 json-c readline udev

In the Config.in file, you are selecting liburcu, libaio, but you don't
have them as build dependencies here. Could you check that ?

Also, since you're using pkg-config, you probably want host-pkgconf in
the dependencies.

> +MULTIPATH_TOOLS_MAKE_FLAGS =

An empty variable is quite useless.

> +
> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> +MULTIPATH_TOOLS_DEPENDENCIES += systemd
> +endif
> +
> +define MULTIPATH_TOOLS_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC="$(TARGET_CC)" PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
> +		OPTFLAGS="$(TARGET_CFLAGS)"

Could you try to use $(TARGET_CONFIGURE_OPTS) to pass CC, PKG_CONFIG,
etc. ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
