From: Martin Bark <martin@barkynet.com>
Date: Tue, 7 Mar 2017 10:34:02 +0000
Subject: [Buildroot] [PATCH] rpi-bt-firmware: new package
In-Reply-To: <53c705753b20aca425aa8acb2af8d19a36cd6ac4.1485955423.git.baruch@tkos.co.il>
References: <53c705753b20aca425aa8acb2af8d19a36cd6ac4.1485955423.git.baruch@tkos.co.il>
Message-ID: <CAFGQKxeGBY2xbtsKOrdS5P-JN30FvZJqnDCthbZ9x9YfKwCXdQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Baruch Siach,

On 1 February 2017 at 13:23, Baruch Siach <baruch@tkos.co.il> wrote:

> Add firmware file for the Raspberry Pi 3 Bluetooth module.
>
> Note that to successfully download the firmware bluez5_utils needs a
> patch[1].
>
> [1] http://www.spinics.net/lists/linux-bluetooth/msg69470.html


This seems a minor patch, is it safe it just add it to blue5_utils?


>
>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/Config.in                          |  1 +
>  package/rpi-bt-firmware/Config.in          |  7 +++++++
>  package/rpi-bt-firmware/rpi-bt-firmware.mk | 21 +++++++++++++++++++++
>  3 files changed, 29 insertions(+)
>  create mode 100644 package/rpi-bt-firmware/Config.in
>  create mode 100644 package/rpi-bt-firmware/rpi-bt-firmware.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 44aaf0887ede..8ad7d27e9de0 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -336,6 +336,7 @@ menu "Firmware"
>         source "package/b43-firmware/Config.in"
>         source "package/linux-firmware/Config.in"
>         source "package/rpi-firmware/Config.in"
> +       source "package/rpi-bt-firmware/Config.in"
>         source "package/sunxi-boards/Config.in"
>         source "package/ts4900-fpga/Config.in"
>         source "package/ux500-firmware/Config.in"
> diff --git a/package/rpi-bt-firmware/Config.in b/package/rpi-bt-firmware/
> Config.in
> new file mode 100644
> index 000000000000..366ce9196941
> --- /dev/null
> +++ b/package/rpi-bt-firmware/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_RPI_BT_FIRMWARE
> +       bool "rpi-bt-firmware"
> +       depends on BR2_arm || BR2_aarch64
> +       help
> +         Raspberry Pi 3 Broadcom BCM43438 Bluetooth module firmware.
>

I think this will also be needed on the raspberry pi zero w so might be
worth updating the comment.


> +
> +         https://aur.archlinux.org/packages/pi-bluetooth
> diff --git a/package/rpi-bt-firmware/rpi-bt-firmware.mk
> b/package/rpi-bt-firmware/rpi-bt-firmware.mk
> new file mode 100644
> index 000000000000..255da1926211
> --- /dev/null
> +++ b/package/rpi-bt-firmware/rpi-bt-firmware.mk
> @@ -0,0 +1,21 @@
> +###########################################################
> #####################
> +#
> +# rpi-bt-firmware
> +#
> +###########################################################
> #####################
> +
> +RPI_BT_FIRMWARE_VERSION = a439f892bf549ddfefa9ba7ad1999cc515f233bf
> +RPI_BT_FIRMWARE_SITE = https://aur.archlinux.org/pi-bluetooth.git


Is aur a good place to pull this from? Hopefully one day BCM43430A1.hcd
will make it's way into linux-firmware but until then it seems like
raspbian is the source of this file so i think it's better to get it from
them.


>
> +RPI_BT_FIRMWARE_SITE_METHOD = git
> +RPI_BT_FIRMWARE_LICENSE = PROPRIETARY
> +RPI_BT_FIRMWARE_LICENSE_FILES = LICENCE.broadcom_bcm43xx
> +
> +# The BlueZ hciattach utility looks for firmware in /etc/firmware. Add a
> +# compatibility symlink.
> +define RPI_BT_FIRMWARE_INSTALL_TARGET_CMDS
> +       ln -sf ../lib/firmware $(TARGET_DIR)/etc/firmware

+       $(INSTALL) -D -m 0644 $(@D)/BCM43430A1.hcd \
> +               $(TARGET_DIR)/lib/firmware/BCM43430A1.hcd
>

Given you have to patch hciattach_bcm43xx.c to use this firmware why not
also correct the path to the firmware? Assuming BCM43430A1.hcd ends up in
linux-firmware then it would reside in /lib/firmware/brcm.  If you patch
the correct path to BCM43430A1.hcd then there is no need for the symlink.


> +endef
> +
> +$(eval $(generic-package))
>


So i was thinking something more like this where we get the firmware from
the raspbian package. what do you think?

RPI_BT_FIRMWARE_VERSION = 1.2
RPI_BT_FIRMWARE_SOURCE=bluez-firmware_$(RPI_BT_FIRMWARE_VERSION).orig.tar.gz
RPI_BT_FIRMWARE_SITE =
https://archive.raspberrypi.org/debian/pool/main/b/bluez-firmware
RPI_BT_FIRMWARE_EXTRA_DOWNLOADS =
bluez-firmware_$(RPI_BT_FIRMWARE_VERSION)-3+rpi1.debian.tar.xz
RPI_BT_FIRMWARE_LICENSE = Proprietary
RPI_BT_FIRMWARE_LICENSE_FILES = broadcom/BCM-LEGAL.txt

# Extract the Debian tarball inside the sources
define RPI_BT_FIRMWARE_DEBIAN_EXTRACT
        $(call suitable-extractor,$(notdir
$(RPI_BT_FIRMWARE_EXTRA_DOWNLOADS))) \
                $(DL_DIR)/$(notdir $(RPI_BT_FIRMWARE_EXTRA_DOWNLOADS)) | \
                $(TAR) -C $(@D) $(TAR_OPTIONS) -
endef
RPI_BT_FIRMWARE_POST_EXTRACT_HOOKS += RPI_BT_FIRMWARE_DEBIAN_EXTRACT

define RPI_BT_FIRMWARE_INSTALL_TARGET_CMDS
$(INSTALL) -D -m 0644 $(@D)/broadcom/BCM43430A1.hcd
$(TARGET_DIR)/lib/firmware/brcm/BCM43430A1.hcd
endef



Finally for this firmware to be useful don't we also need sysv and systemd
scripts to call hciattach?

Thanks

Martin


--
> 2.11.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170307/e6299b20/attachment.html>
