From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 19 Sep 2012 00:01:58 +0200
Subject: [Buildroot] [PATCH] Add package raspberrypi-firmware.
In-Reply-To: <1347914057-20287-1-git-send-email-marek.belisko@open-nandra.com>
References: <1347914057-20287-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <5058EF56.3070208@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/17/12 22:34, Marek Belisko wrote:
[snip]
> diff --git a/package/raspberrypi-firmware/raspberrypi-firmware.mk b/package/raspberrypi-firmware/raspberrypi-firmware.mk
> new file mode 100644
> index 0000000..1ebf67c
> --- /dev/null
> +++ b/package/raspberrypi-firmware/raspberrypi-firmware.mk
> @@ -0,0 +1,48 @@
> +RASPBERRYPI_FIRMWARE_VERSION = d29291e
> +RASPBERRYPI_FIRMWARE_SOURCE = raspberrypi-firmware-$(RASPBERRYPI_FIRMWARE_VERSION).tar.gz

  That's the default, so it can be left out.

> +RASPBERRYPI_FIRMWARE_SITE = http://github.com/raspberrypi/firmware/tarball/master
> +
> +ifeq ($(BR2_PACKAGE_RASPBERRYPI_VIDEOCORE),y)
> +RASPBERRYPI_FIRMWARE_INSTALL_STAGING = YES
> +
> +define RASPBERRYPI_FIRMWARE_INSTALL_STAGING_CMDS
> +	cp -r $(@D)/hardfp/opt $(STAGING_DIR)/

  The same reasoning as for the target applies here as well: we want
the cross-compiler to find the headers and libraries without
requiring special -I and -L directives.  So copy them to /usr/include
and /usr/lib.

> +endef
> +
> +define RASPBERRYPI_FIRMWARE_INSTALL_TARGET_VIDEOCORE
> +	cp -r $(@D)/hardfp/opt/vc/bin $(TARGET_DIR)/usr/bin

  Doesn't this create /usr/bin/bin ? To be safe, use -T .

> +	cp -r $(@D)/hardfp/opt/vc/lib $(TARGET_DIR)/usr/lib
> +	cp -r $(@D)/hardfp/opt/vc/sbin $(TARGET_DIR)/usr/sbin
> +endef
> +endif
> +
> +ifeq ($(BR2_PACKAGE_RASPBERRYPI_BOOTLOADER),y)
> +BOOT_FILE := #empty
> +ifeq ($(BR2_PACKAGE_BOOTLOADER_ARM128),y)
> +BOOT_FILE += arm128_start.elf
> +else ifeq ($(BR2_PACKAGE_BOOTLOADER_ARM192),y)
> +BOOT_FILE += arm192_start.elf
> +else ifeq ($(BR2_PACKAGE_BOOTLOADER_ARM224),y)
> +BOOT_FILE += arm224_start.elf
> +else ifeq ($(BR2_PACKAGE_BOOTLOADER_ARM240),y)
> +BOOT_FILE += arm240_start.elf
> +endif
> +
> +define RASPBERRYPI_FIRMWARE_INSTALL_TARGET_BOOTLOADER
> +	if [ ! -d "$(TARGET_DIR)/boot" ]; then \
> +		mkdir $(TARGET_DIR)/boot; \
> +	fi; \

  Just "mkdir -p $(TARGET_DIR)/boot".  Or even better, replace the cp
below with
	install -D -m 0644 <fromfile> <tofile>

> +	cp $(@D)/boot/$(subst $(space),$(comma),$(strip $(BOOT_FILE))) \

  I guess this must be a leftover from some earlier magic, because
BOOT_FILE can contain only a single entry, and even if there are
several bootfiles, replacing spaces by commas won't help.

  If you want to support the installation of several bootfiles, you
should use
	for bootfile in $(BOOT_FILE) bootcode.bin loader.bin; do \
		install -D -m $(@D)/boot/$$bootfile $(TARGET_DIR)/boot/$$bootfile; \
	done


  Regards,
  Arnout

> +		$(TARGET_DIR)/boot/start.elf
> +	cp $(@D)/boot/bootcode.bin $(TARGET_DIR)/boot/bootcode.bin
> +	cp $(@D)/boot/loader.bin $(TARGET_DIR)/boot/loader.bin
> +endef
> +endif
> +
> +define RASPBERRYPI_FIRMWARE_INSTALL_TARGET_CMDS
> +	$(RASPBERRYPI_FIRMWARE_INSTALL_TARGET_BOOTLOADER)
> +	$(RASPBERRYPI_FIRMWARE_INSTALL_TARGET_VIDEOCORE)
> +endef
> +
> +$(eval $(generic-package))
> +

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
