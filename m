From: Ted Salazar <Ted.Salazar@maximintegrated.com>
Date: Mon, 8 Jun 2015 09:59:05 -0700
Subject: [Buildroot] nand id format in /nandflash.c
In-Reply-To: <20150607093402.GG2671@tarshish>
References: <B03A893ADFE80748942D13AFAF28451924E7512BF8@ITSVLEX06.it.maxim-ic.internal>
 <20150607093402.GG2671@tarshish>
Message-ID: <B03A893ADFE80748942D13AFAF28451924E7513045@ITSVLEX06.it.maxim-ic.internal>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Thank you for your response. You are correct the prototype of those parameters are in nand.h. and you basically answered my question, thank you very much.

Regarding your second comment that hard coding the parameters in the nand ids array not being needed because it is ONFI compliant is a little confusing to me though for a few reasons:

1. Atmel told me I have to add in the new IDs in that file if the NandFlash part number is changed
2. The nandflash.c file is used by mainline BuildRoot and is located on my setup at
 /home/tsalazar/buildroot/output/build/at91bootstrap3-v3.7.1/driver. 

In this file there are several of NandFlash part numbers in there so it only makes sense to me that I would need to add it in if I used one that was not listed.

#ifdef CONFIG_NANDFLASH_SMALL_BLOCKS
static struct nand_chip nand_ids[] = {
	/* Samsung 32MB 8Bit */
	{0xec75, 0x800, 0x4000,  0x200, 0x10, 0x0},
	{0,}
};
#else
static struct nand_chip nand_ids[] = {
#ifdef CONFIG_AT91SAM9260EK
	/* Samsung K9F2G08U0M 256MB */
	{0xecda, 0x800, 0x20000, 0x800, 0x40, 0x0},
	/* Samsung K9F2G08U0A 256MB */
	{0xecaa, 0x800, 0x20000, 0x800, 0x40, 0x0},
	/* Micron MT29F2G16AAB 256MB */
	{0x2cca, 0x800, 0x20000, 0x800, 0x40, 0x1},
	/* Micron MT29F2G08AAC 256MB  */
	{0x2cda, 0x800, 0x20000, 0x800, 0x40, 0x0},
	/* Micron MT29F2G08ABD 256MB */
	{0x2caa, 0x800, 0x20000, 0x800, 0x40, 0x0},
	/* Mircon MT29H8G08ACAH1 1GB */
	{0x2c38, 0x800, 0x80000, 0x1000, 0xe0, 0x0},
#else
	/* Samsung K9F2G08U0M 256MB */
	{0xecda, 0x800, 0x20000, 0x800, 0x40, 0x0},
	/* Samsung K9F2G08U0A 256MB */
	{0xecaa, 0x800, 0x20000, 0x800, 0x40, 0x0},
	/* Micron MT29F2G16AAB 256MB */
	{0x2cca, 0x800, 0x20000, 0x800, 0x40, 0x1},
	/* Micron MT29F2G08AAC 256MB  */
	{0x2cda, 0x800, 0x20000, 0x800, 0x40, 0x0},
	/* Micron MT29F2G08ABD 256MB */
	{0x2caa, 0x800, 0x20000, 0x800, 0x40, 0x0},
	/* Hynix HY27UF082G2A 256MB */
	{0xadda, 0x800, 0x20000, 0x800, 0x40, 0x0},
	/* Hynix HY27UF162G2A 256MB */
	{0xadca, 0x800, 0x20000, 0x800, 0x40, 0x1},
	/* Mircon MT29H8G08ACAH1 1GB */
	{0x2c38, 0x800, 0x80000, 0x1000, 0xe0, 0x0},
	/* EON EN27LN1G08 128MB */
	{0x92f1, 0x400, 0x20000, 0x800, 0x40, 0x0},
#endif


Is it everyone else's experience the same as Baruch's that if you use ONFI compatible NandFlash that you should not need to manually add ids to :

/buildroot/output/build/at91bootstrap3-v3.7.1/driver/nandflash.c

Thank you
Ted

-----Original Message-----
From: Baruch Siach [mailto:baruch at tkos.co.il] 
Sent: Sunday, June 07, 2015 2:34 AM
To: Ted Salazar
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] nand id format in /nandflash.c

Hi Ted,

On Sun, Jun 07, 2015 at 02:00:54AM -0700, Ted Salazar wrote:
> Not sure why this is not commented in the source code by Atmel but can 
> one of you tell me what the nand id format is in /nandflash.c. You 
> guys must do this all the time. I know the first four hex numbers are 
> the manufacturer ID and the device ID from the data sheet but what is 
> the format for the other hex values?

This file is not part of Buildroot. In case you refer to driver/nandflash.c from the at91bootstrap project, please direct your question to at91bootstrap developers as listed at the end of the README file.

Two short answers below.

> For example,
> 
> static struct nand_chip nand_ids[] = {
>                 /* Micron MT29F2G16AAB 256MB */
>                 {0x2cca, 0x800, 0x20000, 0x800, 0x40, 0x1},
>                 /* Micron MT29F2G08AAC 256MB  */
>                 {0x2cda, 0x800, 0x20000, 0x800, 0x40, 0x0}, ...
> 
> What does the 2nd (0x800), 3rd (0x20000) , 4th (0x800), 5th (0x40), 
> and 6th
> (0x1) hex numbers represent since I need to move to a different memory 
> manufacturer and will need to create a new nandflash option.

See the definition of 'struct nand_chip' at include/nand.h.

> Micron nandflash data sheet link below:
> http://media.digikey.com/pdf/Data%20Sheets/Micron%20Technology%20Inc%2
> 0PDFs/MT29F2G%2808,16%29AAD,ABD.pdf

This NAND flash chip is ONFI compliant. Hard coding its parameters in the nand_ids array should not be needed.

Hope this helps,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
