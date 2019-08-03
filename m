From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 10:37:39 +0200
Subject: [Buildroot] [PATCH v2 1/2] boot/opensbi: Add support for
 including Linux payload
In-Reply-To: <20190722204447.7935-1-alistair.francis@wdc.com>
References: <20190722204447.7935-1-alistair.francis@wdc.com>
Message-ID: <20190803103739.77660a6a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 22 Jul 2019 13:44:46 -0700
Alistair Francis <alistair.francis@wdc.com> wrote:

> +if BR2_TARGET_OPENSBI_PLAT != ""

I move this if to a simple "depends on" under the
BR2_TARGET_OPENSBI_LINUX_PAYLOAD optio.

> +config BR2_TARGET_OPENSBI_LINUX_PAYLOAD
> +	bool "Include Linux as OpenSBI Payload"
> +	depends on BR2_LINUX_KERNEL
> +	depends on BR2_LINUX_KERNEL_IMAGE
> +	depends on !BR2_TARGET_OPENSBI_LIBRARY_ONLY

This option doesn't exist anywhere, so I dropped this depends on.

> +OPENSBI_LINUX_PAYLOAD = $(call qstrip,$(BR2_TARGET_OPENSBI_LINUX_PAYLOAD))

qstrip is only useful for string options. For boolean options, it's
useless, so I dropped this and simply used
BR2_TARGET_OPENSBI_LINUX_PAYLOAD everywhere.

> +ifeq ($(OPENSBI_LINUX_PAYLOAD), y)

No space before "y".

> +OPENSBI_DEPENDENCIES = linux

+= for this addition, so that we don't mistakenly overwrite any
previous dependency that might have been added.

> +OPENSBI_MAKE_ENV += FW_PAYLOAD_PATH="$(BINARIES_DIR)/Image"
> +endif
> +
>  define OPENSBI_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(OPENSBI_MAKE_ENV) $(MAKE) -C $(@D)
>  endef
>  
>  ifneq ($(OPENSBI_PLAT),)
>  OPENSBI_INSTALL_IMAGES = YES
> +OPENSBI_INSTALL_IMAGES_CMDS_PLAT = \
> +	$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_jump.bin $(BINARIES_DIR)/fw_jump.bin; \
> +	$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_jump.elf $(BINARIES_DIR)/fw_jump.elf; \
> +	$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_dynamic.bin $(BINARIES_DIR)/fw_dynamic.bin; \
> +	$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_dynamic.elf $(BINARIES_DIR)/fw_dynamic.elf;
> +endif
> +
> +ifeq ($(OPENSBI_LINUX_PAYLOAD), y)
> +OPENSBI_INSTALL_IMAGES_CMDS_PAYLOAD = \
> +	$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_payload.bin $(BINARIES_DIR)/fw_payload.bin; \
> +	$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_payload.elf $(BINARIES_DIR)/fw_payload.elf;
> +endif
> +
>  define OPENSBI_INSTALL_IMAGES_CMDS
> -	$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_jump.bin $(BINARIES_DIR)/fw_jump.bin
> -	$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_jump.elf $(BINARIES_DIR)/fw_jump.elf
> -	$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_dynamic.bin $(BINARIES_DIR)/fw_dynamic.bin
> -	$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_dynamic.elf $(BINARIES_DIR)/fw_dynamic.elf
> +	$(OPENSBI_INSTALL_IMAGES_CMDS_PLAT)
> +	$(OPENSBI_INSTALL_IMAGES_CMDS_PAYLOAD)

As suggested by Yann, I've refactored all of that with a loop over a
OPENSBI_FW_IMAGES variable that contains jump, dynamic and optionally
payload.

I fixed up these different aspects, and merged the patch. See the final
commit at:

  https://git.buildroot.org/buildroot/commit/?id=9b5b7165deb91bad3cdb1ea0dd8f940eff75f3a9

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
