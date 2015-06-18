From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jun 2015 23:18:16 +0200
Subject: [Buildroot] [PATCH 2/2] zedboard: Upgrade to U-Boot 2015.07
In-Reply-To: <1434644878-595-2-git-send-email-xvikto03@stud.fit.vutbr.cz>
References: <1434644878-595-1-git-send-email-xvikto03@stud.fit.vutbr.cz>
 <1434644878-595-2-git-send-email-xvikto03@stud.fit.vutbr.cz>
Message-ID: <20150618231816.513316f9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jan Viktorin,

On Thu, 18 Jun 2015 18:27:58 +0200, Jan Viktorin wrote:
> From: Jan Viktorin <viktorin@rehivetech.com>
> 
> Until recently, generation of a bootloader for the Avnet
> Zedboard (and in general all Xilinx Zynq based boards)
> has required to use the development tools by Xilinx
> (Vivado, XSDK) and to walk through a quite painful
> procedure to generate the First Stage Boot Loader
> (FSBL) and the bootable BOOT.BIN image.
> 
> This commit makes Buildroot independent on the Xilinx
> flow by utilizing U-Boot SPL and booting the Zynq's
> PL by U-Boot.
> 
> The FSBL generation is not a problem anymore with U-Boot
> 2015.07 where a generic ps7_init.c file is included and
> used to build the U-Boot SPL for various boards including
> Zedboard. The ps7_init.c file has been released under
> GNU/GPL license for this purpose. For details, see
> 
>  http://lists.denx.de/pipermail/u-boot/2015-April/210664.html
> 
> To create the BOOT.BIN automatically, there is a script
> zynq-boot-bin.py in the Xilinx github repository. This
> script is not included in the upstream of U-Boot so
> I attach it as a series of patchs (0001-0003) generated
> against U-Boot 2015.07.

It is a bit annoying to have this script as patches. Will it be merged
in the upstream U-Boot at some point? If yes, then having it as patches
is OK. Otherwise, I'd prefer to have a separate host-zync-boot-script
package, which simply downloads and installs this script in
$(HOST_DIR), and then only the patch changing the U-Boot Makefile to
call this script.

> There is a little catch, the U-Boot 2015.07 is not released
> yet, so this commit is based on 2015.07-rc2. However, as
> soon as it is out, the download site of U-Boot can be
> redirected to the release archive instead of fetching it
> by git.

Yes, this is OK.

> Steps to create a working Buildroot for Zedboard:
> 
> a) use U-Boot 2015.07 (done by this commit)
> b) patch it to use zynq-boot-bin.py (done by this commit)
> --------------------------
> 1) make zedboard_defconfig
> 2) make UBOOT_BIN=u-boot-dtb.img
> 3) copy files boot.bin, u-boot-dtb.img, rootfs.cpio.uboot,
> 	uImage, zynq-zed.dtb into your SD card
> 4) boot your Zedboard

This should just go to board/avnet/zedboard/readme.txt, no need to have
it in the commit log if you're updating that readme file.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
