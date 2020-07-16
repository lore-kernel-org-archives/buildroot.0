From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 16 Jul 2020 15:52:50 +0200
Subject: [Buildroot] [PATCH] package/freescale-imx/firmware-imx: fix
 sdma support for imx8m family
In-Reply-To: <20200716154637.52159ef7@windsurf.home>
References: <20200716130317.135841-1-gary.bisson@boundarydevices.com>
 <20200716154637.52159ef7@windsurf.home>
Message-ID: <20200716135250.GA467516@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, St?phane,

On Thu, Jul 16, 2020 at 03:46:37PM +0200, Thomas Petazzoni wrote:
> On Thu, 16 Jul 2020 15:03:17 +0200
> Gary Bisson <gary.bisson@boundarydevices.com> wrote:
> 
> > In latest patch the SDMA installation was limited to platforms whose
> > name was mentioned in the binary. That would unfortunately be too simple
> > to manage, instead the i.MX 8M family uses the same binary as the i.MX 7
> > processors [1].
> > 
> > Fixes: fad2df39b9 ("package/freescale-imx/firmware-imx: clarify
> > installation of firmware files")
> > 
> > [1]
> > https://source.codeaurora.org/external/imx/linux-imx/tree/arch/arm64/boot/dts/freescale/imx8mq.dtsi?h=imx_5.4.24_2.1.0#n519
> > 
> > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> > ---
> >  package/freescale-imx/firmware-imx/Config.in       | 3 +++
> >  package/freescale-imx/firmware-imx/firmware-imx.mk | 6 +++++-
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
> > index aae552177f..3859cc1d14 100644
> > --- a/package/freescale-imx/firmware-imx/Config.in
> > +++ b/package/freescale-imx/firmware-imx/Config.in
> > @@ -20,6 +20,9 @@ config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_SDMA_FW
> >  	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
> >  	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
> >  	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
> > +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
> > +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
> > +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
> 
> Thanks for looking into this. Another possible solution if we have more
> of this in the future (we already have it for vpu and sdma) would be to
> drop the NEEDS_XYZ_FW options and instead do this:
> 
> config BR2_PACKAGE_FIRMWARE_IMX_VPU_FW_NAME
> 	string
> 	default "imx53" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
> 	default "imx7d" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
> 	default "imx7d" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
> 	default "imx7d" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
> 
> and then in the .mk file, we rely on
> BR2_PACKAGE_FIRMWARE_IMX_VPU_FW_NAME being empty or not to decide
> whether the VPU firmware should be installed. And because this variable
> is not just a boolean, it also tells us what is the firmware name.

Yes it looks like a better option, we could even do the same for VPU
then.
Are we all ok with such approach?

> >  config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_VPU_FW
> >  	bool
> > diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
> > index cd299aad5e..90d9a79860 100644
> > --- a/package/freescale-imx/firmware-imx/firmware-imx.mk
> > +++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
> > @@ -107,9 +107,13 @@ endif
> >  #
> >  
> >  ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_NEEDS_SDMA_FW),y)
> > +FIRMWARE_IMX_SDMA_NAME = $(FIRMWARE_IMX_PLATFORM_LOWER)
> > +ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M)$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM)$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN),y)
> > +FIRMWARE_IMX_SDMA_NAME = imx7d
> > +endif
> 
> I'd prefer:
> 
> ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M)$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM)$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN),y)
> FIRMWARE_IMX_SDMA_NAME = imx7d
> else
> FIRMWARE_IMX_SDMA_NAME = $(FIRMWARE_IMX_PLATFORM_LOWER)
> endif
> 
> Also, now that I looked at this more closely, the SDMA firmware is
> sdma-imx7d.bin, but the BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7 is
> named just "IMX7", so this will not work, so I'm not sure how the:
> 
>         default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
> 
> currently works for BR2_PACKAGE_FIRMWARE_IMX_NEEDS_SDMA_FW.

Note the '*' which makes everything works ;)
That is why imx7 will properly the imx7d binary and the imx27 will copy
the imx27_TO2 one.

Regards,
Gary
