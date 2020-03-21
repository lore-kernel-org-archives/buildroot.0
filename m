From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Mar 2020 16:19:22 +0100
Subject: [Buildroot] [PATCH 2/5] package/freescale-imx/firmware-imx:
 bump version to 8.5
In-Reply-To: <20200320163158.18341-3-maeva.manuel@oss.nxp.com>
References: <20200320163158.18341-1-maeva.manuel@oss.nxp.com>
 <20200320163158.18341-3-maeva.manuel@oss.nxp.com>
Message-ID: <20200321161922.6d585e58@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Maeva,

On Fri, 20 Mar 2020 17:31:55 +0100
Maeva Manuel <maeva.manuel@oss.nxp.com> wrote:

> -else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8),y)
> -FIRMWARE_IMX_INSTALL_IMAGES = YES
> -define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
> -	# SECO firmware is needed when generating imx8-boot-sd.bin which
> -	# is done in post-image script.
> -	cp $(@D)/firmware/seco/mx8qm-ahab-container.img \
> -		$(BINARIES_DIR)/ahab-container.img
> -endef
>  else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X),y)
>  FIRMWARE_IMX_INSTALL_IMAGES = YES

This line was no longer needed, since you're dropping
FIRMWARE_IMX_INSTALL_IMAGES_CMDS below.

> -define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
> -	# SECO firmware is needed when generating imx8-boot-sd.bin which
> -	# is done in post-image script.
> -	cp $(@D)/firmware/seco/mx8qx-ahab-container.img \
> -		$(BINARIES_DIR)/ahab-container.img
> -endef

However, more generally, I dislike this firmware-imx package. It seems
to have been progressively patched with more and more logic, without
much consistency. For example, the VPU blobs for i.MX8 are not
installed for BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M and
BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM. Is this normal ?

For platforms other than BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M,
BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM and
BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X, we install all VPU blobs and
SDMA blobs, even those that are not relevant for the selected platform.

I think it really needs a complete rewrite, with a careful look at all
firmware files that are provided by NXP in this package, and see which
ones are applicable to which platform.

It would be great if you could have a look at doing such a cleanup.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
