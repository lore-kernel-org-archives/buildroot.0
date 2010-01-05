From: peter.stosz at mentat.hu <peter.stosz@mentat.hu>
Date: Tue, 5 Jan 2010 01:13:26 +0100
Subject: [Buildroot] mdev & usb problem
Message-ID: <OF405E38C2.BA69D5BB-ONC12576A1.0082D712-C12576A2.00013AFE@mentat.hu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

I trying to move our embedded application to busybox/mdev.
mdev seems like to be working, connected device's device name appear in 
/dev directory. (Disappear after removing the device)
But our application not working in this environment.
Works well openembedded/udev environment, ubuntu(9.10) develompent 
environment, but not with buildroot/mdev.

When I test it with our very simple usb test program, nothing happen.
I try to "test" it with lsusb, nothing too.

Any idea?


Peter


initttab snip:
::sysinit:/bin/mount -t proc none /proc
::sysinit:/bin/mount -t sysfs none /sys
::sysinit:/bin/mount -t tmpfs none /tmp
::sysinit:/bin/mount -t tmpfs -o size=64k,mode=0755 none /dev
::sysinit:/bin/mkdir /dev/pts
::sysinit:/bin/mount -t devpts devpts /dev/pts
::sysinit:/bin/echo /sbin/mdev > /proc/sys/kernel/hotplug
::sysinit:/sbin/mdev -s

/opt # cat /etc/br-version 
2010.02-git-00158-g6415e3a-dirty
/opt # 
/opt # usb 1-1: new full speed USB device using at91_ohci and address 5
usb 1-1: configuration #1 chosen from 1 choice
 uba: uba1
usb 1-1: New USB device found, idVendor=0ea0, idProduct=6828
usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
usb 1-1: Product: Flash Disk 
usb 1-1: Manufacturer: USB 
usb 1-1: SerialNumber: D456953F963CC32E

/opt # lsusb  { nothing :( }
/opt # lsusb -t
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=at91_ohci/1p, 12M
    |__ Port 1: Dev 5, If 0, Class=stor., Driver=ub, 12M
/opt # ./us  { nothing :( }
/opt # cat us.c
#include <stdio.h>
#include <string.h>
#include <usb.h>

int main(int argc, const char *argv[])
{
    struct usb_bus *usb_bus;
    struct usb_device *dev;

    usb_init();
    usb_find_busses();
    usb_find_devices();

    for (usb_bus = usb_busses; usb_bus; usb_bus = usb_bus->next) {
        printf("\nDevice:\n");
        for (dev = usb_bus->devices; dev; dev = dev->next) {
            printf("\tLength: %d\n\tDescriptor type: %d\n\tbcdUSB: 
%d\n\tDevice class: %d\n\tDevice subclass: %d\n\tDevice protocol: 
%d\n\tMa....
        }
    }
    return 0;
}
/opt # 


us' output on ubuntu: 

~/../dev/usb$ ./us:

Device:
        Length: 18
        Descriptor type: 1
        bcdUSB: 512
        Device class: 9
        Device subclass: 0
        Device protocol: 0
        Max packet size: 64
        ID: 1d6b:0002
        bcdDevice: 518
        Manufacturer: 3
        Product: 2
        Serial number: 1
        Number of configurations: 1


Device:
        Length: 18
        Descriptor type: 1
        bcdUSB: 272
        Device class: 9
        Device subclass: 0
        Device protocol: 0
        Max packet size: 64
        ID: 1d6b:0001
        bcdDevice: 518
        Manufacturer: 3
        Product: 2
        Serial number: 1
...
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100105/439a0f4d/attachment-0001.htm>
