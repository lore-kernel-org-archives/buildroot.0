From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Aug 2020 22:16:01 +0200
Subject: [Buildroot] [PATCH 2/2] configs/freescale_imx7ulpevkb: new
 defconfig
In-Reply-To: <b9edfc3c395961381588485123935741b81be22e.camel@oss.nxp.com>
References: <20200731121333.3754957-1-fabrice.goucem@oss.nxp.com>
 <20200731121333.3754957-2-fabrice.goucem@oss.nxp.com>
 <20200805225118.0189afd4@windsurf.home>
 <b9edfc3c395961381588485123935741b81be22e.camel@oss.nxp.com>
Message-ID: <20200806221601.718dc67d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Thu, 06 Aug 2020 18:57:28 +0200
Fabrice Goucem <fabrice.goucem@oss.nxp.com> wrote:

> > This is doing two things at once: adding the IMX7ULP support in
> > package/freescale-imx/Config.in (which should come as a separate
> > patch,
> > and before the imx-m4-demos package) and the imx7ulpevkb defconfig
> > addition. Could you split that up ?  
> 
> Chicken and egg situation...
> Package imx-mcore-demos is needed to introduce support to i.MX7ULP EVK.
> What I can do is remove i.MX7ULP support in the initial imx-mcore-demos 
> commit and add it in the i.MX7ULP commit.

There is no chicken and egg problem at all:

 - PATCH 1: introduce BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7ULP,
   adjusting the BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7 definition
   along the way.

 - PATCH 2: introduce the imx-mcore-demos package

 - PATCH 3: adjust the logic in
   board/freescale/common/imx/post-image.sh to add the M4 firmware to
   the image

 - PATCH 4: add the imx7ulpevkb defconfig

> > Are you sure the i.MX7 has a GPU ? According to
> > https://www.nxp.com/products/processors-and-microcontrollers/arm-processors/i-mx-applications-processors/i-mx-7-processors:IMX7-SERIES
> > only the i.MX7 ULP has a GPU, unless I'm misreading this.  
> 
> You are correct.
> However fixing that (that's in master) would not be part of my patch
> which only targets i.MX7 ULP support.

The current option BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7 has a prompt
that says it covers both imx7d and imx7ulp, so it's not totally
incorrect that I.MX7 in general can have a GPU. However, your series
changes this vague IMX7 option by separating the IMX7ULP (which has a
GPU) for the other IMX7 (that don't have a GPU). So it should be part
of the patch adding BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7ULP to
readjust the fact that BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7 doesn't
have a GPU.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
