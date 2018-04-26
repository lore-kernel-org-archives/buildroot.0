From: Jacek Drewniak <yahuza.pl@gmail.com>
Date: Thu, 26 Apr 2018 18:38:45 +0000
Subject: [Buildroot] enc28j60 ethernet module doesn't work on rpi0
In-Reply-To: <CAPzLZqS-C=ZOBgbeRaBGDObdnpchpK47U60NLDfG8C_p0KqiLA@mail.gmail.com>
References: <CAPzLZqQaSiPWqcW=JgbtwtvDHJYq171ydFXBeSCsiLZJhDfoXg@mail.gmail.com>
 <CAPzLZqS-C=ZOBgbeRaBGDObdnpchpK47U60NLDfG8C_p0KqiLA@mail.gmail.com>
Message-ID: <CAPzLZqQgvhVneQeEo6yyznACgddscirCr1VU2u-7X7zUzgR-bQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've tested which versions works. It seems that last tagged 2018.02.1 still
works but master doesn't.

Here is diff:

$ diff -r sdcard.master/1/ sdcard.2018.02.1/1
Binary files sdcard.master/1/[SYS]/Journal and
sdcard.2018.02.1/1/[SYS]/Journal differ
Only in sdcard.master/1/bin: arch
Binary files sdcard.master/1/bin/busybox and sdcard.2018.02.1/1/bin/busybox
differ
Only in sdcard.master/1/bin: nuke
Only in sdcard.master/1/bin: resume
Only in sdcard.2018.02.1/1/dev: console
Only in sdcard.2018.02.1/1/lib: firmware
Only in sdcard.2018.02.1/1/lib: ld-uClibc-1.0.28.so
Only in sdcard.master/1/lib: ld-uClibc-1.0.29.so
Only in sdcard.2018.02.1/1/lib: libuClibc-1.0.28.so
Only in sdcard.master/1/lib: libuClibc-1.0.29.so
Only in sdcard.master/1/lib/modules: 4.14.29
Only in sdcard.2018.02.1/1/lib/modules: 4.9.79
Only in sdcard.master/1/sbin: run-init
Binary files sdcard.master/1/usr/bin/getconf and
sdcard.2018.02.1/1/usr/bin/getconf differ
Only in sdcard.master/1/usr/bin: hexedit
Only in sdcard.master/1/usr/bin: setfattr
diff -r sdcard.master/1/usr/lib/os-release
sdcard.2018.02.1/1/usr/lib/os-release
2c2
< VERSION=2018.05-git-00959-g2254a32
---
> VERSION=2018.02.1
4,5c4,5
< VERSION_ID=2018.05-git
< PRETTY_NAME="Buildroot 2018.05-git"
---
> VERSION_ID=2018.02.1
> PRETTY_NAME="Buildroot 2018.02.1"

JD

wt., 24 kwi 2018 o 21:19 Jacek Drewniak <yahuza.pl@gmail.com> napisa?(a):

> I've found something. I've tried previous version of buildroot: *git
> checkout 2016.11*
> I've built this particular version, done other steps I mentioned in
> previous post, *and now it works*! (not completely, I have to configure
> the interface now) but *drivers now are loaded during boot and eth0
> appeared. *
>
> It seems that problem is with loading modules at all. Now after `Starting
> mdev...` I can see that others modules loaded: gpiomem, watchdog.
>
> My boot sequence: https://pastebin.com/aXsKu8TY
>
> Regards
> Jacek
>
> wt., 24 kwi 2018 o 14:31 Jacek Drewniak <yahuza.pl@gmail.com> napisa?(a):
>
>> Hello everyone!
>>
>> I have external enc28j60 connected through SPI to Raspberry Pi Zero but
>> there is no eth0 interface available.
>>
>> *In this same hardware configuration eth0 works fine with Raspbian Lite.*
>>
>>
>> Steps, which I've made:
>> 1. Clone buildroot from official repo
>> 2. make raspberrypi0_defconfig
>> 3. Add BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
>> 4. Make and burn image into sd card
>> 5. Add `enc28j60.dtbo` into overlays directory on boot partition
>> 6. Add  dtparam=spi=on and dtoverlay=enc28j60 into config.txt
>>
>> * Now I can see enc28j60 under: /proc/device-tree/soc/spi at 7e204000
>> * Driver module is present
>> under: /lib/modules/4.14.29/kernel/drivers/net/ethernet/microchip/enc28j60.ko
>>
>> I have added eth0 to /etc/network/interfaces but during boot I can only
>> get message  `Starting network: ifup: ignoring unknown interface eth0` or
>> `Starting network: ip: SIOCGIFFLAGS: No such device`
>>
>> Some facts:
>> - ifconfig -a shows only lo interface
>> - enc28j60.ko is not loaded during boot
>> - I can modprobe enc28j60.ko and it appears in lsmod but nothing else
>> happens (no eth0 in ifconfig)
>> - Here it is my dmesg: https://pastebin.com/Jy2H9KU1
>> - Modinfo output: https://pastebin.com/xkDPY5Zr
>>
>> I found very similar story with happy end, but I have mdev enabled and it
>> still doesn't work.
>>
>> http://buildroot-busybox.2317881.n4.nabble.com/Bug-9541-New-Platform-drivers-autoloading-from-info-in-device-tree-does-not-work-td153712.html
>>
>> Best regards
>> Jacek Drewniak
>>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180426/3ef983dc/attachment.html>
