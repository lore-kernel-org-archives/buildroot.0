From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 25 Mar 2015 11:24:11 +0100
Subject: [Buildroot] [PATCH v6] package/sysdig: New package
In-Reply-To: <1427278819-9444-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1427278819-9444-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <CAGm1_kv+6T9CHfeNfQxbQAVsGd5s3P8W2boPSckWbKcvTpYoKQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 25, 2015 at 11:20 AM, Angelo Compagnucci
<angelo.compagnucci@gmail.com> wrote:
> Sysdig is open source, system-level exploration:
> capture system state and activity from a running Linux
> instance, then save, filter and analyze.
>
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
> Changes v5 -> v6:
>   - Patching kernel module makefile to be compatible with buildroot.
>   - Patching cmakefile to remove unneed installation of DKMS infrastructure.
>   - Removing of unneeded post installation script.
>   - Added -DUSE_BUNDLED_JSONCPP = NO
>   - Package is now at the bare minimum.
>
> Changes v4 -> v5:
>   - Adjusted to 80 columns for sysdig.mk header
>
> Changes v3 -> v4:
>   - Changed "depends on" to "select" and fixed selected packages
>     dependencies.
>   - moved "comment" section to the bottom
>
> Changes v2 -> v3:
>   - Changed "depends on" and "select" to simplify package
>
> Changes v1 -> v2:
>   - Changed "depends on" with "select" for dependencies (suggested by Baruch)
>   - Added comment "sysdig needs a Linux kernel to be built" (suggested by Baruch)
>   - Upgreded to recently released 0.1.99
>
>  package/Config.in                                  |  3 +-
>  .../0001-makefile-driver-compile-options.patch     | 23 ++++++++++++++++
>  .../sysdig/0002-remove-dkms-module-updater.patch   | 32 ++++++++++++++++++++++
>  package/sysdig/Config.in                           | 21 ++++++++++++++
>  package/sysdig/sysdig.mk                           | 16 +++++++++++
>  5 files changed, 94 insertions(+), 1 deletion(-)
>  create mode 100644 package/sysdig/0001-makefile-driver-compile-options.patch
>  create mode 100644 package/sysdig/0002-remove-dkms-module-updater.patch
>  create mode 100644 package/sysdig/Config.in
>  create mode 100644 package/sysdig/sysdig.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index e4ee95d..f3937e9 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -94,7 +94,8 @@ endif
>         source "package/spidev_test/Config.in"
>         source "package/strace/Config.in"
>         source "package/stress/Config.in"
> -       source "package/sysprof/Config.in"
> +       source "package/sysprof/Config.in
> +       source "package/sysdig/Config.in""

This part doesn't look correct.

>         source "package/tinymembench/Config.in"
>         source "package/trace-cmd/Config.in"
>         source "package/trinity/Config.in"
> diff --git a/package/sysdig/0001-makefile-driver-compile-options.patch b/package/sysdig/0001-makefile-driver-compile-options.patch
> new file mode 100644
> index 0000000..b3444ad
> --- /dev/null
> +++ b/package/sysdig/0001-makefile-driver-compile-options.patch
> @@ -0,0 +1,23 @@
> +Updated Makefile compile options
> +
> +This patch updates linux kernel module (driver) of sysdig to be
> +compatible with buildroot compile flags.
> +
> +Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> +
> +--- a/driver/Makefile.in
> ++++ b/driver/Makefile.in
> +@@ -6,10 +6,10 @@ KERNELDIR            ?= /lib/modules/$(shell uname -r)/build
> +
> + TOP := $(shell pwd)
> + all:
> +-      $(MAKE) -C $(KERNELDIR) M=$(TOP) modules
> ++      $(MAKE) $(LINUX_MAKE_FLAGS) -C $(KERNELDIR) M=$(TOP) modules
> +
> + clean:
> +-      $(MAKE) -C $(KERNELDIR) M=$(TOP) clean
> ++      $(MAKE) $(LINUX_MAKE_FLAGS) -C $(KERNELDIR) M=$(TOP) clean
> +
> + install: all
> +-      $(MAKE) -C $(KERNELDIR) M=$(TOP) modules_install
> ++      $(MAKE) $(LINUX_MAKE_FLAGS) -C $(KERNELDIR) M=$(TOP) modules_install
> diff --git a/package/sysdig/0002-remove-dkms-module-updater.patch b/package/sysdig/0002-remove-dkms-module-updater.patch
> new file mode 100644
> index 0000000..66fe3dd
> --- /dev/null
> +++ b/package/sysdig/0002-remove-dkms-module-updater.patch
> @@ -0,0 +1,32 @@
> +Rmove DKMS module updater
> +
> +This patch disables the in target installation of DKMS module updater
> +mechanism unneeded in buildroot.
> +
> +Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> +
> +--- a/driver/CMakeLists.txt
> ++++ b/driver/CMakeLists.txt
> +@@ -38,22 +38,3 @@ add_custom_target(install_driver
> +       DEPENDS driver
> +       WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
> +       VERBATIM)
> +-
> +-install(FILES ${CMAKE_CURRENT_BINARY_DIR}/Makefile.dkms
> +-      RENAME Makefile
> +-      DESTINATION "src/sysdig-${SYSDIG_VERSION}")
> +-
> +-install(FILES
> +-      ${CMAKE_CURRENT_BINARY_DIR}/dkms.conf
> +-      dynamic_params_table.c
> +-      event_table.c
> +-      flags_table.c
> +-      main.c
> +-      ppm.h
> +-      ppm_events.c
> +-      ppm_events.h
> +-      ppm_events_public.h
> +-      ppm_fillers.c
> +-      ppm_ringbuffer.h
> +-      syscall_table.c
> +-      DESTINATION "src/sysdig-${SYSDIG_VERSION}")
> diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
> new file mode 100644
> index 0000000..caf7ef8
> --- /dev/null
> +++ b/package/sysdig/Config.in
> @@ -0,0 +1,21 @@
> +config BR2_PACKAGE_SYSDIG
> +       bool "sysdig"
> +       select BR2_PACKAGE_ZLIB
> +       select BR2_PACKAGE_LUAJIT
> +       select BR2_PACKAGE_JSONCPP
> +       depends on BR2_LINUX_KERNEL
> +       depends on BR2_INSTALL_LIBSTDCPP # libjson
> +       depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
> +       help
> +         Sysdig is open source, system-level exploration:
> +         capture system state and activity from a running Linux instance,
> +         then save, filter and analyze.
> +         Think of it as strace + tcpdump + lsof + awesome sauce.
> +         With a little Lua cherry on top.
> +
> +         http://sysdig.org
> +
> +comment "sysdig needs a toolchain w/ C++ and a Linux kernel to be built"
> +       depends on !BR2_LINUX_KERNEL
> +       depends on !BR2_INSTALL_LIBSTDCPP
> +       depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
> diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
> new file mode 100644
> index 0000000..769cfe2
> --- /dev/null
> +++ b/package/sysdig/sysdig.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# sysdig
> +#
> +################################################################################
> +
> +SYSDIG_VERSION = 0.1.99
> +SYSDIG_SITE = $(call github,draios,sysdig,$(SYSDIG_VERSION))
> +SYSDIG_LICENSE = GPLv2
> +SYSDIG_LICENSE_FILES = COPYING
> +SYSDIG_CONF_OPTS = -DUSE_BUNDLED_LUAJIT=OFF -DUSE_BUNDLED_ZLIB=OFF \
> +       -DUSE_BUNDLED_JSONCPP=OFF
> +SYSDIG_DEPENDENCIES = zlib luajit libjson linux
> +SYSDIG_SUPPORTS_IN_SOURCE_BUILD = NO
> +
> +$(eval $(cmake-package))
> --
> 1.9.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
