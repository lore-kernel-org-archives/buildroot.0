From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Jan 2013 09:31:12 +0100
Subject: [Buildroot] can not open ttyUSB0
In-Reply-To: <5108BD5B.3050001@linkwisetech.com>
References: <mailman.83813.1359524634.32592.buildroot@busybox.net>
 <5108BD5B.3050001@linkwisetech.com>
Message-ID: <20130130093112.73034ecd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Adeel Nafis,

On Wed, 30 Jan 2013 11:27:39 +0500, Adeel Nafis wrote:
> After attaching a 3G Modem USB  I am able to successfully use 
> 'usb_modeswitch" and get the device to switch with messages indicating 
> that the device is connected to /dev/ttyUSB0,1,2. However, after this I 
> can not open the /dev/ttyUSBx any more. If i use gnokii for arm it 
> prints out some messages indicating that it failed to open the port.
> 
> Gnokii output
> GNOKII Version 0.6.26
> Gnokii serial_open: open: No such device        <----- the port here is 
> set to /dev/ttyUSB0
> Couldn't open ATBUS device: No such device
> Telephone interface init failed: Command failed.
> Quitting.
> Cannot unlock device.
> Command failed.
> 
> I have tested the thing out with Ubuntu for arm on the same platform and 
> can verify that it works.

Before trying to access the device through /dev, make sure that your
kernel has actually detected this device, and that a driver has been
bound to it:

 *) Check your dmesg to see if there is something related to your 3G
 modem and the creation of ttyUSB0

 *) Check /sys/class/tty/ and check if there is a ttyUSB0 symlink.
 Until there is no ttyUSB0 symlink, it means that the kernel hasn't
 detected the device, or that a driver is missing for it.

 *) Once you have /sys/class/tty/, do a cat /dev/class/tty/ttyUSB0/dev
 and check that the major/minor that you see here match the ones you
 have used in the static device table (but it seems like 188:0 is
 correct for ttyUSB0, so your problem is most likely due to the fact
 that the kernel has not detected the device at all).

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
