From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 02 Oct 2014 13:43:34 +0200
Subject: [Buildroot] [PATCH v2 3/3] imx-usb-loader: new package
In-Reply-To: <542D1736.70603@freescale.com>
References: <1412175826-9010-1-git-send-email-luca@lucaceresoli.net>
 <1412175826-9010-4-git-send-email-luca@lucaceresoli.net>
 <542D1736.70603@freescale.com>
Message-ID: <542D3A66.6020607@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vincent,

Vincent Stehl? wrote:
> On 10/01/2014 05:03 PM, Luca Ceresoli wrote:
> (snip)
>
> Hi Luca,
>
> Thank you for this imx_usb_loader "recipe".
>
> I have just some small remarks for the configuration files (below), but
> apart from that I could build the loader ok with 'make
> host-imx-usb-loader', and boot through USB just fine. So thanks!

Thanks for keeping my patches tested!

>
> (..)
>> diff --git a/package/imx-usb-loader/imx-usb-loader.mk b/package/imx-usb-loader/imx-usb-loader.mk
>> new file mode 100644
>> index 0000000..48ef35c
>> --- /dev/null
>> +++ b/package/imx-usb-loader/imx-usb-loader.mk
>> @@ -0,0 +1,22 @@
>> +################################################################################
>> +#
>> +# imx-uxb-loader
>> +#
>> +################################################################################
>> +
>> +IMX_USB_LOADER_VERSION = f96aee286ea17c832b7ec922dd76842deb5ce299
>> +IMX_USB_LOADER_SITE = $(call github,boundarydevices,imx_usb_loader,$(IMX_USB_LOADER_VERSION))
>> +IMX_USB_LOADER_LICENSE = LGPLv2.1+, LGPL (getopt.*)
>> +IMX_USB_LOADER_LICENSE_FILES = COPYING
>> +IMX_USB_LOADER_DEPENDENCIES = host-libusb
>> +
>> +define HOST_IMX_USB_LOADER_BUILD_CMDS
>> +	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)
>> +endef
>> +
>> +define HOST_IMX_USB_LOADER_INSTALL_CMDS
>> +    $(INSTALL) -D -m 0755 $(@D)/imx_usb $(HOST_DIR)/usr/bin
>> +    $(INSTALL) -D -m 0755 $(@D)/imx_uart $(HOST_DIR)/usr/bin
>
> Wouldn't you want to install the supplied configurations files, too?
> Like in:
>
>    $(INSTALL) -D -m 0644 $(@D)/imx_usb.conf $(HOST_DIR)/etc/imx_usb.conf
>    $(INSTALL) -D -m 0644 $(@D)/mx6_usb_work.conf
> $(HOST_DIR)/etc/mx6_usb_work.conf
>
> I feel they could be used as examples or, at least, starting points.
>
> Maybe you want to patch a bit imx_usb, to change the default
> configuration files path? It defaults to '/etc/imx-loader.d/' but I
> think we could have something better in the buildroot case, like
> "$(HOST_DIR)/etc".

This means I would need to patch the imx_usb.c source code, and do it in
a way that is not relocatable.

Actually I have another plan [1]: creating a ready-to-use config file
and document how to use it, without touching how imx_usb works now.
Unless I'm missing something from your e-mail, I find my way cleaner
and more complete.

Users who want to use this tool in a different way can still find the
original files in output/build/imx-usb-loader-*/ of course.

[1] http://lists.busybox.net/pipermail/buildroot/2014-October/107492.html

-- 
Luca
