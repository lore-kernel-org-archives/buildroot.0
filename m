From: Marko Stanisic <sankerspace@gmail.com>
Date: Fri, 30 Apr 2021 17:38:58 +0200
Subject: [Buildroot] eMMC image not booting (uboot related issue)
In-Reply-To: <CAAmck7WGrCjY803E5tzOwTFT3bAP3Ov-zeZ4dJwUJpzq0q3fPQ@mail.gmail.com>
References: <CAAmck7XUFQ+Jb=tRKTXPvzQWPfNvF9VXC70J9R-wZgDc6p+BMw@mail.gmail.com>
 <CAAmck7WGrCjY803E5tzOwTFT3bAP3Ov-zeZ4dJwUJpzq0q3fPQ@mail.gmail.com>
Message-ID: <9785f41c-df26-d5fe-41df-33189b5a37ed@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Andy,

Maybe a hint for you:

- I think "mccdev" could be the wrong variable, the correct is "mmcdev"


- In your output i saw following:

On a working boot:
/Hit any key to stop autoboot: ?0
switch to partitions #0, OK
*mmc0* is current device
SD/MMC found on device 0/

Are you sure that mmcdev=1?

Check it with following command :

 ??? => mmc list

if it show something like:

 ??? FSL_SDHC: 0 (eMMC)

than the correct setting can be changed with:

/=> setenv mmcdev 0/

otherwise

/=> setenv mmcdev 1
/



- Regarding 2)? Boot from the SDCard and configure the eMMC using fdisk.

these are two different device using the same bus, because they are both 
mmc devices, do you

explicitly use the emmc of the beaglebone and you dont want the sd-card, 
could be confusing to understand.

In case of the emmc:

First, How about the fuse settings of the emmc?? Second, sdcard and emmc 
are bot mmc devices, maybe

mmcdev=1 indicates the sd card. I dont have a beaglebone, but i would 
recommend to study the

cpu documentation and beaglebone, these should give a solid hit how 
perfoirm a change between

sdcard and emmc.

You should also Overview the boot settings, maybe they are specialized 
to the sd-card case.


Whish happy coding :)


On 30.04.21 16:38, Andy Bergh wrote:
> Hi,
>
> Sorry to spam. I managed to set the mccdev var to 1 before booting but 
> it still fails (using the preboot option in uboot-menuconfig). So that 
> was not the issue. The output and error:
> /Hit any key to stop autoboot: ?0
> => printenv mccdev
> mccdev=1
> => boot
> switch to partitions #0, OK
> mmc1(part 0) is current device
> Scanning mmc 1:1...
> *40817 bytes read in 4 ms (9.7 MiB/s)*
> switch to partitions #0, OK
> mmc1(part 0) is current device
> SD/MMC found on device 1
> *## Error: "bootcmd_nand0" not defined*
> starting USB...
> Bus usb at 47401800: Port not available.
> link up on port 0, speed 100, full duplex
> BOOTP broadcast 1
> BOOTP broadcast 2/
>
> On a working boot:
> /Hit any key to stop autoboot: ?0
> switch to partitions #0, OK
> mmc0 is current device
> SD/MMC found on device 0
> *591 bytes read in 2 ms (288.1 KiB/s)
> Loaded env from uEnv.txt*
> Importing environment from mmc0 ...
> Running uenvcmd ...
> 6090656 bytes read in 392 ms (14.8 MiB/s)
> 40817 bytes read in 5 ms (7.8 MiB/s)
> bootargs=console=ttyS0,115200n8 root=/dev/mmcblk0p2 rw rootfstype=ext4 
> rootwait
> ## Flattened Device Tree blob at 88000000
> ? ?Booting using the fdt blob at 0x88000000
> ? ?Loading Device Tree to 8fff3000, end 8fffff70 ... OK
>
> /
> /Starting kernel .../
>
> I truly am stuck here. Any advice would be appreciated.
>
> Thank you
>
>
> On Fri, Apr 30, 2021 at 3:02 PM Andy Bergh <allmyaddmin@gmail.com 
> <mailto:allmyaddmin@gmail.com>> wrote:
>
>     Hi,
>
>     I have made an image for my Beaglebone Black using buildroot,
>     great project, thanks. The sdcard.img boots fine, but I can not
>     get it to boot from power up from the eMMC.
>
>     What I have done:
>     1) Build an image using buildroot (with beaglebone_defconfig).
>     The sdcard.img boots just fine.
>     2) Boot from the SDCard and configure the eMMC using fdisk. I
>     followed the instructions shown here
>     <https://e2e.ti.com/support/processors/f/processors-forum/344528/u-boot-write-mlo-uboot-uimage-rootfs-on-to-emmc-mnand-of-am335x-evm-j5-echo-based-custom-board/1204926#1204926>.
>
>     Once the eMMC is configured I perform a power cycle at which point
>     the boot fails. I end up at the uboot prompt (UART port), if I
>     then type "boot" the OS boots correctly.
>     What I have noticed is that the variable mmcdev is set to 0 at
>     startup. After it has failed if I do another printenv mmcdev and
>     then it is set to 1.
>
>     I suspect this is the reason it does not boot successfully at
>     power up, but I may be very wrong!
>
>     How can I set the env var mccdev to be 1 as default at startup? Is
>     this possible, perhaps with uboot-menuconfig? Is that the correct
>     way to solve this problem?
>
>     Any information would be much appreciated.
>
>     Thank you
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210430/f2610461/attachment.html>
