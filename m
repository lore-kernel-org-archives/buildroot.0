From: Jorge S. <jorgesolla@gmail.com>
Date: Sat, 12 Jan 2008 14:28:20 +0100
Subject: [Buildroot] How is the RM9200 status of buildroot ?
In-Reply-To: <006801c85399$1868c440$6e00a8c0@JONATHAN>
References: <05f701c85243$52e4c530$6e00a8c0@JONATHAN>
	<01ce01c8524a$65be7fa0$080514ac@atmel.com>
	<000001c852cc$8bd69100$6e00a8c0@JONATHAN>
	<014901c852ed$4ce2d500$6103170a@atmel.com>
	<009e01c852f8$fe7078d0$6e00a8c0@JONATHAN>
	<027601c8531e$73c08420$6103170a@atmel.com>
	<006801c85399$1868c440$6e00a8c0@JONATHAN>
Message-ID: <6090c5eb0801120528k4c0a7a9y61e6abaf61ed128e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Jan 10, 2008 3:57 PM, Jonathan Dumaresq <jdumaresq@cimeq.qc.ca> wrote:

> Hi,
>
> Since this board was designed some time ago, we have choose to use the
> rm9200 because we already have some test board with this chip. This is
> only
> for educational purpose. So we wan to explore how an arm9 work. Debugging
> methode etc.
>
> So if we go into a commercial project, we will probably use the AVR32. Bu
> this sould be the same process of debugging .
>
> Again
>
> I'll appreciate your valuable information
>
> Jonathan
>
> -----Message d'origine-----
> De: Ulf Samuelsson [mailto:ulf.samuelsson at atmel.com]
> Envoy?: 9 janvier 2008 18:58
> ?: Jonathan Dumaresq; buildroot at uclibc.org
> Objet: Re: [Buildroot] How is the RM9200 status of buildroot ?
>
> Great information ulf,
>
> I already have my board in hand. I done some basic testing with a jtag
> interface with openocd. I can talk to the cpu this is a good news in some
> way. Then I try to talk to the flash and got some response. So I think I'm
> in good position to continue testing my board.
>
> What I will do next is to try to use the jtag interface and write to
> sdram.
>
> As for why we use parallel flash ... I' don't know. I have access to sd
> memory also. This can be a good thing ?
>
> ==> You should look at the Atmel website for dataflash = AT45DB642D.
>        Also, choosing the AT91RM9200 at this point of time may be a
> mistake
>        The AT91SAM9260 has about the same functionality,
>        fixes some bugs, and is cheaper.
>        The BootROM has a failsafe mode, which I am really fond of (I
> defined it :-)
>        There will be a pin compatible part (AT91SAM9260A) running at 400
> MHz.
>        Samples are going to be shipped to a few customers about now, rest
>        of the customers has to wait.
>        There is also a pin compatible flash version AT91SAM92XE
>        (First ARM flash microcontroller at 200 MHz?)    - Available real
> soon now...
>
>        The only reason to start designing with the AT91RM9200 is that
>        you want to have the ETM (Embedded Trace Module) or you
>        are interested in the lower power consumption of the ARM920T
> hardcore
>        in the AT91RM9200 compared to the ARM926EJ-S in the AT91SAM9260.
>        The AT91RM9200 also have a few more I/O pins than the SAM9260 due
>        to its 256 BGA package compared to the 217 BGA in the SAM9260.
>
>        This is my personal opinion, (as I usually indicate in the
> signature)
>        Both AT91RM9200 and the SAM9260 will be produced for a long time
>        so availability has nothing to do with the decision.
>
>
 Hi All,

  I've had some bad expecirences using the AT91RM9200 on a custom board:

  1) Unable to boot from parallel flash, so you have to use an external
eeprom if you want to use a parallel flash
    or end up using an SPI Dataflash as i did (see problem 2)

  2) When using SPI Dataflash on CS0 you have to use the bit-bang kernel
driver instead of the SPI hardware, because of
     another problem on the CS that can cause random operations on the
dataflash and end up ruining your filesystem.
     There's no clear workaround for this problem, some say it works when
slowing down the SPI, some other say that it
     still fails even when its running slow, and so on.

  3) I managed to get buildroot working on a JFFS2 filesystem after
looooooooots of problems with the default atmel configs, so
     i did my own config.


  Hope this info is useful for somebody...

  Now my questions:


  I'm now facing a new project that requires the develpment of a new custom
board but i don't want to use the
  AT91RM9200 again (enough is enough) so i'm doing some investigation on the
AT91SAM926x family.

  Questions:

    - Is buildroot working OK for the AT91SAM926x? Any 1st hand experience?
I'm talking only about the toolchain+utilities
          part of buildroot (i usually build kernel and u-boot appart from
buildroot)

   - The RM9200 was having an errata on the ROM bootloader not allowing you
to boot from a parallel dataflash, according to the AT91SAM9260 datasheet,
theres an errata on the SAM9260 too, that leads to the same problem...unable
to boot from parallel flash. So the only workaround i see is to use a SPI
dataflash to boot, and an additional parallel flash for the rootfs (i need
more than 8MiB).

  - (Maybe this is a kernel-list question) Again, based on experience... Do
you guys know if the kernel is supporting "well" the main peripherals?
   or are there any "pending" issues related to hardware erratas? I need
SPI, I2C, USB (host), Ethernet and maybe some GPIO pins that look like
supported when taking a look at the kernel patches... any useful "warning"
here? I don't want to face again the same problems on the RM9200 :(.

        - Any "cheap" development board, like the KB920x for the AT91RM9200?



 Thanks in advance, and sorry for some off-topic question.


 Regards,
 Jorge.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080112/7ebf1416/attachment.htm 
