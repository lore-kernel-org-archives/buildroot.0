From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Jul 2016 16:41:01 +0200
Subject: [Buildroot] [PATCH 2/7] new package: ti-sgx/ti-sgx-km kernel
 module SGX graphics accelerator
In-Reply-To: <1468311988-22059-3-git-send-email-lothar.felten@gmail.com>
References: <1468311988-22059-1-git-send-email-lothar.felten@gmail.com>
 <1468311988-22059-3-git-send-email-lothar.felten@gmail.com>
Message-ID: <20160712164101.2323cca6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 12 Jul 2016 10:26:23 +0200, Lothar Felten wrote:
> This package adds the kernel module for the SGX graphics accelerator of the
> following parts: AM335x, AM437x, AM4430, AM5430
> 
> Signed-off-by: Lothar Felten <lothar.felten@gmail.com>

The title should be:

	ti-sgx-km: new package

>  package/ti-sgx/ti-sgx-km/Config.in      |  4 +++
>  package/ti-sgx/ti-sgx-km/ti-sgx-km.hash |  2 ++
>  package/ti-sgx/ti-sgx-km/ti-sgx-km.mk   | 48 +++++++++++++++++++++++++++++++++

I don't see the point of this directory hierarchy, and the top-level
ti-sgx package. Just make four different packages, directly under
package:

 - ti-sgx-km
 - ti-sgx-um
 - ti-sgx-libgbm
 - ti-sgx-demos

> diff --git a/package/ti-sgx/ti-sgx-km/Config.in b/package/ti-sgx/ti-sgx-km/Config.in
> new file mode 100644
> index 0000000..3e3b991
> --- /dev/null
> +++ b/package/ti-sgx/ti-sgx-km/Config.in
> @@ -0,0 +1,4 @@
> +config BR2_PACKAGE_TI_SGX_KM
> +	bool "kernel module"

This should be

	bool "ti-sgx-km"

Missing dependency on BR2_LINUX_KERNEL.

> +	help
> +	  TI SGX kernel module

Would be good to mention what it is useful for, and add a reference to
the "upstream" project.

> diff --git a/package/ti-sgx/ti-sgx-km/ti-sgx-km.mk b/package/ti-sgx/ti-sgx-km/ti-sgx-km.mk
> new file mode 100644
> index 0000000..b738d40
> --- /dev/null
> +++ b/package/ti-sgx/ti-sgx-km/ti-sgx-km.mk
> @@ -0,0 +1,48 @@
> +################################################################################
> +#
> +# ti-sgx-km
> +#
> +################################################################################
> +
> +# This correpsonds to SDK 02.00.00.00
> +TI_SGX_KM_VERSION = 2b7523d07a13ab704a24a7664749551f4a13ed32
> +TI_SGX_KM_SITE = git://git.ti.com/graphics/omap5-sgx-ddk-linux.git

Please use http:// download if available. It is more friendly to people
behind stupid company firewalls.

> +TI_SGX_KM_LICENSE = MIT / GPL License

Is this MIT *or* GPL, or some parts MIT and some parts GPL ?

Also, which version of the GPL ? GPLv2 ? GPLv2+ ? GPLv3 ? GPLv3+ ?

Since it's kernel code, I assume it's GPLv2.

> +TI_SGX_KM_LICENSE_FILES = GPL-COPYING MIT-COPYING
> +TI_SGX_KM_INSTALL_STAGING = YES

This last line is useless, you're not installing anything to staging.

> +
> +TI_SGX_KM_DEPENDENCIES = linux
> +
> +TI_SGX_KM_MAKE_OPTS = \
> +	$(LINUX_MAKE_FLAGS) \
> +	ARCH=arm \
> +	KERNELDIR=$(LINUX_DIR) \
> +	DISCIMAGE=$(TARGET_DIR) \
> +	PVR_NULLDRM=1

Have you tried to use the kernel-module package infrastructure ? I
haven't checked if it applies nicely or not to your package.

If it doesn't, your package should select BR2_LINUX_NEEDS_MODULES.

> +
> +ifeq ($(BR2_PACKAGE_TI_SGX_AM335X),y)
> +TI_SGX_KM_SUBDIRECTORY =  eurasia_km/eurasiacon/build/linux2/omap335x_linux
> +endif
> +
> +ifeq ($(BR2_PACKAGE_TI_SGX_AM437X),y)
> +TI_SGX_KM_SUBDIRECTORY =  eurasia_km/eurasiacon/build/linux2/omap437x_linux
> +endif
> +
> +ifeq ($(BR2_PACKAGE_TI_SGX_AM4430),y)
> +TI_SGX_KM_SUBDIRECTORY =  eurasia_km/eurasiacon/build/linux2/omap4430_linux
> +endif
> +
> +ifeq ($(BR2_PACKAGE_TI_SGX_AM5430),y)
> +TI_SGX_KM_SUBDIRECTORY =  eurasia_km/eurasiacon/build/linux2/omap5430_linux
> +endif

This seems a bit redundant. What about:

ifeq ($(BR2_PACKAGE_TI_SGX_AM335X),y)
TI_SGX_KM_PLATFORM_NAME = omap335x
else ifeq ($(BR2_PACKAGE_TI_SGX_AM437X),y)
TI_SGX_KM_PLATFORM_NAME = omap437x
else ifeq ($(BR2_PACKAGE_TI_SGX_AM4430),y)
TI_SGX_KM_PLATFORM_NAME = omap4430
else ifeq ($(BR2_PACKAGE_TI_SGX_5430),y)
TI_SGX_KM_PLATFORM_NAME = omap5430
endif

TI_SGX_KM_SUBDIRECTORY = eurasia_km/eurasiacon/build/linux2/$(TI_SGX_KM_PLATFORM_NAME)_linux

> +define TI_SGX_KM_BUILD_CMDS
> +	$(MAKE) $(TI_SGX_KM_MAKE_OPTS) -C $(@D)/$(TI_SGX_KM_SUBDIRECTORY)
> +endef
> +
> +define TI_SGX_KM_INSTALL_TARGET_CMDS
> +	$(MAKE) $(TI_SGX_KM_MAKE_OPTS) kbuild_install \
> +		-C $(@D)/$(TI_SGX_KM_SUBDIRECTORY)
> +endef
> +
> +$(eval $(generic-package))

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
