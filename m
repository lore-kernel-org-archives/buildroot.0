From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jan 2012 09:00:47 -0300
Subject: [Buildroot] [PATCH v3] New package: linux-firmware
In-Reply-To: <1327577414-11374-1-git-send-email-yegorslists@googlemail.com>
References: <1327577414-11374-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <ad47d31d76e74e891bacdf8b9470a643@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-01-26 08:30, yegorslists at googlemail.com wrote:

> Changes:
> v3:
> 	typo fix (Michael S. Zick)

v4: alpha sort menu options? (Ralink before TI even if we prefer TI 
hehe)

> +# rt73
> +ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX),y)
> +define FIRMWARE_RALINK_RT2XX_INSTALL_TO_TARGET
> +	$(INSTALL) -m 0644 -D $(@D)/rt2860.bin \
> +		$(TARGET_DIR)/lib/firmware
> +	$(INSTALL) -m 0644 -D $(@D)/rt2870.bin \
> +		$(TARGET_DIR)/lib/firmware
> +	$(INSTALL) -m 0644 -D $(@D)/rt3071.bin \
> +		$(TARGET_DIR)/lib/firmware
> +	cp -rf $(@D)/rt30* $(TARGET_DIR)/lib/firmware
> +	$(INSTALL) -m 0644 -D $(@D)/LICENCE.ralink-firmware.txt \
> +		$(TARGET_DIR)/lib/firmware
> +endef
> +endif
> +
> +define LINUX_FIRMWARE_INSTALL_TARGET_CMDS
> +	$(FIRMWARE_TI_WL127X_INSTALL_TO_TARGET)
> +	$(FIRMWARE_TI_WL128X_INSTALL_TO_TARGET)
> +	$(FIRMWARE_RALINK_RT61_INSTALL_TO_TARGET)
> +	$(FIRMWARE_RALINK_RT73_INSTALL_TO_TARGET)
> +	$(FIRMWARE_RALINK_RT2XX_INSTALL_TO_TARGET)
> +endef

These constructs can get too long too fast, why not something like...

ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XXX),y)
     LINUX_FIRMWARE_FILES += rt2860.bin rt2870.bin rt30*.bin 
LICENCE.ralink-firmware.txt
endif

define LINUX_FIRMWARE_INSTALL_TARGET_CMDS
     cp -af $(addprefix $(@D)/, $(LINUX_FIRMWARE_FILES)) 
$(TARGET_DIR)/lib/firmware
endef

Will be nicer when other people add their wanted firmware to the 
package.
Regards.
