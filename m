From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Tue, 5 Nov 2013 12:42:40 -0600
Subject: [Buildroot] [PATCH 1/2] fm-ucode-firmware: new package
In-Reply-To: <1382727395-23441-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1382727395-23441-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <OFB4A37B95.3B11A907-ON86257C1A.0065E9C5-86257C1A.0066C7C0@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Let me review my own code here...

Ryan Barnett <rjbarnet@rockwellcollins.com> wrote on 10/25/2013 01:56:34 
PM:

> diff --git a/package/fm-ucode-firmware/fm-ucode-firmware.mk b/package/
> fm-ucode-firmware/fm-ucode-firmware.mk
> new file mode 100644
> index 0000000..da8e286
> --- /dev/null
> +++ b/package/fm-ucode-firmware/fm-ucode-firmware.mk
> @@ -0,0 +1,34 @@
> 
+################################################################################
> +#
> +# fm-ucode-firmware
> +#
> 
+################################################################################
> +
> +FM_UCODE_FIRMWARE_VERSION = fsl-sdk-v1.4
> +FM_UCODE_FIRMWARE_SITE = git://git.freescale.com/ppc/sdk/fm-ucode.git
> +FM_UCODE_FIRMWARE_SITE_METHOD = git
> +
> +FM_UCODE_FIRMWARE_LICENSE = Freescale Semiconductor Software License 
Agreement
> +FM_UCODE_FIRMWARE_LICENSE_FILES = EULA
> +
> +# This is a legal minefield: the EULA specifies that
> +# the Board Support Package includes software and hardware (sic!)
> +# for which a separate license is needed...
> +FM_UCODE_FIRMWARE_REDISTRIBUTE = NO
> +
> +FM_UCODE_BINARY_FILE = $(call 
qstrip,$(BR2_PACKAGE_FM_UCODE_FIRMWARE_FILE))
> +# The name of the file to be deliveried in the BINARIES_DIR
> +FM_UCODE_DELIVERY_FILE = fm-ucode.bin
> +
> +# we NEED binary file

There should an 'ifeq ($(BR2_PACKAGE_FM_UCODE_FIRMWARE),y)' before the 
filter statement so make doesn't complain that 
BR2_PACKAGE_FM_UCODE_FIRMWARE_FILE isn't defined. 

> +ifeq ($(filter source,$(MAKECMDGOALS)),)
> +ifeq ($(FM_UCODE_BINARY_FILE),)
> +$(error No FMan UCode binary file. Check your 
> BR2_PACKAGE_FM_UCODE_FIRMWARE_FILE setting)
> +endif
> +endif
> +
> +define FM_UCODE_FIRMWARE_INSTALL_TARGET_CMDS
> +   $(INSTALL) -D -m 0644 $(@D)/$(FM_UCODE_BINARY_FILE) $
> (BINARIES_DIR)/$(FM_UCODE_DELIVERY_FILE)
> +endef
> +
> +$(eval $(generic-package))
> -- 
> 1.7.1
> 
