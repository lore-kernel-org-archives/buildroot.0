From: Jerry Huang <jerry.huang@nxp.com>
Date: Tue, 26 Nov 2019 04:33:48 +0000
Subject: [Buildroot] [EXT] Re: [PATCH v2 04/10]
 package/freescale-qoriq/fsl-qoriq-rcw: add target rcw binary support
In-Reply-To: <20191125222345.3b7897ae@windsurf>
References: <20191121102324.35225-1-jerry.huang@nxp.com>
 <20191121102324.35225-5-jerry.huang@nxp.com>
 <20191125222345.3b7897ae@windsurf>
Message-ID: <VI1PR04MB513630C33602E753E726FB45FE450@VI1PR04MB5136.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Best Regards
Jerry Huang

> -----Original Message-----
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Sent: Tuesday, November 26, 2019 5:24 AM
> To: Jerry Huang <jerry.huang@nxp.com>
> Cc: buildroot at busybox.net; michael at walle.cc; matthew.weber at collins.com;
> geomatsi at gmail.com
> Subject: [EXT] Re: [Buildroot] [PATCH v2 04/10]
> package/freescale-qoriq/fsl-qoriq-rcw: add target rcw binary support
> 
> Caution: EXT Email
> 
> Hello,
> 
> I'm sorry, but I don't really grasp what this patch is trying to do.
Hi, Thomas,
This patch is to build the binary *.bin file which is used by QorIQ platforms booting with the QorIQ-RCW source codes.

> On Thu, 21 Nov 2019 18:23:18 +0800
> Changming Huang <jerry.huang@nxp.com> wrote:
> 
> > From: Jerry Huang <jerry.huang@nxp.com>
> >
> > For NXP QorIQ (PowerPC and Layerscape) platform, we need to specify
> > the RCW file and build it to binary.
> >
> > Introduce BR2_PACKAGE_HOST_RCW_ATF to use ATF for RCW.
> 
> What does this mean ?
Which is used by ATF for RCW, will move it to patch 07/10

> 
> > Introduce BR2_PACKAGE_HOST_RCW_BIN to specify the RCW binary file.
>
> Hm, ok, but then it seems to be used to calculate from which directory "make" is
> going to be invoked.
This option is for RCW binary, including the path and file name, 
for example: ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.bin
the first word is the platform, last word is the binary file used.

> 
> > Introduce BR2_PACKAGE_HOST_RCW_BOOT_MODE to define the boot mode.
> > Because the RCW binary can be stored in different media, for example:
> > SD card - RCW locate in SD card, boot the board from SD card
> > eMMC    - RCW locate in eMMC chip, boot the board from eMMC chip
> > flexSPI - RCW locate in flexSPI, boot the board from flexSPI Nor/Nand flash
> > QSPI    - RCW locate in QSPI flash, boot the board from QSPI flash
> >
> > Signed-off-by: Jerry Huang <jerry.huang@nxp.com>
> > ---
> > changes since v1:
> > 1. add option BR2_PACKAGE_HOST_RCW_ATF for ATF
> > ---
> >  .../freescale-qoriq/fsl-qoriq-rcw/Config.in.host  | 15 +++++++++++++++
> >  .../fsl-qoriq-rcw/fsl-qoriq-rcw.mk                | 11 +++++++++++
> >  2 files changed, 26 insertions(+)
> >
> > diff --git a/package/freescale-qoriq/fsl-qoriq-rcw/Config.in.host
> > b/package/freescale-qoriq/fsl-qoriq-rcw/Config.in.host
> > index a9253958d9..f55f2a6f3a 100644
> > --- a/package/freescale-qoriq/fsl-qoriq-rcw/Config.in.host
> > +++ b/package/freescale-qoriq/fsl-qoriq-rcw/Config.in.host
> > @@ -25,4 +25,19 @@ config BR2_PACKAGE_HOST_RCW_CUSTOM_PATH
> >         included for use in the SDK or with post scripts but no
> >         RCW binary will not be generated.
> >
> > +config BR2_PACKAGE_HOST_RCW_ATF
> > +     bool "atf for rcw"
> > +     help
> > +       When ATF is used for RCW, enable this option.
> 
> This option is not used in the code below.
Will move it to patch 07/10.

> 
> > +
> > +config BR2_PACKAGE_HOST_RCW_BIN
> 
> Should be named with a BR2_PACKAGE_HOST_FSL_QORIQ_RCW_ prefix.
Sure,

> 
> > +     string "Custom RCW"
> > +     help
> > +       This option is used to specify the RCW binary file for board.
> 
> More details are needed. What happens when this option is empty? Which
> values are typically needed? Your code assumes there's one slash in the value,
> this should be explained.
> 
> > +config BR2_PACKAGE_HOST_RCW_BOOT_MODE
> 
> This option is not used in the .mk file
Which is used by ATF for RCW, will vove it to patch 07/10.

> 
> > +     string "Boot mode"
> > +     help
> > +       Specify the boot mode, for example, sd, emmc, flexspi_nor.
> > +
> >  endif
> > diff --git a/package/freescale-qoriq/fsl-qoriq-rcw/fsl-qoriq-rcw.mk
> > b/package/freescale-qoriq/fsl-qoriq-rcw/fsl-qoriq-rcw.mk
> > index a2c3f4f8a6..15c4024eb8 100644
> > --- a/package/freescale-qoriq/fsl-qoriq-rcw/fsl-qoriq-rcw.mk
> > +++ b/package/freescale-qoriq/fsl-qoriq-rcw/fsl-qoriq-rcw.mk
> > @@ -37,6 +37,17 @@ endef
> >  define HOST_FSL_QORIQ_RCW_INSTALL_DELIVERY_FILE
> >       $(INSTALL) -D -m 0644 $(@D)/PBL.bin $(BINARIES_DIR)/PBL.bin
> > endef
> > +else
> 
> Why is this part mutually exclusive with the
> BR2_PACKAGE_HOST_RCW_CUSTOM_PATH option ? I'd like to understand what
> they each try to do. If they are mutually exclusive, they should also be mutually
> exclusive at the Config.in level. Could you please explain the different use cases
> for rcw so that we can figure out the right way to handle this ?
According to original scripts, R2_PACKAGE_HOST_RCW_CUSTOM_PATH is used for the RCW specified by customer.
Add some special command is needed for this option.
In order to use the source codes from NXP, some other commands are needed, so they are mutually exclusive.
Then, I will add the mutually exclusive in config.in file.

> 
> > +RCW_BIN = $(call qstrip,$(BR2_PACKAGE_HOST_RCW_BIN))
> > +RCW_PLATFORM = $(firstword $(subst /, ,$(RCW_BIN)))
> 
> Variables must be prefixed by the package name, not just RCW_.
Sure,

> 
> > +
> > +define HOST_FSL_QORIQ_RCW_BUILD_CMDS
> > +     cd $(@D)/$(RCW_PLATFORM) && $(MAKE)
> 
> Should be:
> 
>         $(MAKE) -C ...
Will change it

> > +endef
> > +
> > +define HOST_FSL_QORIQ_RCW_INSTALL_DELIVERY_FILE
> > +     $(INSTALL) -D -m 0644 $(@D)/$(RCW_BIN) $(BINARIES_DIR)/
> 
> Complete destination path is needed, including the destination file name.
Sure, will add the file name.
> 
> Thanks!
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbootlin.c
> om&amp;data=02%7C01%7Cjerry.huang%40nxp.com%7Ca3c1ca285da948a32
> 78108d771edc2f5%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637
> 103138304575881&amp;sdata=o1hb4D4YqQ58G0RH0siotPJsl7kp3HS0u4T5jMA
> 7YR8%3D&amp;reserved=0
