From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Sep 2016 17:37:53 +0200
Subject: [Buildroot] [PATCH] board: add support for liteBoard
In-Reply-To: <20160913112747.3886-1-m.niestroj@grinn-global.com>
References: <20160913112747.3886-1-m.niestroj@grinn-global.com>
Message-ID: <20160913173753.03f99f51@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 Sep 2016 13:27:47 +0200, Marcin Niestroj wrote:
> Board support package includes:
> 
>  * Buildroot defconfig
>  * Mainline Linux kernel v4.7.3 with board support patches
>  * Mainline U-Boot v2016.09 with board support patch
>  * genimage config to create sdcard image
>  * Board readme.txt
> 
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

This generally looks very good. I've seen on the LAKML that you have
submitted upstream the support of this platform to the Linux kernel, I
assume you've done the same for the U-Boot part. We generally don't
like carrying the entire support for a new board in Buildroot in the
form of patches, but if those patches are clean and on their way
upstream (which is the case here, then it's fine).


> +++ b/board/grinn/liteboard/genimage.cfg
> @@ -0,0 +1,48 @@
> +# Minimal microSD card image for Grinn's liteBoard
> +#
> +# We mimic the .sdcard Freescale's image format for i.MX6UL:
> +# * the microSD card must have 1 kB free space at the beginning,
> +# * SPL is dumped as is,
> +# * U-Boot is dumped at 69K offset, as configured in SPL
> +# * a FAT partition at offset 8 MB is containing zImage and dtbs,
> +# * a single root filesystem partition is required (Ext4 in this case).
> +#

Can you instead use the generic freescale genimage.cfg and post-image
script ? See board/freescale/common/.

It's not exactly identical to your genimage file as it's using a single
U-Boot image called u-boot.imx instead of the split SPL / u-boot.img
that you're using. But since your platform is i.MX6 based, I suppose
the u-boot.imx should also work (Cc'ing Fabio on this).

The rest if perfectly fine.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
