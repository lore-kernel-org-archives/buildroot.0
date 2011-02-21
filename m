From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Feb 2011 23:42:07 +0100
Subject: [Buildroot] booting JFFS2 or UBIFS created with buildroot
In-Reply-To: <AANLkTik=ec9qxhe9Cwv-ZHMoLAD5Wup6=WuCUbMgkXm0@mail.gmail.com>
References: <AANLkTimrjTXp24EtKa1zPrf1j6-s-p1twWYA832PAGun@mail.gmail.com>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1F5E11D6@EXV1.corp.adtran.com>
	<AANLkTimY2pEGmkM+ZvyXSKUuaWHae=B-cQA3iC3xi_2A@mail.gmail.com>
	<20110221230954.4b39da54@surf>
	<AANLkTik=ec9qxhe9Cwv-ZHMoLAD5Wup6=WuCUbMgkXm0@mail.gmail.com>
Message-ID: <20110221234207.53607d77@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 Feb 2011 14:29:35 -0800
Charles Krinke <charles.krinke@gmail.com> wrote:

> First of all, I appreciate greatly the time you are taking to discuss this
> issue. Thank you very much.

You're welcome!

> My flash layout is:
> 
> 0xFE340000 to top of flash rootfs.jffs2 programmed here
> 0xFE120000 uImage here
> 0xFE080000 deviceTree here (1 sector)
> 0xFE000000 u-boot here
> 
> Now with that said, here are my recipes assuming I counted the number of
> 128k sectors properly for the offset to get to JFFS2 in the bootargs line.

Ok, sounds correct.

> Linux version 2.6.36.1 (ckrinke at Yin) (gcc version 4.3.5 (Buildroot 2010.11)
> ) #1 Thu Feb 17 19:04:48 PST 2011

The problem seems to be in your kernel: there are no lines indicating
that a MTD device has been detected. So maybe the MTD device is not
described in your device tree, or improperly described, or the
corresponding kernel driver is missing.

Here are the messages you typically see when a NAND device is being
detected by the kernel (on an ARM AT91 platform) :

NAND device: Manufacturer ID: 0xec, Chip ID: 0xd3 (Samsung NAND 1GiB 3,3V 8-bit)
Scanning device for bad blocks
Bad eraseblock 464 at 0x03a00000
Bad eraseblock 1694 at 0x0d3c0000
Bad eraseblock 3101 at 0x183a0000
Bad eraseblock 3199 at 0x18fe0000
Bad eraseblock 3866 at 0x1e340000
Bad eraseblock 5478 at 0x2acc0000
Bad eraseblock 6473 at 0x32920000
Bad eraseblock 6606 at 0x339c0000
3 cmdlinepart partitions found on MTD device atmel_nand
Creating 3 MTD partitions on "atmel_nand":
0x00000000-0x00100000 : "bootloader"
0x00100000-0x00400000 : "kernel"
0x00400000-0x40000000 : "rootfs"

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
