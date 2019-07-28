From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Jul 2019 11:50:49 +0200
Subject: [Buildroot] [PATCH v2 1/2] boot/opensbi: Add support for
 including Linux payload
In-Reply-To: <20190722204447.7935-1-alistair.francis@wdc.com>
References: <20190722204447.7935-1-alistair.francis@wdc.com>
Message-ID: <20190728095049.GB21875@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allistair, All,

On 2019-07-22 13:44 -0700, Alistair Francis spake thusly:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
[--SNIP--]
> diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
> index 83552a5442..14657cac06 100644
> --- a/boot/opensbi/opensbi.mk
> +++ b/boot/opensbi/opensbi.mk
> @@ -19,19 +19,35 @@ ifneq ($(OPENSBI_PLAT),)
>  OPENSBI_MAKE_ENV += PLATFORM=$(OPENSBI_PLAT)
>  endif
>  
> +OPENSBI_LINUX_PAYLOAD = $(call qstrip,$(BR2_TARGET_OPENSBI_LINUX_PAYLOAD))
> +ifeq ($(OPENSBI_LINUX_PAYLOAD), y)
> +OPENSBI_DEPENDENCIES = linux
> +OPENSBI_MAKE_ENV += FW_PAYLOAD_PATH="$(BINARIES_DIR)/Image"
> +endif

In Kconfig, OPENSBI_LINUX_PAYLOAD is conditional to OPENSBI_PLAT != ""
so I would expect to see the same layout in the .mk (see below for what
I mean).

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

Why can't we have something like (untested):

    OPENSBI_FW_DIR = $(@D)/build/platform/$(OPENSBI_PLAT)/firmware

    ifneq ($(OPENSBI_PLAT),)
    OPENSBI_FW_FILES = fw_jump.bin fw_jump.elf fw_dynamic.bin fw_dynamic.elf
    ifeq ($(OPENSBI_LINUX_PAYLOAD),y)
    OPENSBI_FW_FILES += fw_jump.bin fw_jump.elf fw_dynamic.bin fw_dynamic.elf
    endif
    endif

    define OPENSBI_INSTALL_IMAGES_CMDS
        $(foreach fw,$(OPENSBI_FW_FILES), \
            $(INSTALL) -m 0644 -D $(OPENSBI_FW_DIR)/$(fw) $(BINARIES_DIR)/$(fw)
        )
    endef

(notice also how OPENSBI_LINUX_PAYLOAD is inside the OPENSBI_PLAT != ""
block, like it is in Config.in.)

Regards,
Yann E. MORIN.

>  define OPENSBI_INSTALL_IMAGES_CMDS
> -	$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_jump.bin $(BINARIES_DIR)/fw_jump.bin
> -	$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_jump.elf $(BINARIES_DIR)/fw_jump.elf
> -	$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_dynamic.bin $(BINARIES_DIR)/fw_dynamic.bin
> -	$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_dynamic.elf $(BINARIES_DIR)/fw_dynamic.elf
> +	$(OPENSBI_INSTALL_IMAGES_CMDS_PLAT)
> +	$(OPENSBI_INSTALL_IMAGES_CMDS_PAYLOAD)
>  endef
> -endif
>  
>  # libsbi.a is not a library meant to be linked in user-space code, but
>  # with bare metal code, which is why we don't install it in
> -- 
> 2.22.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
