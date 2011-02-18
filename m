From: bruce bushby <bruce.bushby@gmail.com>
Date: Fri, 18 Feb 2011 19:25:02 +0000
Subject: [Buildroot] Kernel refuses to boot
In-Reply-To: <20110218194952.53214c03@surf>
References: <AANLkTinMo+hCnOUmVdKb+pB_G1rX8zLzGhm5y+8VY-1P@mail.gmail.com>
	<20110218194952.53214c03@surf>
Message-ID: <AANLkTimYcXxCRQGWAtFAUF1De9ttJ7RV5dTR_ivNyL0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

Thanks for the reply!

The hardware is Telit's GE863-PRO module. I'm using Round Solutions STK4
evaluation kit which comes with the GE863-PRO Telit module.

The module contains the following:
64MB RAM
128MB NAND flash
CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00053177

Kernel: 2.6.33.7 with "RT" patch-2.6.33.7.2-rt30

Telit do provide a working kernel....they also provide a "build framework"
to rebuild their kernel and busybox, they also provide u-boot
source....however their framework doesn't cater for rebuilding uClibc. My
applications require uClibc to have "posix_spawn". My "buildroot" has a
posix_spawn patch and it compiles my applications...hence the interest in
trying to get a "buildroot" kernel booting.

I think I understand now....when I boot Telit's kernel, it says "Machine:
Telit CS1275" .... I guess this is what I need to focus on.

I have contacted Telit and am in the process of asking them to provide
patches/support for "buildroot"....rather then their custom build framework.

Thinking about what you said and Telit's kernel saying "Macine: Telit
CS1275"......makes me realize the mainstream uboot and/or kernel will never
work and I need to start at the basics...ie uboot board definition for
"Machine: Telit CS1275"

I tried making a kernel patch....but the latest kernel's
"...drivers/mtd/nand/nand_bbt.c"  has change a lot since Telit's 2.6.24
version..... conceivably beyond a simple diff patch.

I'll try and focus on uboot board definition as a start. Looking through
Telit source for their uboot there is a fair bit of "product specific" code:

root at varm:/opt/Telit-uboot/221.00.0000# grep -ir telit * | grep "\.c" | awk
-F":" '{print $1}' | sort -u
board/cs1275/at91sam9260.c
board/cs1275/flash.c
CHANGELOG
common/cmd_flash.c
common/cmd_gpsflash.c
common/cmd_mem.c
common/cmd_nand.c
common/cmd_nvedit.c
common/cmd_ota.c
common/cmd_ptser.c
common/cmd_rtc.c
common/cmd_usbser.c
common/env_common.c
common/env_flash.c
cpu/arm926ejs/at91sam9260/spi.c
drivers/at45.c
drivers/flash.c
drivers/nand/nandflash.c
drivers/spi_flash.c
drivers/stm_M25Pxx.c
root at varm:/opt/Telit-uboot/221.00.0000#


Thanks again for clearing things up!!!!!

Bruce













On Fri, Feb 18, 2011 at 6:49 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello Bruce,
>
> On Fri, 18 Feb 2011 18:21:22 +0000
> bruce bushby <bruce.bushby@gmail.com> wrote:
>
> > I'm very new to embedded linux and buildroot....although already
> > addicted.
> >
> > I've spent the past month trying to boot a kernel on one of Telit's
> > modules (GE863-PRO) and am sad to say I have progressed no further
> > then the first two hours :) so I must be missing some fundamental
> > key...hence this email.
> >
> > I have tried various kernel configurations via buildroot, I have also
> > downloaded pre-compiled kernels from the linux4sam site....think I
> > also tried a few others which were aimed at "at91sam9260" and they
> > all do exactly same thing......after uncompressing the kernel they
> > print garbage....and after a while return to the uboot prompt.
> >
> > Any hints or pointers would be appreciated. I understand this is
> > perhaps not the right forum for such a discussion.
>
> What is your hardware exactly ? Which kernel version are you using ?
> Which kernel configuration are you using ?
>
> You can't just get a random ~AT91 kernel and have it work on any random
> AT91 board. The kernel has to be specifically configured for the
> hardware platform you're using. Typically, the hardware vendor (Telit
> in your case) provides kernel sources and configuration that work on
> their platform.
>
> I haven't seen any Telit board supported in the upstream mainline Linux
> kernel. So I don't think you'll have any success with a stock mainline
> kernel such as the 2.6.33.7 you're using.
>
> According to
> http://www.telit.com/en/products/programming/linux/linux-on-ge863-pro3.php
> ,
> they have a Linux kernel running on this platform. So you should ask
> the vendor of your hardware platform.
>
> Regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110218/860858e1/attachment.html>
