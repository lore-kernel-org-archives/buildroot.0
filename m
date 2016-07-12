From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Jul 2016 16:46:36 +0200
Subject: [Buildroot] [PATCH 3/7] new package: ti-sgx/ti-sgx-um binary
 libraries SGX graphics accelerator
In-Reply-To: <1468311988-22059-4-git-send-email-lothar.felten@gmail.com>
References: <1468311988-22059-1-git-send-email-lothar.felten@gmail.com>
 <1468311988-22059-4-git-send-email-lothar.felten@gmail.com>
Message-ID: <20160712164636.321bcb42@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 12 Jul 2016 10:26:24 +0200, Lothar Felten wrote:
> This package adds the binary libraries required to use the SGX graphics
> accelerator. It corresponds to the ti-sgx/ti-sgx-km kernel module package.

I'm not sure what you means by "it corresponds".

The title should be:

	ti-sgx-um: new package

Like ti-sgx-km, it should be right under package/ I believe.

> diff --git a/package/ti-sgx/ti-sgx-um/Config.in b/package/ti-sgx/ti-sgx-um/Config.in
> new file mode 100644
> index 0000000..b6d81bd
> --- /dev/null
> +++ b/package/ti-sgx/ti-sgx-um/Config.in
> @@ -0,0 +1,4 @@
> +config BR2_PACKAGE_TI_SGX_UM
> +	bool "userspace libraries"

Should be "ti-sgx-um"

> +	help
> +	  TI SGX userspace libraries
> diff --git a/package/ti-sgx/ti-sgx-um/S80ti-sgx b/package/ti-sgx/ti-sgx-um/S80ti-sgx
> new file mode 100644
> index 0000000..8eb497e
> --- /dev/null
> +++ b/package/ti-sgx/ti-sgx-um/S80ti-sgx
> @@ -0,0 +1,16 @@
> +#!/bin/sh
> +case "$1" in
> +  start)
> +

Unneeded empty line.

> +	echo "Initializing SGX graphics driver"

Should be:

	printf "Initializing SGX graphics driver: "

to avoid the newline.

> +	/usr/bin/pvrsrvinit
> +	echo " OK"

Please test the error:

	[ $? = 0 ] && echo "OK" || echo "FAIL"

> diff --git a/package/ti-sgx/ti-sgx-um/powervr.ini b/package/ti-sgx/ti-sgx-um/powervr.ini
> new file mode 100644
> index 0000000..1d0c5e9
> --- /dev/null
> +++ b/package/ti-sgx/ti-sgx-um/powervr.ini
> @@ -0,0 +1,5 @@
> +[default]
> +WindowSystem=libpvrDRMWSEGL_FRONT.so
> +#WindowSystem=libpvrDRMWSEGL.so

Why is this commented? I guess because it's useful in some situations,
but it would be good to explain in which cases.

> +DisableHWTQTextureUpload=1
> +

Unneded empty line.

> +# This correpsonds to SDK 02.00.00.00
> +TI_SGX_UM_VERSION = e15f1543bab4de9e8927a2c4934addf3fd16ffcb
> +TI_SGX_UM_SITE = git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git

http download if possible.

> +TI_SGX_UM_LICENSE = TI TSPA License
> +TI_SGX_UM_LICENSE_FILES = OMAP5-Linux-Graphics-DDK-UM-Manifest.doc
> +TI_SGX_UM_INSTALL_STAGING = YES
> +
> +TI_SGX_UM_DEPENDENCIES = linux ti-sgx-km ti-sgx-libgbm

Do you really depend in ti-sgx-km in terms of build dependency? Also,
do you really depend on linux?

I'm making the assumption that ti-sgx-km is the kernel side, and
ti-sgx-um is the userspace side. If that is true, then there is no
reason for ti-sgx-um to depend on the kernel.

> +
> +TI_SGX_UM_MAKE_STAGING_OPTS = \
> +	$(LINUX_MAKE_FLAGS) \

This seems weird. Why do you need the kernel build flags for a
userspace library.

> +	DISCIMAGE=$(STAGING_DIR) 
> +
> +TI_SGX_UM_MAKE_OPTS = \
> +	$(LINUX_MAKE_FLAGS) \
> +	DISCIMAGE=$(TARGET_DIR) 

Do you need to pass DISCIMAGE at build time ? If not, I would prefer to
see DISCIMAGE= being passed directly in STAGING_CMDS and TARGET_CMDS.

> +define TI_SGX_UM_BUILD_CMDS
> +	$(MAKE) $(TI_SGX_UM_MAKE_OPTS) -C $(@D)
> +endef
> +
> +define TI_SGX_UM_INSTALL_STAGING_CMDS
> +	$(MAKE) $(TI_SGX_UM_MAKE_STAGING_OPTS) install -C $(@D)
> +endef
> +
> +define TI_SGX_UM_INSTALL_TARGET_CMDS
> +	$(MAKE) $(TI_SGX_UM_MAKE_OPTS) install -C $(@D)
> +endef
> +
> +define TI_SGX_UM_INSTALL_CONF_CMDS

This is never used, so the configuration file will never be installed.

> +        # libs use the following file for configuration.
> +        $(INSTALL) -D -m 0644 package/ti-sgx/ti-sgx-um/powervr.ini \
> +                $(TARGET_DIR)/etc/powervr.ini
> +endef
> +
> +define TI_SGX_UM_INSTALL_INIT_SYSV
> +        $(INSTALL) -D -m 0755 package/ti-sgx/ti-sgx-um/S80ti-sgx \
> +                $(TARGET_DIR)/etc/init.d/S80ti-sgx
> +        $(INSTALL) -D -m 0755 package/ti-sgx/ti-sgx-um/powervr.ini \
> +                $(TARGET_DIR)/etc/powervr.ini

Except here, but it shouldn't be done here since the configuration file
is not related to sysv init. So please keep your
TI_SGX_UM_INSTALL_CONF_CMDS, rename it TI_SGX_UM_INSTALL_CONF, and add
it to TI_SGX_UM_POST_INSTALL_TARGET_HOOKS.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
