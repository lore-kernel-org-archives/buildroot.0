From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 13 Feb 2021 18:05:13 +0100
Subject: [Buildroot] [RFC] package/rpi-firmware: Allow to deploy
 multiple firmware files
In-Reply-To: <fa3866259e9e3e908e8c92dbaa37e1f9e10886f4.1612789783.git.stefan@agner.ch>
References: <fa3866259e9e3e908e8c92dbaa37e1f9e10886f4.1612789783.git.stefan@agner.ch>
Message-ID: <20210213180513.08a4d844@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Stefan,

On Mon,  8 Feb 2021 14:13:49 +0100, Stefan Agner <stefan@agner.ch> wrote:

> Add a new config option to allow a specific list of firmware files to be
> deployed. This is useful if the system needs to decide at runtime which
> firmware to use.
>
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
> We need this in Home Assistant OS since depending on configuration users want to
> use a different firmware. Would something like this be acceptable upstream?
>
>  package/rpi-firmware/Config.in       | 10 ++++++++++
>  package/rpi-firmware/rpi-firmware.mk | 19 +++++++++++++++++--
>  2 files changed, 27 insertions(+), 2 deletions(-)
>
> diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
> index f5a25c5680..ce31ad46de 100644
> --- a/package/rpi-firmware/Config.in
> +++ b/package/rpi-firmware/Config.in
> @@ -58,8 +58,18 @@ config BR2_PACKAGE_RPI_FIRMWARE_CD
>  	  The cut-down firmware, for emergency situations, with only
>  	  features required to boot a Linux kernel.
>
> +config BR2_PACKAGE_RPI_FIRMWARE_CUSTOM_LIST
> +	bool "deploy firmware files from list"
> +	help
> +	  Deploy firmware files as listed.
> +
>  endchoice
>
> +config BR2_PACKAGE_RPI_FIRMWARE_LIST
> +	string
> +	default "start.elf start_x.elf start_cd.elf fixup.dat fixup_x.dat fixup_cd.dat" if BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI
> +	default "start4.elf start4x.elf start4cd.elf fixup4.dat fixup4x.dat fixup4cd.dat" if BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4
> +
>  config BR2_PACKAGE_RPI_FIRMWARE_BOOT
>  	string
>  	default ""      if BR2_PACKAGE_RPI_FIRMWARE_DEFAULT && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI
> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> index fe7a099407..d7d432d866 100644
> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -48,11 +48,26 @@ define RPI_FIRMWARE_INSTALL_BOOTCODE_BIN
>  endef
>  endif
>
> +ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_CUSTOM_LIST),y)
> +define RPI_FIRMWARE_INSTALL_FIRMWARE
> +	$(foreach firmware,$(call qstrip,$(BR2_PACKAGE_RPI_FIRMWARE_LIST)), \
> +		$(INSTALL) -D -m 0644 $(@D)/boot/$(firmware) $(BINARIES_DIR)/rpi-firmware/$(firmware)
> +	)
> +	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/gaga
> +endef
> +else
> +define RPI_FIRMWARE_INSTALL_FIRMWARE
> +	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start.elf
> +	$(INSTALL) -D -m 0644 $(@D)/boot/fixup$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/fixup.dat
> +	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/gugus
> +endef
> +endif
> +
> +
>  define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
>  	$(INSTALL) -D -m 0644 package/rpi-firmware/config.txt $(BINARIES_DIR)/rpi-firmware/config.txt
>  	$(INSTALL) -D -m 0644 package/rpi-firmware/cmdline.txt $(BINARIES_DIR)/rpi-firmware/cmdline.txt
> -	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start.elf
> -	$(INSTALL) -D -m 0644 $(@D)/boot/fixup$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/fixup.dat
> +	$(RPI_FIRMWARE_INSTALL_FIRMWARE)
>  	$(RPI_FIRMWARE_INSTALL_BOOTCODE_BIN)
>  	$(RPI_FIRMWARE_INSTALL_DTB)
>  	$(RPI_FIRMWARE_INSTALL_DTB_OVERLAYS)

Seems the rpi-firmware package tries to be too smart here and to workaround
the smart logic is getting more and more complicated (and your patch is
something orthogonal to the latest changes applied, see [1] for resulting
commit and [2] ff. for discussion) and the package logic is to much focused
to do the right thing for exactly one determined target platform...,
neglecting the multi-target enabled SD card use case (or other custom
use cases)...

Maybe the best would be to reduce the rpi-firmware package to a selectable
list of (verbatim) installed firmware files and an editable/customized
config.txt (as already via the post-image.sh script) or go another step
further and provide customized config.txt files per raspberry pi defconfig
(as most buildroot/rpi user will need a customized version anyway e.g.
to enable custom dtoverlays as vc4-kms-v3d-pi4) and drop the post-image.sh
script?

Regards,
Peter

[1] https://git.buildroot.net/buildroot/commit/?id=1bdc0334ff6273761b2e7fda730cdcc7e1f46862
[2] http://lists.busybox.net/pipermail/buildroot/2020-June/285566.html
