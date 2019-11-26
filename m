From: Jerry Huang <jerry.huang@nxp.com>
Date: Tue, 26 Nov 2019 07:06:41 +0000
Subject: [Buildroot] [EXT] Re: [PATCH v2 06/10]
 boot/arm-trusted-firmware: Add RCW support
In-Reply-To: <20191125230938.211426b3@windsurf>
References: <20191121102324.35225-1-jerry.huang@nxp.com>
 <20191121102324.35225-7-jerry.huang@nxp.com>
 <20191125230938.211426b3@windsurf>
Message-ID: <VI1PR04MB513683CAA0FCE4A542902D7AFE450@VI1PR04MB5136.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Thomas,
Some comment in lines, please review them, thanks a lot.

Best Regards
Jerry Huang

> -----Original Message-----
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Sent: Tuesday, November 26, 2019 6:10 AM
> To: Jerry Huang <jerry.huang@nxp.com>
> Cc: buildroot at busybox.net; michael at walle.cc; matthew.weber at collins.com;
> geomatsi at gmail.com
> Subject: [EXT] Re: [Buildroot] [PATCH v2 06/10] boot/arm-trusted-firmware: Add
> RCW support
> 
> Caution: EXT Email
> 
> Hello,
> 
> On Thu, 21 Nov 2019 18:23:20 +0800
> Changming Huang <jerry.huang@nxp.com> wrote:
> 
> > diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> > b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> > index 2133d39e6d..2bca8109f1 100644
> > --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> > +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> > @@ -92,6 +92,15 @@ endif
> >
> >  ARM_TRUSTED_FIRMWARE_MAKE_TARGETS = all
> >
> > +ifeq ($(BR2_PACKAGE_HOST_RCW_ATF),y)
> 
> This option should be introduced by this patch.
Sure,

> Overall, I'm not super happy with how arm-trusted-firmware works. In some
> cases, it's a sub-option of arm-trusted-firmware that causes it to use some
> additional package (for example OPTEE as BL32, U-Boot as BL33), but
> sometimes it's the implicit fact of having another package enabled
> (mv-ddr-marvell, vexpress-firmware), that causes arm-trusted-firmware to use it.
> Not great.
> 
> So I'm not sure how to proceed with RCW.
Yes, it uses some additional package for booting.
But, if it does not use them (U-Boot as BL33, OPTEE as BL32, RCW as BL2), what can arm-trusted-firmware do?

> > +RCW_BOOT_MODE = $(call
> qstrip,$(BR2_PACKAGE_HOST_RCW_BOOT_MODE))
> > +RCW_PATH = $(call qstrip,$(BR2_PACKAGE_HOST_RCW_BIN))
> > +RCW_FILE = $(lastword $(subst /, ,$(RCW_PATH)))
> 
> Those variables names should be prefixed with the package name, i.e
> ARM_TRUSTED_FIRMWARE.
Sure,

> > +ARM_TRUSTED_FIRMWARE_MAKE_OPTS +=
> BOOT_MODE=$(RCW_BOOT_MODE)
> > +RCW=$(BINARIES_DIR)/$(RCW_FILE)
> 
> These BOOT_MODE and RCW options are not supported in ATF upstream,
> apparently only in the NXP fork. I'm not sure we want explicit support for
> vendor-specific things. Should we look at providing an arm-trusted-firmware
> that can more easily be customized through options?

Maybe we can provide three options
ARM_TRUSTED_FIRMWARE_EXTRA_OPTS: the custom OPTS
ARM_TRUSTED_FIRMWARE_EXTRA_TARGETS: the custom TARGETS
ARM_TRUSTED_FIRMWARE_EXTRA_DEPENDENCIES: the custom dependency

Which are defined in defconfig file or empty,
For example, NXP QorIQ:
ARM_TRUSTED_FIRMWARE_EXTRA_OPTS = " BOOT_MODE=sd RCW=$(BINARIES_DIR)/ rcw_1300_sdboot.bin"
ARM_TRUSTED_FIRMWARE_EXTRA_TARGETS = " pbl"
ARM_TRUSTED_FIRMWARE_EXTRA_DEPENDENCIES = "host-qoriq-rcw"
Or Marvell DDR:
ARM_TRUSTED_FIRMWARE_EXTRA_OPTS = " SCP_BL2=$(BINARIES_DIR)/scp-fw.bin"
ARM_TRUSTED_FIRMWARE_EXTRA_DEPENDENCIES = "mv-ddr-marvell"

we can use them as below without detecting the condition in ATF makefile:
ARM_TRUSTED_FIRMWARE_MAKE_OPTS += ARM_TRUSTED_FIRMWARE_EXTRA_OPTS
ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += ARM_TRUSTED_FIRMWARE_EXTRA_TARGETS
ARM_TRUSTED_FIRMWARE_DEPENDENCIES += ARM_TRUSTED_FIRMWARE_EXTRA_DEPENDENCIES

We can put anything we want into these options, and the ATF makefile is very clean.

How do you think about them?

> That's really an open discussion, I don't yet have a clear idea on how to handle
> that.
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbootlin.c
> om&amp;data=02%7C01%7Cjerry.huang%40nxp.com%7C74c02743671b4e18a
> b5c08d771f42b8f%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637
> 103165822614341&amp;sdata=rcEnN%2B%2FlfMpj0iwpikulfsCH0v813TaG86K
> GsE3eGTo%3D&amp;reserved=0
