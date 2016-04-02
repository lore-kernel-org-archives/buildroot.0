From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Apr 2016 17:20:58 +0200
Subject: [Buildroot] [PATCH] wilc1000-firmware: new package
In-Reply-To: <1459491576-32280-1-git-send-email-ludovic.desroches@atmel.com>
References: <1459491576-32280-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <20160402172058.77e5cba2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 1 Apr 2016 08:19:36 +0200, Ludovic Desroches wrote:
> Firmware for Atmel Wilc1000 wireless device.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> ---
>  package/Config.in                              |  1 +
>  package/wilc1000-firmware/Config.in            |  6 ++++++
>  package/wilc1000-firmware/wilc1000-firmware.mk | 25 +++++++++++++++++++++++++

A hash file was missing.

> +WILC1000_FIRMWARE_VERSION = 14.1
> +WILC1000_FIRMWARE_SITE = https://github.com/linux4sc/wireless-firmware/archive
> +WILC1000_FIRMWARE_SOURCE = v$(WILC1000_FIRMWARE_VERSION)_Firmware.zip

What a crappy file name, which doesn't even contain the name of the
project :-/

> +WILC1000_FIRMWARE_DRIVER_FILE = wilc1003_firmware.bin

This variable is not really needed, it's only used once

> +WILC1000_FIRMWARE_LICENSE = PROPRIETARY
> +
> +define WILC1000_FIRMWARE_EXTRACT_CMDS
> +	$(UNZIP) -d $(BUILD_DIR) $(DL_DIR)/$(WILC1000_FIRMWARE_SOURCE)
> +	mv $(BUILD_DIR)/wireless-firmware-$(WILC1000_FIRMWARE_VERSION)_Firmware/* $(@D)
> +	rmdir $(BUILD_DIR)/wireless-firmware-$(WILC1000_FIRMWARE_VERSION)_Firmware
> +endef
> +
> +define WILC1000_FIRMWARE_INSTALL_TARGET_CMDS
> +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/lib/firmware/atmel/
> +	cp $(@D)/$(WILC1000_FIRMWARE_DRIVER_FILE) $(TARGET_DIR)/lib/firmware/atmel/

I've simplified this to use just one $(INSTALL) -D -m 0644 invocation,
which is sufficient since 1/ there is only one file to install and 2/
option -D tells $(INSTALL) to create sub-directories as necessary.

Applied with those fixes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
