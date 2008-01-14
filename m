From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 14 Jan 2008 20:49:53 +0100
Subject: [Buildroot] How is the RM9200 status of buildroot ?
References: <05f701c85243$52e4c530$6e00a8c0@JONATHAN>
	<01ce01c8524a$65be7fa0$080514ac@atmel.com>
	<000001c852cc$8bd69100$6e00a8c0@JONATHAN>
	<014901c852ed$4ce2d500$6103170a@atmel.com>
	<009e01c852f8$fe7078d0$6e00a8c0@JONATHAN>
	<027601c8531e$73c08420$6103170a@atmel.com>
	<006801c85399$1868c440$6e00a8c0@JONATHAN>
	<6090c5eb0801120528k4c0a7a9y61e6abaf61ed128e@mail.gmail.com>
	<00a501c85644$79675880$020514ac@atmel.com>
	<6090c5eb0801140850o210fee82u570f0e0801ecdfbf@mail.gmail.com>
Message-ID: <020301c856e7$d78ec030$e5031a0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Ulf, thanks for your interesting reply.
> 
> On Jan 12, 2008 5:19 PM, Ulf Samuelsson <ulf@atmel.com> wrote:
> 
>>
>>  Hi All,
>>
>>  I've had some bad expecirences using the AT91RM9200 on a custom board:
>>
>>  1) Unable to boot from parallel flash, so you have to use an external
>> eeprom if you want to use a parallel flash
>>    or end up using an SPI Dataflash as i did (see problem 2)
>>
>> ==> That is a misunderstanding of the datasheet.
>>        You can boot from a 16 bit parallel flash, if BMS is low.
>>        If BMS is high (and the internal bootROM is used) the part
>>        will not find any parallel flash.
>>        Both the AT91RM9200DK and AT91RM9200EK boot from parallel flash.
> 
> 
> Of course, you are right, i didnt mean "no parallel flash" at all.
> 
>>
>>
>>  2) When using SPI Dataflash on CS0 you have to use the bit-bang kernel
>> driver instead of the SPI hardware, because of
>>     another problem on the CS that can cause random operations on the
>> dataflash and end up ruining your filesystem.
>>     There's no clear workaround for this problem, some say it works when
>> slowing down the SPI, some other say that it
>>     still fails even when its running slow, and so on.
>>
>> ==> The problem is that if the PDC (DMA) does not get any cycles,
>>        NPCS0 will go high until the PDC has made its memory access,
>>        breaking a transfer into two, causing confusion at the other end of
>> the SPI.
>>
>>        The workaround is to either reduce the speed to < 5 Mbps
>>        or ensure that the NPCS0 remains low by using external glue logic.
>>        The speed reduction needs to be done in all parts of the system,
>>        I.E: dataflashboot, U-boot and linux.
> 
> 
> Maybe its my fault here, but i didn't success when trying to slow down the
> SPI speed, i modified my custom board definition
> file on the kernel, but it doesn't work, it always says "5Mbps". I've also
> received feedback from people who was having the same
> issue that reported fails even when spi is going slower than 5Mbps.
> 
> Any example here?

This may be kernel version dependent since 2.6.19 or so.
People have been playing around with the SPI driver.

The 5 Mbps limit came from a customer which had heavy networking
going on, including WLAN on a slow Compactflash interface.
The problem occurs if you have many busmasters active at the same time.
This was in 2004.
I have modified my dataflashboot and U-boot and to limit speed
and people testing this says that it seems to work.

>>
>>  3) I managed to get buildroot working on a JFFS2 filesystem after
>> looooooooots of problems with the default atmel configs, so
>>     i did my own config.
>>
>> ==> If you find a problem, it makes sense to feed them back.
> 
> 
> I did on the mailing list.
> 

OK, some emails gets forgotten...

>>
>>
>>  Hope this info is useful for somebody...
>>
>>  Now my questions:
>>
>>
>>  I'm now facing a new project that requires the develpment of a new custom
>> board but i don't want to use the
>>  AT91RM9200 again (enough is enough) so i'm doing some investigation on
>> the
>> AT91SAM926x family.
>>
>>  Questions:
>>
>>    - Is buildroot working OK for the AT91SAM926x? Any 1st hand experience?
>> I'm talking only about the toolchain+utilities
>>          part of buildroot (i usually build kernel and u-boot appart from
>> buildroot)
>>
>> ==> You can get a running toolchain.
>>        A lot of the applications will build, but not all.
>>        Do not expect Buildroot to build a running X-Windows.
> 
> 
> Good news for me,  i don't need X-Windows or any gfx at the moment.
> 
>>
>>
>>   - The RM9200 was having an errata on the ROM bootloader not allowing you
>> to boot from a parallel dataflash, according to the AT91SAM9260 datasheet,
>> theres an errata on the SAM9260 too, that leads to the same
>> problem...unable
>> to boot from parallel flash. So the only workaround i see is to use a SPI
>> dataflash to boot, and an additional parallel flash for the rootfs (i need
>> more than 8MiB).
>>
>> ==> The AT91SAM9260 rev A, will not be able to boot from NAND flash.
>>        You can boot from SPI dataflash or external parallel flash.
>>        As in the RM9200, you have to pull BMS low to boot from the par
>> flash.
>>
>>        There is no S/W support from Atmel for boot from parallel flash
>> yet.
>>        I hope it will be there during mid spring.
>>        Still a lot of customers are using parallel flash with the part
>> using
>>        the normal flash support in U-boot.
> 
> 
> Nah, nevermind, dataflash  is  cheap,  i can afford a dataflash+NAND combo,
> i choose the easy way.
> 

Wise decision!

>>
>>
>>  - (Maybe this is a kernel-list question) Again, based on experience... Do
>> you guys know if the kernel is supporting "well" the main peripherals?
>>   or are there any "pending" issues related to hardware erratas? I need
>> SPI, I2C, USB (host), Ethernet and maybe some GPIO pins that look like
>> supported when taking a look at the kernel patches... any useful "warning"
>> here? I don't want to face again the same problems on the RM9200 :(.
>>
>> ==> USB host - OK.
>>        Ethernet - Use internal SRAM for buffers, if you plan to strangle
>> the bus
>>        with 16 bit operation or run the bus at slow speed.
>>        SPI:    The AT91RM9200 problem is gone.
>>                   At high speeds, you can get a problem with SPI overruns
>> on receive.
>>                   I have seen this at customers when the SPI is using 60%
>> of the available
>>                   bandwidth on the bus.
>>                   Often, an SPI transfer is only using data in a single
>> direction, and if you do an SPI read,
>>                    then it might be good to get the send data from the
>> internal SRAM.
>>                    If you do an SPI send, then it might make sense to
>> write the data to
>>                    an internal part of the chip (like "/dev/null"),
>> instead of writing to the
>>                    SDRAM and then discarding it.
>>                  There is a discussion going on at this point of time, and
>>                  you should check out the ARM linux mailing list.
>>
>>        I2C, The jury is still out on this, and some get it to work and
>> some doesn't.
>>                The vanilla driver is polling the I2C and this could cause
>> problems.
>>                I have customers using interrupt driven I2C and they say
>>                that they do not have any issues.
>>
>>        - Any "cheap" development board, like the KB920x for the
>> AT91RM9200?
>>
>> ==> If you start a development now, then you may want to consider getting
>>        the AT91SAM9260A (or AT91SAM9G20 as will be its new name)
>>        Pin compatible, 400 MHz, and will have larger FIFO for Ethernet.
>>        There is one less USART and one more I2C.
>>
>>
>>
>> ==> Check out www.olimex.com
> 
> 
> Board ordered,  that's  what  i was looking for! ,  thanks again  Ulf,  i
> really appreciate  your  help.
> 
> 
> And , another question: Any working OEM wifi (802.11x) for the AT91SAM?  I
> know i can use USB (i did it on the RM9200 board), but i think usb is not
> really an industrial solution, i need something "hardwired" on the PCB.
> 

There is some work beeing done with SDIO for the AT91SAM9260.
Do not have any status though.

> 
> Thank you again, your support is really helpful.
>



Best Regards
Ulf Samuelsson
