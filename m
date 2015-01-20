From: Ivo Slanina <ivo.slanina@gmail.com>
Date: Tue, 20 Jan 2015 09:03:16 +0100
Subject: [Buildroot] [PATCH 1/1] configs/udoo_quad_defconfig: new
	defconfig
In-Reply-To: <20150118131032.GH2555@sapphire.tkos.co.il>
References: <1421533112-5265-1-git-send-email-ivo.slanina@gmail.com>
 <20150117223246.GH2827@tarshish> <54BBA8CB.9060302@gmail.com>
 <20150118131032.GH2555@sapphire.tkos.co.il>
Message-ID: <54BE0BC4.4030707@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

On 01/18/2015 02:10 PM, Baruch Siach wrote:
> On Sun, Jan 18, 2015 at 01:36:27PM +0100, Ivo Slanina wrote:
>> On 01/17/2015 11:32 PM, Baruch Siach wrote:
>>> Why can't you use mainline kernel for this board?
>>
>> I tried to used mainline kernel, but board doesn't boot up. I get only
>> following output:
>>
>> U-Boot 2013.10-rc3 (Jan 18 2015 - 12:03:56)
>>
>> CPU:   Freescale i.MX6Q rev1.2 at 792 MHz
>> Reset cause: POR
>> Board: UDOO
>> DRAM:  1 GiB
>> MMC:   FSL_SDHC: 0
>> *** Warning - bad CRC, using default environment
>>
>> No panel detected: default to LDB-WVGA
>> Display: LDB-WVGA (800x480)
>> In:    serial
>> Out:   serial
>> Err:   serial
>> Net:   using phy at 6
>> FEC [PRIME]
>> Hit any key to stop autoboot:  0
>> mmc0 is current device
>> ** File not found boot.scr **
>> 5489632 bytes read in 391 ms (13.4 MiB/s)
>> Booting from mmc ...
>> ** File not found imx6q-udoo.dtb **
> 
> Here is a clue. You can generate imx6q-udoo.dtb from the Linux sources by 
> enabling CONFIG_ARCH_MXC, and running
> 
> 	make dtbs
> 
> Then copy arch/arm/boot/dts/imx6q-udoo.dtb to your MMC partition.
> 
>> ## Booting kernel from Legacy Image at 12000000 ...
>>    Image Name:   Linux-3.18.3
>>    Image Type:   ARM Linux Kernel Image (uncompressed)
>>    Data Size:    5489568 Bytes = 5.2 MiB
>>    Load Address: 10008000
>>    Entry Point:  10008000
>>    Verifying Checksum ... OK
>>    Loading Kernel Image ... OK
>>
>> Starting kernel ...
>>
>> After this, board stuck. I also encountered this issue with another
>> i.MX6 based board but I didn't fix that yet. Kernel from UDOO
>> repository works fine.
>>
>> I'm new in embedded Linux development. I still have a lot to learn,
>> so I would be grateful if someone points me to how to use mainline kernel.
> 
> Hope this helps.
> 
> baruch
> 

Thanks for help, I didn't notice device tree source file for UDOO in Linux sources.
But after copying .dtb file into SD card, board still doesn't boot up.

Here is output, what I get:

U-Boot 2013.10-rc3 (Jan 18 2015 - 17:53:27)

CPU:   Freescale i.MX6Q rev1.2 at 792 MHz
Reset cause: POR
Board: UDOO
DRAM:  1 GiB
MMC:   FSL_SDHC: 0
*** Warning - bad CRC, using default environment

No panel detected: default to LDB-WVGA
Display: LDB-WVGA (800x480)
In:    serial
Out:   serial
Err:   serial
Net:   using phy at 6
FEC [PRIME]
Hit any key to stop autoboot:  0 
mmc0 is current device
** File not found boot.scr **
5489632 bytes read in 361 ms (14.5 MiB/s)
Booting from mmc ...
27547 bytes read in 129 ms (208 KiB/s)
## Booting kernel from Legacy Image at 12000000 ...
   Image Name:   Linux-3.18.3
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    5489568 Bytes = 5.2 MiB
   Load Address: 10008000
   Entry Point:  10008000
   Verifying Checksum ... OK
## Flattened Device Tree blob at 11000000
   Booting using the fdt blob at 0x11000000
   Loading Kernel Image ... OK
   Using Device Tree in place at 11000000, end 11009b9a

Starting kernel ... 

It seems to be some trivial problem to me, but I can't fix this by myself.
I not really understand uImage load address. I know that at 0x1000000 address
starts MMC zone, but I'm not sure what is 0x8000 offset from that address.
I took the value from freescale_imx6qsabresd_defconfig.

Please, can you give me some other clue?

Thanks,
Ivo Slanina
