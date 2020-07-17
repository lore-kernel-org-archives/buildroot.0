From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Fri, 17 Jul 2020 09:11:59 +0200
Subject: [Buildroot] [PATCH v2] package/freescale-imx/firmware-imx:
 refine vpu and sdma copies
In-Reply-To: <20200716230844.0008f950@windsurf.home>
References: <20200716161413.719361-1-gary.bisson@boundarydevices.com>
 <20200716230844.0008f950@windsurf.home>
Message-ID: <20200717071159.GA6428@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Jul 16, 2020 at 11:08:44PM +0200, Thomas Petazzoni wrote:
> On Thu, 16 Jul 2020 18:14:13 +0200
> Gary Bisson <gary.bisson@boundarydevices.com> wrote:
> 
> > In latest patch the SDMA installation was limited to platforms whose
> > name was mentioned in the binary but this approach wasn't flexible to
> > manage cases like imx8m using imx7 sdma binary, so this patch does:
> > - change VPU/SDMA FW options to string to allow specifying the name
> >   (suggested by Thomas)
> > - remove imx27 sdma case as non-existent
> > - add imx8m family support (using imx7d binary)
> > - get rid of FIRMWARE_IMX_PLATFORM_LOWER macro
> > 
> > Fixes: fad2df39b9 ("package/freescale-imx/firmware-imx: clarify
> > installation of firmware files")
> > 
> > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> 
> I've applied, but there were some issues. See below.
> 
> > -ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_NEEDS_SDMA_FW),y)
> > +ifneq ($(BR2_PACKAGE_FIRMWARE_IMX_SDMA_FW_NAME),)
> 
> This condition would always be true, because
> $(BR2_PACKAGE_FIRMWARE_IMX_SDMA_FW_NAME) will at least always contain
> "" as it is a string option.

Oh I see, thanks for catching this, I obviously tried that patch with
imx8m and saw the copy was ok, but I didn't try the case of a platform
without sdma, sorry.

> So, instead, I've done this:
> 
> FIRMWARE_IMX_SDMA_FW_NAME = $(call qstrip,$(BR2_PACKAGE_FIRMWARE_IMX_SDMA_FW_NAME))
> 
> and then used $(FIRMWARE_IMX_SDMA_FW_NAME). Ditto for the VPU case, of
> course.
> 
> Applied with this fixed. I did a quick test with i.MX6Q, and both the
> SDMA and VPU firmware got installed, as expected.

Looks good, thanks!

Gary
