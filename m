From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 23 Feb 2010 23:32:21 +0000 (UTC)
Subject: [Buildroot] Newbie: AT91SAM9260 NAND Boot
References: <815f0bd71002221951v606dbdddn381587fdd662e485@mail.gmail.com>
	<hm0su3$h9k$1@dough.gmane.org>
	<815f0bd71002231515m11ed502bxa3268af876dcdafb@mail.gmail.com>
Message-ID: <hm1oi5$1dg$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Feb 24, 2010 at 10:15:18AM +1100, Roo wrote:
 
>>> I am new to buildroot and have been given a AT91SAM9260 SOM to
>>> work with. The latest buildroot does not appear to include a
>>> defconfig for a NAND boot system.
>>
>> Can you explain what a "NAND boot system" is?
>>
>> When I boot an AT91SAM9xxx from NAND, I tell buildroot to
>> build a JFFS2 root image, a uImage kernel with MTD/JFFS2
>> support, put the resulting kernel and root image into NAND,
>> and configure U-Boot to boot from NAND.
>
> I believe that I had some of the terminology wrong.
>
> I would like a jffs (or a readonly FS) to reside in NAND as
> you had described, but I was confused by the
> dataflash/dataflashcard terminology. I thought it was
> referring to a SD or micro SD card and I do not want the
> rootfs or kernel to reside on the card.

Dataflash is a serial NOR-flash part that's attached to an SPI
interface.  It's sort of similar to an SD-card, but the
interface/protocol is a little different.

> My understanding now is that configurations relate to where
> the bootloader resides rather than where the rootfs resides. I
> am little embarrassed that I didn't realise this earlier and
> if I am right this just got easier. :)

You're probably right.  Buildroot can build U-Boot and, IIRC,
also the low-level SAM9 bootloader: it's what is initially
loaded by the MCU's built-in bootloader from somewhere (NAND,
NOR, SDcard, dataflash) into internal SRAM and run -- it
enables SDRAM, and then loads U-Boot from somewhere (same
choices as before) into SDRAM, and then runs U-Boot.  U-Boot
then loads a kernel image into SDRAM (and optionally loads a
rootfs into SDRAM), and boots the kernel.

And there's no rule that says the low-level SAM9 bootloader,
U-Boot, the kernel, and the rootfs can't all be on different
media.

I've never selected either the bootloader or U-Boot in
buildroot, so I don't know what configuration options are
available for them -- but I would guess that support for the
various boot media are configurable.

-- 
Grant Edwards                   grante             Yow! World War III?
                                  at               No thanks!
                               visi.com            
