From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jun 2013 09:39:05 +0200
Subject: [Buildroot] buildroot and kernel modules
In-Reply-To: <20130619155518.8G4TE.59637.root@cdptpa-web08-z02>
References: <20130619173521.558f6d53@skate>
 <20130619155518.8G4TE.59637.root@cdptpa-web08-z02>
Message-ID: <20130620093905.4b98be51@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please do not reply to me directly, but keep the Buildroot mailing list
Cc'ed. It would also be nice if you could comply with the basic e-mail
rules: no top-posting, wrapping at ~80 characters, etc.

Anyway, my answers below.

On Wed, 19 Jun 2013 11:55:18 -0400, jerryalex at tx.rr.com wrote:

>         I checked our tftpboot file system and there is no /etc/modules or a comparable script
>         under /etc/init.d to install the modules on bootup.

Because there is no such mechanism in Buildroot by default. You have to
create this /etc/modules file and a corresponding script
in /etc/init.d/.

>         With regard to hotplugging via udev, every time a device is added or removed, the kernel sends a 
>         uevent to notify udev of the change.  This requires the module to be installed for udev to recognize
>         it and create the corresponding /dev entry.
>         So I am missing something on how udev receives notification and runs modprobe.  
>         Modules are being loaded on our bootup so the mechanism exists but I have not been able to determine
>         how it is loading the modules.
>         How does the kernel recognize the device and notify udev of the device availability without loading
>         the module first.

Because the device driver for a given device is not needed to detect
that the device is here. Take USB for example: to detect the USB
devices on a USB bus, you need the driver for the USB *controller* to
be loaded, but not at all the drivers for the USB *devices*. So, as
long as the USB *controller* driver is loaded, it will enumerate the
USB devices that are available on the system's USB busses, and will
send udev events about those devices. udev will then load the USB
*device* drivers using modprobe, and the kernel will be able to
actually use these devices.

Didn't you notice that 'lsusb' shows *all* USB devices, regardless of
whether there is a corresponding kernel driver for them?

So again, on USB or PCI, being able to enumerate/recognize a device is
completely independent from the fact of having a driver for this
particular device.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
