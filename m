From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Jan 2016 13:32:57 +0100
Subject: [Buildroot] [PATCH] board: add support for Freescale i.MX6UL
 Evaluation Kit
In-Reply-To: <56A0C3B7.40900@free.fr>
References: <1453300220-29113-1-git-send-email-julien.boibessot@free.fr>
 <20160120211015.79807c32@free-electrons.com>
 <56A0C3B7.40900@free.fr>
Message-ID: <20160121133257.38d9a56a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien,

On Thu, 21 Jan 2016 12:40:39 +0100, Julien Boibessot wrote:

> 
> I first started to use genimage, yes, but as I wanted to mimic Freescale
> microSD partitionning I was stucked by the fact that genimage
> (apparently) doesn't handle VFAT partitions. Indeed i.MX6UL microSD
> Freescale's format is:
> * 1MB free
> * U-Boot
> * VFAT partition starting at offset 8M to store kernel and dtbs (size 16MB)
> * EXT2 rootfs on the remaining space.
> 
> So I ended up in using i.XM28EVK way of doing
> (board/freescale/imx28evk/create-boot-sd.sh).
> Do you agree ?

genimage is perfectly capable of creating a vfat partition, see
board/raspberrypi/genimage-raspberrypi.cfg for an example.

> > Why ? Any reason to use EABI over EABIhf, which is now the default in
> > Buildroot for Cortex-A processors ?
> 
> Well i.MX6UL has no VFPU, only a NEON, so I thought it was a good idea,
> no ? :-)

What is your source for this information, because it seems to be wrong.
According to ARM
(http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ddi0463f/index.html):

"""
The Cortex-A7 MPCore processor implements the ARMv7-A architecture with
the following architecture extensions:
[...]
 - Vector Floating-Point version 4 (VFPv4) architecture extension for
   floating-point computation that is fully compliant with the IEEE 754
   standard.
"""

So, the Cortex-A7 (which is the core used in the i.MX6UL) has a
mandatory VFPv4 unit.

Also, according to Freescale
(http://cache.nxp.com/files/32bit/doc/fact_sheet/IMX6SRSFS.pdf), in
the column for i.MX6UL:

"""
128 KB L2 cache, NEON?, VFP, TrustZone?
"""

So, please use BR2_EABIHF, and improve your systems by using hard-float
instead of soft-float :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
