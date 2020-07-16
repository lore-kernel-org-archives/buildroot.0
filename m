From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 16 Jul 2020 16:14:45 +0200
Subject: [Buildroot] [PATCH] package/freescale-imx/firmware-imx: fix
 sdma support for imx8m family
In-Reply-To: <20200716160745.2c845a4e@windsurf.home>
References: <20200716130317.135841-1-gary.bisson@boundarydevices.com>
 <20200716154637.52159ef7@windsurf.home>
 <20200716135250.GA467516@p1g2>
 <20200716160745.2c845a4e@windsurf.home>
Message-ID: <20200716141445.GA575512@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 16, 2020 at 04:07:45PM +0200, Thomas Petazzoni wrote:
> On Thu, 16 Jul 2020 15:52:50 +0200
> Gary Bisson <gary.bisson@boundarydevices.com> wrote:
> 
> > > Thanks for looking into this. Another possible solution if we have more
> > > of this in the future (we already have it for vpu and sdma) would be to
> > > drop the NEEDS_XYZ_FW options and instead do this:
> > > 
> > > config BR2_PACKAGE_FIRMWARE_IMX_VPU_FW_NAME
> > > 	string
> > > 	default "imx53" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
> > > 	default "imx7d" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
> > > 	default "imx7d" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
> > > 	default "imx7d" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
> > > 
> > > and then in the .mk file, we rely on
> > > BR2_PACKAGE_FIRMWARE_IMX_VPU_FW_NAME being empty or not to decide
> > > whether the VPU firmware should be installed. And because this variable
> > > is not just a boolean, it also tells us what is the firmware name.  
> > 
> > Yes it looks like a better option, we could even do the same for VPU
> > then.
> > Are we all ok with such approach?
> 
> I think it doesn't add more lines, and will avoid the calculation of
> FIRMWARE_IMX_PLATFORM_LOWER.

Agreed, let's do it then. I'll offer another patch, not a v2 per se as
it will also modify VPU copy.

> > Note the '*' which makes everything works ;)
> > That is why imx7 will properly the imx7d binary and the imx27 will copy
> > the imx27_TO2 one.
> 
> Ah indeed, and that's another thing we could get rid of with the
> proposal above, as we would have the exact firmware name.

Unfortunately no, I don't believe it will be the best option as imx31
for instance has 2 possible sdma firmware (to1 and to2).
Same goes for imx35 sdma firmware.
Same goes for imx27 vpu firmware... and so on.

Still looks acceptable to me, but let me know if you think otherwise.

Regards,
Gary
