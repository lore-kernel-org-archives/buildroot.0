From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 30 Mar 2020 09:49:05 +0200
Subject: [Buildroot] [PATCH 1/2] package/freescale-imx: fix i.MX8MMini
 configuration
In-Reply-To: <20200330082524.58b82f57@windsurf.home>
References: <20200326164943.564656-1-gary.bisson@boundarydevices.com>
 <20200326164943.564656-2-gary.bisson@boundarydevices.com>
 <20200330082524.58b82f57@windsurf.home>
Message-ID: <20200330074905.GA5954@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Mar 30, 2020 at 08:25:24AM +0200, Thomas Petazzoni wrote:
> Hello Gary,
> 
> On Thu, 26 Mar 2020 17:49:42 +0100
> Gary Bisson <gary.bisson@boundarydevices.com> wrote:
> 
> > - Just like i.MX8MQ, i.MX8MMini is using Hantro VPU.
> > - Platform name wasn't set for i.MX8Mini
> >   -> now differencing IMX8MQ and IMX8MM for VPU package  
> > 
> > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> 
> So, I've applied, but I have one comment/concern below.
> 
> > diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
> > index f42bb11a3c..0a5be9c75a 100644
> > --- a/package/freescale-imx/Config.in
> > +++ b/package/freescale-imx/Config.in
> > @@ -66,7 +66,8 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
> >  	default "IMX6UL" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
> >  	default "IMX7" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
> >  	default "IMX8" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
> > -	default "IMX8" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
> > +	default "IMX8MQ" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
> > +	default "IMX8MM" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
> 
> I am not sure about the usefulness of this
> BR2_PACKAGE_FREESCALE_IMX_PLATFORM string, especially for i.MX8
> platforms. Indeed, this string is only used by the imx-lib and imx-vpu
> packages, and it seems that they are not relevant for i.MX8. So what is
> the "reference" to know what is the correct string for i.MX8 platforms
> ? Does it really make sense to have this option in
> package/freescale-imx/Config.in ? Should we have it instead in imx-lib
> and imx-vpu instead ?

Well regarding i.MX8, it will be used in imx-vpu-hantro once updated [1].
But it is true it might the only place where it will be useful for
i.MX8.
For i.MX6, since it used in both imx-lib and imx-vpu, it felt right not
to duplicate this logic. So I guess i.MX8 platform naming went here for
consistency.
Also, since all the i.MX variants are declared in
freescale-imx/Config.in, feels ok to me to have the logic at the same
spot. But I'm open to moving it to different packages.

Regards,
Gary

[1] http://patchwork.ozlabs.org/patch/1262157/
