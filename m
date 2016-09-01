From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 1 Sep 2016 08:08:32 +0200
Subject: [Buildroot] [PATCH 1/2] ts4900-fpga: add ts4900-fpga package
In-Reply-To: <1472691530-17643-2-git-send-email-mathieu.audat@savoirfairelinux.com>
References: <1472691530-17643-1-git-send-email-mathieu.audat@savoirfairelinux.com>
 <1472691530-17643-2-git-send-email-mathieu.audat@savoirfairelinux.com>
Message-ID: <24067ded-44e2-6403-849d-01fd640bc063@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 [Yann, Thomas, Peter: input requested below.]

 Hi Mathieu,

On 01-09-16 02:58, Mathieu Audat wrote:
> This package is responsible from downloading and deploying bitstream for
> TS-4900's FPGA. It implements clocks, UART MUX, and GPIOs. One of these
> GPIOs is used to enable the wifi module.
> 
> It is loaded by U-Boot during the boot sequence, which expects to find
> it in the /boot folder.
> 
> Signed-off-by: Mathieu Audat <mathieu.audat@savoirfairelinux.com>
> ---
>  package/Config.in                    |  1 +
>  package/ts4900-fpga/Config.in        |  6 ++++++
>  package/ts4900-fpga/ts4900-fpga.hash |  2 ++
>  package/ts4900-fpga/ts4900-fpga.mk   | 18 ++++++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 package/ts4900-fpga/Config.in
>  create mode 100644 package/ts4900-fpga/ts4900-fpga.hash
>  create mode 100644 package/ts4900-fpga/ts4900-fpga.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 1e51a45..a20a84c 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -334,6 +334,7 @@ menu "Firmware"
>  	source "package/linux-firmware/Config.in"
>  	source "package/rpi-firmware/Config.in"
>  	source "package/sunxi-boards/Config.in"
> +	source "package/ts4900-fpga/Config.in"
>  	source "package/ux500-firmware/Config.in"
>  	source "package/wilc1000-firmware/Config.in"
>  	source "package/zd1211-firmware/Config.in"
> diff --git a/package/ts4900-fpga/Config.in b/package/ts4900-fpga/Config.in
> new file mode 100644
> index 0000000..05d458f
> --- /dev/null
> +++ b/package/ts4900-fpga/Config.in
> @@ -0,0 +1,6 @@
> +menuconfig BR2_PACKAGE_TS4900_FPGA
> +	bool "ts4900-fpga"
> +	help
> +	  TS4900 board needs a .bin file to use the fpga.
> +	  Download it and install it in /boot

 Actually, your commit log would be a much better help text!

 Note that the part about U-Boot is not entirely accurate: it's just the default
script that looks there, not U-Boot itself.

 Also you should add a reference URL, e.g.

http://wiki.embeddedarm.com/wiki/TS-4900#FPGA_Changelog

> +
> diff --git a/package/ts4900-fpga/ts4900-fpga.hash b/package/ts4900-fpga/ts4900-fpga.hash
> new file mode 100644
> index 0000000..6e7c812
> --- /dev/null
> +++ b/package/ts4900-fpga/ts4900-fpga.hash
> @@ -0,0 +1,2 @@
> +# From ftp://ftp.embeddedarm.com/ts-socket-macrocontrollers/ts-4900-linux/fpga/ts4900-fpga-20150326.bin.md5
> +md5 630a108d8c1af527101ee6559949b761  ts4900-fpga-20150326.bin

 When upstream provides only an md5, we also add a locally-calculated sha256.

> diff --git a/package/ts4900-fpga/ts4900-fpga.mk b/package/ts4900-fpga/ts4900-fpga.mk
> new file mode 100644
> index 0000000..d487dd2
> --- /dev/null
> +++ b/package/ts4900-fpga/ts4900-fpga.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# ts4900-fpga
> +#
> +################################################################################
> +
> +TS4900_FPGA_VERSION = 20150326

 Anything wrong with 20150930?

> +TS4900_FPGA_SOURCE = ts4900-fpga-$(TS4900_FPGA_VERSION).bin
> +TS4900_FPGA_SITE = ftp://ftp.embeddedarm.com/ts-socket-macrocontrollers/ts-4900-linux/fpga/

 You're missing the license. The Yocto recipe claims it's MIT. A license file is
not provided of course. So please add:

# No license file provided, Yocto recipe from the vendor claims MIT.
#
https://github.com/embeddedarm/meta-ts/blob/f31860f1204b64f765a5380d3b93a2cf18234f90/recipes-extras/ts4900-fpga/ts4900-fpga.bb#L6
TS4900_FPGA_LICENSE = MIT


> +
> +TS4900_FPGA_INSTALL_IMAGES = YES

 Just for completeness, also add

TS4900_FPGA_INSTALL_TARGET = NO

> +TS4900_FPGA_EXTRACT_CMDS =
> +
> +define TS4900_FPGA_INSTALL_IMAGES_CMDS
> +	$(INSTALL) -m 0644 $(DL_DIR)/$(TS4900_FPGA_SOURCE) $(TARGET_DIR)/boot/ts4900-fpga.bin

 Hm, I find it strange to install directly from DL_DIR. Intuitively I'd say the
install commands should only access $(@D). But of course, copying first from
DL_DIR into @D in the extract commands, and then copying from there to the
target, that's a bit silly. We don't seem to have a precedent for this. Yann,
Peter, Thomas, what do you think?


 If you're installing to $(TARGET_DIR), then this should be done in
INSTALL_TARGET_CMDS, not INSTALL_IMAGES_CMDS. Indeed, for the
INSTALL_IMAGES_CMDS, it's possible that they are only called after the rootfs
has already been built. (Well, actually, with the way things are currently set
up it's not possible, but this could change.) So in that case my comment above
about _INSTALL_TARGET = NO is no longer valid of course.

 I also tend to think that something like this should really be installed in
IMAGES_DIR, not in TARGET_DIR. So we'd need an option like
BR2_LINUX_KERNEL_INSTALL_TARGET to decide to put in in TARGET_DIR as well. You
could make this option "default y if BR2_LINUX_KERNEL_INSTALL_TARGET". However,
almost everybody will probably stick with the default U-Boot scripts and load
the image from /boot, so adding a Kconfig option for it is possibly overkill.
You can decide what you prefer.


 Regards,
 Arnout

> +endef
> +
> +$(eval $(generic-package))
> 
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
