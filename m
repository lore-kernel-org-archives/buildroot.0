From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Dec 2017 23:03:13 +0100
Subject: [Buildroot] [PATCH v3 2/4] binaries-marvell: new package
In-Reply-To: <20171203181818.10087-3-geomatsi@gmail.com>
References: <20171203181818.10087-1-geomatsi@gmail.com>
 <20171203181818.10087-3-geomatsi@gmail.com>
Message-ID: <20171203230313.2cde5811@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 Dec 2017 21:18:16 +0300, Sergey Matyukevich wrote:

> diff --git a/boot/binaries-marvell/Config.in b/boot/binaries-marvell/Config.in
> new file mode 100644
> index 0000000000..0a0717cd26
> --- /dev/null
> +++ b/boot/binaries-marvell/Config.in
> @@ -0,0 +1,29 @@
> +config BR2_TARGET_BINARIES_MARVELL
> +	bool "Marvell Armada SCP_BL2 image for ATF"

I've used the package name here as well.

> +	depends on BR2_aarch64
> +	help
> +	  Some systems, including Marvell Armada SoC, have a separate
> +	  System Control Processor (SCP) for power management, clocks,
> +	  reset and system control. ATF Boot Loader stage 2 (BL2) loads
> +	  optional SCP_BL2 image into a platform-specific region
> +	  of secure memory.

Added an upstream URL here.

> diff --git a/boot/binaries-marvell/binaries-marvell.mk b/boot/binaries-marvell/binaries-marvell.mk
> new file mode 100644
> index 0000000000..7bb5071aed
> --- /dev/null
> +++ b/boot/binaries-marvell/binaries-marvell.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# Marvell Armada SCP_BL2 firmware images
> +#
> +################################################################################
> +
> +BINARIES_MARVELL_VERSION = 0dabe23b956420b0928d337d635f0cd5646c33d0
> +BINARIES_MARVELL_SITE = $(call github,MarvellEmbeddedProcessors,binaries-marvell,$(BINARIES_MARVELL_VERSION))
> +BINARIES_MARVELL_LICENSE = PROPRIETARY
> +BINARIES_MARVELL_REDISTRIBUTE = NO

Well, if you can't distribute it... it's a bit problematic no?

In fact, there is a license on the master branch, i.e at
https://raw.githubusercontent.com/MarvellEmbeddedProcessors/binaries-marvell/master/README.md.
And to me, this is GPL-2.0 with the FreeRTOS exception, so I've changed
the BINARIES_MARVELL_LICENSE variable to that, and dropped
BINARIES_MARVELL_REDISTRIBUTE. Let me know what you think.

> +BINARIES_MARVELL_IMAGE = $(call qstrip,$(BR2_TARGET_BINARIES_MARVELL_IMAGE))
> +BINARIES_MARVELL_INSTALL_IMAGES  = YES
> +
> +define BINARIES_MARVELL_INSTALL_IMAGES_CMDS
> +	$(INSTALL) -D -m 0644 $(@D)/$(BINARIES_MARVELL_IMAGE) $(BINARIES_DIR)/scp-fw.bin
> +endef
> +
> +$(eval $(generic-package))

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
