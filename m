From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 28 Apr 2020 10:53:46 +0200
Subject: [Buildroot] [PATCH 1/3] board/freescale/imx: Add helper to
 generate fw binary
In-Reply-To: <20200427235704.56fcde61@windsurf.home>
References: <20200427213402.6148-1-xroumegue@gmail.com>
 <20200427235704.56fcde61@windsurf.home>
Message-ID: <20200428085346.GA183828@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Xavier,

On Mon, Apr 27, 2020 at 11:57:04PM +0200, Thomas Petazzoni wrote:
> Hello Xavier,
> 
> On Mon, 27 Apr 2020 23:34:00 +0200
> Xavier Roumegue <xroumegue@gmail.com> wrote:
> 
> > This script aims to create an imx compatible boot image embedding
> > mainline components, using only upstream uboot mkimage tool, avoiding
> > dependencies on proprietary imx mkimage.
> > 
> > Mainline u-boot can generate a bootable image, but SPL soc proprietary
> > firmware dependencies have to be copied on uboot root dir.
> > 
> > This script prevents additional buildroot uboot recipe hacking to handle
> > custom SoC uboot build process.
> > 
> > The script actions summary is:
> > - Append DDR4 firmware to uboot spl binary
> > - Generate imx mkimage configuration file, extracting entry points from
> >   relevant elf files on the fly.
> > - Generate imx boot image using uboot upstream mkimage tool
> > 
> > Signed-off-by: Xavier Roumegue <xroumegue@gmail.com>
> 
> Thanks for this proposal. Could you share a bit more details about the
> upstream U-Boot i.MX8 image generation logic? How does it work, how do
> you trigger it, which FW binaries need to be copied to the U-Boot build
> directory, etc. ?

Same, thanks for this proposal. However I'm not sure adding another
script to basically do the same thing is the preferred option.
The main difference being that it uses the U-Boot mkimage instead of
imx-mkimage.

Ideally I'd like to be able to use the flash.bin U-Boot target so that
we get rid of those post-build scripts for good.

Thomas, what U-Boot needs (for imx8m) are the DDR/HDMI firmware files from
firmware-imx package. The main issue actually is that U-Boot looks for
those binaries at its root. If we could make it point to $BINARIES_DIR
instead, we could use 'flash.bin' target with U-Boot custom dependencies
[1] (if this patch gets accepted) to ensure firmware-imx was built
beforehand.

Otherwise, if we decide to keep a post-build script, I'd rather have
only one, preferrably this one as it doesn't depend on imx-mkimage.
But as Fabio mentioned, it also needs to support 8QXP/8QM, then we could
replaces imx8-bootloader-prepare.sh and also remove imx-mkimage package.

Let me know your thoughts.

Regards,
Gary

[1] http://patchwork.ozlabs.org/project/buildroot/patch/20200425000629.2068191-1-heiko at sntech.de/
