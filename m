From: peter.stosz at mentat.hu <peter.stosz@mentat.hu>
Date: Tue, 5 Jan 2010 21:30:11 +0100
Subject: [Buildroot] mdev & usb problem
In-Reply-To: <4B433270.6010806@free.fr>
References: <OF405E38C2.BA69D5BB-ONC12576A1.0082D712-C12576A2.00013AFE@mentat.hu>
	<4B42F7A6.1010100@free.fr>
	<OF42E07C52.E79A00B9-ONC12576A2.00330B26-C12576A2.003321B3@mentat.hu>
	<4B433270.6010806@free.fr>
Message-ID: <OF8CDEAB7E.ED8EEE3F-ONC12576A2.006F41A6-C12576A2.0070A0BB@mentat.hu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So, I built up new system from ground.

1) git clone latest buildroot

Everything default, except

2) make menuconfig
arch=arm
+oabi
+strace
+libusb
+usbutils
+development files in targetfs
+native toolchain on targetfs

3) make linux26-menuconfig
-soundcard
-Kernel->CPU LED
+Filesystem->Network File System->rootfs on NFS

4) make (system)

5) no udev, no mdev!
PEN is working,
# 
# mount /dev/sda1 /mnt
EXT2-fs warning: mounting unchecked fs, running e2fsck is recommended
# 
other device recognized
# umount /mnt
(unplug PEN, plug new device)
# usb 1-1: USB disconnect, address 4
usb 1-1: new low speed USB device using at91_ohci and address 5
usb 1-1: configuration #1 chosen from 1 choice
HID device claimed by neither input, hiddev nor hidraw
usb 1-1: New USB device found, idVendor=0590, idProduct=0028
usb 1-1: New USB device strings: Mfr=1, Product=3, SerialNumber=0
usb 1-1: Product: HHX-CABLE-USB1
usb 1-1: Manufacturer: OMRON Corporation

6) compiled our app
nothing changed, no any output (just like lsusb and just like previously 
with mdev)

I don't see what's wrong. :(


Peter

# strace lsusb
...
close(3)                                = 0
open("/dev/bus/usb", O_RDONLY|O_NONBLOCK|O_DIRECTORY) = -1 ENOENT (No such 
file or directory)
open("/proc/bus/usb", O_RDONLY|O_NONBLOCK|O_DIRECTORY) = 3
fstat(3, {st_mode=S_IFDIR|0555, st_size=0, ...}) = 0
fcntl(3, F_SETFD, FD_CLOEXEC)           = 0
getdents(3, /* 2 entries */, 984)       = 32
getdents(3, /* 0 entries */, 984)       = 0
close(3)                                = 0
open("", O_RDONLY|O_NONBLOCK|O_DIRECTORY) = -1 ENOENT (No such file or 
directory)
exit(1)                                 = ?

# strace lsusb -t
...
open("/dev/bus/usb", O_RDONLY|O_NONBLOCK|O_DIRECTORY) = -1 ENOENT (No such 
file or directory)
open("/proc/bus/usb", O_RDONLY|O_NONBLOCK|O_DIRECTORY) = 3
fstat(3, {st_mode=S_IFDIR|0555, st_size=0, ...}) = 0
fcntl(3, F_SETFD, FD_CLOEXEC)           = 0
getdents(3, /* 2 entries */, 984)       = 32
getdents(3, /* 0 entries */, 984)       = 0
close(3)                                = 0
open("", O_RDONLY|O_NONBLOCK|O_DIRECTORY) = -1 ENOENT (No such file or 
directory)
access("/proc/bus/usb/devices", R_OK)   = -1 ENOENT (No such file or 
directory)
open("/sys/bus/usb/devices", O_RDONLY|O_NONBLOCK|O_DIRECTORY) = 3
fstat(3, {st_mode=S_IFDIR|0755, st_size=0, ...}) = 0
fcntl(3, F_SETFD, FD_CLOEXEC)           = 0
getdents(3, /* 6 entries */, 3933)      = 104
open("/sys/bus/usb/devices/usb1/devnum", O_RDONLY) = 4
read(4, "1\n"..., 11)                   = 2
close(4)                                = 0
open("/sys/bus/usb/devices/usb1/bDeviceClass", O_RDONLY) = 4
read(4, "09\n"..., 11)                  = 3
close(4)                                = 0
open("/sys/bus/usb/devices/usb1/maxchild", O_RDONLY) = 4
read(4, "1\n"..., 11)                   = 2
close(4)                                = 0
open("/sys/bus/usb/devices/usb1/speed", O_RDONLY) = 4
read(4, "12\n"..., 255)                 = 3
close(4)                                = 0
readlink("/sys/bus/usb/devices/usb1/../driver", 
"../../../bus/platform/drivers/at91_ohci"..., 4096) = 39
open("/sys/bus/usb/devices/1-0:1.0/bAlternateSetting", O_RDONLY) = 4
read(4, " 0\n"..., 11)                  = 3
close(4)                                = 0
open("/sys/bus/usb/devices/1-0:1.0/bInterfaceClass", O_RDONLY) = 4
read(4, "09\n"..., 11)                  = 3
close(4)                                = 0
open("/sys/bus/usb/devices/1-0:1.0/bInterfaceNumber", O_RDONLY) = 4
read(4, "00\n"..., 11)                  = 3
close(4)                                = 0
open("/sys/bus/usb/devices/1-0:1.0/bInterfaceProtocol", O_RDONLY) = 4
read(4, "00\n"..., 11)                  = 3
close(4)                                = 0
open("/sys/bus/usb/devices/1-0:1.0/bInterfaceSubClass", O_RDONLY) = 4
read(4, "00\n"..., 11)                  = 3
close(4)                                = 0
open("/sys/bus/usb/devices/1-0:1.0/bNumEndpoints", O_RDONLY) = 4
read(4, "01\n"..., 11)                  = 3
close(4)                                = 0
readlink("/sys/bus/usb/devices/1-0:1.0/driver", 
"../../../../../bus/usb/drivers/hub"..., 4096) = 34
open("/sys/bus/usb/devices/1-1/bConfigurationValue", O_RDONLY) = 4
read(4, "1\n"..., 11)                   = 2
close(4)                                = 0
open("/sys/bus/usb/devices/1-1/bDeviceClass", O_RDONLY) = 4
read(4, "00\n"..., 11)                  = 3
close(4)                                = 0
open("/sys/bus/usb/devices/1-1/bDeviceProtocol", O_RDONLY) = 4
read(4, "00\n"..., 11)                  = 3
close(4)                                = 0
open("/sys/bus/usb/devices/1-1/bDeviceSubClass", O_RDONLY) = 4
read(4, "00\n"..., 11)                  = 3
close(4)                                = 0
open("/sys/bus/usb/devices/1-1/bMaxPacketSize0", O_RDONLY) = 4
read(4, "8\n"..., 11)                   = 2
close(4)                                = 0
open("/sys/bus/usb/devices/1-1/bMaxPower", O_RDONLY) = 4
read(4, "100mA\n"..., 255)              = 6
close(4)                                = 0
open("/sys/bus/usb/devices/1-1/bNumConfigurations", O_RDONLY) = 4
read(4, "1\n"..., 11)                   = 2
close(4)                                = 0
open("/sys/bus/usb/devices/1-1/bNumInterfaces", O_RDONLY) = 4
read(4, " 1\n"..., 11)                  = 3
close(4)                                = 0
open("/sys/bus/usb/devices/1-1/bcdDevice", O_RDONLY) = 4
read(4, "0201\n"..., 11)                = 5
close(4)                                = 0
open("/sys/bus/usb/devices/1-1/bmAttributes", O_RDONLY) = 4
read(4, "80\n"..., 11)                  = 3
close(4)                                = 0
open("/sys/bus/usb/devices/1-1/configuration", O_RDONLY) = 4
read(4, ""..., 11)                      = 0
close(4)                                = 0
open("/sys/bus/usb/devices/1-1/devnum", O_RDONLY) = 4
read(4, "3\n"..., 11)                   = 2
close(4)                                = 0
open("/sys/bus/usb/devices/1-1/idProduct", O_RDONLY) = 4
read(4, "0028\n"..., 11)                = 5
close(4)                                = 0
open("/sys/bus/usb/devices/1-1/idVendor", O_RDONLY) = 4
read(4, "0590\n"..., 11)                = 5
close(4)                                = 0
open("/sys/bus/usb/devices/1-1/maxchild", O_RDONLY) = 4
read(4, "0\n"..., 11)                   = 2
close(4)                                = 0
open("/sys/bus/usb/devices/1-1/manufacturer", O_RDONLY) = 4
read(4, "OMRON Corporation\n"..., 255)  = 18
close(4)                                = 0
open("/sys/bus/usb/devices/1-1/product", O_RDONLY) = 4
read(4, "HHX-CABLE-USB1\n"..., 255)     = 15
close(4)                                = 0
open("/sys/bus/usb/devices/1-1/serial", O_RDONLY) = -1 ENOENT (No such 
file or directory)
open("/sys/bus/usb/devices/1-1/version", O_RDONLY) = 4
read(4, " 1.10\n"..., 255)              = 6
close(4)                                = 0
open("/sys/bus/usb/devices/1-1/speed", O_RDONLY) = 4
read(4, "1.5\n"..., 255)                = 4
close(4)                                = 0
readlink("/sys/bus/usb/devices/1-1/driver", 
"../../../../../bus/usb/drivers/usb"..., 4096) = 34
open("/sys/bus/usb/devices/1-1:1.0/bAlternateSetting", O_RDONLY) = 4
read(4, " 0\n"..., 11)                  = 3
close(4)                                = 0
open("/sys/bus/usb/devices/1-1:1.0/bInterfaceClass", O_RDONLY) = 4
read(4, "03\n"..., 11)                  = 3
close(4)                                = 0
open("/sys/bus/usb/devices/1-1:1.0/bInterfaceNumber", O_RDONLY) = 4
read(4, "00\n"..., 11)                  = 3
close(4)                                = 0
open("/sys/bus/usb/devices/1-1:1.0/bInterfaceProtocol", O_RDONLY) = 4
read(4, "00\n"..., 11)                  = 3
close(4)                                = 0
open("/sys/bus/usb/devices/1-1:1.0/bInterfaceSubClass", O_RDONLY) = 4
read(4, "00\n"..., 11)                  = 3
close(4)                                = 0
open("/sys/bus/usb/devices/1-1:1.0/bNumEndpoints", O_RDONLY) = 4
read(4, "02\n"..., 11)                  = 3
close(4)                                = 0
readlink("/sys/bus/usb/devices/1-1:1.0/driver", 0xbede89b0, 4096) = -1 
ENOENT (No such file or directory)
write(2, "1-1:1.0"..., 71-1:1.0)               = 7
write(2, ": "..., 2: )                    = 2
write(2, "No such file or directory"..., 25No such file or directory) = 25
write(2, "\n"..., 1
)                    = 1
getdents(3, /* 0 entries */, 3933)      = 0
close(3)                                = 0
write(1, "/:  Bus 01.Port 1: Dev 1, Class=r"..., 121) = 121
exit(0)                                 = ?
# 


Julien Boibessot <julien.boibessot@free.fr> wrote on 2010.01.05 13:37:04:
> 
> Re: [Buildroot] mdev & usb problem
> 
> peter.stosz at mentat.hu a ?crit :
> > /opt # find / -name usb.ids*
> > /usr/share/usb.ids.gz
> and what gives "strace lsusb" on your board ??
> > /opt #
> > /opt # strace ./us
> > ......
> > ioctl(0, SNDCTL_TMR_TIMEBASE or TCGETS, {B115200 opost isig icanon
> > echo ...}) = 0
> > ioctl(1, SNDCTL_TMR_TIMEBASE or TCGETS, {B115200 opost isig icanon
> > echo ...}) = 0
> > open("/dev/bus/usb", O_RDONLY|O_NONBLOCK|O_DIRECTORY) = -1 ENOENT (No
> > such file or directory)
> seems to be the problem (compare it with "strace us" on your PC)
> Do you have a directory named /dev/bus/usb/ ??
> 
> Julien
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100105/2fb5479b/attachment-0001.htm>
