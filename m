From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 23:42:25 +0100
Subject: [Buildroot] [PATCH v4 6/8] board/freescale/common/imx8: Use
 post build generated uboot image if present
In-Reply-To: <20210123233628.323cc376@windsurf.home>
References: <20201109142309.1135596-2-xroumegue@gmail.com>
 <20201125183017.15585-7-xroumegue@gmail.com>
 <20210123233628.323cc376@windsurf.home>
Message-ID: <20210123234225.4484e229@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 23 Jan 2021 23:36:28 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> I don't really understand what the purpose of this change is. Indeed,
> you're not removing the dedicated imx8 config template file in your
> patch series. And even your defconfig calls
> board/freescale/common/imx/post-image.sh, which based on:
> 
>         elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM=y$" ${BR2_CONFIG}; then
>                 echo "genimage.cfg.template_imx8"
> 
> will use the imx8 config template file for genimage.
> 
> So I'm rather confused by what's going on here.

Ah, I think that I see. The bootloader image name for i.MX8 always used
to be imx8-boot-sd.bin, so it was hardcoded in
genimage.cfg.template_imx8. But now, it might be imx8-boot-sd.bin for
old vendor U-Boot, or flash.bin for new upstream U-Boot.

And since you have no way to know which one is used, this patch is
proposing to rely on the existence of imx8-boot-sd.bin to decide if it
should be used or not.

I am not a huge fan of the proposed solution, but I don't have a very
nice proposal to make. We could extend post-image.sh to check if we're
on an i.MX8 platform, and if so, if BR2_TARGET_UBOOT_FLASH_BIN=y, use
flash.bin, otherwise use imx8-boot-sd.bin, but maybe that's getting
over-complicated.

So I think, let's stick with your solution, but with a better commit
log that explains what's going on.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
