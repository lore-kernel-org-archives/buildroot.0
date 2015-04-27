From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Apr 2015 17:25:32 +0200
Subject: [Buildroot] [PATCH] imx-usb-loader: new host package
In-Reply-To: <1430142459-9448-1-git-send-email-antoine.tenart@free-electrons.com>
References: <1430142459-9448-1-git-send-email-antoine.tenart@free-electrons.com>
Message-ID: <20150427172532.6e54e15e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Antoine,

On Mon, 27 Apr 2015 15:47:39 +0200, Antoine Tenart wrote:

> diff --git a/package/imx-usb-loader/Config.in.host b/package/imx-usb-loader/Config.in.host
> new file mode 100644
> index 000000000000..a30f20a32f81
> --- /dev/null
> +++ b/package/imx-usb-loader/Config.in.host
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_HOST_IMX_USB_LOADER
> +	bool "host imx usb loader"

	bool "host imx-usb-loader"

> +	select BR2_PACKAGE_LIBUSB
> +	depends on BR2_TOOLCHAIN_HAS_THREADS

No, doesn't make sense. Your package is a host package, so it does not
need libusb. It needs host-libusb, so there is no need for anything in
Config.in.

> diff --git a/package/imx-usb-loader/imx-usb-loader.mk b/package/imx-usb-loader/imx-usb-loader.mk
> new file mode 100644
> index 000000000000..e33daac34367
> --- /dev/null
> +++ b/package/imx-usb-loader/imx-usb-loader.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# iMX USB loader

imx-usb-loader

> +#
> +################################################################################
> +
> +IMX_USB_LOADER_VERSION = f96aee286ea17c832b7ec922dd76842deb5ce299
> +IMX_USB_LOADER_SITE = $(call github,boundarydevices,imx_usb_loader,$(IMX_USB_LOADER_VERSION))
> +IMX_USB_LOADER_LICENSE = LGPLv2.1

LGPLv2.1+

> +IMX_USB_LOADER_LICENSE_FILES = COPYING
> +IMX_USB_LOADER_DEPENDENCIES = libusb
> +
> +define HOST_IMX_USB_LOADER_BUILD_CMDS
> +	$(MAKE) -C $(@D)

	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)

> +endef
> +
> +define HOST_IMX_USB_LOADER_INSTALL_CMDS
> +	$(MAKE) -C $(@D)	\
> +		DESTDIR=$(HOST_DIR) install

	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
		DESTDIR=$(HOST_DIR) install

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
