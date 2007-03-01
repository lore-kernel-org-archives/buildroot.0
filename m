From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 1 Mar 2007 17:55:50 +0100
Subject: [Buildroot] static libgcc_s
References: <004901c75bcc$356388c0$8c1d10ac@atmel.com>
	<4B278B357EBD634ABB3A5F9D2B63B9C40176A903@iu-mssg-mbx101.ads.iu.edu>
	<007901c75c1a$6acb4540$8c1d10ac@atmel.com>
	<45E6FD66.7090002@indiana.edu>
Message-ID: <073601c75c22$79b27350$8c1d10ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I think that:

  div_t result = div(dAddress, AT91C_PAGE_SIZE(pDataFlash));

can be replaced by:
 div_t result = 0;
 unsigned int dAddr  = dAddress;
 unsigned int page_size = AT91C_PAGE_SIZE(pDataFlash);
 while(dAddr >= page_size) {
  result ++;
  dAddr -= page_size; 
 }

Possbibly you can have a table which is

{
1 * AT91C_PAGE_SIZE(pDataFlash) ,
2 * AT91C_PAGE_SIZE(pDataFlash),
4 * AT91C_PAGE_SIZE(pDataFlash),
8 * AT91C_PAGE_SIZE(pDataFlash),
16 * AT91C_PAGE_SIZE(pDataFlash),
32 * AT91C_PAGE_SIZE(pDataFlash),
64 * AT91C_PAGE_SIZE(pDataFlash),
128 * AT91C_PAGE_SIZE(pDataFlash),
256 * AT91C_PAGE_SIZE(pDataFlash),
512 * AT91C_PAGE_SIZE(pDataFlash),
1024 * AT91C_PAGE_SIZE(pDataFlash),
2048 * AT91C_PAGE_SIZE(pDataFlash),
4096 * AT91C_PAGE_SIZE(pDataFlash)
}
and do a search, but I think it will still be so fast
that it is not neccessary.
at91-bootstrap will only access the lower 256 kB
and maybe as small as 128 kB and I am not at all sure 
that the command sent is not a continuous read
in which case only 0x8000 is used which can be 
compuated once running 32 times thorugh the loop.

Please try if you are interested.


Best Regards
Ulf Samuelsson 


----- Original Message ----- 
From: "Piotr Adam Zolnierczuk" <pzolnier@indiana.edu>
To: <buildroot@uclibc.org>
Cc: <ulf@atmel.com>; <pzolnier@indiana.edu>
Sent: Thursday, March 01, 2007 5:20 PM
Subject: RE: [Buildroot] static libgcc_s


> Ulf:
> 
> thanks for your input
> 
> The source of the problem is that AT91Bootstrap needs div - integer 
> division, see
> Function df_send_command in <PathToAT91Bootstrap>/driver/dataflash.c
> 
> Now  by default  buildroot  generates  only a shared version of libgcc_s.so.
> 
> Here's make output from buildroot generated toolchain 
> (gcc-4.1.1/binutils-2.17)
> [muon:/data/zolnie/EtherDAQ/sw/bsp/bootstrap]$ make 
> CROSS_COMPILE=/opt/arm/bin/arm-linux-
> cd board/at91sam9260ek/dataflash &&  make
> make[1]: Entering directory 
> `/data/zolnie/EtherDAQ/sw/at91sam9260ek/bootstrap/board/at91sam9260ek/dataflash'
> rm -f *.o *.bin *.elf *.map
> /opt/arm/bin/arm-linux-gcc -g -mcpu=arm9 -c -Os -Wall -DAT91SAM9260 
> -I./../../../board/at91sam9260ek/dataflash -DTOP_OF_MEM=0x301000 
> ../../../crt0_gnu.S -o crt0_gnu.o
> /opt/arm/bin/arm-linux-gcc -c -g -mcpu=arm9 -Os -Wall -DAT91SAM9260 
> -I./../../../board/at91sam9260ek/dataflash  
> ../../../board/at91sam9260ek/at91sam9260ek.c -o at91sam9260ek.o
> /opt/arm/bin/arm-linux-gcc -c -g -mcpu=arm9 -Os -Wall -DAT91SAM9260 
> -I./../../../board/at91sam9260ek/dataflash  ../../../main.c -o main.o
> /opt/arm/bin/arm-linux-gcc -c -g -mcpu=arm9 -Os -Wall -DAT91SAM9260 
> -I./../../../board/at91sam9260ek/dataflash  ../../../driver/gpio.c -o gpio.o
> /opt/arm/bin/arm-linux-gcc -c -g -mcpu=arm9 -Os -Wall -DAT91SAM9260 
> -I./../../../board/at91sam9260ek/dataflash  ../../../driver/pmc.c -o pmc.o
> /opt/arm/bin/arm-linux-gcc -c -g -mcpu=arm9 -Os -Wall -DAT91SAM9260 
> -I./../../../board/at91sam9260ek/dataflash  ../../../driver/debug.c -o 
> debug.o
> /opt/arm/bin/arm-linux-gcc -c -g -mcpu=arm9 -Os -Wall -DAT91SAM9260 
> -I./../../../board/at91sam9260ek/dataflash  ../../../driver/sdramc.c -o 
> sdramc.o
> /opt/arm/bin/arm-linux-gcc -c -g -mcpu=arm9 -Os -Wall -DAT91SAM9260 
> -I./../../../board/at91sam9260ek/dataflash  ../../../driver/dataflash.c 
> -o dataflash.o
> /opt/arm/bin/arm-linux-gcc -nostartfiles 
> -Wl,-Map=dataflash_at91sam9260ek.map,--cref ../../../libmygcc.a -T 
> ../../../elf32-littlearm.lds -Ttext 0x200000 -n -o 
> dataflash_at91sam9260ek.elf crt0_gnu.o at91sam9260ek.o main.o gpio.o 
> pmc.o debug.o sdramc.o dataflash.o
> /opt/arm/lib/gcc/arm-linux-uclibc/4.1.1/../../../../arm-linux-uclibc/bin/ld: 
> cannot find -lgcc_s
> collect2: ld returned 1 exit status
> make[1]: *** [dataflash_at91sam9260ek] Error 1
> make[1]: Leaving directory 
> `/data/zolnie/EtherDAQ/sw/at91sam9260ek/bootstrap/board/at91sam9260ek/dataflash'
> make: *** [all] Error 2
> 
> When I use the static version (gcc-3.4.6/binutils-2.16.1) - compiles, 
> loads and boots ok.
> 
>   Piotr
> 
> 
> Piotr Adam Zolnierczuk
> Indiana University               phone:  (812) 855-3613
> Cyclotron Facility               fax:    (812) 855-6645
> 2401 Milo B Sampson Ln    e-mail:  pzolnier at indiana.edu
> Bloomington,              http://www.iucf.indiana.edu/u/pzolnier
> IN 47408
> USA  
> ________________________________________________
>                        written on recycled electrons  
> 
> 
>
