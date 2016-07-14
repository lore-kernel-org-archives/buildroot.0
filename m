From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Jul 2016 10:39:07 +0200
Subject: [Buildroot] [PATCH v2 1/5] package/ti-sgx-km: new package
In-Reply-To: <1468440819-13434-1-git-send-email-lothar.felten@gmail.com>
References: <1468440819-13434-1-git-send-email-lothar.felten@gmail.com>
Message-ID: <20160714103907.525542b8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for the respin. Looks much better! There are a few things that
remain.

On Wed, 13 Jul 2016 22:13:35 +0200, Lothar Felten wrote:


> +# This correpsonds to SDK 02.00.00.00
> +TI_SGX_KM_VERSION = 2b7523d07a13ab704a24a7664749551f4a13ed32
> +TI_SGX_KM_SITE = http://git.ti.com/graphics/omap5-sgx-ddk-linux.git
> +TI_SGX_KM_LICENSE = GPLv2 License

Just "GPLv2".

> +TI_SGX_KM_LICENSE_FILES = GPL-COPYING
> +
> +TI_SGX_KM_DEPENDENCIES = linux
> +
> +TI_SGX_KM_MAKE_OPTS = \
> +	$(LINUX_MAKE_FLAGS) \
> +	ARCH=arm \

ARCH is already in LINUX_MAKE_FLAGS.

> +	KERNELDIR=$(LINUX_DIR) \
> +	DISCIMAGE=$(TARGET_DIR) \

Why do you set DISCIMAGE here? It is nicer to only set is in the target
installation command, as it's only needed here.

> +	PVR_NULLDRM=1
> +
> +ifeq ($(BR2_PACKAGE_TI_SGX_AM335X),y)
> +TI_SGX_KM_PLATFORM_NAME = omap335x
> +else ifeq ($(BR2_PACKAGE_TI_SGX_AM437X),y)
> +TI_SGX_KM_PLATFORM_NAME = omap437x
> +else ifeq ($(BR2_PACKAGE_TI_SGX_AM4430),y)
> +TI_SGX_KM_PLATFORM_NAME = omap4430
> +else ifeq ($(BR2_PACKAGE_TI_SGX_5430),y)
> +TI_SGX_KM_PLATFORM_NAME = omap5430
> +endif
> +
> +TI_SGX_KM_SUBDIRECTORY = eurasia_km/eurasiacon/build/linux2/$(TI_SGX_KM_PLATFORM_NAME)_linux

You could use SUBDIR instead of SUBDIRECTORY.

> +
> +define TI_SGX_KM_BUILD_CMDS
> +	$(MAKE) $(TI_SGX_KM_MAKE_OPTS) -C $(@D)/$(TI_SGX_KM_SUBDIRECTORY)

Please pass $(TARGET_MAKE_ENV) in the environment, i.e:

	$(TARGET_MAKE_ENV) $(MAKE) ...

> +endef
> +
> +define TI_SGX_KM_INSTALL_TARGET_CMDS
> +	$(MAKE) $(TI_SGX_KM_MAKE_OPTS) kbuild_install \
> +		-C $(@D)/$(TI_SGX_KM_SUBDIRECTORY)

Ditto.

> +endef
> +
> +$(eval $(generic-package))

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
