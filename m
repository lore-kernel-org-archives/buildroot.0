From: Sylvain LG <forum@sylvainlegourr.com>
Date: Tue, 8 Jul 2014 19:44:30 +0200
Subject: [Buildroot] Buildroot + Raspberry Pi B: eth0 issue
Message-ID: <CAK9TtU2fZB9t0rBnbJHLkHgA4w0sA_kkdtHQV9iwQh5GCquYXQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I've built a Raspberry Pi B system with Buildroot (board/raspberry).

At first boot, network was fine. But after a reboot command, eth0 is not up
at boot and fails with this error:

Starting network...
> [    2.046886] usb 1-1.1: new high-speed USB device number 3 using dwc_otg
> ip: SIOCGIFFLAGS: No such device



Here comes some logs related to USB from dmesg command:

[    1.686999] usb 1-1: New USB device found, idVendor=0424, idProduct=9514
> [    1.692085] usb 1-1: New USB device strings: Mfr=0, Product=0,
> SerialNumber=0
> [    1.724300] hub 1-1:1.0: USB hub found
> [    1.744644] hub 1-1:1.0: 5 ports detected
> [    2.046886] usb 1-1.1: new high-speed USB device number 3 using dwc_otg
> [    2.167046] usb 1-1.1: New USB device found, idVendor=0424,
> idProduct=ec00
> [    2.167064] usb 1-1.1: New USB device strings: Mfr=0, Product=0,
> SerialNumber=0
> [    2.174908] smsc95xx v1.0.4
> [    2.233745] smsc95xx 1-1.1:1.0 eth0: register 'smsc95xx' at
> usb-bcm2708_usb-1.1, smsc95xx USB 2.0 Ethernet, b8:27:eb:85:b6:d9
> [    2.316718] usb 1-1.3: new low-speed USB device number 4 using dwc_otg
> [    2.453202] usb 1-1.3: New USB device found, idVendor=04f2,
> idProduct=0833
> [    2.460841] usb 1-1.3: New USB device strings: Mfr=1, Product=2,
> SerialNumber=0
> [    2.467372] usb 1-1.3: Product: USB Keyboard
> [    2.473219] usb 1-1.3: Manufacturer: CHICONY
> [    2.499820] input: CHICONY USB Keyboard as
> /devices/platform/bcm2708_usb/usb1/1-1/1-1.3/1-1.3:1.0/input/input0
> [    2.510780] hid-generic 0003:04F2:0833.0001: input: USB HID v1.11
> Keyboard [CHICONY USB Keyboard] on usb-bcm2708_usb-1.3/input0
> [    2.558928] input: CHICONY USB Keyboard as
> /devices/platform/bcm2708_usb/usb1/1-1/1-1.3/1-1.3:1.1/input/input1
> [    2.565652] hid-generic 0003:04F2:0833.0002: input: USB HID v1.11
> Device [CHICONY USB Keyboard] on usb-bcm2708_usb-1.3/input1



/etc/network/interfaces:

auto lo
> iface lo inet loopback
> auto eth0
> iface eth0 inet dhcp



If I log into the system, I can use the command ifup eth0 and it works!

# ifup eth0
> [   52.499521] smsc95xx 1-1.1:1.0 eth0: hardware isn't capable of remote
> wakeup
> udhcpc (v1.22.1) stared
> Sending discover...
> [   54.039128] smsc95xx 1-1.1:1.0 eth0: link up, 100Mbps, full-duplex, lpa
> 0xCDE1
> Sending discover...
> Sending select for 192.168.1.230...
> Lease of 192.168.1.230 obtained, lease time 300
> deleting routers
> adding dns 192.168.1.1
> #

 If I shutdown the system, it may work at boot time... or not, after
several retries.
ifup eth0 works everytime by hand.


What do you think about it?
It seems to me that hardware is not yet detected at network init time.

Regards,

Sylvain
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140708/9881862a/attachment.html>
