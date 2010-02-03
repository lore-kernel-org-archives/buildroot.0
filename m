From: Cameron Hutchison <lists@xdna.net>
Date: Wed, 03 Feb 2010 23:48:33 -0000
Subject: [Buildroot] Confusion with building at91bootstrap
References: <411b.4b68ef33.cfddb@getafix.xdna.net> <4B697A4F.7020307@atmel.com>
Message-ID: <64d3.4b6a0b51.a5bc8@getafix.xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

>Cameron Hutchison skrev:
>> 
>> This causes a build warning that IMG_SIZE is redefined.

>Ignore it.

OK. I assumed the second definition of IMG_SIZE was ignored, but my
little test program tells me otherwise. Since the BR config of IMG_SIZE
comes last on the command line, that would be the definitive size.

>This is the size of the image which is loaded into SDRAM.
>Typically u-boot.
>I think the idea is that buildroot can override the
>config file.

I spent the rest of yesterday getting my head around the different
storage on the 9260EK board and memory layout options, so I think I'll
be ok there, but ...

>> Also, the at91bootstrap defconfig for this board adds the suffix of
>> "card" to the output file, making that filename contain "dataflashcard"
>> when I have configured for "dataflash" not "dataflashcard". I dont yet
>> know what the difference is between these (my board does not appear to
>> have any sort of card or slot for one), so I'm not sure what should be
>> done here, but it appears inconsistent.

>dataflashcard = boot from NPCS0
>dataflash = boot from NPCS1

>Easy to understand, if you use the SAM9260EK.

My concern was that I have configured everything in BR to produce an
image for dataflash, but the output image for at91bootstrap was labelled
dataflashcard. Since I am not using dataflashcard (I found the slot on
the underside of the board :-)), I wanted to make sure I had not done
something wrong. I can't see what, and it appears to build for
dataflash, but just calls the image dataflashcard. I think that is only
because CONFIG_CARD_SUFFIX="card" is in the defconfig.

I'm now trying to build for NAND flash since my final target will not
have dataflash anyway, but that wont build because make MEMORY=nandflash
doesnt #define AT91C_SPI_PCS_DATAFLASH, but the defconfig has
CONFIG_DATAFLASH=y. It seems as well as "make MEMORY=nandflash" the
..config needs to be changed from the defconfig to build.

>You want to use the latest = 2.13.
>2.13-rc# has some issues.
>Need a modification of the recipe in buildroot.

Ok, thanks. I'll try 2.13 shortly.
