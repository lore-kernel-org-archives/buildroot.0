From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 15 Mar 2018 20:40:22 +0100
Subject: [Buildroot] [PATCH 4/4] package/rpi-firmware: improve
 installation of dtb files
In-Reply-To: <1521120291-15781-4-git-send-email-martin@barkynet.com>
References: <1521120291-15781-1-git-send-email-martin@barkynet.com>
 <1521120291-15781-4-git-send-email-martin@barkynet.com>
Message-ID: <20180315204022.58ee68fc@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Martin,

On Thu, 15 Mar 2018 13:24:51 +0000, Martin Bark <martin@barkynet.com> wrote:

> Don't list specific dtb files, instead install all dtb files in the same
> way as dtbo files are currently done.
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>
> ---
>  package/rpi-firmware/rpi-firmware.mk | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> index 1ebdd96..9cc3d4a 100644
> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -12,10 +12,9 @@ RPI_FIRMWARE_INSTALL_IMAGES = YES
>  
>  ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS),y)
>  define RPI_FIRMWARE_INSTALL_DTB
> -	$(INSTALL) -D -m 0644 $(@D)/boot/bcm2708-rpi-b.dtb $(BINARIES_DIR)/rpi-firmware/bcm2708-rpi-b.dtb
> -	$(INSTALL) -D -m 0644 $(@D)/boot/bcm2708-rpi-b-plus.dtb $(BINARIES_DIR)/rpi-firmware/bcm2708-rpi-b-plus.dtb
> -	$(INSTALL) -D -m 0644 $(@D)/boot/bcm2709-rpi-2-b.dtb $(BINARIES_DIR)/rpi-firmware/bcm2709-rpi-2-b.dtb
> -	$(INSTALL) -D -m 0644 $(@D)/boot/bcm2710-rpi-3-b.dtb $(BINARIES_DIR)/rpi-firmware/bcm2710-rpi-3-b.dtb
> +	for dtb in  $(@D)/boot/*.dtb; do \
> +		$(INSTALL) -D -m 0644 $${dtb} $(BINARIES_DIR)/rpi-firmware/$${dtb##*/} || exit 1; \
> +	done

Which will install three additional dtb files (bcm2708-rpi-0-w.dtb,
bcm2708-rpi-cm.dtb and bcm2710-rpi-cm3.dtb), not a downside of the
patch, but worth mentioning....

Regards,
Peter

>  endef
>  endif
>  
