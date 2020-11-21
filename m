From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 21 Nov 2020 11:55:51 +0100
Subject: [Buildroot] [PATCH v4 3/5] package/libnvidia-container: new
 package
In-Reply-To: <20201119075328.8599-3-christian@paral.in>
References: <20201119075328.8599-1-christian@paral.in>
 <20201119075328.8599-3-christian@paral.in>
Message-ID: <5f5c5a57-72c4-d7c9-5395-9042b49a5441@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christian,

Le 19/11/2020 ? 08:53, Christian Stewart a ?crit?:
> The libnvidia-container package adds a library and CLI for GPU-backed
> containers, agnostic to container runtime.
> 
> https://github.com/NVIDIA/libnvidia-container
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> 
> v1 -> v2:
> 
>  - cjs: thanks Asaf thanks for review
>  - cjs: remove extra include dirs
>  - cjs: simplify configuration opts
> 
> v2 -> v3:
> 
>  - cjs: add fixup for go-module support
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/Config.in                             |    1 +
>  ...d-fixes-from-vowstar-portage-overlay.patch | 1890 +++++++++++++++++
>  ...ve-dependency-handling-from-Makefile.patch |  698 ++++++
>  package/libnvidia-container/Config.in         |   18 +
>  .../libnvidia-container.hash                  |    3 +
>  .../libnvidia-container.mk                    |   44 +
>  6 files changed, 2654 insertions(+)
>  create mode 100644 package/libnvidia-container/0001-Build-fixes-from-vowstar-portage-overlay.patch
>  create mode 100644 package/libnvidia-container/0002-Remove-dependency-handling-from-Makefile.patch
>  create mode 100644 package/libnvidia-container/Config.in
>  create mode 100644 package/libnvidia-container/libnvidia-container.hash
>  create mode 100644 package/libnvidia-container/libnvidia-container.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 01072c3e45..ef01361fdb 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1532,6 +1532,7 @@ menu "Hardware handling"
>  	source "package/libllcp/Config.in"
>  	source "package/libmbim/Config.in"
>  	source "package/libnfc/Config.in"
> +	source "package/libnvidia-container/Config.in"
>  	source "package/libpciaccess/Config.in"
>  	source "package/libphidget/Config.in"
>  	source "package/libpri/Config.in"
> diff --git a/package/libnvidia-container/0001-Build-fixes-from-vowstar-portage-overlay.patch b/package/libnvidia-container/0001-Build-fixes-from-vowstar-portage-overlay.patch
> new file mode 100644
> index 0000000000..7232e76d97
> --- /dev/null
> +++ b/package/libnvidia-container/0001-Build-fixes-from-vowstar-portage-overlay.patch
> @@ -0,0 +1,1890 @@
> +From bd633a208446c86e11097e3cd3b019a086738ae3 Mon Sep 17 00:00:00 2001
> +From: Christian Stewart <christian@paral.in>
> +Date: Sun, 19 Jul 2020 09:56:42 -0700
> +Subject: [PATCH] Build fixes from vowstar portage overlay
> +
> +This commit brings in build fixes written by @vowstar in the overlay:
> +
> +https://github.com/vowstar/vowstar-overlay/tree/master/app-emulation/libnvidia-container/files
> +
> +Signed-off-by: Christian Stewart <christian@paral.in>
> +---

This is really a huge patch...

> diff --git a/package/libnvidia-container/0002-Remove-dependency-handling-from-Makefile.patch b/package/libnvidia-container/0002-Remove-dependency-handling-from-Makefile.patch
> new file mode 100644
> index 0000000000..d4ba9dfe80
> --- /dev/null
> +++ b/package/libnvidia-container/0002-Remove-dependency-handling-from-Makefile.patch
> @@ -0,0 +1,698 @@
> +From 6752d8d5e315eb3f061498a9c35558f90f9600e2 Mon Sep 17 00:00:00 2001
> +From: Christian Stewart <christian@paral.in>
> +Date: Sat, 18 Jul 2020 15:26:22 -0700
> +Subject: [PATCH] Remove dependency handling from Makefile
> +
> +Buildroot will handle this for the makefile.
> +
> +Signed-off-by: Christian Stewart <christian@paral.in>
> +---

Same

> diff --git a/package/libnvidia-container/Config.in b/package/libnvidia-container/Config.in
> new file mode 100644
> index 0000000000..7a452c3635
> --- /dev/null
> +++ b/package/libnvidia-container/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_LIBNVIDIA_CONTAINER
> +	bool "libnvidia-container"
> +	depends on BR2_SHARED_LIBS

BR2_SHARED_STATIC_LIBS maybe

> +	depends on BR2_TOOLCHAIN_HAS_THREADS # tirpc

Already selected by glibc toolchain.

> +	depends on BR2_TOOLCHAIN_USES_GLIBC # fexecve
> +	select BR2_PACKAGE_ELFUTILS
> +	select BR2_PACKAGE_LIBCAP
> +	select BR2_PACKAGE_LIBTIRPC
> +	select BR2_PACKAGE_NVIDIA_MODPROBE
> +	help
> +	  The libnvidia-container package adds a library and CLI for
> +	  GPU-backed containers, agnostic to container runtime.
> +
> +	  https://github.com/NVIDIA/libnvidia-container
> +
> +comment "libnvidia-container needs a shared glibc toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAN_USES_GLIBC || \
> +		!BR2_SHARED_LIBS
> diff --git a/package/libnvidia-container/libnvidia-container.hash b/package/libnvidia-container/libnvidia-container.hash
> new file mode 100644
> index 0000000000..d356eb2b1e
> --- /dev/null
> +++ b/package/libnvidia-container/libnvidia-container.hash
> @@ -0,0 +1,3 @@
> +# Locally computed:
> +sha256 fd447629fd65d171b68edb62fa2e581c67fdb450ff540f486987ab826150d06e  libnvidia-container-1.2.0.tar.gz
> +sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/libnvidia-container/libnvidia-container.mk b/package/libnvidia-container/libnvidia-container.mk
> new file mode 100644
> index 0000000000..b040c0baaa
> --- /dev/null
> +++ b/package/libnvidia-container/libnvidia-container.mk
> @@ -0,0 +1,44 @@
> +################################################################################
> +#
> +# libnvidia-container
> +#
> +################################################################################
> +
> +LIBNVIDIA_CONTAINER_VERSION = 1.2.0
> +LIBNVIDIA_CONTAINER_SITE = $(call github,NVIDIA,libnvidia-container,v$(LIBNVIDIA_CONTAINER_VERSION))
> +LIBNVIDIA_CONTAINER_LICENSE = Apache-2.0
> +LIBNVIDIA_CONTAINER_LICENSE_FILES = LICENSE
> +
> +LIBNVIDIA_CONTAINER_DEPENDENCIES = elfutils libcap libtirpc nvidia-modprobe \
> +	host-pkgconf host-elfutils host-libcap
> +
> +LIBNVIDIA_CONTAINER_MAKE_OPTS = \
> +	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
> +	OBJCPY="$(TARGET_OBJCOPY)" \
> +	RPCGEN="$(HOST_DIR)/bin/rpcgen" \
> +	WITH_LIBELF=yes \
> +	WITH_TIRPC=no

Why adding libtirpc in the dependencies and using WITH_TIRPC=no ?

Best regards,
Romain

> +
> +ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
> +LIBNVIDIA_CONTAINER_MAKE_OPTS += WITH_SECCOMP=yes
> +LIBNVIDIA_CONTAINER_DEPENDENCIES += libseccomp
> +else
> +LIBNVIDIA_CONTAINER_MAKE_OPTS += WITH_SECCOMP=no
> +endif
> +
> +define LIBNVIDIA_CONTAINER_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> +		$(TARGET_CONFIGURE_OPTS) \
> +		$(LIBNVIDIA_CONTAINER_MAKE_OPTS) \
> +		shared tools
> +endef
> +
> +define LIBNVIDIA_CONTAINER_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> +		$(TARGET_CONFIGURE_OPTS) \
> +		$(LIBNVIDIA_CONTAINER_MAKE_OPTS) \
> +		DESTDIR="$(TARGET_DIR)" \
> +		install
> +endef
> +
> +$(eval $(generic-package))
> 
