From: Jacek Drewniak <yahuza.pl@gmail.com>
Date: Tue, 24 Apr 2018 12:31:10 +0000
Subject: [Buildroot] enc28j60 ethernet module doesn't work on rpi0
Message-ID: <CAPzLZqQaSiPWqcW=JgbtwtvDHJYq171ydFXBeSCsiLZJhDfoXg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone!

I have external enc28j60 connected through SPI to Raspberry Pi Zero but
there is no eth0 interface available.

*In this same hardware configuration eth0 works fine with Raspbian Lite.*

Steps, which I've made:
1. Clone buildroot from official repo
2. make raspberrypi0_defconfig
3. Add BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
4. Make and burn image into sd card
5. Add `enc28j60.dtbo` into overlays directory on boot partition
6. Add  dtparam=spi=on and dtoverlay=enc28j60 into config.txt

* Now I can see enc28j60 under: /proc/device-tree/soc/spi at 7e204000
* Driver module is present
under: /lib/modules/4.14.29/kernel/drivers/net/ethernet/microchip/enc28j60.ko

I have added eth0 to /etc/network/interfaces but during boot I can only get
message  `Starting network: ifup: ignoring unknown interface eth0` or
`Starting network: ip: SIOCGIFFLAGS: No such device`

Some facts:
- ifconfig -a shows only lo interface
- enc28j60.ko is not loaded during boot
- I can modprobe enc28j60.ko and it appears in lsmod but nothing else
happens (no eth0 in ifconfig)
- Here it is my dmesg: https://pastebin.com/Jy2H9KU1
- Modinfo output: https://pastebin.com/xkDPY5Zr

I found very similar story with happy end, but I have mdev enabled and it
still doesn't work.
http://buildroot-busybox.2317881.n4.nabble.com/Bug-9541-New-Platform-drivers-autoloading-from-info-in-device-tree-does-not-work-td153712.html

Best regards
Jacek Drewniak
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180424/29737e4b/attachment.html>
