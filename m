From: Ralph Siemsen <ralphs@netwinder.org>
Date: Wed, 17 Jun 2020 13:47:04 -0400
Subject: [Buildroot] Failed MMC & USB Mount
In-Reply-To: <ccd1b0539d4d4936baf2ae9be8d89a72@enduropls.ca>
References: <ccd1b0539d4d4936baf2ae9be8d89a72@enduropls.ca>
Message-ID: <20200617174704.GA23053@rfs.netwinder.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Joel,

On Wed, Jun 17, 2020 at 04:21:28PM +0000, Joel Brunetti wrote:
>?
>The system is running off an initrd image so there is no root file system and the system does otherwise boot as expected.
>?
>It appears from the logs the USB device or eMMC device drivers are not fully initialized when the kernel hands off to init.
>?
>I have tried adding 'root=/dev/sda1 rootwait' and 'rootdelay=10' to my kernel arguments in u-boot and while they are being passed (cat /proc/cmdline) they are not being respected. probably because I'm not waiting on root.
>?
>My question is; Is there another way to convince the kernel or busybox init to wait for the devices in /etc/fstab before continuing? Is there a better place to ask?

Since you are using an initrd (probably initramfs in fact) as your root 
filesystem, the "rootwait" will not have intended effect of delaying the 
mount until the SD/eMMC is ready. This commandline argument is normally 
used when the root device is the SD card, such as root=/dev/mmcblk0p1.

Also keep in mind that the kernel does not know about /etc/fstab at all.

Your observation that mount is successful after logging in and manually 
mounting it is consistent with the fact that SD takes some time to 
initialize. Means the hardware works, which is always good to know ;-)

A few possible options for you to consider:
- you can modify the init scripts, to put a time delay before the 
   automatic "mount -a". Of course this delays everything else too,
   and tuning the amount of delay is tedious and unreliable
- do not use /etc/fstab for the SD card. Instead write your own init 
   script to delay until the SD appears. Basically just a loop:
   while ! test -e /dev/mmcblk0p1 ; do sleep 1 ; done
   Of course this could block forever if no SD card is present, so you 
   probably want to limit maximum retries
- do not use /etc/fstab to mount the SD card, instead use one of the
   hotplug mechanisms, such as mdev for small systems (see 
   https://git.busybox.net/busybox/tree/docs/mdev.txt).

I'd recommend the third option personally. It also handles removable 
media like USB sticks nicely. Of course, since it is now dynamic, any 
code that depends on accessing SD card will need to be able to deal with 
the card missing / appearing later / possibly being removed / etc.

Regards,
-Ralph
