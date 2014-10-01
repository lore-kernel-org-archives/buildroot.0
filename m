From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Oct 2014 18:16:26 +0200
Subject: [Buildroot] [PATCH v2 3/3] imx-usb-loader: new package
In-Reply-To: <1412175826-9010-4-git-send-email-luca@lucaceresoli.net>
References: <1412175826-9010-1-git-send-email-luca@lucaceresoli.net>
 <1412175826-9010-4-git-send-email-luca@lucaceresoli.net>
Message-ID: <20141001181626.64e6ef08@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Wed,  1 Oct 2014 17:03:46 +0200, Luca Ceresoli wrote:

> diff --git a/package/imx-usb-loader/Config.in.host b/package/imx-usb-loader/Config.in.host
> new file mode 100644
> index 0000000..2540ea9
> --- /dev/null
> +++ b/package/imx-usb-loader/Config.in.host
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_HOST_IMX_USB_LOADER
> +	bool "host imx-usb-loader"
> +	depends on BR2_arm || BR2_armeb
> +	select BR2_PACKAGE_LIBUSB # libusb >= 1.0 is required

Huh, no! BR2_PACKAGE_LIBUSB is the *target* libusb. If you depend on
host-libusb, you don't need to add any select here.

> diff --git a/package/imx-usb-loader/imx-usb-loader.mk b/package/imx-usb-loader/imx-usb-loader.mk
> new file mode 100644
> index 0000000..48ef35c
> --- /dev/null
> +++ b/package/imx-usb-loader/imx-usb-loader.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# imx-uxb-loader
> +#
> +################################################################################
> +
> +IMX_USB_LOADER_VERSION = f96aee286ea17c832b7ec922dd76842deb5ce299
> +IMX_USB_LOADER_SITE = $(call github,boundarydevices,imx_usb_loader,$(IMX_USB_LOADER_VERSION))
> +IMX_USB_LOADER_LICENSE = LGPLv2.1+, LGPL (getopt.*)

LGPL with no version specified?

> +IMX_USB_LOADER_LICENSE_FILES = COPYING
> +IMX_USB_LOADER_DEPENDENCIES = host-libusb
> +
> +define HOST_IMX_USB_LOADER_BUILD_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)
> +endef
> +
> +define HOST_IMX_USB_LOADER_INSTALL_CMDS
> +    $(INSTALL) -D -m 0755 $(@D)/imx_usb $(HOST_DIR)/usr/bin
> +    $(INSTALL) -D -m 0755 $(@D)/imx_uart $(HOST_DIR)/usr/bin

Full path as the last argument.

Also: what about having this package enabled by default in the sabresd
defconfigs, if it makes sense to have this host tool enabled for those
configurations?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
