From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 02 Oct 2014 10:47:44 +0200
Subject: [Buildroot] [PATCH v2 3/3] imx-usb-loader: new package
In-Reply-To: <20141001181626.64e6ef08@free-electrons.com>
References: <1412175826-9010-1-git-send-email-luca@lucaceresoli.net>
 <1412175826-9010-4-git-send-email-luca@lucaceresoli.net>
 <20141001181626.64e6ef08@free-electrons.com>
Message-ID: <542D1130.1050508@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Thomas Petazzoni wrote:
> Dear Luca Ceresoli,
>
> On Wed,  1 Oct 2014 17:03:46 +0200, Luca Ceresoli wrote:
>
>> diff --git a/package/imx-usb-loader/Config.in.host b/package/imx-usb-loader/Config.in.host
>> new file mode 100644
>> index 0000000..2540ea9
>> --- /dev/null
>> +++ b/package/imx-usb-loader/Config.in.host
>> @@ -0,0 +1,14 @@
>> +config BR2_PACKAGE_HOST_IMX_USB_LOADER
>> +	bool "host imx-usb-loader"
>> +	depends on BR2_arm || BR2_armeb
>> +	select BR2_PACKAGE_LIBUSB # libusb >= 1.0 is required
>
> Huh, no! BR2_PACKAGE_LIBUSB is the *target* libusb. If you depend on
> host-libusb, you don't need to add any select here.

Ops! Will fix!

>
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
>
> LGPL with no version specified?
>

Yes. The only indication in getopt.[hc] is:

   License: LGPL

and nothing else. This means LGPL (ant version), it is the list of
licenses documented on the BR manual.

BTW, the LGPL license is declared in BR for pppd and tslib as well.

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
> Full path as the last argument.

Will fix.

>
> Also: what about having this package enabled by default in the sabresd
> defconfigs, if it makes sense to have this host tool enabled for those
> configurations?

My plan is slightly more ambitious indeed. What I have in mind is to:
  1. enable imx-usb-loader for both SABRESD boards;
  2. prepare the configuration files that imx_usb_loader needs to boot
     the device;
  3. document how to boot using imx_usb_loader + the config files.

Step 1 is trivial.

For step 2 I'll have generate two files: imx_usb.conf (the top-level
config file for imx_usb) and mx6_usb_work.conf (different for the two
SoC variants). The former can be taken as is from the imx_usb_loader
sources, the latter must be edited as described in Vincent's tutorial
[1], at section "Prepare your payload and configuration".

I think the best way is to use a post-image script to create these
files in output/images, except they are not images. Does this sound
fine?

If step 2 is well done, the actions to boot the device would be as
simple as:

   ./output/host/usr/bin/imx_usb -c output/images

Then step 3 would be trivial as well.

[1] https://community.freescale.com/docs/DOC-101842
-- 
Luca
