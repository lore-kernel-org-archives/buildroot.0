From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jun 2016 22:45:46 +0200
Subject: [Buildroot] [PATCH v2 04/14] imx-gpu-viv: bump version to
 5.0.11-p8.4
In-Reply-To: <CAAMH-yvfRCmYnFfWNc92bs3v0ceARaqdUuMrcsb_fe440ggUeQ@mail.gmail.com>
References: <cover.1464958470.git.awebster@arcx.com>
 <cover.1465578220.git.awebster@arcx.com>
 <dabb46035a5df04fd47c23e690f24ed07a2204a8.1465578220.git.awebster@arcx.com>
 <CAAMH-yvfRCmYnFfWNc92bs3v0ceARaqdUuMrcsb_fe440ggUeQ@mail.gmail.com>
Message-ID: <20160615224546.4fcf23cd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Jun 2016 15:00:07 +0200, Gary Bisson wrote:

> > diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
> > index 20759b1..9a7cf56 100644
> > --- a/package/freescale-imx/imx-gpu-viv/Config.in
> > +++ b/package/freescale-imx/imx-gpu-viv/Config.in
> > @@ -2,12 +2,16 @@ comment "imx-gpu-viv needs an (e)glibc toolchain"
> >         depends on BR2_arm
> >         depends on !BR2_TOOLCHAIN_USES_GLIBC
> >
> > +comment "imx-gpu-viv needs EABIhf"
> > +       depends on BR2_arm
> > +       depends on !BR2_ARM_EABIHF

The mali-t76x had a similar situation, but uses a single comment for
the glibc and ARM EABIhf dependency, so I've changed it to do the same:

comment "mali-t76x needs an (e)glibc toolchain with armhf enabled"
        depends on BR2_arm
        depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_ARM_EABIHF

> >  config BR2_PACKAGE_IMX_GPU_VIV
> >         bool "imx-gpu-viv"
> >         select BR2_PACKAGE_HAS_LIBEGL
> >         select BR2_PACKAGE_HAS_LIBGLES
> >         select BR2_PACKAGE_HAS_LIBOPENVG
> > -       depends on BR2_arm # Only relevant for i.MX6
> > +       depends on BR2_ARM_EABIHF # Only relevant for EABIhf i.MX6  
> 
> I'm not fond of this comment since "EABIhf i.MX6" are two terms that
> don't go together IMO. I'd either just keep the previous comment or
> something like "Only relevant for i.MX6 + EABIhf toolchain".
> 
> Thomas, what do you think?

Correct, I've changed this to:

        # Pre-built binaries only available for ARM EABIhf
        depends on BR2_ARM_EABIHF

> > -IMX_GPU_VIV_BASE_VERSION = 5.0.11.p7.4
> > -ifeq ($(BR2_ARM_EABIHF),y)
> > +IMX_GPU_VIV_BASE_VERSION = 5.0.11.p8.4
> >  IMX_GPU_VIV_VERSION = $(IMX_GPU_VIV_BASE_VERSION)-hfp
> > -else
> > -IMX_GPU_VIV_VERSION = $(IMX_GPU_VIV_BASE_VERSION)-sfp
> > -endif
> >  IMX_GPU_VIV_SITE = $(FREESCALE_IMX_SITE)
> >  IMX_GPU_VIV_SOURCE = imx-gpu-viv-$(IMX_GPU_VIV_VERSION).bin  
> 
> I think it is ok to keep the version naming like you did but m

I've removed IMX_GPU_VIV_BASE_VERSION entirely, and use directly
IMX_GPU_VIV_VERSION.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
